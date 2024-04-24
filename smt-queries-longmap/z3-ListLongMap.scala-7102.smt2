; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90292 () Bool)

(assert start!90292)

(declare-fun b!1032803 () Bool)

(declare-fun b_free!20665 () Bool)

(declare-fun b_next!20665 () Bool)

(assert (=> b!1032803 (= b_free!20665 (not b_next!20665))))

(declare-fun tp!73065 () Bool)

(declare-fun b_and!33107 () Bool)

(assert (=> b!1032803 (= tp!73065 b_and!33107)))

(declare-fun mapNonEmpty!38031 () Bool)

(declare-fun mapRes!38031 () Bool)

(declare-fun tp!73066 () Bool)

(declare-fun e!583438 () Bool)

(assert (=> mapNonEmpty!38031 (= mapRes!38031 (and tp!73066 e!583438))))

(declare-datatypes ((V!37387 0))(
  ( (V!37388 (val!12243 Int)) )
))
(declare-datatypes ((ValueCell!11489 0))(
  ( (ValueCellFull!11489 (v!14816 V!37387)) (EmptyCell!11489) )
))
(declare-fun mapRest!38031 () (Array (_ BitVec 32) ValueCell!11489))

(declare-datatypes ((array!64883 0))(
  ( (array!64884 (arr!31237 (Array (_ BitVec 32) (_ BitVec 64))) (size!31755 (_ BitVec 32))) )
))
(declare-datatypes ((array!64885 0))(
  ( (array!64886 (arr!31238 (Array (_ BitVec 32) ValueCell!11489)) (size!31756 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5572 0))(
  ( (LongMapFixedSize!5573 (defaultEntry!6160 Int) (mask!30018 (_ BitVec 32)) (extraKeys!5892 (_ BitVec 32)) (zeroValue!5996 V!37387) (minValue!5996 V!37387) (_size!2841 (_ BitVec 32)) (_keys!11371 array!64883) (_values!6183 array!64885) (_vacant!2841 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5572)

(declare-fun mapValue!38031 () ValueCell!11489)

(declare-fun mapKey!38031 () (_ BitVec 32))

(assert (=> mapNonEmpty!38031 (= (arr!31238 (_values!6183 thiss!1427)) (store mapRest!38031 mapKey!38031 mapValue!38031))))

(declare-fun b!1032797 () Bool)

(declare-fun res!690187 () Bool)

(declare-fun e!583433 () Bool)

(assert (=> b!1032797 (=> res!690187 e!583433)))

(declare-datatypes ((Unit!33744 0))(
  ( (Unit!33745) )
))
(declare-datatypes ((tuple2!15668 0))(
  ( (tuple2!15669 (_1!7845 Unit!33744) (_2!7845 LongMapFixedSize!5572)) )
))
(declare-fun lt!455922 () tuple2!15668)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64883 (_ BitVec 32)) Bool)

(assert (=> b!1032797 (= res!690187 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11371 (_2!7845 lt!455922)) (mask!30018 (_2!7845 lt!455922)))))))

(declare-fun b!1032798 () Bool)

(declare-fun e!583439 () Bool)

(declare-fun tp_is_empty!24385 () Bool)

(assert (=> b!1032798 (= e!583439 tp_is_empty!24385)))

(declare-fun b!1032799 () Bool)

(declare-fun e!583435 () Bool)

(assert (=> b!1032799 (= e!583435 (and e!583439 mapRes!38031))))

(declare-fun condMapEmpty!38031 () Bool)

(declare-fun mapDefault!38031 () ValueCell!11489)

(assert (=> b!1032799 (= condMapEmpty!38031 (= (arr!31238 (_values!6183 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11489)) mapDefault!38031)))))

(declare-fun b!1032800 () Bool)

(assert (=> b!1032800 (= e!583438 tp_is_empty!24385)))

(declare-fun b!1032801 () Bool)

(declare-fun res!690186 () Bool)

(assert (=> b!1032801 (=> res!690186 e!583433)))

(assert (=> b!1032801 (= res!690186 (or (not (= (size!31756 (_values!6183 (_2!7845 lt!455922))) (bvadd #b00000000000000000000000000000001 (mask!30018 (_2!7845 lt!455922))))) (not (= (size!31755 (_keys!11371 (_2!7845 lt!455922))) (size!31756 (_values!6183 (_2!7845 lt!455922))))) (bvslt (mask!30018 (_2!7845 lt!455922)) #b00000000000000000000000000000000) (bvslt (extraKeys!5892 (_2!7845 lt!455922)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5892 (_2!7845 lt!455922)) #b00000000000000000000000000000011)))))

(declare-fun b!1032802 () Bool)

(declare-fun res!690185 () Bool)

(declare-fun e!583436 () Bool)

(assert (=> b!1032802 (=> (not res!690185) (not e!583436))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1032802 (= res!690185 (not (= key!909 (bvneg key!909))))))

(declare-fun e!583440 () Bool)

(declare-fun array_inv!24185 (array!64883) Bool)

(declare-fun array_inv!24186 (array!64885) Bool)

(assert (=> b!1032803 (= e!583440 (and tp!73065 tp_is_empty!24385 (array_inv!24185 (_keys!11371 thiss!1427)) (array_inv!24186 (_values!6183 thiss!1427)) e!583435))))

(declare-fun b!1032804 () Bool)

(assert (=> b!1032804 (= e!583433 true)))

(declare-fun lt!455918 () Bool)

(declare-datatypes ((List!21857 0))(
  ( (Nil!21854) (Cons!21853 (h!23064 (_ BitVec 64)) (t!31009 List!21857)) )
))
(declare-fun arrayNoDuplicates!0 (array!64883 (_ BitVec 32) List!21857) Bool)

(assert (=> b!1032804 (= lt!455918 (arrayNoDuplicates!0 (_keys!11371 (_2!7845 lt!455922)) #b00000000000000000000000000000000 Nil!21854))))

(declare-fun b!1032805 () Bool)

(declare-fun res!690188 () Bool)

(assert (=> b!1032805 (=> res!690188 e!583433)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1032805 (= res!690188 (not (validMask!0 (mask!30018 (_2!7845 lt!455922)))))))

(declare-fun b!1032806 () Bool)

(declare-fun e!583434 () Bool)

(assert (=> b!1032806 (= e!583434 (not e!583433))))

(declare-fun res!690182 () Bool)

(assert (=> b!1032806 (=> res!690182 e!583433)))

(declare-datatypes ((tuple2!15670 0))(
  ( (tuple2!15671 (_1!7846 (_ BitVec 64)) (_2!7846 V!37387)) )
))
(declare-datatypes ((List!21858 0))(
  ( (Nil!21855) (Cons!21854 (h!23065 tuple2!15670) (t!31010 List!21858)) )
))
(declare-datatypes ((ListLongMap!13737 0))(
  ( (ListLongMap!13738 (toList!6884 List!21858)) )
))
(declare-fun contains!6019 (ListLongMap!13737 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3930 (array!64883 array!64885 (_ BitVec 32) (_ BitVec 32) V!37387 V!37387 (_ BitVec 32) Int) ListLongMap!13737)

(assert (=> b!1032806 (= res!690182 (not (contains!6019 (getCurrentListMap!3930 (_keys!11371 (_2!7845 lt!455922)) (_values!6183 (_2!7845 lt!455922)) (mask!30018 (_2!7845 lt!455922)) (extraKeys!5892 (_2!7845 lt!455922)) (zeroValue!5996 (_2!7845 lt!455922)) (minValue!5996 (_2!7845 lt!455922)) #b00000000000000000000000000000000 (defaultEntry!6160 (_2!7845 lt!455922))) key!909)))))

(declare-fun lt!455926 () array!64885)

(declare-fun lt!455920 () array!64883)

(declare-fun Unit!33746 () Unit!33744)

(declare-fun Unit!33747 () Unit!33744)

(assert (=> b!1032806 (= lt!455922 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2841 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15669 Unit!33746 (LongMapFixedSize!5573 (defaultEntry!6160 thiss!1427) (mask!30018 thiss!1427) (extraKeys!5892 thiss!1427) (zeroValue!5996 thiss!1427) (minValue!5996 thiss!1427) (bvsub (_size!2841 thiss!1427) #b00000000000000000000000000000001) lt!455920 lt!455926 (bvadd #b00000000000000000000000000000001 (_vacant!2841 thiss!1427)))) (tuple2!15669 Unit!33747 (LongMapFixedSize!5573 (defaultEntry!6160 thiss!1427) (mask!30018 thiss!1427) (extraKeys!5892 thiss!1427) (zeroValue!5996 thiss!1427) (minValue!5996 thiss!1427) (bvsub (_size!2841 thiss!1427) #b00000000000000000000000000000001) lt!455920 lt!455926 (_vacant!2841 thiss!1427)))))))

(declare-fun -!507 (ListLongMap!13737 (_ BitVec 64)) ListLongMap!13737)

(assert (=> b!1032806 (= (-!507 (getCurrentListMap!3930 (_keys!11371 thiss!1427) (_values!6183 thiss!1427) (mask!30018 thiss!1427) (extraKeys!5892 thiss!1427) (zeroValue!5996 thiss!1427) (minValue!5996 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6160 thiss!1427)) key!909) (getCurrentListMap!3930 lt!455920 lt!455926 (mask!30018 thiss!1427) (extraKeys!5892 thiss!1427) (zeroValue!5996 thiss!1427) (minValue!5996 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6160 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9662 0))(
  ( (MissingZero!9662 (index!41019 (_ BitVec 32))) (Found!9662 (index!41020 (_ BitVec 32))) (Intermediate!9662 (undefined!10474 Bool) (index!41021 (_ BitVec 32)) (x!91834 (_ BitVec 32))) (Undefined!9662) (MissingVacant!9662 (index!41022 (_ BitVec 32))) )
))
(declare-fun lt!455919 () SeekEntryResult!9662)

(declare-fun dynLambda!2001 (Int (_ BitVec 64)) V!37387)

(assert (=> b!1032806 (= lt!455926 (array!64886 (store (arr!31238 (_values!6183 thiss!1427)) (index!41020 lt!455919) (ValueCellFull!11489 (dynLambda!2001 (defaultEntry!6160 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31756 (_values!6183 thiss!1427))))))

(declare-fun lt!455925 () Unit!33744)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!33 (array!64883 array!64885 (_ BitVec 32) (_ BitVec 32) V!37387 V!37387 (_ BitVec 32) (_ BitVec 64) Int) Unit!33744)

(assert (=> b!1032806 (= lt!455925 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!33 (_keys!11371 thiss!1427) (_values!6183 thiss!1427) (mask!30018 thiss!1427) (extraKeys!5892 thiss!1427) (zeroValue!5996 thiss!1427) (minValue!5996 thiss!1427) (index!41020 lt!455919) key!909 (defaultEntry!6160 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64883 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1032806 (not (arrayContainsKey!0 lt!455920 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!455923 () Unit!33744)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64883 (_ BitVec 32) (_ BitVec 64)) Unit!33744)

(assert (=> b!1032806 (= lt!455923 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11371 thiss!1427) (index!41020 lt!455919) key!909))))

(assert (=> b!1032806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!455920 (mask!30018 thiss!1427))))

(declare-fun lt!455924 () Unit!33744)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64883 (_ BitVec 32) (_ BitVec 32)) Unit!33744)

(assert (=> b!1032806 (= lt!455924 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11371 thiss!1427) (index!41020 lt!455919) (mask!30018 thiss!1427)))))

(assert (=> b!1032806 (arrayNoDuplicates!0 lt!455920 #b00000000000000000000000000000000 Nil!21854)))

(declare-fun lt!455917 () Unit!33744)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64883 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21857) Unit!33744)

(assert (=> b!1032806 (= lt!455917 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11371 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41020 lt!455919) #b00000000000000000000000000000000 Nil!21854))))

(declare-fun arrayCountValidKeys!0 (array!64883 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1032806 (= (arrayCountValidKeys!0 lt!455920 #b00000000000000000000000000000000 (size!31755 (_keys!11371 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11371 thiss!1427) #b00000000000000000000000000000000 (size!31755 (_keys!11371 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1032806 (= lt!455920 (array!64884 (store (arr!31237 (_keys!11371 thiss!1427)) (index!41020 lt!455919) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31755 (_keys!11371 thiss!1427))))))

(declare-fun lt!455921 () Unit!33744)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64883 (_ BitVec 32) (_ BitVec 64)) Unit!33744)

(assert (=> b!1032806 (= lt!455921 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11371 thiss!1427) (index!41020 lt!455919) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!690184 () Bool)

(assert (=> start!90292 (=> (not res!690184) (not e!583436))))

(declare-fun valid!2112 (LongMapFixedSize!5572) Bool)

(assert (=> start!90292 (= res!690184 (valid!2112 thiss!1427))))

(assert (=> start!90292 e!583436))

(assert (=> start!90292 e!583440))

(assert (=> start!90292 true))

(declare-fun mapIsEmpty!38031 () Bool)

(assert (=> mapIsEmpty!38031 mapRes!38031))

(declare-fun b!1032807 () Bool)

(assert (=> b!1032807 (= e!583436 e!583434)))

(declare-fun res!690183 () Bool)

(assert (=> b!1032807 (=> (not res!690183) (not e!583434))))

(get-info :version)

(assert (=> b!1032807 (= res!690183 ((_ is Found!9662) lt!455919))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64883 (_ BitVec 32)) SeekEntryResult!9662)

(assert (=> b!1032807 (= lt!455919 (seekEntry!0 key!909 (_keys!11371 thiss!1427) (mask!30018 thiss!1427)))))

(assert (= (and start!90292 res!690184) b!1032802))

(assert (= (and b!1032802 res!690185) b!1032807))

(assert (= (and b!1032807 res!690183) b!1032806))

(assert (= (and b!1032806 (not res!690182)) b!1032805))

(assert (= (and b!1032805 (not res!690188)) b!1032801))

(assert (= (and b!1032801 (not res!690186)) b!1032797))

(assert (= (and b!1032797 (not res!690187)) b!1032804))

(assert (= (and b!1032799 condMapEmpty!38031) mapIsEmpty!38031))

(assert (= (and b!1032799 (not condMapEmpty!38031)) mapNonEmpty!38031))

(assert (= (and mapNonEmpty!38031 ((_ is ValueCellFull!11489) mapValue!38031)) b!1032800))

(assert (= (and b!1032799 ((_ is ValueCellFull!11489) mapDefault!38031)) b!1032798))

(assert (= b!1032803 b!1032799))

(assert (= start!90292 b!1032803))

(declare-fun b_lambda!16019 () Bool)

(assert (=> (not b_lambda!16019) (not b!1032806)))

(declare-fun t!31008 () Bool)

(declare-fun tb!6975 () Bool)

(assert (=> (and b!1032803 (= (defaultEntry!6160 thiss!1427) (defaultEntry!6160 thiss!1427)) t!31008) tb!6975))

(declare-fun result!14287 () Bool)

(assert (=> tb!6975 (= result!14287 tp_is_empty!24385)))

(assert (=> b!1032806 t!31008))

(declare-fun b_and!33109 () Bool)

(assert (= b_and!33107 (and (=> t!31008 result!14287) b_and!33109)))

(declare-fun m!953285 () Bool)

(assert (=> b!1032806 m!953285))

(declare-fun m!953287 () Bool)

(assert (=> b!1032806 m!953287))

(declare-fun m!953289 () Bool)

(assert (=> b!1032806 m!953289))

(declare-fun m!953291 () Bool)

(assert (=> b!1032806 m!953291))

(declare-fun m!953293 () Bool)

(assert (=> b!1032806 m!953293))

(declare-fun m!953295 () Bool)

(assert (=> b!1032806 m!953295))

(declare-fun m!953297 () Bool)

(assert (=> b!1032806 m!953297))

(declare-fun m!953299 () Bool)

(assert (=> b!1032806 m!953299))

(declare-fun m!953301 () Bool)

(assert (=> b!1032806 m!953301))

(declare-fun m!953303 () Bool)

(assert (=> b!1032806 m!953303))

(assert (=> b!1032806 m!953291))

(declare-fun m!953305 () Bool)

(assert (=> b!1032806 m!953305))

(declare-fun m!953307 () Bool)

(assert (=> b!1032806 m!953307))

(declare-fun m!953309 () Bool)

(assert (=> b!1032806 m!953309))

(declare-fun m!953311 () Bool)

(assert (=> b!1032806 m!953311))

(assert (=> b!1032806 m!953307))

(declare-fun m!953313 () Bool)

(assert (=> b!1032806 m!953313))

(declare-fun m!953315 () Bool)

(assert (=> b!1032806 m!953315))

(declare-fun m!953317 () Bool)

(assert (=> b!1032806 m!953317))

(declare-fun m!953319 () Bool)

(assert (=> b!1032806 m!953319))

(declare-fun m!953321 () Bool)

(assert (=> b!1032807 m!953321))

(declare-fun m!953323 () Bool)

(assert (=> b!1032797 m!953323))

(declare-fun m!953325 () Bool)

(assert (=> mapNonEmpty!38031 m!953325))

(declare-fun m!953327 () Bool)

(assert (=> b!1032803 m!953327))

(declare-fun m!953329 () Bool)

(assert (=> b!1032803 m!953329))

(declare-fun m!953331 () Bool)

(assert (=> start!90292 m!953331))

(declare-fun m!953333 () Bool)

(assert (=> b!1032805 m!953333))

(declare-fun m!953335 () Bool)

(assert (=> b!1032804 m!953335))

(check-sat tp_is_empty!24385 (not b!1032805) (not b!1032797) (not b!1032803) (not b!1032807) (not start!90292) (not b_lambda!16019) (not b!1032804) (not b!1032806) (not mapNonEmpty!38031) (not b_next!20665) b_and!33109)
(check-sat b_and!33109 (not b_next!20665))
