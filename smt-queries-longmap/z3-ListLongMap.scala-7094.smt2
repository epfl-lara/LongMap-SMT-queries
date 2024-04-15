; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89976 () Bool)

(assert start!89976)

(declare-fun b!1030296 () Bool)

(declare-fun b_free!20617 () Bool)

(declare-fun b_next!20617 () Bool)

(assert (=> b!1030296 (= b_free!20617 (not b_next!20617))))

(declare-fun tp!72918 () Bool)

(declare-fun b_and!32969 () Bool)

(assert (=> b!1030296 (= tp!72918 b_and!32969)))

(declare-fun b!1030290 () Bool)

(declare-fun e!581797 () Bool)

(declare-fun tp_is_empty!24337 () Bool)

(assert (=> b!1030290 (= e!581797 tp_is_empty!24337)))

(declare-fun mapIsEmpty!37956 () Bool)

(declare-fun mapRes!37956 () Bool)

(assert (=> mapIsEmpty!37956 mapRes!37956))

(declare-fun b!1030291 () Bool)

(declare-fun res!689006 () Bool)

(declare-fun e!581794 () Bool)

(assert (=> b!1030291 (=> res!689006 e!581794)))

(declare-datatypes ((V!37323 0))(
  ( (V!37324 (val!12219 Int)) )
))
(declare-datatypes ((ValueCell!11465 0))(
  ( (ValueCellFull!11465 (v!14795 V!37323)) (EmptyCell!11465) )
))
(declare-datatypes ((Unit!33549 0))(
  ( (Unit!33550) )
))
(declare-datatypes ((array!64675 0))(
  ( (array!64676 (arr!31140 (Array (_ BitVec 32) (_ BitVec 64))) (size!31659 (_ BitVec 32))) )
))
(declare-datatypes ((array!64677 0))(
  ( (array!64678 (arr!31141 (Array (_ BitVec 32) ValueCell!11465)) (size!31660 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5524 0))(
  ( (LongMapFixedSize!5525 (defaultEntry!6134 Int) (mask!29907 (_ BitVec 32)) (extraKeys!5866 (_ BitVec 32)) (zeroValue!5970 V!37323) (minValue!5970 V!37323) (_size!2817 (_ BitVec 32)) (_keys!11301 array!64675) (_values!6157 array!64677) (_vacant!2817 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15674 0))(
  ( (tuple2!15675 (_1!7848 Unit!33549) (_2!7848 LongMapFixedSize!5524)) )
))
(declare-fun lt!454356 () tuple2!15674)

(declare-datatypes ((List!21870 0))(
  ( (Nil!21867) (Cons!21866 (h!23068 (_ BitVec 64)) (t!30973 List!21870)) )
))
(declare-fun arrayNoDuplicates!0 (array!64675 (_ BitVec 32) List!21870) Bool)

(assert (=> b!1030291 (= res!689006 (not (arrayNoDuplicates!0 (_keys!11301 (_2!7848 lt!454356)) #b00000000000000000000000000000000 Nil!21867)))))

(declare-fun b!1030292 () Bool)

(declare-fun e!581799 () Bool)

(assert (=> b!1030292 (= e!581799 tp_is_empty!24337)))

(declare-fun res!689008 () Bool)

(declare-fun e!581793 () Bool)

(assert (=> start!89976 (=> (not res!689008) (not e!581793))))

(declare-fun thiss!1427 () LongMapFixedSize!5524)

(declare-fun valid!2082 (LongMapFixedSize!5524) Bool)

(assert (=> start!89976 (= res!689008 (valid!2082 thiss!1427))))

(assert (=> start!89976 e!581793))

(declare-fun e!581798 () Bool)

(assert (=> start!89976 e!581798))

(assert (=> start!89976 true))

(declare-fun b!1030293 () Bool)

(assert (=> b!1030293 (= e!581794 (bvsle #b00000000000000000000000000000000 (size!31659 (_keys!11301 (_2!7848 lt!454356)))))))

(declare-fun b!1030294 () Bool)

(declare-fun res!689007 () Bool)

(assert (=> b!1030294 (=> res!689007 e!581794)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64675 (_ BitVec 32)) Bool)

(assert (=> b!1030294 (= res!689007 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11301 (_2!7848 lt!454356)) (mask!29907 (_2!7848 lt!454356)))))))

(declare-fun b!1030295 () Bool)

(declare-fun e!581800 () Bool)

(assert (=> b!1030295 (= e!581793 e!581800)))

(declare-fun res!689009 () Bool)

(assert (=> b!1030295 (=> (not res!689009) (not e!581800))))

(declare-datatypes ((SeekEntryResult!9680 0))(
  ( (MissingZero!9680 (index!41091 (_ BitVec 32))) (Found!9680 (index!41092 (_ BitVec 32))) (Intermediate!9680 (undefined!10492 Bool) (index!41093 (_ BitVec 32)) (x!91697 (_ BitVec 32))) (Undefined!9680) (MissingVacant!9680 (index!41094 (_ BitVec 32))) )
))
(declare-fun lt!454358 () SeekEntryResult!9680)

(get-info :version)

(assert (=> b!1030295 (= res!689009 ((_ is Found!9680) lt!454358))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64675 (_ BitVec 32)) SeekEntryResult!9680)

(assert (=> b!1030295 (= lt!454358 (seekEntry!0 key!909 (_keys!11301 thiss!1427) (mask!29907 thiss!1427)))))

(declare-fun e!581796 () Bool)

(declare-fun array_inv!24107 (array!64675) Bool)

(declare-fun array_inv!24108 (array!64677) Bool)

(assert (=> b!1030296 (= e!581798 (and tp!72918 tp_is_empty!24337 (array_inv!24107 (_keys!11301 thiss!1427)) (array_inv!24108 (_values!6157 thiss!1427)) e!581796))))

(declare-fun b!1030297 () Bool)

(declare-fun res!689012 () Bool)

(assert (=> b!1030297 (=> (not res!689012) (not e!581793))))

(assert (=> b!1030297 (= res!689012 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1030298 () Bool)

(declare-fun res!689010 () Bool)

(assert (=> b!1030298 (=> res!689010 e!581794)))

(assert (=> b!1030298 (= res!689010 (or (not (= (size!31660 (_values!6157 (_2!7848 lt!454356))) (bvadd #b00000000000000000000000000000001 (mask!29907 (_2!7848 lt!454356))))) (not (= (size!31659 (_keys!11301 (_2!7848 lt!454356))) (size!31660 (_values!6157 (_2!7848 lt!454356))))) (bvslt (mask!29907 (_2!7848 lt!454356)) #b00000000000000000000000000000000) (bvslt (extraKeys!5866 (_2!7848 lt!454356)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5866 (_2!7848 lt!454356)) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!37956 () Bool)

(declare-fun tp!72919 () Bool)

(assert (=> mapNonEmpty!37956 (= mapRes!37956 (and tp!72919 e!581799))))

(declare-fun mapRest!37956 () (Array (_ BitVec 32) ValueCell!11465))

(declare-fun mapKey!37956 () (_ BitVec 32))

(declare-fun mapValue!37956 () ValueCell!11465)

(assert (=> mapNonEmpty!37956 (= (arr!31141 (_values!6157 thiss!1427)) (store mapRest!37956 mapKey!37956 mapValue!37956))))

(declare-fun b!1030299 () Bool)

(assert (=> b!1030299 (= e!581796 (and e!581797 mapRes!37956))))

(declare-fun condMapEmpty!37956 () Bool)

(declare-fun mapDefault!37956 () ValueCell!11465)

(assert (=> b!1030299 (= condMapEmpty!37956 (= (arr!31141 (_values!6157 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11465)) mapDefault!37956)))))

(declare-fun b!1030300 () Bool)

(assert (=> b!1030300 (= e!581800 (not e!581794))))

(declare-fun res!689011 () Bool)

(assert (=> b!1030300 (=> res!689011 e!581794)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1030300 (= res!689011 (not (validMask!0 (mask!29907 (_2!7848 lt!454356)))))))

(declare-fun lt!454360 () array!64677)

(declare-fun lt!454357 () array!64675)

(declare-fun Unit!33551 () Unit!33549)

(declare-fun Unit!33552 () Unit!33549)

(assert (=> b!1030300 (= lt!454356 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2817 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15675 Unit!33551 (LongMapFixedSize!5525 (defaultEntry!6134 thiss!1427) (mask!29907 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) (bvsub (_size!2817 thiss!1427) #b00000000000000000000000000000001) lt!454357 lt!454360 (bvadd #b00000000000000000000000000000001 (_vacant!2817 thiss!1427)))) (tuple2!15675 Unit!33552 (LongMapFixedSize!5525 (defaultEntry!6134 thiss!1427) (mask!29907 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) (bvsub (_size!2817 thiss!1427) #b00000000000000000000000000000001) lt!454357 lt!454360 (_vacant!2817 thiss!1427)))))))

(declare-datatypes ((tuple2!15676 0))(
  ( (tuple2!15677 (_1!7849 (_ BitVec 64)) (_2!7849 V!37323)) )
))
(declare-datatypes ((List!21871 0))(
  ( (Nil!21868) (Cons!21867 (h!23069 tuple2!15676) (t!30974 List!21871)) )
))
(declare-datatypes ((ListLongMap!13771 0))(
  ( (ListLongMap!13772 (toList!6901 List!21871)) )
))
(declare-fun -!493 (ListLongMap!13771 (_ BitVec 64)) ListLongMap!13771)

(declare-fun getCurrentListMap!3868 (array!64675 array!64677 (_ BitVec 32) (_ BitVec 32) V!37323 V!37323 (_ BitVec 32) Int) ListLongMap!13771)

(assert (=> b!1030300 (= (-!493 (getCurrentListMap!3868 (_keys!11301 thiss!1427) (_values!6157 thiss!1427) (mask!29907 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6134 thiss!1427)) key!909) (getCurrentListMap!3868 lt!454357 lt!454360 (mask!29907 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6134 thiss!1427)))))

(declare-fun dynLambda!1955 (Int (_ BitVec 64)) V!37323)

(assert (=> b!1030300 (= lt!454360 (array!64678 (store (arr!31141 (_values!6157 thiss!1427)) (index!41092 lt!454358) (ValueCellFull!11465 (dynLambda!1955 (defaultEntry!6134 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31660 (_values!6157 thiss!1427))))))

(declare-fun lt!454355 () Unit!33549)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!18 (array!64675 array!64677 (_ BitVec 32) (_ BitVec 32) V!37323 V!37323 (_ BitVec 32) (_ BitVec 64) Int) Unit!33549)

(assert (=> b!1030300 (= lt!454355 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!18 (_keys!11301 thiss!1427) (_values!6157 thiss!1427) (mask!29907 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) (index!41092 lt!454358) key!909 (defaultEntry!6134 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64675 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1030300 (not (arrayContainsKey!0 lt!454357 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!454359 () Unit!33549)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64675 (_ BitVec 32) (_ BitVec 64)) Unit!33549)

(assert (=> b!1030300 (= lt!454359 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11301 thiss!1427) (index!41092 lt!454358) key!909))))

(assert (=> b!1030300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!454357 (mask!29907 thiss!1427))))

(declare-fun lt!454361 () Unit!33549)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64675 (_ BitVec 32) (_ BitVec 32)) Unit!33549)

(assert (=> b!1030300 (= lt!454361 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11301 thiss!1427) (index!41092 lt!454358) (mask!29907 thiss!1427)))))

(assert (=> b!1030300 (arrayNoDuplicates!0 lt!454357 #b00000000000000000000000000000000 Nil!21867)))

(declare-fun lt!454362 () Unit!33549)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64675 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21870) Unit!33549)

(assert (=> b!1030300 (= lt!454362 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11301 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41092 lt!454358) #b00000000000000000000000000000000 Nil!21867))))

(declare-fun arrayCountValidKeys!0 (array!64675 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1030300 (= (arrayCountValidKeys!0 lt!454357 #b00000000000000000000000000000000 (size!31659 (_keys!11301 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11301 thiss!1427) #b00000000000000000000000000000000 (size!31659 (_keys!11301 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1030300 (= lt!454357 (array!64676 (store (arr!31140 (_keys!11301 thiss!1427)) (index!41092 lt!454358) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31659 (_keys!11301 thiss!1427))))))

(declare-fun lt!454363 () Unit!33549)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64675 (_ BitVec 32) (_ BitVec 64)) Unit!33549)

(assert (=> b!1030300 (= lt!454363 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11301 thiss!1427) (index!41092 lt!454358) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!89976 res!689008) b!1030297))

(assert (= (and b!1030297 res!689012) b!1030295))

(assert (= (and b!1030295 res!689009) b!1030300))

(assert (= (and b!1030300 (not res!689011)) b!1030298))

(assert (= (and b!1030298 (not res!689010)) b!1030294))

(assert (= (and b!1030294 (not res!689007)) b!1030291))

(assert (= (and b!1030291 (not res!689006)) b!1030293))

(assert (= (and b!1030299 condMapEmpty!37956) mapIsEmpty!37956))

(assert (= (and b!1030299 (not condMapEmpty!37956)) mapNonEmpty!37956))

(assert (= (and mapNonEmpty!37956 ((_ is ValueCellFull!11465) mapValue!37956)) b!1030292))

(assert (= (and b!1030299 ((_ is ValueCellFull!11465) mapDefault!37956)) b!1030290))

(assert (= b!1030296 b!1030299))

(assert (= start!89976 b!1030296))

(declare-fun b_lambda!15925 () Bool)

(assert (=> (not b_lambda!15925) (not b!1030300)))

(declare-fun t!30972 () Bool)

(declare-fun tb!6927 () Bool)

(assert (=> (and b!1030296 (= (defaultEntry!6134 thiss!1427) (defaultEntry!6134 thiss!1427)) t!30972) tb!6927))

(declare-fun result!14189 () Bool)

(assert (=> tb!6927 (= result!14189 tp_is_empty!24337)))

(assert (=> b!1030300 t!30972))

(declare-fun b_and!32971 () Bool)

(assert (= b_and!32969 (and (=> t!30972 result!14189) b_and!32971)))

(declare-fun m!949569 () Bool)

(assert (=> b!1030294 m!949569))

(declare-fun m!949571 () Bool)

(assert (=> b!1030295 m!949571))

(declare-fun m!949573 () Bool)

(assert (=> mapNonEmpty!37956 m!949573))

(declare-fun m!949575 () Bool)

(assert (=> b!1030291 m!949575))

(declare-fun m!949577 () Bool)

(assert (=> b!1030300 m!949577))

(declare-fun m!949579 () Bool)

(assert (=> b!1030300 m!949579))

(declare-fun m!949581 () Bool)

(assert (=> b!1030300 m!949581))

(declare-fun m!949583 () Bool)

(assert (=> b!1030300 m!949583))

(declare-fun m!949585 () Bool)

(assert (=> b!1030300 m!949585))

(declare-fun m!949587 () Bool)

(assert (=> b!1030300 m!949587))

(declare-fun m!949589 () Bool)

(assert (=> b!1030300 m!949589))

(declare-fun m!949591 () Bool)

(assert (=> b!1030300 m!949591))

(declare-fun m!949593 () Bool)

(assert (=> b!1030300 m!949593))

(assert (=> b!1030300 m!949591))

(declare-fun m!949595 () Bool)

(assert (=> b!1030300 m!949595))

(declare-fun m!949597 () Bool)

(assert (=> b!1030300 m!949597))

(declare-fun m!949599 () Bool)

(assert (=> b!1030300 m!949599))

(declare-fun m!949601 () Bool)

(assert (=> b!1030300 m!949601))

(declare-fun m!949603 () Bool)

(assert (=> b!1030300 m!949603))

(declare-fun m!949605 () Bool)

(assert (=> b!1030300 m!949605))

(declare-fun m!949607 () Bool)

(assert (=> b!1030300 m!949607))

(declare-fun m!949609 () Bool)

(assert (=> b!1030300 m!949609))

(declare-fun m!949611 () Bool)

(assert (=> start!89976 m!949611))

(declare-fun m!949613 () Bool)

(assert (=> b!1030296 m!949613))

(declare-fun m!949615 () Bool)

(assert (=> b!1030296 m!949615))

(check-sat (not mapNonEmpty!37956) (not b!1030294) b_and!32971 (not b_lambda!15925) (not b!1030300) tp_is_empty!24337 (not start!89976) (not b_next!20617) (not b!1030295) (not b!1030296) (not b!1030291))
(check-sat b_and!32971 (not b_next!20617))
(get-model)

(declare-fun b_lambda!15931 () Bool)

(assert (= b_lambda!15925 (or (and b!1030296 b_free!20617) b_lambda!15931)))

(check-sat (not mapNonEmpty!37956) (not b!1030294) b_and!32971 (not b!1030300) tp_is_empty!24337 (not start!89976) (not b_next!20617) (not b!1030295) (not b!1030296) (not b!1030291) (not b_lambda!15931))
(check-sat b_and!32971 (not b_next!20617))
(get-model)

(declare-fun b!1030385 () Bool)

(declare-fun e!581857 () SeekEntryResult!9680)

(declare-fun lt!454429 () SeekEntryResult!9680)

(assert (=> b!1030385 (= e!581857 (Found!9680 (index!41093 lt!454429)))))

(declare-fun b!1030387 () Bool)

(declare-fun e!581856 () SeekEntryResult!9680)

(declare-fun lt!454428 () SeekEntryResult!9680)

(assert (=> b!1030387 (= e!581856 (ite ((_ is MissingVacant!9680) lt!454428) (MissingZero!9680 (index!41094 lt!454428)) lt!454428))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!64675 (_ BitVec 32)) SeekEntryResult!9680)

(assert (=> b!1030387 (= lt!454428 (seekKeyOrZeroReturnVacant!0 (x!91697 lt!454429) (index!41093 lt!454429) (index!41093 lt!454429) key!909 (_keys!11301 thiss!1427) (mask!29907 thiss!1427)))))

(declare-fun b!1030388 () Bool)

(assert (=> b!1030388 (= e!581856 (MissingZero!9680 (index!41093 lt!454429)))))

(declare-fun b!1030386 () Bool)

(declare-fun e!581855 () SeekEntryResult!9680)

(assert (=> b!1030386 (= e!581855 Undefined!9680)))

(declare-fun d!123445 () Bool)

(declare-fun lt!454426 () SeekEntryResult!9680)

(assert (=> d!123445 (and (or ((_ is MissingVacant!9680) lt!454426) (not ((_ is Found!9680) lt!454426)) (and (bvsge (index!41092 lt!454426) #b00000000000000000000000000000000) (bvslt (index!41092 lt!454426) (size!31659 (_keys!11301 thiss!1427))))) (not ((_ is MissingVacant!9680) lt!454426)) (or (not ((_ is Found!9680) lt!454426)) (= (select (arr!31140 (_keys!11301 thiss!1427)) (index!41092 lt!454426)) key!909)))))

(assert (=> d!123445 (= lt!454426 e!581855)))

(declare-fun c!104148 () Bool)

(assert (=> d!123445 (= c!104148 (and ((_ is Intermediate!9680) lt!454429) (undefined!10492 lt!454429)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!64675 (_ BitVec 32)) SeekEntryResult!9680)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!123445 (= lt!454429 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!29907 thiss!1427)) key!909 (_keys!11301 thiss!1427) (mask!29907 thiss!1427)))))

(assert (=> d!123445 (validMask!0 (mask!29907 thiss!1427))))

(assert (=> d!123445 (= (seekEntry!0 key!909 (_keys!11301 thiss!1427) (mask!29907 thiss!1427)) lt!454426)))

(declare-fun b!1030389 () Bool)

(assert (=> b!1030389 (= e!581855 e!581857)))

(declare-fun lt!454427 () (_ BitVec 64))

(assert (=> b!1030389 (= lt!454427 (select (arr!31140 (_keys!11301 thiss!1427)) (index!41093 lt!454429)))))

(declare-fun c!104150 () Bool)

(assert (=> b!1030389 (= c!104150 (= lt!454427 key!909))))

(declare-fun b!1030390 () Bool)

(declare-fun c!104149 () Bool)

(assert (=> b!1030390 (= c!104149 (= lt!454427 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1030390 (= e!581857 e!581856)))

(assert (= (and d!123445 c!104148) b!1030386))

(assert (= (and d!123445 (not c!104148)) b!1030389))

(assert (= (and b!1030389 c!104150) b!1030385))

(assert (= (and b!1030389 (not c!104150)) b!1030390))

(assert (= (and b!1030390 c!104149) b!1030388))

(assert (= (and b!1030390 (not c!104149)) b!1030387))

(declare-fun m!949713 () Bool)

(assert (=> b!1030387 m!949713))

(declare-fun m!949715 () Bool)

(assert (=> d!123445 m!949715))

(declare-fun m!949717 () Bool)

(assert (=> d!123445 m!949717))

(assert (=> d!123445 m!949717))

(declare-fun m!949719 () Bool)

(assert (=> d!123445 m!949719))

(declare-fun m!949721 () Bool)

(assert (=> d!123445 m!949721))

(declare-fun m!949723 () Bool)

(assert (=> b!1030389 m!949723))

(assert (=> b!1030295 d!123445))

(declare-fun b!1030399 () Bool)

(declare-fun e!581865 () Bool)

(declare-fun call!43530 () Bool)

(assert (=> b!1030399 (= e!581865 call!43530)))

(declare-fun b!1030400 () Bool)

(declare-fun e!581864 () Bool)

(assert (=> b!1030400 (= e!581864 call!43530)))

(declare-fun bm!43527 () Bool)

(assert (=> bm!43527 (= call!43530 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11301 (_2!7848 lt!454356)) (mask!29907 (_2!7848 lt!454356))))))

(declare-fun b!1030401 () Bool)

(assert (=> b!1030401 (= e!581865 e!581864)))

(declare-fun lt!454437 () (_ BitVec 64))

(assert (=> b!1030401 (= lt!454437 (select (arr!31140 (_keys!11301 (_2!7848 lt!454356))) #b00000000000000000000000000000000))))

(declare-fun lt!454438 () Unit!33549)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64675 (_ BitVec 64) (_ BitVec 32)) Unit!33549)

(assert (=> b!1030401 (= lt!454438 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11301 (_2!7848 lt!454356)) lt!454437 #b00000000000000000000000000000000))))

(assert (=> b!1030401 (arrayContainsKey!0 (_keys!11301 (_2!7848 lt!454356)) lt!454437 #b00000000000000000000000000000000)))

(declare-fun lt!454436 () Unit!33549)

(assert (=> b!1030401 (= lt!454436 lt!454438)))

(declare-fun res!689060 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!64675 (_ BitVec 32)) SeekEntryResult!9680)

(assert (=> b!1030401 (= res!689060 (= (seekEntryOrOpen!0 (select (arr!31140 (_keys!11301 (_2!7848 lt!454356))) #b00000000000000000000000000000000) (_keys!11301 (_2!7848 lt!454356)) (mask!29907 (_2!7848 lt!454356))) (Found!9680 #b00000000000000000000000000000000)))))

(assert (=> b!1030401 (=> (not res!689060) (not e!581864))))

(declare-fun b!1030402 () Bool)

(declare-fun e!581866 () Bool)

(assert (=> b!1030402 (= e!581866 e!581865)))

(declare-fun c!104153 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1030402 (= c!104153 (validKeyInArray!0 (select (arr!31140 (_keys!11301 (_2!7848 lt!454356))) #b00000000000000000000000000000000)))))

(declare-fun d!123447 () Bool)

(declare-fun res!689059 () Bool)

(assert (=> d!123447 (=> res!689059 e!581866)))

(assert (=> d!123447 (= res!689059 (bvsge #b00000000000000000000000000000000 (size!31659 (_keys!11301 (_2!7848 lt!454356)))))))

(assert (=> d!123447 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11301 (_2!7848 lt!454356)) (mask!29907 (_2!7848 lt!454356))) e!581866)))

(assert (= (and d!123447 (not res!689059)) b!1030402))

(assert (= (and b!1030402 c!104153) b!1030401))

(assert (= (and b!1030402 (not c!104153)) b!1030399))

(assert (= (and b!1030401 res!689060) b!1030400))

(assert (= (or b!1030400 b!1030399) bm!43527))

(declare-fun m!949725 () Bool)

(assert (=> bm!43527 m!949725))

(declare-fun m!949727 () Bool)

(assert (=> b!1030401 m!949727))

(declare-fun m!949729 () Bool)

(assert (=> b!1030401 m!949729))

(declare-fun m!949731 () Bool)

(assert (=> b!1030401 m!949731))

(assert (=> b!1030401 m!949727))

(declare-fun m!949733 () Bool)

(assert (=> b!1030401 m!949733))

(assert (=> b!1030402 m!949727))

(assert (=> b!1030402 m!949727))

(declare-fun m!949735 () Bool)

(assert (=> b!1030402 m!949735))

(assert (=> b!1030294 d!123447))

(declare-fun d!123449 () Bool)

(declare-fun res!689067 () Bool)

(declare-fun e!581869 () Bool)

(assert (=> d!123449 (=> (not res!689067) (not e!581869))))

(declare-fun simpleValid!396 (LongMapFixedSize!5524) Bool)

(assert (=> d!123449 (= res!689067 (simpleValid!396 thiss!1427))))

(assert (=> d!123449 (= (valid!2082 thiss!1427) e!581869)))

(declare-fun b!1030409 () Bool)

(declare-fun res!689068 () Bool)

(assert (=> b!1030409 (=> (not res!689068) (not e!581869))))

(assert (=> b!1030409 (= res!689068 (= (arrayCountValidKeys!0 (_keys!11301 thiss!1427) #b00000000000000000000000000000000 (size!31659 (_keys!11301 thiss!1427))) (_size!2817 thiss!1427)))))

(declare-fun b!1030410 () Bool)

(declare-fun res!689069 () Bool)

(assert (=> b!1030410 (=> (not res!689069) (not e!581869))))

(assert (=> b!1030410 (= res!689069 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11301 thiss!1427) (mask!29907 thiss!1427)))))

(declare-fun b!1030411 () Bool)

(assert (=> b!1030411 (= e!581869 (arrayNoDuplicates!0 (_keys!11301 thiss!1427) #b00000000000000000000000000000000 Nil!21867))))

(assert (= (and d!123449 res!689067) b!1030409))

(assert (= (and b!1030409 res!689068) b!1030410))

(assert (= (and b!1030410 res!689069) b!1030411))

(declare-fun m!949737 () Bool)

(assert (=> d!123449 m!949737))

(assert (=> b!1030409 m!949603))

(declare-fun m!949739 () Bool)

(assert (=> b!1030410 m!949739))

(declare-fun m!949741 () Bool)

(assert (=> b!1030411 m!949741))

(assert (=> start!89976 d!123449))

(declare-fun b!1030422 () Bool)

(declare-fun e!581879 () Bool)

(declare-fun e!581881 () Bool)

(assert (=> b!1030422 (= e!581879 e!581881)))

(declare-fun c!104156 () Bool)

(assert (=> b!1030422 (= c!104156 (validKeyInArray!0 (select (arr!31140 (_keys!11301 (_2!7848 lt!454356))) #b00000000000000000000000000000000)))))

(declare-fun b!1030423 () Bool)

(declare-fun e!581880 () Bool)

(assert (=> b!1030423 (= e!581880 e!581879)))

(declare-fun res!689076 () Bool)

(assert (=> b!1030423 (=> (not res!689076) (not e!581879))))

(declare-fun e!581878 () Bool)

(assert (=> b!1030423 (= res!689076 (not e!581878))))

(declare-fun res!689077 () Bool)

(assert (=> b!1030423 (=> (not res!689077) (not e!581878))))

(assert (=> b!1030423 (= res!689077 (validKeyInArray!0 (select (arr!31140 (_keys!11301 (_2!7848 lt!454356))) #b00000000000000000000000000000000)))))

(declare-fun bm!43530 () Bool)

(declare-fun call!43533 () Bool)

(assert (=> bm!43530 (= call!43533 (arrayNoDuplicates!0 (_keys!11301 (_2!7848 lt!454356)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104156 (Cons!21866 (select (arr!31140 (_keys!11301 (_2!7848 lt!454356))) #b00000000000000000000000000000000) Nil!21867) Nil!21867)))))

(declare-fun d!123451 () Bool)

(declare-fun res!689078 () Bool)

(assert (=> d!123451 (=> res!689078 e!581880)))

(assert (=> d!123451 (= res!689078 (bvsge #b00000000000000000000000000000000 (size!31659 (_keys!11301 (_2!7848 lt!454356)))))))

(assert (=> d!123451 (= (arrayNoDuplicates!0 (_keys!11301 (_2!7848 lt!454356)) #b00000000000000000000000000000000 Nil!21867) e!581880)))

(declare-fun b!1030424 () Bool)

(assert (=> b!1030424 (= e!581881 call!43533)))

(declare-fun b!1030425 () Bool)

(declare-fun contains!5957 (List!21870 (_ BitVec 64)) Bool)

(assert (=> b!1030425 (= e!581878 (contains!5957 Nil!21867 (select (arr!31140 (_keys!11301 (_2!7848 lt!454356))) #b00000000000000000000000000000000)))))

(declare-fun b!1030426 () Bool)

(assert (=> b!1030426 (= e!581881 call!43533)))

(assert (= (and d!123451 (not res!689078)) b!1030423))

(assert (= (and b!1030423 res!689077) b!1030425))

(assert (= (and b!1030423 res!689076) b!1030422))

(assert (= (and b!1030422 c!104156) b!1030426))

(assert (= (and b!1030422 (not c!104156)) b!1030424))

(assert (= (or b!1030426 b!1030424) bm!43530))

(assert (=> b!1030422 m!949727))

(assert (=> b!1030422 m!949727))

(assert (=> b!1030422 m!949735))

(assert (=> b!1030423 m!949727))

(assert (=> b!1030423 m!949727))

(assert (=> b!1030423 m!949735))

(assert (=> bm!43530 m!949727))

(declare-fun m!949743 () Bool)

(assert (=> bm!43530 m!949743))

(assert (=> b!1030425 m!949727))

(assert (=> b!1030425 m!949727))

(declare-fun m!949745 () Bool)

(assert (=> b!1030425 m!949745))

(assert (=> b!1030291 d!123451))

(declare-fun d!123453 () Bool)

(declare-fun e!581884 () Bool)

(assert (=> d!123453 e!581884))

(declare-fun res!689081 () Bool)

(assert (=> d!123453 (=> (not res!689081) (not e!581884))))

(assert (=> d!123453 (= res!689081 (and (bvsge (index!41092 lt!454358) #b00000000000000000000000000000000) (bvslt (index!41092 lt!454358) (size!31659 (_keys!11301 thiss!1427)))))))

(declare-fun lt!454441 () Unit!33549)

(declare-fun choose!1702 (array!64675 array!64677 (_ BitVec 32) (_ BitVec 32) V!37323 V!37323 (_ BitVec 32) (_ BitVec 64) Int) Unit!33549)

(assert (=> d!123453 (= lt!454441 (choose!1702 (_keys!11301 thiss!1427) (_values!6157 thiss!1427) (mask!29907 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) (index!41092 lt!454358) key!909 (defaultEntry!6134 thiss!1427)))))

(assert (=> d!123453 (validMask!0 (mask!29907 thiss!1427))))

(assert (=> d!123453 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!18 (_keys!11301 thiss!1427) (_values!6157 thiss!1427) (mask!29907 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) (index!41092 lt!454358) key!909 (defaultEntry!6134 thiss!1427)) lt!454441)))

(declare-fun b!1030429 () Bool)

(assert (=> b!1030429 (= e!581884 (= (-!493 (getCurrentListMap!3868 (_keys!11301 thiss!1427) (_values!6157 thiss!1427) (mask!29907 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6134 thiss!1427)) key!909) (getCurrentListMap!3868 (array!64676 (store (arr!31140 (_keys!11301 thiss!1427)) (index!41092 lt!454358) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31659 (_keys!11301 thiss!1427))) (array!64678 (store (arr!31141 (_values!6157 thiss!1427)) (index!41092 lt!454358) (ValueCellFull!11465 (dynLambda!1955 (defaultEntry!6134 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31660 (_values!6157 thiss!1427))) (mask!29907 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6134 thiss!1427))))))

(assert (=> b!1030429 (bvslt (index!41092 lt!454358) (size!31660 (_values!6157 thiss!1427)))))

(assert (= (and d!123453 res!689081) b!1030429))

(declare-fun b_lambda!15933 () Bool)

(assert (=> (not b_lambda!15933) (not b!1030429)))

(assert (=> b!1030429 t!30972))

(declare-fun b_and!32981 () Bool)

(assert (= b_and!32971 (and (=> t!30972 result!14189) b_and!32981)))

(declare-fun m!949747 () Bool)

(assert (=> d!123453 m!949747))

(assert (=> d!123453 m!949721))

(assert (=> b!1030429 m!949601))

(assert (=> b!1030429 m!949597))

(assert (=> b!1030429 m!949591))

(assert (=> b!1030429 m!949593))

(assert (=> b!1030429 m!949591))

(assert (=> b!1030429 m!949587))

(declare-fun m!949749 () Bool)

(assert (=> b!1030429 m!949749))

(assert (=> b!1030300 d!123453))

(declare-fun b!1030430 () Bool)

(declare-fun e!581886 () Bool)

(declare-fun call!43534 () Bool)

(assert (=> b!1030430 (= e!581886 call!43534)))

(declare-fun b!1030431 () Bool)

(declare-fun e!581885 () Bool)

(assert (=> b!1030431 (= e!581885 call!43534)))

(declare-fun bm!43531 () Bool)

(assert (=> bm!43531 (= call!43534 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!454357 (mask!29907 thiss!1427)))))

(declare-fun b!1030432 () Bool)

(assert (=> b!1030432 (= e!581886 e!581885)))

(declare-fun lt!454443 () (_ BitVec 64))

(assert (=> b!1030432 (= lt!454443 (select (arr!31140 lt!454357) #b00000000000000000000000000000000))))

(declare-fun lt!454444 () Unit!33549)

(assert (=> b!1030432 (= lt!454444 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!454357 lt!454443 #b00000000000000000000000000000000))))

(assert (=> b!1030432 (arrayContainsKey!0 lt!454357 lt!454443 #b00000000000000000000000000000000)))

(declare-fun lt!454442 () Unit!33549)

(assert (=> b!1030432 (= lt!454442 lt!454444)))

(declare-fun res!689083 () Bool)

(assert (=> b!1030432 (= res!689083 (= (seekEntryOrOpen!0 (select (arr!31140 lt!454357) #b00000000000000000000000000000000) lt!454357 (mask!29907 thiss!1427)) (Found!9680 #b00000000000000000000000000000000)))))

(assert (=> b!1030432 (=> (not res!689083) (not e!581885))))

(declare-fun b!1030433 () Bool)

(declare-fun e!581887 () Bool)

(assert (=> b!1030433 (= e!581887 e!581886)))

(declare-fun c!104157 () Bool)

(assert (=> b!1030433 (= c!104157 (validKeyInArray!0 (select (arr!31140 lt!454357) #b00000000000000000000000000000000)))))

(declare-fun d!123455 () Bool)

(declare-fun res!689082 () Bool)

(assert (=> d!123455 (=> res!689082 e!581887)))

(assert (=> d!123455 (= res!689082 (bvsge #b00000000000000000000000000000000 (size!31659 lt!454357)))))

(assert (=> d!123455 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!454357 (mask!29907 thiss!1427)) e!581887)))

(assert (= (and d!123455 (not res!689082)) b!1030433))

(assert (= (and b!1030433 c!104157) b!1030432))

(assert (= (and b!1030433 (not c!104157)) b!1030430))

(assert (= (and b!1030432 res!689083) b!1030431))

(assert (= (or b!1030431 b!1030430) bm!43531))

(declare-fun m!949751 () Bool)

(assert (=> bm!43531 m!949751))

(declare-fun m!949753 () Bool)

(assert (=> b!1030432 m!949753))

(declare-fun m!949755 () Bool)

(assert (=> b!1030432 m!949755))

(declare-fun m!949757 () Bool)

(assert (=> b!1030432 m!949757))

(assert (=> b!1030432 m!949753))

(declare-fun m!949759 () Bool)

(assert (=> b!1030432 m!949759))

(assert (=> b!1030433 m!949753))

(assert (=> b!1030433 m!949753))

(declare-fun m!949761 () Bool)

(assert (=> b!1030433 m!949761))

(assert (=> b!1030300 d!123455))

(declare-fun d!123457 () Bool)

(assert (=> d!123457 (= (validMask!0 (mask!29907 (_2!7848 lt!454356))) (and (or (= (mask!29907 (_2!7848 lt!454356)) #b00000000000000000000000000000111) (= (mask!29907 (_2!7848 lt!454356)) #b00000000000000000000000000001111) (= (mask!29907 (_2!7848 lt!454356)) #b00000000000000000000000000011111) (= (mask!29907 (_2!7848 lt!454356)) #b00000000000000000000000000111111) (= (mask!29907 (_2!7848 lt!454356)) #b00000000000000000000000001111111) (= (mask!29907 (_2!7848 lt!454356)) #b00000000000000000000000011111111) (= (mask!29907 (_2!7848 lt!454356)) #b00000000000000000000000111111111) (= (mask!29907 (_2!7848 lt!454356)) #b00000000000000000000001111111111) (= (mask!29907 (_2!7848 lt!454356)) #b00000000000000000000011111111111) (= (mask!29907 (_2!7848 lt!454356)) #b00000000000000000000111111111111) (= (mask!29907 (_2!7848 lt!454356)) #b00000000000000000001111111111111) (= (mask!29907 (_2!7848 lt!454356)) #b00000000000000000011111111111111) (= (mask!29907 (_2!7848 lt!454356)) #b00000000000000000111111111111111) (= (mask!29907 (_2!7848 lt!454356)) #b00000000000000001111111111111111) (= (mask!29907 (_2!7848 lt!454356)) #b00000000000000011111111111111111) (= (mask!29907 (_2!7848 lt!454356)) #b00000000000000111111111111111111) (= (mask!29907 (_2!7848 lt!454356)) #b00000000000001111111111111111111) (= (mask!29907 (_2!7848 lt!454356)) #b00000000000011111111111111111111) (= (mask!29907 (_2!7848 lt!454356)) #b00000000000111111111111111111111) (= (mask!29907 (_2!7848 lt!454356)) #b00000000001111111111111111111111) (= (mask!29907 (_2!7848 lt!454356)) #b00000000011111111111111111111111) (= (mask!29907 (_2!7848 lt!454356)) #b00000000111111111111111111111111) (= (mask!29907 (_2!7848 lt!454356)) #b00000001111111111111111111111111) (= (mask!29907 (_2!7848 lt!454356)) #b00000011111111111111111111111111) (= (mask!29907 (_2!7848 lt!454356)) #b00000111111111111111111111111111) (= (mask!29907 (_2!7848 lt!454356)) #b00001111111111111111111111111111) (= (mask!29907 (_2!7848 lt!454356)) #b00011111111111111111111111111111) (= (mask!29907 (_2!7848 lt!454356)) #b00111111111111111111111111111111)) (bvsle (mask!29907 (_2!7848 lt!454356)) #b00111111111111111111111111111111)))))

(assert (=> b!1030300 d!123457))

(declare-fun d!123459 () Bool)

(declare-fun e!581890 () Bool)

(assert (=> d!123459 e!581890))

(declare-fun res!689086 () Bool)

(assert (=> d!123459 (=> (not res!689086) (not e!581890))))

(assert (=> d!123459 (= res!689086 (and (bvsge (index!41092 lt!454358) #b00000000000000000000000000000000) (bvslt (index!41092 lt!454358) (size!31659 (_keys!11301 thiss!1427)))))))

(declare-fun lt!454447 () Unit!33549)

(declare-fun choose!53 (array!64675 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21870) Unit!33549)

(assert (=> d!123459 (= lt!454447 (choose!53 (_keys!11301 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41092 lt!454358) #b00000000000000000000000000000000 Nil!21867))))

(assert (=> d!123459 (bvslt (size!31659 (_keys!11301 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!123459 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11301 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41092 lt!454358) #b00000000000000000000000000000000 Nil!21867) lt!454447)))

(declare-fun b!1030436 () Bool)

(assert (=> b!1030436 (= e!581890 (arrayNoDuplicates!0 (array!64676 (store (arr!31140 (_keys!11301 thiss!1427)) (index!41092 lt!454358) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31659 (_keys!11301 thiss!1427))) #b00000000000000000000000000000000 Nil!21867))))

(assert (= (and d!123459 res!689086) b!1030436))

(declare-fun m!949763 () Bool)

(assert (=> d!123459 m!949763))

(assert (=> b!1030436 m!949587))

(declare-fun m!949765 () Bool)

(assert (=> b!1030436 m!949765))

(assert (=> b!1030300 d!123459))

(declare-fun d!123461 () Bool)

(declare-fun lt!454450 () ListLongMap!13771)

(declare-fun contains!5958 (ListLongMap!13771 (_ BitVec 64)) Bool)

(assert (=> d!123461 (not (contains!5958 lt!454450 key!909))))

(declare-fun removeStrictlySorted!55 (List!21871 (_ BitVec 64)) List!21871)

(assert (=> d!123461 (= lt!454450 (ListLongMap!13772 (removeStrictlySorted!55 (toList!6901 (getCurrentListMap!3868 (_keys!11301 thiss!1427) (_values!6157 thiss!1427) (mask!29907 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6134 thiss!1427))) key!909)))))

(assert (=> d!123461 (= (-!493 (getCurrentListMap!3868 (_keys!11301 thiss!1427) (_values!6157 thiss!1427) (mask!29907 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6134 thiss!1427)) key!909) lt!454450)))

(declare-fun bs!30091 () Bool)

(assert (= bs!30091 d!123461))

(declare-fun m!949767 () Bool)

(assert (=> bs!30091 m!949767))

(declare-fun m!949769 () Bool)

(assert (=> bs!30091 m!949769))

(assert (=> b!1030300 d!123461))

(declare-fun d!123463 () Bool)

(declare-fun e!581893 () Bool)

(assert (=> d!123463 e!581893))

(declare-fun res!689089 () Bool)

(assert (=> d!123463 (=> (not res!689089) (not e!581893))))

(assert (=> d!123463 (= res!689089 (and (bvsge (index!41092 lt!454358) #b00000000000000000000000000000000) (bvslt (index!41092 lt!454358) (size!31659 (_keys!11301 thiss!1427)))))))

(declare-fun lt!454453 () Unit!33549)

(declare-fun choose!25 (array!64675 (_ BitVec 32) (_ BitVec 32)) Unit!33549)

(assert (=> d!123463 (= lt!454453 (choose!25 (_keys!11301 thiss!1427) (index!41092 lt!454358) (mask!29907 thiss!1427)))))

(assert (=> d!123463 (validMask!0 (mask!29907 thiss!1427))))

(assert (=> d!123463 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11301 thiss!1427) (index!41092 lt!454358) (mask!29907 thiss!1427)) lt!454453)))

(declare-fun b!1030439 () Bool)

(assert (=> b!1030439 (= e!581893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!64676 (store (arr!31140 (_keys!11301 thiss!1427)) (index!41092 lt!454358) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31659 (_keys!11301 thiss!1427))) (mask!29907 thiss!1427)))))

(assert (= (and d!123463 res!689089) b!1030439))

(declare-fun m!949771 () Bool)

(assert (=> d!123463 m!949771))

(assert (=> d!123463 m!949721))

(assert (=> b!1030439 m!949587))

(declare-fun m!949773 () Bool)

(assert (=> b!1030439 m!949773))

(assert (=> b!1030300 d!123463))

(declare-fun d!123465 () Bool)

(declare-fun e!581920 () Bool)

(assert (=> d!123465 e!581920))

(declare-fun res!689113 () Bool)

(assert (=> d!123465 (=> (not res!689113) (not e!581920))))

(assert (=> d!123465 (= res!689113 (or (bvsge #b00000000000000000000000000000000 (size!31659 lt!454357)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31659 lt!454357)))))))

(declare-fun lt!454518 () ListLongMap!13771)

(declare-fun lt!454498 () ListLongMap!13771)

(assert (=> d!123465 (= lt!454518 lt!454498)))

(declare-fun lt!454508 () Unit!33549)

(declare-fun e!581928 () Unit!33549)

(assert (=> d!123465 (= lt!454508 e!581928)))

(declare-fun c!104172 () Bool)

(declare-fun e!581931 () Bool)

(assert (=> d!123465 (= c!104172 e!581931)))

(declare-fun res!689109 () Bool)

(assert (=> d!123465 (=> (not res!689109) (not e!581931))))

(assert (=> d!123465 (= res!689109 (bvslt #b00000000000000000000000000000000 (size!31659 lt!454357)))))

(declare-fun e!581927 () ListLongMap!13771)

(assert (=> d!123465 (= lt!454498 e!581927)))

(declare-fun c!104170 () Bool)

(assert (=> d!123465 (= c!104170 (and (not (= (bvand (extraKeys!5866 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5866 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!123465 (validMask!0 (mask!29907 thiss!1427))))

(assert (=> d!123465 (= (getCurrentListMap!3868 lt!454357 lt!454360 (mask!29907 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6134 thiss!1427)) lt!454518)))

(declare-fun b!1030482 () Bool)

(declare-fun e!581925 () Bool)

(assert (=> b!1030482 (= e!581925 (validKeyInArray!0 (select (arr!31140 lt!454357) #b00000000000000000000000000000000)))))

(declare-fun b!1030483 () Bool)

(declare-fun e!581930 () Bool)

(declare-fun apply!898 (ListLongMap!13771 (_ BitVec 64)) V!37323)

(assert (=> b!1030483 (= e!581930 (= (apply!898 lt!454518 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5970 thiss!1427)))))

(declare-fun b!1030484 () Bool)

(declare-fun e!581922 () ListLongMap!13771)

(declare-fun call!43550 () ListLongMap!13771)

(assert (=> b!1030484 (= e!581922 call!43550)))

(declare-fun b!1030485 () Bool)

(declare-fun e!581929 () Bool)

(declare-fun call!43552 () Bool)

(assert (=> b!1030485 (= e!581929 (not call!43552))))

(declare-fun b!1030486 () Bool)

(declare-fun Unit!33557 () Unit!33549)

(assert (=> b!1030486 (= e!581928 Unit!33557)))

(declare-fun b!1030487 () Bool)

(declare-fun call!43553 () ListLongMap!13771)

(assert (=> b!1030487 (= e!581922 call!43553)))

(declare-fun b!1030488 () Bool)

(declare-fun e!581924 () Bool)

(assert (=> b!1030488 (= e!581924 (= (apply!898 lt!454518 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5970 thiss!1427)))))

(declare-fun b!1030489 () Bool)

(declare-fun e!581923 () Bool)

(assert (=> b!1030489 (= e!581920 e!581923)))

(declare-fun c!104173 () Bool)

(assert (=> b!1030489 (= c!104173 (not (= (bvand (extraKeys!5866 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1030490 () Bool)

(declare-fun call!43551 () ListLongMap!13771)

(declare-fun +!3129 (ListLongMap!13771 tuple2!15676) ListLongMap!13771)

(assert (=> b!1030490 (= e!581927 (+!3129 call!43551 (tuple2!15677 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5970 thiss!1427))))))

(declare-fun b!1030491 () Bool)

(declare-fun res!689114 () Bool)

(assert (=> b!1030491 (=> (not res!689114) (not e!581920))))

(declare-fun e!581932 () Bool)

(assert (=> b!1030491 (= res!689114 e!581932)))

(declare-fun res!689108 () Bool)

(assert (=> b!1030491 (=> res!689108 e!581932)))

(assert (=> b!1030491 (= res!689108 (not e!581925))))

(declare-fun res!689116 () Bool)

(assert (=> b!1030491 (=> (not res!689116) (not e!581925))))

(assert (=> b!1030491 (= res!689116 (bvslt #b00000000000000000000000000000000 (size!31659 lt!454357)))))

(declare-fun bm!43546 () Bool)

(assert (=> bm!43546 (= call!43553 call!43551)))

(declare-fun e!581921 () Bool)

(declare-fun b!1030492 () Bool)

(declare-fun get!16367 (ValueCell!11465 V!37323) V!37323)

(assert (=> b!1030492 (= e!581921 (= (apply!898 lt!454518 (select (arr!31140 lt!454357) #b00000000000000000000000000000000)) (get!16367 (select (arr!31141 lt!454360) #b00000000000000000000000000000000) (dynLambda!1955 (defaultEntry!6134 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1030492 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31660 lt!454360)))))

(assert (=> b!1030492 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31659 lt!454357)))))

(declare-fun bm!43547 () Bool)

(declare-fun call!43549 () ListLongMap!13771)

(assert (=> bm!43547 (= call!43550 call!43549)))

(declare-fun b!1030493 () Bool)

(assert (=> b!1030493 (= e!581923 e!581930)))

(declare-fun res!689111 () Bool)

(declare-fun call!43554 () Bool)

(assert (=> b!1030493 (= res!689111 call!43554)))

(assert (=> b!1030493 (=> (not res!689111) (not e!581930))))

(declare-fun call!43555 () ListLongMap!13771)

(declare-fun bm!43548 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3564 (array!64675 array!64677 (_ BitVec 32) (_ BitVec 32) V!37323 V!37323 (_ BitVec 32) Int) ListLongMap!13771)

(assert (=> bm!43548 (= call!43555 (getCurrentListMapNoExtraKeys!3564 lt!454357 lt!454360 (mask!29907 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6134 thiss!1427)))))

(declare-fun b!1030494 () Bool)

(declare-fun e!581926 () ListLongMap!13771)

(assert (=> b!1030494 (= e!581926 call!43553)))

(declare-fun b!1030495 () Bool)

(declare-fun c!104171 () Bool)

(assert (=> b!1030495 (= c!104171 (and (not (= (bvand (extraKeys!5866 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5866 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1030495 (= e!581926 e!581922)))

(declare-fun b!1030496 () Bool)

(declare-fun lt!454511 () Unit!33549)

(assert (=> b!1030496 (= e!581928 lt!454511)))

(declare-fun lt!454517 () ListLongMap!13771)

(assert (=> b!1030496 (= lt!454517 (getCurrentListMapNoExtraKeys!3564 lt!454357 lt!454360 (mask!29907 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6134 thiss!1427)))))

(declare-fun lt!454515 () (_ BitVec 64))

(assert (=> b!1030496 (= lt!454515 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454509 () (_ BitVec 64))

(assert (=> b!1030496 (= lt!454509 (select (arr!31140 lt!454357) #b00000000000000000000000000000000))))

(declare-fun lt!454499 () Unit!33549)

(declare-fun addStillContains!617 (ListLongMap!13771 (_ BitVec 64) V!37323 (_ BitVec 64)) Unit!33549)

(assert (=> b!1030496 (= lt!454499 (addStillContains!617 lt!454517 lt!454515 (zeroValue!5970 thiss!1427) lt!454509))))

(assert (=> b!1030496 (contains!5958 (+!3129 lt!454517 (tuple2!15677 lt!454515 (zeroValue!5970 thiss!1427))) lt!454509)))

(declare-fun lt!454516 () Unit!33549)

(assert (=> b!1030496 (= lt!454516 lt!454499)))

(declare-fun lt!454510 () ListLongMap!13771)

(assert (=> b!1030496 (= lt!454510 (getCurrentListMapNoExtraKeys!3564 lt!454357 lt!454360 (mask!29907 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6134 thiss!1427)))))

(declare-fun lt!454502 () (_ BitVec 64))

(assert (=> b!1030496 (= lt!454502 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454501 () (_ BitVec 64))

(assert (=> b!1030496 (= lt!454501 (select (arr!31140 lt!454357) #b00000000000000000000000000000000))))

(declare-fun lt!454503 () Unit!33549)

(declare-fun addApplyDifferent!473 (ListLongMap!13771 (_ BitVec 64) V!37323 (_ BitVec 64)) Unit!33549)

(assert (=> b!1030496 (= lt!454503 (addApplyDifferent!473 lt!454510 lt!454502 (minValue!5970 thiss!1427) lt!454501))))

(assert (=> b!1030496 (= (apply!898 (+!3129 lt!454510 (tuple2!15677 lt!454502 (minValue!5970 thiss!1427))) lt!454501) (apply!898 lt!454510 lt!454501))))

(declare-fun lt!454513 () Unit!33549)

(assert (=> b!1030496 (= lt!454513 lt!454503)))

(declare-fun lt!454505 () ListLongMap!13771)

(assert (=> b!1030496 (= lt!454505 (getCurrentListMapNoExtraKeys!3564 lt!454357 lt!454360 (mask!29907 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6134 thiss!1427)))))

(declare-fun lt!454512 () (_ BitVec 64))

(assert (=> b!1030496 (= lt!454512 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454507 () (_ BitVec 64))

(assert (=> b!1030496 (= lt!454507 (select (arr!31140 lt!454357) #b00000000000000000000000000000000))))

(declare-fun lt!454506 () Unit!33549)

(assert (=> b!1030496 (= lt!454506 (addApplyDifferent!473 lt!454505 lt!454512 (zeroValue!5970 thiss!1427) lt!454507))))

(assert (=> b!1030496 (= (apply!898 (+!3129 lt!454505 (tuple2!15677 lt!454512 (zeroValue!5970 thiss!1427))) lt!454507) (apply!898 lt!454505 lt!454507))))

(declare-fun lt!454514 () Unit!33549)

(assert (=> b!1030496 (= lt!454514 lt!454506)))

(declare-fun lt!454500 () ListLongMap!13771)

(assert (=> b!1030496 (= lt!454500 (getCurrentListMapNoExtraKeys!3564 lt!454357 lt!454360 (mask!29907 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6134 thiss!1427)))))

(declare-fun lt!454519 () (_ BitVec 64))

(assert (=> b!1030496 (= lt!454519 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454504 () (_ BitVec 64))

(assert (=> b!1030496 (= lt!454504 (select (arr!31140 lt!454357) #b00000000000000000000000000000000))))

(assert (=> b!1030496 (= lt!454511 (addApplyDifferent!473 lt!454500 lt!454519 (minValue!5970 thiss!1427) lt!454504))))

(assert (=> b!1030496 (= (apply!898 (+!3129 lt!454500 (tuple2!15677 lt!454519 (minValue!5970 thiss!1427))) lt!454504) (apply!898 lt!454500 lt!454504))))

(declare-fun bm!43549 () Bool)

(assert (=> bm!43549 (= call!43554 (contains!5958 lt!454518 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1030497 () Bool)

(assert (=> b!1030497 (= e!581923 (not call!43554))))

(declare-fun c!104175 () Bool)

(declare-fun bm!43550 () Bool)

(assert (=> bm!43550 (= call!43551 (+!3129 (ite c!104170 call!43555 (ite c!104175 call!43549 call!43550)) (ite (or c!104170 c!104175) (tuple2!15677 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5970 thiss!1427)) (tuple2!15677 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5970 thiss!1427)))))))

(declare-fun bm!43551 () Bool)

(assert (=> bm!43551 (= call!43552 (contains!5958 lt!454518 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1030498 () Bool)

(assert (=> b!1030498 (= e!581927 e!581926)))

(assert (=> b!1030498 (= c!104175 (and (not (= (bvand (extraKeys!5866 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5866 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1030499 () Bool)

(assert (=> b!1030499 (= e!581931 (validKeyInArray!0 (select (arr!31140 lt!454357) #b00000000000000000000000000000000)))))

(declare-fun bm!43552 () Bool)

(assert (=> bm!43552 (= call!43549 call!43555)))

(declare-fun b!1030500 () Bool)

(assert (=> b!1030500 (= e!581929 e!581924)))

(declare-fun res!689115 () Bool)

(assert (=> b!1030500 (= res!689115 call!43552)))

(assert (=> b!1030500 (=> (not res!689115) (not e!581924))))

(declare-fun b!1030501 () Bool)

(declare-fun res!689112 () Bool)

(assert (=> b!1030501 (=> (not res!689112) (not e!581920))))

(assert (=> b!1030501 (= res!689112 e!581929)))

(declare-fun c!104174 () Bool)

(assert (=> b!1030501 (= c!104174 (not (= (bvand (extraKeys!5866 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1030502 () Bool)

(assert (=> b!1030502 (= e!581932 e!581921)))

(declare-fun res!689110 () Bool)

(assert (=> b!1030502 (=> (not res!689110) (not e!581921))))

(assert (=> b!1030502 (= res!689110 (contains!5958 lt!454518 (select (arr!31140 lt!454357) #b00000000000000000000000000000000)))))

(assert (=> b!1030502 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31659 lt!454357)))))

(assert (= (and d!123465 c!104170) b!1030490))

(assert (= (and d!123465 (not c!104170)) b!1030498))

(assert (= (and b!1030498 c!104175) b!1030494))

(assert (= (and b!1030498 (not c!104175)) b!1030495))

(assert (= (and b!1030495 c!104171) b!1030487))

(assert (= (and b!1030495 (not c!104171)) b!1030484))

(assert (= (or b!1030487 b!1030484) bm!43547))

(assert (= (or b!1030494 bm!43547) bm!43552))

(assert (= (or b!1030494 b!1030487) bm!43546))

(assert (= (or b!1030490 bm!43552) bm!43548))

(assert (= (or b!1030490 bm!43546) bm!43550))

(assert (= (and d!123465 res!689109) b!1030499))

(assert (= (and d!123465 c!104172) b!1030496))

(assert (= (and d!123465 (not c!104172)) b!1030486))

(assert (= (and d!123465 res!689113) b!1030491))

(assert (= (and b!1030491 res!689116) b!1030482))

(assert (= (and b!1030491 (not res!689108)) b!1030502))

(assert (= (and b!1030502 res!689110) b!1030492))

(assert (= (and b!1030491 res!689114) b!1030501))

(assert (= (and b!1030501 c!104174) b!1030500))

(assert (= (and b!1030501 (not c!104174)) b!1030485))

(assert (= (and b!1030500 res!689115) b!1030488))

(assert (= (or b!1030500 b!1030485) bm!43551))

(assert (= (and b!1030501 res!689112) b!1030489))

(assert (= (and b!1030489 c!104173) b!1030493))

(assert (= (and b!1030489 (not c!104173)) b!1030497))

(assert (= (and b!1030493 res!689111) b!1030483))

(assert (= (or b!1030493 b!1030497) bm!43549))

(declare-fun b_lambda!15935 () Bool)

(assert (=> (not b_lambda!15935) (not b!1030492)))

(assert (=> b!1030492 t!30972))

(declare-fun b_and!32983 () Bool)

(assert (= b_and!32981 (and (=> t!30972 result!14189) b_and!32983)))

(assert (=> b!1030502 m!949753))

(assert (=> b!1030502 m!949753))

(declare-fun m!949775 () Bool)

(assert (=> b!1030502 m!949775))

(declare-fun m!949777 () Bool)

(assert (=> b!1030488 m!949777))

(assert (=> b!1030492 m!949753))

(declare-fun m!949779 () Bool)

(assert (=> b!1030492 m!949779))

(assert (=> b!1030492 m!949753))

(declare-fun m!949781 () Bool)

(assert (=> b!1030492 m!949781))

(assert (=> b!1030492 m!949597))

(assert (=> b!1030492 m!949779))

(assert (=> b!1030492 m!949597))

(declare-fun m!949783 () Bool)

(assert (=> b!1030492 m!949783))

(declare-fun m!949785 () Bool)

(assert (=> b!1030490 m!949785))

(declare-fun m!949787 () Bool)

(assert (=> bm!43550 m!949787))

(assert (=> d!123465 m!949721))

(assert (=> b!1030482 m!949753))

(assert (=> b!1030482 m!949753))

(assert (=> b!1030482 m!949761))

(declare-fun m!949789 () Bool)

(assert (=> b!1030483 m!949789))

(declare-fun m!949791 () Bool)

(assert (=> bm!43548 m!949791))

(declare-fun m!949793 () Bool)

(assert (=> bm!43551 m!949793))

(declare-fun m!949795 () Bool)

(assert (=> bm!43549 m!949795))

(declare-fun m!949797 () Bool)

(assert (=> b!1030496 m!949797))

(declare-fun m!949799 () Bool)

(assert (=> b!1030496 m!949799))

(assert (=> b!1030496 m!949791))

(declare-fun m!949801 () Bool)

(assert (=> b!1030496 m!949801))

(declare-fun m!949803 () Bool)

(assert (=> b!1030496 m!949803))

(assert (=> b!1030496 m!949753))

(declare-fun m!949805 () Bool)

(assert (=> b!1030496 m!949805))

(declare-fun m!949807 () Bool)

(assert (=> b!1030496 m!949807))

(declare-fun m!949809 () Bool)

(assert (=> b!1030496 m!949809))

(declare-fun m!949811 () Bool)

(assert (=> b!1030496 m!949811))

(assert (=> b!1030496 m!949809))

(declare-fun m!949813 () Bool)

(assert (=> b!1030496 m!949813))

(declare-fun m!949815 () Bool)

(assert (=> b!1030496 m!949815))

(declare-fun m!949817 () Bool)

(assert (=> b!1030496 m!949817))

(assert (=> b!1030496 m!949799))

(declare-fun m!949819 () Bool)

(assert (=> b!1030496 m!949819))

(declare-fun m!949821 () Bool)

(assert (=> b!1030496 m!949821))

(assert (=> b!1030496 m!949815))

(declare-fun m!949823 () Bool)

(assert (=> b!1030496 m!949823))

(assert (=> b!1030496 m!949801))

(declare-fun m!949825 () Bool)

(assert (=> b!1030496 m!949825))

(assert (=> b!1030499 m!949753))

(assert (=> b!1030499 m!949753))

(assert (=> b!1030499 m!949761))

(assert (=> b!1030300 d!123465))

(declare-fun d!123467 () Bool)

(declare-fun lt!454522 () (_ BitVec 32))

(assert (=> d!123467 (and (bvsge lt!454522 #b00000000000000000000000000000000) (bvsle lt!454522 (bvsub (size!31659 (_keys!11301 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!581937 () (_ BitVec 32))

(assert (=> d!123467 (= lt!454522 e!581937)))

(declare-fun c!104180 () Bool)

(assert (=> d!123467 (= c!104180 (bvsge #b00000000000000000000000000000000 (size!31659 (_keys!11301 thiss!1427))))))

(assert (=> d!123467 (and (bvsle #b00000000000000000000000000000000 (size!31659 (_keys!11301 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31659 (_keys!11301 thiss!1427)) (size!31659 (_keys!11301 thiss!1427))))))

(assert (=> d!123467 (= (arrayCountValidKeys!0 (_keys!11301 thiss!1427) #b00000000000000000000000000000000 (size!31659 (_keys!11301 thiss!1427))) lt!454522)))

(declare-fun bm!43555 () Bool)

(declare-fun call!43558 () (_ BitVec 32))

(assert (=> bm!43555 (= call!43558 (arrayCountValidKeys!0 (_keys!11301 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31659 (_keys!11301 thiss!1427))))))

(declare-fun b!1030511 () Bool)

(assert (=> b!1030511 (= e!581937 #b00000000000000000000000000000000)))

(declare-fun b!1030512 () Bool)

(declare-fun e!581938 () (_ BitVec 32))

(assert (=> b!1030512 (= e!581938 call!43558)))

(declare-fun b!1030513 () Bool)

(assert (=> b!1030513 (= e!581937 e!581938)))

(declare-fun c!104181 () Bool)

(assert (=> b!1030513 (= c!104181 (validKeyInArray!0 (select (arr!31140 (_keys!11301 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1030514 () Bool)

(assert (=> b!1030514 (= e!581938 (bvadd #b00000000000000000000000000000001 call!43558))))

(assert (= (and d!123467 c!104180) b!1030511))

(assert (= (and d!123467 (not c!104180)) b!1030513))

(assert (= (and b!1030513 c!104181) b!1030514))

(assert (= (and b!1030513 (not c!104181)) b!1030512))

(assert (= (or b!1030514 b!1030512) bm!43555))

(declare-fun m!949827 () Bool)

(assert (=> bm!43555 m!949827))

(declare-fun m!949829 () Bool)

(assert (=> b!1030513 m!949829))

(assert (=> b!1030513 m!949829))

(declare-fun m!949831 () Bool)

(assert (=> b!1030513 m!949831))

(assert (=> b!1030300 d!123467))

(declare-fun b!1030525 () Bool)

(declare-fun e!581943 () Bool)

(assert (=> b!1030525 (= e!581943 (bvslt (size!31659 (_keys!11301 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1030523 () Bool)

(declare-fun res!689127 () Bool)

(assert (=> b!1030523 (=> (not res!689127) (not e!581943))))

(assert (=> b!1030523 (= res!689127 (validKeyInArray!0 (select (arr!31140 (_keys!11301 thiss!1427)) (index!41092 lt!454358))))))

(declare-fun b!1030524 () Bool)

(declare-fun res!689125 () Bool)

(assert (=> b!1030524 (=> (not res!689125) (not e!581943))))

(assert (=> b!1030524 (= res!689125 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1030526 () Bool)

(declare-fun e!581944 () Bool)

(assert (=> b!1030526 (= e!581944 (= (arrayCountValidKeys!0 (array!64676 (store (arr!31140 (_keys!11301 thiss!1427)) (index!41092 lt!454358) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31659 (_keys!11301 thiss!1427))) #b00000000000000000000000000000000 (size!31659 (_keys!11301 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11301 thiss!1427) #b00000000000000000000000000000000 (size!31659 (_keys!11301 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun d!123469 () Bool)

(assert (=> d!123469 e!581944))

(declare-fun res!689126 () Bool)

(assert (=> d!123469 (=> (not res!689126) (not e!581944))))

(assert (=> d!123469 (= res!689126 (and (bvsge (index!41092 lt!454358) #b00000000000000000000000000000000) (bvslt (index!41092 lt!454358) (size!31659 (_keys!11301 thiss!1427)))))))

(declare-fun lt!454525 () Unit!33549)

(declare-fun choose!82 (array!64675 (_ BitVec 32) (_ BitVec 64)) Unit!33549)

(assert (=> d!123469 (= lt!454525 (choose!82 (_keys!11301 thiss!1427) (index!41092 lt!454358) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123469 e!581943))

(declare-fun res!689128 () Bool)

(assert (=> d!123469 (=> (not res!689128) (not e!581943))))

(assert (=> d!123469 (= res!689128 (and (bvsge (index!41092 lt!454358) #b00000000000000000000000000000000) (bvslt (index!41092 lt!454358) (size!31659 (_keys!11301 thiss!1427)))))))

(assert (=> d!123469 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11301 thiss!1427) (index!41092 lt!454358) #b1000000000000000000000000000000000000000000000000000000000000000) lt!454525)))

(assert (= (and d!123469 res!689128) b!1030523))

(assert (= (and b!1030523 res!689127) b!1030524))

(assert (= (and b!1030524 res!689125) b!1030525))

(assert (= (and d!123469 res!689126) b!1030526))

(declare-fun m!949833 () Bool)

(assert (=> b!1030523 m!949833))

(assert (=> b!1030523 m!949833))

(declare-fun m!949835 () Bool)

(assert (=> b!1030523 m!949835))

(declare-fun m!949837 () Bool)

(assert (=> b!1030524 m!949837))

(assert (=> b!1030526 m!949587))

(declare-fun m!949839 () Bool)

(assert (=> b!1030526 m!949839))

(assert (=> b!1030526 m!949603))

(declare-fun m!949841 () Bool)

(assert (=> d!123469 m!949841))

(assert (=> b!1030300 d!123469))

(declare-fun d!123471 () Bool)

(declare-fun e!581945 () Bool)

(assert (=> d!123471 e!581945))

(declare-fun res!689134 () Bool)

(assert (=> d!123471 (=> (not res!689134) (not e!581945))))

(assert (=> d!123471 (= res!689134 (or (bvsge #b00000000000000000000000000000000 (size!31659 (_keys!11301 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31659 (_keys!11301 thiss!1427))))))))

(declare-fun lt!454546 () ListLongMap!13771)

(declare-fun lt!454526 () ListLongMap!13771)

(assert (=> d!123471 (= lt!454546 lt!454526)))

(declare-fun lt!454536 () Unit!33549)

(declare-fun e!581953 () Unit!33549)

(assert (=> d!123471 (= lt!454536 e!581953)))

(declare-fun c!104184 () Bool)

(declare-fun e!581956 () Bool)

(assert (=> d!123471 (= c!104184 e!581956)))

(declare-fun res!689130 () Bool)

(assert (=> d!123471 (=> (not res!689130) (not e!581956))))

(assert (=> d!123471 (= res!689130 (bvslt #b00000000000000000000000000000000 (size!31659 (_keys!11301 thiss!1427))))))

(declare-fun e!581952 () ListLongMap!13771)

(assert (=> d!123471 (= lt!454526 e!581952)))

(declare-fun c!104182 () Bool)

(assert (=> d!123471 (= c!104182 (and (not (= (bvand (extraKeys!5866 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5866 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!123471 (validMask!0 (mask!29907 thiss!1427))))

(assert (=> d!123471 (= (getCurrentListMap!3868 (_keys!11301 thiss!1427) (_values!6157 thiss!1427) (mask!29907 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6134 thiss!1427)) lt!454546)))

(declare-fun b!1030527 () Bool)

(declare-fun e!581950 () Bool)

(assert (=> b!1030527 (= e!581950 (validKeyInArray!0 (select (arr!31140 (_keys!11301 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1030528 () Bool)

(declare-fun e!581955 () Bool)

(assert (=> b!1030528 (= e!581955 (= (apply!898 lt!454546 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5970 thiss!1427)))))

(declare-fun b!1030529 () Bool)

(declare-fun e!581947 () ListLongMap!13771)

(declare-fun call!43560 () ListLongMap!13771)

(assert (=> b!1030529 (= e!581947 call!43560)))

(declare-fun b!1030530 () Bool)

(declare-fun e!581954 () Bool)

(declare-fun call!43562 () Bool)

(assert (=> b!1030530 (= e!581954 (not call!43562))))

(declare-fun b!1030531 () Bool)

(declare-fun Unit!33558 () Unit!33549)

(assert (=> b!1030531 (= e!581953 Unit!33558)))

(declare-fun b!1030532 () Bool)

(declare-fun call!43563 () ListLongMap!13771)

(assert (=> b!1030532 (= e!581947 call!43563)))

(declare-fun b!1030533 () Bool)

(declare-fun e!581949 () Bool)

(assert (=> b!1030533 (= e!581949 (= (apply!898 lt!454546 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5970 thiss!1427)))))

(declare-fun b!1030534 () Bool)

(declare-fun e!581948 () Bool)

(assert (=> b!1030534 (= e!581945 e!581948)))

(declare-fun c!104185 () Bool)

(assert (=> b!1030534 (= c!104185 (not (= (bvand (extraKeys!5866 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1030535 () Bool)

(declare-fun call!43561 () ListLongMap!13771)

(assert (=> b!1030535 (= e!581952 (+!3129 call!43561 (tuple2!15677 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5970 thiss!1427))))))

(declare-fun b!1030536 () Bool)

(declare-fun res!689135 () Bool)

(assert (=> b!1030536 (=> (not res!689135) (not e!581945))))

(declare-fun e!581957 () Bool)

(assert (=> b!1030536 (= res!689135 e!581957)))

(declare-fun res!689129 () Bool)

(assert (=> b!1030536 (=> res!689129 e!581957)))

(assert (=> b!1030536 (= res!689129 (not e!581950))))

(declare-fun res!689137 () Bool)

(assert (=> b!1030536 (=> (not res!689137) (not e!581950))))

(assert (=> b!1030536 (= res!689137 (bvslt #b00000000000000000000000000000000 (size!31659 (_keys!11301 thiss!1427))))))

(declare-fun bm!43556 () Bool)

(assert (=> bm!43556 (= call!43563 call!43561)))

(declare-fun b!1030537 () Bool)

(declare-fun e!581946 () Bool)

(assert (=> b!1030537 (= e!581946 (= (apply!898 lt!454546 (select (arr!31140 (_keys!11301 thiss!1427)) #b00000000000000000000000000000000)) (get!16367 (select (arr!31141 (_values!6157 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1955 (defaultEntry!6134 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1030537 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31660 (_values!6157 thiss!1427))))))

(assert (=> b!1030537 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31659 (_keys!11301 thiss!1427))))))

(declare-fun bm!43557 () Bool)

(declare-fun call!43559 () ListLongMap!13771)

(assert (=> bm!43557 (= call!43560 call!43559)))

(declare-fun b!1030538 () Bool)

(assert (=> b!1030538 (= e!581948 e!581955)))

(declare-fun res!689132 () Bool)

(declare-fun call!43564 () Bool)

(assert (=> b!1030538 (= res!689132 call!43564)))

(assert (=> b!1030538 (=> (not res!689132) (not e!581955))))

(declare-fun bm!43558 () Bool)

(declare-fun call!43565 () ListLongMap!13771)

(assert (=> bm!43558 (= call!43565 (getCurrentListMapNoExtraKeys!3564 (_keys!11301 thiss!1427) (_values!6157 thiss!1427) (mask!29907 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6134 thiss!1427)))))

(declare-fun b!1030539 () Bool)

(declare-fun e!581951 () ListLongMap!13771)

(assert (=> b!1030539 (= e!581951 call!43563)))

(declare-fun b!1030540 () Bool)

(declare-fun c!104183 () Bool)

(assert (=> b!1030540 (= c!104183 (and (not (= (bvand (extraKeys!5866 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5866 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1030540 (= e!581951 e!581947)))

(declare-fun b!1030541 () Bool)

(declare-fun lt!454539 () Unit!33549)

(assert (=> b!1030541 (= e!581953 lt!454539)))

(declare-fun lt!454545 () ListLongMap!13771)

(assert (=> b!1030541 (= lt!454545 (getCurrentListMapNoExtraKeys!3564 (_keys!11301 thiss!1427) (_values!6157 thiss!1427) (mask!29907 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6134 thiss!1427)))))

(declare-fun lt!454543 () (_ BitVec 64))

(assert (=> b!1030541 (= lt!454543 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454537 () (_ BitVec 64))

(assert (=> b!1030541 (= lt!454537 (select (arr!31140 (_keys!11301 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!454527 () Unit!33549)

(assert (=> b!1030541 (= lt!454527 (addStillContains!617 lt!454545 lt!454543 (zeroValue!5970 thiss!1427) lt!454537))))

(assert (=> b!1030541 (contains!5958 (+!3129 lt!454545 (tuple2!15677 lt!454543 (zeroValue!5970 thiss!1427))) lt!454537)))

(declare-fun lt!454544 () Unit!33549)

(assert (=> b!1030541 (= lt!454544 lt!454527)))

(declare-fun lt!454538 () ListLongMap!13771)

(assert (=> b!1030541 (= lt!454538 (getCurrentListMapNoExtraKeys!3564 (_keys!11301 thiss!1427) (_values!6157 thiss!1427) (mask!29907 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6134 thiss!1427)))))

(declare-fun lt!454530 () (_ BitVec 64))

(assert (=> b!1030541 (= lt!454530 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454529 () (_ BitVec 64))

(assert (=> b!1030541 (= lt!454529 (select (arr!31140 (_keys!11301 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!454531 () Unit!33549)

(assert (=> b!1030541 (= lt!454531 (addApplyDifferent!473 lt!454538 lt!454530 (minValue!5970 thiss!1427) lt!454529))))

(assert (=> b!1030541 (= (apply!898 (+!3129 lt!454538 (tuple2!15677 lt!454530 (minValue!5970 thiss!1427))) lt!454529) (apply!898 lt!454538 lt!454529))))

(declare-fun lt!454541 () Unit!33549)

(assert (=> b!1030541 (= lt!454541 lt!454531)))

(declare-fun lt!454533 () ListLongMap!13771)

(assert (=> b!1030541 (= lt!454533 (getCurrentListMapNoExtraKeys!3564 (_keys!11301 thiss!1427) (_values!6157 thiss!1427) (mask!29907 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6134 thiss!1427)))))

(declare-fun lt!454540 () (_ BitVec 64))

(assert (=> b!1030541 (= lt!454540 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454535 () (_ BitVec 64))

(assert (=> b!1030541 (= lt!454535 (select (arr!31140 (_keys!11301 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!454534 () Unit!33549)

(assert (=> b!1030541 (= lt!454534 (addApplyDifferent!473 lt!454533 lt!454540 (zeroValue!5970 thiss!1427) lt!454535))))

(assert (=> b!1030541 (= (apply!898 (+!3129 lt!454533 (tuple2!15677 lt!454540 (zeroValue!5970 thiss!1427))) lt!454535) (apply!898 lt!454533 lt!454535))))

(declare-fun lt!454542 () Unit!33549)

(assert (=> b!1030541 (= lt!454542 lt!454534)))

(declare-fun lt!454528 () ListLongMap!13771)

(assert (=> b!1030541 (= lt!454528 (getCurrentListMapNoExtraKeys!3564 (_keys!11301 thiss!1427) (_values!6157 thiss!1427) (mask!29907 thiss!1427) (extraKeys!5866 thiss!1427) (zeroValue!5970 thiss!1427) (minValue!5970 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6134 thiss!1427)))))

(declare-fun lt!454547 () (_ BitVec 64))

(assert (=> b!1030541 (= lt!454547 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!454532 () (_ BitVec 64))

(assert (=> b!1030541 (= lt!454532 (select (arr!31140 (_keys!11301 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1030541 (= lt!454539 (addApplyDifferent!473 lt!454528 lt!454547 (minValue!5970 thiss!1427) lt!454532))))

(assert (=> b!1030541 (= (apply!898 (+!3129 lt!454528 (tuple2!15677 lt!454547 (minValue!5970 thiss!1427))) lt!454532) (apply!898 lt!454528 lt!454532))))

(declare-fun bm!43559 () Bool)

(assert (=> bm!43559 (= call!43564 (contains!5958 lt!454546 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1030542 () Bool)

(assert (=> b!1030542 (= e!581948 (not call!43564))))

(declare-fun c!104187 () Bool)

(declare-fun bm!43560 () Bool)

(assert (=> bm!43560 (= call!43561 (+!3129 (ite c!104182 call!43565 (ite c!104187 call!43559 call!43560)) (ite (or c!104182 c!104187) (tuple2!15677 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5970 thiss!1427)) (tuple2!15677 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5970 thiss!1427)))))))

(declare-fun bm!43561 () Bool)

(assert (=> bm!43561 (= call!43562 (contains!5958 lt!454546 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1030543 () Bool)

(assert (=> b!1030543 (= e!581952 e!581951)))

(assert (=> b!1030543 (= c!104187 (and (not (= (bvand (extraKeys!5866 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5866 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1030544 () Bool)

(assert (=> b!1030544 (= e!581956 (validKeyInArray!0 (select (arr!31140 (_keys!11301 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43562 () Bool)

(assert (=> bm!43562 (= call!43559 call!43565)))

(declare-fun b!1030545 () Bool)

(assert (=> b!1030545 (= e!581954 e!581949)))

(declare-fun res!689136 () Bool)

(assert (=> b!1030545 (= res!689136 call!43562)))

(assert (=> b!1030545 (=> (not res!689136) (not e!581949))))

(declare-fun b!1030546 () Bool)

(declare-fun res!689133 () Bool)

(assert (=> b!1030546 (=> (not res!689133) (not e!581945))))

(assert (=> b!1030546 (= res!689133 e!581954)))

(declare-fun c!104186 () Bool)

(assert (=> b!1030546 (= c!104186 (not (= (bvand (extraKeys!5866 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1030547 () Bool)

(assert (=> b!1030547 (= e!581957 e!581946)))

(declare-fun res!689131 () Bool)

(assert (=> b!1030547 (=> (not res!689131) (not e!581946))))

(assert (=> b!1030547 (= res!689131 (contains!5958 lt!454546 (select (arr!31140 (_keys!11301 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1030547 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31659 (_keys!11301 thiss!1427))))))

(assert (= (and d!123471 c!104182) b!1030535))

(assert (= (and d!123471 (not c!104182)) b!1030543))

(assert (= (and b!1030543 c!104187) b!1030539))

(assert (= (and b!1030543 (not c!104187)) b!1030540))

(assert (= (and b!1030540 c!104183) b!1030532))

(assert (= (and b!1030540 (not c!104183)) b!1030529))

(assert (= (or b!1030532 b!1030529) bm!43557))

(assert (= (or b!1030539 bm!43557) bm!43562))

(assert (= (or b!1030539 b!1030532) bm!43556))

(assert (= (or b!1030535 bm!43562) bm!43558))

(assert (= (or b!1030535 bm!43556) bm!43560))

(assert (= (and d!123471 res!689130) b!1030544))

(assert (= (and d!123471 c!104184) b!1030541))

(assert (= (and d!123471 (not c!104184)) b!1030531))

(assert (= (and d!123471 res!689134) b!1030536))

(assert (= (and b!1030536 res!689137) b!1030527))

(assert (= (and b!1030536 (not res!689129)) b!1030547))

(assert (= (and b!1030547 res!689131) b!1030537))

(assert (= (and b!1030536 res!689135) b!1030546))

(assert (= (and b!1030546 c!104186) b!1030545))

(assert (= (and b!1030546 (not c!104186)) b!1030530))

(assert (= (and b!1030545 res!689136) b!1030533))

(assert (= (or b!1030545 b!1030530) bm!43561))

(assert (= (and b!1030546 res!689133) b!1030534))

(assert (= (and b!1030534 c!104185) b!1030538))

(assert (= (and b!1030534 (not c!104185)) b!1030542))

(assert (= (and b!1030538 res!689132) b!1030528))

(assert (= (or b!1030538 b!1030542) bm!43559))

(declare-fun b_lambda!15937 () Bool)

(assert (=> (not b_lambda!15937) (not b!1030537)))

(assert (=> b!1030537 t!30972))

(declare-fun b_and!32985 () Bool)

(assert (= b_and!32983 (and (=> t!30972 result!14189) b_and!32985)))

(assert (=> b!1030547 m!949829))

(assert (=> b!1030547 m!949829))

(declare-fun m!949843 () Bool)

(assert (=> b!1030547 m!949843))

(declare-fun m!949845 () Bool)

(assert (=> b!1030533 m!949845))

(assert (=> b!1030537 m!949829))

(declare-fun m!949847 () Bool)

(assert (=> b!1030537 m!949847))

(assert (=> b!1030537 m!949829))

(declare-fun m!949849 () Bool)

(assert (=> b!1030537 m!949849))

(assert (=> b!1030537 m!949597))

(assert (=> b!1030537 m!949847))

(assert (=> b!1030537 m!949597))

(declare-fun m!949851 () Bool)

(assert (=> b!1030537 m!949851))

(declare-fun m!949853 () Bool)

(assert (=> b!1030535 m!949853))

(declare-fun m!949855 () Bool)

(assert (=> bm!43560 m!949855))

(assert (=> d!123471 m!949721))

(assert (=> b!1030527 m!949829))

(assert (=> b!1030527 m!949829))

(assert (=> b!1030527 m!949831))

(declare-fun m!949857 () Bool)

(assert (=> b!1030528 m!949857))

(declare-fun m!949859 () Bool)

(assert (=> bm!43558 m!949859))

(declare-fun m!949861 () Bool)

(assert (=> bm!43561 m!949861))

(declare-fun m!949863 () Bool)

(assert (=> bm!43559 m!949863))

(declare-fun m!949865 () Bool)

(assert (=> b!1030541 m!949865))

(declare-fun m!949867 () Bool)

(assert (=> b!1030541 m!949867))

(assert (=> b!1030541 m!949859))

(declare-fun m!949869 () Bool)

(assert (=> b!1030541 m!949869))

(declare-fun m!949871 () Bool)

(assert (=> b!1030541 m!949871))

(assert (=> b!1030541 m!949829))

(declare-fun m!949873 () Bool)

(assert (=> b!1030541 m!949873))

(declare-fun m!949875 () Bool)

(assert (=> b!1030541 m!949875))

(declare-fun m!949877 () Bool)

(assert (=> b!1030541 m!949877))

(declare-fun m!949879 () Bool)

(assert (=> b!1030541 m!949879))

(assert (=> b!1030541 m!949877))

(declare-fun m!949881 () Bool)

(assert (=> b!1030541 m!949881))

(declare-fun m!949883 () Bool)

(assert (=> b!1030541 m!949883))

(declare-fun m!949885 () Bool)

(assert (=> b!1030541 m!949885))

(assert (=> b!1030541 m!949867))

(declare-fun m!949887 () Bool)

(assert (=> b!1030541 m!949887))

(declare-fun m!949889 () Bool)

(assert (=> b!1030541 m!949889))

(assert (=> b!1030541 m!949883))

(declare-fun m!949891 () Bool)

(assert (=> b!1030541 m!949891))

(assert (=> b!1030541 m!949869))

(declare-fun m!949893 () Bool)

(assert (=> b!1030541 m!949893))

(assert (=> b!1030544 m!949829))

(assert (=> b!1030544 m!949829))

(assert (=> b!1030544 m!949831))

(assert (=> b!1030300 d!123471))

(declare-fun d!123473 () Bool)

(declare-fun lt!454548 () (_ BitVec 32))

(assert (=> d!123473 (and (bvsge lt!454548 #b00000000000000000000000000000000) (bvsle lt!454548 (bvsub (size!31659 lt!454357) #b00000000000000000000000000000000)))))

(declare-fun e!581958 () (_ BitVec 32))

(assert (=> d!123473 (= lt!454548 e!581958)))

(declare-fun c!104188 () Bool)

(assert (=> d!123473 (= c!104188 (bvsge #b00000000000000000000000000000000 (size!31659 (_keys!11301 thiss!1427))))))

(assert (=> d!123473 (and (bvsle #b00000000000000000000000000000000 (size!31659 (_keys!11301 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31659 (_keys!11301 thiss!1427)) (size!31659 lt!454357)))))

(assert (=> d!123473 (= (arrayCountValidKeys!0 lt!454357 #b00000000000000000000000000000000 (size!31659 (_keys!11301 thiss!1427))) lt!454548)))

(declare-fun bm!43563 () Bool)

(declare-fun call!43566 () (_ BitVec 32))

(assert (=> bm!43563 (= call!43566 (arrayCountValidKeys!0 lt!454357 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31659 (_keys!11301 thiss!1427))))))

(declare-fun b!1030548 () Bool)

(assert (=> b!1030548 (= e!581958 #b00000000000000000000000000000000)))

(declare-fun b!1030549 () Bool)

(declare-fun e!581959 () (_ BitVec 32))

(assert (=> b!1030549 (= e!581959 call!43566)))

(declare-fun b!1030550 () Bool)

(assert (=> b!1030550 (= e!581958 e!581959)))

(declare-fun c!104189 () Bool)

(assert (=> b!1030550 (= c!104189 (validKeyInArray!0 (select (arr!31140 lt!454357) #b00000000000000000000000000000000)))))

(declare-fun b!1030551 () Bool)

(assert (=> b!1030551 (= e!581959 (bvadd #b00000000000000000000000000000001 call!43566))))

(assert (= (and d!123473 c!104188) b!1030548))

(assert (= (and d!123473 (not c!104188)) b!1030550))

(assert (= (and b!1030550 c!104189) b!1030551))

(assert (= (and b!1030550 (not c!104189)) b!1030549))

(assert (= (or b!1030551 b!1030549) bm!43563))

(declare-fun m!949895 () Bool)

(assert (=> bm!43563 m!949895))

(assert (=> b!1030550 m!949753))

(assert (=> b!1030550 m!949753))

(assert (=> b!1030550 m!949761))

(assert (=> b!1030300 d!123473))

(declare-fun d!123475 () Bool)

(declare-fun e!581962 () Bool)

(assert (=> d!123475 e!581962))

(declare-fun res!689140 () Bool)

(assert (=> d!123475 (=> (not res!689140) (not e!581962))))

(assert (=> d!123475 (= res!689140 (bvslt (index!41092 lt!454358) (size!31659 (_keys!11301 thiss!1427))))))

(declare-fun lt!454551 () Unit!33549)

(declare-fun choose!121 (array!64675 (_ BitVec 32) (_ BitVec 64)) Unit!33549)

(assert (=> d!123475 (= lt!454551 (choose!121 (_keys!11301 thiss!1427) (index!41092 lt!454358) key!909))))

(assert (=> d!123475 (bvsge (index!41092 lt!454358) #b00000000000000000000000000000000)))

(assert (=> d!123475 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11301 thiss!1427) (index!41092 lt!454358) key!909) lt!454551)))

(declare-fun b!1030554 () Bool)

(assert (=> b!1030554 (= e!581962 (not (arrayContainsKey!0 (array!64676 (store (arr!31140 (_keys!11301 thiss!1427)) (index!41092 lt!454358) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31659 (_keys!11301 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!123475 res!689140) b!1030554))

(declare-fun m!949897 () Bool)

(assert (=> d!123475 m!949897))

(assert (=> b!1030554 m!949587))

(declare-fun m!949899 () Bool)

(assert (=> b!1030554 m!949899))

(assert (=> b!1030300 d!123475))

(declare-fun d!123477 () Bool)

(declare-fun res!689145 () Bool)

(declare-fun e!581967 () Bool)

(assert (=> d!123477 (=> res!689145 e!581967)))

(assert (=> d!123477 (= res!689145 (= (select (arr!31140 lt!454357) #b00000000000000000000000000000000) key!909))))

(assert (=> d!123477 (= (arrayContainsKey!0 lt!454357 key!909 #b00000000000000000000000000000000) e!581967)))

(declare-fun b!1030559 () Bool)

(declare-fun e!581968 () Bool)

(assert (=> b!1030559 (= e!581967 e!581968)))

(declare-fun res!689146 () Bool)

(assert (=> b!1030559 (=> (not res!689146) (not e!581968))))

(assert (=> b!1030559 (= res!689146 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31659 lt!454357)))))

(declare-fun b!1030560 () Bool)

(assert (=> b!1030560 (= e!581968 (arrayContainsKey!0 lt!454357 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!123477 (not res!689145)) b!1030559))

(assert (= (and b!1030559 res!689146) b!1030560))

(assert (=> d!123477 m!949753))

(declare-fun m!949901 () Bool)

(assert (=> b!1030560 m!949901))

(assert (=> b!1030300 d!123477))

(declare-fun b!1030561 () Bool)

(declare-fun e!581970 () Bool)

(declare-fun e!581972 () Bool)

(assert (=> b!1030561 (= e!581970 e!581972)))

(declare-fun c!104190 () Bool)

(assert (=> b!1030561 (= c!104190 (validKeyInArray!0 (select (arr!31140 lt!454357) #b00000000000000000000000000000000)))))

(declare-fun b!1030562 () Bool)

(declare-fun e!581971 () Bool)

(assert (=> b!1030562 (= e!581971 e!581970)))

(declare-fun res!689147 () Bool)

(assert (=> b!1030562 (=> (not res!689147) (not e!581970))))

(declare-fun e!581969 () Bool)

(assert (=> b!1030562 (= res!689147 (not e!581969))))

(declare-fun res!689148 () Bool)

(assert (=> b!1030562 (=> (not res!689148) (not e!581969))))

(assert (=> b!1030562 (= res!689148 (validKeyInArray!0 (select (arr!31140 lt!454357) #b00000000000000000000000000000000)))))

(declare-fun bm!43564 () Bool)

(declare-fun call!43567 () Bool)

(assert (=> bm!43564 (= call!43567 (arrayNoDuplicates!0 lt!454357 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104190 (Cons!21866 (select (arr!31140 lt!454357) #b00000000000000000000000000000000) Nil!21867) Nil!21867)))))

(declare-fun d!123479 () Bool)

(declare-fun res!689149 () Bool)

(assert (=> d!123479 (=> res!689149 e!581971)))

(assert (=> d!123479 (= res!689149 (bvsge #b00000000000000000000000000000000 (size!31659 lt!454357)))))

(assert (=> d!123479 (= (arrayNoDuplicates!0 lt!454357 #b00000000000000000000000000000000 Nil!21867) e!581971)))

(declare-fun b!1030563 () Bool)

(assert (=> b!1030563 (= e!581972 call!43567)))

(declare-fun b!1030564 () Bool)

(assert (=> b!1030564 (= e!581969 (contains!5957 Nil!21867 (select (arr!31140 lt!454357) #b00000000000000000000000000000000)))))

(declare-fun b!1030565 () Bool)

(assert (=> b!1030565 (= e!581972 call!43567)))

(assert (= (and d!123479 (not res!689149)) b!1030562))

(assert (= (and b!1030562 res!689148) b!1030564))

(assert (= (and b!1030562 res!689147) b!1030561))

(assert (= (and b!1030561 c!104190) b!1030565))

(assert (= (and b!1030561 (not c!104190)) b!1030563))

(assert (= (or b!1030565 b!1030563) bm!43564))

(assert (=> b!1030561 m!949753))

(assert (=> b!1030561 m!949753))

(assert (=> b!1030561 m!949761))

(assert (=> b!1030562 m!949753))

(assert (=> b!1030562 m!949753))

(assert (=> b!1030562 m!949761))

(assert (=> bm!43564 m!949753))

(declare-fun m!949903 () Bool)

(assert (=> bm!43564 m!949903))

(assert (=> b!1030564 m!949753))

(assert (=> b!1030564 m!949753))

(declare-fun m!949905 () Bool)

(assert (=> b!1030564 m!949905))

(assert (=> b!1030300 d!123479))

(declare-fun d!123481 () Bool)

(assert (=> d!123481 (= (array_inv!24107 (_keys!11301 thiss!1427)) (bvsge (size!31659 (_keys!11301 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1030296 d!123481))

(declare-fun d!123483 () Bool)

(assert (=> d!123483 (= (array_inv!24108 (_values!6157 thiss!1427)) (bvsge (size!31660 (_values!6157 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1030296 d!123483))

(declare-fun mapIsEmpty!37965 () Bool)

(declare-fun mapRes!37965 () Bool)

(assert (=> mapIsEmpty!37965 mapRes!37965))

(declare-fun condMapEmpty!37965 () Bool)

(declare-fun mapDefault!37965 () ValueCell!11465)

(assert (=> mapNonEmpty!37956 (= condMapEmpty!37965 (= mapRest!37956 ((as const (Array (_ BitVec 32) ValueCell!11465)) mapDefault!37965)))))

(declare-fun e!581977 () Bool)

(assert (=> mapNonEmpty!37956 (= tp!72919 (and e!581977 mapRes!37965))))

(declare-fun b!1030573 () Bool)

(assert (=> b!1030573 (= e!581977 tp_is_empty!24337)))

(declare-fun mapNonEmpty!37965 () Bool)

(declare-fun tp!72934 () Bool)

(declare-fun e!581978 () Bool)

(assert (=> mapNonEmpty!37965 (= mapRes!37965 (and tp!72934 e!581978))))

(declare-fun mapRest!37965 () (Array (_ BitVec 32) ValueCell!11465))

(declare-fun mapValue!37965 () ValueCell!11465)

(declare-fun mapKey!37965 () (_ BitVec 32))

(assert (=> mapNonEmpty!37965 (= mapRest!37956 (store mapRest!37965 mapKey!37965 mapValue!37965))))

(declare-fun b!1030572 () Bool)

(assert (=> b!1030572 (= e!581978 tp_is_empty!24337)))

(assert (= (and mapNonEmpty!37956 condMapEmpty!37965) mapIsEmpty!37965))

(assert (= (and mapNonEmpty!37956 (not condMapEmpty!37965)) mapNonEmpty!37965))

(assert (= (and mapNonEmpty!37965 ((_ is ValueCellFull!11465) mapValue!37965)) b!1030572))

(assert (= (and mapNonEmpty!37956 ((_ is ValueCellFull!11465) mapDefault!37965)) b!1030573))

(declare-fun m!949907 () Bool)

(assert (=> mapNonEmpty!37965 m!949907))

(declare-fun b_lambda!15939 () Bool)

(assert (= b_lambda!15937 (or (and b!1030296 b_free!20617) b_lambda!15939)))

(declare-fun b_lambda!15941 () Bool)

(assert (= b_lambda!15933 (or (and b!1030296 b_free!20617) b_lambda!15941)))

(declare-fun b_lambda!15943 () Bool)

(assert (= b_lambda!15935 (or (and b!1030296 b_free!20617) b_lambda!15943)))

(check-sat (not b!1030528) (not d!123459) (not b!1030432) (not b!1030436) (not d!123453) (not b!1030488) (not d!123469) (not b!1030401) (not b!1030490) (not d!123461) b_and!32985 (not b!1030541) (not b!1030523) (not bm!43548) (not d!123463) (not b!1030502) (not b!1030409) (not bm!43558) (not b!1030550) (not b!1030496) (not b!1030387) tp_is_empty!24337 (not b_lambda!15939) (not bm!43550) (not b!1030425) (not b!1030535) (not b!1030402) (not b!1030547) (not b!1030513) (not b!1030492) (not bm!43561) (not b_next!20617) (not d!123471) (not b!1030562) (not b!1030483) (not bm!43555) (not b!1030564) (not b!1030411) (not b!1030524) (not b_lambda!15943) (not b!1030422) (not b_lambda!15931) (not b!1030410) (not b!1030499) (not b!1030537) (not b!1030429) (not bm!43530) (not bm!43564) (not b!1030533) (not d!123465) (not b!1030544) (not b!1030482) (not b_lambda!15941) (not bm!43549) (not bm!43563) (not b!1030526) (not bm!43559) (not mapNonEmpty!37965) (not d!123445) (not b!1030560) (not b!1030561) (not bm!43531) (not bm!43527) (not d!123449) (not b!1030423) (not d!123475) (not bm!43560) (not b!1030439) (not bm!43551) (not b!1030527) (not b!1030433) (not b!1030554))
(check-sat b_and!32985 (not b_next!20617))
