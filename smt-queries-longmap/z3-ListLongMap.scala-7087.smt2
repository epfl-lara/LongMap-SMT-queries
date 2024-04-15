; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89606 () Bool)

(assert start!89606)

(declare-fun b!1027591 () Bool)

(declare-fun b_free!20575 () Bool)

(declare-fun b_next!20575 () Bool)

(assert (=> b!1027591 (= b_free!20575 (not b_next!20575))))

(declare-fun tp!72773 () Bool)

(declare-fun b_and!32807 () Bool)

(assert (=> b!1027591 (= tp!72773 b_and!32807)))

(declare-fun b!1027587 () Bool)

(declare-fun e!579976 () Bool)

(declare-fun e!579975 () Bool)

(assert (=> b!1027587 (= e!579976 e!579975)))

(declare-fun res!687777 () Bool)

(assert (=> b!1027587 (=> (not res!687777) (not e!579975))))

(declare-datatypes ((SeekEntryResult!9666 0))(
  ( (MissingZero!9666 (index!41035 (_ BitVec 32))) (Found!9666 (index!41036 (_ BitVec 32))) (Intermediate!9666 (undefined!10478 Bool) (index!41037 (_ BitVec 32)) (x!91447 (_ BitVec 32))) (Undefined!9666) (MissingVacant!9666 (index!41038 (_ BitVec 32))) )
))
(declare-fun lt!452294 () SeekEntryResult!9666)

(get-info :version)

(assert (=> b!1027587 (= res!687777 ((_ is Found!9666) lt!452294))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37267 0))(
  ( (V!37268 (val!12198 Int)) )
))
(declare-datatypes ((ValueCell!11444 0))(
  ( (ValueCellFull!11444 (v!14766 V!37267)) (EmptyCell!11444) )
))
(declare-datatypes ((array!64581 0))(
  ( (array!64582 (arr!31098 (Array (_ BitVec 32) (_ BitVec 64))) (size!31613 (_ BitVec 32))) )
))
(declare-datatypes ((array!64583 0))(
  ( (array!64584 (arr!31099 (Array (_ BitVec 32) ValueCell!11444)) (size!31614 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5482 0))(
  ( (LongMapFixedSize!5483 (defaultEntry!6095 Int) (mask!29814 (_ BitVec 32)) (extraKeys!5827 (_ BitVec 32)) (zeroValue!5931 V!37267) (minValue!5931 V!37267) (_size!2796 (_ BitVec 32)) (_keys!11240 array!64581) (_values!6118 array!64583) (_vacant!2796 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5482)

(declare-fun seekEntry!0 ((_ BitVec 64) array!64581 (_ BitVec 32)) SeekEntryResult!9666)

(assert (=> b!1027587 (= lt!452294 (seekEntry!0 key!909 (_keys!11240 thiss!1427) (mask!29814 thiss!1427)))))

(declare-fun b!1027588 () Bool)

(declare-fun e!579978 () Bool)

(declare-fun tp_is_empty!24295 () Bool)

(assert (=> b!1027588 (= e!579978 tp_is_empty!24295)))

(declare-fun b!1027589 () Bool)

(declare-fun e!579981 () Bool)

(assert (=> b!1027589 (= e!579981 tp_is_empty!24295)))

(declare-fun mapIsEmpty!37874 () Bool)

(declare-fun mapRes!37874 () Bool)

(assert (=> mapIsEmpty!37874 mapRes!37874))

(declare-fun b!1027590 () Bool)

(declare-fun e!579977 () Bool)

(assert (=> b!1027590 (= e!579977 (and e!579981 mapRes!37874))))

(declare-fun condMapEmpty!37874 () Bool)

(declare-fun mapDefault!37874 () ValueCell!11444)

(assert (=> b!1027590 (= condMapEmpty!37874 (= (arr!31099 (_values!6118 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11444)) mapDefault!37874)))))

(declare-fun res!687776 () Bool)

(assert (=> start!89606 (=> (not res!687776) (not e!579976))))

(declare-fun valid!2068 (LongMapFixedSize!5482) Bool)

(assert (=> start!89606 (= res!687776 (valid!2068 thiss!1427))))

(assert (=> start!89606 e!579976))

(declare-fun e!579974 () Bool)

(assert (=> start!89606 e!579974))

(assert (=> start!89606 true))

(declare-fun array_inv!24079 (array!64581) Bool)

(declare-fun array_inv!24080 (array!64583) Bool)

(assert (=> b!1027591 (= e!579974 (and tp!72773 tp_is_empty!24295 (array_inv!24079 (_keys!11240 thiss!1427)) (array_inv!24080 (_values!6118 thiss!1427)) e!579977))))

(declare-fun mapNonEmpty!37874 () Bool)

(declare-fun tp!72774 () Bool)

(assert (=> mapNonEmpty!37874 (= mapRes!37874 (and tp!72774 e!579978))))

(declare-fun mapValue!37874 () ValueCell!11444)

(declare-fun mapRest!37874 () (Array (_ BitVec 32) ValueCell!11444))

(declare-fun mapKey!37874 () (_ BitVec 32))

(assert (=> mapNonEmpty!37874 (= (arr!31099 (_values!6118 thiss!1427)) (store mapRest!37874 mapKey!37874 mapValue!37874))))

(declare-fun b!1027592 () Bool)

(declare-fun res!687775 () Bool)

(assert (=> b!1027592 (=> (not res!687775) (not e!579976))))

(assert (=> b!1027592 (= res!687775 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1027593 () Bool)

(declare-fun e!579979 () Bool)

(assert (=> b!1027593 (= e!579975 (not e!579979))))

(declare-fun res!687778 () Bool)

(assert (=> b!1027593 (=> res!687778 e!579979)))

(declare-datatypes ((Unit!33443 0))(
  ( (Unit!33444) )
))
(declare-datatypes ((tuple2!15618 0))(
  ( (tuple2!15619 (_1!7820 Unit!33443) (_2!7820 LongMapFixedSize!5482)) )
))
(declare-fun lt!452296 () tuple2!15618)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1027593 (= res!687778 (not (validMask!0 (mask!29814 (_2!7820 lt!452296)))))))

(declare-fun lt!452298 () array!64583)

(declare-fun lt!452297 () array!64581)

(declare-fun Unit!33445 () Unit!33443)

(declare-fun Unit!33446 () Unit!33443)

(assert (=> b!1027593 (= lt!452296 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2796 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15619 Unit!33445 (LongMapFixedSize!5483 (defaultEntry!6095 thiss!1427) (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) (bvsub (_size!2796 thiss!1427) #b00000000000000000000000000000001) lt!452297 lt!452298 (bvadd #b00000000000000000000000000000001 (_vacant!2796 thiss!1427)))) (tuple2!15619 Unit!33446 (LongMapFixedSize!5483 (defaultEntry!6095 thiss!1427) (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) (bvsub (_size!2796 thiss!1427) #b00000000000000000000000000000001) lt!452297 lt!452298 (_vacant!2796 thiss!1427)))))))

(declare-datatypes ((tuple2!15620 0))(
  ( (tuple2!15621 (_1!7821 (_ BitVec 64)) (_2!7821 V!37267)) )
))
(declare-datatypes ((List!21844 0))(
  ( (Nil!21841) (Cons!21840 (h!23038 tuple2!15620) (t!30905 List!21844)) )
))
(declare-datatypes ((ListLongMap!13745 0))(
  ( (ListLongMap!13746 (toList!6888 List!21844)) )
))
(declare-fun -!480 (ListLongMap!13745 (_ BitVec 64)) ListLongMap!13745)

(declare-fun getCurrentListMap!3855 (array!64581 array!64583 (_ BitVec 32) (_ BitVec 32) V!37267 V!37267 (_ BitVec 32) Int) ListLongMap!13745)

(assert (=> b!1027593 (= (-!480 (getCurrentListMap!3855 (_keys!11240 thiss!1427) (_values!6118 thiss!1427) (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)) key!909) (getCurrentListMap!3855 lt!452297 lt!452298 (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)))))

(declare-fun dynLambda!1942 (Int (_ BitVec 64)) V!37267)

(assert (=> b!1027593 (= lt!452298 (array!64584 (store (arr!31099 (_values!6118 thiss!1427)) (index!41036 lt!452294) (ValueCellFull!11444 (dynLambda!1942 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31614 (_values!6118 thiss!1427))))))

(declare-fun lt!452300 () Unit!33443)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!5 (array!64581 array!64583 (_ BitVec 32) (_ BitVec 32) V!37267 V!37267 (_ BitVec 32) (_ BitVec 64) Int) Unit!33443)

(assert (=> b!1027593 (= lt!452300 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!5 (_keys!11240 thiss!1427) (_values!6118 thiss!1427) (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) (index!41036 lt!452294) key!909 (defaultEntry!6095 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64581 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1027593 (not (arrayContainsKey!0 lt!452297 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!452295 () Unit!33443)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64581 (_ BitVec 32) (_ BitVec 64)) Unit!33443)

(assert (=> b!1027593 (= lt!452295 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11240 thiss!1427) (index!41036 lt!452294) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64581 (_ BitVec 32)) Bool)

(assert (=> b!1027593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!452297 (mask!29814 thiss!1427))))

(declare-fun lt!452301 () Unit!33443)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64581 (_ BitVec 32) (_ BitVec 32)) Unit!33443)

(assert (=> b!1027593 (= lt!452301 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11240 thiss!1427) (index!41036 lt!452294) (mask!29814 thiss!1427)))))

(declare-datatypes ((List!21845 0))(
  ( (Nil!21842) (Cons!21841 (h!23039 (_ BitVec 64)) (t!30906 List!21845)) )
))
(declare-fun arrayNoDuplicates!0 (array!64581 (_ BitVec 32) List!21845) Bool)

(assert (=> b!1027593 (arrayNoDuplicates!0 lt!452297 #b00000000000000000000000000000000 Nil!21842)))

(declare-fun lt!452299 () Unit!33443)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64581 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21845) Unit!33443)

(assert (=> b!1027593 (= lt!452299 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11240 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41036 lt!452294) #b00000000000000000000000000000000 Nil!21842))))

(declare-fun arrayCountValidKeys!0 (array!64581 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1027593 (= (arrayCountValidKeys!0 lt!452297 #b00000000000000000000000000000000 (size!31613 (_keys!11240 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11240 thiss!1427) #b00000000000000000000000000000000 (size!31613 (_keys!11240 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1027593 (= lt!452297 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427))))))

(declare-fun lt!452293 () Unit!33443)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64581 (_ BitVec 32) (_ BitVec 64)) Unit!33443)

(assert (=> b!1027593 (= lt!452293 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11240 thiss!1427) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1027594 () Bool)

(assert (=> b!1027594 (= e!579979 (= (size!31614 (_values!6118 (_2!7820 lt!452296))) (bvadd #b00000000000000000000000000000001 (mask!29814 (_2!7820 lt!452296)))))))

(assert (= (and start!89606 res!687776) b!1027592))

(assert (= (and b!1027592 res!687775) b!1027587))

(assert (= (and b!1027587 res!687777) b!1027593))

(assert (= (and b!1027593 (not res!687778)) b!1027594))

(assert (= (and b!1027590 condMapEmpty!37874) mapIsEmpty!37874))

(assert (= (and b!1027590 (not condMapEmpty!37874)) mapNonEmpty!37874))

(assert (= (and mapNonEmpty!37874 ((_ is ValueCellFull!11444) mapValue!37874)) b!1027588))

(assert (= (and b!1027590 ((_ is ValueCellFull!11444) mapDefault!37874)) b!1027589))

(assert (= b!1027591 b!1027590))

(assert (= start!89606 b!1027591))

(declare-fun b_lambda!15717 () Bool)

(assert (=> (not b_lambda!15717) (not b!1027593)))

(declare-fun t!30904 () Bool)

(declare-fun tb!6885 () Bool)

(assert (=> (and b!1027591 (= (defaultEntry!6095 thiss!1427) (defaultEntry!6095 thiss!1427)) t!30904) tb!6885))

(declare-fun result!14095 () Bool)

(assert (=> tb!6885 (= result!14095 tp_is_empty!24295)))

(assert (=> b!1027593 t!30904))

(declare-fun b_and!32809 () Bool)

(assert (= b_and!32807 (and (=> t!30904 result!14095) b_and!32809)))

(declare-fun m!945647 () Bool)

(assert (=> mapNonEmpty!37874 m!945647))

(declare-fun m!945649 () Bool)

(assert (=> b!1027591 m!945649))

(declare-fun m!945651 () Bool)

(assert (=> b!1027591 m!945651))

(declare-fun m!945653 () Bool)

(assert (=> start!89606 m!945653))

(declare-fun m!945655 () Bool)

(assert (=> b!1027593 m!945655))

(declare-fun m!945657 () Bool)

(assert (=> b!1027593 m!945657))

(declare-fun m!945659 () Bool)

(assert (=> b!1027593 m!945659))

(declare-fun m!945661 () Bool)

(assert (=> b!1027593 m!945661))

(declare-fun m!945663 () Bool)

(assert (=> b!1027593 m!945663))

(declare-fun m!945665 () Bool)

(assert (=> b!1027593 m!945665))

(declare-fun m!945667 () Bool)

(assert (=> b!1027593 m!945667))

(declare-fun m!945669 () Bool)

(assert (=> b!1027593 m!945669))

(declare-fun m!945671 () Bool)

(assert (=> b!1027593 m!945671))

(declare-fun m!945673 () Bool)

(assert (=> b!1027593 m!945673))

(assert (=> b!1027593 m!945671))

(declare-fun m!945675 () Bool)

(assert (=> b!1027593 m!945675))

(declare-fun m!945677 () Bool)

(assert (=> b!1027593 m!945677))

(declare-fun m!945679 () Bool)

(assert (=> b!1027593 m!945679))

(declare-fun m!945681 () Bool)

(assert (=> b!1027593 m!945681))

(declare-fun m!945683 () Bool)

(assert (=> b!1027593 m!945683))

(declare-fun m!945685 () Bool)

(assert (=> b!1027593 m!945685))

(declare-fun m!945687 () Bool)

(assert (=> b!1027593 m!945687))

(declare-fun m!945689 () Bool)

(assert (=> b!1027587 m!945689))

(check-sat (not b!1027591) (not b!1027587) (not b_lambda!15717) tp_is_empty!24295 (not start!89606) (not b_next!20575) (not b!1027593) (not mapNonEmpty!37874) b_and!32809)
(check-sat b_and!32809 (not b_next!20575))
(get-model)

(declare-fun b_lambda!15723 () Bool)

(assert (= b_lambda!15717 (or (and b!1027591 b_free!20575) b_lambda!15723)))

(check-sat (not b!1027591) (not b_lambda!15723) (not b!1027587) tp_is_empty!24295 (not start!89606) (not b_next!20575) (not b!1027593) (not mapNonEmpty!37874) b_and!32809)
(check-sat b_and!32809 (not b_next!20575))
(get-model)

(declare-fun d!122595 () Bool)

(assert (=> d!122595 (= (array_inv!24079 (_keys!11240 thiss!1427)) (bvsge (size!31613 (_keys!11240 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1027591 d!122595))

(declare-fun d!122597 () Bool)

(assert (=> d!122597 (= (array_inv!24080 (_values!6118 thiss!1427)) (bvsge (size!31614 (_values!6118 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1027591 d!122597))

(declare-fun b!1027661 () Bool)

(declare-fun e!580037 () SeekEntryResult!9666)

(declare-fun lt!452365 () SeekEntryResult!9666)

(assert (=> b!1027661 (= e!580037 (ite ((_ is MissingVacant!9666) lt!452365) (MissingZero!9666 (index!41038 lt!452365)) lt!452365))))

(declare-fun lt!452364 () SeekEntryResult!9666)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!64581 (_ BitVec 32)) SeekEntryResult!9666)

(assert (=> b!1027661 (= lt!452365 (seekKeyOrZeroReturnVacant!0 (x!91447 lt!452364) (index!41037 lt!452364) (index!41037 lt!452364) key!909 (_keys!11240 thiss!1427) (mask!29814 thiss!1427)))))

(declare-fun b!1027662 () Bool)

(assert (=> b!1027662 (= e!580037 (MissingZero!9666 (index!41037 lt!452364)))))

(declare-fun b!1027663 () Bool)

(declare-fun e!580036 () SeekEntryResult!9666)

(assert (=> b!1027663 (= e!580036 (Found!9666 (index!41037 lt!452364)))))

(declare-fun d!122599 () Bool)

(declare-fun lt!452367 () SeekEntryResult!9666)

(assert (=> d!122599 (and (or ((_ is MissingVacant!9666) lt!452367) (not ((_ is Found!9666) lt!452367)) (and (bvsge (index!41036 lt!452367) #b00000000000000000000000000000000) (bvslt (index!41036 lt!452367) (size!31613 (_keys!11240 thiss!1427))))) (not ((_ is MissingVacant!9666) lt!452367)) (or (not ((_ is Found!9666) lt!452367)) (= (select (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452367)) key!909)))))

(declare-fun e!580038 () SeekEntryResult!9666)

(assert (=> d!122599 (= lt!452367 e!580038)))

(declare-fun c!103585 () Bool)

(assert (=> d!122599 (= c!103585 (and ((_ is Intermediate!9666) lt!452364) (undefined!10478 lt!452364)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!64581 (_ BitVec 32)) SeekEntryResult!9666)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!122599 (= lt!452364 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!29814 thiss!1427)) key!909 (_keys!11240 thiss!1427) (mask!29814 thiss!1427)))))

(assert (=> d!122599 (validMask!0 (mask!29814 thiss!1427))))

(assert (=> d!122599 (= (seekEntry!0 key!909 (_keys!11240 thiss!1427) (mask!29814 thiss!1427)) lt!452367)))

(declare-fun b!1027664 () Bool)

(declare-fun c!103587 () Bool)

(declare-fun lt!452366 () (_ BitVec 64))

(assert (=> b!1027664 (= c!103587 (= lt!452366 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1027664 (= e!580036 e!580037)))

(declare-fun b!1027665 () Bool)

(assert (=> b!1027665 (= e!580038 e!580036)))

(assert (=> b!1027665 (= lt!452366 (select (arr!31098 (_keys!11240 thiss!1427)) (index!41037 lt!452364)))))

(declare-fun c!103586 () Bool)

(assert (=> b!1027665 (= c!103586 (= lt!452366 key!909))))

(declare-fun b!1027666 () Bool)

(assert (=> b!1027666 (= e!580038 Undefined!9666)))

(assert (= (and d!122599 c!103585) b!1027666))

(assert (= (and d!122599 (not c!103585)) b!1027665))

(assert (= (and b!1027665 c!103586) b!1027663))

(assert (= (and b!1027665 (not c!103586)) b!1027664))

(assert (= (and b!1027664 c!103587) b!1027662))

(assert (= (and b!1027664 (not c!103587)) b!1027661))

(declare-fun m!945779 () Bool)

(assert (=> b!1027661 m!945779))

(declare-fun m!945781 () Bool)

(assert (=> d!122599 m!945781))

(declare-fun m!945783 () Bool)

(assert (=> d!122599 m!945783))

(assert (=> d!122599 m!945783))

(declare-fun m!945785 () Bool)

(assert (=> d!122599 m!945785))

(declare-fun m!945787 () Bool)

(assert (=> d!122599 m!945787))

(declare-fun m!945789 () Bool)

(assert (=> b!1027665 m!945789))

(assert (=> b!1027587 d!122599))

(declare-fun d!122601 () Bool)

(declare-fun res!687809 () Bool)

(declare-fun e!580041 () Bool)

(assert (=> d!122601 (=> (not res!687809) (not e!580041))))

(declare-fun simpleValid!391 (LongMapFixedSize!5482) Bool)

(assert (=> d!122601 (= res!687809 (simpleValid!391 thiss!1427))))

(assert (=> d!122601 (= (valid!2068 thiss!1427) e!580041)))

(declare-fun b!1027673 () Bool)

(declare-fun res!687810 () Bool)

(assert (=> b!1027673 (=> (not res!687810) (not e!580041))))

(assert (=> b!1027673 (= res!687810 (= (arrayCountValidKeys!0 (_keys!11240 thiss!1427) #b00000000000000000000000000000000 (size!31613 (_keys!11240 thiss!1427))) (_size!2796 thiss!1427)))))

(declare-fun b!1027674 () Bool)

(declare-fun res!687811 () Bool)

(assert (=> b!1027674 (=> (not res!687811) (not e!580041))))

(assert (=> b!1027674 (= res!687811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11240 thiss!1427) (mask!29814 thiss!1427)))))

(declare-fun b!1027675 () Bool)

(assert (=> b!1027675 (= e!580041 (arrayNoDuplicates!0 (_keys!11240 thiss!1427) #b00000000000000000000000000000000 Nil!21842))))

(assert (= (and d!122601 res!687809) b!1027673))

(assert (= (and b!1027673 res!687810) b!1027674))

(assert (= (and b!1027674 res!687811) b!1027675))

(declare-fun m!945791 () Bool)

(assert (=> d!122601 m!945791))

(assert (=> b!1027673 m!945667))

(declare-fun m!945793 () Bool)

(assert (=> b!1027674 m!945793))

(declare-fun m!945795 () Bool)

(assert (=> b!1027675 m!945795))

(assert (=> start!89606 d!122601))

(declare-fun d!122603 () Bool)

(declare-fun e!580044 () Bool)

(assert (=> d!122603 e!580044))

(declare-fun res!687814 () Bool)

(assert (=> d!122603 (=> (not res!687814) (not e!580044))))

(assert (=> d!122603 (= res!687814 (bvslt (index!41036 lt!452294) (size!31613 (_keys!11240 thiss!1427))))))

(declare-fun lt!452370 () Unit!33443)

(declare-fun choose!121 (array!64581 (_ BitVec 32) (_ BitVec 64)) Unit!33443)

(assert (=> d!122603 (= lt!452370 (choose!121 (_keys!11240 thiss!1427) (index!41036 lt!452294) key!909))))

(assert (=> d!122603 (bvsge (index!41036 lt!452294) #b00000000000000000000000000000000)))

(assert (=> d!122603 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11240 thiss!1427) (index!41036 lt!452294) key!909) lt!452370)))

(declare-fun b!1027678 () Bool)

(assert (=> b!1027678 (= e!580044 (not (arrayContainsKey!0 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!122603 res!687814) b!1027678))

(declare-fun m!945797 () Bool)

(assert (=> d!122603 m!945797))

(assert (=> b!1027678 m!945665))

(declare-fun m!945799 () Bool)

(assert (=> b!1027678 m!945799))

(assert (=> b!1027593 d!122603))

(declare-fun d!122605 () Bool)

(declare-fun e!580049 () Bool)

(assert (=> d!122605 e!580049))

(declare-fun res!687823 () Bool)

(assert (=> d!122605 (=> (not res!687823) (not e!580049))))

(assert (=> d!122605 (= res!687823 (and (bvsge (index!41036 lt!452294) #b00000000000000000000000000000000) (bvslt (index!41036 lt!452294) (size!31613 (_keys!11240 thiss!1427)))))))

(declare-fun lt!452373 () Unit!33443)

(declare-fun choose!82 (array!64581 (_ BitVec 32) (_ BitVec 64)) Unit!33443)

(assert (=> d!122605 (= lt!452373 (choose!82 (_keys!11240 thiss!1427) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!580050 () Bool)

(assert (=> d!122605 e!580050))

(declare-fun res!687825 () Bool)

(assert (=> d!122605 (=> (not res!687825) (not e!580050))))

(assert (=> d!122605 (= res!687825 (and (bvsge (index!41036 lt!452294) #b00000000000000000000000000000000) (bvslt (index!41036 lt!452294) (size!31613 (_keys!11240 thiss!1427)))))))

(assert (=> d!122605 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11240 thiss!1427) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) lt!452373)))

(declare-fun b!1027688 () Bool)

(declare-fun res!687824 () Bool)

(assert (=> b!1027688 (=> (not res!687824) (not e!580050))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1027688 (= res!687824 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1027689 () Bool)

(assert (=> b!1027689 (= e!580050 (bvslt (size!31613 (_keys!11240 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1027690 () Bool)

(assert (=> b!1027690 (= e!580049 (= (arrayCountValidKeys!0 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427))) #b00000000000000000000000000000000 (size!31613 (_keys!11240 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11240 thiss!1427) #b00000000000000000000000000000000 (size!31613 (_keys!11240 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1027687 () Bool)

(declare-fun res!687826 () Bool)

(assert (=> b!1027687 (=> (not res!687826) (not e!580050))))

(assert (=> b!1027687 (= res!687826 (validKeyInArray!0 (select (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294))))))

(assert (= (and d!122605 res!687825) b!1027687))

(assert (= (and b!1027687 res!687826) b!1027688))

(assert (= (and b!1027688 res!687824) b!1027689))

(assert (= (and d!122605 res!687823) b!1027690))

(declare-fun m!945801 () Bool)

(assert (=> d!122605 m!945801))

(declare-fun m!945803 () Bool)

(assert (=> b!1027688 m!945803))

(assert (=> b!1027690 m!945665))

(declare-fun m!945805 () Bool)

(assert (=> b!1027690 m!945805))

(assert (=> b!1027690 m!945667))

(declare-fun m!945807 () Bool)

(assert (=> b!1027687 m!945807))

(assert (=> b!1027687 m!945807))

(declare-fun m!945809 () Bool)

(assert (=> b!1027687 m!945809))

(assert (=> b!1027593 d!122605))

(declare-fun d!122607 () Bool)

(declare-fun lt!452376 () (_ BitVec 32))

(assert (=> d!122607 (and (bvsge lt!452376 #b00000000000000000000000000000000) (bvsle lt!452376 (bvsub (size!31613 lt!452297) #b00000000000000000000000000000000)))))

(declare-fun e!580056 () (_ BitVec 32))

(assert (=> d!122607 (= lt!452376 e!580056)))

(declare-fun c!103593 () Bool)

(assert (=> d!122607 (= c!103593 (bvsge #b00000000000000000000000000000000 (size!31613 (_keys!11240 thiss!1427))))))

(assert (=> d!122607 (and (bvsle #b00000000000000000000000000000000 (size!31613 (_keys!11240 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31613 (_keys!11240 thiss!1427)) (size!31613 lt!452297)))))

(assert (=> d!122607 (= (arrayCountValidKeys!0 lt!452297 #b00000000000000000000000000000000 (size!31613 (_keys!11240 thiss!1427))) lt!452376)))

(declare-fun bm!43257 () Bool)

(declare-fun call!43260 () (_ BitVec 32))

(assert (=> bm!43257 (= call!43260 (arrayCountValidKeys!0 lt!452297 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31613 (_keys!11240 thiss!1427))))))

(declare-fun b!1027699 () Bool)

(declare-fun e!580055 () (_ BitVec 32))

(assert (=> b!1027699 (= e!580056 e!580055)))

(declare-fun c!103592 () Bool)

(assert (=> b!1027699 (= c!103592 (validKeyInArray!0 (select (arr!31098 lt!452297) #b00000000000000000000000000000000)))))

(declare-fun b!1027700 () Bool)

(assert (=> b!1027700 (= e!580056 #b00000000000000000000000000000000)))

(declare-fun b!1027701 () Bool)

(assert (=> b!1027701 (= e!580055 call!43260)))

(declare-fun b!1027702 () Bool)

(assert (=> b!1027702 (= e!580055 (bvadd #b00000000000000000000000000000001 call!43260))))

(assert (= (and d!122607 c!103593) b!1027700))

(assert (= (and d!122607 (not c!103593)) b!1027699))

(assert (= (and b!1027699 c!103592) b!1027702))

(assert (= (and b!1027699 (not c!103592)) b!1027701))

(assert (= (or b!1027702 b!1027701) bm!43257))

(declare-fun m!945811 () Bool)

(assert (=> bm!43257 m!945811))

(declare-fun m!945813 () Bool)

(assert (=> b!1027699 m!945813))

(assert (=> b!1027699 m!945813))

(declare-fun m!945815 () Bool)

(assert (=> b!1027699 m!945815))

(assert (=> b!1027593 d!122607))

(declare-fun d!122609 () Bool)

(declare-fun lt!452379 () ListLongMap!13745)

(declare-fun contains!5943 (ListLongMap!13745 (_ BitVec 64)) Bool)

(assert (=> d!122609 (not (contains!5943 lt!452379 key!909))))

(declare-fun removeStrictlySorted!50 (List!21844 (_ BitVec 64)) List!21844)

(assert (=> d!122609 (= lt!452379 (ListLongMap!13746 (removeStrictlySorted!50 (toList!6888 (getCurrentListMap!3855 (_keys!11240 thiss!1427) (_values!6118 thiss!1427) (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427))) key!909)))))

(assert (=> d!122609 (= (-!480 (getCurrentListMap!3855 (_keys!11240 thiss!1427) (_values!6118 thiss!1427) (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)) key!909) lt!452379)))

(declare-fun bs!29965 () Bool)

(assert (= bs!29965 d!122609))

(declare-fun m!945817 () Bool)

(assert (=> bs!29965 m!945817))

(declare-fun m!945819 () Bool)

(assert (=> bs!29965 m!945819))

(assert (=> b!1027593 d!122609))

(declare-fun bm!43260 () Bool)

(declare-fun call!43263 () Bool)

(declare-fun c!103596 () Bool)

(assert (=> bm!43260 (= call!43263 (arrayNoDuplicates!0 lt!452297 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!103596 (Cons!21841 (select (arr!31098 lt!452297) #b00000000000000000000000000000000) Nil!21842) Nil!21842)))))

(declare-fun b!1027713 () Bool)

(declare-fun e!580067 () Bool)

(assert (=> b!1027713 (= e!580067 call!43263)))

(declare-fun d!122611 () Bool)

(declare-fun res!687835 () Bool)

(declare-fun e!580066 () Bool)

(assert (=> d!122611 (=> res!687835 e!580066)))

(assert (=> d!122611 (= res!687835 (bvsge #b00000000000000000000000000000000 (size!31613 lt!452297)))))

(assert (=> d!122611 (= (arrayNoDuplicates!0 lt!452297 #b00000000000000000000000000000000 Nil!21842) e!580066)))

(declare-fun b!1027714 () Bool)

(declare-fun e!580065 () Bool)

(declare-fun contains!5944 (List!21845 (_ BitVec 64)) Bool)

(assert (=> b!1027714 (= e!580065 (contains!5944 Nil!21842 (select (arr!31098 lt!452297) #b00000000000000000000000000000000)))))

(declare-fun b!1027715 () Bool)

(assert (=> b!1027715 (= e!580067 call!43263)))

(declare-fun b!1027716 () Bool)

(declare-fun e!580068 () Bool)

(assert (=> b!1027716 (= e!580066 e!580068)))

(declare-fun res!687833 () Bool)

(assert (=> b!1027716 (=> (not res!687833) (not e!580068))))

(assert (=> b!1027716 (= res!687833 (not e!580065))))

(declare-fun res!687834 () Bool)

(assert (=> b!1027716 (=> (not res!687834) (not e!580065))))

(assert (=> b!1027716 (= res!687834 (validKeyInArray!0 (select (arr!31098 lt!452297) #b00000000000000000000000000000000)))))

(declare-fun b!1027717 () Bool)

(assert (=> b!1027717 (= e!580068 e!580067)))

(assert (=> b!1027717 (= c!103596 (validKeyInArray!0 (select (arr!31098 lt!452297) #b00000000000000000000000000000000)))))

(assert (= (and d!122611 (not res!687835)) b!1027716))

(assert (= (and b!1027716 res!687834) b!1027714))

(assert (= (and b!1027716 res!687833) b!1027717))

(assert (= (and b!1027717 c!103596) b!1027713))

(assert (= (and b!1027717 (not c!103596)) b!1027715))

(assert (= (or b!1027713 b!1027715) bm!43260))

(assert (=> bm!43260 m!945813))

(declare-fun m!945821 () Bool)

(assert (=> bm!43260 m!945821))

(assert (=> b!1027714 m!945813))

(assert (=> b!1027714 m!945813))

(declare-fun m!945823 () Bool)

(assert (=> b!1027714 m!945823))

(assert (=> b!1027716 m!945813))

(assert (=> b!1027716 m!945813))

(assert (=> b!1027716 m!945815))

(assert (=> b!1027717 m!945813))

(assert (=> b!1027717 m!945813))

(assert (=> b!1027717 m!945815))

(assert (=> b!1027593 d!122611))

(declare-fun d!122613 () Bool)

(declare-fun e!580071 () Bool)

(assert (=> d!122613 e!580071))

(declare-fun res!687838 () Bool)

(assert (=> d!122613 (=> (not res!687838) (not e!580071))))

(assert (=> d!122613 (= res!687838 (and (bvsge (index!41036 lt!452294) #b00000000000000000000000000000000) (bvslt (index!41036 lt!452294) (size!31613 (_keys!11240 thiss!1427)))))))

(declare-fun lt!452382 () Unit!33443)

(declare-fun choose!1689 (array!64581 array!64583 (_ BitVec 32) (_ BitVec 32) V!37267 V!37267 (_ BitVec 32) (_ BitVec 64) Int) Unit!33443)

(assert (=> d!122613 (= lt!452382 (choose!1689 (_keys!11240 thiss!1427) (_values!6118 thiss!1427) (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) (index!41036 lt!452294) key!909 (defaultEntry!6095 thiss!1427)))))

(assert (=> d!122613 (validMask!0 (mask!29814 thiss!1427))))

(assert (=> d!122613 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!5 (_keys!11240 thiss!1427) (_values!6118 thiss!1427) (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) (index!41036 lt!452294) key!909 (defaultEntry!6095 thiss!1427)) lt!452382)))

(declare-fun b!1027720 () Bool)

(assert (=> b!1027720 (= e!580071 (= (-!480 (getCurrentListMap!3855 (_keys!11240 thiss!1427) (_values!6118 thiss!1427) (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)) key!909) (getCurrentListMap!3855 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427))) (array!64584 (store (arr!31099 (_values!6118 thiss!1427)) (index!41036 lt!452294) (ValueCellFull!11444 (dynLambda!1942 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31614 (_values!6118 thiss!1427))) (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427))))))

(assert (=> b!1027720 (bvslt (index!41036 lt!452294) (size!31614 (_values!6118 thiss!1427)))))

(assert (= (and d!122613 res!687838) b!1027720))

(declare-fun b_lambda!15725 () Bool)

(assert (=> (not b_lambda!15725) (not b!1027720)))

(assert (=> b!1027720 t!30904))

(declare-fun b_and!32819 () Bool)

(assert (= b_and!32809 (and (=> t!30904 result!14095) b_and!32819)))

(declare-fun m!945825 () Bool)

(assert (=> d!122613 m!945825))

(assert (=> d!122613 m!945787))

(assert (=> b!1027720 m!945665))

(assert (=> b!1027720 m!945671))

(assert (=> b!1027720 m!945673))

(assert (=> b!1027720 m!945657))

(assert (=> b!1027720 m!945671))

(declare-fun m!945827 () Bool)

(assert (=> b!1027720 m!945827))

(assert (=> b!1027720 m!945679))

(assert (=> b!1027593 d!122613))

(declare-fun d!122615 () Bool)

(declare-fun res!687843 () Bool)

(declare-fun e!580076 () Bool)

(assert (=> d!122615 (=> res!687843 e!580076)))

(assert (=> d!122615 (= res!687843 (= (select (arr!31098 lt!452297) #b00000000000000000000000000000000) key!909))))

(assert (=> d!122615 (= (arrayContainsKey!0 lt!452297 key!909 #b00000000000000000000000000000000) e!580076)))

(declare-fun b!1027725 () Bool)

(declare-fun e!580077 () Bool)

(assert (=> b!1027725 (= e!580076 e!580077)))

(declare-fun res!687844 () Bool)

(assert (=> b!1027725 (=> (not res!687844) (not e!580077))))

(assert (=> b!1027725 (= res!687844 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31613 lt!452297)))))

(declare-fun b!1027726 () Bool)

(assert (=> b!1027726 (= e!580077 (arrayContainsKey!0 lt!452297 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!122615 (not res!687843)) b!1027725))

(assert (= (and b!1027725 res!687844) b!1027726))

(assert (=> d!122615 m!945813))

(declare-fun m!945829 () Bool)

(assert (=> b!1027726 m!945829))

(assert (=> b!1027593 d!122615))

(declare-fun b!1027769 () Bool)

(declare-fun e!580114 () Bool)

(declare-fun e!580110 () Bool)

(assert (=> b!1027769 (= e!580114 e!580110)))

(declare-fun c!103610 () Bool)

(assert (=> b!1027769 (= c!103610 (not (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!43275 () Bool)

(declare-fun call!43284 () ListLongMap!13745)

(declare-fun call!43281 () ListLongMap!13745)

(assert (=> bm!43275 (= call!43284 call!43281)))

(declare-fun d!122617 () Bool)

(assert (=> d!122617 e!580114))

(declare-fun res!687871 () Bool)

(assert (=> d!122617 (=> (not res!687871) (not e!580114))))

(assert (=> d!122617 (= res!687871 (or (bvsge #b00000000000000000000000000000000 (size!31613 lt!452297)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31613 lt!452297)))))))

(declare-fun lt!452439 () ListLongMap!13745)

(declare-fun lt!452440 () ListLongMap!13745)

(assert (=> d!122617 (= lt!452439 lt!452440)))

(declare-fun lt!452436 () Unit!33443)

(declare-fun e!580105 () Unit!33443)

(assert (=> d!122617 (= lt!452436 e!580105)))

(declare-fun c!103611 () Bool)

(declare-fun e!580108 () Bool)

(assert (=> d!122617 (= c!103611 e!580108)))

(declare-fun res!687863 () Bool)

(assert (=> d!122617 (=> (not res!687863) (not e!580108))))

(assert (=> d!122617 (= res!687863 (bvslt #b00000000000000000000000000000000 (size!31613 lt!452297)))))

(declare-fun e!580116 () ListLongMap!13745)

(assert (=> d!122617 (= lt!452440 e!580116)))

(declare-fun c!103609 () Bool)

(assert (=> d!122617 (= c!103609 (and (not (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!122617 (validMask!0 (mask!29814 thiss!1427))))

(assert (=> d!122617 (= (getCurrentListMap!3855 lt!452297 lt!452298 (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)) lt!452439)))

(declare-fun b!1027770 () Bool)

(declare-fun e!580111 () Bool)

(assert (=> b!1027770 (= e!580111 (validKeyInArray!0 (select (arr!31098 lt!452297) #b00000000000000000000000000000000)))))

(declare-fun b!1027771 () Bool)

(declare-fun e!580112 () Bool)

(declare-fun e!580104 () Bool)

(assert (=> b!1027771 (= e!580112 e!580104)))

(declare-fun res!687866 () Bool)

(assert (=> b!1027771 (=> (not res!687866) (not e!580104))))

(assert (=> b!1027771 (= res!687866 (contains!5943 lt!452439 (select (arr!31098 lt!452297) #b00000000000000000000000000000000)))))

(assert (=> b!1027771 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31613 lt!452297)))))

(declare-fun b!1027772 () Bool)

(declare-fun e!580109 () Bool)

(assert (=> b!1027772 (= e!580110 e!580109)))

(declare-fun res!687869 () Bool)

(declare-fun call!43283 () Bool)

(assert (=> b!1027772 (= res!687869 call!43283)))

(assert (=> b!1027772 (=> (not res!687869) (not e!580109))))

(declare-fun b!1027773 () Bool)

(declare-fun e!580107 () Bool)

(declare-fun apply!893 (ListLongMap!13745 (_ BitVec 64)) V!37267)

(assert (=> b!1027773 (= e!580107 (= (apply!893 lt!452439 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5931 thiss!1427)))))

(declare-fun bm!43276 () Bool)

(declare-fun call!43280 () ListLongMap!13745)

(declare-fun call!43282 () ListLongMap!13745)

(assert (=> bm!43276 (= call!43280 call!43282)))

(declare-fun bm!43277 () Bool)

(assert (=> bm!43277 (= call!43283 (contains!5943 lt!452439 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1027774 () Bool)

(declare-fun e!580115 () ListLongMap!13745)

(assert (=> b!1027774 (= e!580115 call!43284)))

(declare-fun b!1027775 () Bool)

(declare-fun Unit!33449 () Unit!33443)

(assert (=> b!1027775 (= e!580105 Unit!33449)))

(declare-fun b!1027776 () Bool)

(declare-fun get!16336 (ValueCell!11444 V!37267) V!37267)

(assert (=> b!1027776 (= e!580104 (= (apply!893 lt!452439 (select (arr!31098 lt!452297) #b00000000000000000000000000000000)) (get!16336 (select (arr!31099 lt!452298) #b00000000000000000000000000000000) (dynLambda!1942 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1027776 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31614 lt!452298)))))

(assert (=> b!1027776 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31613 lt!452297)))))

(declare-fun bm!43278 () Bool)

(declare-fun call!43279 () Bool)

(assert (=> bm!43278 (= call!43279 (contains!5943 lt!452439 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1027777 () Bool)

(declare-fun e!580106 () ListLongMap!13745)

(assert (=> b!1027777 (= e!580106 call!43284)))

(declare-fun b!1027778 () Bool)

(declare-fun c!103614 () Bool)

(assert (=> b!1027778 (= c!103614 (and (not (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1027778 (= e!580115 e!580106)))

(declare-fun bm!43279 () Bool)

(declare-fun call!43278 () ListLongMap!13745)

(assert (=> bm!43279 (= call!43282 call!43278)))

(declare-fun b!1027779 () Bool)

(declare-fun e!580113 () Bool)

(assert (=> b!1027779 (= e!580113 (not call!43279))))

(declare-fun b!1027780 () Bool)

(assert (=> b!1027780 (= e!580108 (validKeyInArray!0 (select (arr!31098 lt!452297) #b00000000000000000000000000000000)))))

(declare-fun bm!43280 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3559 (array!64581 array!64583 (_ BitVec 32) (_ BitVec 32) V!37267 V!37267 (_ BitVec 32) Int) ListLongMap!13745)

(assert (=> bm!43280 (= call!43278 (getCurrentListMapNoExtraKeys!3559 lt!452297 lt!452298 (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)))))

(declare-fun b!1027781 () Bool)

(declare-fun +!3124 (ListLongMap!13745 tuple2!15620) ListLongMap!13745)

(assert (=> b!1027781 (= e!580116 (+!3124 call!43281 (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))))))

(declare-fun b!1027782 () Bool)

(declare-fun lt!452431 () Unit!33443)

(assert (=> b!1027782 (= e!580105 lt!452431)))

(declare-fun lt!452434 () ListLongMap!13745)

(assert (=> b!1027782 (= lt!452434 (getCurrentListMapNoExtraKeys!3559 lt!452297 lt!452298 (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)))))

(declare-fun lt!452429 () (_ BitVec 64))

(assert (=> b!1027782 (= lt!452429 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452441 () (_ BitVec 64))

(assert (=> b!1027782 (= lt!452441 (select (arr!31098 lt!452297) #b00000000000000000000000000000000))))

(declare-fun lt!452447 () Unit!33443)

(declare-fun addStillContains!612 (ListLongMap!13745 (_ BitVec 64) V!37267 (_ BitVec 64)) Unit!33443)

(assert (=> b!1027782 (= lt!452447 (addStillContains!612 lt!452434 lt!452429 (zeroValue!5931 thiss!1427) lt!452441))))

(assert (=> b!1027782 (contains!5943 (+!3124 lt!452434 (tuple2!15621 lt!452429 (zeroValue!5931 thiss!1427))) lt!452441)))

(declare-fun lt!452432 () Unit!33443)

(assert (=> b!1027782 (= lt!452432 lt!452447)))

(declare-fun lt!452444 () ListLongMap!13745)

(assert (=> b!1027782 (= lt!452444 (getCurrentListMapNoExtraKeys!3559 lt!452297 lt!452298 (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)))))

(declare-fun lt!452435 () (_ BitVec 64))

(assert (=> b!1027782 (= lt!452435 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452430 () (_ BitVec 64))

(assert (=> b!1027782 (= lt!452430 (select (arr!31098 lt!452297) #b00000000000000000000000000000000))))

(declare-fun lt!452445 () Unit!33443)

(declare-fun addApplyDifferent!468 (ListLongMap!13745 (_ BitVec 64) V!37267 (_ BitVec 64)) Unit!33443)

(assert (=> b!1027782 (= lt!452445 (addApplyDifferent!468 lt!452444 lt!452435 (minValue!5931 thiss!1427) lt!452430))))

(assert (=> b!1027782 (= (apply!893 (+!3124 lt!452444 (tuple2!15621 lt!452435 (minValue!5931 thiss!1427))) lt!452430) (apply!893 lt!452444 lt!452430))))

(declare-fun lt!452446 () Unit!33443)

(assert (=> b!1027782 (= lt!452446 lt!452445)))

(declare-fun lt!452438 () ListLongMap!13745)

(assert (=> b!1027782 (= lt!452438 (getCurrentListMapNoExtraKeys!3559 lt!452297 lt!452298 (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)))))

(declare-fun lt!452443 () (_ BitVec 64))

(assert (=> b!1027782 (= lt!452443 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452427 () (_ BitVec 64))

(assert (=> b!1027782 (= lt!452427 (select (arr!31098 lt!452297) #b00000000000000000000000000000000))))

(declare-fun lt!452442 () Unit!33443)

(assert (=> b!1027782 (= lt!452442 (addApplyDifferent!468 lt!452438 lt!452443 (zeroValue!5931 thiss!1427) lt!452427))))

(assert (=> b!1027782 (= (apply!893 (+!3124 lt!452438 (tuple2!15621 lt!452443 (zeroValue!5931 thiss!1427))) lt!452427) (apply!893 lt!452438 lt!452427))))

(declare-fun lt!452437 () Unit!33443)

(assert (=> b!1027782 (= lt!452437 lt!452442)))

(declare-fun lt!452448 () ListLongMap!13745)

(assert (=> b!1027782 (= lt!452448 (getCurrentListMapNoExtraKeys!3559 lt!452297 lt!452298 (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)))))

(declare-fun lt!452433 () (_ BitVec 64))

(assert (=> b!1027782 (= lt!452433 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452428 () (_ BitVec 64))

(assert (=> b!1027782 (= lt!452428 (select (arr!31098 lt!452297) #b00000000000000000000000000000000))))

(assert (=> b!1027782 (= lt!452431 (addApplyDifferent!468 lt!452448 lt!452433 (minValue!5931 thiss!1427) lt!452428))))

(assert (=> b!1027782 (= (apply!893 (+!3124 lt!452448 (tuple2!15621 lt!452433 (minValue!5931 thiss!1427))) lt!452428) (apply!893 lt!452448 lt!452428))))

(declare-fun b!1027783 () Bool)

(declare-fun res!687864 () Bool)

(assert (=> b!1027783 (=> (not res!687864) (not e!580114))))

(assert (=> b!1027783 (= res!687864 e!580112)))

(declare-fun res!687870 () Bool)

(assert (=> b!1027783 (=> res!687870 e!580112)))

(assert (=> b!1027783 (= res!687870 (not e!580111))))

(declare-fun res!687865 () Bool)

(assert (=> b!1027783 (=> (not res!687865) (not e!580111))))

(assert (=> b!1027783 (= res!687865 (bvslt #b00000000000000000000000000000000 (size!31613 lt!452297)))))

(declare-fun b!1027784 () Bool)

(assert (=> b!1027784 (= e!580110 (not call!43283))))

(declare-fun c!103612 () Bool)

(declare-fun bm!43281 () Bool)

(assert (=> bm!43281 (= call!43281 (+!3124 (ite c!103609 call!43278 (ite c!103612 call!43282 call!43280)) (ite (or c!103609 c!103612) (tuple2!15621 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))))))

(declare-fun b!1027785 () Bool)

(assert (=> b!1027785 (= e!580106 call!43280)))

(declare-fun b!1027786 () Bool)

(assert (=> b!1027786 (= e!580116 e!580115)))

(assert (=> b!1027786 (= c!103612 (and (not (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1027787 () Bool)

(declare-fun res!687867 () Bool)

(assert (=> b!1027787 (=> (not res!687867) (not e!580114))))

(assert (=> b!1027787 (= res!687867 e!580113)))

(declare-fun c!103613 () Bool)

(assert (=> b!1027787 (= c!103613 (not (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1027788 () Bool)

(assert (=> b!1027788 (= e!580113 e!580107)))

(declare-fun res!687868 () Bool)

(assert (=> b!1027788 (= res!687868 call!43279)))

(assert (=> b!1027788 (=> (not res!687868) (not e!580107))))

(declare-fun b!1027789 () Bool)

(assert (=> b!1027789 (= e!580109 (= (apply!893 lt!452439 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5931 thiss!1427)))))

(assert (= (and d!122617 c!103609) b!1027781))

(assert (= (and d!122617 (not c!103609)) b!1027786))

(assert (= (and b!1027786 c!103612) b!1027774))

(assert (= (and b!1027786 (not c!103612)) b!1027778))

(assert (= (and b!1027778 c!103614) b!1027777))

(assert (= (and b!1027778 (not c!103614)) b!1027785))

(assert (= (or b!1027777 b!1027785) bm!43276))

(assert (= (or b!1027774 bm!43276) bm!43279))

(assert (= (or b!1027774 b!1027777) bm!43275))

(assert (= (or b!1027781 bm!43279) bm!43280))

(assert (= (or b!1027781 bm!43275) bm!43281))

(assert (= (and d!122617 res!687863) b!1027780))

(assert (= (and d!122617 c!103611) b!1027782))

(assert (= (and d!122617 (not c!103611)) b!1027775))

(assert (= (and d!122617 res!687871) b!1027783))

(assert (= (and b!1027783 res!687865) b!1027770))

(assert (= (and b!1027783 (not res!687870)) b!1027771))

(assert (= (and b!1027771 res!687866) b!1027776))

(assert (= (and b!1027783 res!687864) b!1027787))

(assert (= (and b!1027787 c!103613) b!1027788))

(assert (= (and b!1027787 (not c!103613)) b!1027779))

(assert (= (and b!1027788 res!687868) b!1027773))

(assert (= (or b!1027788 b!1027779) bm!43278))

(assert (= (and b!1027787 res!687867) b!1027769))

(assert (= (and b!1027769 c!103610) b!1027772))

(assert (= (and b!1027769 (not c!103610)) b!1027784))

(assert (= (and b!1027772 res!687869) b!1027789))

(assert (= (or b!1027772 b!1027784) bm!43277))

(declare-fun b_lambda!15727 () Bool)

(assert (=> (not b_lambda!15727) (not b!1027776)))

(assert (=> b!1027776 t!30904))

(declare-fun b_and!32821 () Bool)

(assert (= b_and!32819 (and (=> t!30904 result!14095) b_and!32821)))

(declare-fun m!945831 () Bool)

(assert (=> b!1027773 m!945831))

(declare-fun m!945833 () Bool)

(assert (=> b!1027781 m!945833))

(assert (=> b!1027770 m!945813))

(assert (=> b!1027770 m!945813))

(assert (=> b!1027770 m!945815))

(declare-fun m!945835 () Bool)

(assert (=> bm!43278 m!945835))

(declare-fun m!945837 () Bool)

(assert (=> bm!43280 m!945837))

(declare-fun m!945839 () Bool)

(assert (=> bm!43277 m!945839))

(declare-fun m!945841 () Bool)

(assert (=> b!1027789 m!945841))

(assert (=> b!1027771 m!945813))

(assert (=> b!1027771 m!945813))

(declare-fun m!945843 () Bool)

(assert (=> b!1027771 m!945843))

(assert (=> d!122617 m!945787))

(assert (=> b!1027780 m!945813))

(assert (=> b!1027780 m!945813))

(assert (=> b!1027780 m!945815))

(declare-fun m!945845 () Bool)

(assert (=> b!1027782 m!945845))

(declare-fun m!945847 () Bool)

(assert (=> b!1027782 m!945847))

(declare-fun m!945849 () Bool)

(assert (=> b!1027782 m!945849))

(declare-fun m!945851 () Bool)

(assert (=> b!1027782 m!945851))

(declare-fun m!945853 () Bool)

(assert (=> b!1027782 m!945853))

(declare-fun m!945855 () Bool)

(assert (=> b!1027782 m!945855))

(declare-fun m!945857 () Bool)

(assert (=> b!1027782 m!945857))

(declare-fun m!945859 () Bool)

(assert (=> b!1027782 m!945859))

(declare-fun m!945861 () Bool)

(assert (=> b!1027782 m!945861))

(assert (=> b!1027782 m!945847))

(declare-fun m!945863 () Bool)

(assert (=> b!1027782 m!945863))

(assert (=> b!1027782 m!945851))

(declare-fun m!945865 () Bool)

(assert (=> b!1027782 m!945865))

(declare-fun m!945867 () Bool)

(assert (=> b!1027782 m!945867))

(declare-fun m!945869 () Bool)

(assert (=> b!1027782 m!945869))

(assert (=> b!1027782 m!945865))

(assert (=> b!1027782 m!945859))

(declare-fun m!945871 () Bool)

(assert (=> b!1027782 m!945871))

(declare-fun m!945873 () Bool)

(assert (=> b!1027782 m!945873))

(assert (=> b!1027782 m!945837))

(assert (=> b!1027782 m!945813))

(declare-fun m!945875 () Bool)

(assert (=> bm!43281 m!945875))

(assert (=> b!1027776 m!945813))

(declare-fun m!945877 () Bool)

(assert (=> b!1027776 m!945877))

(declare-fun m!945879 () Bool)

(assert (=> b!1027776 m!945879))

(assert (=> b!1027776 m!945879))

(assert (=> b!1027776 m!945679))

(declare-fun m!945881 () Bool)

(assert (=> b!1027776 m!945881))

(assert (=> b!1027776 m!945813))

(assert (=> b!1027776 m!945679))

(assert (=> b!1027593 d!122617))

(declare-fun d!122619 () Bool)

(declare-fun lt!452449 () (_ BitVec 32))

(assert (=> d!122619 (and (bvsge lt!452449 #b00000000000000000000000000000000) (bvsle lt!452449 (bvsub (size!31613 (_keys!11240 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!580118 () (_ BitVec 32))

(assert (=> d!122619 (= lt!452449 e!580118)))

(declare-fun c!103616 () Bool)

(assert (=> d!122619 (= c!103616 (bvsge #b00000000000000000000000000000000 (size!31613 (_keys!11240 thiss!1427))))))

(assert (=> d!122619 (and (bvsle #b00000000000000000000000000000000 (size!31613 (_keys!11240 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31613 (_keys!11240 thiss!1427)) (size!31613 (_keys!11240 thiss!1427))))))

(assert (=> d!122619 (= (arrayCountValidKeys!0 (_keys!11240 thiss!1427) #b00000000000000000000000000000000 (size!31613 (_keys!11240 thiss!1427))) lt!452449)))

(declare-fun bm!43282 () Bool)

(declare-fun call!43285 () (_ BitVec 32))

(assert (=> bm!43282 (= call!43285 (arrayCountValidKeys!0 (_keys!11240 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31613 (_keys!11240 thiss!1427))))))

(declare-fun b!1027790 () Bool)

(declare-fun e!580117 () (_ BitVec 32))

(assert (=> b!1027790 (= e!580118 e!580117)))

(declare-fun c!103615 () Bool)

(assert (=> b!1027790 (= c!103615 (validKeyInArray!0 (select (arr!31098 (_keys!11240 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1027791 () Bool)

(assert (=> b!1027791 (= e!580118 #b00000000000000000000000000000000)))

(declare-fun b!1027792 () Bool)

(assert (=> b!1027792 (= e!580117 call!43285)))

(declare-fun b!1027793 () Bool)

(assert (=> b!1027793 (= e!580117 (bvadd #b00000000000000000000000000000001 call!43285))))

(assert (= (and d!122619 c!103616) b!1027791))

(assert (= (and d!122619 (not c!103616)) b!1027790))

(assert (= (and b!1027790 c!103615) b!1027793))

(assert (= (and b!1027790 (not c!103615)) b!1027792))

(assert (= (or b!1027793 b!1027792) bm!43282))

(declare-fun m!945883 () Bool)

(assert (=> bm!43282 m!945883))

(declare-fun m!945885 () Bool)

(assert (=> b!1027790 m!945885))

(assert (=> b!1027790 m!945885))

(declare-fun m!945887 () Bool)

(assert (=> b!1027790 m!945887))

(assert (=> b!1027593 d!122619))

(declare-fun bm!43285 () Bool)

(declare-fun call!43288 () Bool)

(assert (=> bm!43285 (= call!43288 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!452297 (mask!29814 thiss!1427)))))

(declare-fun b!1027802 () Bool)

(declare-fun e!580126 () Bool)

(assert (=> b!1027802 (= e!580126 call!43288)))

(declare-fun b!1027803 () Bool)

(declare-fun e!580125 () Bool)

(assert (=> b!1027803 (= e!580125 e!580126)))

(declare-fun c!103619 () Bool)

(assert (=> b!1027803 (= c!103619 (validKeyInArray!0 (select (arr!31098 lt!452297) #b00000000000000000000000000000000)))))

(declare-fun d!122621 () Bool)

(declare-fun res!687877 () Bool)

(assert (=> d!122621 (=> res!687877 e!580125)))

(assert (=> d!122621 (= res!687877 (bvsge #b00000000000000000000000000000000 (size!31613 lt!452297)))))

(assert (=> d!122621 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!452297 (mask!29814 thiss!1427)) e!580125)))

(declare-fun b!1027804 () Bool)

(declare-fun e!580127 () Bool)

(assert (=> b!1027804 (= e!580127 call!43288)))

(declare-fun b!1027805 () Bool)

(assert (=> b!1027805 (= e!580126 e!580127)))

(declare-fun lt!452456 () (_ BitVec 64))

(assert (=> b!1027805 (= lt!452456 (select (arr!31098 lt!452297) #b00000000000000000000000000000000))))

(declare-fun lt!452458 () Unit!33443)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64581 (_ BitVec 64) (_ BitVec 32)) Unit!33443)

(assert (=> b!1027805 (= lt!452458 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!452297 lt!452456 #b00000000000000000000000000000000))))

(assert (=> b!1027805 (arrayContainsKey!0 lt!452297 lt!452456 #b00000000000000000000000000000000)))

(declare-fun lt!452457 () Unit!33443)

(assert (=> b!1027805 (= lt!452457 lt!452458)))

(declare-fun res!687876 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!64581 (_ BitVec 32)) SeekEntryResult!9666)

(assert (=> b!1027805 (= res!687876 (= (seekEntryOrOpen!0 (select (arr!31098 lt!452297) #b00000000000000000000000000000000) lt!452297 (mask!29814 thiss!1427)) (Found!9666 #b00000000000000000000000000000000)))))

(assert (=> b!1027805 (=> (not res!687876) (not e!580127))))

(assert (= (and d!122621 (not res!687877)) b!1027803))

(assert (= (and b!1027803 c!103619) b!1027805))

(assert (= (and b!1027803 (not c!103619)) b!1027802))

(assert (= (and b!1027805 res!687876) b!1027804))

(assert (= (or b!1027804 b!1027802) bm!43285))

(declare-fun m!945889 () Bool)

(assert (=> bm!43285 m!945889))

(assert (=> b!1027803 m!945813))

(assert (=> b!1027803 m!945813))

(assert (=> b!1027803 m!945815))

(assert (=> b!1027805 m!945813))

(declare-fun m!945891 () Bool)

(assert (=> b!1027805 m!945891))

(declare-fun m!945893 () Bool)

(assert (=> b!1027805 m!945893))

(assert (=> b!1027805 m!945813))

(declare-fun m!945895 () Bool)

(assert (=> b!1027805 m!945895))

(assert (=> b!1027593 d!122621))

(declare-fun d!122623 () Bool)

(declare-fun e!580130 () Bool)

(assert (=> d!122623 e!580130))

(declare-fun res!687880 () Bool)

(assert (=> d!122623 (=> (not res!687880) (not e!580130))))

(assert (=> d!122623 (= res!687880 (and (bvsge (index!41036 lt!452294) #b00000000000000000000000000000000) (bvslt (index!41036 lt!452294) (size!31613 (_keys!11240 thiss!1427)))))))

(declare-fun lt!452461 () Unit!33443)

(declare-fun choose!53 (array!64581 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21845) Unit!33443)

(assert (=> d!122623 (= lt!452461 (choose!53 (_keys!11240 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41036 lt!452294) #b00000000000000000000000000000000 Nil!21842))))

(assert (=> d!122623 (bvslt (size!31613 (_keys!11240 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!122623 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11240 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41036 lt!452294) #b00000000000000000000000000000000 Nil!21842) lt!452461)))

(declare-fun b!1027808 () Bool)

(assert (=> b!1027808 (= e!580130 (arrayNoDuplicates!0 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427))) #b00000000000000000000000000000000 Nil!21842))))

(assert (= (and d!122623 res!687880) b!1027808))

(declare-fun m!945897 () Bool)

(assert (=> d!122623 m!945897))

(assert (=> b!1027808 m!945665))

(declare-fun m!945899 () Bool)

(assert (=> b!1027808 m!945899))

(assert (=> b!1027593 d!122623))

(declare-fun d!122625 () Bool)

(declare-fun e!580133 () Bool)

(assert (=> d!122625 e!580133))

(declare-fun res!687883 () Bool)

(assert (=> d!122625 (=> (not res!687883) (not e!580133))))

(assert (=> d!122625 (= res!687883 (and (bvsge (index!41036 lt!452294) #b00000000000000000000000000000000) (bvslt (index!41036 lt!452294) (size!31613 (_keys!11240 thiss!1427)))))))

(declare-fun lt!452464 () Unit!33443)

(declare-fun choose!25 (array!64581 (_ BitVec 32) (_ BitVec 32)) Unit!33443)

(assert (=> d!122625 (= lt!452464 (choose!25 (_keys!11240 thiss!1427) (index!41036 lt!452294) (mask!29814 thiss!1427)))))

(assert (=> d!122625 (validMask!0 (mask!29814 thiss!1427))))

(assert (=> d!122625 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11240 thiss!1427) (index!41036 lt!452294) (mask!29814 thiss!1427)) lt!452464)))

(declare-fun b!1027811 () Bool)

(assert (=> b!1027811 (= e!580133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427))) (mask!29814 thiss!1427)))))

(assert (= (and d!122625 res!687883) b!1027811))

(declare-fun m!945901 () Bool)

(assert (=> d!122625 m!945901))

(assert (=> d!122625 m!945787))

(assert (=> b!1027811 m!945665))

(declare-fun m!945903 () Bool)

(assert (=> b!1027811 m!945903))

(assert (=> b!1027593 d!122625))

(declare-fun d!122627 () Bool)

(assert (=> d!122627 (= (validMask!0 (mask!29814 (_2!7820 lt!452296))) (and (or (= (mask!29814 (_2!7820 lt!452296)) #b00000000000000000000000000000111) (= (mask!29814 (_2!7820 lt!452296)) #b00000000000000000000000000001111) (= (mask!29814 (_2!7820 lt!452296)) #b00000000000000000000000000011111) (= (mask!29814 (_2!7820 lt!452296)) #b00000000000000000000000000111111) (= (mask!29814 (_2!7820 lt!452296)) #b00000000000000000000000001111111) (= (mask!29814 (_2!7820 lt!452296)) #b00000000000000000000000011111111) (= (mask!29814 (_2!7820 lt!452296)) #b00000000000000000000000111111111) (= (mask!29814 (_2!7820 lt!452296)) #b00000000000000000000001111111111) (= (mask!29814 (_2!7820 lt!452296)) #b00000000000000000000011111111111) (= (mask!29814 (_2!7820 lt!452296)) #b00000000000000000000111111111111) (= (mask!29814 (_2!7820 lt!452296)) #b00000000000000000001111111111111) (= (mask!29814 (_2!7820 lt!452296)) #b00000000000000000011111111111111) (= (mask!29814 (_2!7820 lt!452296)) #b00000000000000000111111111111111) (= (mask!29814 (_2!7820 lt!452296)) #b00000000000000001111111111111111) (= (mask!29814 (_2!7820 lt!452296)) #b00000000000000011111111111111111) (= (mask!29814 (_2!7820 lt!452296)) #b00000000000000111111111111111111) (= (mask!29814 (_2!7820 lt!452296)) #b00000000000001111111111111111111) (= (mask!29814 (_2!7820 lt!452296)) #b00000000000011111111111111111111) (= (mask!29814 (_2!7820 lt!452296)) #b00000000000111111111111111111111) (= (mask!29814 (_2!7820 lt!452296)) #b00000000001111111111111111111111) (= (mask!29814 (_2!7820 lt!452296)) #b00000000011111111111111111111111) (= (mask!29814 (_2!7820 lt!452296)) #b00000000111111111111111111111111) (= (mask!29814 (_2!7820 lt!452296)) #b00000001111111111111111111111111) (= (mask!29814 (_2!7820 lt!452296)) #b00000011111111111111111111111111) (= (mask!29814 (_2!7820 lt!452296)) #b00000111111111111111111111111111) (= (mask!29814 (_2!7820 lt!452296)) #b00001111111111111111111111111111) (= (mask!29814 (_2!7820 lt!452296)) #b00011111111111111111111111111111) (= (mask!29814 (_2!7820 lt!452296)) #b00111111111111111111111111111111)) (bvsle (mask!29814 (_2!7820 lt!452296)) #b00111111111111111111111111111111)))))

(assert (=> b!1027593 d!122627))

(declare-fun b!1027812 () Bool)

(declare-fun e!580144 () Bool)

(declare-fun e!580140 () Bool)

(assert (=> b!1027812 (= e!580144 e!580140)))

(declare-fun c!103621 () Bool)

(assert (=> b!1027812 (= c!103621 (not (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!43286 () Bool)

(declare-fun call!43295 () ListLongMap!13745)

(declare-fun call!43292 () ListLongMap!13745)

(assert (=> bm!43286 (= call!43295 call!43292)))

(declare-fun d!122629 () Bool)

(assert (=> d!122629 e!580144))

(declare-fun res!687892 () Bool)

(assert (=> d!122629 (=> (not res!687892) (not e!580144))))

(assert (=> d!122629 (= res!687892 (or (bvsge #b00000000000000000000000000000000 (size!31613 (_keys!11240 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31613 (_keys!11240 thiss!1427))))))))

(declare-fun lt!452477 () ListLongMap!13745)

(declare-fun lt!452478 () ListLongMap!13745)

(assert (=> d!122629 (= lt!452477 lt!452478)))

(declare-fun lt!452474 () Unit!33443)

(declare-fun e!580135 () Unit!33443)

(assert (=> d!122629 (= lt!452474 e!580135)))

(declare-fun c!103622 () Bool)

(declare-fun e!580138 () Bool)

(assert (=> d!122629 (= c!103622 e!580138)))

(declare-fun res!687884 () Bool)

(assert (=> d!122629 (=> (not res!687884) (not e!580138))))

(assert (=> d!122629 (= res!687884 (bvslt #b00000000000000000000000000000000 (size!31613 (_keys!11240 thiss!1427))))))

(declare-fun e!580146 () ListLongMap!13745)

(assert (=> d!122629 (= lt!452478 e!580146)))

(declare-fun c!103620 () Bool)

(assert (=> d!122629 (= c!103620 (and (not (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!122629 (validMask!0 (mask!29814 thiss!1427))))

(assert (=> d!122629 (= (getCurrentListMap!3855 (_keys!11240 thiss!1427) (_values!6118 thiss!1427) (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)) lt!452477)))

(declare-fun b!1027813 () Bool)

(declare-fun e!580141 () Bool)

(assert (=> b!1027813 (= e!580141 (validKeyInArray!0 (select (arr!31098 (_keys!11240 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1027814 () Bool)

(declare-fun e!580142 () Bool)

(declare-fun e!580134 () Bool)

(assert (=> b!1027814 (= e!580142 e!580134)))

(declare-fun res!687887 () Bool)

(assert (=> b!1027814 (=> (not res!687887) (not e!580134))))

(assert (=> b!1027814 (= res!687887 (contains!5943 lt!452477 (select (arr!31098 (_keys!11240 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1027814 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31613 (_keys!11240 thiss!1427))))))

(declare-fun b!1027815 () Bool)

(declare-fun e!580139 () Bool)

(assert (=> b!1027815 (= e!580140 e!580139)))

(declare-fun res!687890 () Bool)

(declare-fun call!43294 () Bool)

(assert (=> b!1027815 (= res!687890 call!43294)))

(assert (=> b!1027815 (=> (not res!687890) (not e!580139))))

(declare-fun b!1027816 () Bool)

(declare-fun e!580137 () Bool)

(assert (=> b!1027816 (= e!580137 (= (apply!893 lt!452477 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5931 thiss!1427)))))

(declare-fun bm!43287 () Bool)

(declare-fun call!43291 () ListLongMap!13745)

(declare-fun call!43293 () ListLongMap!13745)

(assert (=> bm!43287 (= call!43291 call!43293)))

(declare-fun bm!43288 () Bool)

(assert (=> bm!43288 (= call!43294 (contains!5943 lt!452477 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1027817 () Bool)

(declare-fun e!580145 () ListLongMap!13745)

(assert (=> b!1027817 (= e!580145 call!43295)))

(declare-fun b!1027818 () Bool)

(declare-fun Unit!33450 () Unit!33443)

(assert (=> b!1027818 (= e!580135 Unit!33450)))

(declare-fun b!1027819 () Bool)

(assert (=> b!1027819 (= e!580134 (= (apply!893 lt!452477 (select (arr!31098 (_keys!11240 thiss!1427)) #b00000000000000000000000000000000)) (get!16336 (select (arr!31099 (_values!6118 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1942 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1027819 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31614 (_values!6118 thiss!1427))))))

(assert (=> b!1027819 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31613 (_keys!11240 thiss!1427))))))

(declare-fun bm!43289 () Bool)

(declare-fun call!43290 () Bool)

(assert (=> bm!43289 (= call!43290 (contains!5943 lt!452477 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1027820 () Bool)

(declare-fun e!580136 () ListLongMap!13745)

(assert (=> b!1027820 (= e!580136 call!43295)))

(declare-fun b!1027821 () Bool)

(declare-fun c!103625 () Bool)

(assert (=> b!1027821 (= c!103625 (and (not (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1027821 (= e!580145 e!580136)))

(declare-fun bm!43290 () Bool)

(declare-fun call!43289 () ListLongMap!13745)

(assert (=> bm!43290 (= call!43293 call!43289)))

(declare-fun b!1027822 () Bool)

(declare-fun e!580143 () Bool)

(assert (=> b!1027822 (= e!580143 (not call!43290))))

(declare-fun b!1027823 () Bool)

(assert (=> b!1027823 (= e!580138 (validKeyInArray!0 (select (arr!31098 (_keys!11240 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43291 () Bool)

(assert (=> bm!43291 (= call!43289 (getCurrentListMapNoExtraKeys!3559 (_keys!11240 thiss!1427) (_values!6118 thiss!1427) (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)))))

(declare-fun b!1027824 () Bool)

(assert (=> b!1027824 (= e!580146 (+!3124 call!43292 (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))))))

(declare-fun b!1027825 () Bool)

(declare-fun lt!452469 () Unit!33443)

(assert (=> b!1027825 (= e!580135 lt!452469)))

(declare-fun lt!452472 () ListLongMap!13745)

(assert (=> b!1027825 (= lt!452472 (getCurrentListMapNoExtraKeys!3559 (_keys!11240 thiss!1427) (_values!6118 thiss!1427) (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)))))

(declare-fun lt!452467 () (_ BitVec 64))

(assert (=> b!1027825 (= lt!452467 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452479 () (_ BitVec 64))

(assert (=> b!1027825 (= lt!452479 (select (arr!31098 (_keys!11240 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!452485 () Unit!33443)

(assert (=> b!1027825 (= lt!452485 (addStillContains!612 lt!452472 lt!452467 (zeroValue!5931 thiss!1427) lt!452479))))

(assert (=> b!1027825 (contains!5943 (+!3124 lt!452472 (tuple2!15621 lt!452467 (zeroValue!5931 thiss!1427))) lt!452479)))

(declare-fun lt!452470 () Unit!33443)

(assert (=> b!1027825 (= lt!452470 lt!452485)))

(declare-fun lt!452482 () ListLongMap!13745)

(assert (=> b!1027825 (= lt!452482 (getCurrentListMapNoExtraKeys!3559 (_keys!11240 thiss!1427) (_values!6118 thiss!1427) (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)))))

(declare-fun lt!452473 () (_ BitVec 64))

(assert (=> b!1027825 (= lt!452473 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452468 () (_ BitVec 64))

(assert (=> b!1027825 (= lt!452468 (select (arr!31098 (_keys!11240 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!452483 () Unit!33443)

(assert (=> b!1027825 (= lt!452483 (addApplyDifferent!468 lt!452482 lt!452473 (minValue!5931 thiss!1427) lt!452468))))

(assert (=> b!1027825 (= (apply!893 (+!3124 lt!452482 (tuple2!15621 lt!452473 (minValue!5931 thiss!1427))) lt!452468) (apply!893 lt!452482 lt!452468))))

(declare-fun lt!452484 () Unit!33443)

(assert (=> b!1027825 (= lt!452484 lt!452483)))

(declare-fun lt!452476 () ListLongMap!13745)

(assert (=> b!1027825 (= lt!452476 (getCurrentListMapNoExtraKeys!3559 (_keys!11240 thiss!1427) (_values!6118 thiss!1427) (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)))))

(declare-fun lt!452481 () (_ BitVec 64))

(assert (=> b!1027825 (= lt!452481 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452465 () (_ BitVec 64))

(assert (=> b!1027825 (= lt!452465 (select (arr!31098 (_keys!11240 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!452480 () Unit!33443)

(assert (=> b!1027825 (= lt!452480 (addApplyDifferent!468 lt!452476 lt!452481 (zeroValue!5931 thiss!1427) lt!452465))))

(assert (=> b!1027825 (= (apply!893 (+!3124 lt!452476 (tuple2!15621 lt!452481 (zeroValue!5931 thiss!1427))) lt!452465) (apply!893 lt!452476 lt!452465))))

(declare-fun lt!452475 () Unit!33443)

(assert (=> b!1027825 (= lt!452475 lt!452480)))

(declare-fun lt!452486 () ListLongMap!13745)

(assert (=> b!1027825 (= lt!452486 (getCurrentListMapNoExtraKeys!3559 (_keys!11240 thiss!1427) (_values!6118 thiss!1427) (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)))))

(declare-fun lt!452471 () (_ BitVec 64))

(assert (=> b!1027825 (= lt!452471 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452466 () (_ BitVec 64))

(assert (=> b!1027825 (= lt!452466 (select (arr!31098 (_keys!11240 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1027825 (= lt!452469 (addApplyDifferent!468 lt!452486 lt!452471 (minValue!5931 thiss!1427) lt!452466))))

(assert (=> b!1027825 (= (apply!893 (+!3124 lt!452486 (tuple2!15621 lt!452471 (minValue!5931 thiss!1427))) lt!452466) (apply!893 lt!452486 lt!452466))))

(declare-fun b!1027826 () Bool)

(declare-fun res!687885 () Bool)

(assert (=> b!1027826 (=> (not res!687885) (not e!580144))))

(assert (=> b!1027826 (= res!687885 e!580142)))

(declare-fun res!687891 () Bool)

(assert (=> b!1027826 (=> res!687891 e!580142)))

(assert (=> b!1027826 (= res!687891 (not e!580141))))

(declare-fun res!687886 () Bool)

(assert (=> b!1027826 (=> (not res!687886) (not e!580141))))

(assert (=> b!1027826 (= res!687886 (bvslt #b00000000000000000000000000000000 (size!31613 (_keys!11240 thiss!1427))))))

(declare-fun b!1027827 () Bool)

(assert (=> b!1027827 (= e!580140 (not call!43294))))

(declare-fun bm!43292 () Bool)

(declare-fun c!103623 () Bool)

(assert (=> bm!43292 (= call!43292 (+!3124 (ite c!103620 call!43289 (ite c!103623 call!43293 call!43291)) (ite (or c!103620 c!103623) (tuple2!15621 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))))))

(declare-fun b!1027828 () Bool)

(assert (=> b!1027828 (= e!580136 call!43291)))

(declare-fun b!1027829 () Bool)

(assert (=> b!1027829 (= e!580146 e!580145)))

(assert (=> b!1027829 (= c!103623 (and (not (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1027830 () Bool)

(declare-fun res!687888 () Bool)

(assert (=> b!1027830 (=> (not res!687888) (not e!580144))))

(assert (=> b!1027830 (= res!687888 e!580143)))

(declare-fun c!103624 () Bool)

(assert (=> b!1027830 (= c!103624 (not (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1027831 () Bool)

(assert (=> b!1027831 (= e!580143 e!580137)))

(declare-fun res!687889 () Bool)

(assert (=> b!1027831 (= res!687889 call!43290)))

(assert (=> b!1027831 (=> (not res!687889) (not e!580137))))

(declare-fun b!1027832 () Bool)

(assert (=> b!1027832 (= e!580139 (= (apply!893 lt!452477 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5931 thiss!1427)))))

(assert (= (and d!122629 c!103620) b!1027824))

(assert (= (and d!122629 (not c!103620)) b!1027829))

(assert (= (and b!1027829 c!103623) b!1027817))

(assert (= (and b!1027829 (not c!103623)) b!1027821))

(assert (= (and b!1027821 c!103625) b!1027820))

(assert (= (and b!1027821 (not c!103625)) b!1027828))

(assert (= (or b!1027820 b!1027828) bm!43287))

(assert (= (or b!1027817 bm!43287) bm!43290))

(assert (= (or b!1027817 b!1027820) bm!43286))

(assert (= (or b!1027824 bm!43290) bm!43291))

(assert (= (or b!1027824 bm!43286) bm!43292))

(assert (= (and d!122629 res!687884) b!1027823))

(assert (= (and d!122629 c!103622) b!1027825))

(assert (= (and d!122629 (not c!103622)) b!1027818))

(assert (= (and d!122629 res!687892) b!1027826))

(assert (= (and b!1027826 res!687886) b!1027813))

(assert (= (and b!1027826 (not res!687891)) b!1027814))

(assert (= (and b!1027814 res!687887) b!1027819))

(assert (= (and b!1027826 res!687885) b!1027830))

(assert (= (and b!1027830 c!103624) b!1027831))

(assert (= (and b!1027830 (not c!103624)) b!1027822))

(assert (= (and b!1027831 res!687889) b!1027816))

(assert (= (or b!1027831 b!1027822) bm!43289))

(assert (= (and b!1027830 res!687888) b!1027812))

(assert (= (and b!1027812 c!103621) b!1027815))

(assert (= (and b!1027812 (not c!103621)) b!1027827))

(assert (= (and b!1027815 res!687890) b!1027832))

(assert (= (or b!1027815 b!1027827) bm!43288))

(declare-fun b_lambda!15729 () Bool)

(assert (=> (not b_lambda!15729) (not b!1027819)))

(assert (=> b!1027819 t!30904))

(declare-fun b_and!32823 () Bool)

(assert (= b_and!32821 (and (=> t!30904 result!14095) b_and!32823)))

(declare-fun m!945905 () Bool)

(assert (=> b!1027816 m!945905))

(declare-fun m!945907 () Bool)

(assert (=> b!1027824 m!945907))

(assert (=> b!1027813 m!945885))

(assert (=> b!1027813 m!945885))

(assert (=> b!1027813 m!945887))

(declare-fun m!945909 () Bool)

(assert (=> bm!43289 m!945909))

(declare-fun m!945911 () Bool)

(assert (=> bm!43291 m!945911))

(declare-fun m!945913 () Bool)

(assert (=> bm!43288 m!945913))

(declare-fun m!945915 () Bool)

(assert (=> b!1027832 m!945915))

(assert (=> b!1027814 m!945885))

(assert (=> b!1027814 m!945885))

(declare-fun m!945917 () Bool)

(assert (=> b!1027814 m!945917))

(assert (=> d!122629 m!945787))

(assert (=> b!1027823 m!945885))

(assert (=> b!1027823 m!945885))

(assert (=> b!1027823 m!945887))

(declare-fun m!945919 () Bool)

(assert (=> b!1027825 m!945919))

(declare-fun m!945921 () Bool)

(assert (=> b!1027825 m!945921))

(declare-fun m!945923 () Bool)

(assert (=> b!1027825 m!945923))

(declare-fun m!945925 () Bool)

(assert (=> b!1027825 m!945925))

(declare-fun m!945927 () Bool)

(assert (=> b!1027825 m!945927))

(declare-fun m!945929 () Bool)

(assert (=> b!1027825 m!945929))

(declare-fun m!945931 () Bool)

(assert (=> b!1027825 m!945931))

(declare-fun m!945933 () Bool)

(assert (=> b!1027825 m!945933))

(declare-fun m!945935 () Bool)

(assert (=> b!1027825 m!945935))

(assert (=> b!1027825 m!945921))

(declare-fun m!945937 () Bool)

(assert (=> b!1027825 m!945937))

(assert (=> b!1027825 m!945925))

(declare-fun m!945939 () Bool)

(assert (=> b!1027825 m!945939))

(declare-fun m!945941 () Bool)

(assert (=> b!1027825 m!945941))

(declare-fun m!945943 () Bool)

(assert (=> b!1027825 m!945943))

(assert (=> b!1027825 m!945939))

(assert (=> b!1027825 m!945933))

(declare-fun m!945945 () Bool)

(assert (=> b!1027825 m!945945))

(declare-fun m!945947 () Bool)

(assert (=> b!1027825 m!945947))

(assert (=> b!1027825 m!945911))

(assert (=> b!1027825 m!945885))

(declare-fun m!945949 () Bool)

(assert (=> bm!43292 m!945949))

(assert (=> b!1027819 m!945885))

(declare-fun m!945951 () Bool)

(assert (=> b!1027819 m!945951))

(declare-fun m!945953 () Bool)

(assert (=> b!1027819 m!945953))

(assert (=> b!1027819 m!945953))

(assert (=> b!1027819 m!945679))

(declare-fun m!945955 () Bool)

(assert (=> b!1027819 m!945955))

(assert (=> b!1027819 m!945885))

(assert (=> b!1027819 m!945679))

(assert (=> b!1027593 d!122629))

(declare-fun mapIsEmpty!37883 () Bool)

(declare-fun mapRes!37883 () Bool)

(assert (=> mapIsEmpty!37883 mapRes!37883))

(declare-fun mapNonEmpty!37883 () Bool)

(declare-fun tp!72789 () Bool)

(declare-fun e!580151 () Bool)

(assert (=> mapNonEmpty!37883 (= mapRes!37883 (and tp!72789 e!580151))))

(declare-fun mapRest!37883 () (Array (_ BitVec 32) ValueCell!11444))

(declare-fun mapValue!37883 () ValueCell!11444)

(declare-fun mapKey!37883 () (_ BitVec 32))

(assert (=> mapNonEmpty!37883 (= mapRest!37874 (store mapRest!37883 mapKey!37883 mapValue!37883))))

(declare-fun b!1027839 () Bool)

(assert (=> b!1027839 (= e!580151 tp_is_empty!24295)))

(declare-fun condMapEmpty!37883 () Bool)

(declare-fun mapDefault!37883 () ValueCell!11444)

(assert (=> mapNonEmpty!37874 (= condMapEmpty!37883 (= mapRest!37874 ((as const (Array (_ BitVec 32) ValueCell!11444)) mapDefault!37883)))))

(declare-fun e!580152 () Bool)

(assert (=> mapNonEmpty!37874 (= tp!72774 (and e!580152 mapRes!37883))))

(declare-fun b!1027840 () Bool)

(assert (=> b!1027840 (= e!580152 tp_is_empty!24295)))

(assert (= (and mapNonEmpty!37874 condMapEmpty!37883) mapIsEmpty!37883))

(assert (= (and mapNonEmpty!37874 (not condMapEmpty!37883)) mapNonEmpty!37883))

(assert (= (and mapNonEmpty!37883 ((_ is ValueCellFull!11444) mapValue!37883)) b!1027839))

(assert (= (and mapNonEmpty!37874 ((_ is ValueCellFull!11444) mapDefault!37883)) b!1027840))

(declare-fun m!945957 () Bool)

(assert (=> mapNonEmpty!37883 m!945957))

(declare-fun b_lambda!15731 () Bool)

(assert (= b_lambda!15725 (or (and b!1027591 b_free!20575) b_lambda!15731)))

(declare-fun b_lambda!15733 () Bool)

(assert (= b_lambda!15729 (or (and b!1027591 b_free!20575) b_lambda!15733)))

(declare-fun b_lambda!15735 () Bool)

(assert (= b_lambda!15727 (or (and b!1027591 b_free!20575) b_lambda!15735)))

(check-sat (not bm!43257) (not b!1027782) (not bm!43291) (not b_lambda!15733) (not bm!43282) b_and!32823 (not b!1027770) (not b!1027824) (not d!122601) (not b!1027780) (not mapNonEmpty!37883) (not d!122617) (not b_next!20575) (not d!122623) (not b!1027816) (not b!1027716) (not b!1027675) (not d!122625) (not b!1027687) (not b!1027688) (not d!122599) (not b!1027808) (not b_lambda!15735) (not b_lambda!15723) (not b!1027673) (not b!1027661) (not b!1027776) (not d!122603) (not bm!43278) (not b!1027690) (not b!1027714) (not b!1027720) (not bm!43288) (not b!1027814) (not bm!43281) (not d!122605) (not bm!43280) (not d!122609) (not b!1027813) (not b!1027811) (not b!1027771) (not b!1027819) (not b!1027773) (not b!1027825) (not b!1027699) (not b!1027790) (not b!1027674) (not b!1027678) (not b!1027805) tp_is_empty!24295 (not bm!43292) (not b!1027726) (not bm!43277) (not b!1027832) (not b!1027803) (not b!1027781) (not b_lambda!15731) (not b!1027823) (not d!122629) (not d!122613) (not bm!43289) (not b!1027717) (not bm!43260) (not b!1027789) (not bm!43285))
(check-sat b_and!32823 (not b_next!20575))
(get-model)

(declare-fun d!122631 () Bool)

(declare-datatypes ((Option!637 0))(
  ( (Some!636 (v!14770 V!37267)) (None!635) )
))
(declare-fun get!16337 (Option!637) V!37267)

(declare-fun getValueByKey!586 (List!21844 (_ BitVec 64)) Option!637)

(assert (=> d!122631 (= (apply!893 lt!452477 #b0000000000000000000000000000000000000000000000000000000000000000) (get!16337 (getValueByKey!586 (toList!6888 lt!452477) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!29966 () Bool)

(assert (= bs!29966 d!122631))

(declare-fun m!945959 () Bool)

(assert (=> bs!29966 m!945959))

(assert (=> bs!29966 m!945959))

(declare-fun m!945961 () Bool)

(assert (=> bs!29966 m!945961))

(assert (=> b!1027816 d!122631))

(declare-fun d!122633 () Bool)

(assert (=> d!122633 (= (validKeyInArray!0 (select (arr!31098 lt!452297) #b00000000000000000000000000000000)) (and (not (= (select (arr!31098 lt!452297) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31098 lt!452297) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1027803 d!122633))

(declare-fun d!122635 () Bool)

(declare-fun e!580158 () Bool)

(assert (=> d!122635 e!580158))

(declare-fun res!687895 () Bool)

(assert (=> d!122635 (=> res!687895 e!580158)))

(declare-fun lt!452497 () Bool)

(assert (=> d!122635 (= res!687895 (not lt!452497))))

(declare-fun lt!452498 () Bool)

(assert (=> d!122635 (= lt!452497 lt!452498)))

(declare-fun lt!452495 () Unit!33443)

(declare-fun e!580157 () Unit!33443)

(assert (=> d!122635 (= lt!452495 e!580157)))

(declare-fun c!103628 () Bool)

(assert (=> d!122635 (= c!103628 lt!452498)))

(declare-fun containsKey!559 (List!21844 (_ BitVec 64)) Bool)

(assert (=> d!122635 (= lt!452498 (containsKey!559 (toList!6888 lt!452439) (select (arr!31098 lt!452297) #b00000000000000000000000000000000)))))

(assert (=> d!122635 (= (contains!5943 lt!452439 (select (arr!31098 lt!452297) #b00000000000000000000000000000000)) lt!452497)))

(declare-fun b!1027847 () Bool)

(declare-fun lt!452496 () Unit!33443)

(assert (=> b!1027847 (= e!580157 lt!452496)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!391 (List!21844 (_ BitVec 64)) Unit!33443)

(assert (=> b!1027847 (= lt!452496 (lemmaContainsKeyImpliesGetValueByKeyDefined!391 (toList!6888 lt!452439) (select (arr!31098 lt!452297) #b00000000000000000000000000000000)))))

(declare-fun isDefined!434 (Option!637) Bool)

(assert (=> b!1027847 (isDefined!434 (getValueByKey!586 (toList!6888 lt!452439) (select (arr!31098 lt!452297) #b00000000000000000000000000000000)))))

(declare-fun b!1027848 () Bool)

(declare-fun Unit!33451 () Unit!33443)

(assert (=> b!1027848 (= e!580157 Unit!33451)))

(declare-fun b!1027849 () Bool)

(assert (=> b!1027849 (= e!580158 (isDefined!434 (getValueByKey!586 (toList!6888 lt!452439) (select (arr!31098 lt!452297) #b00000000000000000000000000000000))))))

(assert (= (and d!122635 c!103628) b!1027847))

(assert (= (and d!122635 (not c!103628)) b!1027848))

(assert (= (and d!122635 (not res!687895)) b!1027849))

(assert (=> d!122635 m!945813))

(declare-fun m!945963 () Bool)

(assert (=> d!122635 m!945963))

(assert (=> b!1027847 m!945813))

(declare-fun m!945965 () Bool)

(assert (=> b!1027847 m!945965))

(assert (=> b!1027847 m!945813))

(declare-fun m!945967 () Bool)

(assert (=> b!1027847 m!945967))

(assert (=> b!1027847 m!945967))

(declare-fun m!945969 () Bool)

(assert (=> b!1027847 m!945969))

(assert (=> b!1027849 m!945813))

(assert (=> b!1027849 m!945967))

(assert (=> b!1027849 m!945967))

(assert (=> b!1027849 m!945969))

(assert (=> b!1027771 d!122635))

(declare-fun d!122637 () Bool)

(declare-fun e!580160 () Bool)

(assert (=> d!122637 e!580160))

(declare-fun res!687896 () Bool)

(assert (=> d!122637 (=> res!687896 e!580160)))

(declare-fun lt!452501 () Bool)

(assert (=> d!122637 (= res!687896 (not lt!452501))))

(declare-fun lt!452502 () Bool)

(assert (=> d!122637 (= lt!452501 lt!452502)))

(declare-fun lt!452499 () Unit!33443)

(declare-fun e!580159 () Unit!33443)

(assert (=> d!122637 (= lt!452499 e!580159)))

(declare-fun c!103629 () Bool)

(assert (=> d!122637 (= c!103629 lt!452502)))

(assert (=> d!122637 (= lt!452502 (containsKey!559 (toList!6888 lt!452477) (select (arr!31098 (_keys!11240 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!122637 (= (contains!5943 lt!452477 (select (arr!31098 (_keys!11240 thiss!1427)) #b00000000000000000000000000000000)) lt!452501)))

(declare-fun b!1027850 () Bool)

(declare-fun lt!452500 () Unit!33443)

(assert (=> b!1027850 (= e!580159 lt!452500)))

(assert (=> b!1027850 (= lt!452500 (lemmaContainsKeyImpliesGetValueByKeyDefined!391 (toList!6888 lt!452477) (select (arr!31098 (_keys!11240 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1027850 (isDefined!434 (getValueByKey!586 (toList!6888 lt!452477) (select (arr!31098 (_keys!11240 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1027851 () Bool)

(declare-fun Unit!33452 () Unit!33443)

(assert (=> b!1027851 (= e!580159 Unit!33452)))

(declare-fun b!1027852 () Bool)

(assert (=> b!1027852 (= e!580160 (isDefined!434 (getValueByKey!586 (toList!6888 lt!452477) (select (arr!31098 (_keys!11240 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (= (and d!122637 c!103629) b!1027850))

(assert (= (and d!122637 (not c!103629)) b!1027851))

(assert (= (and d!122637 (not res!687896)) b!1027852))

(assert (=> d!122637 m!945885))

(declare-fun m!945971 () Bool)

(assert (=> d!122637 m!945971))

(assert (=> b!1027850 m!945885))

(declare-fun m!945973 () Bool)

(assert (=> b!1027850 m!945973))

(assert (=> b!1027850 m!945885))

(declare-fun m!945975 () Bool)

(assert (=> b!1027850 m!945975))

(assert (=> b!1027850 m!945975))

(declare-fun m!945977 () Bool)

(assert (=> b!1027850 m!945977))

(assert (=> b!1027852 m!945885))

(assert (=> b!1027852 m!945975))

(assert (=> b!1027852 m!945975))

(assert (=> b!1027852 m!945977))

(assert (=> b!1027814 d!122637))

(declare-fun bm!43293 () Bool)

(declare-fun call!43296 () Bool)

(assert (=> bm!43293 (= call!43296 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!452297 (mask!29814 thiss!1427)))))

(declare-fun b!1027853 () Bool)

(declare-fun e!580162 () Bool)

(assert (=> b!1027853 (= e!580162 call!43296)))

(declare-fun b!1027854 () Bool)

(declare-fun e!580161 () Bool)

(assert (=> b!1027854 (= e!580161 e!580162)))

(declare-fun c!103630 () Bool)

(assert (=> b!1027854 (= c!103630 (validKeyInArray!0 (select (arr!31098 lt!452297) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!122639 () Bool)

(declare-fun res!687898 () Bool)

(assert (=> d!122639 (=> res!687898 e!580161)))

(assert (=> d!122639 (= res!687898 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31613 lt!452297)))))

(assert (=> d!122639 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!452297 (mask!29814 thiss!1427)) e!580161)))

(declare-fun b!1027855 () Bool)

(declare-fun e!580163 () Bool)

(assert (=> b!1027855 (= e!580163 call!43296)))

(declare-fun b!1027856 () Bool)

(assert (=> b!1027856 (= e!580162 e!580163)))

(declare-fun lt!452503 () (_ BitVec 64))

(assert (=> b!1027856 (= lt!452503 (select (arr!31098 lt!452297) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!452505 () Unit!33443)

(assert (=> b!1027856 (= lt!452505 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!452297 lt!452503 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1027856 (arrayContainsKey!0 lt!452297 lt!452503 #b00000000000000000000000000000000)))

(declare-fun lt!452504 () Unit!33443)

(assert (=> b!1027856 (= lt!452504 lt!452505)))

(declare-fun res!687897 () Bool)

(assert (=> b!1027856 (= res!687897 (= (seekEntryOrOpen!0 (select (arr!31098 lt!452297) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!452297 (mask!29814 thiss!1427)) (Found!9666 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1027856 (=> (not res!687897) (not e!580163))))

(assert (= (and d!122639 (not res!687898)) b!1027854))

(assert (= (and b!1027854 c!103630) b!1027856))

(assert (= (and b!1027854 (not c!103630)) b!1027853))

(assert (= (and b!1027856 res!687897) b!1027855))

(assert (= (or b!1027855 b!1027853) bm!43293))

(declare-fun m!945979 () Bool)

(assert (=> bm!43293 m!945979))

(declare-fun m!945981 () Bool)

(assert (=> b!1027854 m!945981))

(assert (=> b!1027854 m!945981))

(declare-fun m!945983 () Bool)

(assert (=> b!1027854 m!945983))

(assert (=> b!1027856 m!945981))

(declare-fun m!945985 () Bool)

(assert (=> b!1027856 m!945985))

(declare-fun m!945987 () Bool)

(assert (=> b!1027856 m!945987))

(assert (=> b!1027856 m!945981))

(declare-fun m!945989 () Bool)

(assert (=> b!1027856 m!945989))

(assert (=> bm!43285 d!122639))

(declare-fun d!122641 () Bool)

(declare-fun e!580166 () Bool)

(assert (=> d!122641 e!580166))

(declare-fun res!687903 () Bool)

(assert (=> d!122641 (=> (not res!687903) (not e!580166))))

(declare-fun lt!452515 () ListLongMap!13745)

(assert (=> d!122641 (= res!687903 (contains!5943 lt!452515 (_1!7821 (ite (or c!103609 c!103612) (tuple2!15621 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))))))))

(declare-fun lt!452514 () List!21844)

(assert (=> d!122641 (= lt!452515 (ListLongMap!13746 lt!452514))))

(declare-fun lt!452516 () Unit!33443)

(declare-fun lt!452517 () Unit!33443)

(assert (=> d!122641 (= lt!452516 lt!452517)))

(assert (=> d!122641 (= (getValueByKey!586 lt!452514 (_1!7821 (ite (or c!103609 c!103612) (tuple2!15621 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))))) (Some!636 (_2!7821 (ite (or c!103609 c!103612) (tuple2!15621 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!276 (List!21844 (_ BitVec 64) V!37267) Unit!33443)

(assert (=> d!122641 (= lt!452517 (lemmaContainsTupThenGetReturnValue!276 lt!452514 (_1!7821 (ite (or c!103609 c!103612) (tuple2!15621 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))) (_2!7821 (ite (or c!103609 c!103612) (tuple2!15621 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))))))))

(declare-fun insertStrictlySorted!369 (List!21844 (_ BitVec 64) V!37267) List!21844)

(assert (=> d!122641 (= lt!452514 (insertStrictlySorted!369 (toList!6888 (ite c!103609 call!43278 (ite c!103612 call!43282 call!43280))) (_1!7821 (ite (or c!103609 c!103612) (tuple2!15621 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))) (_2!7821 (ite (or c!103609 c!103612) (tuple2!15621 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))))))))

(assert (=> d!122641 (= (+!3124 (ite c!103609 call!43278 (ite c!103612 call!43282 call!43280)) (ite (or c!103609 c!103612) (tuple2!15621 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))) lt!452515)))

(declare-fun b!1027861 () Bool)

(declare-fun res!687904 () Bool)

(assert (=> b!1027861 (=> (not res!687904) (not e!580166))))

(assert (=> b!1027861 (= res!687904 (= (getValueByKey!586 (toList!6888 lt!452515) (_1!7821 (ite (or c!103609 c!103612) (tuple2!15621 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))))) (Some!636 (_2!7821 (ite (or c!103609 c!103612) (tuple2!15621 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))))))))

(declare-fun b!1027862 () Bool)

(declare-fun contains!5945 (List!21844 tuple2!15620) Bool)

(assert (=> b!1027862 (= e!580166 (contains!5945 (toList!6888 lt!452515) (ite (or c!103609 c!103612) (tuple2!15621 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))))))

(assert (= (and d!122641 res!687903) b!1027861))

(assert (= (and b!1027861 res!687904) b!1027862))

(declare-fun m!945991 () Bool)

(assert (=> d!122641 m!945991))

(declare-fun m!945993 () Bool)

(assert (=> d!122641 m!945993))

(declare-fun m!945995 () Bool)

(assert (=> d!122641 m!945995))

(declare-fun m!945997 () Bool)

(assert (=> d!122641 m!945997))

(declare-fun m!945999 () Bool)

(assert (=> b!1027861 m!945999))

(declare-fun m!946001 () Bool)

(assert (=> b!1027862 m!946001))

(assert (=> bm!43281 d!122641))

(assert (=> b!1027699 d!122633))

(declare-fun d!122643 () Bool)

(declare-fun e!580168 () Bool)

(assert (=> d!122643 e!580168))

(declare-fun res!687905 () Bool)

(assert (=> d!122643 (=> res!687905 e!580168)))

(declare-fun lt!452520 () Bool)

(assert (=> d!122643 (= res!687905 (not lt!452520))))

(declare-fun lt!452521 () Bool)

(assert (=> d!122643 (= lt!452520 lt!452521)))

(declare-fun lt!452518 () Unit!33443)

(declare-fun e!580167 () Unit!33443)

(assert (=> d!122643 (= lt!452518 e!580167)))

(declare-fun c!103631 () Bool)

(assert (=> d!122643 (= c!103631 lt!452521)))

(assert (=> d!122643 (= lt!452521 (containsKey!559 (toList!6888 lt!452477) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!122643 (= (contains!5943 lt!452477 #b1000000000000000000000000000000000000000000000000000000000000000) lt!452520)))

(declare-fun b!1027863 () Bool)

(declare-fun lt!452519 () Unit!33443)

(assert (=> b!1027863 (= e!580167 lt!452519)))

(assert (=> b!1027863 (= lt!452519 (lemmaContainsKeyImpliesGetValueByKeyDefined!391 (toList!6888 lt!452477) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1027863 (isDefined!434 (getValueByKey!586 (toList!6888 lt!452477) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1027864 () Bool)

(declare-fun Unit!33453 () Unit!33443)

(assert (=> b!1027864 (= e!580167 Unit!33453)))

(declare-fun b!1027865 () Bool)

(assert (=> b!1027865 (= e!580168 (isDefined!434 (getValueByKey!586 (toList!6888 lt!452477) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!122643 c!103631) b!1027863))

(assert (= (and d!122643 (not c!103631)) b!1027864))

(assert (= (and d!122643 (not res!687905)) b!1027865))

(declare-fun m!946003 () Bool)

(assert (=> d!122643 m!946003))

(declare-fun m!946005 () Bool)

(assert (=> b!1027863 m!946005))

(declare-fun m!946007 () Bool)

(assert (=> b!1027863 m!946007))

(assert (=> b!1027863 m!946007))

(declare-fun m!946009 () Bool)

(assert (=> b!1027863 m!946009))

(assert (=> b!1027865 m!946007))

(assert (=> b!1027865 m!946007))

(assert (=> b!1027865 m!946009))

(assert (=> bm!43288 d!122643))

(declare-fun d!122645 () Bool)

(assert (=> d!122645 (arrayContainsKey!0 lt!452297 lt!452456 #b00000000000000000000000000000000)))

(declare-fun lt!452524 () Unit!33443)

(declare-fun choose!13 (array!64581 (_ BitVec 64) (_ BitVec 32)) Unit!33443)

(assert (=> d!122645 (= lt!452524 (choose!13 lt!452297 lt!452456 #b00000000000000000000000000000000))))

(assert (=> d!122645 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!122645 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!452297 lt!452456 #b00000000000000000000000000000000) lt!452524)))

(declare-fun bs!29967 () Bool)

(assert (= bs!29967 d!122645))

(assert (=> bs!29967 m!945893))

(declare-fun m!946011 () Bool)

(assert (=> bs!29967 m!946011))

(assert (=> b!1027805 d!122645))

(declare-fun d!122647 () Bool)

(declare-fun res!687906 () Bool)

(declare-fun e!580169 () Bool)

(assert (=> d!122647 (=> res!687906 e!580169)))

(assert (=> d!122647 (= res!687906 (= (select (arr!31098 lt!452297) #b00000000000000000000000000000000) lt!452456))))

(assert (=> d!122647 (= (arrayContainsKey!0 lt!452297 lt!452456 #b00000000000000000000000000000000) e!580169)))

(declare-fun b!1027866 () Bool)

(declare-fun e!580170 () Bool)

(assert (=> b!1027866 (= e!580169 e!580170)))

(declare-fun res!687907 () Bool)

(assert (=> b!1027866 (=> (not res!687907) (not e!580170))))

(assert (=> b!1027866 (= res!687907 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31613 lt!452297)))))

(declare-fun b!1027867 () Bool)

(assert (=> b!1027867 (= e!580170 (arrayContainsKey!0 lt!452297 lt!452456 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!122647 (not res!687906)) b!1027866))

(assert (= (and b!1027866 res!687907) b!1027867))

(assert (=> d!122647 m!945813))

(declare-fun m!946013 () Bool)

(assert (=> b!1027867 m!946013))

(assert (=> b!1027805 d!122647))

(declare-fun b!1027880 () Bool)

(declare-fun e!580178 () SeekEntryResult!9666)

(assert (=> b!1027880 (= e!580178 Undefined!9666)))

(declare-fun b!1027881 () Bool)

(declare-fun e!580177 () SeekEntryResult!9666)

(assert (=> b!1027881 (= e!580178 e!580177)))

(declare-fun lt!452532 () (_ BitVec 64))

(declare-fun lt!452531 () SeekEntryResult!9666)

(assert (=> b!1027881 (= lt!452532 (select (arr!31098 lt!452297) (index!41037 lt!452531)))))

(declare-fun c!103639 () Bool)

(assert (=> b!1027881 (= c!103639 (= lt!452532 (select (arr!31098 lt!452297) #b00000000000000000000000000000000)))))

(declare-fun d!122649 () Bool)

(declare-fun lt!452533 () SeekEntryResult!9666)

(assert (=> d!122649 (and (or ((_ is Undefined!9666) lt!452533) (not ((_ is Found!9666) lt!452533)) (and (bvsge (index!41036 lt!452533) #b00000000000000000000000000000000) (bvslt (index!41036 lt!452533) (size!31613 lt!452297)))) (or ((_ is Undefined!9666) lt!452533) ((_ is Found!9666) lt!452533) (not ((_ is MissingZero!9666) lt!452533)) (and (bvsge (index!41035 lt!452533) #b00000000000000000000000000000000) (bvslt (index!41035 lt!452533) (size!31613 lt!452297)))) (or ((_ is Undefined!9666) lt!452533) ((_ is Found!9666) lt!452533) ((_ is MissingZero!9666) lt!452533) (not ((_ is MissingVacant!9666) lt!452533)) (and (bvsge (index!41038 lt!452533) #b00000000000000000000000000000000) (bvslt (index!41038 lt!452533) (size!31613 lt!452297)))) (or ((_ is Undefined!9666) lt!452533) (ite ((_ is Found!9666) lt!452533) (= (select (arr!31098 lt!452297) (index!41036 lt!452533)) (select (arr!31098 lt!452297) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9666) lt!452533) (= (select (arr!31098 lt!452297) (index!41035 lt!452533)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9666) lt!452533) (= (select (arr!31098 lt!452297) (index!41038 lt!452533)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!122649 (= lt!452533 e!580178)))

(declare-fun c!103640 () Bool)

(assert (=> d!122649 (= c!103640 (and ((_ is Intermediate!9666) lt!452531) (undefined!10478 lt!452531)))))

(assert (=> d!122649 (= lt!452531 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!31098 lt!452297) #b00000000000000000000000000000000) (mask!29814 thiss!1427)) (select (arr!31098 lt!452297) #b00000000000000000000000000000000) lt!452297 (mask!29814 thiss!1427)))))

(assert (=> d!122649 (validMask!0 (mask!29814 thiss!1427))))

(assert (=> d!122649 (= (seekEntryOrOpen!0 (select (arr!31098 lt!452297) #b00000000000000000000000000000000) lt!452297 (mask!29814 thiss!1427)) lt!452533)))

(declare-fun b!1027882 () Bool)

(assert (=> b!1027882 (= e!580177 (Found!9666 (index!41037 lt!452531)))))

(declare-fun b!1027883 () Bool)

(declare-fun c!103638 () Bool)

(assert (=> b!1027883 (= c!103638 (= lt!452532 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!580179 () SeekEntryResult!9666)

(assert (=> b!1027883 (= e!580177 e!580179)))

(declare-fun b!1027884 () Bool)

(assert (=> b!1027884 (= e!580179 (MissingZero!9666 (index!41037 lt!452531)))))

(declare-fun b!1027885 () Bool)

(assert (=> b!1027885 (= e!580179 (seekKeyOrZeroReturnVacant!0 (x!91447 lt!452531) (index!41037 lt!452531) (index!41037 lt!452531) (select (arr!31098 lt!452297) #b00000000000000000000000000000000) lt!452297 (mask!29814 thiss!1427)))))

(assert (= (and d!122649 c!103640) b!1027880))

(assert (= (and d!122649 (not c!103640)) b!1027881))

(assert (= (and b!1027881 c!103639) b!1027882))

(assert (= (and b!1027881 (not c!103639)) b!1027883))

(assert (= (and b!1027883 c!103638) b!1027884))

(assert (= (and b!1027883 (not c!103638)) b!1027885))

(declare-fun m!946015 () Bool)

(assert (=> b!1027881 m!946015))

(declare-fun m!946017 () Bool)

(assert (=> d!122649 m!946017))

(declare-fun m!946019 () Bool)

(assert (=> d!122649 m!946019))

(assert (=> d!122649 m!945813))

(declare-fun m!946021 () Bool)

(assert (=> d!122649 m!946021))

(assert (=> d!122649 m!945813))

(assert (=> d!122649 m!946019))

(declare-fun m!946023 () Bool)

(assert (=> d!122649 m!946023))

(declare-fun m!946025 () Bool)

(assert (=> d!122649 m!946025))

(assert (=> d!122649 m!945787))

(assert (=> b!1027885 m!945813))

(declare-fun m!946027 () Bool)

(assert (=> b!1027885 m!946027))

(assert (=> b!1027805 d!122649))

(declare-fun d!122651 () Bool)

(assert (=> d!122651 (= (apply!893 lt!452439 #b0000000000000000000000000000000000000000000000000000000000000000) (get!16337 (getValueByKey!586 (toList!6888 lt!452439) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!29968 () Bool)

(assert (= bs!29968 d!122651))

(declare-fun m!946029 () Bool)

(assert (=> bs!29968 m!946029))

(assert (=> bs!29968 m!946029))

(declare-fun m!946031 () Bool)

(assert (=> bs!29968 m!946031))

(assert (=> b!1027773 d!122651))

(declare-fun d!122653 () Bool)

(assert (=> d!122653 (= (validMask!0 (mask!29814 thiss!1427)) (and (or (= (mask!29814 thiss!1427) #b00000000000000000000000000000111) (= (mask!29814 thiss!1427) #b00000000000000000000000000001111) (= (mask!29814 thiss!1427) #b00000000000000000000000000011111) (= (mask!29814 thiss!1427) #b00000000000000000000000000111111) (= (mask!29814 thiss!1427) #b00000000000000000000000001111111) (= (mask!29814 thiss!1427) #b00000000000000000000000011111111) (= (mask!29814 thiss!1427) #b00000000000000000000000111111111) (= (mask!29814 thiss!1427) #b00000000000000000000001111111111) (= (mask!29814 thiss!1427) #b00000000000000000000011111111111) (= (mask!29814 thiss!1427) #b00000000000000000000111111111111) (= (mask!29814 thiss!1427) #b00000000000000000001111111111111) (= (mask!29814 thiss!1427) #b00000000000000000011111111111111) (= (mask!29814 thiss!1427) #b00000000000000000111111111111111) (= (mask!29814 thiss!1427) #b00000000000000001111111111111111) (= (mask!29814 thiss!1427) #b00000000000000011111111111111111) (= (mask!29814 thiss!1427) #b00000000000000111111111111111111) (= (mask!29814 thiss!1427) #b00000000000001111111111111111111) (= (mask!29814 thiss!1427) #b00000000000011111111111111111111) (= (mask!29814 thiss!1427) #b00000000000111111111111111111111) (= (mask!29814 thiss!1427) #b00000000001111111111111111111111) (= (mask!29814 thiss!1427) #b00000000011111111111111111111111) (= (mask!29814 thiss!1427) #b00000000111111111111111111111111) (= (mask!29814 thiss!1427) #b00000001111111111111111111111111) (= (mask!29814 thiss!1427) #b00000011111111111111111111111111) (= (mask!29814 thiss!1427) #b00000111111111111111111111111111) (= (mask!29814 thiss!1427) #b00001111111111111111111111111111) (= (mask!29814 thiss!1427) #b00011111111111111111111111111111) (= (mask!29814 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!29814 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> d!122629 d!122653))

(declare-fun d!122655 () Bool)

(assert (=> d!122655 (= (validKeyInArray!0 (select (arr!31098 (_keys!11240 thiss!1427)) #b00000000000000000000000000000000)) (and (not (= (select (arr!31098 (_keys!11240 thiss!1427)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31098 (_keys!11240 thiss!1427)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1027790 d!122655))

(declare-fun d!122657 () Bool)

(declare-fun e!580181 () Bool)

(assert (=> d!122657 e!580181))

(declare-fun res!687908 () Bool)

(assert (=> d!122657 (=> res!687908 e!580181)))

(declare-fun lt!452536 () Bool)

(assert (=> d!122657 (= res!687908 (not lt!452536))))

(declare-fun lt!452537 () Bool)

(assert (=> d!122657 (= lt!452536 lt!452537)))

(declare-fun lt!452534 () Unit!33443)

(declare-fun e!580180 () Unit!33443)

(assert (=> d!122657 (= lt!452534 e!580180)))

(declare-fun c!103641 () Bool)

(assert (=> d!122657 (= c!103641 lt!452537)))

(assert (=> d!122657 (= lt!452537 (containsKey!559 (toList!6888 lt!452439) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!122657 (= (contains!5943 lt!452439 #b1000000000000000000000000000000000000000000000000000000000000000) lt!452536)))

(declare-fun b!1027886 () Bool)

(declare-fun lt!452535 () Unit!33443)

(assert (=> b!1027886 (= e!580180 lt!452535)))

(assert (=> b!1027886 (= lt!452535 (lemmaContainsKeyImpliesGetValueByKeyDefined!391 (toList!6888 lt!452439) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1027886 (isDefined!434 (getValueByKey!586 (toList!6888 lt!452439) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1027887 () Bool)

(declare-fun Unit!33454 () Unit!33443)

(assert (=> b!1027887 (= e!580180 Unit!33454)))

(declare-fun b!1027888 () Bool)

(assert (=> b!1027888 (= e!580181 (isDefined!434 (getValueByKey!586 (toList!6888 lt!452439) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!122657 c!103641) b!1027886))

(assert (= (and d!122657 (not c!103641)) b!1027887))

(assert (= (and d!122657 (not res!687908)) b!1027888))

(declare-fun m!946033 () Bool)

(assert (=> d!122657 m!946033))

(declare-fun m!946035 () Bool)

(assert (=> b!1027886 m!946035))

(declare-fun m!946037 () Bool)

(assert (=> b!1027886 m!946037))

(assert (=> b!1027886 m!946037))

(declare-fun m!946039 () Bool)

(assert (=> b!1027886 m!946039))

(assert (=> b!1027888 m!946037))

(assert (=> b!1027888 m!946037))

(assert (=> b!1027888 m!946039))

(assert (=> bm!43277 d!122657))

(declare-fun d!122659 () Bool)

(declare-fun e!580183 () Bool)

(assert (=> d!122659 e!580183))

(declare-fun res!687909 () Bool)

(assert (=> d!122659 (=> res!687909 e!580183)))

(declare-fun lt!452540 () Bool)

(assert (=> d!122659 (= res!687909 (not lt!452540))))

(declare-fun lt!452541 () Bool)

(assert (=> d!122659 (= lt!452540 lt!452541)))

(declare-fun lt!452538 () Unit!33443)

(declare-fun e!580182 () Unit!33443)

(assert (=> d!122659 (= lt!452538 e!580182)))

(declare-fun c!103642 () Bool)

(assert (=> d!122659 (= c!103642 lt!452541)))

(assert (=> d!122659 (= lt!452541 (containsKey!559 (toList!6888 lt!452439) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!122659 (= (contains!5943 lt!452439 #b0000000000000000000000000000000000000000000000000000000000000000) lt!452540)))

(declare-fun b!1027889 () Bool)

(declare-fun lt!452539 () Unit!33443)

(assert (=> b!1027889 (= e!580182 lt!452539)))

(assert (=> b!1027889 (= lt!452539 (lemmaContainsKeyImpliesGetValueByKeyDefined!391 (toList!6888 lt!452439) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1027889 (isDefined!434 (getValueByKey!586 (toList!6888 lt!452439) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1027890 () Bool)

(declare-fun Unit!33455 () Unit!33443)

(assert (=> b!1027890 (= e!580182 Unit!33455)))

(declare-fun b!1027891 () Bool)

(assert (=> b!1027891 (= e!580183 (isDefined!434 (getValueByKey!586 (toList!6888 lt!452439) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!122659 c!103642) b!1027889))

(assert (= (and d!122659 (not c!103642)) b!1027890))

(assert (= (and d!122659 (not res!687909)) b!1027891))

(declare-fun m!946041 () Bool)

(assert (=> d!122659 m!946041))

(declare-fun m!946043 () Bool)

(assert (=> b!1027889 m!946043))

(assert (=> b!1027889 m!946029))

(assert (=> b!1027889 m!946029))

(declare-fun m!946045 () Bool)

(assert (=> b!1027889 m!946045))

(assert (=> b!1027891 m!946029))

(assert (=> b!1027891 m!946029))

(assert (=> b!1027891 m!946045))

(assert (=> bm!43278 d!122659))

(declare-fun b!1027910 () Bool)

(declare-fun e!580196 () SeekEntryResult!9666)

(declare-fun e!580198 () SeekEntryResult!9666)

(assert (=> b!1027910 (= e!580196 e!580198)))

(declare-fun c!103650 () Bool)

(declare-fun lt!452546 () (_ BitVec 64))

(assert (=> b!1027910 (= c!103650 (or (= lt!452546 key!909) (= (bvadd lt!452546 lt!452546) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1027911 () Bool)

(declare-fun lt!452547 () SeekEntryResult!9666)

(assert (=> b!1027911 (and (bvsge (index!41037 lt!452547) #b00000000000000000000000000000000) (bvslt (index!41037 lt!452547) (size!31613 (_keys!11240 thiss!1427))))))

(declare-fun e!580195 () Bool)

(assert (=> b!1027911 (= e!580195 (= (select (arr!31098 (_keys!11240 thiss!1427)) (index!41037 lt!452547)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1027912 () Bool)

(assert (=> b!1027912 (= e!580198 (Intermediate!9666 false (toIndex!0 key!909 (mask!29814 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1027913 () Bool)

(assert (=> b!1027913 (and (bvsge (index!41037 lt!452547) #b00000000000000000000000000000000) (bvslt (index!41037 lt!452547) (size!31613 (_keys!11240 thiss!1427))))))

(declare-fun res!687916 () Bool)

(assert (=> b!1027913 (= res!687916 (= (select (arr!31098 (_keys!11240 thiss!1427)) (index!41037 lt!452547)) key!909))))

(assert (=> b!1027913 (=> res!687916 e!580195)))

(declare-fun e!580194 () Bool)

(assert (=> b!1027913 (= e!580194 e!580195)))

(declare-fun b!1027914 () Bool)

(assert (=> b!1027914 (= e!580196 (Intermediate!9666 true (toIndex!0 key!909 (mask!29814 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun b!1027915 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1027915 (= e!580198 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!909 (mask!29814 thiss!1427)) #b00000000000000000000000000000000 (mask!29814 thiss!1427)) key!909 (_keys!11240 thiss!1427) (mask!29814 thiss!1427)))))

(declare-fun d!122661 () Bool)

(declare-fun e!580197 () Bool)

(assert (=> d!122661 e!580197))

(declare-fun c!103649 () Bool)

(assert (=> d!122661 (= c!103649 (and ((_ is Intermediate!9666) lt!452547) (undefined!10478 lt!452547)))))

(assert (=> d!122661 (= lt!452547 e!580196)))

(declare-fun c!103651 () Bool)

(assert (=> d!122661 (= c!103651 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!122661 (= lt!452546 (select (arr!31098 (_keys!11240 thiss!1427)) (toIndex!0 key!909 (mask!29814 thiss!1427))))))

(assert (=> d!122661 (validMask!0 (mask!29814 thiss!1427))))

(assert (=> d!122661 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!29814 thiss!1427)) key!909 (_keys!11240 thiss!1427) (mask!29814 thiss!1427)) lt!452547)))

(declare-fun b!1027916 () Bool)

(assert (=> b!1027916 (and (bvsge (index!41037 lt!452547) #b00000000000000000000000000000000) (bvslt (index!41037 lt!452547) (size!31613 (_keys!11240 thiss!1427))))))

(declare-fun res!687918 () Bool)

(assert (=> b!1027916 (= res!687918 (= (select (arr!31098 (_keys!11240 thiss!1427)) (index!41037 lt!452547)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1027916 (=> res!687918 e!580195)))

(declare-fun b!1027917 () Bool)

(assert (=> b!1027917 (= e!580197 e!580194)))

(declare-fun res!687917 () Bool)

(assert (=> b!1027917 (= res!687917 (and ((_ is Intermediate!9666) lt!452547) (not (undefined!10478 lt!452547)) (bvslt (x!91447 lt!452547) #b01111111111111111111111111111110) (bvsge (x!91447 lt!452547) #b00000000000000000000000000000000) (bvsge (x!91447 lt!452547) #b00000000000000000000000000000000)))))

(assert (=> b!1027917 (=> (not res!687917) (not e!580194))))

(declare-fun b!1027918 () Bool)

(assert (=> b!1027918 (= e!580197 (bvsge (x!91447 lt!452547) #b01111111111111111111111111111110))))

(assert (= (and d!122661 c!103651) b!1027914))

(assert (= (and d!122661 (not c!103651)) b!1027910))

(assert (= (and b!1027910 c!103650) b!1027912))

(assert (= (and b!1027910 (not c!103650)) b!1027915))

(assert (= (and d!122661 c!103649) b!1027918))

(assert (= (and d!122661 (not c!103649)) b!1027917))

(assert (= (and b!1027917 res!687917) b!1027913))

(assert (= (and b!1027913 (not res!687916)) b!1027916))

(assert (= (and b!1027916 (not res!687918)) b!1027911))

(declare-fun m!946047 () Bool)

(assert (=> b!1027913 m!946047))

(assert (=> d!122661 m!945783))

(declare-fun m!946049 () Bool)

(assert (=> d!122661 m!946049))

(assert (=> d!122661 m!945787))

(assert (=> b!1027916 m!946047))

(assert (=> b!1027915 m!945783))

(declare-fun m!946051 () Bool)

(assert (=> b!1027915 m!946051))

(assert (=> b!1027915 m!946051))

(declare-fun m!946053 () Bool)

(assert (=> b!1027915 m!946053))

(assert (=> b!1027911 m!946047))

(assert (=> d!122599 d!122661))

(declare-fun d!122663 () Bool)

(declare-fun lt!452553 () (_ BitVec 32))

(declare-fun lt!452552 () (_ BitVec 32))

(assert (=> d!122663 (= lt!452553 (bvmul (bvxor lt!452552 (bvlshr lt!452552 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!122663 (= lt!452552 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!122663 (and (bvsge (mask!29814 thiss!1427) #b00000000000000000000000000000000) (let ((res!687919 (let ((h!23040 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!91479 (bvmul (bvxor h!23040 (bvlshr h!23040 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!91479 (bvlshr x!91479 #b00000000000000000000000000001101)) (mask!29814 thiss!1427)))))) (and (bvslt res!687919 (bvadd (mask!29814 thiss!1427) #b00000000000000000000000000000001)) (bvsge res!687919 #b00000000000000000000000000000000))))))

(assert (=> d!122663 (= (toIndex!0 key!909 (mask!29814 thiss!1427)) (bvand (bvxor lt!452553 (bvlshr lt!452553 #b00000000000000000000000000001101)) (mask!29814 thiss!1427)))))

(assert (=> d!122599 d!122663))

(assert (=> d!122599 d!122653))

(declare-fun d!122665 () Bool)

(declare-fun e!580200 () Bool)

(assert (=> d!122665 e!580200))

(declare-fun res!687920 () Bool)

(assert (=> d!122665 (=> res!687920 e!580200)))

(declare-fun lt!452556 () Bool)

(assert (=> d!122665 (= res!687920 (not lt!452556))))

(declare-fun lt!452557 () Bool)

(assert (=> d!122665 (= lt!452556 lt!452557)))

(declare-fun lt!452554 () Unit!33443)

(declare-fun e!580199 () Unit!33443)

(assert (=> d!122665 (= lt!452554 e!580199)))

(declare-fun c!103652 () Bool)

(assert (=> d!122665 (= c!103652 lt!452557)))

(assert (=> d!122665 (= lt!452557 (containsKey!559 (toList!6888 lt!452477) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!122665 (= (contains!5943 lt!452477 #b0000000000000000000000000000000000000000000000000000000000000000) lt!452556)))

(declare-fun b!1027919 () Bool)

(declare-fun lt!452555 () Unit!33443)

(assert (=> b!1027919 (= e!580199 lt!452555)))

(assert (=> b!1027919 (= lt!452555 (lemmaContainsKeyImpliesGetValueByKeyDefined!391 (toList!6888 lt!452477) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1027919 (isDefined!434 (getValueByKey!586 (toList!6888 lt!452477) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1027920 () Bool)

(declare-fun Unit!33456 () Unit!33443)

(assert (=> b!1027920 (= e!580199 Unit!33456)))

(declare-fun b!1027921 () Bool)

(assert (=> b!1027921 (= e!580200 (isDefined!434 (getValueByKey!586 (toList!6888 lt!452477) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!122665 c!103652) b!1027919))

(assert (= (and d!122665 (not c!103652)) b!1027920))

(assert (= (and d!122665 (not res!687920)) b!1027921))

(declare-fun m!946055 () Bool)

(assert (=> d!122665 m!946055))

(declare-fun m!946057 () Bool)

(assert (=> b!1027919 m!946057))

(assert (=> b!1027919 m!945959))

(assert (=> b!1027919 m!945959))

(declare-fun m!946059 () Bool)

(assert (=> b!1027919 m!946059))

(assert (=> b!1027921 m!945959))

(assert (=> b!1027921 m!945959))

(assert (=> b!1027921 m!946059))

(assert (=> bm!43289 d!122665))

(assert (=> b!1027823 d!122655))

(declare-fun d!122667 () Bool)

(declare-fun lt!452560 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!508 (List!21845) (InoxSet (_ BitVec 64)))

(assert (=> d!122667 (= lt!452560 (select (content!508 Nil!21842) (select (arr!31098 lt!452297) #b00000000000000000000000000000000)))))

(declare-fun e!580206 () Bool)

(assert (=> d!122667 (= lt!452560 e!580206)))

(declare-fun res!687925 () Bool)

(assert (=> d!122667 (=> (not res!687925) (not e!580206))))

(assert (=> d!122667 (= res!687925 ((_ is Cons!21841) Nil!21842))))

(assert (=> d!122667 (= (contains!5944 Nil!21842 (select (arr!31098 lt!452297) #b00000000000000000000000000000000)) lt!452560)))

(declare-fun b!1027926 () Bool)

(declare-fun e!580205 () Bool)

(assert (=> b!1027926 (= e!580206 e!580205)))

(declare-fun res!687926 () Bool)

(assert (=> b!1027926 (=> res!687926 e!580205)))

(assert (=> b!1027926 (= res!687926 (= (h!23039 Nil!21842) (select (arr!31098 lt!452297) #b00000000000000000000000000000000)))))

(declare-fun b!1027927 () Bool)

(assert (=> b!1027927 (= e!580205 (contains!5944 (t!30906 Nil!21842) (select (arr!31098 lt!452297) #b00000000000000000000000000000000)))))

(assert (= (and d!122667 res!687925) b!1027926))

(assert (= (and b!1027926 (not res!687926)) b!1027927))

(declare-fun m!946061 () Bool)

(assert (=> d!122667 m!946061))

(assert (=> d!122667 m!945813))

(declare-fun m!946063 () Bool)

(assert (=> d!122667 m!946063))

(assert (=> b!1027927 m!945813))

(declare-fun m!946065 () Bool)

(assert (=> b!1027927 m!946065))

(assert (=> b!1027714 d!122667))

(assert (=> b!1027780 d!122633))

(declare-fun d!122669 () Bool)

(declare-fun e!580208 () Bool)

(assert (=> d!122669 e!580208))

(declare-fun res!687927 () Bool)

(assert (=> d!122669 (=> res!687927 e!580208)))

(declare-fun lt!452563 () Bool)

(assert (=> d!122669 (= res!687927 (not lt!452563))))

(declare-fun lt!452564 () Bool)

(assert (=> d!122669 (= lt!452563 lt!452564)))

(declare-fun lt!452561 () Unit!33443)

(declare-fun e!580207 () Unit!33443)

(assert (=> d!122669 (= lt!452561 e!580207)))

(declare-fun c!103653 () Bool)

(assert (=> d!122669 (= c!103653 lt!452564)))

(assert (=> d!122669 (= lt!452564 (containsKey!559 (toList!6888 lt!452379) key!909))))

(assert (=> d!122669 (= (contains!5943 lt!452379 key!909) lt!452563)))

(declare-fun b!1027928 () Bool)

(declare-fun lt!452562 () Unit!33443)

(assert (=> b!1027928 (= e!580207 lt!452562)))

(assert (=> b!1027928 (= lt!452562 (lemmaContainsKeyImpliesGetValueByKeyDefined!391 (toList!6888 lt!452379) key!909))))

(assert (=> b!1027928 (isDefined!434 (getValueByKey!586 (toList!6888 lt!452379) key!909))))

(declare-fun b!1027929 () Bool)

(declare-fun Unit!33457 () Unit!33443)

(assert (=> b!1027929 (= e!580207 Unit!33457)))

(declare-fun b!1027930 () Bool)

(assert (=> b!1027930 (= e!580208 (isDefined!434 (getValueByKey!586 (toList!6888 lt!452379) key!909)))))

(assert (= (and d!122669 c!103653) b!1027928))

(assert (= (and d!122669 (not c!103653)) b!1027929))

(assert (= (and d!122669 (not res!687927)) b!1027930))

(declare-fun m!946067 () Bool)

(assert (=> d!122669 m!946067))

(declare-fun m!946069 () Bool)

(assert (=> b!1027928 m!946069))

(declare-fun m!946071 () Bool)

(assert (=> b!1027928 m!946071))

(assert (=> b!1027928 m!946071))

(declare-fun m!946073 () Bool)

(assert (=> b!1027928 m!946073))

(assert (=> b!1027930 m!946071))

(assert (=> b!1027930 m!946071))

(assert (=> b!1027930 m!946073))

(assert (=> d!122609 d!122669))

(declare-fun b!1027941 () Bool)

(declare-fun e!580215 () List!21844)

(declare-fun $colon$colon!600 (List!21844 tuple2!15620) List!21844)

(assert (=> b!1027941 (= e!580215 ($colon$colon!600 (removeStrictlySorted!50 (t!30905 (toList!6888 (getCurrentListMap!3855 (_keys!11240 thiss!1427) (_values!6118 thiss!1427) (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)))) key!909) (h!23038 (toList!6888 (getCurrentListMap!3855 (_keys!11240 thiss!1427) (_values!6118 thiss!1427) (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427))))))))

(declare-fun b!1027942 () Bool)

(declare-fun e!580217 () List!21844)

(assert (=> b!1027942 (= e!580217 (t!30905 (toList!6888 (getCurrentListMap!3855 (_keys!11240 thiss!1427) (_values!6118 thiss!1427) (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)))))))

(declare-fun b!1027943 () Bool)

(assert (=> b!1027943 (= e!580215 Nil!21841)))

(declare-fun b!1027944 () Bool)

(assert (=> b!1027944 (= e!580217 e!580215)))

(declare-fun c!103658 () Bool)

(assert (=> b!1027944 (= c!103658 (and ((_ is Cons!21840) (toList!6888 (getCurrentListMap!3855 (_keys!11240 thiss!1427) (_values!6118 thiss!1427) (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)))) (not (= (_1!7821 (h!23038 (toList!6888 (getCurrentListMap!3855 (_keys!11240 thiss!1427) (_values!6118 thiss!1427) (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427))))) key!909))))))

(declare-fun b!1027945 () Bool)

(declare-fun e!580216 () Bool)

(declare-fun lt!452567 () List!21844)

(assert (=> b!1027945 (= e!580216 (not (containsKey!559 lt!452567 key!909)))))

(declare-fun d!122671 () Bool)

(assert (=> d!122671 e!580216))

(declare-fun res!687930 () Bool)

(assert (=> d!122671 (=> (not res!687930) (not e!580216))))

(declare-fun isStrictlySorted!710 (List!21844) Bool)

(assert (=> d!122671 (= res!687930 (isStrictlySorted!710 lt!452567))))

(assert (=> d!122671 (= lt!452567 e!580217)))

(declare-fun c!103659 () Bool)

(assert (=> d!122671 (= c!103659 (and ((_ is Cons!21840) (toList!6888 (getCurrentListMap!3855 (_keys!11240 thiss!1427) (_values!6118 thiss!1427) (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)))) (= (_1!7821 (h!23038 (toList!6888 (getCurrentListMap!3855 (_keys!11240 thiss!1427) (_values!6118 thiss!1427) (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427))))) key!909)))))

(assert (=> d!122671 (isStrictlySorted!710 (toList!6888 (getCurrentListMap!3855 (_keys!11240 thiss!1427) (_values!6118 thiss!1427) (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427))))))

(assert (=> d!122671 (= (removeStrictlySorted!50 (toList!6888 (getCurrentListMap!3855 (_keys!11240 thiss!1427) (_values!6118 thiss!1427) (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427))) key!909) lt!452567)))

(assert (= (and d!122671 c!103659) b!1027942))

(assert (= (and d!122671 (not c!103659)) b!1027944))

(assert (= (and b!1027944 c!103658) b!1027941))

(assert (= (and b!1027944 (not c!103658)) b!1027943))

(assert (= (and d!122671 res!687930) b!1027945))

(declare-fun m!946075 () Bool)

(assert (=> b!1027941 m!946075))

(assert (=> b!1027941 m!946075))

(declare-fun m!946077 () Bool)

(assert (=> b!1027941 m!946077))

(declare-fun m!946079 () Bool)

(assert (=> b!1027945 m!946079))

(declare-fun m!946081 () Bool)

(assert (=> d!122671 m!946081))

(declare-fun m!946083 () Bool)

(assert (=> d!122671 m!946083))

(assert (=> d!122609 d!122671))

(declare-fun bm!43294 () Bool)

(declare-fun call!43297 () Bool)

(assert (=> bm!43294 (= call!43297 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11240 thiss!1427) (mask!29814 thiss!1427)))))

(declare-fun b!1027946 () Bool)

(declare-fun e!580219 () Bool)

(assert (=> b!1027946 (= e!580219 call!43297)))

(declare-fun b!1027947 () Bool)

(declare-fun e!580218 () Bool)

(assert (=> b!1027947 (= e!580218 e!580219)))

(declare-fun c!103660 () Bool)

(assert (=> b!1027947 (= c!103660 (validKeyInArray!0 (select (arr!31098 (_keys!11240 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!122673 () Bool)

(declare-fun res!687932 () Bool)

(assert (=> d!122673 (=> res!687932 e!580218)))

(assert (=> d!122673 (= res!687932 (bvsge #b00000000000000000000000000000000 (size!31613 (_keys!11240 thiss!1427))))))

(assert (=> d!122673 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11240 thiss!1427) (mask!29814 thiss!1427)) e!580218)))

(declare-fun b!1027948 () Bool)

(declare-fun e!580220 () Bool)

(assert (=> b!1027948 (= e!580220 call!43297)))

(declare-fun b!1027949 () Bool)

(assert (=> b!1027949 (= e!580219 e!580220)))

(declare-fun lt!452568 () (_ BitVec 64))

(assert (=> b!1027949 (= lt!452568 (select (arr!31098 (_keys!11240 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!452570 () Unit!33443)

(assert (=> b!1027949 (= lt!452570 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11240 thiss!1427) lt!452568 #b00000000000000000000000000000000))))

(assert (=> b!1027949 (arrayContainsKey!0 (_keys!11240 thiss!1427) lt!452568 #b00000000000000000000000000000000)))

(declare-fun lt!452569 () Unit!33443)

(assert (=> b!1027949 (= lt!452569 lt!452570)))

(declare-fun res!687931 () Bool)

(assert (=> b!1027949 (= res!687931 (= (seekEntryOrOpen!0 (select (arr!31098 (_keys!11240 thiss!1427)) #b00000000000000000000000000000000) (_keys!11240 thiss!1427) (mask!29814 thiss!1427)) (Found!9666 #b00000000000000000000000000000000)))))

(assert (=> b!1027949 (=> (not res!687931) (not e!580220))))

(assert (= (and d!122673 (not res!687932)) b!1027947))

(assert (= (and b!1027947 c!103660) b!1027949))

(assert (= (and b!1027947 (not c!103660)) b!1027946))

(assert (= (and b!1027949 res!687931) b!1027948))

(assert (= (or b!1027948 b!1027946) bm!43294))

(declare-fun m!946085 () Bool)

(assert (=> bm!43294 m!946085))

(assert (=> b!1027947 m!945885))

(assert (=> b!1027947 m!945885))

(assert (=> b!1027947 m!945887))

(assert (=> b!1027949 m!945885))

(declare-fun m!946087 () Bool)

(assert (=> b!1027949 m!946087))

(declare-fun m!946089 () Bool)

(assert (=> b!1027949 m!946089))

(assert (=> b!1027949 m!945885))

(declare-fun m!946091 () Bool)

(assert (=> b!1027949 m!946091))

(assert (=> b!1027674 d!122673))

(declare-fun d!122675 () Bool)

(declare-fun e!580221 () Bool)

(assert (=> d!122675 e!580221))

(declare-fun res!687933 () Bool)

(assert (=> d!122675 (=> (not res!687933) (not e!580221))))

(declare-fun lt!452572 () ListLongMap!13745)

(assert (=> d!122675 (= res!687933 (contains!5943 lt!452572 (_1!7821 (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))))))

(declare-fun lt!452571 () List!21844)

(assert (=> d!122675 (= lt!452572 (ListLongMap!13746 lt!452571))))

(declare-fun lt!452573 () Unit!33443)

(declare-fun lt!452574 () Unit!33443)

(assert (=> d!122675 (= lt!452573 lt!452574)))

(assert (=> d!122675 (= (getValueByKey!586 lt!452571 (_1!7821 (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))) (Some!636 (_2!7821 (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))))))

(assert (=> d!122675 (= lt!452574 (lemmaContainsTupThenGetReturnValue!276 lt!452571 (_1!7821 (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))) (_2!7821 (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))))))

(assert (=> d!122675 (= lt!452571 (insertStrictlySorted!369 (toList!6888 call!43292) (_1!7821 (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))) (_2!7821 (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))))))

(assert (=> d!122675 (= (+!3124 call!43292 (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))) lt!452572)))

(declare-fun b!1027950 () Bool)

(declare-fun res!687934 () Bool)

(assert (=> b!1027950 (=> (not res!687934) (not e!580221))))

(assert (=> b!1027950 (= res!687934 (= (getValueByKey!586 (toList!6888 lt!452572) (_1!7821 (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))) (Some!636 (_2!7821 (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))))))))

(declare-fun b!1027951 () Bool)

(assert (=> b!1027951 (= e!580221 (contains!5945 (toList!6888 lt!452572) (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))))))

(assert (= (and d!122675 res!687933) b!1027950))

(assert (= (and b!1027950 res!687934) b!1027951))

(declare-fun m!946093 () Bool)

(assert (=> d!122675 m!946093))

(declare-fun m!946095 () Bool)

(assert (=> d!122675 m!946095))

(declare-fun m!946097 () Bool)

(assert (=> d!122675 m!946097))

(declare-fun m!946099 () Bool)

(assert (=> d!122675 m!946099))

(declare-fun m!946101 () Bool)

(assert (=> b!1027950 m!946101))

(declare-fun m!946103 () Bool)

(assert (=> b!1027951 m!946103))

(assert (=> b!1027824 d!122675))

(assert (=> b!1027716 d!122633))

(declare-fun b!1027960 () Bool)

(declare-fun res!687945 () Bool)

(declare-fun e!580224 () Bool)

(assert (=> b!1027960 (=> (not res!687945) (not e!580224))))

(assert (=> b!1027960 (= res!687945 (and (= (size!31614 (_values!6118 thiss!1427)) (bvadd (mask!29814 thiss!1427) #b00000000000000000000000000000001)) (= (size!31613 (_keys!11240 thiss!1427)) (size!31614 (_values!6118 thiss!1427))) (bvsge (_size!2796 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2796 thiss!1427) (bvadd (mask!29814 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun b!1027961 () Bool)

(declare-fun res!687943 () Bool)

(assert (=> b!1027961 (=> (not res!687943) (not e!580224))))

(declare-fun size!31619 (LongMapFixedSize!5482) (_ BitVec 32))

(assert (=> b!1027961 (= res!687943 (bvsge (size!31619 thiss!1427) (_size!2796 thiss!1427)))))

(declare-fun b!1027963 () Bool)

(assert (=> b!1027963 (= e!580224 (and (bvsge (extraKeys!5827 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5827 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2796 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun d!122677 () Bool)

(declare-fun res!687944 () Bool)

(assert (=> d!122677 (=> (not res!687944) (not e!580224))))

(assert (=> d!122677 (= res!687944 (validMask!0 (mask!29814 thiss!1427)))))

(assert (=> d!122677 (= (simpleValid!391 thiss!1427) e!580224)))

(declare-fun b!1027962 () Bool)

(declare-fun res!687946 () Bool)

(assert (=> b!1027962 (=> (not res!687946) (not e!580224))))

(assert (=> b!1027962 (= res!687946 (= (size!31619 thiss!1427) (bvadd (_size!2796 thiss!1427) (bvsdiv (bvadd (extraKeys!5827 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!122677 res!687944) b!1027960))

(assert (= (and b!1027960 res!687945) b!1027961))

(assert (= (and b!1027961 res!687943) b!1027962))

(assert (= (and b!1027962 res!687946) b!1027963))

(declare-fun m!946105 () Bool)

(assert (=> b!1027961 m!946105))

(assert (=> d!122677 m!945787))

(assert (=> b!1027962 m!946105))

(assert (=> d!122601 d!122677))

(declare-fun d!122679 () Bool)

(declare-fun res!687947 () Bool)

(declare-fun e!580225 () Bool)

(assert (=> d!122679 (=> res!687947 e!580225)))

(assert (=> d!122679 (= res!687947 (= (select (arr!31098 lt!452297) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!909))))

(assert (=> d!122679 (= (arrayContainsKey!0 lt!452297 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!580225)))

(declare-fun b!1027964 () Bool)

(declare-fun e!580226 () Bool)

(assert (=> b!1027964 (= e!580225 e!580226)))

(declare-fun res!687948 () Bool)

(assert (=> b!1027964 (=> (not res!687948) (not e!580226))))

(assert (=> b!1027964 (= res!687948 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31613 lt!452297)))))

(declare-fun b!1027965 () Bool)

(assert (=> b!1027965 (= e!580226 (arrayContainsKey!0 lt!452297 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!122679 (not res!687947)) b!1027964))

(assert (= (and b!1027964 res!687948) b!1027965))

(assert (=> d!122679 m!945981))

(declare-fun m!946107 () Bool)

(assert (=> b!1027965 m!946107))

(assert (=> b!1027726 d!122679))

(declare-fun d!122681 () Bool)

(assert (=> d!122681 (= (validKeyInArray!0 (select (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294))) (and (not (= (select (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1027687 d!122681))

(declare-fun d!122683 () Bool)

(declare-fun e!580227 () Bool)

(assert (=> d!122683 e!580227))

(declare-fun res!687949 () Bool)

(assert (=> d!122683 (=> (not res!687949) (not e!580227))))

(declare-fun lt!452576 () ListLongMap!13745)

(assert (=> d!122683 (= res!687949 (contains!5943 lt!452576 (_1!7821 (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))))))

(declare-fun lt!452575 () List!21844)

(assert (=> d!122683 (= lt!452576 (ListLongMap!13746 lt!452575))))

(declare-fun lt!452577 () Unit!33443)

(declare-fun lt!452578 () Unit!33443)

(assert (=> d!122683 (= lt!452577 lt!452578)))

(assert (=> d!122683 (= (getValueByKey!586 lt!452575 (_1!7821 (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))) (Some!636 (_2!7821 (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))))))

(assert (=> d!122683 (= lt!452578 (lemmaContainsTupThenGetReturnValue!276 lt!452575 (_1!7821 (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))) (_2!7821 (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))))))

(assert (=> d!122683 (= lt!452575 (insertStrictlySorted!369 (toList!6888 call!43281) (_1!7821 (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))) (_2!7821 (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))))))

(assert (=> d!122683 (= (+!3124 call!43281 (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))) lt!452576)))

(declare-fun b!1027966 () Bool)

(declare-fun res!687950 () Bool)

(assert (=> b!1027966 (=> (not res!687950) (not e!580227))))

(assert (=> b!1027966 (= res!687950 (= (getValueByKey!586 (toList!6888 lt!452576) (_1!7821 (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))) (Some!636 (_2!7821 (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))))))))

(declare-fun b!1027967 () Bool)

(assert (=> b!1027967 (= e!580227 (contains!5945 (toList!6888 lt!452576) (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))))))

(assert (= (and d!122683 res!687949) b!1027966))

(assert (= (and b!1027966 res!687950) b!1027967))

(declare-fun m!946109 () Bool)

(assert (=> d!122683 m!946109))

(declare-fun m!946111 () Bool)

(assert (=> d!122683 m!946111))

(declare-fun m!946113 () Bool)

(assert (=> d!122683 m!946113))

(declare-fun m!946115 () Bool)

(assert (=> d!122683 m!946115))

(declare-fun m!946117 () Bool)

(assert (=> b!1027966 m!946117))

(declare-fun m!946119 () Bool)

(assert (=> b!1027967 m!946119))

(assert (=> b!1027781 d!122683))

(assert (=> d!122617 d!122653))

(declare-fun b!1027980 () Bool)

(declare-fun e!580235 () SeekEntryResult!9666)

(assert (=> b!1027980 (= e!580235 (MissingVacant!9666 (index!41037 lt!452364)))))

(declare-fun d!122685 () Bool)

(declare-fun lt!452583 () SeekEntryResult!9666)

(assert (=> d!122685 (and (or ((_ is Undefined!9666) lt!452583) (not ((_ is Found!9666) lt!452583)) (and (bvsge (index!41036 lt!452583) #b00000000000000000000000000000000) (bvslt (index!41036 lt!452583) (size!31613 (_keys!11240 thiss!1427))))) (or ((_ is Undefined!9666) lt!452583) ((_ is Found!9666) lt!452583) (not ((_ is MissingVacant!9666) lt!452583)) (not (= (index!41038 lt!452583) (index!41037 lt!452364))) (and (bvsge (index!41038 lt!452583) #b00000000000000000000000000000000) (bvslt (index!41038 lt!452583) (size!31613 (_keys!11240 thiss!1427))))) (or ((_ is Undefined!9666) lt!452583) (ite ((_ is Found!9666) lt!452583) (= (select (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452583)) key!909) (and ((_ is MissingVacant!9666) lt!452583) (= (index!41038 lt!452583) (index!41037 lt!452364)) (= (select (arr!31098 (_keys!11240 thiss!1427)) (index!41038 lt!452583)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!580236 () SeekEntryResult!9666)

(assert (=> d!122685 (= lt!452583 e!580236)))

(declare-fun c!103667 () Bool)

(assert (=> d!122685 (= c!103667 (bvsge (x!91447 lt!452364) #b01111111111111111111111111111110))))

(declare-fun lt!452584 () (_ BitVec 64))

(assert (=> d!122685 (= lt!452584 (select (arr!31098 (_keys!11240 thiss!1427)) (index!41037 lt!452364)))))

(assert (=> d!122685 (validMask!0 (mask!29814 thiss!1427))))

(assert (=> d!122685 (= (seekKeyOrZeroReturnVacant!0 (x!91447 lt!452364) (index!41037 lt!452364) (index!41037 lt!452364) key!909 (_keys!11240 thiss!1427) (mask!29814 thiss!1427)) lt!452583)))

(declare-fun b!1027981 () Bool)

(declare-fun e!580234 () SeekEntryResult!9666)

(assert (=> b!1027981 (= e!580236 e!580234)))

(declare-fun c!103669 () Bool)

(assert (=> b!1027981 (= c!103669 (= lt!452584 key!909))))

(declare-fun b!1027982 () Bool)

(assert (=> b!1027982 (= e!580235 (seekKeyOrZeroReturnVacant!0 (bvadd (x!91447 lt!452364) #b00000000000000000000000000000001) (nextIndex!0 (index!41037 lt!452364) (x!91447 lt!452364) (mask!29814 thiss!1427)) (index!41037 lt!452364) key!909 (_keys!11240 thiss!1427) (mask!29814 thiss!1427)))))

(declare-fun b!1027983 () Bool)

(assert (=> b!1027983 (= e!580234 (Found!9666 (index!41037 lt!452364)))))

(declare-fun b!1027984 () Bool)

(assert (=> b!1027984 (= e!580236 Undefined!9666)))

(declare-fun b!1027985 () Bool)

(declare-fun c!103668 () Bool)

(assert (=> b!1027985 (= c!103668 (= lt!452584 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1027985 (= e!580234 e!580235)))

(assert (= (and d!122685 c!103667) b!1027984))

(assert (= (and d!122685 (not c!103667)) b!1027981))

(assert (= (and b!1027981 c!103669) b!1027983))

(assert (= (and b!1027981 (not c!103669)) b!1027985))

(assert (= (and b!1027985 c!103668) b!1027980))

(assert (= (and b!1027985 (not c!103668)) b!1027982))

(declare-fun m!946121 () Bool)

(assert (=> d!122685 m!946121))

(declare-fun m!946123 () Bool)

(assert (=> d!122685 m!946123))

(assert (=> d!122685 m!945789))

(assert (=> d!122685 m!945787))

(declare-fun m!946125 () Bool)

(assert (=> b!1027982 m!946125))

(assert (=> b!1027982 m!946125))

(declare-fun m!946127 () Bool)

(assert (=> b!1027982 m!946127))

(assert (=> b!1027661 d!122685))

(declare-fun d!122687 () Bool)

(declare-fun e!580237 () Bool)

(assert (=> d!122687 e!580237))

(declare-fun res!687951 () Bool)

(assert (=> d!122687 (=> (not res!687951) (not e!580237))))

(declare-fun lt!452586 () ListLongMap!13745)

(assert (=> d!122687 (= res!687951 (contains!5943 lt!452586 (_1!7821 (ite (or c!103620 c!103623) (tuple2!15621 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))))))))

(declare-fun lt!452585 () List!21844)

(assert (=> d!122687 (= lt!452586 (ListLongMap!13746 lt!452585))))

(declare-fun lt!452587 () Unit!33443)

(declare-fun lt!452588 () Unit!33443)

(assert (=> d!122687 (= lt!452587 lt!452588)))

(assert (=> d!122687 (= (getValueByKey!586 lt!452585 (_1!7821 (ite (or c!103620 c!103623) (tuple2!15621 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))))) (Some!636 (_2!7821 (ite (or c!103620 c!103623) (tuple2!15621 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))))))))

(assert (=> d!122687 (= lt!452588 (lemmaContainsTupThenGetReturnValue!276 lt!452585 (_1!7821 (ite (or c!103620 c!103623) (tuple2!15621 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))) (_2!7821 (ite (or c!103620 c!103623) (tuple2!15621 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))))))))

(assert (=> d!122687 (= lt!452585 (insertStrictlySorted!369 (toList!6888 (ite c!103620 call!43289 (ite c!103623 call!43293 call!43291))) (_1!7821 (ite (or c!103620 c!103623) (tuple2!15621 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))) (_2!7821 (ite (or c!103620 c!103623) (tuple2!15621 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))))))))

(assert (=> d!122687 (= (+!3124 (ite c!103620 call!43289 (ite c!103623 call!43293 call!43291)) (ite (or c!103620 c!103623) (tuple2!15621 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))) lt!452586)))

(declare-fun b!1027986 () Bool)

(declare-fun res!687952 () Bool)

(assert (=> b!1027986 (=> (not res!687952) (not e!580237))))

(assert (=> b!1027986 (= res!687952 (= (getValueByKey!586 (toList!6888 lt!452586) (_1!7821 (ite (or c!103620 c!103623) (tuple2!15621 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))))) (Some!636 (_2!7821 (ite (or c!103620 c!103623) (tuple2!15621 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))))))))

(declare-fun b!1027987 () Bool)

(assert (=> b!1027987 (= e!580237 (contains!5945 (toList!6888 lt!452586) (ite (or c!103620 c!103623) (tuple2!15621 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))))))

(assert (= (and d!122687 res!687951) b!1027986))

(assert (= (and b!1027986 res!687952) b!1027987))

(declare-fun m!946129 () Bool)

(assert (=> d!122687 m!946129))

(declare-fun m!946131 () Bool)

(assert (=> d!122687 m!946131))

(declare-fun m!946133 () Bool)

(assert (=> d!122687 m!946133))

(declare-fun m!946135 () Bool)

(assert (=> d!122687 m!946135))

(declare-fun m!946137 () Bool)

(assert (=> b!1027986 m!946137))

(declare-fun m!946139 () Bool)

(assert (=> b!1027987 m!946139))

(assert (=> bm!43292 d!122687))

(assert (=> b!1027720 d!122609))

(assert (=> b!1027720 d!122629))

(declare-fun b!1027988 () Bool)

(declare-fun e!580248 () Bool)

(declare-fun e!580244 () Bool)

(assert (=> b!1027988 (= e!580248 e!580244)))

(declare-fun c!103671 () Bool)

(assert (=> b!1027988 (= c!103671 (not (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!43295 () Bool)

(declare-fun call!43304 () ListLongMap!13745)

(declare-fun call!43301 () ListLongMap!13745)

(assert (=> bm!43295 (= call!43304 call!43301)))

(declare-fun d!122689 () Bool)

(assert (=> d!122689 e!580248))

(declare-fun res!687961 () Bool)

(assert (=> d!122689 (=> (not res!687961) (not e!580248))))

(assert (=> d!122689 (= res!687961 (or (bvsge #b00000000000000000000000000000000 (size!31613 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31613 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427))))))))))

(declare-fun lt!452601 () ListLongMap!13745)

(declare-fun lt!452602 () ListLongMap!13745)

(assert (=> d!122689 (= lt!452601 lt!452602)))

(declare-fun lt!452598 () Unit!33443)

(declare-fun e!580239 () Unit!33443)

(assert (=> d!122689 (= lt!452598 e!580239)))

(declare-fun c!103672 () Bool)

(declare-fun e!580242 () Bool)

(assert (=> d!122689 (= c!103672 e!580242)))

(declare-fun res!687953 () Bool)

(assert (=> d!122689 (=> (not res!687953) (not e!580242))))

(assert (=> d!122689 (= res!687953 (bvslt #b00000000000000000000000000000000 (size!31613 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427))))))))

(declare-fun e!580250 () ListLongMap!13745)

(assert (=> d!122689 (= lt!452602 e!580250)))

(declare-fun c!103670 () Bool)

(assert (=> d!122689 (= c!103670 (and (not (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!122689 (validMask!0 (mask!29814 thiss!1427))))

(assert (=> d!122689 (= (getCurrentListMap!3855 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427))) (array!64584 (store (arr!31099 (_values!6118 thiss!1427)) (index!41036 lt!452294) (ValueCellFull!11444 (dynLambda!1942 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31614 (_values!6118 thiss!1427))) (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)) lt!452601)))

(declare-fun b!1027989 () Bool)

(declare-fun e!580245 () Bool)

(assert (=> b!1027989 (= e!580245 (validKeyInArray!0 (select (arr!31098 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1027990 () Bool)

(declare-fun e!580246 () Bool)

(declare-fun e!580238 () Bool)

(assert (=> b!1027990 (= e!580246 e!580238)))

(declare-fun res!687956 () Bool)

(assert (=> b!1027990 (=> (not res!687956) (not e!580238))))

(assert (=> b!1027990 (= res!687956 (contains!5943 lt!452601 (select (arr!31098 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (=> b!1027990 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31613 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427))))))))

(declare-fun b!1027991 () Bool)

(declare-fun e!580243 () Bool)

(assert (=> b!1027991 (= e!580244 e!580243)))

(declare-fun res!687959 () Bool)

(declare-fun call!43303 () Bool)

(assert (=> b!1027991 (= res!687959 call!43303)))

(assert (=> b!1027991 (=> (not res!687959) (not e!580243))))

(declare-fun b!1027992 () Bool)

(declare-fun e!580241 () Bool)

(assert (=> b!1027992 (= e!580241 (= (apply!893 lt!452601 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5931 thiss!1427)))))

(declare-fun bm!43296 () Bool)

(declare-fun call!43300 () ListLongMap!13745)

(declare-fun call!43302 () ListLongMap!13745)

(assert (=> bm!43296 (= call!43300 call!43302)))

(declare-fun bm!43297 () Bool)

(assert (=> bm!43297 (= call!43303 (contains!5943 lt!452601 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1027993 () Bool)

(declare-fun e!580249 () ListLongMap!13745)

(assert (=> b!1027993 (= e!580249 call!43304)))

(declare-fun b!1027994 () Bool)

(declare-fun Unit!33458 () Unit!33443)

(assert (=> b!1027994 (= e!580239 Unit!33458)))

(declare-fun b!1027995 () Bool)

(assert (=> b!1027995 (= e!580238 (= (apply!893 lt!452601 (select (arr!31098 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427)))) #b00000000000000000000000000000000)) (get!16336 (select (arr!31099 (array!64584 (store (arr!31099 (_values!6118 thiss!1427)) (index!41036 lt!452294) (ValueCellFull!11444 (dynLambda!1942 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31614 (_values!6118 thiss!1427)))) #b00000000000000000000000000000000) (dynLambda!1942 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1027995 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31614 (array!64584 (store (arr!31099 (_values!6118 thiss!1427)) (index!41036 lt!452294) (ValueCellFull!11444 (dynLambda!1942 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31614 (_values!6118 thiss!1427))))))))

(assert (=> b!1027995 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31613 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427))))))))

(declare-fun bm!43298 () Bool)

(declare-fun call!43299 () Bool)

(assert (=> bm!43298 (= call!43299 (contains!5943 lt!452601 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1027996 () Bool)

(declare-fun e!580240 () ListLongMap!13745)

(assert (=> b!1027996 (= e!580240 call!43304)))

(declare-fun b!1027997 () Bool)

(declare-fun c!103675 () Bool)

(assert (=> b!1027997 (= c!103675 (and (not (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1027997 (= e!580249 e!580240)))

(declare-fun bm!43299 () Bool)

(declare-fun call!43298 () ListLongMap!13745)

(assert (=> bm!43299 (= call!43302 call!43298)))

(declare-fun b!1027998 () Bool)

(declare-fun e!580247 () Bool)

(assert (=> b!1027998 (= e!580247 (not call!43299))))

(declare-fun b!1027999 () Bool)

(assert (=> b!1027999 (= e!580242 (validKeyInArray!0 (select (arr!31098 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun bm!43300 () Bool)

(assert (=> bm!43300 (= call!43298 (getCurrentListMapNoExtraKeys!3559 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427))) (array!64584 (store (arr!31099 (_values!6118 thiss!1427)) (index!41036 lt!452294) (ValueCellFull!11444 (dynLambda!1942 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31614 (_values!6118 thiss!1427))) (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)))))

(declare-fun b!1028000 () Bool)

(assert (=> b!1028000 (= e!580250 (+!3124 call!43301 (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427))))))

(declare-fun b!1028001 () Bool)

(declare-fun lt!452593 () Unit!33443)

(assert (=> b!1028001 (= e!580239 lt!452593)))

(declare-fun lt!452596 () ListLongMap!13745)

(assert (=> b!1028001 (= lt!452596 (getCurrentListMapNoExtraKeys!3559 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427))) (array!64584 (store (arr!31099 (_values!6118 thiss!1427)) (index!41036 lt!452294) (ValueCellFull!11444 (dynLambda!1942 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31614 (_values!6118 thiss!1427))) (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)))))

(declare-fun lt!452591 () (_ BitVec 64))

(assert (=> b!1028001 (= lt!452591 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452603 () (_ BitVec 64))

(assert (=> b!1028001 (= lt!452603 (select (arr!31098 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!452609 () Unit!33443)

(assert (=> b!1028001 (= lt!452609 (addStillContains!612 lt!452596 lt!452591 (zeroValue!5931 thiss!1427) lt!452603))))

(assert (=> b!1028001 (contains!5943 (+!3124 lt!452596 (tuple2!15621 lt!452591 (zeroValue!5931 thiss!1427))) lt!452603)))

(declare-fun lt!452594 () Unit!33443)

(assert (=> b!1028001 (= lt!452594 lt!452609)))

(declare-fun lt!452606 () ListLongMap!13745)

(assert (=> b!1028001 (= lt!452606 (getCurrentListMapNoExtraKeys!3559 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427))) (array!64584 (store (arr!31099 (_values!6118 thiss!1427)) (index!41036 lt!452294) (ValueCellFull!11444 (dynLambda!1942 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31614 (_values!6118 thiss!1427))) (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)))))

(declare-fun lt!452597 () (_ BitVec 64))

(assert (=> b!1028001 (= lt!452597 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452592 () (_ BitVec 64))

(assert (=> b!1028001 (= lt!452592 (select (arr!31098 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!452607 () Unit!33443)

(assert (=> b!1028001 (= lt!452607 (addApplyDifferent!468 lt!452606 lt!452597 (minValue!5931 thiss!1427) lt!452592))))

(assert (=> b!1028001 (= (apply!893 (+!3124 lt!452606 (tuple2!15621 lt!452597 (minValue!5931 thiss!1427))) lt!452592) (apply!893 lt!452606 lt!452592))))

(declare-fun lt!452608 () Unit!33443)

(assert (=> b!1028001 (= lt!452608 lt!452607)))

(declare-fun lt!452600 () ListLongMap!13745)

(assert (=> b!1028001 (= lt!452600 (getCurrentListMapNoExtraKeys!3559 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427))) (array!64584 (store (arr!31099 (_values!6118 thiss!1427)) (index!41036 lt!452294) (ValueCellFull!11444 (dynLambda!1942 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31614 (_values!6118 thiss!1427))) (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)))))

(declare-fun lt!452605 () (_ BitVec 64))

(assert (=> b!1028001 (= lt!452605 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452589 () (_ BitVec 64))

(assert (=> b!1028001 (= lt!452589 (select (arr!31098 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!452604 () Unit!33443)

(assert (=> b!1028001 (= lt!452604 (addApplyDifferent!468 lt!452600 lt!452605 (zeroValue!5931 thiss!1427) lt!452589))))

(assert (=> b!1028001 (= (apply!893 (+!3124 lt!452600 (tuple2!15621 lt!452605 (zeroValue!5931 thiss!1427))) lt!452589) (apply!893 lt!452600 lt!452589))))

(declare-fun lt!452599 () Unit!33443)

(assert (=> b!1028001 (= lt!452599 lt!452604)))

(declare-fun lt!452610 () ListLongMap!13745)

(assert (=> b!1028001 (= lt!452610 (getCurrentListMapNoExtraKeys!3559 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427))) (array!64584 (store (arr!31099 (_values!6118 thiss!1427)) (index!41036 lt!452294) (ValueCellFull!11444 (dynLambda!1942 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31614 (_values!6118 thiss!1427))) (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)))))

(declare-fun lt!452595 () (_ BitVec 64))

(assert (=> b!1028001 (= lt!452595 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!452590 () (_ BitVec 64))

(assert (=> b!1028001 (= lt!452590 (select (arr!31098 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427)))) #b00000000000000000000000000000000))))

(assert (=> b!1028001 (= lt!452593 (addApplyDifferent!468 lt!452610 lt!452595 (minValue!5931 thiss!1427) lt!452590))))

(assert (=> b!1028001 (= (apply!893 (+!3124 lt!452610 (tuple2!15621 lt!452595 (minValue!5931 thiss!1427))) lt!452590) (apply!893 lt!452610 lt!452590))))

(declare-fun b!1028002 () Bool)

(declare-fun res!687954 () Bool)

(assert (=> b!1028002 (=> (not res!687954) (not e!580248))))

(assert (=> b!1028002 (= res!687954 e!580246)))

(declare-fun res!687960 () Bool)

(assert (=> b!1028002 (=> res!687960 e!580246)))

(assert (=> b!1028002 (= res!687960 (not e!580245))))

(declare-fun res!687955 () Bool)

(assert (=> b!1028002 (=> (not res!687955) (not e!580245))))

(assert (=> b!1028002 (= res!687955 (bvslt #b00000000000000000000000000000000 (size!31613 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427))))))))

(declare-fun b!1028003 () Bool)

(assert (=> b!1028003 (= e!580244 (not call!43303))))

(declare-fun c!103673 () Bool)

(declare-fun bm!43301 () Bool)

(assert (=> bm!43301 (= call!43301 (+!3124 (ite c!103670 call!43298 (ite c!103673 call!43302 call!43300)) (ite (or c!103670 c!103673) (tuple2!15621 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5931 thiss!1427)) (tuple2!15621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5931 thiss!1427)))))))

(declare-fun b!1028004 () Bool)

(assert (=> b!1028004 (= e!580240 call!43300)))

(declare-fun b!1028005 () Bool)

(assert (=> b!1028005 (= e!580250 e!580249)))

(assert (=> b!1028005 (= c!103673 (and (not (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1028006 () Bool)

(declare-fun res!687957 () Bool)

(assert (=> b!1028006 (=> (not res!687957) (not e!580248))))

(assert (=> b!1028006 (= res!687957 e!580247)))

(declare-fun c!103674 () Bool)

(assert (=> b!1028006 (= c!103674 (not (= (bvand (extraKeys!5827 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1028007 () Bool)

(assert (=> b!1028007 (= e!580247 e!580241)))

(declare-fun res!687958 () Bool)

(assert (=> b!1028007 (= res!687958 call!43299)))

(assert (=> b!1028007 (=> (not res!687958) (not e!580241))))

(declare-fun b!1028008 () Bool)

(assert (=> b!1028008 (= e!580243 (= (apply!893 lt!452601 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5931 thiss!1427)))))

(assert (= (and d!122689 c!103670) b!1028000))

(assert (= (and d!122689 (not c!103670)) b!1028005))

(assert (= (and b!1028005 c!103673) b!1027993))

(assert (= (and b!1028005 (not c!103673)) b!1027997))

(assert (= (and b!1027997 c!103675) b!1027996))

(assert (= (and b!1027997 (not c!103675)) b!1028004))

(assert (= (or b!1027996 b!1028004) bm!43296))

(assert (= (or b!1027993 bm!43296) bm!43299))

(assert (= (or b!1027993 b!1027996) bm!43295))

(assert (= (or b!1028000 bm!43299) bm!43300))

(assert (= (or b!1028000 bm!43295) bm!43301))

(assert (= (and d!122689 res!687953) b!1027999))

(assert (= (and d!122689 c!103672) b!1028001))

(assert (= (and d!122689 (not c!103672)) b!1027994))

(assert (= (and d!122689 res!687961) b!1028002))

(assert (= (and b!1028002 res!687955) b!1027989))

(assert (= (and b!1028002 (not res!687960)) b!1027990))

(assert (= (and b!1027990 res!687956) b!1027995))

(assert (= (and b!1028002 res!687954) b!1028006))

(assert (= (and b!1028006 c!103674) b!1028007))

(assert (= (and b!1028006 (not c!103674)) b!1027998))

(assert (= (and b!1028007 res!687958) b!1027992))

(assert (= (or b!1028007 b!1027998) bm!43298))

(assert (= (and b!1028006 res!687957) b!1027988))

(assert (= (and b!1027988 c!103671) b!1027991))

(assert (= (and b!1027988 (not c!103671)) b!1028003))

(assert (= (and b!1027991 res!687959) b!1028008))

(assert (= (or b!1027991 b!1028003) bm!43297))

(declare-fun b_lambda!15737 () Bool)

(assert (=> (not b_lambda!15737) (not b!1027995)))

(assert (=> b!1027995 t!30904))

(declare-fun b_and!32825 () Bool)

(assert (= b_and!32823 (and (=> t!30904 result!14095) b_and!32825)))

(declare-fun m!946141 () Bool)

(assert (=> b!1027992 m!946141))

(declare-fun m!946143 () Bool)

(assert (=> b!1028000 m!946143))

(declare-fun m!946145 () Bool)

(assert (=> b!1027989 m!946145))

(assert (=> b!1027989 m!946145))

(declare-fun m!946147 () Bool)

(assert (=> b!1027989 m!946147))

(declare-fun m!946149 () Bool)

(assert (=> bm!43298 m!946149))

(declare-fun m!946151 () Bool)

(assert (=> bm!43300 m!946151))

(declare-fun m!946153 () Bool)

(assert (=> bm!43297 m!946153))

(declare-fun m!946155 () Bool)

(assert (=> b!1028008 m!946155))

(assert (=> b!1027990 m!946145))

(assert (=> b!1027990 m!946145))

(declare-fun m!946157 () Bool)

(assert (=> b!1027990 m!946157))

(assert (=> d!122689 m!945787))

(assert (=> b!1027999 m!946145))

(assert (=> b!1027999 m!946145))

(assert (=> b!1027999 m!946147))

(declare-fun m!946159 () Bool)

(assert (=> b!1028001 m!946159))

(declare-fun m!946161 () Bool)

(assert (=> b!1028001 m!946161))

(declare-fun m!946163 () Bool)

(assert (=> b!1028001 m!946163))

(declare-fun m!946165 () Bool)

(assert (=> b!1028001 m!946165))

(declare-fun m!946167 () Bool)

(assert (=> b!1028001 m!946167))

(declare-fun m!946169 () Bool)

(assert (=> b!1028001 m!946169))

(declare-fun m!946171 () Bool)

(assert (=> b!1028001 m!946171))

(declare-fun m!946173 () Bool)

(assert (=> b!1028001 m!946173))

(declare-fun m!946175 () Bool)

(assert (=> b!1028001 m!946175))

(assert (=> b!1028001 m!946161))

(declare-fun m!946177 () Bool)

(assert (=> b!1028001 m!946177))

(assert (=> b!1028001 m!946165))

(declare-fun m!946179 () Bool)

(assert (=> b!1028001 m!946179))

(declare-fun m!946181 () Bool)

(assert (=> b!1028001 m!946181))

(declare-fun m!946183 () Bool)

(assert (=> b!1028001 m!946183))

(assert (=> b!1028001 m!946179))

(assert (=> b!1028001 m!946173))

(declare-fun m!946185 () Bool)

(assert (=> b!1028001 m!946185))

(declare-fun m!946187 () Bool)

(assert (=> b!1028001 m!946187))

(assert (=> b!1028001 m!946151))

(assert (=> b!1028001 m!946145))

(declare-fun m!946189 () Bool)

(assert (=> bm!43301 m!946189))

(assert (=> b!1027995 m!946145))

(declare-fun m!946191 () Bool)

(assert (=> b!1027995 m!946191))

(declare-fun m!946193 () Bool)

(assert (=> b!1027995 m!946193))

(assert (=> b!1027995 m!946193))

(assert (=> b!1027995 m!945679))

(declare-fun m!946195 () Bool)

(assert (=> b!1027995 m!946195))

(assert (=> b!1027995 m!946145))

(assert (=> b!1027995 m!945679))

(assert (=> b!1027720 d!122689))

(assert (=> b!1027770 d!122633))

(declare-fun d!122691 () Bool)

(assert (=> d!122691 (= (-!480 (getCurrentListMap!3855 (_keys!11240 thiss!1427) (_values!6118 thiss!1427) (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)) key!909) (getCurrentListMap!3855 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427))) (array!64584 (store (arr!31099 (_values!6118 thiss!1427)) (index!41036 lt!452294) (ValueCellFull!11444 (dynLambda!1942 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31614 (_values!6118 thiss!1427))) (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)))))

(assert (=> d!122691 true))

(declare-fun _$9!35 () Unit!33443)

(assert (=> d!122691 (= (choose!1689 (_keys!11240 thiss!1427) (_values!6118 thiss!1427) (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) (index!41036 lt!452294) key!909 (defaultEntry!6095 thiss!1427)) _$9!35)))

(declare-fun b_lambda!15739 () Bool)

(assert (=> (not b_lambda!15739) (not d!122691)))

(assert (=> d!122691 t!30904))

(declare-fun b_and!32827 () Bool)

(assert (= b_and!32825 (and (=> t!30904 result!14095) b_and!32827)))

(assert (=> d!122691 m!945671))

(assert (=> d!122691 m!945673))

(assert (=> d!122691 m!945657))

(assert (=> d!122691 m!945679))

(assert (=> d!122691 m!945827))

(assert (=> d!122691 m!945665))

(assert (=> d!122691 m!945671))

(assert (=> d!122613 d!122691))

(assert (=> d!122613 d!122653))

(declare-fun d!122693 () Bool)

(declare-fun lt!452611 () (_ BitVec 32))

(assert (=> d!122693 (and (bvsge lt!452611 #b00000000000000000000000000000000) (bvsle lt!452611 (bvsub (size!31613 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun e!580252 () (_ BitVec 32))

(assert (=> d!122693 (= lt!452611 e!580252)))

(declare-fun c!103677 () Bool)

(assert (=> d!122693 (= c!103677 (bvsge #b00000000000000000000000000000000 (size!31613 (_keys!11240 thiss!1427))))))

(assert (=> d!122693 (and (bvsle #b00000000000000000000000000000000 (size!31613 (_keys!11240 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31613 (_keys!11240 thiss!1427)) (size!31613 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427))))))))

(assert (=> d!122693 (= (arrayCountValidKeys!0 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427))) #b00000000000000000000000000000000 (size!31613 (_keys!11240 thiss!1427))) lt!452611)))

(declare-fun bm!43302 () Bool)

(declare-fun call!43305 () (_ BitVec 32))

(assert (=> bm!43302 (= call!43305 (arrayCountValidKeys!0 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31613 (_keys!11240 thiss!1427))))))

(declare-fun b!1028009 () Bool)

(declare-fun e!580251 () (_ BitVec 32))

(assert (=> b!1028009 (= e!580252 e!580251)))

(declare-fun c!103676 () Bool)

(assert (=> b!1028009 (= c!103676 (validKeyInArray!0 (select (arr!31098 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1028010 () Bool)

(assert (=> b!1028010 (= e!580252 #b00000000000000000000000000000000)))

(declare-fun b!1028011 () Bool)

(assert (=> b!1028011 (= e!580251 call!43305)))

(declare-fun b!1028012 () Bool)

(assert (=> b!1028012 (= e!580251 (bvadd #b00000000000000000000000000000001 call!43305))))

(assert (= (and d!122693 c!103677) b!1028010))

(assert (= (and d!122693 (not c!103677)) b!1028009))

(assert (= (and b!1028009 c!103676) b!1028012))

(assert (= (and b!1028009 (not c!103676)) b!1028011))

(assert (= (or b!1028012 b!1028011) bm!43302))

(declare-fun m!946197 () Bool)

(assert (=> bm!43302 m!946197))

(assert (=> b!1028009 m!946145))

(assert (=> b!1028009 m!946145))

(assert (=> b!1028009 m!946147))

(assert (=> b!1027690 d!122693))

(assert (=> b!1027690 d!122619))

(declare-fun d!122695 () Bool)

(assert (=> d!122695 (= (arrayCountValidKeys!0 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427))) #b00000000000000000000000000000000 (size!31613 (_keys!11240 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11240 thiss!1427) #b00000000000000000000000000000000 (size!31613 (_keys!11240 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> d!122695 true))

(declare-fun _$79!8 () Unit!33443)

(assert (=> d!122695 (= (choose!82 (_keys!11240 thiss!1427) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) _$79!8)))

(declare-fun bs!29969 () Bool)

(assert (= bs!29969 d!122695))

(assert (=> bs!29969 m!945665))

(assert (=> bs!29969 m!945805))

(assert (=> bs!29969 m!945667))

(assert (=> d!122605 d!122695))

(declare-fun d!122697 () Bool)

(assert (=> d!122697 (= (apply!893 lt!452439 #b1000000000000000000000000000000000000000000000000000000000000000) (get!16337 (getValueByKey!586 (toList!6888 lt!452439) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!29970 () Bool)

(assert (= bs!29970 d!122697))

(assert (=> bs!29970 m!946037))

(assert (=> bs!29970 m!946037))

(declare-fun m!946199 () Bool)

(assert (=> bs!29970 m!946199))

(assert (=> b!1027789 d!122697))

(declare-fun d!122699 () Bool)

(declare-fun lt!452612 () (_ BitVec 32))

(assert (=> d!122699 (and (bvsge lt!452612 #b00000000000000000000000000000000) (bvsle lt!452612 (bvsub (size!31613 lt!452297) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!580254 () (_ BitVec 32))

(assert (=> d!122699 (= lt!452612 e!580254)))

(declare-fun c!103679 () Bool)

(assert (=> d!122699 (= c!103679 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31613 (_keys!11240 thiss!1427))))))

(assert (=> d!122699 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31613 (_keys!11240 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!31613 (_keys!11240 thiss!1427)) (size!31613 lt!452297)))))

(assert (=> d!122699 (= (arrayCountValidKeys!0 lt!452297 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31613 (_keys!11240 thiss!1427))) lt!452612)))

(declare-fun bm!43303 () Bool)

(declare-fun call!43306 () (_ BitVec 32))

(assert (=> bm!43303 (= call!43306 (arrayCountValidKeys!0 lt!452297 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31613 (_keys!11240 thiss!1427))))))

(declare-fun b!1028013 () Bool)

(declare-fun e!580253 () (_ BitVec 32))

(assert (=> b!1028013 (= e!580254 e!580253)))

(declare-fun c!103678 () Bool)

(assert (=> b!1028013 (= c!103678 (validKeyInArray!0 (select (arr!31098 lt!452297) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1028014 () Bool)

(assert (=> b!1028014 (= e!580254 #b00000000000000000000000000000000)))

(declare-fun b!1028015 () Bool)

(assert (=> b!1028015 (= e!580253 call!43306)))

(declare-fun b!1028016 () Bool)

(assert (=> b!1028016 (= e!580253 (bvadd #b00000000000000000000000000000001 call!43306))))

(assert (= (and d!122699 c!103679) b!1028014))

(assert (= (and d!122699 (not c!103679)) b!1028013))

(assert (= (and b!1028013 c!103678) b!1028016))

(assert (= (and b!1028013 (not c!103678)) b!1028015))

(assert (= (or b!1028016 b!1028015) bm!43303))

(declare-fun m!946201 () Bool)

(assert (=> bm!43303 m!946201))

(assert (=> b!1028013 m!945981))

(assert (=> b!1028013 m!945981))

(assert (=> b!1028013 m!945983))

(assert (=> bm!43257 d!122699))

(declare-fun d!122701 () Bool)

(assert (=> d!122701 (not (arrayContainsKey!0 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427))) key!909 #b00000000000000000000000000000000))))

(assert (=> d!122701 true))

(declare-fun _$59!11 () Unit!33443)

(assert (=> d!122701 (= (choose!121 (_keys!11240 thiss!1427) (index!41036 lt!452294) key!909) _$59!11)))

(declare-fun bs!29971 () Bool)

(assert (= bs!29971 d!122701))

(assert (=> bs!29971 m!945665))

(assert (=> bs!29971 m!945799))

(assert (=> d!122603 d!122701))

(declare-fun d!122703 () Bool)

(assert (=> d!122703 (= (apply!893 lt!452477 #b1000000000000000000000000000000000000000000000000000000000000000) (get!16337 (getValueByKey!586 (toList!6888 lt!452477) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!29972 () Bool)

(assert (= bs!29972 d!122703))

(assert (=> bs!29972 m!946007))

(assert (=> bs!29972 m!946007))

(declare-fun m!946203 () Bool)

(assert (=> bs!29972 m!946203))

(assert (=> b!1027832 d!122703))

(declare-fun d!122705 () Bool)

(assert (=> d!122705 (= (apply!893 lt!452477 (select (arr!31098 (_keys!11240 thiss!1427)) #b00000000000000000000000000000000)) (get!16337 (getValueByKey!586 (toList!6888 lt!452477) (select (arr!31098 (_keys!11240 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun bs!29973 () Bool)

(assert (= bs!29973 d!122705))

(assert (=> bs!29973 m!945885))

(assert (=> bs!29973 m!945975))

(assert (=> bs!29973 m!945975))

(declare-fun m!946205 () Bool)

(assert (=> bs!29973 m!946205))

(assert (=> b!1027819 d!122705))

(declare-fun d!122707 () Bool)

(declare-fun c!103682 () Bool)

(assert (=> d!122707 (= c!103682 ((_ is ValueCellFull!11444) (select (arr!31099 (_values!6118 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!580257 () V!37267)

(assert (=> d!122707 (= (get!16336 (select (arr!31099 (_values!6118 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1942 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)) e!580257)))

(declare-fun b!1028021 () Bool)

(declare-fun get!16338 (ValueCell!11444 V!37267) V!37267)

(assert (=> b!1028021 (= e!580257 (get!16338 (select (arr!31099 (_values!6118 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1942 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1028022 () Bool)

(declare-fun get!16339 (ValueCell!11444 V!37267) V!37267)

(assert (=> b!1028022 (= e!580257 (get!16339 (select (arr!31099 (_values!6118 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1942 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!122707 c!103682) b!1028021))

(assert (= (and d!122707 (not c!103682)) b!1028022))

(assert (=> b!1028021 m!945953))

(assert (=> b!1028021 m!945679))

(declare-fun m!946207 () Bool)

(assert (=> b!1028021 m!946207))

(assert (=> b!1028022 m!945953))

(assert (=> b!1028022 m!945679))

(declare-fun m!946209 () Bool)

(assert (=> b!1028022 m!946209))

(assert (=> b!1027819 d!122707))

(declare-fun d!122709 () Bool)

(declare-fun lt!452613 () (_ BitVec 32))

(assert (=> d!122709 (and (bvsge lt!452613 #b00000000000000000000000000000000) (bvsle lt!452613 (bvsub (size!31613 (_keys!11240 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!580259 () (_ BitVec 32))

(assert (=> d!122709 (= lt!452613 e!580259)))

(declare-fun c!103684 () Bool)

(assert (=> d!122709 (= c!103684 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31613 (_keys!11240 thiss!1427))))))

(assert (=> d!122709 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31613 (_keys!11240 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!31613 (_keys!11240 thiss!1427)) (size!31613 (_keys!11240 thiss!1427))))))

(assert (=> d!122709 (= (arrayCountValidKeys!0 (_keys!11240 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31613 (_keys!11240 thiss!1427))) lt!452613)))

(declare-fun bm!43304 () Bool)

(declare-fun call!43307 () (_ BitVec 32))

(assert (=> bm!43304 (= call!43307 (arrayCountValidKeys!0 (_keys!11240 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31613 (_keys!11240 thiss!1427))))))

(declare-fun b!1028023 () Bool)

(declare-fun e!580258 () (_ BitVec 32))

(assert (=> b!1028023 (= e!580259 e!580258)))

(declare-fun c!103683 () Bool)

(assert (=> b!1028023 (= c!103683 (validKeyInArray!0 (select (arr!31098 (_keys!11240 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1028024 () Bool)

(assert (=> b!1028024 (= e!580259 #b00000000000000000000000000000000)))

(declare-fun b!1028025 () Bool)

(assert (=> b!1028025 (= e!580258 call!43307)))

(declare-fun b!1028026 () Bool)

(assert (=> b!1028026 (= e!580258 (bvadd #b00000000000000000000000000000001 call!43307))))

(assert (= (and d!122709 c!103684) b!1028024))

(assert (= (and d!122709 (not c!103684)) b!1028023))

(assert (= (and b!1028023 c!103683) b!1028026))

(assert (= (and b!1028023 (not c!103683)) b!1028025))

(assert (= (or b!1028026 b!1028025) bm!43304))

(declare-fun m!946211 () Bool)

(assert (=> bm!43304 m!946211))

(declare-fun m!946213 () Bool)

(assert (=> b!1028023 m!946213))

(assert (=> b!1028023 m!946213))

(declare-fun m!946215 () Bool)

(assert (=> b!1028023 m!946215))

(assert (=> bm!43282 d!122709))

(declare-fun call!43308 () Bool)

(declare-fun c!103685 () Bool)

(declare-fun bm!43305 () Bool)

(assert (=> bm!43305 (= call!43308 (arrayNoDuplicates!0 lt!452297 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!103685 (Cons!21841 (select (arr!31098 lt!452297) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!103596 (Cons!21841 (select (arr!31098 lt!452297) #b00000000000000000000000000000000) Nil!21842) Nil!21842)) (ite c!103596 (Cons!21841 (select (arr!31098 lt!452297) #b00000000000000000000000000000000) Nil!21842) Nil!21842))))))

(declare-fun b!1028027 () Bool)

(declare-fun e!580262 () Bool)

(assert (=> b!1028027 (= e!580262 call!43308)))

(declare-fun d!122711 () Bool)

(declare-fun res!687964 () Bool)

(declare-fun e!580261 () Bool)

(assert (=> d!122711 (=> res!687964 e!580261)))

(assert (=> d!122711 (= res!687964 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31613 lt!452297)))))

(assert (=> d!122711 (= (arrayNoDuplicates!0 lt!452297 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!103596 (Cons!21841 (select (arr!31098 lt!452297) #b00000000000000000000000000000000) Nil!21842) Nil!21842)) e!580261)))

(declare-fun b!1028028 () Bool)

(declare-fun e!580260 () Bool)

(assert (=> b!1028028 (= e!580260 (contains!5944 (ite c!103596 (Cons!21841 (select (arr!31098 lt!452297) #b00000000000000000000000000000000) Nil!21842) Nil!21842) (select (arr!31098 lt!452297) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1028029 () Bool)

(assert (=> b!1028029 (= e!580262 call!43308)))

(declare-fun b!1028030 () Bool)

(declare-fun e!580263 () Bool)

(assert (=> b!1028030 (= e!580261 e!580263)))

(declare-fun res!687962 () Bool)

(assert (=> b!1028030 (=> (not res!687962) (not e!580263))))

(assert (=> b!1028030 (= res!687962 (not e!580260))))

(declare-fun res!687963 () Bool)

(assert (=> b!1028030 (=> (not res!687963) (not e!580260))))

(assert (=> b!1028030 (= res!687963 (validKeyInArray!0 (select (arr!31098 lt!452297) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1028031 () Bool)

(assert (=> b!1028031 (= e!580263 e!580262)))

(assert (=> b!1028031 (= c!103685 (validKeyInArray!0 (select (arr!31098 lt!452297) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!122711 (not res!687964)) b!1028030))

(assert (= (and b!1028030 res!687963) b!1028028))

(assert (= (and b!1028030 res!687962) b!1028031))

(assert (= (and b!1028031 c!103685) b!1028027))

(assert (= (and b!1028031 (not c!103685)) b!1028029))

(assert (= (or b!1028027 b!1028029) bm!43305))

(assert (=> bm!43305 m!945981))

(declare-fun m!946217 () Bool)

(assert (=> bm!43305 m!946217))

(assert (=> b!1028028 m!945981))

(assert (=> b!1028028 m!945981))

(declare-fun m!946219 () Bool)

(assert (=> b!1028028 m!946219))

(assert (=> b!1028030 m!945981))

(assert (=> b!1028030 m!945981))

(assert (=> b!1028030 m!945983))

(assert (=> b!1028031 m!945981))

(assert (=> b!1028031 m!945981))

(assert (=> b!1028031 m!945983))

(assert (=> bm!43260 d!122711))

(declare-fun d!122713 () Bool)

(assert (=> d!122713 (= (apply!893 lt!452439 (select (arr!31098 lt!452297) #b00000000000000000000000000000000)) (get!16337 (getValueByKey!586 (toList!6888 lt!452439) (select (arr!31098 lt!452297) #b00000000000000000000000000000000))))))

(declare-fun bs!29974 () Bool)

(assert (= bs!29974 d!122713))

(assert (=> bs!29974 m!945813))

(assert (=> bs!29974 m!945967))

(assert (=> bs!29974 m!945967))

(declare-fun m!946221 () Bool)

(assert (=> bs!29974 m!946221))

(assert (=> b!1027776 d!122713))

(declare-fun d!122715 () Bool)

(declare-fun c!103686 () Bool)

(assert (=> d!122715 (= c!103686 ((_ is ValueCellFull!11444) (select (arr!31099 lt!452298) #b00000000000000000000000000000000)))))

(declare-fun e!580264 () V!37267)

(assert (=> d!122715 (= (get!16336 (select (arr!31099 lt!452298) #b00000000000000000000000000000000) (dynLambda!1942 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)) e!580264)))

(declare-fun b!1028032 () Bool)

(assert (=> b!1028032 (= e!580264 (get!16338 (select (arr!31099 lt!452298) #b00000000000000000000000000000000) (dynLambda!1942 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1028033 () Bool)

(assert (=> b!1028033 (= e!580264 (get!16339 (select (arr!31099 lt!452298) #b00000000000000000000000000000000) (dynLambda!1942 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!122715 c!103686) b!1028032))

(assert (= (and d!122715 (not c!103686)) b!1028033))

(assert (=> b!1028032 m!945879))

(assert (=> b!1028032 m!945679))

(declare-fun m!946223 () Bool)

(assert (=> b!1028032 m!946223))

(assert (=> b!1028033 m!945879))

(assert (=> b!1028033 m!945679))

(declare-fun m!946225 () Bool)

(assert (=> b!1028033 m!946225))

(assert (=> b!1027776 d!122715))

(declare-fun call!43309 () Bool)

(declare-fun bm!43306 () Bool)

(declare-fun c!103687 () Bool)

(assert (=> bm!43306 (= call!43309 (arrayNoDuplicates!0 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!103687 (Cons!21841 (select (arr!31098 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427)))) #b00000000000000000000000000000000) Nil!21842) Nil!21842)))))

(declare-fun b!1028034 () Bool)

(declare-fun e!580267 () Bool)

(assert (=> b!1028034 (= e!580267 call!43309)))

(declare-fun d!122717 () Bool)

(declare-fun res!687967 () Bool)

(declare-fun e!580266 () Bool)

(assert (=> d!122717 (=> res!687967 e!580266)))

(assert (=> d!122717 (= res!687967 (bvsge #b00000000000000000000000000000000 (size!31613 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427))))))))

(assert (=> d!122717 (= (arrayNoDuplicates!0 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427))) #b00000000000000000000000000000000 Nil!21842) e!580266)))

(declare-fun b!1028035 () Bool)

(declare-fun e!580265 () Bool)

(assert (=> b!1028035 (= e!580265 (contains!5944 Nil!21842 (select (arr!31098 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1028036 () Bool)

(assert (=> b!1028036 (= e!580267 call!43309)))

(declare-fun b!1028037 () Bool)

(declare-fun e!580268 () Bool)

(assert (=> b!1028037 (= e!580266 e!580268)))

(declare-fun res!687965 () Bool)

(assert (=> b!1028037 (=> (not res!687965) (not e!580268))))

(assert (=> b!1028037 (= res!687965 (not e!580265))))

(declare-fun res!687966 () Bool)

(assert (=> b!1028037 (=> (not res!687966) (not e!580265))))

(assert (=> b!1028037 (= res!687966 (validKeyInArray!0 (select (arr!31098 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1028038 () Bool)

(assert (=> b!1028038 (= e!580268 e!580267)))

(assert (=> b!1028038 (= c!103687 (validKeyInArray!0 (select (arr!31098 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (= (and d!122717 (not res!687967)) b!1028037))

(assert (= (and b!1028037 res!687966) b!1028035))

(assert (= (and b!1028037 res!687965) b!1028038))

(assert (= (and b!1028038 c!103687) b!1028034))

(assert (= (and b!1028038 (not c!103687)) b!1028036))

(assert (= (or b!1028034 b!1028036) bm!43306))

(assert (=> bm!43306 m!946145))

(declare-fun m!946227 () Bool)

(assert (=> bm!43306 m!946227))

(assert (=> b!1028035 m!946145))

(assert (=> b!1028035 m!946145))

(declare-fun m!946229 () Bool)

(assert (=> b!1028035 m!946229))

(assert (=> b!1028037 m!946145))

(assert (=> b!1028037 m!946145))

(assert (=> b!1028037 m!946147))

(assert (=> b!1028038 m!946145))

(assert (=> b!1028038 m!946145))

(assert (=> b!1028038 m!946147))

(assert (=> b!1027808 d!122717))

(assert (=> b!1027717 d!122633))

(assert (=> b!1027673 d!122619))

(declare-fun b!1028063 () Bool)

(declare-fun e!580286 () ListLongMap!13745)

(declare-fun call!43312 () ListLongMap!13745)

(assert (=> b!1028063 (= e!580286 call!43312)))

(declare-fun b!1028064 () Bool)

(declare-fun e!580289 () Bool)

(declare-fun e!580288 () Bool)

(assert (=> b!1028064 (= e!580289 e!580288)))

(declare-fun c!103699 () Bool)

(declare-fun e!580284 () Bool)

(assert (=> b!1028064 (= c!103699 e!580284)))

(declare-fun res!687979 () Bool)

(assert (=> b!1028064 (=> (not res!687979) (not e!580284))))

(assert (=> b!1028064 (= res!687979 (bvslt #b00000000000000000000000000000000 (size!31613 (_keys!11240 thiss!1427))))))

(declare-fun bm!43309 () Bool)

(assert (=> bm!43309 (= call!43312 (getCurrentListMapNoExtraKeys!3559 (_keys!11240 thiss!1427) (_values!6118 thiss!1427) (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6095 thiss!1427)))))

(declare-fun b!1028065 () Bool)

(declare-fun lt!452631 () Unit!33443)

(declare-fun lt!452629 () Unit!33443)

(assert (=> b!1028065 (= lt!452631 lt!452629)))

(declare-fun lt!452628 () V!37267)

(declare-fun lt!452630 () (_ BitVec 64))

(declare-fun lt!452634 () (_ BitVec 64))

(declare-fun lt!452633 () ListLongMap!13745)

(assert (=> b!1028065 (not (contains!5943 (+!3124 lt!452633 (tuple2!15621 lt!452630 lt!452628)) lt!452634))))

(declare-fun addStillNotContains!239 (ListLongMap!13745 (_ BitVec 64) V!37267 (_ BitVec 64)) Unit!33443)

(assert (=> b!1028065 (= lt!452629 (addStillNotContains!239 lt!452633 lt!452630 lt!452628 lt!452634))))

(assert (=> b!1028065 (= lt!452634 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1028065 (= lt!452628 (get!16336 (select (arr!31099 (_values!6118 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1942 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1028065 (= lt!452630 (select (arr!31098 (_keys!11240 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1028065 (= lt!452633 call!43312)))

(assert (=> b!1028065 (= e!580286 (+!3124 call!43312 (tuple2!15621 (select (arr!31098 (_keys!11240 thiss!1427)) #b00000000000000000000000000000000) (get!16336 (select (arr!31099 (_values!6118 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1942 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1028066 () Bool)

(declare-fun e!580287 () Bool)

(assert (=> b!1028066 (= e!580288 e!580287)))

(declare-fun c!103696 () Bool)

(assert (=> b!1028066 (= c!103696 (bvslt #b00000000000000000000000000000000 (size!31613 (_keys!11240 thiss!1427))))))

(declare-fun b!1028067 () Bool)

(declare-fun lt!452632 () ListLongMap!13745)

(assert (=> b!1028067 (= e!580287 (= lt!452632 (getCurrentListMapNoExtraKeys!3559 (_keys!11240 thiss!1427) (_values!6118 thiss!1427) (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6095 thiss!1427))))))

(declare-fun b!1028068 () Bool)

(declare-fun e!580283 () ListLongMap!13745)

(assert (=> b!1028068 (= e!580283 e!580286)))

(declare-fun c!103697 () Bool)

(assert (=> b!1028068 (= c!103697 (validKeyInArray!0 (select (arr!31098 (_keys!11240 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1028069 () Bool)

(declare-fun isEmpty!927 (ListLongMap!13745) Bool)

(assert (=> b!1028069 (= e!580287 (isEmpty!927 lt!452632))))

(declare-fun b!1028070 () Bool)

(declare-fun res!687977 () Bool)

(assert (=> b!1028070 (=> (not res!687977) (not e!580289))))

(assert (=> b!1028070 (= res!687977 (not (contains!5943 lt!452632 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1028071 () Bool)

(assert (=> b!1028071 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31613 (_keys!11240 thiss!1427))))))

(assert (=> b!1028071 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31614 (_values!6118 thiss!1427))))))

(declare-fun e!580285 () Bool)

(assert (=> b!1028071 (= e!580285 (= (apply!893 lt!452632 (select (arr!31098 (_keys!11240 thiss!1427)) #b00000000000000000000000000000000)) (get!16336 (select (arr!31099 (_values!6118 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1942 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1028072 () Bool)

(assert (=> b!1028072 (= e!580283 (ListLongMap!13746 Nil!21841))))

(declare-fun d!122719 () Bool)

(assert (=> d!122719 e!580289))

(declare-fun res!687976 () Bool)

(assert (=> d!122719 (=> (not res!687976) (not e!580289))))

(assert (=> d!122719 (= res!687976 (not (contains!5943 lt!452632 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!122719 (= lt!452632 e!580283)))

(declare-fun c!103698 () Bool)

(assert (=> d!122719 (= c!103698 (bvsge #b00000000000000000000000000000000 (size!31613 (_keys!11240 thiss!1427))))))

(assert (=> d!122719 (validMask!0 (mask!29814 thiss!1427))))

(assert (=> d!122719 (= (getCurrentListMapNoExtraKeys!3559 (_keys!11240 thiss!1427) (_values!6118 thiss!1427) (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)) lt!452632)))

(declare-fun b!1028073 () Bool)

(assert (=> b!1028073 (= e!580284 (validKeyInArray!0 (select (arr!31098 (_keys!11240 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1028073 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1028074 () Bool)

(assert (=> b!1028074 (= e!580288 e!580285)))

(assert (=> b!1028074 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31613 (_keys!11240 thiss!1427))))))

(declare-fun res!687978 () Bool)

(assert (=> b!1028074 (= res!687978 (contains!5943 lt!452632 (select (arr!31098 (_keys!11240 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1028074 (=> (not res!687978) (not e!580285))))

(assert (= (and d!122719 c!103698) b!1028072))

(assert (= (and d!122719 (not c!103698)) b!1028068))

(assert (= (and b!1028068 c!103697) b!1028065))

(assert (= (and b!1028068 (not c!103697)) b!1028063))

(assert (= (or b!1028065 b!1028063) bm!43309))

(assert (= (and d!122719 res!687976) b!1028070))

(assert (= (and b!1028070 res!687977) b!1028064))

(assert (= (and b!1028064 res!687979) b!1028073))

(assert (= (and b!1028064 c!103699) b!1028074))

(assert (= (and b!1028064 (not c!103699)) b!1028066))

(assert (= (and b!1028074 res!687978) b!1028071))

(assert (= (and b!1028066 c!103696) b!1028067))

(assert (= (and b!1028066 (not c!103696)) b!1028069))

(declare-fun b_lambda!15741 () Bool)

(assert (=> (not b_lambda!15741) (not b!1028065)))

(assert (=> b!1028065 t!30904))

(declare-fun b_and!32829 () Bool)

(assert (= b_and!32827 (and (=> t!30904 result!14095) b_and!32829)))

(declare-fun b_lambda!15743 () Bool)

(assert (=> (not b_lambda!15743) (not b!1028071)))

(assert (=> b!1028071 t!30904))

(declare-fun b_and!32831 () Bool)

(assert (= b_and!32829 (and (=> t!30904 result!14095) b_and!32831)))

(assert (=> b!1028071 m!945885))

(assert (=> b!1028071 m!945885))

(declare-fun m!946231 () Bool)

(assert (=> b!1028071 m!946231))

(assert (=> b!1028071 m!945953))

(assert (=> b!1028071 m!945953))

(assert (=> b!1028071 m!945679))

(assert (=> b!1028071 m!945955))

(assert (=> b!1028071 m!945679))

(assert (=> b!1028073 m!945885))

(assert (=> b!1028073 m!945885))

(assert (=> b!1028073 m!945887))

(declare-fun m!946233 () Bool)

(assert (=> b!1028069 m!946233))

(declare-fun m!946235 () Bool)

(assert (=> b!1028065 m!946235))

(assert (=> b!1028065 m!945885))

(declare-fun m!946237 () Bool)

(assert (=> b!1028065 m!946237))

(declare-fun m!946239 () Bool)

(assert (=> b!1028065 m!946239))

(assert (=> b!1028065 m!946237))

(assert (=> b!1028065 m!945953))

(assert (=> b!1028065 m!945953))

(assert (=> b!1028065 m!945679))

(assert (=> b!1028065 m!945955))

(assert (=> b!1028065 m!945679))

(declare-fun m!946241 () Bool)

(assert (=> b!1028065 m!946241))

(declare-fun m!946243 () Bool)

(assert (=> b!1028067 m!946243))

(declare-fun m!946245 () Bool)

(assert (=> d!122719 m!946245))

(assert (=> d!122719 m!945787))

(assert (=> b!1028074 m!945885))

(assert (=> b!1028074 m!945885))

(declare-fun m!946247 () Bool)

(assert (=> b!1028074 m!946247))

(declare-fun m!946249 () Bool)

(assert (=> b!1028070 m!946249))

(assert (=> bm!43309 m!946243))

(assert (=> b!1028068 m!945885))

(assert (=> b!1028068 m!945885))

(assert (=> b!1028068 m!945887))

(assert (=> bm!43291 d!122719))

(declare-fun d!122721 () Bool)

(assert (=> d!122721 (arrayNoDuplicates!0 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427))) #b00000000000000000000000000000000 Nil!21842)))

(assert (=> d!122721 true))

(declare-fun _$66!32 () Unit!33443)

(assert (=> d!122721 (= (choose!53 (_keys!11240 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41036 lt!452294) #b00000000000000000000000000000000 Nil!21842) _$66!32)))

(declare-fun bs!29975 () Bool)

(assert (= bs!29975 d!122721))

(assert (=> bs!29975 m!945665))

(assert (=> bs!29975 m!945899))

(assert (=> d!122623 d!122721))

(declare-fun bm!43310 () Bool)

(declare-fun call!43313 () Bool)

(assert (=> bm!43310 (= call!43313 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427))) (mask!29814 thiss!1427)))))

(declare-fun b!1028075 () Bool)

(declare-fun e!580291 () Bool)

(assert (=> b!1028075 (= e!580291 call!43313)))

(declare-fun b!1028076 () Bool)

(declare-fun e!580290 () Bool)

(assert (=> b!1028076 (= e!580290 e!580291)))

(declare-fun c!103700 () Bool)

(assert (=> b!1028076 (= c!103700 (validKeyInArray!0 (select (arr!31098 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun d!122723 () Bool)

(declare-fun res!687981 () Bool)

(assert (=> d!122723 (=> res!687981 e!580290)))

(assert (=> d!122723 (= res!687981 (bvsge #b00000000000000000000000000000000 (size!31613 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427))))))))

(assert (=> d!122723 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427))) (mask!29814 thiss!1427)) e!580290)))

(declare-fun b!1028077 () Bool)

(declare-fun e!580292 () Bool)

(assert (=> b!1028077 (= e!580292 call!43313)))

(declare-fun b!1028078 () Bool)

(assert (=> b!1028078 (= e!580291 e!580292)))

(declare-fun lt!452635 () (_ BitVec 64))

(assert (=> b!1028078 (= lt!452635 (select (arr!31098 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!452637 () Unit!33443)

(assert (=> b!1028078 (= lt!452637 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427))) lt!452635 #b00000000000000000000000000000000))))

(assert (=> b!1028078 (arrayContainsKey!0 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427))) lt!452635 #b00000000000000000000000000000000)))

(declare-fun lt!452636 () Unit!33443)

(assert (=> b!1028078 (= lt!452636 lt!452637)))

(declare-fun res!687980 () Bool)

(assert (=> b!1028078 (= res!687980 (= (seekEntryOrOpen!0 (select (arr!31098 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427)))) #b00000000000000000000000000000000) (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427))) (mask!29814 thiss!1427)) (Found!9666 #b00000000000000000000000000000000)))))

(assert (=> b!1028078 (=> (not res!687980) (not e!580292))))

(assert (= (and d!122723 (not res!687981)) b!1028076))

(assert (= (and b!1028076 c!103700) b!1028078))

(assert (= (and b!1028076 (not c!103700)) b!1028075))

(assert (= (and b!1028078 res!687980) b!1028077))

(assert (= (or b!1028077 b!1028075) bm!43310))

(declare-fun m!946251 () Bool)

(assert (=> bm!43310 m!946251))

(assert (=> b!1028076 m!946145))

(assert (=> b!1028076 m!946145))

(assert (=> b!1028076 m!946147))

(assert (=> b!1028078 m!946145))

(declare-fun m!946253 () Bool)

(assert (=> b!1028078 m!946253))

(declare-fun m!946255 () Bool)

(assert (=> b!1028078 m!946255))

(assert (=> b!1028078 m!946145))

(declare-fun m!946257 () Bool)

(assert (=> b!1028078 m!946257))

(assert (=> b!1027811 d!122723))

(declare-fun d!122725 () Bool)

(assert (=> d!122725 (= (apply!893 (+!3124 lt!452438 (tuple2!15621 lt!452443 (zeroValue!5931 thiss!1427))) lt!452427) (get!16337 (getValueByKey!586 (toList!6888 (+!3124 lt!452438 (tuple2!15621 lt!452443 (zeroValue!5931 thiss!1427)))) lt!452427)))))

(declare-fun bs!29976 () Bool)

(assert (= bs!29976 d!122725))

(declare-fun m!946259 () Bool)

(assert (=> bs!29976 m!946259))

(assert (=> bs!29976 m!946259))

(declare-fun m!946261 () Bool)

(assert (=> bs!29976 m!946261))

(assert (=> b!1027782 d!122725))

(declare-fun b!1028079 () Bool)

(declare-fun e!580296 () ListLongMap!13745)

(declare-fun call!43314 () ListLongMap!13745)

(assert (=> b!1028079 (= e!580296 call!43314)))

(declare-fun b!1028080 () Bool)

(declare-fun e!580299 () Bool)

(declare-fun e!580298 () Bool)

(assert (=> b!1028080 (= e!580299 e!580298)))

(declare-fun c!103704 () Bool)

(declare-fun e!580294 () Bool)

(assert (=> b!1028080 (= c!103704 e!580294)))

(declare-fun res!687985 () Bool)

(assert (=> b!1028080 (=> (not res!687985) (not e!580294))))

(assert (=> b!1028080 (= res!687985 (bvslt #b00000000000000000000000000000000 (size!31613 lt!452297)))))

(declare-fun bm!43311 () Bool)

(assert (=> bm!43311 (= call!43314 (getCurrentListMapNoExtraKeys!3559 lt!452297 lt!452298 (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6095 thiss!1427)))))

(declare-fun b!1028081 () Bool)

(declare-fun lt!452641 () Unit!33443)

(declare-fun lt!452639 () Unit!33443)

(assert (=> b!1028081 (= lt!452641 lt!452639)))

(declare-fun lt!452640 () (_ BitVec 64))

(declare-fun lt!452644 () (_ BitVec 64))

(declare-fun lt!452638 () V!37267)

(declare-fun lt!452643 () ListLongMap!13745)

(assert (=> b!1028081 (not (contains!5943 (+!3124 lt!452643 (tuple2!15621 lt!452640 lt!452638)) lt!452644))))

(assert (=> b!1028081 (= lt!452639 (addStillNotContains!239 lt!452643 lt!452640 lt!452638 lt!452644))))

(assert (=> b!1028081 (= lt!452644 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1028081 (= lt!452638 (get!16336 (select (arr!31099 lt!452298) #b00000000000000000000000000000000) (dynLambda!1942 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1028081 (= lt!452640 (select (arr!31098 lt!452297) #b00000000000000000000000000000000))))

(assert (=> b!1028081 (= lt!452643 call!43314)))

(assert (=> b!1028081 (= e!580296 (+!3124 call!43314 (tuple2!15621 (select (arr!31098 lt!452297) #b00000000000000000000000000000000) (get!16336 (select (arr!31099 lt!452298) #b00000000000000000000000000000000) (dynLambda!1942 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1028082 () Bool)

(declare-fun e!580297 () Bool)

(assert (=> b!1028082 (= e!580298 e!580297)))

(declare-fun c!103701 () Bool)

(assert (=> b!1028082 (= c!103701 (bvslt #b00000000000000000000000000000000 (size!31613 lt!452297)))))

(declare-fun b!1028083 () Bool)

(declare-fun lt!452642 () ListLongMap!13745)

(assert (=> b!1028083 (= e!580297 (= lt!452642 (getCurrentListMapNoExtraKeys!3559 lt!452297 lt!452298 (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6095 thiss!1427))))))

(declare-fun b!1028084 () Bool)

(declare-fun e!580293 () ListLongMap!13745)

(assert (=> b!1028084 (= e!580293 e!580296)))

(declare-fun c!103702 () Bool)

(assert (=> b!1028084 (= c!103702 (validKeyInArray!0 (select (arr!31098 lt!452297) #b00000000000000000000000000000000)))))

(declare-fun b!1028085 () Bool)

(assert (=> b!1028085 (= e!580297 (isEmpty!927 lt!452642))))

(declare-fun b!1028086 () Bool)

(declare-fun res!687983 () Bool)

(assert (=> b!1028086 (=> (not res!687983) (not e!580299))))

(assert (=> b!1028086 (= res!687983 (not (contains!5943 lt!452642 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1028087 () Bool)

(assert (=> b!1028087 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31613 lt!452297)))))

(assert (=> b!1028087 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31614 lt!452298)))))

(declare-fun e!580295 () Bool)

(assert (=> b!1028087 (= e!580295 (= (apply!893 lt!452642 (select (arr!31098 lt!452297) #b00000000000000000000000000000000)) (get!16336 (select (arr!31099 lt!452298) #b00000000000000000000000000000000) (dynLambda!1942 (defaultEntry!6095 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1028088 () Bool)

(assert (=> b!1028088 (= e!580293 (ListLongMap!13746 Nil!21841))))

(declare-fun d!122727 () Bool)

(assert (=> d!122727 e!580299))

(declare-fun res!687982 () Bool)

(assert (=> d!122727 (=> (not res!687982) (not e!580299))))

(assert (=> d!122727 (= res!687982 (not (contains!5943 lt!452642 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!122727 (= lt!452642 e!580293)))

(declare-fun c!103703 () Bool)

(assert (=> d!122727 (= c!103703 (bvsge #b00000000000000000000000000000000 (size!31613 lt!452297)))))

(assert (=> d!122727 (validMask!0 (mask!29814 thiss!1427))))

(assert (=> d!122727 (= (getCurrentListMapNoExtraKeys!3559 lt!452297 lt!452298 (mask!29814 thiss!1427) (extraKeys!5827 thiss!1427) (zeroValue!5931 thiss!1427) (minValue!5931 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6095 thiss!1427)) lt!452642)))

(declare-fun b!1028089 () Bool)

(assert (=> b!1028089 (= e!580294 (validKeyInArray!0 (select (arr!31098 lt!452297) #b00000000000000000000000000000000)))))

(assert (=> b!1028089 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1028090 () Bool)

(assert (=> b!1028090 (= e!580298 e!580295)))

(assert (=> b!1028090 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31613 lt!452297)))))

(declare-fun res!687984 () Bool)

(assert (=> b!1028090 (= res!687984 (contains!5943 lt!452642 (select (arr!31098 lt!452297) #b00000000000000000000000000000000)))))

(assert (=> b!1028090 (=> (not res!687984) (not e!580295))))

(assert (= (and d!122727 c!103703) b!1028088))

(assert (= (and d!122727 (not c!103703)) b!1028084))

(assert (= (and b!1028084 c!103702) b!1028081))

(assert (= (and b!1028084 (not c!103702)) b!1028079))

(assert (= (or b!1028081 b!1028079) bm!43311))

(assert (= (and d!122727 res!687982) b!1028086))

(assert (= (and b!1028086 res!687983) b!1028080))

(assert (= (and b!1028080 res!687985) b!1028089))

(assert (= (and b!1028080 c!103704) b!1028090))

(assert (= (and b!1028080 (not c!103704)) b!1028082))

(assert (= (and b!1028090 res!687984) b!1028087))

(assert (= (and b!1028082 c!103701) b!1028083))

(assert (= (and b!1028082 (not c!103701)) b!1028085))

(declare-fun b_lambda!15745 () Bool)

(assert (=> (not b_lambda!15745) (not b!1028081)))

(assert (=> b!1028081 t!30904))

(declare-fun b_and!32833 () Bool)

(assert (= b_and!32831 (and (=> t!30904 result!14095) b_and!32833)))

(declare-fun b_lambda!15747 () Bool)

(assert (=> (not b_lambda!15747) (not b!1028087)))

(assert (=> b!1028087 t!30904))

(declare-fun b_and!32835 () Bool)

(assert (= b_and!32833 (and (=> t!30904 result!14095) b_and!32835)))

(assert (=> b!1028087 m!945813))

(assert (=> b!1028087 m!945813))

(declare-fun m!946263 () Bool)

(assert (=> b!1028087 m!946263))

(assert (=> b!1028087 m!945879))

(assert (=> b!1028087 m!945879))

(assert (=> b!1028087 m!945679))

(assert (=> b!1028087 m!945881))

(assert (=> b!1028087 m!945679))

(assert (=> b!1028089 m!945813))

(assert (=> b!1028089 m!945813))

(assert (=> b!1028089 m!945815))

(declare-fun m!946265 () Bool)

(assert (=> b!1028085 m!946265))

(declare-fun m!946267 () Bool)

(assert (=> b!1028081 m!946267))

(assert (=> b!1028081 m!945813))

(declare-fun m!946269 () Bool)

(assert (=> b!1028081 m!946269))

(declare-fun m!946271 () Bool)

(assert (=> b!1028081 m!946271))

(assert (=> b!1028081 m!946269))

(assert (=> b!1028081 m!945879))

(assert (=> b!1028081 m!945879))

(assert (=> b!1028081 m!945679))

(assert (=> b!1028081 m!945881))

(assert (=> b!1028081 m!945679))

(declare-fun m!946273 () Bool)

(assert (=> b!1028081 m!946273))

(declare-fun m!946275 () Bool)

(assert (=> b!1028083 m!946275))

(declare-fun m!946277 () Bool)

(assert (=> d!122727 m!946277))

(assert (=> d!122727 m!945787))

(assert (=> b!1028090 m!945813))

(assert (=> b!1028090 m!945813))

(declare-fun m!946279 () Bool)

(assert (=> b!1028090 m!946279))

(declare-fun m!946281 () Bool)

(assert (=> b!1028086 m!946281))

(assert (=> bm!43311 m!946275))

(assert (=> b!1028084 m!945813))

(assert (=> b!1028084 m!945813))

(assert (=> b!1028084 m!945815))

(assert (=> b!1027782 d!122727))

(declare-fun d!122729 () Bool)

(assert (=> d!122729 (= (apply!893 lt!452448 lt!452428) (get!16337 (getValueByKey!586 (toList!6888 lt!452448) lt!452428)))))

(declare-fun bs!29977 () Bool)

(assert (= bs!29977 d!122729))

(declare-fun m!946283 () Bool)

(assert (=> bs!29977 m!946283))

(assert (=> bs!29977 m!946283))

(declare-fun m!946285 () Bool)

(assert (=> bs!29977 m!946285))

(assert (=> b!1027782 d!122729))

(declare-fun d!122731 () Bool)

(assert (=> d!122731 (= (apply!893 (+!3124 lt!452448 (tuple2!15621 lt!452433 (minValue!5931 thiss!1427))) lt!452428) (get!16337 (getValueByKey!586 (toList!6888 (+!3124 lt!452448 (tuple2!15621 lt!452433 (minValue!5931 thiss!1427)))) lt!452428)))))

(declare-fun bs!29978 () Bool)

(assert (= bs!29978 d!122731))

(declare-fun m!946287 () Bool)

(assert (=> bs!29978 m!946287))

(assert (=> bs!29978 m!946287))

(declare-fun m!946289 () Bool)

(assert (=> bs!29978 m!946289))

(assert (=> b!1027782 d!122731))

(declare-fun d!122733 () Bool)

(declare-fun e!580300 () Bool)

(assert (=> d!122733 e!580300))

(declare-fun res!687986 () Bool)

(assert (=> d!122733 (=> (not res!687986) (not e!580300))))

(declare-fun lt!452646 () ListLongMap!13745)

(assert (=> d!122733 (= res!687986 (contains!5943 lt!452646 (_1!7821 (tuple2!15621 lt!452433 (minValue!5931 thiss!1427)))))))

(declare-fun lt!452645 () List!21844)

(assert (=> d!122733 (= lt!452646 (ListLongMap!13746 lt!452645))))

(declare-fun lt!452647 () Unit!33443)

(declare-fun lt!452648 () Unit!33443)

(assert (=> d!122733 (= lt!452647 lt!452648)))

(assert (=> d!122733 (= (getValueByKey!586 lt!452645 (_1!7821 (tuple2!15621 lt!452433 (minValue!5931 thiss!1427)))) (Some!636 (_2!7821 (tuple2!15621 lt!452433 (minValue!5931 thiss!1427)))))))

(assert (=> d!122733 (= lt!452648 (lemmaContainsTupThenGetReturnValue!276 lt!452645 (_1!7821 (tuple2!15621 lt!452433 (minValue!5931 thiss!1427))) (_2!7821 (tuple2!15621 lt!452433 (minValue!5931 thiss!1427)))))))

(assert (=> d!122733 (= lt!452645 (insertStrictlySorted!369 (toList!6888 lt!452448) (_1!7821 (tuple2!15621 lt!452433 (minValue!5931 thiss!1427))) (_2!7821 (tuple2!15621 lt!452433 (minValue!5931 thiss!1427)))))))

(assert (=> d!122733 (= (+!3124 lt!452448 (tuple2!15621 lt!452433 (minValue!5931 thiss!1427))) lt!452646)))

(declare-fun b!1028091 () Bool)

(declare-fun res!687987 () Bool)

(assert (=> b!1028091 (=> (not res!687987) (not e!580300))))

(assert (=> b!1028091 (= res!687987 (= (getValueByKey!586 (toList!6888 lt!452646) (_1!7821 (tuple2!15621 lt!452433 (minValue!5931 thiss!1427)))) (Some!636 (_2!7821 (tuple2!15621 lt!452433 (minValue!5931 thiss!1427))))))))

(declare-fun b!1028092 () Bool)

(assert (=> b!1028092 (= e!580300 (contains!5945 (toList!6888 lt!452646) (tuple2!15621 lt!452433 (minValue!5931 thiss!1427))))))

(assert (= (and d!122733 res!687986) b!1028091))

(assert (= (and b!1028091 res!687987) b!1028092))

(declare-fun m!946291 () Bool)

(assert (=> d!122733 m!946291))

(declare-fun m!946293 () Bool)

(assert (=> d!122733 m!946293))

(declare-fun m!946295 () Bool)

(assert (=> d!122733 m!946295))

(declare-fun m!946297 () Bool)

(assert (=> d!122733 m!946297))

(declare-fun m!946299 () Bool)

(assert (=> b!1028091 m!946299))

(declare-fun m!946301 () Bool)

(assert (=> b!1028092 m!946301))

(assert (=> b!1027782 d!122733))

(declare-fun d!122735 () Bool)

(assert (=> d!122735 (= (apply!893 lt!452438 lt!452427) (get!16337 (getValueByKey!586 (toList!6888 lt!452438) lt!452427)))))

(declare-fun bs!29979 () Bool)

(assert (= bs!29979 d!122735))

(declare-fun m!946303 () Bool)

(assert (=> bs!29979 m!946303))

(assert (=> bs!29979 m!946303))

(declare-fun m!946305 () Bool)

(assert (=> bs!29979 m!946305))

(assert (=> b!1027782 d!122735))

(declare-fun d!122737 () Bool)

(assert (=> d!122737 (= (apply!893 (+!3124 lt!452448 (tuple2!15621 lt!452433 (minValue!5931 thiss!1427))) lt!452428) (apply!893 lt!452448 lt!452428))))

(declare-fun lt!452651 () Unit!33443)

(declare-fun choose!1690 (ListLongMap!13745 (_ BitVec 64) V!37267 (_ BitVec 64)) Unit!33443)

(assert (=> d!122737 (= lt!452651 (choose!1690 lt!452448 lt!452433 (minValue!5931 thiss!1427) lt!452428))))

(declare-fun e!580303 () Bool)

(assert (=> d!122737 e!580303))

(declare-fun res!687990 () Bool)

(assert (=> d!122737 (=> (not res!687990) (not e!580303))))

(assert (=> d!122737 (= res!687990 (contains!5943 lt!452448 lt!452428))))

(assert (=> d!122737 (= (addApplyDifferent!468 lt!452448 lt!452433 (minValue!5931 thiss!1427) lt!452428) lt!452651)))

(declare-fun b!1028096 () Bool)

(assert (=> b!1028096 (= e!580303 (not (= lt!452428 lt!452433)))))

(assert (= (and d!122737 res!687990) b!1028096))

(declare-fun m!946307 () Bool)

(assert (=> d!122737 m!946307))

(declare-fun m!946309 () Bool)

(assert (=> d!122737 m!946309))

(assert (=> d!122737 m!945873))

(assert (=> d!122737 m!945859))

(assert (=> d!122737 m!945871))

(assert (=> d!122737 m!945859))

(assert (=> b!1027782 d!122737))

(declare-fun d!122739 () Bool)

(assert (=> d!122739 (= (apply!893 (+!3124 lt!452444 (tuple2!15621 lt!452435 (minValue!5931 thiss!1427))) lt!452430) (apply!893 lt!452444 lt!452430))))

(declare-fun lt!452652 () Unit!33443)

(assert (=> d!122739 (= lt!452652 (choose!1690 lt!452444 lt!452435 (minValue!5931 thiss!1427) lt!452430))))

(declare-fun e!580304 () Bool)

(assert (=> d!122739 e!580304))

(declare-fun res!687991 () Bool)

(assert (=> d!122739 (=> (not res!687991) (not e!580304))))

(assert (=> d!122739 (= res!687991 (contains!5943 lt!452444 lt!452430))))

(assert (=> d!122739 (= (addApplyDifferent!468 lt!452444 lt!452435 (minValue!5931 thiss!1427) lt!452430) lt!452652)))

(declare-fun b!1028097 () Bool)

(assert (=> b!1028097 (= e!580304 (not (= lt!452430 lt!452435)))))

(assert (= (and d!122739 res!687991) b!1028097))

(declare-fun m!946311 () Bool)

(assert (=> d!122739 m!946311))

(declare-fun m!946313 () Bool)

(assert (=> d!122739 m!946313))

(assert (=> d!122739 m!945857))

(assert (=> d!122739 m!945851))

(assert (=> d!122739 m!945853))

(assert (=> d!122739 m!945851))

(assert (=> b!1027782 d!122739))

(declare-fun d!122741 () Bool)

(declare-fun e!580305 () Bool)

(assert (=> d!122741 e!580305))

(declare-fun res!687992 () Bool)

(assert (=> d!122741 (=> (not res!687992) (not e!580305))))

(declare-fun lt!452654 () ListLongMap!13745)

(assert (=> d!122741 (= res!687992 (contains!5943 lt!452654 (_1!7821 (tuple2!15621 lt!452435 (minValue!5931 thiss!1427)))))))

(declare-fun lt!452653 () List!21844)

(assert (=> d!122741 (= lt!452654 (ListLongMap!13746 lt!452653))))

(declare-fun lt!452655 () Unit!33443)

(declare-fun lt!452656 () Unit!33443)

(assert (=> d!122741 (= lt!452655 lt!452656)))

(assert (=> d!122741 (= (getValueByKey!586 lt!452653 (_1!7821 (tuple2!15621 lt!452435 (minValue!5931 thiss!1427)))) (Some!636 (_2!7821 (tuple2!15621 lt!452435 (minValue!5931 thiss!1427)))))))

(assert (=> d!122741 (= lt!452656 (lemmaContainsTupThenGetReturnValue!276 lt!452653 (_1!7821 (tuple2!15621 lt!452435 (minValue!5931 thiss!1427))) (_2!7821 (tuple2!15621 lt!452435 (minValue!5931 thiss!1427)))))))

(assert (=> d!122741 (= lt!452653 (insertStrictlySorted!369 (toList!6888 lt!452444) (_1!7821 (tuple2!15621 lt!452435 (minValue!5931 thiss!1427))) (_2!7821 (tuple2!15621 lt!452435 (minValue!5931 thiss!1427)))))))

(assert (=> d!122741 (= (+!3124 lt!452444 (tuple2!15621 lt!452435 (minValue!5931 thiss!1427))) lt!452654)))

(declare-fun b!1028098 () Bool)

(declare-fun res!687993 () Bool)

(assert (=> b!1028098 (=> (not res!687993) (not e!580305))))

(assert (=> b!1028098 (= res!687993 (= (getValueByKey!586 (toList!6888 lt!452654) (_1!7821 (tuple2!15621 lt!452435 (minValue!5931 thiss!1427)))) (Some!636 (_2!7821 (tuple2!15621 lt!452435 (minValue!5931 thiss!1427))))))))

(declare-fun b!1028099 () Bool)

(assert (=> b!1028099 (= e!580305 (contains!5945 (toList!6888 lt!452654) (tuple2!15621 lt!452435 (minValue!5931 thiss!1427))))))

(assert (= (and d!122741 res!687992) b!1028098))

(assert (= (and b!1028098 res!687993) b!1028099))

(declare-fun m!946315 () Bool)

(assert (=> d!122741 m!946315))

(declare-fun m!946317 () Bool)

(assert (=> d!122741 m!946317))

(declare-fun m!946319 () Bool)

(assert (=> d!122741 m!946319))

(declare-fun m!946321 () Bool)

(assert (=> d!122741 m!946321))

(declare-fun m!946323 () Bool)

(assert (=> b!1028098 m!946323))

(declare-fun m!946325 () Bool)

(assert (=> b!1028099 m!946325))

(assert (=> b!1027782 d!122741))

(declare-fun d!122743 () Bool)

(assert (=> d!122743 (= (apply!893 (+!3124 lt!452438 (tuple2!15621 lt!452443 (zeroValue!5931 thiss!1427))) lt!452427) (apply!893 lt!452438 lt!452427))))

(declare-fun lt!452657 () Unit!33443)

(assert (=> d!122743 (= lt!452657 (choose!1690 lt!452438 lt!452443 (zeroValue!5931 thiss!1427) lt!452427))))

(declare-fun e!580306 () Bool)

(assert (=> d!122743 e!580306))

(declare-fun res!687994 () Bool)

(assert (=> d!122743 (=> (not res!687994) (not e!580306))))

(assert (=> d!122743 (= res!687994 (contains!5943 lt!452438 lt!452427))))

(assert (=> d!122743 (= (addApplyDifferent!468 lt!452438 lt!452443 (zeroValue!5931 thiss!1427) lt!452427) lt!452657)))

(declare-fun b!1028100 () Bool)

(assert (=> b!1028100 (= e!580306 (not (= lt!452427 lt!452443)))))

(assert (= (and d!122743 res!687994) b!1028100))

(declare-fun m!946327 () Bool)

(assert (=> d!122743 m!946327))

(declare-fun m!946329 () Bool)

(assert (=> d!122743 m!946329))

(assert (=> d!122743 m!945845))

(assert (=> d!122743 m!945847))

(assert (=> d!122743 m!945849))

(assert (=> d!122743 m!945847))

(assert (=> b!1027782 d!122743))

(declare-fun d!122745 () Bool)

(assert (=> d!122745 (= (apply!893 lt!452444 lt!452430) (get!16337 (getValueByKey!586 (toList!6888 lt!452444) lt!452430)))))

(declare-fun bs!29980 () Bool)

(assert (= bs!29980 d!122745))

(declare-fun m!946331 () Bool)

(assert (=> bs!29980 m!946331))

(assert (=> bs!29980 m!946331))

(declare-fun m!946333 () Bool)

(assert (=> bs!29980 m!946333))

(assert (=> b!1027782 d!122745))

(declare-fun d!122747 () Bool)

(assert (=> d!122747 (contains!5943 (+!3124 lt!452434 (tuple2!15621 lt!452429 (zeroValue!5931 thiss!1427))) lt!452441)))

(declare-fun lt!452660 () Unit!33443)

(declare-fun choose!1691 (ListLongMap!13745 (_ BitVec 64) V!37267 (_ BitVec 64)) Unit!33443)

(assert (=> d!122747 (= lt!452660 (choose!1691 lt!452434 lt!452429 (zeroValue!5931 thiss!1427) lt!452441))))

(assert (=> d!122747 (contains!5943 lt!452434 lt!452441)))

(assert (=> d!122747 (= (addStillContains!612 lt!452434 lt!452429 (zeroValue!5931 thiss!1427) lt!452441) lt!452660)))

(declare-fun bs!29981 () Bool)

(assert (= bs!29981 d!122747))

(assert (=> bs!29981 m!945865))

(assert (=> bs!29981 m!945865))

(assert (=> bs!29981 m!945867))

(declare-fun m!946335 () Bool)

(assert (=> bs!29981 m!946335))

(declare-fun m!946337 () Bool)

(assert (=> bs!29981 m!946337))

(assert (=> b!1027782 d!122747))

(declare-fun d!122749 () Bool)

(declare-fun e!580308 () Bool)

(assert (=> d!122749 e!580308))

(declare-fun res!687995 () Bool)

(assert (=> d!122749 (=> res!687995 e!580308)))

(declare-fun lt!452663 () Bool)

(assert (=> d!122749 (= res!687995 (not lt!452663))))

(declare-fun lt!452664 () Bool)

(assert (=> d!122749 (= lt!452663 lt!452664)))

(declare-fun lt!452661 () Unit!33443)

(declare-fun e!580307 () Unit!33443)

(assert (=> d!122749 (= lt!452661 e!580307)))

(declare-fun c!103705 () Bool)

(assert (=> d!122749 (= c!103705 lt!452664)))

(assert (=> d!122749 (= lt!452664 (containsKey!559 (toList!6888 (+!3124 lt!452434 (tuple2!15621 lt!452429 (zeroValue!5931 thiss!1427)))) lt!452441))))

(assert (=> d!122749 (= (contains!5943 (+!3124 lt!452434 (tuple2!15621 lt!452429 (zeroValue!5931 thiss!1427))) lt!452441) lt!452663)))

(declare-fun b!1028102 () Bool)

(declare-fun lt!452662 () Unit!33443)

(assert (=> b!1028102 (= e!580307 lt!452662)))

(assert (=> b!1028102 (= lt!452662 (lemmaContainsKeyImpliesGetValueByKeyDefined!391 (toList!6888 (+!3124 lt!452434 (tuple2!15621 lt!452429 (zeroValue!5931 thiss!1427)))) lt!452441))))

(assert (=> b!1028102 (isDefined!434 (getValueByKey!586 (toList!6888 (+!3124 lt!452434 (tuple2!15621 lt!452429 (zeroValue!5931 thiss!1427)))) lt!452441))))

(declare-fun b!1028103 () Bool)

(declare-fun Unit!33459 () Unit!33443)

(assert (=> b!1028103 (= e!580307 Unit!33459)))

(declare-fun b!1028104 () Bool)

(assert (=> b!1028104 (= e!580308 (isDefined!434 (getValueByKey!586 (toList!6888 (+!3124 lt!452434 (tuple2!15621 lt!452429 (zeroValue!5931 thiss!1427)))) lt!452441)))))

(assert (= (and d!122749 c!103705) b!1028102))

(assert (= (and d!122749 (not c!103705)) b!1028103))

(assert (= (and d!122749 (not res!687995)) b!1028104))

(declare-fun m!946339 () Bool)

(assert (=> d!122749 m!946339))

(declare-fun m!946341 () Bool)

(assert (=> b!1028102 m!946341))

(declare-fun m!946343 () Bool)

(assert (=> b!1028102 m!946343))

(assert (=> b!1028102 m!946343))

(declare-fun m!946345 () Bool)

(assert (=> b!1028102 m!946345))

(assert (=> b!1028104 m!946343))

(assert (=> b!1028104 m!946343))

(assert (=> b!1028104 m!946345))

(assert (=> b!1027782 d!122749))

(declare-fun d!122751 () Bool)

(declare-fun e!580309 () Bool)

(assert (=> d!122751 e!580309))

(declare-fun res!687996 () Bool)

(assert (=> d!122751 (=> (not res!687996) (not e!580309))))

(declare-fun lt!452666 () ListLongMap!13745)

(assert (=> d!122751 (= res!687996 (contains!5943 lt!452666 (_1!7821 (tuple2!15621 lt!452429 (zeroValue!5931 thiss!1427)))))))

(declare-fun lt!452665 () List!21844)

(assert (=> d!122751 (= lt!452666 (ListLongMap!13746 lt!452665))))

(declare-fun lt!452667 () Unit!33443)

(declare-fun lt!452668 () Unit!33443)

(assert (=> d!122751 (= lt!452667 lt!452668)))

(assert (=> d!122751 (= (getValueByKey!586 lt!452665 (_1!7821 (tuple2!15621 lt!452429 (zeroValue!5931 thiss!1427)))) (Some!636 (_2!7821 (tuple2!15621 lt!452429 (zeroValue!5931 thiss!1427)))))))

(assert (=> d!122751 (= lt!452668 (lemmaContainsTupThenGetReturnValue!276 lt!452665 (_1!7821 (tuple2!15621 lt!452429 (zeroValue!5931 thiss!1427))) (_2!7821 (tuple2!15621 lt!452429 (zeroValue!5931 thiss!1427)))))))

(assert (=> d!122751 (= lt!452665 (insertStrictlySorted!369 (toList!6888 lt!452434) (_1!7821 (tuple2!15621 lt!452429 (zeroValue!5931 thiss!1427))) (_2!7821 (tuple2!15621 lt!452429 (zeroValue!5931 thiss!1427)))))))

(assert (=> d!122751 (= (+!3124 lt!452434 (tuple2!15621 lt!452429 (zeroValue!5931 thiss!1427))) lt!452666)))

(declare-fun b!1028105 () Bool)

(declare-fun res!687997 () Bool)

(assert (=> b!1028105 (=> (not res!687997) (not e!580309))))

(assert (=> b!1028105 (= res!687997 (= (getValueByKey!586 (toList!6888 lt!452666) (_1!7821 (tuple2!15621 lt!452429 (zeroValue!5931 thiss!1427)))) (Some!636 (_2!7821 (tuple2!15621 lt!452429 (zeroValue!5931 thiss!1427))))))))

(declare-fun b!1028106 () Bool)

(assert (=> b!1028106 (= e!580309 (contains!5945 (toList!6888 lt!452666) (tuple2!15621 lt!452429 (zeroValue!5931 thiss!1427))))))

(assert (= (and d!122751 res!687996) b!1028105))

(assert (= (and b!1028105 res!687997) b!1028106))

(declare-fun m!946347 () Bool)

(assert (=> d!122751 m!946347))

(declare-fun m!946349 () Bool)

(assert (=> d!122751 m!946349))

(declare-fun m!946351 () Bool)

(assert (=> d!122751 m!946351))

(declare-fun m!946353 () Bool)

(assert (=> d!122751 m!946353))

(declare-fun m!946355 () Bool)

(assert (=> b!1028105 m!946355))

(declare-fun m!946357 () Bool)

(assert (=> b!1028106 m!946357))

(assert (=> b!1027782 d!122751))

(declare-fun d!122753 () Bool)

(assert (=> d!122753 (= (apply!893 (+!3124 lt!452444 (tuple2!15621 lt!452435 (minValue!5931 thiss!1427))) lt!452430) (get!16337 (getValueByKey!586 (toList!6888 (+!3124 lt!452444 (tuple2!15621 lt!452435 (minValue!5931 thiss!1427)))) lt!452430)))))

(declare-fun bs!29982 () Bool)

(assert (= bs!29982 d!122753))

(declare-fun m!946359 () Bool)

(assert (=> bs!29982 m!946359))

(assert (=> bs!29982 m!946359))

(declare-fun m!946361 () Bool)

(assert (=> bs!29982 m!946361))

(assert (=> b!1027782 d!122753))

(declare-fun d!122755 () Bool)

(declare-fun e!580310 () Bool)

(assert (=> d!122755 e!580310))

(declare-fun res!687998 () Bool)

(assert (=> d!122755 (=> (not res!687998) (not e!580310))))

(declare-fun lt!452670 () ListLongMap!13745)

(assert (=> d!122755 (= res!687998 (contains!5943 lt!452670 (_1!7821 (tuple2!15621 lt!452443 (zeroValue!5931 thiss!1427)))))))

(declare-fun lt!452669 () List!21844)

(assert (=> d!122755 (= lt!452670 (ListLongMap!13746 lt!452669))))

(declare-fun lt!452671 () Unit!33443)

(declare-fun lt!452672 () Unit!33443)

(assert (=> d!122755 (= lt!452671 lt!452672)))

(assert (=> d!122755 (= (getValueByKey!586 lt!452669 (_1!7821 (tuple2!15621 lt!452443 (zeroValue!5931 thiss!1427)))) (Some!636 (_2!7821 (tuple2!15621 lt!452443 (zeroValue!5931 thiss!1427)))))))

(assert (=> d!122755 (= lt!452672 (lemmaContainsTupThenGetReturnValue!276 lt!452669 (_1!7821 (tuple2!15621 lt!452443 (zeroValue!5931 thiss!1427))) (_2!7821 (tuple2!15621 lt!452443 (zeroValue!5931 thiss!1427)))))))

(assert (=> d!122755 (= lt!452669 (insertStrictlySorted!369 (toList!6888 lt!452438) (_1!7821 (tuple2!15621 lt!452443 (zeroValue!5931 thiss!1427))) (_2!7821 (tuple2!15621 lt!452443 (zeroValue!5931 thiss!1427)))))))

(assert (=> d!122755 (= (+!3124 lt!452438 (tuple2!15621 lt!452443 (zeroValue!5931 thiss!1427))) lt!452670)))

(declare-fun b!1028107 () Bool)

(declare-fun res!687999 () Bool)

(assert (=> b!1028107 (=> (not res!687999) (not e!580310))))

(assert (=> b!1028107 (= res!687999 (= (getValueByKey!586 (toList!6888 lt!452670) (_1!7821 (tuple2!15621 lt!452443 (zeroValue!5931 thiss!1427)))) (Some!636 (_2!7821 (tuple2!15621 lt!452443 (zeroValue!5931 thiss!1427))))))))

(declare-fun b!1028108 () Bool)

(assert (=> b!1028108 (= e!580310 (contains!5945 (toList!6888 lt!452670) (tuple2!15621 lt!452443 (zeroValue!5931 thiss!1427))))))

(assert (= (and d!122755 res!687998) b!1028107))

(assert (= (and b!1028107 res!687999) b!1028108))

(declare-fun m!946363 () Bool)

(assert (=> d!122755 m!946363))

(declare-fun m!946365 () Bool)

(assert (=> d!122755 m!946365))

(declare-fun m!946367 () Bool)

(assert (=> d!122755 m!946367))

(declare-fun m!946369 () Bool)

(assert (=> d!122755 m!946369))

(declare-fun m!946371 () Bool)

(assert (=> b!1028107 m!946371))

(declare-fun m!946373 () Bool)

(assert (=> b!1028108 m!946373))

(assert (=> b!1027782 d!122755))

(declare-fun d!122757 () Bool)

(assert (=> d!122757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427))) (mask!29814 thiss!1427))))

(assert (=> d!122757 true))

(declare-fun _$44!9 () Unit!33443)

(assert (=> d!122757 (= (choose!25 (_keys!11240 thiss!1427) (index!41036 lt!452294) (mask!29814 thiss!1427)) _$44!9)))

(declare-fun bs!29983 () Bool)

(assert (= bs!29983 d!122757))

(assert (=> bs!29983 m!945665))

(assert (=> bs!29983 m!945903))

(assert (=> d!122625 d!122757))

(assert (=> d!122625 d!122653))

(declare-fun bm!43312 () Bool)

(declare-fun call!43315 () Bool)

(declare-fun c!103706 () Bool)

(assert (=> bm!43312 (= call!43315 (arrayNoDuplicates!0 (_keys!11240 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!103706 (Cons!21841 (select (arr!31098 (_keys!11240 thiss!1427)) #b00000000000000000000000000000000) Nil!21842) Nil!21842)))))

(declare-fun b!1028109 () Bool)

(declare-fun e!580313 () Bool)

(assert (=> b!1028109 (= e!580313 call!43315)))

(declare-fun d!122759 () Bool)

(declare-fun res!688002 () Bool)

(declare-fun e!580312 () Bool)

(assert (=> d!122759 (=> res!688002 e!580312)))

(assert (=> d!122759 (= res!688002 (bvsge #b00000000000000000000000000000000 (size!31613 (_keys!11240 thiss!1427))))))

(assert (=> d!122759 (= (arrayNoDuplicates!0 (_keys!11240 thiss!1427) #b00000000000000000000000000000000 Nil!21842) e!580312)))

(declare-fun b!1028110 () Bool)

(declare-fun e!580311 () Bool)

(assert (=> b!1028110 (= e!580311 (contains!5944 Nil!21842 (select (arr!31098 (_keys!11240 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1028111 () Bool)

(assert (=> b!1028111 (= e!580313 call!43315)))

(declare-fun b!1028112 () Bool)

(declare-fun e!580314 () Bool)

(assert (=> b!1028112 (= e!580312 e!580314)))

(declare-fun res!688000 () Bool)

(assert (=> b!1028112 (=> (not res!688000) (not e!580314))))

(assert (=> b!1028112 (= res!688000 (not e!580311))))

(declare-fun res!688001 () Bool)

(assert (=> b!1028112 (=> (not res!688001) (not e!580311))))

(assert (=> b!1028112 (= res!688001 (validKeyInArray!0 (select (arr!31098 (_keys!11240 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1028113 () Bool)

(assert (=> b!1028113 (= e!580314 e!580313)))

(assert (=> b!1028113 (= c!103706 (validKeyInArray!0 (select (arr!31098 (_keys!11240 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!122759 (not res!688002)) b!1028112))

(assert (= (and b!1028112 res!688001) b!1028110))

(assert (= (and b!1028112 res!688000) b!1028113))

(assert (= (and b!1028113 c!103706) b!1028109))

(assert (= (and b!1028113 (not c!103706)) b!1028111))

(assert (= (or b!1028109 b!1028111) bm!43312))

(assert (=> bm!43312 m!945885))

(declare-fun m!946375 () Bool)

(assert (=> bm!43312 m!946375))

(assert (=> b!1028110 m!945885))

(assert (=> b!1028110 m!945885))

(declare-fun m!946377 () Bool)

(assert (=> b!1028110 m!946377))

(assert (=> b!1028112 m!945885))

(assert (=> b!1028112 m!945885))

(assert (=> b!1028112 m!945887))

(assert (=> b!1028113 m!945885))

(assert (=> b!1028113 m!945885))

(assert (=> b!1028113 m!945887))

(assert (=> b!1027675 d!122759))

(declare-fun d!122761 () Bool)

(declare-fun e!580316 () Bool)

(assert (=> d!122761 e!580316))

(declare-fun res!688003 () Bool)

(assert (=> d!122761 (=> res!688003 e!580316)))

(declare-fun lt!452675 () Bool)

(assert (=> d!122761 (= res!688003 (not lt!452675))))

(declare-fun lt!452676 () Bool)

(assert (=> d!122761 (= lt!452675 lt!452676)))

(declare-fun lt!452673 () Unit!33443)

(declare-fun e!580315 () Unit!33443)

(assert (=> d!122761 (= lt!452673 e!580315)))

(declare-fun c!103707 () Bool)

(assert (=> d!122761 (= c!103707 lt!452676)))

(assert (=> d!122761 (= lt!452676 (containsKey!559 (toList!6888 (+!3124 lt!452472 (tuple2!15621 lt!452467 (zeroValue!5931 thiss!1427)))) lt!452479))))

(assert (=> d!122761 (= (contains!5943 (+!3124 lt!452472 (tuple2!15621 lt!452467 (zeroValue!5931 thiss!1427))) lt!452479) lt!452675)))

(declare-fun b!1028114 () Bool)

(declare-fun lt!452674 () Unit!33443)

(assert (=> b!1028114 (= e!580315 lt!452674)))

(assert (=> b!1028114 (= lt!452674 (lemmaContainsKeyImpliesGetValueByKeyDefined!391 (toList!6888 (+!3124 lt!452472 (tuple2!15621 lt!452467 (zeroValue!5931 thiss!1427)))) lt!452479))))

(assert (=> b!1028114 (isDefined!434 (getValueByKey!586 (toList!6888 (+!3124 lt!452472 (tuple2!15621 lt!452467 (zeroValue!5931 thiss!1427)))) lt!452479))))

(declare-fun b!1028115 () Bool)

(declare-fun Unit!33460 () Unit!33443)

(assert (=> b!1028115 (= e!580315 Unit!33460)))

(declare-fun b!1028116 () Bool)

(assert (=> b!1028116 (= e!580316 (isDefined!434 (getValueByKey!586 (toList!6888 (+!3124 lt!452472 (tuple2!15621 lt!452467 (zeroValue!5931 thiss!1427)))) lt!452479)))))

(assert (= (and d!122761 c!103707) b!1028114))

(assert (= (and d!122761 (not c!103707)) b!1028115))

(assert (= (and d!122761 (not res!688003)) b!1028116))

(declare-fun m!946379 () Bool)

(assert (=> d!122761 m!946379))

(declare-fun m!946381 () Bool)

(assert (=> b!1028114 m!946381))

(declare-fun m!946383 () Bool)

(assert (=> b!1028114 m!946383))

(assert (=> b!1028114 m!946383))

(declare-fun m!946385 () Bool)

(assert (=> b!1028114 m!946385))

(assert (=> b!1028116 m!946383))

(assert (=> b!1028116 m!946383))

(assert (=> b!1028116 m!946385))

(assert (=> b!1027825 d!122761))

(declare-fun d!122763 () Bool)

(assert (=> d!122763 (= (apply!893 lt!452482 lt!452468) (get!16337 (getValueByKey!586 (toList!6888 lt!452482) lt!452468)))))

(declare-fun bs!29984 () Bool)

(assert (= bs!29984 d!122763))

(declare-fun m!946387 () Bool)

(assert (=> bs!29984 m!946387))

(assert (=> bs!29984 m!946387))

(declare-fun m!946389 () Bool)

(assert (=> bs!29984 m!946389))

(assert (=> b!1027825 d!122763))

(declare-fun d!122765 () Bool)

(assert (=> d!122765 (= (apply!893 (+!3124 lt!452476 (tuple2!15621 lt!452481 (zeroValue!5931 thiss!1427))) lt!452465) (get!16337 (getValueByKey!586 (toList!6888 (+!3124 lt!452476 (tuple2!15621 lt!452481 (zeroValue!5931 thiss!1427)))) lt!452465)))))

(declare-fun bs!29985 () Bool)

(assert (= bs!29985 d!122765))

(declare-fun m!946391 () Bool)

(assert (=> bs!29985 m!946391))

(assert (=> bs!29985 m!946391))

(declare-fun m!946393 () Bool)

(assert (=> bs!29985 m!946393))

(assert (=> b!1027825 d!122765))

(declare-fun d!122767 () Bool)

(assert (=> d!122767 (= (apply!893 (+!3124 lt!452482 (tuple2!15621 lt!452473 (minValue!5931 thiss!1427))) lt!452468) (get!16337 (getValueByKey!586 (toList!6888 (+!3124 lt!452482 (tuple2!15621 lt!452473 (minValue!5931 thiss!1427)))) lt!452468)))))

(declare-fun bs!29986 () Bool)

(assert (= bs!29986 d!122767))

(declare-fun m!946395 () Bool)

(assert (=> bs!29986 m!946395))

(assert (=> bs!29986 m!946395))

(declare-fun m!946397 () Bool)

(assert (=> bs!29986 m!946397))

(assert (=> b!1027825 d!122767))

(declare-fun d!122769 () Bool)

(assert (=> d!122769 (= (apply!893 (+!3124 lt!452486 (tuple2!15621 lt!452471 (minValue!5931 thiss!1427))) lt!452466) (get!16337 (getValueByKey!586 (toList!6888 (+!3124 lt!452486 (tuple2!15621 lt!452471 (minValue!5931 thiss!1427)))) lt!452466)))))

(declare-fun bs!29987 () Bool)

(assert (= bs!29987 d!122769))

(declare-fun m!946399 () Bool)

(assert (=> bs!29987 m!946399))

(assert (=> bs!29987 m!946399))

(declare-fun m!946401 () Bool)

(assert (=> bs!29987 m!946401))

(assert (=> b!1027825 d!122769))

(declare-fun d!122771 () Bool)

(assert (=> d!122771 (= (apply!893 lt!452486 lt!452466) (get!16337 (getValueByKey!586 (toList!6888 lt!452486) lt!452466)))))

(declare-fun bs!29988 () Bool)

(assert (= bs!29988 d!122771))

(declare-fun m!946403 () Bool)

(assert (=> bs!29988 m!946403))

(assert (=> bs!29988 m!946403))

(declare-fun m!946405 () Bool)

(assert (=> bs!29988 m!946405))

(assert (=> b!1027825 d!122771))

(declare-fun d!122773 () Bool)

(assert (=> d!122773 (contains!5943 (+!3124 lt!452472 (tuple2!15621 lt!452467 (zeroValue!5931 thiss!1427))) lt!452479)))

(declare-fun lt!452677 () Unit!33443)

(assert (=> d!122773 (= lt!452677 (choose!1691 lt!452472 lt!452467 (zeroValue!5931 thiss!1427) lt!452479))))

(assert (=> d!122773 (contains!5943 lt!452472 lt!452479)))

(assert (=> d!122773 (= (addStillContains!612 lt!452472 lt!452467 (zeroValue!5931 thiss!1427) lt!452479) lt!452677)))

(declare-fun bs!29989 () Bool)

(assert (= bs!29989 d!122773))

(assert (=> bs!29989 m!945939))

(assert (=> bs!29989 m!945939))

(assert (=> bs!29989 m!945941))

(declare-fun m!946407 () Bool)

(assert (=> bs!29989 m!946407))

(declare-fun m!946409 () Bool)

(assert (=> bs!29989 m!946409))

(assert (=> b!1027825 d!122773))

(declare-fun d!122775 () Bool)

(assert (=> d!122775 (= (apply!893 (+!3124 lt!452476 (tuple2!15621 lt!452481 (zeroValue!5931 thiss!1427))) lt!452465) (apply!893 lt!452476 lt!452465))))

(declare-fun lt!452678 () Unit!33443)

(assert (=> d!122775 (= lt!452678 (choose!1690 lt!452476 lt!452481 (zeroValue!5931 thiss!1427) lt!452465))))

(declare-fun e!580317 () Bool)

(assert (=> d!122775 e!580317))

(declare-fun res!688004 () Bool)

(assert (=> d!122775 (=> (not res!688004) (not e!580317))))

(assert (=> d!122775 (= res!688004 (contains!5943 lt!452476 lt!452465))))

(assert (=> d!122775 (= (addApplyDifferent!468 lt!452476 lt!452481 (zeroValue!5931 thiss!1427) lt!452465) lt!452678)))

(declare-fun b!1028117 () Bool)

(assert (=> b!1028117 (= e!580317 (not (= lt!452465 lt!452481)))))

(assert (= (and d!122775 res!688004) b!1028117))

(declare-fun m!946411 () Bool)

(assert (=> d!122775 m!946411))

(declare-fun m!946413 () Bool)

(assert (=> d!122775 m!946413))

(assert (=> d!122775 m!945919))

(assert (=> d!122775 m!945921))

(assert (=> d!122775 m!945923))

(assert (=> d!122775 m!945921))

(assert (=> b!1027825 d!122775))

(declare-fun d!122777 () Bool)

(assert (=> d!122777 (= (apply!893 (+!3124 lt!452482 (tuple2!15621 lt!452473 (minValue!5931 thiss!1427))) lt!452468) (apply!893 lt!452482 lt!452468))))

(declare-fun lt!452679 () Unit!33443)

(assert (=> d!122777 (= lt!452679 (choose!1690 lt!452482 lt!452473 (minValue!5931 thiss!1427) lt!452468))))

(declare-fun e!580318 () Bool)

(assert (=> d!122777 e!580318))

(declare-fun res!688005 () Bool)

(assert (=> d!122777 (=> (not res!688005) (not e!580318))))

(assert (=> d!122777 (= res!688005 (contains!5943 lt!452482 lt!452468))))

(assert (=> d!122777 (= (addApplyDifferent!468 lt!452482 lt!452473 (minValue!5931 thiss!1427) lt!452468) lt!452679)))

(declare-fun b!1028118 () Bool)

(assert (=> b!1028118 (= e!580318 (not (= lt!452468 lt!452473)))))

(assert (= (and d!122777 res!688005) b!1028118))

(declare-fun m!946415 () Bool)

(assert (=> d!122777 m!946415))

(declare-fun m!946417 () Bool)

(assert (=> d!122777 m!946417))

(assert (=> d!122777 m!945931))

(assert (=> d!122777 m!945925))

(assert (=> d!122777 m!945927))

(assert (=> d!122777 m!945925))

(assert (=> b!1027825 d!122777))

(declare-fun d!122779 () Bool)

(declare-fun e!580319 () Bool)

(assert (=> d!122779 e!580319))

(declare-fun res!688006 () Bool)

(assert (=> d!122779 (=> (not res!688006) (not e!580319))))

(declare-fun lt!452681 () ListLongMap!13745)

(assert (=> d!122779 (= res!688006 (contains!5943 lt!452681 (_1!7821 (tuple2!15621 lt!452481 (zeroValue!5931 thiss!1427)))))))

(declare-fun lt!452680 () List!21844)

(assert (=> d!122779 (= lt!452681 (ListLongMap!13746 lt!452680))))

(declare-fun lt!452682 () Unit!33443)

(declare-fun lt!452683 () Unit!33443)

(assert (=> d!122779 (= lt!452682 lt!452683)))

(assert (=> d!122779 (= (getValueByKey!586 lt!452680 (_1!7821 (tuple2!15621 lt!452481 (zeroValue!5931 thiss!1427)))) (Some!636 (_2!7821 (tuple2!15621 lt!452481 (zeroValue!5931 thiss!1427)))))))

(assert (=> d!122779 (= lt!452683 (lemmaContainsTupThenGetReturnValue!276 lt!452680 (_1!7821 (tuple2!15621 lt!452481 (zeroValue!5931 thiss!1427))) (_2!7821 (tuple2!15621 lt!452481 (zeroValue!5931 thiss!1427)))))))

(assert (=> d!122779 (= lt!452680 (insertStrictlySorted!369 (toList!6888 lt!452476) (_1!7821 (tuple2!15621 lt!452481 (zeroValue!5931 thiss!1427))) (_2!7821 (tuple2!15621 lt!452481 (zeroValue!5931 thiss!1427)))))))

(assert (=> d!122779 (= (+!3124 lt!452476 (tuple2!15621 lt!452481 (zeroValue!5931 thiss!1427))) lt!452681)))

(declare-fun b!1028119 () Bool)

(declare-fun res!688007 () Bool)

(assert (=> b!1028119 (=> (not res!688007) (not e!580319))))

(assert (=> b!1028119 (= res!688007 (= (getValueByKey!586 (toList!6888 lt!452681) (_1!7821 (tuple2!15621 lt!452481 (zeroValue!5931 thiss!1427)))) (Some!636 (_2!7821 (tuple2!15621 lt!452481 (zeroValue!5931 thiss!1427))))))))

(declare-fun b!1028120 () Bool)

(assert (=> b!1028120 (= e!580319 (contains!5945 (toList!6888 lt!452681) (tuple2!15621 lt!452481 (zeroValue!5931 thiss!1427))))))

(assert (= (and d!122779 res!688006) b!1028119))

(assert (= (and b!1028119 res!688007) b!1028120))

(declare-fun m!946419 () Bool)

(assert (=> d!122779 m!946419))

(declare-fun m!946421 () Bool)

(assert (=> d!122779 m!946421))

(declare-fun m!946423 () Bool)

(assert (=> d!122779 m!946423))

(declare-fun m!946425 () Bool)

(assert (=> d!122779 m!946425))

(declare-fun m!946427 () Bool)

(assert (=> b!1028119 m!946427))

(declare-fun m!946429 () Bool)

(assert (=> b!1028120 m!946429))

(assert (=> b!1027825 d!122779))

(declare-fun d!122781 () Bool)

(assert (=> d!122781 (= (apply!893 lt!452476 lt!452465) (get!16337 (getValueByKey!586 (toList!6888 lt!452476) lt!452465)))))

(declare-fun bs!29990 () Bool)

(assert (= bs!29990 d!122781))

(declare-fun m!946431 () Bool)

(assert (=> bs!29990 m!946431))

(assert (=> bs!29990 m!946431))

(declare-fun m!946433 () Bool)

(assert (=> bs!29990 m!946433))

(assert (=> b!1027825 d!122781))

(declare-fun d!122783 () Bool)

(assert (=> d!122783 (= (apply!893 (+!3124 lt!452486 (tuple2!15621 lt!452471 (minValue!5931 thiss!1427))) lt!452466) (apply!893 lt!452486 lt!452466))))

(declare-fun lt!452684 () Unit!33443)

(assert (=> d!122783 (= lt!452684 (choose!1690 lt!452486 lt!452471 (minValue!5931 thiss!1427) lt!452466))))

(declare-fun e!580320 () Bool)

(assert (=> d!122783 e!580320))

(declare-fun res!688008 () Bool)

(assert (=> d!122783 (=> (not res!688008) (not e!580320))))

(assert (=> d!122783 (= res!688008 (contains!5943 lt!452486 lt!452466))))

(assert (=> d!122783 (= (addApplyDifferent!468 lt!452486 lt!452471 (minValue!5931 thiss!1427) lt!452466) lt!452684)))

(declare-fun b!1028121 () Bool)

(assert (=> b!1028121 (= e!580320 (not (= lt!452466 lt!452471)))))

(assert (= (and d!122783 res!688008) b!1028121))

(declare-fun m!946435 () Bool)

(assert (=> d!122783 m!946435))

(declare-fun m!946437 () Bool)

(assert (=> d!122783 m!946437))

(assert (=> d!122783 m!945947))

(assert (=> d!122783 m!945933))

(assert (=> d!122783 m!945945))

(assert (=> d!122783 m!945933))

(assert (=> b!1027825 d!122783))

(declare-fun d!122785 () Bool)

(declare-fun e!580321 () Bool)

(assert (=> d!122785 e!580321))

(declare-fun res!688009 () Bool)

(assert (=> d!122785 (=> (not res!688009) (not e!580321))))

(declare-fun lt!452686 () ListLongMap!13745)

(assert (=> d!122785 (= res!688009 (contains!5943 lt!452686 (_1!7821 (tuple2!15621 lt!452467 (zeroValue!5931 thiss!1427)))))))

(declare-fun lt!452685 () List!21844)

(assert (=> d!122785 (= lt!452686 (ListLongMap!13746 lt!452685))))

(declare-fun lt!452687 () Unit!33443)

(declare-fun lt!452688 () Unit!33443)

(assert (=> d!122785 (= lt!452687 lt!452688)))

(assert (=> d!122785 (= (getValueByKey!586 lt!452685 (_1!7821 (tuple2!15621 lt!452467 (zeroValue!5931 thiss!1427)))) (Some!636 (_2!7821 (tuple2!15621 lt!452467 (zeroValue!5931 thiss!1427)))))))

(assert (=> d!122785 (= lt!452688 (lemmaContainsTupThenGetReturnValue!276 lt!452685 (_1!7821 (tuple2!15621 lt!452467 (zeroValue!5931 thiss!1427))) (_2!7821 (tuple2!15621 lt!452467 (zeroValue!5931 thiss!1427)))))))

(assert (=> d!122785 (= lt!452685 (insertStrictlySorted!369 (toList!6888 lt!452472) (_1!7821 (tuple2!15621 lt!452467 (zeroValue!5931 thiss!1427))) (_2!7821 (tuple2!15621 lt!452467 (zeroValue!5931 thiss!1427)))))))

(assert (=> d!122785 (= (+!3124 lt!452472 (tuple2!15621 lt!452467 (zeroValue!5931 thiss!1427))) lt!452686)))

(declare-fun b!1028122 () Bool)

(declare-fun res!688010 () Bool)

(assert (=> b!1028122 (=> (not res!688010) (not e!580321))))

(assert (=> b!1028122 (= res!688010 (= (getValueByKey!586 (toList!6888 lt!452686) (_1!7821 (tuple2!15621 lt!452467 (zeroValue!5931 thiss!1427)))) (Some!636 (_2!7821 (tuple2!15621 lt!452467 (zeroValue!5931 thiss!1427))))))))

(declare-fun b!1028123 () Bool)

(assert (=> b!1028123 (= e!580321 (contains!5945 (toList!6888 lt!452686) (tuple2!15621 lt!452467 (zeroValue!5931 thiss!1427))))))

(assert (= (and d!122785 res!688009) b!1028122))

(assert (= (and b!1028122 res!688010) b!1028123))

(declare-fun m!946439 () Bool)

(assert (=> d!122785 m!946439))

(declare-fun m!946441 () Bool)

(assert (=> d!122785 m!946441))

(declare-fun m!946443 () Bool)

(assert (=> d!122785 m!946443))

(declare-fun m!946445 () Bool)

(assert (=> d!122785 m!946445))

(declare-fun m!946447 () Bool)

(assert (=> b!1028122 m!946447))

(declare-fun m!946449 () Bool)

(assert (=> b!1028123 m!946449))

(assert (=> b!1027825 d!122785))

(declare-fun d!122787 () Bool)

(declare-fun e!580322 () Bool)

(assert (=> d!122787 e!580322))

(declare-fun res!688011 () Bool)

(assert (=> d!122787 (=> (not res!688011) (not e!580322))))

(declare-fun lt!452690 () ListLongMap!13745)

(assert (=> d!122787 (= res!688011 (contains!5943 lt!452690 (_1!7821 (tuple2!15621 lt!452473 (minValue!5931 thiss!1427)))))))

(declare-fun lt!452689 () List!21844)

(assert (=> d!122787 (= lt!452690 (ListLongMap!13746 lt!452689))))

(declare-fun lt!452691 () Unit!33443)

(declare-fun lt!452692 () Unit!33443)

(assert (=> d!122787 (= lt!452691 lt!452692)))

(assert (=> d!122787 (= (getValueByKey!586 lt!452689 (_1!7821 (tuple2!15621 lt!452473 (minValue!5931 thiss!1427)))) (Some!636 (_2!7821 (tuple2!15621 lt!452473 (minValue!5931 thiss!1427)))))))

(assert (=> d!122787 (= lt!452692 (lemmaContainsTupThenGetReturnValue!276 lt!452689 (_1!7821 (tuple2!15621 lt!452473 (minValue!5931 thiss!1427))) (_2!7821 (tuple2!15621 lt!452473 (minValue!5931 thiss!1427)))))))

(assert (=> d!122787 (= lt!452689 (insertStrictlySorted!369 (toList!6888 lt!452482) (_1!7821 (tuple2!15621 lt!452473 (minValue!5931 thiss!1427))) (_2!7821 (tuple2!15621 lt!452473 (minValue!5931 thiss!1427)))))))

(assert (=> d!122787 (= (+!3124 lt!452482 (tuple2!15621 lt!452473 (minValue!5931 thiss!1427))) lt!452690)))

(declare-fun b!1028124 () Bool)

(declare-fun res!688012 () Bool)

(assert (=> b!1028124 (=> (not res!688012) (not e!580322))))

(assert (=> b!1028124 (= res!688012 (= (getValueByKey!586 (toList!6888 lt!452690) (_1!7821 (tuple2!15621 lt!452473 (minValue!5931 thiss!1427)))) (Some!636 (_2!7821 (tuple2!15621 lt!452473 (minValue!5931 thiss!1427))))))))

(declare-fun b!1028125 () Bool)

(assert (=> b!1028125 (= e!580322 (contains!5945 (toList!6888 lt!452690) (tuple2!15621 lt!452473 (minValue!5931 thiss!1427))))))

(assert (= (and d!122787 res!688011) b!1028124))

(assert (= (and b!1028124 res!688012) b!1028125))

(declare-fun m!946451 () Bool)

(assert (=> d!122787 m!946451))

(declare-fun m!946453 () Bool)

(assert (=> d!122787 m!946453))

(declare-fun m!946455 () Bool)

(assert (=> d!122787 m!946455))

(declare-fun m!946457 () Bool)

(assert (=> d!122787 m!946457))

(declare-fun m!946459 () Bool)

(assert (=> b!1028124 m!946459))

(declare-fun m!946461 () Bool)

(assert (=> b!1028125 m!946461))

(assert (=> b!1027825 d!122787))

(declare-fun d!122789 () Bool)

(declare-fun e!580323 () Bool)

(assert (=> d!122789 e!580323))

(declare-fun res!688013 () Bool)

(assert (=> d!122789 (=> (not res!688013) (not e!580323))))

(declare-fun lt!452694 () ListLongMap!13745)

(assert (=> d!122789 (= res!688013 (contains!5943 lt!452694 (_1!7821 (tuple2!15621 lt!452471 (minValue!5931 thiss!1427)))))))

(declare-fun lt!452693 () List!21844)

(assert (=> d!122789 (= lt!452694 (ListLongMap!13746 lt!452693))))

(declare-fun lt!452695 () Unit!33443)

(declare-fun lt!452696 () Unit!33443)

(assert (=> d!122789 (= lt!452695 lt!452696)))

(assert (=> d!122789 (= (getValueByKey!586 lt!452693 (_1!7821 (tuple2!15621 lt!452471 (minValue!5931 thiss!1427)))) (Some!636 (_2!7821 (tuple2!15621 lt!452471 (minValue!5931 thiss!1427)))))))

(assert (=> d!122789 (= lt!452696 (lemmaContainsTupThenGetReturnValue!276 lt!452693 (_1!7821 (tuple2!15621 lt!452471 (minValue!5931 thiss!1427))) (_2!7821 (tuple2!15621 lt!452471 (minValue!5931 thiss!1427)))))))

(assert (=> d!122789 (= lt!452693 (insertStrictlySorted!369 (toList!6888 lt!452486) (_1!7821 (tuple2!15621 lt!452471 (minValue!5931 thiss!1427))) (_2!7821 (tuple2!15621 lt!452471 (minValue!5931 thiss!1427)))))))

(assert (=> d!122789 (= (+!3124 lt!452486 (tuple2!15621 lt!452471 (minValue!5931 thiss!1427))) lt!452694)))

(declare-fun b!1028126 () Bool)

(declare-fun res!688014 () Bool)

(assert (=> b!1028126 (=> (not res!688014) (not e!580323))))

(assert (=> b!1028126 (= res!688014 (= (getValueByKey!586 (toList!6888 lt!452694) (_1!7821 (tuple2!15621 lt!452471 (minValue!5931 thiss!1427)))) (Some!636 (_2!7821 (tuple2!15621 lt!452471 (minValue!5931 thiss!1427))))))))

(declare-fun b!1028127 () Bool)

(assert (=> b!1028127 (= e!580323 (contains!5945 (toList!6888 lt!452694) (tuple2!15621 lt!452471 (minValue!5931 thiss!1427))))))

(assert (= (and d!122789 res!688013) b!1028126))

(assert (= (and b!1028126 res!688014) b!1028127))

(declare-fun m!946463 () Bool)

(assert (=> d!122789 m!946463))

(declare-fun m!946465 () Bool)

(assert (=> d!122789 m!946465))

(declare-fun m!946467 () Bool)

(assert (=> d!122789 m!946467))

(declare-fun m!946469 () Bool)

(assert (=> d!122789 m!946469))

(declare-fun m!946471 () Bool)

(assert (=> b!1028126 m!946471))

(declare-fun m!946473 () Bool)

(assert (=> b!1028127 m!946473))

(assert (=> b!1027825 d!122789))

(assert (=> b!1027825 d!122719))

(assert (=> bm!43280 d!122727))

(declare-fun d!122791 () Bool)

(declare-fun res!688015 () Bool)

(declare-fun e!580324 () Bool)

(assert (=> d!122791 (=> res!688015 e!580324)))

(assert (=> d!122791 (= res!688015 (= (select (arr!31098 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427)))) #b00000000000000000000000000000000) key!909))))

(assert (=> d!122791 (= (arrayContainsKey!0 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427))) key!909 #b00000000000000000000000000000000) e!580324)))

(declare-fun b!1028128 () Bool)

(declare-fun e!580325 () Bool)

(assert (=> b!1028128 (= e!580324 e!580325)))

(declare-fun res!688016 () Bool)

(assert (=> b!1028128 (=> (not res!688016) (not e!580325))))

(assert (=> b!1028128 (= res!688016 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31613 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427))))))))

(declare-fun b!1028129 () Bool)

(assert (=> b!1028129 (= e!580325 (arrayContainsKey!0 (array!64582 (store (arr!31098 (_keys!11240 thiss!1427)) (index!41036 lt!452294) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31613 (_keys!11240 thiss!1427))) key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!122791 (not res!688015)) b!1028128))

(assert (= (and b!1028128 res!688016) b!1028129))

(assert (=> d!122791 m!946145))

(declare-fun m!946475 () Bool)

(assert (=> b!1028129 m!946475))

(assert (=> b!1027678 d!122791))

(assert (=> b!1027813 d!122655))

(declare-fun d!122793 () Bool)

(assert (=> d!122793 (= (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000) false)))

(assert (=> b!1027688 d!122793))

(declare-fun mapIsEmpty!37884 () Bool)

(declare-fun mapRes!37884 () Bool)

(assert (=> mapIsEmpty!37884 mapRes!37884))

(declare-fun mapNonEmpty!37884 () Bool)

(declare-fun tp!72790 () Bool)

(declare-fun e!580326 () Bool)

(assert (=> mapNonEmpty!37884 (= mapRes!37884 (and tp!72790 e!580326))))

(declare-fun mapValue!37884 () ValueCell!11444)

(declare-fun mapKey!37884 () (_ BitVec 32))

(declare-fun mapRest!37884 () (Array (_ BitVec 32) ValueCell!11444))

(assert (=> mapNonEmpty!37884 (= mapRest!37883 (store mapRest!37884 mapKey!37884 mapValue!37884))))

(declare-fun b!1028130 () Bool)

(assert (=> b!1028130 (= e!580326 tp_is_empty!24295)))

(declare-fun condMapEmpty!37884 () Bool)

(declare-fun mapDefault!37884 () ValueCell!11444)

(assert (=> mapNonEmpty!37883 (= condMapEmpty!37884 (= mapRest!37883 ((as const (Array (_ BitVec 32) ValueCell!11444)) mapDefault!37884)))))

(declare-fun e!580327 () Bool)

(assert (=> mapNonEmpty!37883 (= tp!72789 (and e!580327 mapRes!37884))))

(declare-fun b!1028131 () Bool)

(assert (=> b!1028131 (= e!580327 tp_is_empty!24295)))

(assert (= (and mapNonEmpty!37883 condMapEmpty!37884) mapIsEmpty!37884))

(assert (= (and mapNonEmpty!37883 (not condMapEmpty!37884)) mapNonEmpty!37884))

(assert (= (and mapNonEmpty!37884 ((_ is ValueCellFull!11444) mapValue!37884)) b!1028130))

(assert (= (and mapNonEmpty!37883 ((_ is ValueCellFull!11444) mapDefault!37884)) b!1028131))

(declare-fun m!946477 () Bool)

(assert (=> mapNonEmpty!37884 m!946477))

(declare-fun b_lambda!15749 () Bool)

(assert (= b_lambda!15747 (or (and b!1027591 b_free!20575) b_lambda!15749)))

(declare-fun b_lambda!15751 () Bool)

(assert (= b_lambda!15741 (or (and b!1027591 b_free!20575) b_lambda!15751)))

(declare-fun b_lambda!15753 () Bool)

(assert (= b_lambda!15737 (or (and b!1027591 b_free!20575) b_lambda!15753)))

(declare-fun b_lambda!15755 () Bool)

(assert (= b_lambda!15745 (or (and b!1027591 b_free!20575) b_lambda!15755)))

(declare-fun b_lambda!15757 () Bool)

(assert (= b_lambda!15739 (or (and b!1027591 b_free!20575) b_lambda!15757)))

(declare-fun b_lambda!15759 () Bool)

(assert (= b_lambda!15743 (or (and b!1027591 b_free!20575) b_lambda!15759)))

(check-sat (not b!1027945) (not d!122691) (not d!122747) (not d!122743) (not d!122667) (not b_next!20575) (not b!1028086) (not b!1028065) (not b_lambda!15751) (not b!1028070) (not bm!43309) (not b!1028035) (not b_lambda!15749) (not b!1028022) (not d!122737) (not b!1027992) (not d!122785) (not d!122661) (not b!1027930) (not b!1027951) (not b!1028119) (not b!1028085) (not d!122697) (not b!1028091) (not d!122721) (not b!1027861) (not b!1028123) (not b!1028033) (not d!122701) (not b!1028028) (not d!122735) (not d!122739) (not d!122779) (not d!122705) (not d!122641) (not b!1027919) (not b!1027888) (not b!1027889) (not bm!43302) (not b!1028068) (not b!1028069) (not b!1027999) (not d!122675) (not b_lambda!15735) (not b!1028067) (not d!122649) (not bm!43304) (not d!122771) (not d!122651) (not bm!43298) (not d!122671) (not d!122745) (not b!1028126) (not b_lambda!15723) (not d!122733) (not b!1028122) (not b!1027865) (not b!1028032) (not b!1028031) (not d!122635) (not b!1028129) (not bm!43311) (not d!122665) (not d!122637) (not d!122781) (not b!1027961) (not d!122685) (not b!1028076) (not b!1027928) (not b!1028083) (not d!122645) (not b!1028023) (not d!122741) (not b!1027947) (not b!1027989) (not b!1028108) (not b!1027982) (not b!1028120) (not bm!43300) (not d!122751) (not mapNonEmpty!37884) (not d!122773) (not b!1027850) (not b!1028071) (not b!1028013) (not d!122695) (not d!122757) (not b!1028102) (not b!1028105) (not b!1027867) (not d!122657) (not bm!43312) (not b!1028021) (not d!122769) (not b_lambda!15755) (not b!1027967) (not b!1028098) (not b!1027927) (not bm!43297) (not d!122703) (not b!1027891) (not d!122777) (not b!1027941) (not b!1027915) (not b_lambda!15753) (not b!1027847) (not d!122643) (not d!122749) (not d!122631) (not b!1027949) (not d!122787) (not bm!43293) (not b!1027962) (not d!122753) (not b!1027856) (not d!122659) (not b!1028078) (not d!122775) tp_is_empty!24295 (not d!122783) (not bm!43310) (not b!1028116) (not d!122687) (not bm!43303) (not b!1028038) (not b!1028081) (not b!1028087) (not b!1027886) (not b_lambda!15759) (not d!122677) (not bm!43306) (not b!1028110) (not b!1028001) (not d!122731) (not b!1028089) (not b!1028073) (not b!1028092) (not b!1028127) (not bm!43301) (not d!122765) (not d!122725) (not b!1027995) (not b!1027986) (not d!122763) (not d!122713) (not b_lambda!15733) (not b!1028084) (not d!122767) (not b!1027987) (not bm!43294) (not b!1027965) (not b!1027849) (not d!122669) (not d!122761) (not b!1027885) (not b!1027966) (not b!1028107) (not d!122727) (not d!122755) (not d!122729) (not b!1027863) (not b!1027950) (not b!1028124) (not b!1028000) b_and!32835 (not b!1027990) (not b!1028037) (not d!122719) (not b!1027852) (not b!1028114) (not b!1028074) (not b_lambda!15757) (not b!1028090) (not b_lambda!15731) (not b!1028009) (not b!1028113) (not b!1028008) (not b!1027862) (not b!1027854) (not b!1028104) (not d!122683) (not bm!43305) (not b!1028112) (not b!1028099) (not d!122789) (not b!1028106) (not b!1027921) (not b!1028125) (not d!122689) (not b!1028030))
(check-sat b_and!32835 (not b_next!20575))
