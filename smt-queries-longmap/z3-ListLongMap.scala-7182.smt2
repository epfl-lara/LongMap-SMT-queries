; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92206 () Bool)

(assert start!92206)

(declare-fun b!1047172 () Bool)

(declare-fun b_free!21145 () Bool)

(declare-fun b_next!21145 () Bool)

(assert (=> b!1047172 (= b_free!21145 (not b_next!21145))))

(declare-fun tp!74697 () Bool)

(declare-fun b_and!33795 () Bool)

(assert (=> b!1047172 (= tp!74697 b_and!33795)))

(declare-fun b!1047165 () Bool)

(declare-fun e!593730 () Bool)

(declare-fun e!593734 () Bool)

(assert (=> b!1047165 (= e!593730 (not e!593734))))

(declare-fun res!696810 () Bool)

(assert (=> b!1047165 (=> res!696810 e!593734)))

(declare-datatypes ((V!38027 0))(
  ( (V!38028 (val!12483 Int)) )
))
(declare-datatypes ((ValueCell!11729 0))(
  ( (ValueCellFull!11729 (v!15076 V!38027)) (EmptyCell!11729) )
))
(declare-datatypes ((Unit!34177 0))(
  ( (Unit!34178) )
))
(declare-datatypes ((array!65957 0))(
  ( (array!65958 (arr!31717 (Array (_ BitVec 32) (_ BitVec 64))) (size!32253 (_ BitVec 32))) )
))
(declare-datatypes ((array!65959 0))(
  ( (array!65960 (arr!31718 (Array (_ BitVec 32) ValueCell!11729)) (size!32254 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6052 0))(
  ( (LongMapFixedSize!6053 (defaultEntry!6424 Int) (mask!30621 (_ BitVec 32)) (extraKeys!6152 (_ BitVec 32)) (zeroValue!6258 V!38027) (minValue!6258 V!38027) (_size!3081 (_ BitVec 32)) (_keys!11736 array!65957) (_values!6447 array!65959) (_vacant!3081 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15798 0))(
  ( (tuple2!15799 (_1!7910 Unit!34177) (_2!7910 LongMapFixedSize!6052)) )
))
(declare-fun lt!462359 () tuple2!15798)

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15800 0))(
  ( (tuple2!15801 (_1!7911 (_ BitVec 64)) (_2!7911 V!38027)) )
))
(declare-datatypes ((List!22015 0))(
  ( (Nil!22012) (Cons!22011 (h!23228 tuple2!15800) (t!31283 List!22015)) )
))
(declare-datatypes ((ListLongMap!13803 0))(
  ( (ListLongMap!13804 (toList!6917 List!22015)) )
))
(declare-fun contains!6112 (ListLongMap!13803 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3961 (array!65957 array!65959 (_ BitVec 32) (_ BitVec 32) V!38027 V!38027 (_ BitVec 32) Int) ListLongMap!13803)

(assert (=> b!1047165 (= res!696810 (not (contains!6112 (getCurrentListMap!3961 (_keys!11736 (_2!7910 lt!462359)) (_values!6447 (_2!7910 lt!462359)) (mask!30621 (_2!7910 lt!462359)) (extraKeys!6152 (_2!7910 lt!462359)) (zeroValue!6258 (_2!7910 lt!462359)) (minValue!6258 (_2!7910 lt!462359)) #b00000000000000000000000000000000 (defaultEntry!6424 (_2!7910 lt!462359))) key!909)))))

(declare-fun thiss!1427 () LongMapFixedSize!6052)

(declare-fun lt!462358 () array!65959)

(declare-fun lt!462353 () array!65957)

(declare-fun Unit!34179 () Unit!34177)

(declare-fun Unit!34180 () Unit!34177)

(assert (=> b!1047165 (= lt!462359 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3081 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15799 Unit!34179 (LongMapFixedSize!6053 (defaultEntry!6424 thiss!1427) (mask!30621 thiss!1427) (extraKeys!6152 thiss!1427) (zeroValue!6258 thiss!1427) (minValue!6258 thiss!1427) (bvsub (_size!3081 thiss!1427) #b00000000000000000000000000000001) lt!462353 lt!462358 (bvadd #b00000000000000000000000000000001 (_vacant!3081 thiss!1427)))) (tuple2!15799 Unit!34180 (LongMapFixedSize!6053 (defaultEntry!6424 thiss!1427) (mask!30621 thiss!1427) (extraKeys!6152 thiss!1427) (zeroValue!6258 thiss!1427) (minValue!6258 thiss!1427) (bvsub (_size!3081 thiss!1427) #b00000000000000000000000000000001) lt!462353 lt!462358 (_vacant!3081 thiss!1427)))))))

(declare-fun -!540 (ListLongMap!13803 (_ BitVec 64)) ListLongMap!13803)

(assert (=> b!1047165 (= (-!540 (getCurrentListMap!3961 (_keys!11736 thiss!1427) (_values!6447 thiss!1427) (mask!30621 thiss!1427) (extraKeys!6152 thiss!1427) (zeroValue!6258 thiss!1427) (minValue!6258 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6424 thiss!1427)) key!909) (getCurrentListMap!3961 lt!462353 lt!462358 (mask!30621 thiss!1427) (extraKeys!6152 thiss!1427) (zeroValue!6258 thiss!1427) (minValue!6258 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6424 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9807 0))(
  ( (MissingZero!9807 (index!41599 (_ BitVec 32))) (Found!9807 (index!41600 (_ BitVec 32))) (Intermediate!9807 (undefined!10619 Bool) (index!41601 (_ BitVec 32)) (x!93403 (_ BitVec 32))) (Undefined!9807) (MissingVacant!9807 (index!41602 (_ BitVec 32))) )
))
(declare-fun lt!462356 () SeekEntryResult!9807)

(declare-fun dynLambda!2032 (Int (_ BitVec 64)) V!38027)

(assert (=> b!1047165 (= lt!462358 (array!65960 (store (arr!31718 (_values!6447 thiss!1427)) (index!41600 lt!462356) (ValueCellFull!11729 (dynLambda!2032 (defaultEntry!6424 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32254 (_values!6447 thiss!1427))))))

(declare-fun lt!462361 () Unit!34177)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!62 (array!65957 array!65959 (_ BitVec 32) (_ BitVec 32) V!38027 V!38027 (_ BitVec 32) (_ BitVec 64) Int) Unit!34177)

(assert (=> b!1047165 (= lt!462361 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!62 (_keys!11736 thiss!1427) (_values!6447 thiss!1427) (mask!30621 thiss!1427) (extraKeys!6152 thiss!1427) (zeroValue!6258 thiss!1427) (minValue!6258 thiss!1427) (index!41600 lt!462356) key!909 (defaultEntry!6424 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65957 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1047165 (not (arrayContainsKey!0 lt!462353 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!462360 () Unit!34177)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65957 (_ BitVec 32) (_ BitVec 64)) Unit!34177)

(assert (=> b!1047165 (= lt!462360 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11736 thiss!1427) (index!41600 lt!462356) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65957 (_ BitVec 32)) Bool)

(assert (=> b!1047165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!462353 (mask!30621 thiss!1427))))

(declare-fun lt!462354 () Unit!34177)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65957 (_ BitVec 32) (_ BitVec 32)) Unit!34177)

(assert (=> b!1047165 (= lt!462354 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11736 thiss!1427) (index!41600 lt!462356) (mask!30621 thiss!1427)))))

(declare-datatypes ((List!22016 0))(
  ( (Nil!22013) (Cons!22012 (h!23229 (_ BitVec 64)) (t!31284 List!22016)) )
))
(declare-fun arrayNoDuplicates!0 (array!65957 (_ BitVec 32) List!22016) Bool)

(assert (=> b!1047165 (arrayNoDuplicates!0 lt!462353 #b00000000000000000000000000000000 Nil!22013)))

(declare-fun lt!462355 () Unit!34177)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65957 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22016) Unit!34177)

(assert (=> b!1047165 (= lt!462355 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11736 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41600 lt!462356) #b00000000000000000000000000000000 Nil!22013))))

(declare-fun arrayCountValidKeys!0 (array!65957 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1047165 (= (arrayCountValidKeys!0 lt!462353 #b00000000000000000000000000000000 (size!32253 (_keys!11736 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11736 thiss!1427) #b00000000000000000000000000000000 (size!32253 (_keys!11736 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1047165 (= lt!462353 (array!65958 (store (arr!31717 (_keys!11736 thiss!1427)) (index!41600 lt!462356) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32253 (_keys!11736 thiss!1427))))))

(declare-fun lt!462357 () Unit!34177)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65957 (_ BitVec 32) (_ BitVec 64)) Unit!34177)

(assert (=> b!1047165 (= lt!462357 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11736 thiss!1427) (index!41600 lt!462356) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1047166 () Bool)

(declare-fun e!593735 () Bool)

(declare-fun tp_is_empty!24865 () Bool)

(assert (=> b!1047166 (= e!593735 tp_is_empty!24865)))

(declare-fun b!1047167 () Bool)

(declare-fun res!696811 () Bool)

(assert (=> b!1047167 (=> res!696811 e!593734)))

(assert (=> b!1047167 (= res!696811 (or (not (= (size!32254 (_values!6447 (_2!7910 lt!462359))) (bvadd #b00000000000000000000000000000001 (mask!30621 (_2!7910 lt!462359))))) (not (= (size!32253 (_keys!11736 (_2!7910 lt!462359))) (size!32254 (_values!6447 (_2!7910 lt!462359))))) (bvslt (mask!30621 (_2!7910 lt!462359)) #b00000000000000000000000000000000) (bvslt (extraKeys!6152 (_2!7910 lt!462359)) #b00000000000000000000000000000000) (bvsgt (extraKeys!6152 (_2!7910 lt!462359)) #b00000000000000000000000000000011)))))

(declare-fun b!1047168 () Bool)

(declare-fun e!593733 () Bool)

(assert (=> b!1047168 (= e!593733 tp_is_empty!24865)))

(declare-fun b!1047169 () Bool)

(declare-fun res!696812 () Bool)

(declare-fun e!593731 () Bool)

(assert (=> b!1047169 (=> (not res!696812) (not e!593731))))

(assert (=> b!1047169 (= res!696812 (not (= key!909 (bvneg key!909))))))

(declare-fun res!696808 () Bool)

(assert (=> start!92206 (=> (not res!696808) (not e!593731))))

(declare-fun valid!2276 (LongMapFixedSize!6052) Bool)

(assert (=> start!92206 (= res!696808 (valid!2276 thiss!1427))))

(assert (=> start!92206 e!593731))

(declare-fun e!593729 () Bool)

(assert (=> start!92206 e!593729))

(assert (=> start!92206 true))

(declare-fun b!1047170 () Bool)

(declare-fun e!593732 () Bool)

(declare-fun mapRes!38942 () Bool)

(assert (=> b!1047170 (= e!593732 (and e!593733 mapRes!38942))))

(declare-fun condMapEmpty!38942 () Bool)

(declare-fun mapDefault!38942 () ValueCell!11729)

(assert (=> b!1047170 (= condMapEmpty!38942 (= (arr!31718 (_values!6447 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11729)) mapDefault!38942)))))

(declare-fun b!1047171 () Bool)

(assert (=> b!1047171 (= e!593734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11736 (_2!7910 lt!462359)) (mask!30621 (_2!7910 lt!462359))))))

(declare-fun array_inv!24509 (array!65957) Bool)

(declare-fun array_inv!24510 (array!65959) Bool)

(assert (=> b!1047172 (= e!593729 (and tp!74697 tp_is_empty!24865 (array_inv!24509 (_keys!11736 thiss!1427)) (array_inv!24510 (_values!6447 thiss!1427)) e!593732))))

(declare-fun mapNonEmpty!38942 () Bool)

(declare-fun tp!74696 () Bool)

(assert (=> mapNonEmpty!38942 (= mapRes!38942 (and tp!74696 e!593735))))

(declare-fun mapRest!38942 () (Array (_ BitVec 32) ValueCell!11729))

(declare-fun mapValue!38942 () ValueCell!11729)

(declare-fun mapKey!38942 () (_ BitVec 32))

(assert (=> mapNonEmpty!38942 (= (arr!31718 (_values!6447 thiss!1427)) (store mapRest!38942 mapKey!38942 mapValue!38942))))

(declare-fun b!1047173 () Bool)

(assert (=> b!1047173 (= e!593731 e!593730)))

(declare-fun res!696809 () Bool)

(assert (=> b!1047173 (=> (not res!696809) (not e!593730))))

(get-info :version)

(assert (=> b!1047173 (= res!696809 ((_ is Found!9807) lt!462356))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65957 (_ BitVec 32)) SeekEntryResult!9807)

(assert (=> b!1047173 (= lt!462356 (seekEntry!0 key!909 (_keys!11736 thiss!1427) (mask!30621 thiss!1427)))))

(declare-fun mapIsEmpty!38942 () Bool)

(assert (=> mapIsEmpty!38942 mapRes!38942))

(declare-fun b!1047174 () Bool)

(declare-fun res!696813 () Bool)

(assert (=> b!1047174 (=> res!696813 e!593734)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1047174 (= res!696813 (not (validMask!0 (mask!30621 (_2!7910 lt!462359)))))))

(assert (= (and start!92206 res!696808) b!1047169))

(assert (= (and b!1047169 res!696812) b!1047173))

(assert (= (and b!1047173 res!696809) b!1047165))

(assert (= (and b!1047165 (not res!696810)) b!1047174))

(assert (= (and b!1047174 (not res!696813)) b!1047167))

(assert (= (and b!1047167 (not res!696811)) b!1047171))

(assert (= (and b!1047170 condMapEmpty!38942) mapIsEmpty!38942))

(assert (= (and b!1047170 (not condMapEmpty!38942)) mapNonEmpty!38942))

(assert (= (and mapNonEmpty!38942 ((_ is ValueCellFull!11729) mapValue!38942)) b!1047166))

(assert (= (and b!1047170 ((_ is ValueCellFull!11729) mapDefault!38942)) b!1047168))

(assert (= b!1047172 b!1047170))

(assert (= start!92206 b!1047172))

(declare-fun b_lambda!16339 () Bool)

(assert (=> (not b_lambda!16339) (not b!1047165)))

(declare-fun t!31282 () Bool)

(declare-fun tb!7089 () Bool)

(assert (=> (and b!1047172 (= (defaultEntry!6424 thiss!1427) (defaultEntry!6424 thiss!1427)) t!31282) tb!7089))

(declare-fun result!14611 () Bool)

(assert (=> tb!7089 (= result!14611 tp_is_empty!24865)))

(assert (=> b!1047165 t!31282))

(declare-fun b_and!33797 () Bool)

(assert (= b_and!33795 (and (=> t!31282 result!14611) b_and!33797)))

(declare-fun m!967315 () Bool)

(assert (=> b!1047173 m!967315))

(declare-fun m!967317 () Bool)

(assert (=> b!1047171 m!967317))

(declare-fun m!967319 () Bool)

(assert (=> b!1047165 m!967319))

(declare-fun m!967321 () Bool)

(assert (=> b!1047165 m!967321))

(declare-fun m!967323 () Bool)

(assert (=> b!1047165 m!967323))

(declare-fun m!967325 () Bool)

(assert (=> b!1047165 m!967325))

(declare-fun m!967327 () Bool)

(assert (=> b!1047165 m!967327))

(declare-fun m!967329 () Bool)

(assert (=> b!1047165 m!967329))

(declare-fun m!967331 () Bool)

(assert (=> b!1047165 m!967331))

(declare-fun m!967333 () Bool)

(assert (=> b!1047165 m!967333))

(assert (=> b!1047165 m!967329))

(declare-fun m!967335 () Bool)

(assert (=> b!1047165 m!967335))

(declare-fun m!967337 () Bool)

(assert (=> b!1047165 m!967337))

(declare-fun m!967339 () Bool)

(assert (=> b!1047165 m!967339))

(declare-fun m!967341 () Bool)

(assert (=> b!1047165 m!967341))

(declare-fun m!967343 () Bool)

(assert (=> b!1047165 m!967343))

(declare-fun m!967345 () Bool)

(assert (=> b!1047165 m!967345))

(declare-fun m!967347 () Bool)

(assert (=> b!1047165 m!967347))

(assert (=> b!1047165 m!967343))

(declare-fun m!967349 () Bool)

(assert (=> b!1047165 m!967349))

(declare-fun m!967351 () Bool)

(assert (=> b!1047165 m!967351))

(declare-fun m!967353 () Bool)

(assert (=> b!1047165 m!967353))

(declare-fun m!967355 () Bool)

(assert (=> start!92206 m!967355))

(declare-fun m!967357 () Bool)

(assert (=> b!1047174 m!967357))

(declare-fun m!967359 () Bool)

(assert (=> b!1047172 m!967359))

(declare-fun m!967361 () Bool)

(assert (=> b!1047172 m!967361))

(declare-fun m!967363 () Bool)

(assert (=> mapNonEmpty!38942 m!967363))

(check-sat (not b!1047174) (not b!1047171) (not b_next!21145) (not mapNonEmpty!38942) (not b!1047173) tp_is_empty!24865 (not b!1047165) (not start!92206) (not b_lambda!16339) (not b!1047172) b_and!33797)
(check-sat b_and!33797 (not b_next!21145))
