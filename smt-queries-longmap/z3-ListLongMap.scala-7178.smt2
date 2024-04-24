; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92046 () Bool)

(assert start!92046)

(declare-fun b!1045928 () Bool)

(declare-fun b_free!21121 () Bool)

(declare-fun b_next!21121 () Bool)

(assert (=> b!1045928 (= b_free!21121 (not b_next!21121))))

(declare-fun tp!74612 () Bool)

(declare-fun b_and!33715 () Bool)

(assert (=> b!1045928 (= tp!74612 b_and!33715)))

(declare-fun b!1045927 () Bool)

(declare-fun e!592880 () Bool)

(declare-fun e!592875 () Bool)

(assert (=> b!1045927 (= e!592880 (not e!592875))))

(declare-fun res!696220 () Bool)

(assert (=> b!1045927 (=> res!696220 e!592875)))

(declare-datatypes ((V!37995 0))(
  ( (V!37996 (val!12471 Int)) )
))
(declare-datatypes ((ValueCell!11717 0))(
  ( (ValueCellFull!11717 (v!15060 V!37995)) (EmptyCell!11717) )
))
(declare-datatypes ((Unit!34127 0))(
  ( (Unit!34128) )
))
(declare-datatypes ((array!65901 0))(
  ( (array!65902 (arr!31693 (Array (_ BitVec 32) (_ BitVec 64))) (size!32229 (_ BitVec 32))) )
))
(declare-datatypes ((array!65903 0))(
  ( (array!65904 (arr!31694 (Array (_ BitVec 32) ValueCell!11717)) (size!32230 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6028 0))(
  ( (LongMapFixedSize!6029 (defaultEntry!6404 Int) (mask!30577 (_ BitVec 32)) (extraKeys!6132 (_ BitVec 32)) (zeroValue!6238 V!37995) (minValue!6238 V!37995) (_size!3069 (_ BitVec 32)) (_keys!11708 array!65901) (_values!6427 array!65903) (_vacant!3069 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15764 0))(
  ( (tuple2!15765 (_1!7893 Unit!34127) (_2!7893 LongMapFixedSize!6028)) )
))
(declare-fun lt!461377 () tuple2!15764)

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15766 0))(
  ( (tuple2!15767 (_1!7894 (_ BitVec 64)) (_2!7894 V!37995)) )
))
(declare-datatypes ((List!21999 0))(
  ( (Nil!21996) (Cons!21995 (h!23212 tuple2!15766) (t!31235 List!21999)) )
))
(declare-datatypes ((ListLongMap!13787 0))(
  ( (ListLongMap!13788 (toList!6909 List!21999)) )
))
(declare-fun contains!6100 (ListLongMap!13787 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3953 (array!65901 array!65903 (_ BitVec 32) (_ BitVec 32) V!37995 V!37995 (_ BitVec 32) Int) ListLongMap!13787)

(assert (=> b!1045927 (= res!696220 (not (contains!6100 (getCurrentListMap!3953 (_keys!11708 (_2!7893 lt!461377)) (_values!6427 (_2!7893 lt!461377)) (mask!30577 (_2!7893 lt!461377)) (extraKeys!6132 (_2!7893 lt!461377)) (zeroValue!6238 (_2!7893 lt!461377)) (minValue!6238 (_2!7893 lt!461377)) #b00000000000000000000000000000000 (defaultEntry!6404 (_2!7893 lt!461377))) key!909)))))

(declare-fun lt!461373 () array!65901)

(declare-fun thiss!1427 () LongMapFixedSize!6028)

(declare-fun lt!461370 () array!65903)

(declare-fun Unit!34129 () Unit!34127)

(declare-fun Unit!34130 () Unit!34127)

(assert (=> b!1045927 (= lt!461377 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3069 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15765 Unit!34129 (LongMapFixedSize!6029 (defaultEntry!6404 thiss!1427) (mask!30577 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) (bvsub (_size!3069 thiss!1427) #b00000000000000000000000000000001) lt!461373 lt!461370 (bvadd #b00000000000000000000000000000001 (_vacant!3069 thiss!1427)))) (tuple2!15765 Unit!34130 (LongMapFixedSize!6029 (defaultEntry!6404 thiss!1427) (mask!30577 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) (bvsub (_size!3069 thiss!1427) #b00000000000000000000000000000001) lt!461373 lt!461370 (_vacant!3069 thiss!1427)))))))

(declare-fun -!532 (ListLongMap!13787 (_ BitVec 64)) ListLongMap!13787)

(assert (=> b!1045927 (= (-!532 (getCurrentListMap!3953 (_keys!11708 thiss!1427) (_values!6427 thiss!1427) (mask!30577 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6404 thiss!1427)) key!909) (getCurrentListMap!3953 lt!461373 lt!461370 (mask!30577 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6404 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9798 0))(
  ( (MissingZero!9798 (index!41563 (_ BitVec 32))) (Found!9798 (index!41564 (_ BitVec 32))) (Intermediate!9798 (undefined!10610 Bool) (index!41565 (_ BitVec 32)) (x!93266 (_ BitVec 32))) (Undefined!9798) (MissingVacant!9798 (index!41566 (_ BitVec 32))) )
))
(declare-fun lt!461376 () SeekEntryResult!9798)

(declare-fun dynLambda!2024 (Int (_ BitVec 64)) V!37995)

(assert (=> b!1045927 (= lt!461370 (array!65904 (store (arr!31694 (_values!6427 thiss!1427)) (index!41564 lt!461376) (ValueCellFull!11717 (dynLambda!2024 (defaultEntry!6404 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32230 (_values!6427 thiss!1427))))))

(declare-fun lt!461375 () Unit!34127)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!54 (array!65901 array!65903 (_ BitVec 32) (_ BitVec 32) V!37995 V!37995 (_ BitVec 32) (_ BitVec 64) Int) Unit!34127)

(assert (=> b!1045927 (= lt!461375 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!54 (_keys!11708 thiss!1427) (_values!6427 thiss!1427) (mask!30577 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) (index!41564 lt!461376) key!909 (defaultEntry!6404 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65901 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1045927 (not (arrayContainsKey!0 lt!461373 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!461374 () Unit!34127)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65901 (_ BitVec 32) (_ BitVec 64)) Unit!34127)

(assert (=> b!1045927 (= lt!461374 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11708 thiss!1427) (index!41564 lt!461376) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65901 (_ BitVec 32)) Bool)

(assert (=> b!1045927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!461373 (mask!30577 thiss!1427))))

(declare-fun lt!461371 () Unit!34127)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65901 (_ BitVec 32) (_ BitVec 32)) Unit!34127)

(assert (=> b!1045927 (= lt!461371 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11708 thiss!1427) (index!41564 lt!461376) (mask!30577 thiss!1427)))))

(declare-datatypes ((List!22000 0))(
  ( (Nil!21997) (Cons!21996 (h!23213 (_ BitVec 64)) (t!31236 List!22000)) )
))
(declare-fun arrayNoDuplicates!0 (array!65901 (_ BitVec 32) List!22000) Bool)

(assert (=> b!1045927 (arrayNoDuplicates!0 lt!461373 #b00000000000000000000000000000000 Nil!21997)))

(declare-fun lt!461369 () Unit!34127)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65901 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22000) Unit!34127)

(assert (=> b!1045927 (= lt!461369 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11708 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41564 lt!461376) #b00000000000000000000000000000000 Nil!21997))))

(declare-fun arrayCountValidKeys!0 (array!65901 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1045927 (= (arrayCountValidKeys!0 lt!461373 #b00000000000000000000000000000000 (size!32229 (_keys!11708 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11708 thiss!1427) #b00000000000000000000000000000000 (size!32229 (_keys!11708 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1045927 (= lt!461373 (array!65902 (store (arr!31693 (_keys!11708 thiss!1427)) (index!41564 lt!461376) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32229 (_keys!11708 thiss!1427))))))

(declare-fun lt!461372 () Unit!34127)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65901 (_ BitVec 32) (_ BitVec 64)) Unit!34127)

(assert (=> b!1045927 (= lt!461372 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11708 thiss!1427) (index!41564 lt!461376) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!592878 () Bool)

(declare-fun tp_is_empty!24841 () Bool)

(declare-fun e!592873 () Bool)

(declare-fun array_inv!24491 (array!65901) Bool)

(declare-fun array_inv!24492 (array!65903) Bool)

(assert (=> b!1045928 (= e!592878 (and tp!74612 tp_is_empty!24841 (array_inv!24491 (_keys!11708 thiss!1427)) (array_inv!24492 (_values!6427 thiss!1427)) e!592873))))

(declare-fun b!1045929 () Bool)

(declare-fun res!696221 () Bool)

(assert (=> b!1045929 (=> res!696221 e!592875)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1045929 (= res!696221 (not (validMask!0 (mask!30577 (_2!7893 lt!461377)))))))

(declare-fun b!1045930 () Bool)

(declare-fun e!592877 () Bool)

(assert (=> b!1045930 (= e!592877 tp_is_empty!24841)))

(declare-fun b!1045931 () Bool)

(declare-fun mapRes!38894 () Bool)

(assert (=> b!1045931 (= e!592873 (and e!592877 mapRes!38894))))

(declare-fun condMapEmpty!38894 () Bool)

(declare-fun mapDefault!38894 () ValueCell!11717)

(assert (=> b!1045931 (= condMapEmpty!38894 (= (arr!31694 (_values!6427 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11717)) mapDefault!38894)))))

(declare-fun mapIsEmpty!38894 () Bool)

(assert (=> mapIsEmpty!38894 mapRes!38894))

(declare-fun b!1045932 () Bool)

(assert (=> b!1045932 (= e!592875 (or (not (= (size!32230 (_values!6427 (_2!7893 lt!461377))) (bvadd #b00000000000000000000000000000001 (mask!30577 (_2!7893 lt!461377))))) (= (size!32229 (_keys!11708 (_2!7893 lt!461377))) (size!32230 (_values!6427 (_2!7893 lt!461377))))))))

(declare-fun res!696222 () Bool)

(declare-fun e!592876 () Bool)

(assert (=> start!92046 (=> (not res!696222) (not e!592876))))

(declare-fun valid!2268 (LongMapFixedSize!6028) Bool)

(assert (=> start!92046 (= res!696222 (valid!2268 thiss!1427))))

(assert (=> start!92046 e!592876))

(assert (=> start!92046 e!592878))

(assert (=> start!92046 true))

(declare-fun mapNonEmpty!38894 () Bool)

(declare-fun tp!74613 () Bool)

(declare-fun e!592874 () Bool)

(assert (=> mapNonEmpty!38894 (= mapRes!38894 (and tp!74613 e!592874))))

(declare-fun mapKey!38894 () (_ BitVec 32))

(declare-fun mapValue!38894 () ValueCell!11717)

(declare-fun mapRest!38894 () (Array (_ BitVec 32) ValueCell!11717))

(assert (=> mapNonEmpty!38894 (= (arr!31694 (_values!6427 thiss!1427)) (store mapRest!38894 mapKey!38894 mapValue!38894))))

(declare-fun b!1045933 () Bool)

(assert (=> b!1045933 (= e!592874 tp_is_empty!24841)))

(declare-fun b!1045934 () Bool)

(declare-fun res!696219 () Bool)

(assert (=> b!1045934 (=> (not res!696219) (not e!592876))))

(assert (=> b!1045934 (= res!696219 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1045935 () Bool)

(assert (=> b!1045935 (= e!592876 e!592880)))

(declare-fun res!696218 () Bool)

(assert (=> b!1045935 (=> (not res!696218) (not e!592880))))

(get-info :version)

(assert (=> b!1045935 (= res!696218 ((_ is Found!9798) lt!461376))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65901 (_ BitVec 32)) SeekEntryResult!9798)

(assert (=> b!1045935 (= lt!461376 (seekEntry!0 key!909 (_keys!11708 thiss!1427) (mask!30577 thiss!1427)))))

(assert (= (and start!92046 res!696222) b!1045934))

(assert (= (and b!1045934 res!696219) b!1045935))

(assert (= (and b!1045935 res!696218) b!1045927))

(assert (= (and b!1045927 (not res!696220)) b!1045929))

(assert (= (and b!1045929 (not res!696221)) b!1045932))

(assert (= (and b!1045931 condMapEmpty!38894) mapIsEmpty!38894))

(assert (= (and b!1045931 (not condMapEmpty!38894)) mapNonEmpty!38894))

(assert (= (and mapNonEmpty!38894 ((_ is ValueCellFull!11717) mapValue!38894)) b!1045933))

(assert (= (and b!1045931 ((_ is ValueCellFull!11717) mapDefault!38894)) b!1045930))

(assert (= b!1045928 b!1045931))

(assert (= start!92046 b!1045928))

(declare-fun b_lambda!16251 () Bool)

(assert (=> (not b_lambda!16251) (not b!1045927)))

(declare-fun t!31234 () Bool)

(declare-fun tb!7057 () Bool)

(assert (=> (and b!1045928 (= (defaultEntry!6404 thiss!1427) (defaultEntry!6404 thiss!1427)) t!31234) tb!7057))

(declare-fun result!14547 () Bool)

(assert (=> tb!7057 (= result!14547 tp_is_empty!24841)))

(assert (=> b!1045927 t!31234))

(declare-fun b_and!33717 () Bool)

(assert (= b_and!33715 (and (=> t!31234 result!14547) b_and!33717)))

(declare-fun m!965755 () Bool)

(assert (=> mapNonEmpty!38894 m!965755))

(declare-fun m!965757 () Bool)

(assert (=> start!92046 m!965757))

(declare-fun m!965759 () Bool)

(assert (=> b!1045929 m!965759))

(declare-fun m!965761 () Bool)

(assert (=> b!1045927 m!965761))

(declare-fun m!965763 () Bool)

(assert (=> b!1045927 m!965763))

(declare-fun m!965765 () Bool)

(assert (=> b!1045927 m!965765))

(declare-fun m!965767 () Bool)

(assert (=> b!1045927 m!965767))

(declare-fun m!965769 () Bool)

(assert (=> b!1045927 m!965769))

(declare-fun m!965771 () Bool)

(assert (=> b!1045927 m!965771))

(declare-fun m!965773 () Bool)

(assert (=> b!1045927 m!965773))

(declare-fun m!965775 () Bool)

(assert (=> b!1045927 m!965775))

(declare-fun m!965777 () Bool)

(assert (=> b!1045927 m!965777))

(declare-fun m!965779 () Bool)

(assert (=> b!1045927 m!965779))

(declare-fun m!965781 () Bool)

(assert (=> b!1045927 m!965781))

(assert (=> b!1045927 m!965779))

(declare-fun m!965783 () Bool)

(assert (=> b!1045927 m!965783))

(declare-fun m!965785 () Bool)

(assert (=> b!1045927 m!965785))

(declare-fun m!965787 () Bool)

(assert (=> b!1045927 m!965787))

(declare-fun m!965789 () Bool)

(assert (=> b!1045927 m!965789))

(declare-fun m!965791 () Bool)

(assert (=> b!1045927 m!965791))

(declare-fun m!965793 () Bool)

(assert (=> b!1045927 m!965793))

(declare-fun m!965795 () Bool)

(assert (=> b!1045927 m!965795))

(assert (=> b!1045927 m!965789))

(declare-fun m!965797 () Bool)

(assert (=> b!1045935 m!965797))

(declare-fun m!965799 () Bool)

(assert (=> b!1045928 m!965799))

(declare-fun m!965801 () Bool)

(assert (=> b!1045928 m!965801))

(check-sat (not b!1045935) (not mapNonEmpty!38894) (not b_next!21121) b_and!33717 (not b!1045927) (not b!1045929) tp_is_empty!24841 (not start!92046) (not b!1045928) (not b_lambda!16251))
(check-sat b_and!33717 (not b_next!21121))
(get-model)

(declare-fun b_lambda!16257 () Bool)

(assert (= b_lambda!16251 (or (and b!1045928 b_free!21121) b_lambda!16257)))

(check-sat (not b!1045935) (not mapNonEmpty!38894) (not b_next!21121) (not b_lambda!16257) (not b!1045928) b_and!33717 (not b!1045927) (not b!1045929) tp_is_empty!24841 (not start!92046))
(check-sat b_and!33717 (not b_next!21121))
(get-model)

(declare-fun d!126879 () Bool)

(assert (=> d!126879 (= (array_inv!24491 (_keys!11708 thiss!1427)) (bvsge (size!32229 (_keys!11708 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1045928 d!126879))

(declare-fun d!126881 () Bool)

(assert (=> d!126881 (= (array_inv!24492 (_values!6427 thiss!1427)) (bvsge (size!32230 (_values!6427 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1045928 d!126881))

(declare-fun d!126883 () Bool)

(assert (=> d!126883 (= (validMask!0 (mask!30577 (_2!7893 lt!461377))) (and (or (= (mask!30577 (_2!7893 lt!461377)) #b00000000000000000000000000000111) (= (mask!30577 (_2!7893 lt!461377)) #b00000000000000000000000000001111) (= (mask!30577 (_2!7893 lt!461377)) #b00000000000000000000000000011111) (= (mask!30577 (_2!7893 lt!461377)) #b00000000000000000000000000111111) (= (mask!30577 (_2!7893 lt!461377)) #b00000000000000000000000001111111) (= (mask!30577 (_2!7893 lt!461377)) #b00000000000000000000000011111111) (= (mask!30577 (_2!7893 lt!461377)) #b00000000000000000000000111111111) (= (mask!30577 (_2!7893 lt!461377)) #b00000000000000000000001111111111) (= (mask!30577 (_2!7893 lt!461377)) #b00000000000000000000011111111111) (= (mask!30577 (_2!7893 lt!461377)) #b00000000000000000000111111111111) (= (mask!30577 (_2!7893 lt!461377)) #b00000000000000000001111111111111) (= (mask!30577 (_2!7893 lt!461377)) #b00000000000000000011111111111111) (= (mask!30577 (_2!7893 lt!461377)) #b00000000000000000111111111111111) (= (mask!30577 (_2!7893 lt!461377)) #b00000000000000001111111111111111) (= (mask!30577 (_2!7893 lt!461377)) #b00000000000000011111111111111111) (= (mask!30577 (_2!7893 lt!461377)) #b00000000000000111111111111111111) (= (mask!30577 (_2!7893 lt!461377)) #b00000000000001111111111111111111) (= (mask!30577 (_2!7893 lt!461377)) #b00000000000011111111111111111111) (= (mask!30577 (_2!7893 lt!461377)) #b00000000000111111111111111111111) (= (mask!30577 (_2!7893 lt!461377)) #b00000000001111111111111111111111) (= (mask!30577 (_2!7893 lt!461377)) #b00000000011111111111111111111111) (= (mask!30577 (_2!7893 lt!461377)) #b00000000111111111111111111111111) (= (mask!30577 (_2!7893 lt!461377)) #b00000001111111111111111111111111) (= (mask!30577 (_2!7893 lt!461377)) #b00000011111111111111111111111111) (= (mask!30577 (_2!7893 lt!461377)) #b00000111111111111111111111111111) (= (mask!30577 (_2!7893 lt!461377)) #b00001111111111111111111111111111) (= (mask!30577 (_2!7893 lt!461377)) #b00011111111111111111111111111111) (= (mask!30577 (_2!7893 lt!461377)) #b00111111111111111111111111111111)) (bvsle (mask!30577 (_2!7893 lt!461377)) #b00111111111111111111111111111111)))))

(assert (=> b!1045929 d!126883))

(declare-fun d!126885 () Bool)

(declare-fun e!592931 () Bool)

(assert (=> d!126885 e!592931))

(declare-fun res!696255 () Bool)

(assert (=> d!126885 (=> (not res!696255) (not e!592931))))

(assert (=> d!126885 (= res!696255 (bvslt (index!41564 lt!461376) (size!32229 (_keys!11708 thiss!1427))))))

(declare-fun lt!461434 () Unit!34127)

(declare-fun choose!121 (array!65901 (_ BitVec 32) (_ BitVec 64)) Unit!34127)

(assert (=> d!126885 (= lt!461434 (choose!121 (_keys!11708 thiss!1427) (index!41564 lt!461376) key!909))))

(assert (=> d!126885 (bvsge (index!41564 lt!461376) #b00000000000000000000000000000000)))

(assert (=> d!126885 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11708 thiss!1427) (index!41564 lt!461376) key!909) lt!461434)))

(declare-fun b!1045998 () Bool)

(assert (=> b!1045998 (= e!592931 (not (arrayContainsKey!0 (array!65902 (store (arr!31693 (_keys!11708 thiss!1427)) (index!41564 lt!461376) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32229 (_keys!11708 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126885 res!696255) b!1045998))

(declare-fun m!965899 () Bool)

(assert (=> d!126885 m!965899))

(assert (=> b!1045998 m!965783))

(declare-fun m!965901 () Bool)

(assert (=> b!1045998 m!965901))

(assert (=> b!1045927 d!126885))

(declare-fun d!126887 () Bool)

(declare-fun res!696261 () Bool)

(declare-fun e!592939 () Bool)

(assert (=> d!126887 (=> res!696261 e!592939)))

(assert (=> d!126887 (= res!696261 (bvsge #b00000000000000000000000000000000 (size!32229 lt!461373)))))

(assert (=> d!126887 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!461373 (mask!30577 thiss!1427)) e!592939)))

(declare-fun b!1046007 () Bool)

(declare-fun e!592938 () Bool)

(assert (=> b!1046007 (= e!592939 e!592938)))

(declare-fun c!106551 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1046007 (= c!106551 (validKeyInArray!0 (select (arr!31693 lt!461373) #b00000000000000000000000000000000)))))

(declare-fun b!1046008 () Bool)

(declare-fun e!592940 () Bool)

(declare-fun call!44458 () Bool)

(assert (=> b!1046008 (= e!592940 call!44458)))

(declare-fun b!1046009 () Bool)

(assert (=> b!1046009 (= e!592938 call!44458)))

(declare-fun b!1046010 () Bool)

(assert (=> b!1046010 (= e!592938 e!592940)))

(declare-fun lt!461442 () (_ BitVec 64))

(assert (=> b!1046010 (= lt!461442 (select (arr!31693 lt!461373) #b00000000000000000000000000000000))))

(declare-fun lt!461441 () Unit!34127)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65901 (_ BitVec 64) (_ BitVec 32)) Unit!34127)

(assert (=> b!1046010 (= lt!461441 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!461373 lt!461442 #b00000000000000000000000000000000))))

(assert (=> b!1046010 (arrayContainsKey!0 lt!461373 lt!461442 #b00000000000000000000000000000000)))

(declare-fun lt!461443 () Unit!34127)

(assert (=> b!1046010 (= lt!461443 lt!461441)))

(declare-fun res!696260 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65901 (_ BitVec 32)) SeekEntryResult!9798)

(assert (=> b!1046010 (= res!696260 (= (seekEntryOrOpen!0 (select (arr!31693 lt!461373) #b00000000000000000000000000000000) lt!461373 (mask!30577 thiss!1427)) (Found!9798 #b00000000000000000000000000000000)))))

(assert (=> b!1046010 (=> (not res!696260) (not e!592940))))

(declare-fun bm!44455 () Bool)

(assert (=> bm!44455 (= call!44458 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!461373 (mask!30577 thiss!1427)))))

(assert (= (and d!126887 (not res!696261)) b!1046007))

(assert (= (and b!1046007 c!106551) b!1046010))

(assert (= (and b!1046007 (not c!106551)) b!1046009))

(assert (= (and b!1046010 res!696260) b!1046008))

(assert (= (or b!1046008 b!1046009) bm!44455))

(declare-fun m!965903 () Bool)

(assert (=> b!1046007 m!965903))

(assert (=> b!1046007 m!965903))

(declare-fun m!965905 () Bool)

(assert (=> b!1046007 m!965905))

(assert (=> b!1046010 m!965903))

(declare-fun m!965907 () Bool)

(assert (=> b!1046010 m!965907))

(declare-fun m!965909 () Bool)

(assert (=> b!1046010 m!965909))

(assert (=> b!1046010 m!965903))

(declare-fun m!965911 () Bool)

(assert (=> b!1046010 m!965911))

(declare-fun m!965913 () Bool)

(assert (=> bm!44455 m!965913))

(assert (=> b!1045927 d!126887))

(declare-fun b!1046019 () Bool)

(declare-fun e!592946 () (_ BitVec 32))

(declare-fun call!44461 () (_ BitVec 32))

(assert (=> b!1046019 (= e!592946 call!44461)))

(declare-fun b!1046020 () Bool)

(declare-fun e!592945 () (_ BitVec 32))

(assert (=> b!1046020 (= e!592945 #b00000000000000000000000000000000)))

(declare-fun bm!44458 () Bool)

(assert (=> bm!44458 (= call!44461 (arrayCountValidKeys!0 lt!461373 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32229 (_keys!11708 thiss!1427))))))

(declare-fun d!126889 () Bool)

(declare-fun lt!461446 () (_ BitVec 32))

(assert (=> d!126889 (and (bvsge lt!461446 #b00000000000000000000000000000000) (bvsle lt!461446 (bvsub (size!32229 lt!461373) #b00000000000000000000000000000000)))))

(assert (=> d!126889 (= lt!461446 e!592945)))

(declare-fun c!106557 () Bool)

(assert (=> d!126889 (= c!106557 (bvsge #b00000000000000000000000000000000 (size!32229 (_keys!11708 thiss!1427))))))

(assert (=> d!126889 (and (bvsle #b00000000000000000000000000000000 (size!32229 (_keys!11708 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32229 (_keys!11708 thiss!1427)) (size!32229 lt!461373)))))

(assert (=> d!126889 (= (arrayCountValidKeys!0 lt!461373 #b00000000000000000000000000000000 (size!32229 (_keys!11708 thiss!1427))) lt!461446)))

(declare-fun b!1046021 () Bool)

(assert (=> b!1046021 (= e!592946 (bvadd #b00000000000000000000000000000001 call!44461))))

(declare-fun b!1046022 () Bool)

(assert (=> b!1046022 (= e!592945 e!592946)))

(declare-fun c!106556 () Bool)

(assert (=> b!1046022 (= c!106556 (validKeyInArray!0 (select (arr!31693 lt!461373) #b00000000000000000000000000000000)))))

(assert (= (and d!126889 c!106557) b!1046020))

(assert (= (and d!126889 (not c!106557)) b!1046022))

(assert (= (and b!1046022 c!106556) b!1046021))

(assert (= (and b!1046022 (not c!106556)) b!1046019))

(assert (= (or b!1046021 b!1046019) bm!44458))

(declare-fun m!965915 () Bool)

(assert (=> bm!44458 m!965915))

(assert (=> b!1046022 m!965903))

(assert (=> b!1046022 m!965903))

(assert (=> b!1046022 m!965905))

(assert (=> b!1045927 d!126889))

(declare-fun d!126891 () Bool)

(declare-fun e!592949 () Bool)

(assert (=> d!126891 e!592949))

(declare-fun res!696264 () Bool)

(assert (=> d!126891 (=> (not res!696264) (not e!592949))))

(assert (=> d!126891 (= res!696264 (and (bvsge (index!41564 lt!461376) #b00000000000000000000000000000000) (bvslt (index!41564 lt!461376) (size!32229 (_keys!11708 thiss!1427)))))))

(declare-fun lt!461449 () Unit!34127)

(declare-fun choose!1716 (array!65901 array!65903 (_ BitVec 32) (_ BitVec 32) V!37995 V!37995 (_ BitVec 32) (_ BitVec 64) Int) Unit!34127)

(assert (=> d!126891 (= lt!461449 (choose!1716 (_keys!11708 thiss!1427) (_values!6427 thiss!1427) (mask!30577 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) (index!41564 lt!461376) key!909 (defaultEntry!6404 thiss!1427)))))

(assert (=> d!126891 (validMask!0 (mask!30577 thiss!1427))))

(assert (=> d!126891 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!54 (_keys!11708 thiss!1427) (_values!6427 thiss!1427) (mask!30577 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) (index!41564 lt!461376) key!909 (defaultEntry!6404 thiss!1427)) lt!461449)))

(declare-fun b!1046025 () Bool)

(assert (=> b!1046025 (= e!592949 (= (-!532 (getCurrentListMap!3953 (_keys!11708 thiss!1427) (_values!6427 thiss!1427) (mask!30577 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6404 thiss!1427)) key!909) (getCurrentListMap!3953 (array!65902 (store (arr!31693 (_keys!11708 thiss!1427)) (index!41564 lt!461376) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32229 (_keys!11708 thiss!1427))) (array!65904 (store (arr!31694 (_values!6427 thiss!1427)) (index!41564 lt!461376) (ValueCellFull!11717 (dynLambda!2024 (defaultEntry!6404 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32230 (_values!6427 thiss!1427))) (mask!30577 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6404 thiss!1427))))))

(assert (=> b!1046025 (bvslt (index!41564 lt!461376) (size!32230 (_values!6427 thiss!1427)))))

(assert (= (and d!126891 res!696264) b!1046025))

(declare-fun b_lambda!16259 () Bool)

(assert (=> (not b_lambda!16259) (not b!1046025)))

(assert (=> b!1046025 t!31234))

(declare-fun b_and!33727 () Bool)

(assert (= b_and!33717 (and (=> t!31234 result!14547) b_and!33727)))

(declare-fun m!965917 () Bool)

(assert (=> d!126891 m!965917))

(declare-fun m!965919 () Bool)

(assert (=> d!126891 m!965919))

(assert (=> b!1046025 m!965789))

(declare-fun m!965921 () Bool)

(assert (=> b!1046025 m!965921))

(assert (=> b!1046025 m!965761))

(assert (=> b!1046025 m!965783))

(assert (=> b!1046025 m!965777))

(assert (=> b!1046025 m!965789))

(assert (=> b!1046025 m!965791))

(assert (=> b!1045927 d!126891))

(declare-fun b!1046068 () Bool)

(declare-fun e!592980 () ListLongMap!13787)

(declare-fun call!44481 () ListLongMap!13787)

(declare-fun +!3132 (ListLongMap!13787 tuple2!15766) ListLongMap!13787)

(assert (=> b!1046068 (= e!592980 (+!3132 call!44481 (tuple2!15767 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6238 thiss!1427))))))

(declare-fun b!1046069 () Bool)

(declare-fun e!592986 () Bool)

(declare-fun e!592976 () Bool)

(assert (=> b!1046069 (= e!592986 e!592976)))

(declare-fun res!696283 () Bool)

(assert (=> b!1046069 (=> (not res!696283) (not e!592976))))

(declare-fun lt!461509 () ListLongMap!13787)

(assert (=> b!1046069 (= res!696283 (contains!6100 lt!461509 (select (arr!31693 lt!461373) #b00000000000000000000000000000000)))))

(assert (=> b!1046069 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32229 lt!461373)))))

(declare-fun b!1046070 () Bool)

(declare-fun e!592985 () Bool)

(declare-fun e!592977 () Bool)

(assert (=> b!1046070 (= e!592985 e!592977)))

(declare-fun c!106570 () Bool)

(assert (=> b!1046070 (= c!106570 (not (= (bvand (extraKeys!6132 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1046071 () Bool)

(declare-fun e!592978 () ListLongMap!13787)

(declare-fun call!44478 () ListLongMap!13787)

(assert (=> b!1046071 (= e!592978 call!44478)))

(declare-fun bm!44473 () Bool)

(declare-fun call!44482 () ListLongMap!13787)

(declare-fun call!44477 () ListLongMap!13787)

(assert (=> bm!44473 (= call!44482 call!44477)))

(declare-fun b!1046072 () Bool)

(declare-fun e!592988 () Bool)

(assert (=> b!1046072 (= e!592977 e!592988)))

(declare-fun res!696287 () Bool)

(declare-fun call!44476 () Bool)

(assert (=> b!1046072 (= res!696287 call!44476)))

(assert (=> b!1046072 (=> (not res!696287) (not e!592988))))

(declare-fun bm!44474 () Bool)

(declare-fun call!44479 () Bool)

(assert (=> bm!44474 (= call!44479 (contains!6100 lt!461509 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1046074 () Bool)

(declare-fun res!696286 () Bool)

(assert (=> b!1046074 (=> (not res!696286) (not e!592985))))

(declare-fun e!592984 () Bool)

(assert (=> b!1046074 (= res!696286 e!592984)))

(declare-fun c!106571 () Bool)

(assert (=> b!1046074 (= c!106571 (not (= (bvand (extraKeys!6132 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1046075 () Bool)

(declare-fun e!592981 () Unit!34127)

(declare-fun lt!461514 () Unit!34127)

(assert (=> b!1046075 (= e!592981 lt!461514)))

(declare-fun lt!461499 () ListLongMap!13787)

(declare-fun getCurrentListMapNoExtraKeys!3572 (array!65901 array!65903 (_ BitVec 32) (_ BitVec 32) V!37995 V!37995 (_ BitVec 32) Int) ListLongMap!13787)

(assert (=> b!1046075 (= lt!461499 (getCurrentListMapNoExtraKeys!3572 lt!461373 lt!461370 (mask!30577 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6404 thiss!1427)))))

(declare-fun lt!461513 () (_ BitVec 64))

(assert (=> b!1046075 (= lt!461513 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461505 () (_ BitVec 64))

(assert (=> b!1046075 (= lt!461505 (select (arr!31693 lt!461373) #b00000000000000000000000000000000))))

(declare-fun lt!461508 () Unit!34127)

(declare-fun addStillContains!631 (ListLongMap!13787 (_ BitVec 64) V!37995 (_ BitVec 64)) Unit!34127)

(assert (=> b!1046075 (= lt!461508 (addStillContains!631 lt!461499 lt!461513 (zeroValue!6238 thiss!1427) lt!461505))))

(assert (=> b!1046075 (contains!6100 (+!3132 lt!461499 (tuple2!15767 lt!461513 (zeroValue!6238 thiss!1427))) lt!461505)))

(declare-fun lt!461504 () Unit!34127)

(assert (=> b!1046075 (= lt!461504 lt!461508)))

(declare-fun lt!461496 () ListLongMap!13787)

(assert (=> b!1046075 (= lt!461496 (getCurrentListMapNoExtraKeys!3572 lt!461373 lt!461370 (mask!30577 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6404 thiss!1427)))))

(declare-fun lt!461497 () (_ BitVec 64))

(assert (=> b!1046075 (= lt!461497 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461515 () (_ BitVec 64))

(assert (=> b!1046075 (= lt!461515 (select (arr!31693 lt!461373) #b00000000000000000000000000000000))))

(declare-fun lt!461506 () Unit!34127)

(declare-fun addApplyDifferent!487 (ListLongMap!13787 (_ BitVec 64) V!37995 (_ BitVec 64)) Unit!34127)

(assert (=> b!1046075 (= lt!461506 (addApplyDifferent!487 lt!461496 lt!461497 (minValue!6238 thiss!1427) lt!461515))))

(declare-fun apply!921 (ListLongMap!13787 (_ BitVec 64)) V!37995)

(assert (=> b!1046075 (= (apply!921 (+!3132 lt!461496 (tuple2!15767 lt!461497 (minValue!6238 thiss!1427))) lt!461515) (apply!921 lt!461496 lt!461515))))

(declare-fun lt!461501 () Unit!34127)

(assert (=> b!1046075 (= lt!461501 lt!461506)))

(declare-fun lt!461495 () ListLongMap!13787)

(assert (=> b!1046075 (= lt!461495 (getCurrentListMapNoExtraKeys!3572 lt!461373 lt!461370 (mask!30577 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6404 thiss!1427)))))

(declare-fun lt!461510 () (_ BitVec 64))

(assert (=> b!1046075 (= lt!461510 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461512 () (_ BitVec 64))

(assert (=> b!1046075 (= lt!461512 (select (arr!31693 lt!461373) #b00000000000000000000000000000000))))

(declare-fun lt!461502 () Unit!34127)

(assert (=> b!1046075 (= lt!461502 (addApplyDifferent!487 lt!461495 lt!461510 (zeroValue!6238 thiss!1427) lt!461512))))

(assert (=> b!1046075 (= (apply!921 (+!3132 lt!461495 (tuple2!15767 lt!461510 (zeroValue!6238 thiss!1427))) lt!461512) (apply!921 lt!461495 lt!461512))))

(declare-fun lt!461511 () Unit!34127)

(assert (=> b!1046075 (= lt!461511 lt!461502)))

(declare-fun lt!461507 () ListLongMap!13787)

(assert (=> b!1046075 (= lt!461507 (getCurrentListMapNoExtraKeys!3572 lt!461373 lt!461370 (mask!30577 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6404 thiss!1427)))))

(declare-fun lt!461500 () (_ BitVec 64))

(assert (=> b!1046075 (= lt!461500 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461494 () (_ BitVec 64))

(assert (=> b!1046075 (= lt!461494 (select (arr!31693 lt!461373) #b00000000000000000000000000000000))))

(assert (=> b!1046075 (= lt!461514 (addApplyDifferent!487 lt!461507 lt!461500 (minValue!6238 thiss!1427) lt!461494))))

(assert (=> b!1046075 (= (apply!921 (+!3132 lt!461507 (tuple2!15767 lt!461500 (minValue!6238 thiss!1427))) lt!461494) (apply!921 lt!461507 lt!461494))))

(declare-fun b!1046076 () Bool)

(assert (=> b!1046076 (= e!592988 (= (apply!921 lt!461509 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6238 thiss!1427)))))

(declare-fun bm!44475 () Bool)

(assert (=> bm!44475 (= call!44478 call!44482)))

(declare-fun b!1046077 () Bool)

(declare-fun Unit!34135 () Unit!34127)

(assert (=> b!1046077 (= e!592981 Unit!34135)))

(declare-fun b!1046078 () Bool)

(assert (=> b!1046078 (= e!592977 (not call!44476))))

(declare-fun b!1046079 () Bool)

(declare-fun e!592987 () Bool)

(assert (=> b!1046079 (= e!592984 e!592987)))

(declare-fun res!696290 () Bool)

(assert (=> b!1046079 (= res!696290 call!44479)))

(assert (=> b!1046079 (=> (not res!696290) (not e!592987))))

(declare-fun bm!44476 () Bool)

(declare-fun call!44480 () ListLongMap!13787)

(assert (=> bm!44476 (= call!44480 call!44481)))

(declare-fun b!1046080 () Bool)

(assert (=> b!1046080 (= e!592987 (= (apply!921 lt!461509 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6238 thiss!1427)))))

(declare-fun b!1046081 () Bool)

(declare-fun c!106573 () Bool)

(assert (=> b!1046081 (= c!106573 (and (not (= (bvand (extraKeys!6132 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6132 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!592983 () ListLongMap!13787)

(assert (=> b!1046081 (= e!592983 e!592978)))

(declare-fun c!106572 () Bool)

(declare-fun c!106574 () Bool)

(declare-fun bm!44477 () Bool)

(assert (=> bm!44477 (= call!44481 (+!3132 (ite c!106574 call!44477 (ite c!106572 call!44482 call!44478)) (ite (or c!106574 c!106572) (tuple2!15767 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6238 thiss!1427)) (tuple2!15767 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6238 thiss!1427)))))))

(declare-fun b!1046082 () Bool)

(declare-fun res!696291 () Bool)

(assert (=> b!1046082 (=> (not res!696291) (not e!592985))))

(assert (=> b!1046082 (= res!696291 e!592986)))

(declare-fun res!696285 () Bool)

(assert (=> b!1046082 (=> res!696285 e!592986)))

(declare-fun e!592979 () Bool)

(assert (=> b!1046082 (= res!696285 (not e!592979))))

(declare-fun res!696289 () Bool)

(assert (=> b!1046082 (=> (not res!696289) (not e!592979))))

(assert (=> b!1046082 (= res!696289 (bvslt #b00000000000000000000000000000000 (size!32229 lt!461373)))))

(declare-fun b!1046083 () Bool)

(assert (=> b!1046083 (= e!592980 e!592983)))

(assert (=> b!1046083 (= c!106572 (and (not (= (bvand (extraKeys!6132 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6132 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1046084 () Bool)

(declare-fun get!16582 (ValueCell!11717 V!37995) V!37995)

(assert (=> b!1046084 (= e!592976 (= (apply!921 lt!461509 (select (arr!31693 lt!461373) #b00000000000000000000000000000000)) (get!16582 (select (arr!31694 lt!461370) #b00000000000000000000000000000000) (dynLambda!2024 (defaultEntry!6404 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1046084 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32230 lt!461370)))))

(assert (=> b!1046084 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32229 lt!461373)))))

(declare-fun b!1046085 () Bool)

(assert (=> b!1046085 (= e!592978 call!44480)))

(declare-fun bm!44478 () Bool)

(assert (=> bm!44478 (= call!44476 (contains!6100 lt!461509 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!44479 () Bool)

(assert (=> bm!44479 (= call!44477 (getCurrentListMapNoExtraKeys!3572 lt!461373 lt!461370 (mask!30577 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6404 thiss!1427)))))

(declare-fun b!1046086 () Bool)

(assert (=> b!1046086 (= e!592983 call!44480)))

(declare-fun b!1046087 () Bool)

(declare-fun e!592982 () Bool)

(assert (=> b!1046087 (= e!592982 (validKeyInArray!0 (select (arr!31693 lt!461373) #b00000000000000000000000000000000)))))

(declare-fun b!1046088 () Bool)

(assert (=> b!1046088 (= e!592979 (validKeyInArray!0 (select (arr!31693 lt!461373) #b00000000000000000000000000000000)))))

(declare-fun b!1046073 () Bool)

(assert (=> b!1046073 (= e!592984 (not call!44479))))

(declare-fun d!126893 () Bool)

(assert (=> d!126893 e!592985))

(declare-fun res!696284 () Bool)

(assert (=> d!126893 (=> (not res!696284) (not e!592985))))

(assert (=> d!126893 (= res!696284 (or (bvsge #b00000000000000000000000000000000 (size!32229 lt!461373)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32229 lt!461373)))))))

(declare-fun lt!461503 () ListLongMap!13787)

(assert (=> d!126893 (= lt!461509 lt!461503)))

(declare-fun lt!461498 () Unit!34127)

(assert (=> d!126893 (= lt!461498 e!592981)))

(declare-fun c!106575 () Bool)

(assert (=> d!126893 (= c!106575 e!592982)))

(declare-fun res!696288 () Bool)

(assert (=> d!126893 (=> (not res!696288) (not e!592982))))

(assert (=> d!126893 (= res!696288 (bvslt #b00000000000000000000000000000000 (size!32229 lt!461373)))))

(assert (=> d!126893 (= lt!461503 e!592980)))

(assert (=> d!126893 (= c!106574 (and (not (= (bvand (extraKeys!6132 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6132 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126893 (validMask!0 (mask!30577 thiss!1427))))

(assert (=> d!126893 (= (getCurrentListMap!3953 lt!461373 lt!461370 (mask!30577 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6404 thiss!1427)) lt!461509)))

(assert (= (and d!126893 c!106574) b!1046068))

(assert (= (and d!126893 (not c!106574)) b!1046083))

(assert (= (and b!1046083 c!106572) b!1046086))

(assert (= (and b!1046083 (not c!106572)) b!1046081))

(assert (= (and b!1046081 c!106573) b!1046085))

(assert (= (and b!1046081 (not c!106573)) b!1046071))

(assert (= (or b!1046085 b!1046071) bm!44475))

(assert (= (or b!1046086 bm!44475) bm!44473))

(assert (= (or b!1046086 b!1046085) bm!44476))

(assert (= (or b!1046068 bm!44473) bm!44479))

(assert (= (or b!1046068 bm!44476) bm!44477))

(assert (= (and d!126893 res!696288) b!1046087))

(assert (= (and d!126893 c!106575) b!1046075))

(assert (= (and d!126893 (not c!106575)) b!1046077))

(assert (= (and d!126893 res!696284) b!1046082))

(assert (= (and b!1046082 res!696289) b!1046088))

(assert (= (and b!1046082 (not res!696285)) b!1046069))

(assert (= (and b!1046069 res!696283) b!1046084))

(assert (= (and b!1046082 res!696291) b!1046074))

(assert (= (and b!1046074 c!106571) b!1046079))

(assert (= (and b!1046074 (not c!106571)) b!1046073))

(assert (= (and b!1046079 res!696290) b!1046080))

(assert (= (or b!1046079 b!1046073) bm!44474))

(assert (= (and b!1046074 res!696286) b!1046070))

(assert (= (and b!1046070 c!106570) b!1046072))

(assert (= (and b!1046070 (not c!106570)) b!1046078))

(assert (= (and b!1046072 res!696287) b!1046076))

(assert (= (or b!1046072 b!1046078) bm!44478))

(declare-fun b_lambda!16261 () Bool)

(assert (=> (not b_lambda!16261) (not b!1046084)))

(assert (=> b!1046084 t!31234))

(declare-fun b_and!33729 () Bool)

(assert (= b_and!33727 (and (=> t!31234 result!14547) b_and!33729)))

(assert (=> b!1046087 m!965903))

(assert (=> b!1046087 m!965903))

(assert (=> b!1046087 m!965905))

(declare-fun m!965923 () Bool)

(assert (=> b!1046068 m!965923))

(declare-fun m!965925 () Bool)

(assert (=> bm!44474 m!965925))

(declare-fun m!965927 () Bool)

(assert (=> bm!44479 m!965927))

(declare-fun m!965929 () Bool)

(assert (=> bm!44477 m!965929))

(declare-fun m!965931 () Bool)

(assert (=> b!1046076 m!965931))

(declare-fun m!965933 () Bool)

(assert (=> b!1046084 m!965933))

(assert (=> b!1046084 m!965903))

(declare-fun m!965935 () Bool)

(assert (=> b!1046084 m!965935))

(assert (=> b!1046084 m!965777))

(assert (=> b!1046084 m!965933))

(assert (=> b!1046084 m!965777))

(declare-fun m!965937 () Bool)

(assert (=> b!1046084 m!965937))

(assert (=> b!1046084 m!965903))

(assert (=> d!126893 m!965919))

(declare-fun m!965939 () Bool)

(assert (=> bm!44478 m!965939))

(assert (=> b!1046088 m!965903))

(assert (=> b!1046088 m!965903))

(assert (=> b!1046088 m!965905))

(declare-fun m!965941 () Bool)

(assert (=> b!1046080 m!965941))

(declare-fun m!965943 () Bool)

(assert (=> b!1046075 m!965943))

(declare-fun m!965945 () Bool)

(assert (=> b!1046075 m!965945))

(declare-fun m!965947 () Bool)

(assert (=> b!1046075 m!965947))

(declare-fun m!965949 () Bool)

(assert (=> b!1046075 m!965949))

(declare-fun m!965951 () Bool)

(assert (=> b!1046075 m!965951))

(declare-fun m!965953 () Bool)

(assert (=> b!1046075 m!965953))

(declare-fun m!965955 () Bool)

(assert (=> b!1046075 m!965955))

(declare-fun m!965957 () Bool)

(assert (=> b!1046075 m!965957))

(declare-fun m!965959 () Bool)

(assert (=> b!1046075 m!965959))

(declare-fun m!965961 () Bool)

(assert (=> b!1046075 m!965961))

(declare-fun m!965963 () Bool)

(assert (=> b!1046075 m!965963))

(assert (=> b!1046075 m!965947))

(assert (=> b!1046075 m!965959))

(assert (=> b!1046075 m!965927))

(declare-fun m!965965 () Bool)

(assert (=> b!1046075 m!965965))

(declare-fun m!965967 () Bool)

(assert (=> b!1046075 m!965967))

(assert (=> b!1046075 m!965953))

(assert (=> b!1046075 m!965951))

(declare-fun m!965969 () Bool)

(assert (=> b!1046075 m!965969))

(assert (=> b!1046075 m!965903))

(declare-fun m!965971 () Bool)

(assert (=> b!1046075 m!965971))

(assert (=> b!1046069 m!965903))

(assert (=> b!1046069 m!965903))

(declare-fun m!965973 () Bool)

(assert (=> b!1046069 m!965973))

(assert (=> b!1045927 d!126893))

(declare-fun b!1046089 () Bool)

(declare-fun e!592993 () ListLongMap!13787)

(declare-fun call!44488 () ListLongMap!13787)

(assert (=> b!1046089 (= e!592993 (+!3132 call!44488 (tuple2!15767 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6238 thiss!1427))))))

(declare-fun b!1046090 () Bool)

(declare-fun e!592999 () Bool)

(declare-fun e!592989 () Bool)

(assert (=> b!1046090 (= e!592999 e!592989)))

(declare-fun res!696292 () Bool)

(assert (=> b!1046090 (=> (not res!696292) (not e!592989))))

(declare-fun lt!461531 () ListLongMap!13787)

(assert (=> b!1046090 (= res!696292 (contains!6100 lt!461531 (select (arr!31693 (_keys!11708 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1046090 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32229 (_keys!11708 thiss!1427))))))

(declare-fun b!1046091 () Bool)

(declare-fun e!592998 () Bool)

(declare-fun e!592990 () Bool)

(assert (=> b!1046091 (= e!592998 e!592990)))

(declare-fun c!106576 () Bool)

(assert (=> b!1046091 (= c!106576 (not (= (bvand (extraKeys!6132 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1046092 () Bool)

(declare-fun e!592991 () ListLongMap!13787)

(declare-fun call!44485 () ListLongMap!13787)

(assert (=> b!1046092 (= e!592991 call!44485)))

(declare-fun bm!44480 () Bool)

(declare-fun call!44489 () ListLongMap!13787)

(declare-fun call!44484 () ListLongMap!13787)

(assert (=> bm!44480 (= call!44489 call!44484)))

(declare-fun b!1046093 () Bool)

(declare-fun e!593001 () Bool)

(assert (=> b!1046093 (= e!592990 e!593001)))

(declare-fun res!696296 () Bool)

(declare-fun call!44483 () Bool)

(assert (=> b!1046093 (= res!696296 call!44483)))

(assert (=> b!1046093 (=> (not res!696296) (not e!593001))))

(declare-fun bm!44481 () Bool)

(declare-fun call!44486 () Bool)

(assert (=> bm!44481 (= call!44486 (contains!6100 lt!461531 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1046095 () Bool)

(declare-fun res!696295 () Bool)

(assert (=> b!1046095 (=> (not res!696295) (not e!592998))))

(declare-fun e!592997 () Bool)

(assert (=> b!1046095 (= res!696295 e!592997)))

(declare-fun c!106577 () Bool)

(assert (=> b!1046095 (= c!106577 (not (= (bvand (extraKeys!6132 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1046096 () Bool)

(declare-fun e!592994 () Unit!34127)

(declare-fun lt!461536 () Unit!34127)

(assert (=> b!1046096 (= e!592994 lt!461536)))

(declare-fun lt!461521 () ListLongMap!13787)

(assert (=> b!1046096 (= lt!461521 (getCurrentListMapNoExtraKeys!3572 (_keys!11708 thiss!1427) (_values!6427 thiss!1427) (mask!30577 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6404 thiss!1427)))))

(declare-fun lt!461535 () (_ BitVec 64))

(assert (=> b!1046096 (= lt!461535 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461527 () (_ BitVec 64))

(assert (=> b!1046096 (= lt!461527 (select (arr!31693 (_keys!11708 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!461530 () Unit!34127)

(assert (=> b!1046096 (= lt!461530 (addStillContains!631 lt!461521 lt!461535 (zeroValue!6238 thiss!1427) lt!461527))))

(assert (=> b!1046096 (contains!6100 (+!3132 lt!461521 (tuple2!15767 lt!461535 (zeroValue!6238 thiss!1427))) lt!461527)))

(declare-fun lt!461526 () Unit!34127)

(assert (=> b!1046096 (= lt!461526 lt!461530)))

(declare-fun lt!461518 () ListLongMap!13787)

(assert (=> b!1046096 (= lt!461518 (getCurrentListMapNoExtraKeys!3572 (_keys!11708 thiss!1427) (_values!6427 thiss!1427) (mask!30577 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6404 thiss!1427)))))

(declare-fun lt!461519 () (_ BitVec 64))

(assert (=> b!1046096 (= lt!461519 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461537 () (_ BitVec 64))

(assert (=> b!1046096 (= lt!461537 (select (arr!31693 (_keys!11708 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!461528 () Unit!34127)

(assert (=> b!1046096 (= lt!461528 (addApplyDifferent!487 lt!461518 lt!461519 (minValue!6238 thiss!1427) lt!461537))))

(assert (=> b!1046096 (= (apply!921 (+!3132 lt!461518 (tuple2!15767 lt!461519 (minValue!6238 thiss!1427))) lt!461537) (apply!921 lt!461518 lt!461537))))

(declare-fun lt!461523 () Unit!34127)

(assert (=> b!1046096 (= lt!461523 lt!461528)))

(declare-fun lt!461517 () ListLongMap!13787)

(assert (=> b!1046096 (= lt!461517 (getCurrentListMapNoExtraKeys!3572 (_keys!11708 thiss!1427) (_values!6427 thiss!1427) (mask!30577 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6404 thiss!1427)))))

(declare-fun lt!461532 () (_ BitVec 64))

(assert (=> b!1046096 (= lt!461532 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461534 () (_ BitVec 64))

(assert (=> b!1046096 (= lt!461534 (select (arr!31693 (_keys!11708 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!461524 () Unit!34127)

(assert (=> b!1046096 (= lt!461524 (addApplyDifferent!487 lt!461517 lt!461532 (zeroValue!6238 thiss!1427) lt!461534))))

(assert (=> b!1046096 (= (apply!921 (+!3132 lt!461517 (tuple2!15767 lt!461532 (zeroValue!6238 thiss!1427))) lt!461534) (apply!921 lt!461517 lt!461534))))

(declare-fun lt!461533 () Unit!34127)

(assert (=> b!1046096 (= lt!461533 lt!461524)))

(declare-fun lt!461529 () ListLongMap!13787)

(assert (=> b!1046096 (= lt!461529 (getCurrentListMapNoExtraKeys!3572 (_keys!11708 thiss!1427) (_values!6427 thiss!1427) (mask!30577 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6404 thiss!1427)))))

(declare-fun lt!461522 () (_ BitVec 64))

(assert (=> b!1046096 (= lt!461522 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461516 () (_ BitVec 64))

(assert (=> b!1046096 (= lt!461516 (select (arr!31693 (_keys!11708 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1046096 (= lt!461536 (addApplyDifferent!487 lt!461529 lt!461522 (minValue!6238 thiss!1427) lt!461516))))

(assert (=> b!1046096 (= (apply!921 (+!3132 lt!461529 (tuple2!15767 lt!461522 (minValue!6238 thiss!1427))) lt!461516) (apply!921 lt!461529 lt!461516))))

(declare-fun b!1046097 () Bool)

(assert (=> b!1046097 (= e!593001 (= (apply!921 lt!461531 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6238 thiss!1427)))))

(declare-fun bm!44482 () Bool)

(assert (=> bm!44482 (= call!44485 call!44489)))

(declare-fun b!1046098 () Bool)

(declare-fun Unit!34136 () Unit!34127)

(assert (=> b!1046098 (= e!592994 Unit!34136)))

(declare-fun b!1046099 () Bool)

(assert (=> b!1046099 (= e!592990 (not call!44483))))

(declare-fun b!1046100 () Bool)

(declare-fun e!593000 () Bool)

(assert (=> b!1046100 (= e!592997 e!593000)))

(declare-fun res!696299 () Bool)

(assert (=> b!1046100 (= res!696299 call!44486)))

(assert (=> b!1046100 (=> (not res!696299) (not e!593000))))

(declare-fun bm!44483 () Bool)

(declare-fun call!44487 () ListLongMap!13787)

(assert (=> bm!44483 (= call!44487 call!44488)))

(declare-fun b!1046101 () Bool)

(assert (=> b!1046101 (= e!593000 (= (apply!921 lt!461531 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6238 thiss!1427)))))

(declare-fun b!1046102 () Bool)

(declare-fun c!106579 () Bool)

(assert (=> b!1046102 (= c!106579 (and (not (= (bvand (extraKeys!6132 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6132 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!592996 () ListLongMap!13787)

(assert (=> b!1046102 (= e!592996 e!592991)))

(declare-fun c!106580 () Bool)

(declare-fun bm!44484 () Bool)

(declare-fun c!106578 () Bool)

(assert (=> bm!44484 (= call!44488 (+!3132 (ite c!106580 call!44484 (ite c!106578 call!44489 call!44485)) (ite (or c!106580 c!106578) (tuple2!15767 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6238 thiss!1427)) (tuple2!15767 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6238 thiss!1427)))))))

(declare-fun b!1046103 () Bool)

(declare-fun res!696300 () Bool)

(assert (=> b!1046103 (=> (not res!696300) (not e!592998))))

(assert (=> b!1046103 (= res!696300 e!592999)))

(declare-fun res!696294 () Bool)

(assert (=> b!1046103 (=> res!696294 e!592999)))

(declare-fun e!592992 () Bool)

(assert (=> b!1046103 (= res!696294 (not e!592992))))

(declare-fun res!696298 () Bool)

(assert (=> b!1046103 (=> (not res!696298) (not e!592992))))

(assert (=> b!1046103 (= res!696298 (bvslt #b00000000000000000000000000000000 (size!32229 (_keys!11708 thiss!1427))))))

(declare-fun b!1046104 () Bool)

(assert (=> b!1046104 (= e!592993 e!592996)))

(assert (=> b!1046104 (= c!106578 (and (not (= (bvand (extraKeys!6132 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6132 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1046105 () Bool)

(assert (=> b!1046105 (= e!592989 (= (apply!921 lt!461531 (select (arr!31693 (_keys!11708 thiss!1427)) #b00000000000000000000000000000000)) (get!16582 (select (arr!31694 (_values!6427 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2024 (defaultEntry!6404 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1046105 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32230 (_values!6427 thiss!1427))))))

(assert (=> b!1046105 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32229 (_keys!11708 thiss!1427))))))

(declare-fun b!1046106 () Bool)

(assert (=> b!1046106 (= e!592991 call!44487)))

(declare-fun bm!44485 () Bool)

(assert (=> bm!44485 (= call!44483 (contains!6100 lt!461531 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!44486 () Bool)

(assert (=> bm!44486 (= call!44484 (getCurrentListMapNoExtraKeys!3572 (_keys!11708 thiss!1427) (_values!6427 thiss!1427) (mask!30577 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6404 thiss!1427)))))

(declare-fun b!1046107 () Bool)

(assert (=> b!1046107 (= e!592996 call!44487)))

(declare-fun b!1046108 () Bool)

(declare-fun e!592995 () Bool)

(assert (=> b!1046108 (= e!592995 (validKeyInArray!0 (select (arr!31693 (_keys!11708 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1046109 () Bool)

(assert (=> b!1046109 (= e!592992 (validKeyInArray!0 (select (arr!31693 (_keys!11708 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1046094 () Bool)

(assert (=> b!1046094 (= e!592997 (not call!44486))))

(declare-fun d!126895 () Bool)

(assert (=> d!126895 e!592998))

(declare-fun res!696293 () Bool)

(assert (=> d!126895 (=> (not res!696293) (not e!592998))))

(assert (=> d!126895 (= res!696293 (or (bvsge #b00000000000000000000000000000000 (size!32229 (_keys!11708 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32229 (_keys!11708 thiss!1427))))))))

(declare-fun lt!461525 () ListLongMap!13787)

(assert (=> d!126895 (= lt!461531 lt!461525)))

(declare-fun lt!461520 () Unit!34127)

(assert (=> d!126895 (= lt!461520 e!592994)))

(declare-fun c!106581 () Bool)

(assert (=> d!126895 (= c!106581 e!592995)))

(declare-fun res!696297 () Bool)

(assert (=> d!126895 (=> (not res!696297) (not e!592995))))

(assert (=> d!126895 (= res!696297 (bvslt #b00000000000000000000000000000000 (size!32229 (_keys!11708 thiss!1427))))))

(assert (=> d!126895 (= lt!461525 e!592993)))

(assert (=> d!126895 (= c!106580 (and (not (= (bvand (extraKeys!6132 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6132 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126895 (validMask!0 (mask!30577 thiss!1427))))

(assert (=> d!126895 (= (getCurrentListMap!3953 (_keys!11708 thiss!1427) (_values!6427 thiss!1427) (mask!30577 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6404 thiss!1427)) lt!461531)))

(assert (= (and d!126895 c!106580) b!1046089))

(assert (= (and d!126895 (not c!106580)) b!1046104))

(assert (= (and b!1046104 c!106578) b!1046107))

(assert (= (and b!1046104 (not c!106578)) b!1046102))

(assert (= (and b!1046102 c!106579) b!1046106))

(assert (= (and b!1046102 (not c!106579)) b!1046092))

(assert (= (or b!1046106 b!1046092) bm!44482))

(assert (= (or b!1046107 bm!44482) bm!44480))

(assert (= (or b!1046107 b!1046106) bm!44483))

(assert (= (or b!1046089 bm!44480) bm!44486))

(assert (= (or b!1046089 bm!44483) bm!44484))

(assert (= (and d!126895 res!696297) b!1046108))

(assert (= (and d!126895 c!106581) b!1046096))

(assert (= (and d!126895 (not c!106581)) b!1046098))

(assert (= (and d!126895 res!696293) b!1046103))

(assert (= (and b!1046103 res!696298) b!1046109))

(assert (= (and b!1046103 (not res!696294)) b!1046090))

(assert (= (and b!1046090 res!696292) b!1046105))

(assert (= (and b!1046103 res!696300) b!1046095))

(assert (= (and b!1046095 c!106577) b!1046100))

(assert (= (and b!1046095 (not c!106577)) b!1046094))

(assert (= (and b!1046100 res!696299) b!1046101))

(assert (= (or b!1046100 b!1046094) bm!44481))

(assert (= (and b!1046095 res!696295) b!1046091))

(assert (= (and b!1046091 c!106576) b!1046093))

(assert (= (and b!1046091 (not c!106576)) b!1046099))

(assert (= (and b!1046093 res!696296) b!1046097))

(assert (= (or b!1046093 b!1046099) bm!44485))

(declare-fun b_lambda!16263 () Bool)

(assert (=> (not b_lambda!16263) (not b!1046105)))

(assert (=> b!1046105 t!31234))

(declare-fun b_and!33731 () Bool)

(assert (= b_and!33729 (and (=> t!31234 result!14547) b_and!33731)))

(declare-fun m!965975 () Bool)

(assert (=> b!1046108 m!965975))

(assert (=> b!1046108 m!965975))

(declare-fun m!965977 () Bool)

(assert (=> b!1046108 m!965977))

(declare-fun m!965979 () Bool)

(assert (=> b!1046089 m!965979))

(declare-fun m!965981 () Bool)

(assert (=> bm!44481 m!965981))

(declare-fun m!965983 () Bool)

(assert (=> bm!44486 m!965983))

(declare-fun m!965985 () Bool)

(assert (=> bm!44484 m!965985))

(declare-fun m!965987 () Bool)

(assert (=> b!1046097 m!965987))

(declare-fun m!965989 () Bool)

(assert (=> b!1046105 m!965989))

(assert (=> b!1046105 m!965975))

(declare-fun m!965991 () Bool)

(assert (=> b!1046105 m!965991))

(assert (=> b!1046105 m!965777))

(assert (=> b!1046105 m!965989))

(assert (=> b!1046105 m!965777))

(declare-fun m!965993 () Bool)

(assert (=> b!1046105 m!965993))

(assert (=> b!1046105 m!965975))

(assert (=> d!126895 m!965919))

(declare-fun m!965995 () Bool)

(assert (=> bm!44485 m!965995))

(assert (=> b!1046109 m!965975))

(assert (=> b!1046109 m!965975))

(assert (=> b!1046109 m!965977))

(declare-fun m!965997 () Bool)

(assert (=> b!1046101 m!965997))

(declare-fun m!965999 () Bool)

(assert (=> b!1046096 m!965999))

(declare-fun m!966001 () Bool)

(assert (=> b!1046096 m!966001))

(declare-fun m!966003 () Bool)

(assert (=> b!1046096 m!966003))

(declare-fun m!966005 () Bool)

(assert (=> b!1046096 m!966005))

(declare-fun m!966007 () Bool)

(assert (=> b!1046096 m!966007))

(declare-fun m!966009 () Bool)

(assert (=> b!1046096 m!966009))

(declare-fun m!966011 () Bool)

(assert (=> b!1046096 m!966011))

(declare-fun m!966013 () Bool)

(assert (=> b!1046096 m!966013))

(declare-fun m!966015 () Bool)

(assert (=> b!1046096 m!966015))

(declare-fun m!966017 () Bool)

(assert (=> b!1046096 m!966017))

(declare-fun m!966019 () Bool)

(assert (=> b!1046096 m!966019))

(assert (=> b!1046096 m!966003))

(assert (=> b!1046096 m!966015))

(assert (=> b!1046096 m!965983))

(declare-fun m!966021 () Bool)

(assert (=> b!1046096 m!966021))

(declare-fun m!966023 () Bool)

(assert (=> b!1046096 m!966023))

(assert (=> b!1046096 m!966009))

(assert (=> b!1046096 m!966007))

(declare-fun m!966025 () Bool)

(assert (=> b!1046096 m!966025))

(assert (=> b!1046096 m!965975))

(declare-fun m!966027 () Bool)

(assert (=> b!1046096 m!966027))

(assert (=> b!1046090 m!965975))

(assert (=> b!1046090 m!965975))

(declare-fun m!966029 () Bool)

(assert (=> b!1046090 m!966029))

(assert (=> b!1045927 d!126895))

(declare-fun d!126897 () Bool)

(declare-fun res!696305 () Bool)

(declare-fun e!593006 () Bool)

(assert (=> d!126897 (=> res!696305 e!593006)))

(assert (=> d!126897 (= res!696305 (= (select (arr!31693 lt!461373) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126897 (= (arrayContainsKey!0 lt!461373 key!909 #b00000000000000000000000000000000) e!593006)))

(declare-fun b!1046114 () Bool)

(declare-fun e!593007 () Bool)

(assert (=> b!1046114 (= e!593006 e!593007)))

(declare-fun res!696306 () Bool)

(assert (=> b!1046114 (=> (not res!696306) (not e!593007))))

(assert (=> b!1046114 (= res!696306 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32229 lt!461373)))))

(declare-fun b!1046115 () Bool)

(assert (=> b!1046115 (= e!593007 (arrayContainsKey!0 lt!461373 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126897 (not res!696305)) b!1046114))

(assert (= (and b!1046114 res!696306) b!1046115))

(assert (=> d!126897 m!965903))

(declare-fun m!966031 () Bool)

(assert (=> b!1046115 m!966031))

(assert (=> b!1045927 d!126897))

(declare-fun d!126899 () Bool)

(declare-fun e!593010 () Bool)

(assert (=> d!126899 e!593010))

(declare-fun res!696309 () Bool)

(assert (=> d!126899 (=> (not res!696309) (not e!593010))))

(assert (=> d!126899 (= res!696309 (and (bvsge (index!41564 lt!461376) #b00000000000000000000000000000000) (bvslt (index!41564 lt!461376) (size!32229 (_keys!11708 thiss!1427)))))))

(declare-fun lt!461540 () Unit!34127)

(declare-fun choose!53 (array!65901 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22000) Unit!34127)

(assert (=> d!126899 (= lt!461540 (choose!53 (_keys!11708 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41564 lt!461376) #b00000000000000000000000000000000 Nil!21997))))

(assert (=> d!126899 (bvslt (size!32229 (_keys!11708 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126899 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11708 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41564 lt!461376) #b00000000000000000000000000000000 Nil!21997) lt!461540)))

(declare-fun b!1046118 () Bool)

(assert (=> b!1046118 (= e!593010 (arrayNoDuplicates!0 (array!65902 (store (arr!31693 (_keys!11708 thiss!1427)) (index!41564 lt!461376) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32229 (_keys!11708 thiss!1427))) #b00000000000000000000000000000000 Nil!21997))))

(assert (= (and d!126899 res!696309) b!1046118))

(declare-fun m!966033 () Bool)

(assert (=> d!126899 m!966033))

(assert (=> b!1046118 m!965783))

(declare-fun m!966035 () Bool)

(assert (=> b!1046118 m!966035))

(assert (=> b!1045927 d!126899))

(declare-fun b!1046127 () Bool)

(declare-fun res!696320 () Bool)

(declare-fun e!593015 () Bool)

(assert (=> b!1046127 (=> (not res!696320) (not e!593015))))

(assert (=> b!1046127 (= res!696320 (validKeyInArray!0 (select (arr!31693 (_keys!11708 thiss!1427)) (index!41564 lt!461376))))))

(declare-fun b!1046129 () Bool)

(assert (=> b!1046129 (= e!593015 (bvslt (size!32229 (_keys!11708 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1046128 () Bool)

(declare-fun res!696319 () Bool)

(assert (=> b!1046128 (=> (not res!696319) (not e!593015))))

(assert (=> b!1046128 (= res!696319 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1046130 () Bool)

(declare-fun e!593016 () Bool)

(assert (=> b!1046130 (= e!593016 (= (arrayCountValidKeys!0 (array!65902 (store (arr!31693 (_keys!11708 thiss!1427)) (index!41564 lt!461376) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32229 (_keys!11708 thiss!1427))) #b00000000000000000000000000000000 (size!32229 (_keys!11708 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11708 thiss!1427) #b00000000000000000000000000000000 (size!32229 (_keys!11708 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun d!126901 () Bool)

(assert (=> d!126901 e!593016))

(declare-fun res!696318 () Bool)

(assert (=> d!126901 (=> (not res!696318) (not e!593016))))

(assert (=> d!126901 (= res!696318 (and (bvsge (index!41564 lt!461376) #b00000000000000000000000000000000) (bvslt (index!41564 lt!461376) (size!32229 (_keys!11708 thiss!1427)))))))

(declare-fun lt!461543 () Unit!34127)

(declare-fun choose!82 (array!65901 (_ BitVec 32) (_ BitVec 64)) Unit!34127)

(assert (=> d!126901 (= lt!461543 (choose!82 (_keys!11708 thiss!1427) (index!41564 lt!461376) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!126901 e!593015))

(declare-fun res!696321 () Bool)

(assert (=> d!126901 (=> (not res!696321) (not e!593015))))

(assert (=> d!126901 (= res!696321 (and (bvsge (index!41564 lt!461376) #b00000000000000000000000000000000) (bvslt (index!41564 lt!461376) (size!32229 (_keys!11708 thiss!1427)))))))

(assert (=> d!126901 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11708 thiss!1427) (index!41564 lt!461376) #b1000000000000000000000000000000000000000000000000000000000000000) lt!461543)))

(assert (= (and d!126901 res!696321) b!1046127))

(assert (= (and b!1046127 res!696320) b!1046128))

(assert (= (and b!1046128 res!696319) b!1046129))

(assert (= (and d!126901 res!696318) b!1046130))

(declare-fun m!966037 () Bool)

(assert (=> b!1046127 m!966037))

(assert (=> b!1046127 m!966037))

(declare-fun m!966039 () Bool)

(assert (=> b!1046127 m!966039))

(declare-fun m!966041 () Bool)

(assert (=> b!1046128 m!966041))

(assert (=> b!1046130 m!965783))

(declare-fun m!966043 () Bool)

(assert (=> b!1046130 m!966043))

(assert (=> b!1046130 m!965769))

(declare-fun m!966045 () Bool)

(assert (=> d!126901 m!966045))

(assert (=> b!1045927 d!126901))

(declare-fun d!126903 () Bool)

(declare-fun res!696328 () Bool)

(declare-fun e!593025 () Bool)

(assert (=> d!126903 (=> res!696328 e!593025)))

(assert (=> d!126903 (= res!696328 (bvsge #b00000000000000000000000000000000 (size!32229 lt!461373)))))

(assert (=> d!126903 (= (arrayNoDuplicates!0 lt!461373 #b00000000000000000000000000000000 Nil!21997) e!593025)))

(declare-fun b!1046141 () Bool)

(declare-fun e!593026 () Bool)

(declare-fun contains!6102 (List!22000 (_ BitVec 64)) Bool)

(assert (=> b!1046141 (= e!593026 (contains!6102 Nil!21997 (select (arr!31693 lt!461373) #b00000000000000000000000000000000)))))

(declare-fun bm!44489 () Bool)

(declare-fun call!44492 () Bool)

(declare-fun c!106584 () Bool)

(assert (=> bm!44489 (= call!44492 (arrayNoDuplicates!0 lt!461373 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106584 (Cons!21996 (select (arr!31693 lt!461373) #b00000000000000000000000000000000) Nil!21997) Nil!21997)))))

(declare-fun b!1046142 () Bool)

(declare-fun e!593027 () Bool)

(declare-fun e!593028 () Bool)

(assert (=> b!1046142 (= e!593027 e!593028)))

(assert (=> b!1046142 (= c!106584 (validKeyInArray!0 (select (arr!31693 lt!461373) #b00000000000000000000000000000000)))))

(declare-fun b!1046143 () Bool)

(assert (=> b!1046143 (= e!593025 e!593027)))

(declare-fun res!696329 () Bool)

(assert (=> b!1046143 (=> (not res!696329) (not e!593027))))

(assert (=> b!1046143 (= res!696329 (not e!593026))))

(declare-fun res!696330 () Bool)

(assert (=> b!1046143 (=> (not res!696330) (not e!593026))))

(assert (=> b!1046143 (= res!696330 (validKeyInArray!0 (select (arr!31693 lt!461373) #b00000000000000000000000000000000)))))

(declare-fun b!1046144 () Bool)

(assert (=> b!1046144 (= e!593028 call!44492)))

(declare-fun b!1046145 () Bool)

(assert (=> b!1046145 (= e!593028 call!44492)))

(assert (= (and d!126903 (not res!696328)) b!1046143))

(assert (= (and b!1046143 res!696330) b!1046141))

(assert (= (and b!1046143 res!696329) b!1046142))

(assert (= (and b!1046142 c!106584) b!1046144))

(assert (= (and b!1046142 (not c!106584)) b!1046145))

(assert (= (or b!1046144 b!1046145) bm!44489))

(assert (=> b!1046141 m!965903))

(assert (=> b!1046141 m!965903))

(declare-fun m!966047 () Bool)

(assert (=> b!1046141 m!966047))

(assert (=> bm!44489 m!965903))

(declare-fun m!966049 () Bool)

(assert (=> bm!44489 m!966049))

(assert (=> b!1046142 m!965903))

(assert (=> b!1046142 m!965903))

(assert (=> b!1046142 m!965905))

(assert (=> b!1046143 m!965903))

(assert (=> b!1046143 m!965903))

(assert (=> b!1046143 m!965905))

(assert (=> b!1045927 d!126903))

(declare-fun d!126905 () Bool)

(declare-fun e!593034 () Bool)

(assert (=> d!126905 e!593034))

(declare-fun res!696333 () Bool)

(assert (=> d!126905 (=> res!696333 e!593034)))

(declare-fun lt!461553 () Bool)

(assert (=> d!126905 (= res!696333 (not lt!461553))))

(declare-fun lt!461554 () Bool)

(assert (=> d!126905 (= lt!461553 lt!461554)))

(declare-fun lt!461555 () Unit!34127)

(declare-fun e!593033 () Unit!34127)

(assert (=> d!126905 (= lt!461555 e!593033)))

(declare-fun c!106587 () Bool)

(assert (=> d!126905 (= c!106587 lt!461554)))

(declare-fun containsKey!569 (List!21999 (_ BitVec 64)) Bool)

(assert (=> d!126905 (= lt!461554 (containsKey!569 (toList!6909 (getCurrentListMap!3953 (_keys!11708 (_2!7893 lt!461377)) (_values!6427 (_2!7893 lt!461377)) (mask!30577 (_2!7893 lt!461377)) (extraKeys!6132 (_2!7893 lt!461377)) (zeroValue!6238 (_2!7893 lt!461377)) (minValue!6238 (_2!7893 lt!461377)) #b00000000000000000000000000000000 (defaultEntry!6404 (_2!7893 lt!461377)))) key!909))))

(assert (=> d!126905 (= (contains!6100 (getCurrentListMap!3953 (_keys!11708 (_2!7893 lt!461377)) (_values!6427 (_2!7893 lt!461377)) (mask!30577 (_2!7893 lt!461377)) (extraKeys!6132 (_2!7893 lt!461377)) (zeroValue!6238 (_2!7893 lt!461377)) (minValue!6238 (_2!7893 lt!461377)) #b00000000000000000000000000000000 (defaultEntry!6404 (_2!7893 lt!461377))) key!909) lt!461553)))

(declare-fun b!1046152 () Bool)

(declare-fun lt!461552 () Unit!34127)

(assert (=> b!1046152 (= e!593033 lt!461552)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!400 (List!21999 (_ BitVec 64)) Unit!34127)

(assert (=> b!1046152 (= lt!461552 (lemmaContainsKeyImpliesGetValueByKeyDefined!400 (toList!6909 (getCurrentListMap!3953 (_keys!11708 (_2!7893 lt!461377)) (_values!6427 (_2!7893 lt!461377)) (mask!30577 (_2!7893 lt!461377)) (extraKeys!6132 (_2!7893 lt!461377)) (zeroValue!6238 (_2!7893 lt!461377)) (minValue!6238 (_2!7893 lt!461377)) #b00000000000000000000000000000000 (defaultEntry!6404 (_2!7893 lt!461377)))) key!909))))

(declare-datatypes ((Option!639 0))(
  ( (Some!638 (v!15063 V!37995)) (None!637) )
))
(declare-fun isDefined!438 (Option!639) Bool)

(declare-fun getValueByKey!588 (List!21999 (_ BitVec 64)) Option!639)

(assert (=> b!1046152 (isDefined!438 (getValueByKey!588 (toList!6909 (getCurrentListMap!3953 (_keys!11708 (_2!7893 lt!461377)) (_values!6427 (_2!7893 lt!461377)) (mask!30577 (_2!7893 lt!461377)) (extraKeys!6132 (_2!7893 lt!461377)) (zeroValue!6238 (_2!7893 lt!461377)) (minValue!6238 (_2!7893 lt!461377)) #b00000000000000000000000000000000 (defaultEntry!6404 (_2!7893 lt!461377)))) key!909))))

(declare-fun b!1046153 () Bool)

(declare-fun Unit!34137 () Unit!34127)

(assert (=> b!1046153 (= e!593033 Unit!34137)))

(declare-fun b!1046154 () Bool)

(assert (=> b!1046154 (= e!593034 (isDefined!438 (getValueByKey!588 (toList!6909 (getCurrentListMap!3953 (_keys!11708 (_2!7893 lt!461377)) (_values!6427 (_2!7893 lt!461377)) (mask!30577 (_2!7893 lt!461377)) (extraKeys!6132 (_2!7893 lt!461377)) (zeroValue!6238 (_2!7893 lt!461377)) (minValue!6238 (_2!7893 lt!461377)) #b00000000000000000000000000000000 (defaultEntry!6404 (_2!7893 lt!461377)))) key!909)))))

(assert (= (and d!126905 c!106587) b!1046152))

(assert (= (and d!126905 (not c!106587)) b!1046153))

(assert (= (and d!126905 (not res!696333)) b!1046154))

(declare-fun m!966051 () Bool)

(assert (=> d!126905 m!966051))

(declare-fun m!966053 () Bool)

(assert (=> b!1046152 m!966053))

(declare-fun m!966055 () Bool)

(assert (=> b!1046152 m!966055))

(assert (=> b!1046152 m!966055))

(declare-fun m!966057 () Bool)

(assert (=> b!1046152 m!966057))

(assert (=> b!1046154 m!966055))

(assert (=> b!1046154 m!966055))

(assert (=> b!1046154 m!966057))

(assert (=> b!1045927 d!126905))

(declare-fun d!126907 () Bool)

(declare-fun lt!461558 () ListLongMap!13787)

(assert (=> d!126907 (not (contains!6100 lt!461558 key!909))))

(declare-fun removeStrictlySorted!61 (List!21999 (_ BitVec 64)) List!21999)

(assert (=> d!126907 (= lt!461558 (ListLongMap!13788 (removeStrictlySorted!61 (toList!6909 (getCurrentListMap!3953 (_keys!11708 thiss!1427) (_values!6427 thiss!1427) (mask!30577 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6404 thiss!1427))) key!909)))))

(assert (=> d!126907 (= (-!532 (getCurrentListMap!3953 (_keys!11708 thiss!1427) (_values!6427 thiss!1427) (mask!30577 thiss!1427) (extraKeys!6132 thiss!1427) (zeroValue!6238 thiss!1427) (minValue!6238 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6404 thiss!1427)) key!909) lt!461558)))

(declare-fun bs!30539 () Bool)

(assert (= bs!30539 d!126907))

(declare-fun m!966059 () Bool)

(assert (=> bs!30539 m!966059))

(declare-fun m!966061 () Bool)

(assert (=> bs!30539 m!966061))

(assert (=> b!1045927 d!126907))

(declare-fun b!1046155 () Bool)

(declare-fun e!593039 () ListLongMap!13787)

(declare-fun call!44498 () ListLongMap!13787)

(assert (=> b!1046155 (= e!593039 (+!3132 call!44498 (tuple2!15767 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6238 (_2!7893 lt!461377)))))))

(declare-fun b!1046156 () Bool)

(declare-fun e!593045 () Bool)

(declare-fun e!593035 () Bool)

(assert (=> b!1046156 (= e!593045 e!593035)))

(declare-fun res!696334 () Bool)

(assert (=> b!1046156 (=> (not res!696334) (not e!593035))))

(declare-fun lt!461574 () ListLongMap!13787)

(assert (=> b!1046156 (= res!696334 (contains!6100 lt!461574 (select (arr!31693 (_keys!11708 (_2!7893 lt!461377))) #b00000000000000000000000000000000)))))

(assert (=> b!1046156 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32229 (_keys!11708 (_2!7893 lt!461377)))))))

(declare-fun b!1046157 () Bool)

(declare-fun e!593044 () Bool)

(declare-fun e!593036 () Bool)

(assert (=> b!1046157 (= e!593044 e!593036)))

(declare-fun c!106588 () Bool)

(assert (=> b!1046157 (= c!106588 (not (= (bvand (extraKeys!6132 (_2!7893 lt!461377)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1046158 () Bool)

(declare-fun e!593037 () ListLongMap!13787)

(declare-fun call!44495 () ListLongMap!13787)

(assert (=> b!1046158 (= e!593037 call!44495)))

(declare-fun bm!44490 () Bool)

(declare-fun call!44499 () ListLongMap!13787)

(declare-fun call!44494 () ListLongMap!13787)

(assert (=> bm!44490 (= call!44499 call!44494)))

(declare-fun b!1046159 () Bool)

(declare-fun e!593047 () Bool)

(assert (=> b!1046159 (= e!593036 e!593047)))

(declare-fun res!696338 () Bool)

(declare-fun call!44493 () Bool)

(assert (=> b!1046159 (= res!696338 call!44493)))

(assert (=> b!1046159 (=> (not res!696338) (not e!593047))))

(declare-fun bm!44491 () Bool)

(declare-fun call!44496 () Bool)

(assert (=> bm!44491 (= call!44496 (contains!6100 lt!461574 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1046161 () Bool)

(declare-fun res!696337 () Bool)

(assert (=> b!1046161 (=> (not res!696337) (not e!593044))))

(declare-fun e!593043 () Bool)

(assert (=> b!1046161 (= res!696337 e!593043)))

(declare-fun c!106589 () Bool)

(assert (=> b!1046161 (= c!106589 (not (= (bvand (extraKeys!6132 (_2!7893 lt!461377)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1046162 () Bool)

(declare-fun e!593040 () Unit!34127)

(declare-fun lt!461579 () Unit!34127)

(assert (=> b!1046162 (= e!593040 lt!461579)))

(declare-fun lt!461564 () ListLongMap!13787)

(assert (=> b!1046162 (= lt!461564 (getCurrentListMapNoExtraKeys!3572 (_keys!11708 (_2!7893 lt!461377)) (_values!6427 (_2!7893 lt!461377)) (mask!30577 (_2!7893 lt!461377)) (extraKeys!6132 (_2!7893 lt!461377)) (zeroValue!6238 (_2!7893 lt!461377)) (minValue!6238 (_2!7893 lt!461377)) #b00000000000000000000000000000000 (defaultEntry!6404 (_2!7893 lt!461377))))))

(declare-fun lt!461578 () (_ BitVec 64))

(assert (=> b!1046162 (= lt!461578 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461570 () (_ BitVec 64))

(assert (=> b!1046162 (= lt!461570 (select (arr!31693 (_keys!11708 (_2!7893 lt!461377))) #b00000000000000000000000000000000))))

(declare-fun lt!461573 () Unit!34127)

(assert (=> b!1046162 (= lt!461573 (addStillContains!631 lt!461564 lt!461578 (zeroValue!6238 (_2!7893 lt!461377)) lt!461570))))

(assert (=> b!1046162 (contains!6100 (+!3132 lt!461564 (tuple2!15767 lt!461578 (zeroValue!6238 (_2!7893 lt!461377)))) lt!461570)))

(declare-fun lt!461569 () Unit!34127)

(assert (=> b!1046162 (= lt!461569 lt!461573)))

(declare-fun lt!461561 () ListLongMap!13787)

(assert (=> b!1046162 (= lt!461561 (getCurrentListMapNoExtraKeys!3572 (_keys!11708 (_2!7893 lt!461377)) (_values!6427 (_2!7893 lt!461377)) (mask!30577 (_2!7893 lt!461377)) (extraKeys!6132 (_2!7893 lt!461377)) (zeroValue!6238 (_2!7893 lt!461377)) (minValue!6238 (_2!7893 lt!461377)) #b00000000000000000000000000000000 (defaultEntry!6404 (_2!7893 lt!461377))))))

(declare-fun lt!461562 () (_ BitVec 64))

(assert (=> b!1046162 (= lt!461562 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461580 () (_ BitVec 64))

(assert (=> b!1046162 (= lt!461580 (select (arr!31693 (_keys!11708 (_2!7893 lt!461377))) #b00000000000000000000000000000000))))

(declare-fun lt!461571 () Unit!34127)

(assert (=> b!1046162 (= lt!461571 (addApplyDifferent!487 lt!461561 lt!461562 (minValue!6238 (_2!7893 lt!461377)) lt!461580))))

(assert (=> b!1046162 (= (apply!921 (+!3132 lt!461561 (tuple2!15767 lt!461562 (minValue!6238 (_2!7893 lt!461377)))) lt!461580) (apply!921 lt!461561 lt!461580))))

(declare-fun lt!461566 () Unit!34127)

(assert (=> b!1046162 (= lt!461566 lt!461571)))

(declare-fun lt!461560 () ListLongMap!13787)

(assert (=> b!1046162 (= lt!461560 (getCurrentListMapNoExtraKeys!3572 (_keys!11708 (_2!7893 lt!461377)) (_values!6427 (_2!7893 lt!461377)) (mask!30577 (_2!7893 lt!461377)) (extraKeys!6132 (_2!7893 lt!461377)) (zeroValue!6238 (_2!7893 lt!461377)) (minValue!6238 (_2!7893 lt!461377)) #b00000000000000000000000000000000 (defaultEntry!6404 (_2!7893 lt!461377))))))

(declare-fun lt!461575 () (_ BitVec 64))

(assert (=> b!1046162 (= lt!461575 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461577 () (_ BitVec 64))

(assert (=> b!1046162 (= lt!461577 (select (arr!31693 (_keys!11708 (_2!7893 lt!461377))) #b00000000000000000000000000000000))))

(declare-fun lt!461567 () Unit!34127)

(assert (=> b!1046162 (= lt!461567 (addApplyDifferent!487 lt!461560 lt!461575 (zeroValue!6238 (_2!7893 lt!461377)) lt!461577))))

(assert (=> b!1046162 (= (apply!921 (+!3132 lt!461560 (tuple2!15767 lt!461575 (zeroValue!6238 (_2!7893 lt!461377)))) lt!461577) (apply!921 lt!461560 lt!461577))))

(declare-fun lt!461576 () Unit!34127)

(assert (=> b!1046162 (= lt!461576 lt!461567)))

(declare-fun lt!461572 () ListLongMap!13787)

(assert (=> b!1046162 (= lt!461572 (getCurrentListMapNoExtraKeys!3572 (_keys!11708 (_2!7893 lt!461377)) (_values!6427 (_2!7893 lt!461377)) (mask!30577 (_2!7893 lt!461377)) (extraKeys!6132 (_2!7893 lt!461377)) (zeroValue!6238 (_2!7893 lt!461377)) (minValue!6238 (_2!7893 lt!461377)) #b00000000000000000000000000000000 (defaultEntry!6404 (_2!7893 lt!461377))))))

(declare-fun lt!461565 () (_ BitVec 64))

(assert (=> b!1046162 (= lt!461565 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461559 () (_ BitVec 64))

(assert (=> b!1046162 (= lt!461559 (select (arr!31693 (_keys!11708 (_2!7893 lt!461377))) #b00000000000000000000000000000000))))

(assert (=> b!1046162 (= lt!461579 (addApplyDifferent!487 lt!461572 lt!461565 (minValue!6238 (_2!7893 lt!461377)) lt!461559))))

(assert (=> b!1046162 (= (apply!921 (+!3132 lt!461572 (tuple2!15767 lt!461565 (minValue!6238 (_2!7893 lt!461377)))) lt!461559) (apply!921 lt!461572 lt!461559))))

(declare-fun b!1046163 () Bool)

(assert (=> b!1046163 (= e!593047 (= (apply!921 lt!461574 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6238 (_2!7893 lt!461377))))))

(declare-fun bm!44492 () Bool)

(assert (=> bm!44492 (= call!44495 call!44499)))

(declare-fun b!1046164 () Bool)

(declare-fun Unit!34138 () Unit!34127)

(assert (=> b!1046164 (= e!593040 Unit!34138)))

(declare-fun b!1046165 () Bool)

(assert (=> b!1046165 (= e!593036 (not call!44493))))

(declare-fun b!1046166 () Bool)

(declare-fun e!593046 () Bool)

(assert (=> b!1046166 (= e!593043 e!593046)))

(declare-fun res!696341 () Bool)

(assert (=> b!1046166 (= res!696341 call!44496)))

(assert (=> b!1046166 (=> (not res!696341) (not e!593046))))

(declare-fun bm!44493 () Bool)

(declare-fun call!44497 () ListLongMap!13787)

(assert (=> bm!44493 (= call!44497 call!44498)))

(declare-fun b!1046167 () Bool)

(assert (=> b!1046167 (= e!593046 (= (apply!921 lt!461574 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6238 (_2!7893 lt!461377))))))

(declare-fun b!1046168 () Bool)

(declare-fun c!106591 () Bool)

(assert (=> b!1046168 (= c!106591 (and (not (= (bvand (extraKeys!6132 (_2!7893 lt!461377)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6132 (_2!7893 lt!461377)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!593042 () ListLongMap!13787)

(assert (=> b!1046168 (= e!593042 e!593037)))

(declare-fun bm!44494 () Bool)

(declare-fun c!106592 () Bool)

(declare-fun c!106590 () Bool)

(assert (=> bm!44494 (= call!44498 (+!3132 (ite c!106592 call!44494 (ite c!106590 call!44499 call!44495)) (ite (or c!106592 c!106590) (tuple2!15767 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6238 (_2!7893 lt!461377))) (tuple2!15767 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6238 (_2!7893 lt!461377))))))))

(declare-fun b!1046169 () Bool)

(declare-fun res!696342 () Bool)

(assert (=> b!1046169 (=> (not res!696342) (not e!593044))))

(assert (=> b!1046169 (= res!696342 e!593045)))

(declare-fun res!696336 () Bool)

(assert (=> b!1046169 (=> res!696336 e!593045)))

(declare-fun e!593038 () Bool)

(assert (=> b!1046169 (= res!696336 (not e!593038))))

(declare-fun res!696340 () Bool)

(assert (=> b!1046169 (=> (not res!696340) (not e!593038))))

(assert (=> b!1046169 (= res!696340 (bvslt #b00000000000000000000000000000000 (size!32229 (_keys!11708 (_2!7893 lt!461377)))))))

(declare-fun b!1046170 () Bool)

(assert (=> b!1046170 (= e!593039 e!593042)))

(assert (=> b!1046170 (= c!106590 (and (not (= (bvand (extraKeys!6132 (_2!7893 lt!461377)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6132 (_2!7893 lt!461377)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1046171 () Bool)

(assert (=> b!1046171 (= e!593035 (= (apply!921 lt!461574 (select (arr!31693 (_keys!11708 (_2!7893 lt!461377))) #b00000000000000000000000000000000)) (get!16582 (select (arr!31694 (_values!6427 (_2!7893 lt!461377))) #b00000000000000000000000000000000) (dynLambda!2024 (defaultEntry!6404 (_2!7893 lt!461377)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1046171 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32230 (_values!6427 (_2!7893 lt!461377)))))))

(assert (=> b!1046171 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32229 (_keys!11708 (_2!7893 lt!461377)))))))

(declare-fun b!1046172 () Bool)

(assert (=> b!1046172 (= e!593037 call!44497)))

(declare-fun bm!44495 () Bool)

(assert (=> bm!44495 (= call!44493 (contains!6100 lt!461574 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!44496 () Bool)

(assert (=> bm!44496 (= call!44494 (getCurrentListMapNoExtraKeys!3572 (_keys!11708 (_2!7893 lt!461377)) (_values!6427 (_2!7893 lt!461377)) (mask!30577 (_2!7893 lt!461377)) (extraKeys!6132 (_2!7893 lt!461377)) (zeroValue!6238 (_2!7893 lt!461377)) (minValue!6238 (_2!7893 lt!461377)) #b00000000000000000000000000000000 (defaultEntry!6404 (_2!7893 lt!461377))))))

(declare-fun b!1046173 () Bool)

(assert (=> b!1046173 (= e!593042 call!44497)))

(declare-fun b!1046174 () Bool)

(declare-fun e!593041 () Bool)

(assert (=> b!1046174 (= e!593041 (validKeyInArray!0 (select (arr!31693 (_keys!11708 (_2!7893 lt!461377))) #b00000000000000000000000000000000)))))

(declare-fun b!1046175 () Bool)

(assert (=> b!1046175 (= e!593038 (validKeyInArray!0 (select (arr!31693 (_keys!11708 (_2!7893 lt!461377))) #b00000000000000000000000000000000)))))

(declare-fun b!1046160 () Bool)

(assert (=> b!1046160 (= e!593043 (not call!44496))))

(declare-fun d!126909 () Bool)

(assert (=> d!126909 e!593044))

(declare-fun res!696335 () Bool)

(assert (=> d!126909 (=> (not res!696335) (not e!593044))))

(assert (=> d!126909 (= res!696335 (or (bvsge #b00000000000000000000000000000000 (size!32229 (_keys!11708 (_2!7893 lt!461377)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32229 (_keys!11708 (_2!7893 lt!461377)))))))))

(declare-fun lt!461568 () ListLongMap!13787)

(assert (=> d!126909 (= lt!461574 lt!461568)))

(declare-fun lt!461563 () Unit!34127)

(assert (=> d!126909 (= lt!461563 e!593040)))

(declare-fun c!106593 () Bool)

(assert (=> d!126909 (= c!106593 e!593041)))

(declare-fun res!696339 () Bool)

(assert (=> d!126909 (=> (not res!696339) (not e!593041))))

(assert (=> d!126909 (= res!696339 (bvslt #b00000000000000000000000000000000 (size!32229 (_keys!11708 (_2!7893 lt!461377)))))))

(assert (=> d!126909 (= lt!461568 e!593039)))

(assert (=> d!126909 (= c!106592 (and (not (= (bvand (extraKeys!6132 (_2!7893 lt!461377)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6132 (_2!7893 lt!461377)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126909 (validMask!0 (mask!30577 (_2!7893 lt!461377)))))

(assert (=> d!126909 (= (getCurrentListMap!3953 (_keys!11708 (_2!7893 lt!461377)) (_values!6427 (_2!7893 lt!461377)) (mask!30577 (_2!7893 lt!461377)) (extraKeys!6132 (_2!7893 lt!461377)) (zeroValue!6238 (_2!7893 lt!461377)) (minValue!6238 (_2!7893 lt!461377)) #b00000000000000000000000000000000 (defaultEntry!6404 (_2!7893 lt!461377))) lt!461574)))

(assert (= (and d!126909 c!106592) b!1046155))

(assert (= (and d!126909 (not c!106592)) b!1046170))

(assert (= (and b!1046170 c!106590) b!1046173))

(assert (= (and b!1046170 (not c!106590)) b!1046168))

(assert (= (and b!1046168 c!106591) b!1046172))

(assert (= (and b!1046168 (not c!106591)) b!1046158))

(assert (= (or b!1046172 b!1046158) bm!44492))

(assert (= (or b!1046173 bm!44492) bm!44490))

(assert (= (or b!1046173 b!1046172) bm!44493))

(assert (= (or b!1046155 bm!44490) bm!44496))

(assert (= (or b!1046155 bm!44493) bm!44494))

(assert (= (and d!126909 res!696339) b!1046174))

(assert (= (and d!126909 c!106593) b!1046162))

(assert (= (and d!126909 (not c!106593)) b!1046164))

(assert (= (and d!126909 res!696335) b!1046169))

(assert (= (and b!1046169 res!696340) b!1046175))

(assert (= (and b!1046169 (not res!696336)) b!1046156))

(assert (= (and b!1046156 res!696334) b!1046171))

(assert (= (and b!1046169 res!696342) b!1046161))

(assert (= (and b!1046161 c!106589) b!1046166))

(assert (= (and b!1046161 (not c!106589)) b!1046160))

(assert (= (and b!1046166 res!696341) b!1046167))

(assert (= (or b!1046166 b!1046160) bm!44491))

(assert (= (and b!1046161 res!696337) b!1046157))

(assert (= (and b!1046157 c!106588) b!1046159))

(assert (= (and b!1046157 (not c!106588)) b!1046165))

(assert (= (and b!1046159 res!696338) b!1046163))

(assert (= (or b!1046159 b!1046165) bm!44495))

(declare-fun b_lambda!16265 () Bool)

(assert (=> (not b_lambda!16265) (not b!1046171)))

(declare-fun t!31244 () Bool)

(declare-fun tb!7063 () Bool)

(assert (=> (and b!1045928 (= (defaultEntry!6404 thiss!1427) (defaultEntry!6404 (_2!7893 lt!461377))) t!31244) tb!7063))

(declare-fun result!14559 () Bool)

(assert (=> tb!7063 (= result!14559 tp_is_empty!24841)))

(assert (=> b!1046171 t!31244))

(declare-fun b_and!33733 () Bool)

(assert (= b_and!33731 (and (=> t!31244 result!14559) b_and!33733)))

(declare-fun m!966063 () Bool)

(assert (=> b!1046174 m!966063))

(assert (=> b!1046174 m!966063))

(declare-fun m!966065 () Bool)

(assert (=> b!1046174 m!966065))

(declare-fun m!966067 () Bool)

(assert (=> b!1046155 m!966067))

(declare-fun m!966069 () Bool)

(assert (=> bm!44491 m!966069))

(declare-fun m!966071 () Bool)

(assert (=> bm!44496 m!966071))

(declare-fun m!966073 () Bool)

(assert (=> bm!44494 m!966073))

(declare-fun m!966075 () Bool)

(assert (=> b!1046163 m!966075))

(declare-fun m!966077 () Bool)

(assert (=> b!1046171 m!966077))

(assert (=> b!1046171 m!966063))

(declare-fun m!966079 () Bool)

(assert (=> b!1046171 m!966079))

(declare-fun m!966081 () Bool)

(assert (=> b!1046171 m!966081))

(assert (=> b!1046171 m!966077))

(assert (=> b!1046171 m!966081))

(declare-fun m!966083 () Bool)

(assert (=> b!1046171 m!966083))

(assert (=> b!1046171 m!966063))

(assert (=> d!126909 m!965759))

(declare-fun m!966085 () Bool)

(assert (=> bm!44495 m!966085))

(assert (=> b!1046175 m!966063))

(assert (=> b!1046175 m!966063))

(assert (=> b!1046175 m!966065))

(declare-fun m!966087 () Bool)

(assert (=> b!1046167 m!966087))

(declare-fun m!966089 () Bool)

(assert (=> b!1046162 m!966089))

(declare-fun m!966091 () Bool)

(assert (=> b!1046162 m!966091))

(declare-fun m!966093 () Bool)

(assert (=> b!1046162 m!966093))

(declare-fun m!966095 () Bool)

(assert (=> b!1046162 m!966095))

(declare-fun m!966097 () Bool)

(assert (=> b!1046162 m!966097))

(declare-fun m!966099 () Bool)

(assert (=> b!1046162 m!966099))

(declare-fun m!966101 () Bool)

(assert (=> b!1046162 m!966101))

(declare-fun m!966103 () Bool)

(assert (=> b!1046162 m!966103))

(declare-fun m!966105 () Bool)

(assert (=> b!1046162 m!966105))

(declare-fun m!966107 () Bool)

(assert (=> b!1046162 m!966107))

(declare-fun m!966109 () Bool)

(assert (=> b!1046162 m!966109))

(assert (=> b!1046162 m!966093))

(assert (=> b!1046162 m!966105))

(assert (=> b!1046162 m!966071))

(declare-fun m!966111 () Bool)

(assert (=> b!1046162 m!966111))

(declare-fun m!966113 () Bool)

(assert (=> b!1046162 m!966113))

(assert (=> b!1046162 m!966099))

(assert (=> b!1046162 m!966097))

(declare-fun m!966115 () Bool)

(assert (=> b!1046162 m!966115))

(assert (=> b!1046162 m!966063))

(declare-fun m!966117 () Bool)

(assert (=> b!1046162 m!966117))

(assert (=> b!1046156 m!966063))

(assert (=> b!1046156 m!966063))

(declare-fun m!966119 () Bool)

(assert (=> b!1046156 m!966119))

(assert (=> b!1045927 d!126909))

(declare-fun b!1046176 () Bool)

(declare-fun e!593049 () (_ BitVec 32))

(declare-fun call!44500 () (_ BitVec 32))

(assert (=> b!1046176 (= e!593049 call!44500)))

(declare-fun b!1046177 () Bool)

(declare-fun e!593048 () (_ BitVec 32))

(assert (=> b!1046177 (= e!593048 #b00000000000000000000000000000000)))

(declare-fun bm!44497 () Bool)

(assert (=> bm!44497 (= call!44500 (arrayCountValidKeys!0 (_keys!11708 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32229 (_keys!11708 thiss!1427))))))

(declare-fun d!126911 () Bool)

(declare-fun lt!461581 () (_ BitVec 32))

(assert (=> d!126911 (and (bvsge lt!461581 #b00000000000000000000000000000000) (bvsle lt!461581 (bvsub (size!32229 (_keys!11708 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!126911 (= lt!461581 e!593048)))

(declare-fun c!106595 () Bool)

(assert (=> d!126911 (= c!106595 (bvsge #b00000000000000000000000000000000 (size!32229 (_keys!11708 thiss!1427))))))

(assert (=> d!126911 (and (bvsle #b00000000000000000000000000000000 (size!32229 (_keys!11708 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32229 (_keys!11708 thiss!1427)) (size!32229 (_keys!11708 thiss!1427))))))

(assert (=> d!126911 (= (arrayCountValidKeys!0 (_keys!11708 thiss!1427) #b00000000000000000000000000000000 (size!32229 (_keys!11708 thiss!1427))) lt!461581)))

(declare-fun b!1046178 () Bool)

(assert (=> b!1046178 (= e!593049 (bvadd #b00000000000000000000000000000001 call!44500))))

(declare-fun b!1046179 () Bool)

(assert (=> b!1046179 (= e!593048 e!593049)))

(declare-fun c!106594 () Bool)

(assert (=> b!1046179 (= c!106594 (validKeyInArray!0 (select (arr!31693 (_keys!11708 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!126911 c!106595) b!1046177))

(assert (= (and d!126911 (not c!106595)) b!1046179))

(assert (= (and b!1046179 c!106594) b!1046178))

(assert (= (and b!1046179 (not c!106594)) b!1046176))

(assert (= (or b!1046178 b!1046176) bm!44497))

(declare-fun m!966121 () Bool)

(assert (=> bm!44497 m!966121))

(assert (=> b!1046179 m!965975))

(assert (=> b!1046179 m!965975))

(assert (=> b!1046179 m!965977))

(assert (=> b!1045927 d!126911))

(declare-fun d!126913 () Bool)

(declare-fun e!593052 () Bool)

(assert (=> d!126913 e!593052))

(declare-fun res!696345 () Bool)

(assert (=> d!126913 (=> (not res!696345) (not e!593052))))

(assert (=> d!126913 (= res!696345 (and (bvsge (index!41564 lt!461376) #b00000000000000000000000000000000) (bvslt (index!41564 lt!461376) (size!32229 (_keys!11708 thiss!1427)))))))

(declare-fun lt!461584 () Unit!34127)

(declare-fun choose!25 (array!65901 (_ BitVec 32) (_ BitVec 32)) Unit!34127)

(assert (=> d!126913 (= lt!461584 (choose!25 (_keys!11708 thiss!1427) (index!41564 lt!461376) (mask!30577 thiss!1427)))))

(assert (=> d!126913 (validMask!0 (mask!30577 thiss!1427))))

(assert (=> d!126913 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11708 thiss!1427) (index!41564 lt!461376) (mask!30577 thiss!1427)) lt!461584)))

(declare-fun b!1046182 () Bool)

(assert (=> b!1046182 (= e!593052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65902 (store (arr!31693 (_keys!11708 thiss!1427)) (index!41564 lt!461376) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32229 (_keys!11708 thiss!1427))) (mask!30577 thiss!1427)))))

(assert (= (and d!126913 res!696345) b!1046182))

(declare-fun m!966123 () Bool)

(assert (=> d!126913 m!966123))

(assert (=> d!126913 m!965919))

(assert (=> b!1046182 m!965783))

(declare-fun m!966125 () Bool)

(assert (=> b!1046182 m!966125))

(assert (=> b!1045927 d!126913))

(declare-fun b!1046195 () Bool)

(declare-fun e!593061 () SeekEntryResult!9798)

(declare-fun lt!461596 () SeekEntryResult!9798)

(assert (=> b!1046195 (= e!593061 (ite ((_ is MissingVacant!9798) lt!461596) (MissingZero!9798 (index!41566 lt!461596)) lt!461596))))

(declare-fun lt!461593 () SeekEntryResult!9798)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65901 (_ BitVec 32)) SeekEntryResult!9798)

(assert (=> b!1046195 (= lt!461596 (seekKeyOrZeroReturnVacant!0 (x!93266 lt!461593) (index!41565 lt!461593) (index!41565 lt!461593) key!909 (_keys!11708 thiss!1427) (mask!30577 thiss!1427)))))

(declare-fun d!126915 () Bool)

(declare-fun lt!461594 () SeekEntryResult!9798)

(assert (=> d!126915 (and (or ((_ is MissingVacant!9798) lt!461594) (not ((_ is Found!9798) lt!461594)) (and (bvsge (index!41564 lt!461594) #b00000000000000000000000000000000) (bvslt (index!41564 lt!461594) (size!32229 (_keys!11708 thiss!1427))))) (not ((_ is MissingVacant!9798) lt!461594)) (or (not ((_ is Found!9798) lt!461594)) (= (select (arr!31693 (_keys!11708 thiss!1427)) (index!41564 lt!461594)) key!909)))))

(declare-fun e!593059 () SeekEntryResult!9798)

(assert (=> d!126915 (= lt!461594 e!593059)))

(declare-fun c!106603 () Bool)

(assert (=> d!126915 (= c!106603 (and ((_ is Intermediate!9798) lt!461593) (undefined!10610 lt!461593)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65901 (_ BitVec 32)) SeekEntryResult!9798)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126915 (= lt!461593 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30577 thiss!1427)) key!909 (_keys!11708 thiss!1427) (mask!30577 thiss!1427)))))

(assert (=> d!126915 (validMask!0 (mask!30577 thiss!1427))))

(assert (=> d!126915 (= (seekEntry!0 key!909 (_keys!11708 thiss!1427) (mask!30577 thiss!1427)) lt!461594)))

(declare-fun b!1046196 () Bool)

(declare-fun e!593060 () SeekEntryResult!9798)

(assert (=> b!1046196 (= e!593059 e!593060)))

(declare-fun lt!461595 () (_ BitVec 64))

(assert (=> b!1046196 (= lt!461595 (select (arr!31693 (_keys!11708 thiss!1427)) (index!41565 lt!461593)))))

(declare-fun c!106604 () Bool)

(assert (=> b!1046196 (= c!106604 (= lt!461595 key!909))))

(declare-fun b!1046197 () Bool)

(assert (=> b!1046197 (= e!593061 (MissingZero!9798 (index!41565 lt!461593)))))

(declare-fun b!1046198 () Bool)

(declare-fun c!106602 () Bool)

(assert (=> b!1046198 (= c!106602 (= lt!461595 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1046198 (= e!593060 e!593061)))

(declare-fun b!1046199 () Bool)

(assert (=> b!1046199 (= e!593059 Undefined!9798)))

(declare-fun b!1046200 () Bool)

(assert (=> b!1046200 (= e!593060 (Found!9798 (index!41565 lt!461593)))))

(assert (= (and d!126915 c!106603) b!1046199))

(assert (= (and d!126915 (not c!106603)) b!1046196))

(assert (= (and b!1046196 c!106604) b!1046200))

(assert (= (and b!1046196 (not c!106604)) b!1046198))

(assert (= (and b!1046198 c!106602) b!1046197))

(assert (= (and b!1046198 (not c!106602)) b!1046195))

(declare-fun m!966127 () Bool)

(assert (=> b!1046195 m!966127))

(declare-fun m!966129 () Bool)

(assert (=> d!126915 m!966129))

(declare-fun m!966131 () Bool)

(assert (=> d!126915 m!966131))

(assert (=> d!126915 m!966131))

(declare-fun m!966133 () Bool)

(assert (=> d!126915 m!966133))

(assert (=> d!126915 m!965919))

(declare-fun m!966135 () Bool)

(assert (=> b!1046196 m!966135))

(assert (=> b!1045935 d!126915))

(declare-fun d!126917 () Bool)

(declare-fun res!696352 () Bool)

(declare-fun e!593064 () Bool)

(assert (=> d!126917 (=> (not res!696352) (not e!593064))))

(declare-fun simpleValid!450 (LongMapFixedSize!6028) Bool)

(assert (=> d!126917 (= res!696352 (simpleValid!450 thiss!1427))))

(assert (=> d!126917 (= (valid!2268 thiss!1427) e!593064)))

(declare-fun b!1046207 () Bool)

(declare-fun res!696353 () Bool)

(assert (=> b!1046207 (=> (not res!696353) (not e!593064))))

(assert (=> b!1046207 (= res!696353 (= (arrayCountValidKeys!0 (_keys!11708 thiss!1427) #b00000000000000000000000000000000 (size!32229 (_keys!11708 thiss!1427))) (_size!3069 thiss!1427)))))

(declare-fun b!1046208 () Bool)

(declare-fun res!696354 () Bool)

(assert (=> b!1046208 (=> (not res!696354) (not e!593064))))

(assert (=> b!1046208 (= res!696354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11708 thiss!1427) (mask!30577 thiss!1427)))))

(declare-fun b!1046209 () Bool)

(assert (=> b!1046209 (= e!593064 (arrayNoDuplicates!0 (_keys!11708 thiss!1427) #b00000000000000000000000000000000 Nil!21997))))

(assert (= (and d!126917 res!696352) b!1046207))

(assert (= (and b!1046207 res!696353) b!1046208))

(assert (= (and b!1046208 res!696354) b!1046209))

(declare-fun m!966137 () Bool)

(assert (=> d!126917 m!966137))

(assert (=> b!1046207 m!965769))

(declare-fun m!966139 () Bool)

(assert (=> b!1046208 m!966139))

(declare-fun m!966141 () Bool)

(assert (=> b!1046209 m!966141))

(assert (=> start!92046 d!126917))

(declare-fun b!1046216 () Bool)

(declare-fun e!593070 () Bool)

(assert (=> b!1046216 (= e!593070 tp_is_empty!24841)))

(declare-fun condMapEmpty!38903 () Bool)

(declare-fun mapDefault!38903 () ValueCell!11717)

(assert (=> mapNonEmpty!38894 (= condMapEmpty!38903 (= mapRest!38894 ((as const (Array (_ BitVec 32) ValueCell!11717)) mapDefault!38903)))))

(declare-fun e!593069 () Bool)

(declare-fun mapRes!38903 () Bool)

(assert (=> mapNonEmpty!38894 (= tp!74613 (and e!593069 mapRes!38903))))

(declare-fun mapNonEmpty!38903 () Bool)

(declare-fun tp!74628 () Bool)

(assert (=> mapNonEmpty!38903 (= mapRes!38903 (and tp!74628 e!593070))))

(declare-fun mapValue!38903 () ValueCell!11717)

(declare-fun mapRest!38903 () (Array (_ BitVec 32) ValueCell!11717))

(declare-fun mapKey!38903 () (_ BitVec 32))

(assert (=> mapNonEmpty!38903 (= mapRest!38894 (store mapRest!38903 mapKey!38903 mapValue!38903))))

(declare-fun b!1046217 () Bool)

(assert (=> b!1046217 (= e!593069 tp_is_empty!24841)))

(declare-fun mapIsEmpty!38903 () Bool)

(assert (=> mapIsEmpty!38903 mapRes!38903))

(assert (= (and mapNonEmpty!38894 condMapEmpty!38903) mapIsEmpty!38903))

(assert (= (and mapNonEmpty!38894 (not condMapEmpty!38903)) mapNonEmpty!38903))

(assert (= (and mapNonEmpty!38903 ((_ is ValueCellFull!11717) mapValue!38903)) b!1046216))

(assert (= (and mapNonEmpty!38894 ((_ is ValueCellFull!11717) mapDefault!38903)) b!1046217))

(declare-fun m!966143 () Bool)

(assert (=> mapNonEmpty!38903 m!966143))

(declare-fun b_lambda!16267 () Bool)

(assert (= b_lambda!16261 (or (and b!1045928 b_free!21121) b_lambda!16267)))

(declare-fun b_lambda!16269 () Bool)

(assert (= b_lambda!16263 (or (and b!1045928 b_free!21121) b_lambda!16269)))

(declare-fun b_lambda!16271 () Bool)

(assert (= b_lambda!16259 (or (and b!1045928 b_free!21121) b_lambda!16271)))

(check-sat (not bm!44497) (not b!1046163) (not bm!44455) (not bm!44494) (not bm!44495) (not b_lambda!16269) (not b!1046195) (not b!1046101) (not b!1046154) b_and!33733 (not b!1046207) (not d!126901) (not b!1046179) (not d!126899) (not b!1046022) (not b!1046167) (not b!1046118) (not d!126913) (not b!1046155) (not d!126909) (not b!1046108) (not b!1046080) (not bm!44479) (not b!1046096) (not b!1046175) (not b_next!21121) (not b!1046075) (not b!1046109) (not d!126891) (not b_lambda!16267) (not b!1046090) (not b!1046128) (not b!1046130) (not d!126893) (not bm!44486) (not bm!44484) (not b!1046141) (not b!1046115) (not b!1046208) (not b!1046143) (not mapNonEmpty!38903) (not b!1046105) (not b!1046156) (not b_lambda!16257) (not bm!44474) (not b!1046171) (not b!1046025) (not b!1046007) (not bm!44458) (not b!1046162) (not bm!44477) (not bm!44489) (not bm!44478) (not b!1046127) (not bm!44485) (not b!1046174) (not d!126917) (not b!1046142) (not b_lambda!16271) (not d!126895) (not d!126907) (not b!1046076) (not b!1046097) (not b!1046088) (not b!1045998) (not bm!44481) (not bm!44496) (not b_lambda!16265) (not b!1046209) (not bm!44491) (not b!1046068) (not d!126885) (not b!1046010) tp_is_empty!24841 (not b!1046152) (not b!1046087) (not d!126905) (not d!126915) (not b!1046182) (not b!1046084) (not b!1046089) (not b!1046069))
(check-sat b_and!33733 (not b_next!21121))
