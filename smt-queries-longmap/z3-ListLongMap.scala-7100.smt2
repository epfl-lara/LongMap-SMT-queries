; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90048 () Bool)

(assert start!90048)

(declare-fun b!1031308 () Bool)

(declare-fun b_free!20655 () Bool)

(declare-fun b_next!20655 () Bool)

(assert (=> b!1031308 (= b_free!20655 (not b_next!20655))))

(declare-fun tp!73036 () Bool)

(declare-fun b_and!33077 () Bool)

(assert (=> b!1031308 (= tp!73036 b_and!33077)))

(declare-fun b!1031307 () Bool)

(declare-fun e!582476 () Bool)

(declare-fun e!582472 () Bool)

(assert (=> b!1031307 (= e!582476 (not e!582472))))

(declare-fun res!689570 () Bool)

(assert (=> b!1031307 (=> res!689570 e!582472)))

(declare-datatypes ((V!37373 0))(
  ( (V!37374 (val!12238 Int)) )
))
(declare-datatypes ((ValueCell!11484 0))(
  ( (ValueCellFull!11484 (v!14815 V!37373)) (EmptyCell!11484) )
))
(declare-datatypes ((Unit!33721 0))(
  ( (Unit!33722) )
))
(declare-datatypes ((array!64814 0))(
  ( (array!64815 (arr!31209 (Array (_ BitVec 32) (_ BitVec 64))) (size!31726 (_ BitVec 32))) )
))
(declare-datatypes ((array!64816 0))(
  ( (array!64817 (arr!31210 (Array (_ BitVec 32) ValueCell!11484)) (size!31727 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5562 0))(
  ( (LongMapFixedSize!5563 (defaultEntry!6155 Int) (mask!29949 (_ BitVec 32)) (extraKeys!5887 (_ BitVec 32)) (zeroValue!5991 V!37373) (minValue!5991 V!37373) (_size!2836 (_ BitVec 32)) (_keys!11328 array!64814) (_values!6178 array!64816) (_vacant!2836 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15648 0))(
  ( (tuple2!15649 (_1!7835 Unit!33721) (_2!7835 LongMapFixedSize!5562)) )
))
(declare-fun lt!455260 () tuple2!15648)

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15650 0))(
  ( (tuple2!15651 (_1!7836 (_ BitVec 64)) (_2!7836 V!37373)) )
))
(declare-datatypes ((List!21863 0))(
  ( (Nil!21860) (Cons!21859 (h!23061 tuple2!15650) (t!31013 List!21863)) )
))
(declare-datatypes ((ListLongMap!13721 0))(
  ( (ListLongMap!13722 (toList!6876 List!21863)) )
))
(declare-fun contains!5990 (ListLongMap!13721 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3924 (array!64814 array!64816 (_ BitVec 32) (_ BitVec 32) V!37373 V!37373 (_ BitVec 32) Int) ListLongMap!13721)

(assert (=> b!1031307 (= res!689570 (not (contains!5990 (getCurrentListMap!3924 (_keys!11328 (_2!7835 lt!455260)) (_values!6178 (_2!7835 lt!455260)) (mask!29949 (_2!7835 lt!455260)) (extraKeys!5887 (_2!7835 lt!455260)) (zeroValue!5991 (_2!7835 lt!455260)) (minValue!5991 (_2!7835 lt!455260)) #b00000000000000000000000000000000 (defaultEntry!6155 (_2!7835 lt!455260))) key!909)))))

(declare-fun lt!455258 () array!64816)

(declare-fun thiss!1427 () LongMapFixedSize!5562)

(declare-fun lt!455257 () array!64814)

(declare-fun Unit!33723 () Unit!33721)

(declare-fun Unit!33724 () Unit!33721)

(assert (=> b!1031307 (= lt!455260 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2836 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15649 Unit!33723 (LongMapFixedSize!5563 (defaultEntry!6155 thiss!1427) (mask!29949 thiss!1427) (extraKeys!5887 thiss!1427) (zeroValue!5991 thiss!1427) (minValue!5991 thiss!1427) (bvsub (_size!2836 thiss!1427) #b00000000000000000000000000000001) lt!455257 lt!455258 (bvadd #b00000000000000000000000000000001 (_vacant!2836 thiss!1427)))) (tuple2!15649 Unit!33724 (LongMapFixedSize!5563 (defaultEntry!6155 thiss!1427) (mask!29949 thiss!1427) (extraKeys!5887 thiss!1427) (zeroValue!5991 thiss!1427) (minValue!5991 thiss!1427) (bvsub (_size!2836 thiss!1427) #b00000000000000000000000000000001) lt!455257 lt!455258 (_vacant!2836 thiss!1427)))))))

(declare-fun -!503 (ListLongMap!13721 (_ BitVec 64)) ListLongMap!13721)

(assert (=> b!1031307 (= (-!503 (getCurrentListMap!3924 (_keys!11328 thiss!1427) (_values!6178 thiss!1427) (mask!29949 thiss!1427) (extraKeys!5887 thiss!1427) (zeroValue!5991 thiss!1427) (minValue!5991 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6155 thiss!1427)) key!909) (getCurrentListMap!3924 lt!455257 lt!455258 (mask!29949 thiss!1427) (extraKeys!5887 thiss!1427) (zeroValue!5991 thiss!1427) (minValue!5991 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6155 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9704 0))(
  ( (MissingZero!9704 (index!41187 (_ BitVec 32))) (Found!9704 (index!41188 (_ BitVec 32))) (Intermediate!9704 (undefined!10516 Bool) (index!41189 (_ BitVec 32)) (x!91828 (_ BitVec 32))) (Undefined!9704) (MissingVacant!9704 (index!41190 (_ BitVec 32))) )
))
(declare-fun lt!455256 () SeekEntryResult!9704)

(declare-fun dynLambda!1973 (Int (_ BitVec 64)) V!37373)

(assert (=> b!1031307 (= lt!455258 (array!64817 (store (arr!31210 (_values!6178 thiss!1427)) (index!41188 lt!455256) (ValueCellFull!11484 (dynLambda!1973 (defaultEntry!6155 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31727 (_values!6178 thiss!1427))))))

(declare-fun lt!455259 () Unit!33721)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!29 (array!64814 array!64816 (_ BitVec 32) (_ BitVec 32) V!37373 V!37373 (_ BitVec 32) (_ BitVec 64) Int) Unit!33721)

(assert (=> b!1031307 (= lt!455259 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!29 (_keys!11328 thiss!1427) (_values!6178 thiss!1427) (mask!29949 thiss!1427) (extraKeys!5887 thiss!1427) (zeroValue!5991 thiss!1427) (minValue!5991 thiss!1427) (index!41188 lt!455256) key!909 (defaultEntry!6155 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64814 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1031307 (not (arrayContainsKey!0 lt!455257 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!455261 () Unit!33721)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64814 (_ BitVec 32) (_ BitVec 64)) Unit!33721)

(assert (=> b!1031307 (= lt!455261 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11328 thiss!1427) (index!41188 lt!455256) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64814 (_ BitVec 32)) Bool)

(assert (=> b!1031307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!455257 (mask!29949 thiss!1427))))

(declare-fun lt!455255 () Unit!33721)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64814 (_ BitVec 32) (_ BitVec 32)) Unit!33721)

(assert (=> b!1031307 (= lt!455255 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11328 thiss!1427) (index!41188 lt!455256) (mask!29949 thiss!1427)))))

(declare-datatypes ((List!21864 0))(
  ( (Nil!21861) (Cons!21860 (h!23062 (_ BitVec 64)) (t!31014 List!21864)) )
))
(declare-fun arrayNoDuplicates!0 (array!64814 (_ BitVec 32) List!21864) Bool)

(assert (=> b!1031307 (arrayNoDuplicates!0 lt!455257 #b00000000000000000000000000000000 Nil!21861)))

(declare-fun lt!455252 () Unit!33721)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64814 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21864) Unit!33721)

(assert (=> b!1031307 (= lt!455252 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11328 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41188 lt!455256) #b00000000000000000000000000000000 Nil!21861))))

(declare-fun arrayCountValidKeys!0 (array!64814 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1031307 (= (arrayCountValidKeys!0 lt!455257 #b00000000000000000000000000000000 (size!31726 (_keys!11328 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11328 thiss!1427) #b00000000000000000000000000000000 (size!31726 (_keys!11328 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1031307 (= lt!455257 (array!64815 (store (arr!31209 (_keys!11328 thiss!1427)) (index!41188 lt!455256) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31726 (_keys!11328 thiss!1427))))))

(declare-fun lt!455254 () Unit!33721)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64814 (_ BitVec 32) (_ BitVec 64)) Unit!33721)

(assert (=> b!1031307 (= lt!455254 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11328 thiss!1427) (index!41188 lt!455256) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!582473 () Bool)

(declare-fun tp_is_empty!24375 () Bool)

(declare-fun e!582474 () Bool)

(declare-fun array_inv!24157 (array!64814) Bool)

(declare-fun array_inv!24158 (array!64816) Bool)

(assert (=> b!1031308 (= e!582473 (and tp!73036 tp_is_empty!24375 (array_inv!24157 (_keys!11328 thiss!1427)) (array_inv!24158 (_values!6178 thiss!1427)) e!582474))))

(declare-fun b!1031309 () Bool)

(declare-fun e!582475 () Bool)

(assert (=> b!1031309 (= e!582475 tp_is_empty!24375)))

(declare-fun b!1031310 () Bool)

(declare-fun res!689571 () Bool)

(assert (=> b!1031310 (=> res!689571 e!582472)))

(assert (=> b!1031310 (= res!689571 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11328 (_2!7835 lt!455260)) (mask!29949 (_2!7835 lt!455260)))))))

(declare-fun b!1031311 () Bool)

(declare-fun res!689572 () Bool)

(assert (=> b!1031311 (=> res!689572 e!582472)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1031311 (= res!689572 (not (validMask!0 (mask!29949 (_2!7835 lt!455260)))))))

(declare-fun b!1031312 () Bool)

(declare-fun mapRes!38016 () Bool)

(assert (=> b!1031312 (= e!582474 (and e!582475 mapRes!38016))))

(declare-fun condMapEmpty!38016 () Bool)

(declare-fun mapDefault!38016 () ValueCell!11484)

(assert (=> b!1031312 (= condMapEmpty!38016 (= (arr!31210 (_values!6178 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11484)) mapDefault!38016)))))

(declare-fun b!1031313 () Bool)

(declare-fun e!582470 () Bool)

(assert (=> b!1031313 (= e!582470 e!582476)))

(declare-fun res!689567 () Bool)

(assert (=> b!1031313 (=> (not res!689567) (not e!582476))))

(get-info :version)

(assert (=> b!1031313 (= res!689567 ((_ is Found!9704) lt!455256))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64814 (_ BitVec 32)) SeekEntryResult!9704)

(assert (=> b!1031313 (= lt!455256 (seekEntry!0 key!909 (_keys!11328 thiss!1427) (mask!29949 thiss!1427)))))

(declare-fun b!1031314 () Bool)

(declare-fun res!689569 () Bool)

(assert (=> b!1031314 (=> res!689569 e!582472)))

(assert (=> b!1031314 (= res!689569 (or (not (= (size!31727 (_values!6178 (_2!7835 lt!455260))) (bvadd #b00000000000000000000000000000001 (mask!29949 (_2!7835 lt!455260))))) (not (= (size!31726 (_keys!11328 (_2!7835 lt!455260))) (size!31727 (_values!6178 (_2!7835 lt!455260))))) (bvslt (mask!29949 (_2!7835 lt!455260)) #b00000000000000000000000000000000) (bvslt (extraKeys!5887 (_2!7835 lt!455260)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5887 (_2!7835 lt!455260)) #b00000000000000000000000000000011)))))

(declare-fun b!1031315 () Bool)

(declare-fun e!582477 () Bool)

(assert (=> b!1031315 (= e!582477 tp_is_empty!24375)))

(declare-fun res!689573 () Bool)

(assert (=> start!90048 (=> (not res!689573) (not e!582470))))

(declare-fun valid!2106 (LongMapFixedSize!5562) Bool)

(assert (=> start!90048 (= res!689573 (valid!2106 thiss!1427))))

(assert (=> start!90048 e!582470))

(assert (=> start!90048 e!582473))

(assert (=> start!90048 true))

(declare-fun b!1031316 () Bool)

(declare-fun res!689568 () Bool)

(assert (=> b!1031316 (=> (not res!689568) (not e!582470))))

(assert (=> b!1031316 (= res!689568 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!38016 () Bool)

(assert (=> mapIsEmpty!38016 mapRes!38016))

(declare-fun mapNonEmpty!38016 () Bool)

(declare-fun tp!73035 () Bool)

(assert (=> mapNonEmpty!38016 (= mapRes!38016 (and tp!73035 e!582477))))

(declare-fun mapRest!38016 () (Array (_ BitVec 32) ValueCell!11484))

(declare-fun mapKey!38016 () (_ BitVec 32))

(declare-fun mapValue!38016 () ValueCell!11484)

(assert (=> mapNonEmpty!38016 (= (arr!31210 (_values!6178 thiss!1427)) (store mapRest!38016 mapKey!38016 mapValue!38016))))

(declare-fun b!1031317 () Bool)

(assert (=> b!1031317 (= e!582472 true)))

(declare-fun lt!455253 () Bool)

(assert (=> b!1031317 (= lt!455253 (arrayNoDuplicates!0 (_keys!11328 (_2!7835 lt!455260)) #b00000000000000000000000000000000 Nil!21861))))

(assert (= (and start!90048 res!689573) b!1031316))

(assert (= (and b!1031316 res!689568) b!1031313))

(assert (= (and b!1031313 res!689567) b!1031307))

(assert (= (and b!1031307 (not res!689570)) b!1031311))

(assert (= (and b!1031311 (not res!689572)) b!1031314))

(assert (= (and b!1031314 (not res!689569)) b!1031310))

(assert (= (and b!1031310 (not res!689571)) b!1031317))

(assert (= (and b!1031312 condMapEmpty!38016) mapIsEmpty!38016))

(assert (= (and b!1031312 (not condMapEmpty!38016)) mapNonEmpty!38016))

(assert (= (and mapNonEmpty!38016 ((_ is ValueCellFull!11484) mapValue!38016)) b!1031315))

(assert (= (and b!1031312 ((_ is ValueCellFull!11484) mapDefault!38016)) b!1031309))

(assert (= b!1031308 b!1031312))

(assert (= start!90048 b!1031308))

(declare-fun b_lambda!15999 () Bool)

(assert (=> (not b_lambda!15999) (not b!1031307)))

(declare-fun t!31012 () Bool)

(declare-fun tb!6973 () Bool)

(assert (=> (and b!1031308 (= (defaultEntry!6155 thiss!1427) (defaultEntry!6155 thiss!1427)) t!31012) tb!6973))

(declare-fun result!14275 () Bool)

(assert (=> tb!6973 (= result!14275 tp_is_empty!24375)))

(assert (=> b!1031307 t!31012))

(declare-fun b_and!33079 () Bool)

(assert (= b_and!33077 (and (=> t!31012 result!14275) b_and!33079)))

(declare-fun m!951361 () Bool)

(assert (=> b!1031313 m!951361))

(declare-fun m!951363 () Bool)

(assert (=> b!1031308 m!951363))

(declare-fun m!951365 () Bool)

(assert (=> b!1031308 m!951365))

(declare-fun m!951367 () Bool)

(assert (=> mapNonEmpty!38016 m!951367))

(declare-fun m!951369 () Bool)

(assert (=> b!1031317 m!951369))

(declare-fun m!951371 () Bool)

(assert (=> b!1031311 m!951371))

(declare-fun m!951373 () Bool)

(assert (=> start!90048 m!951373))

(declare-fun m!951375 () Bool)

(assert (=> b!1031310 m!951375))

(declare-fun m!951377 () Bool)

(assert (=> b!1031307 m!951377))

(declare-fun m!951379 () Bool)

(assert (=> b!1031307 m!951379))

(declare-fun m!951381 () Bool)

(assert (=> b!1031307 m!951381))

(declare-fun m!951383 () Bool)

(assert (=> b!1031307 m!951383))

(declare-fun m!951385 () Bool)

(assert (=> b!1031307 m!951385))

(declare-fun m!951387 () Bool)

(assert (=> b!1031307 m!951387))

(declare-fun m!951389 () Bool)

(assert (=> b!1031307 m!951389))

(declare-fun m!951391 () Bool)

(assert (=> b!1031307 m!951391))

(declare-fun m!951393 () Bool)

(assert (=> b!1031307 m!951393))

(declare-fun m!951395 () Bool)

(assert (=> b!1031307 m!951395))

(assert (=> b!1031307 m!951379))

(declare-fun m!951397 () Bool)

(assert (=> b!1031307 m!951397))

(declare-fun m!951399 () Bool)

(assert (=> b!1031307 m!951399))

(declare-fun m!951401 () Bool)

(assert (=> b!1031307 m!951401))

(declare-fun m!951403 () Bool)

(assert (=> b!1031307 m!951403))

(declare-fun m!951405 () Bool)

(assert (=> b!1031307 m!951405))

(declare-fun m!951407 () Bool)

(assert (=> b!1031307 m!951407))

(declare-fun m!951409 () Bool)

(assert (=> b!1031307 m!951409))

(declare-fun m!951411 () Bool)

(assert (=> b!1031307 m!951411))

(assert (=> b!1031307 m!951393))

(check-sat (not b!1031307) (not b_next!20655) (not start!90048) (not b!1031317) (not b!1031308) tp_is_empty!24375 (not mapNonEmpty!38016) (not b!1031313) (not b!1031311) (not b!1031310) (not b_lambda!15999) b_and!33079)
(check-sat b_and!33079 (not b_next!20655))
