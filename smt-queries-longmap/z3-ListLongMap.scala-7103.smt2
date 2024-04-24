; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90298 () Bool)

(assert start!90298)

(declare-fun b!1032903 () Bool)

(declare-fun b_free!20671 () Bool)

(declare-fun b_next!20671 () Bool)

(assert (=> b!1032903 (= b_free!20671 (not b_next!20671))))

(declare-fun tp!73084 () Bool)

(declare-fun b_and!33119 () Bool)

(assert (=> b!1032903 (= tp!73084 b_and!33119)))

(declare-fun b!1032902 () Bool)

(declare-fun res!690246 () Bool)

(declare-fun e!583511 () Bool)

(assert (=> b!1032902 (=> res!690246 e!583511)))

(declare-datatypes ((V!37395 0))(
  ( (V!37396 (val!12246 Int)) )
))
(declare-datatypes ((ValueCell!11492 0))(
  ( (ValueCellFull!11492 (v!14819 V!37395)) (EmptyCell!11492) )
))
(declare-datatypes ((Unit!33752 0))(
  ( (Unit!33753) )
))
(declare-datatypes ((array!64895 0))(
  ( (array!64896 (arr!31243 (Array (_ BitVec 32) (_ BitVec 64))) (size!31761 (_ BitVec 32))) )
))
(declare-datatypes ((array!64897 0))(
  ( (array!64898 (arr!31244 (Array (_ BitVec 32) ValueCell!11492)) (size!31762 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5578 0))(
  ( (LongMapFixedSize!5579 (defaultEntry!6163 Int) (mask!30023 (_ BitVec 32)) (extraKeys!5895 (_ BitVec 32)) (zeroValue!5999 V!37395) (minValue!5999 V!37395) (_size!2844 (_ BitVec 32)) (_keys!11374 array!64895) (_values!6186 array!64897) (_vacant!2844 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15676 0))(
  ( (tuple2!15677 (_1!7849 Unit!33752) (_2!7849 LongMapFixedSize!5578)) )
))
(declare-fun lt!456015 () tuple2!15676)

(assert (=> b!1032902 (= res!690246 (or (not (= (size!31762 (_values!6186 (_2!7849 lt!456015))) (bvadd #b00000000000000000000000000000001 (mask!30023 (_2!7849 lt!456015))))) (not (= (size!31761 (_keys!11374 (_2!7849 lt!456015))) (size!31762 (_values!6186 (_2!7849 lt!456015))))) (bvslt (mask!30023 (_2!7849 lt!456015)) #b00000000000000000000000000000000) (bvslt (extraKeys!5895 (_2!7849 lt!456015)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5895 (_2!7849 lt!456015)) #b00000000000000000000000000000011)))))

(declare-fun res!690245 () Bool)

(declare-fun e!583506 () Bool)

(assert (=> start!90298 (=> (not res!690245) (not e!583506))))

(declare-fun thiss!1427 () LongMapFixedSize!5578)

(declare-fun valid!2114 (LongMapFixedSize!5578) Bool)

(assert (=> start!90298 (= res!690245 (valid!2114 thiss!1427))))

(assert (=> start!90298 e!583506))

(declare-fun e!583510 () Bool)

(assert (=> start!90298 e!583510))

(assert (=> start!90298 true))

(declare-fun tp_is_empty!24391 () Bool)

(declare-fun e!583508 () Bool)

(declare-fun array_inv!24189 (array!64895) Bool)

(declare-fun array_inv!24190 (array!64897) Bool)

(assert (=> b!1032903 (= e!583510 (and tp!73084 tp_is_empty!24391 (array_inv!24189 (_keys!11374 thiss!1427)) (array_inv!24190 (_values!6186 thiss!1427)) e!583508))))

(declare-fun b!1032904 () Bool)

(declare-fun e!583512 () Bool)

(assert (=> b!1032904 (= e!583512 (not e!583511))))

(declare-fun res!690248 () Bool)

(assert (=> b!1032904 (=> res!690248 e!583511)))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15678 0))(
  ( (tuple2!15679 (_1!7850 (_ BitVec 64)) (_2!7850 V!37395)) )
))
(declare-datatypes ((List!21861 0))(
  ( (Nil!21858) (Cons!21857 (h!23068 tuple2!15678) (t!31019 List!21861)) )
))
(declare-datatypes ((ListLongMap!13741 0))(
  ( (ListLongMap!13742 (toList!6886 List!21861)) )
))
(declare-fun contains!6021 (ListLongMap!13741 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3932 (array!64895 array!64897 (_ BitVec 32) (_ BitVec 32) V!37395 V!37395 (_ BitVec 32) Int) ListLongMap!13741)

(assert (=> b!1032904 (= res!690248 (not (contains!6021 (getCurrentListMap!3932 (_keys!11374 (_2!7849 lt!456015)) (_values!6186 (_2!7849 lt!456015)) (mask!30023 (_2!7849 lt!456015)) (extraKeys!5895 (_2!7849 lt!456015)) (zeroValue!5999 (_2!7849 lt!456015)) (minValue!5999 (_2!7849 lt!456015)) #b00000000000000000000000000000000 (defaultEntry!6163 (_2!7849 lt!456015))) key!909)))))

(declare-fun lt!456008 () array!64895)

(declare-fun lt!456012 () array!64897)

(declare-fun Unit!33754 () Unit!33752)

(declare-fun Unit!33755 () Unit!33752)

(assert (=> b!1032904 (= lt!456015 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2844 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15677 Unit!33754 (LongMapFixedSize!5579 (defaultEntry!6163 thiss!1427) (mask!30023 thiss!1427) (extraKeys!5895 thiss!1427) (zeroValue!5999 thiss!1427) (minValue!5999 thiss!1427) (bvsub (_size!2844 thiss!1427) #b00000000000000000000000000000001) lt!456008 lt!456012 (bvadd #b00000000000000000000000000000001 (_vacant!2844 thiss!1427)))) (tuple2!15677 Unit!33755 (LongMapFixedSize!5579 (defaultEntry!6163 thiss!1427) (mask!30023 thiss!1427) (extraKeys!5895 thiss!1427) (zeroValue!5999 thiss!1427) (minValue!5999 thiss!1427) (bvsub (_size!2844 thiss!1427) #b00000000000000000000000000000001) lt!456008 lt!456012 (_vacant!2844 thiss!1427)))))))

(declare-fun -!509 (ListLongMap!13741 (_ BitVec 64)) ListLongMap!13741)

(assert (=> b!1032904 (= (-!509 (getCurrentListMap!3932 (_keys!11374 thiss!1427) (_values!6186 thiss!1427) (mask!30023 thiss!1427) (extraKeys!5895 thiss!1427) (zeroValue!5999 thiss!1427) (minValue!5999 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6163 thiss!1427)) key!909) (getCurrentListMap!3932 lt!456008 lt!456012 (mask!30023 thiss!1427) (extraKeys!5895 thiss!1427) (zeroValue!5999 thiss!1427) (minValue!5999 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6163 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9664 0))(
  ( (MissingZero!9664 (index!41027 (_ BitVec 32))) (Found!9664 (index!41028 (_ BitVec 32))) (Intermediate!9664 (undefined!10476 Bool) (index!41029 (_ BitVec 32)) (x!91850 (_ BitVec 32))) (Undefined!9664) (MissingVacant!9664 (index!41030 (_ BitVec 32))) )
))
(declare-fun lt!456013 () SeekEntryResult!9664)

(declare-fun dynLambda!2003 (Int (_ BitVec 64)) V!37395)

(assert (=> b!1032904 (= lt!456012 (array!64898 (store (arr!31244 (_values!6186 thiss!1427)) (index!41028 lt!456013) (ValueCellFull!11492 (dynLambda!2003 (defaultEntry!6163 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31762 (_values!6186 thiss!1427))))))

(declare-fun lt!456016 () Unit!33752)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!35 (array!64895 array!64897 (_ BitVec 32) (_ BitVec 32) V!37395 V!37395 (_ BitVec 32) (_ BitVec 64) Int) Unit!33752)

(assert (=> b!1032904 (= lt!456016 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!35 (_keys!11374 thiss!1427) (_values!6186 thiss!1427) (mask!30023 thiss!1427) (extraKeys!5895 thiss!1427) (zeroValue!5999 thiss!1427) (minValue!5999 thiss!1427) (index!41028 lt!456013) key!909 (defaultEntry!6163 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64895 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1032904 (not (arrayContainsKey!0 lt!456008 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!456010 () Unit!33752)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64895 (_ BitVec 32) (_ BitVec 64)) Unit!33752)

(assert (=> b!1032904 (= lt!456010 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11374 thiss!1427) (index!41028 lt!456013) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64895 (_ BitVec 32)) Bool)

(assert (=> b!1032904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!456008 (mask!30023 thiss!1427))))

(declare-fun lt!456007 () Unit!33752)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64895 (_ BitVec 32) (_ BitVec 32)) Unit!33752)

(assert (=> b!1032904 (= lt!456007 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11374 thiss!1427) (index!41028 lt!456013) (mask!30023 thiss!1427)))))

(declare-datatypes ((List!21862 0))(
  ( (Nil!21859) (Cons!21858 (h!23069 (_ BitVec 64)) (t!31020 List!21862)) )
))
(declare-fun arrayNoDuplicates!0 (array!64895 (_ BitVec 32) List!21862) Bool)

(assert (=> b!1032904 (arrayNoDuplicates!0 lt!456008 #b00000000000000000000000000000000 Nil!21859)))

(declare-fun lt!456014 () Unit!33752)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64895 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21862) Unit!33752)

(assert (=> b!1032904 (= lt!456014 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11374 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41028 lt!456013) #b00000000000000000000000000000000 Nil!21859))))

(declare-fun arrayCountValidKeys!0 (array!64895 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1032904 (= (arrayCountValidKeys!0 lt!456008 #b00000000000000000000000000000000 (size!31761 (_keys!11374 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11374 thiss!1427) #b00000000000000000000000000000000 (size!31761 (_keys!11374 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1032904 (= lt!456008 (array!64896 (store (arr!31243 (_keys!11374 thiss!1427)) (index!41028 lt!456013) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31761 (_keys!11374 thiss!1427))))))

(declare-fun lt!456009 () Unit!33752)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64895 (_ BitVec 32) (_ BitVec 64)) Unit!33752)

(assert (=> b!1032904 (= lt!456009 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11374 thiss!1427) (index!41028 lt!456013) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1032905 () Bool)

(declare-fun e!583509 () Bool)

(assert (=> b!1032905 (= e!583509 tp_is_empty!24391)))

(declare-fun b!1032906 () Bool)

(declare-fun e!583507 () Bool)

(declare-fun mapRes!38040 () Bool)

(assert (=> b!1032906 (= e!583508 (and e!583507 mapRes!38040))))

(declare-fun condMapEmpty!38040 () Bool)

(declare-fun mapDefault!38040 () ValueCell!11492)

(assert (=> b!1032906 (= condMapEmpty!38040 (= (arr!31244 (_values!6186 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11492)) mapDefault!38040)))))

(declare-fun mapIsEmpty!38040 () Bool)

(assert (=> mapIsEmpty!38040 mapRes!38040))

(declare-fun b!1032907 () Bool)

(declare-fun res!690250 () Bool)

(assert (=> b!1032907 (=> res!690250 e!583511)))

(assert (=> b!1032907 (= res!690250 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11374 (_2!7849 lt!456015)) (mask!30023 (_2!7849 lt!456015)))))))

(declare-fun b!1032908 () Bool)

(declare-fun res!690247 () Bool)

(assert (=> b!1032908 (=> res!690247 e!583511)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1032908 (= res!690247 (not (validMask!0 (mask!30023 (_2!7849 lt!456015)))))))

(declare-fun b!1032909 () Bool)

(assert (=> b!1032909 (= e!583507 tp_is_empty!24391)))

(declare-fun mapNonEmpty!38040 () Bool)

(declare-fun tp!73083 () Bool)

(assert (=> mapNonEmpty!38040 (= mapRes!38040 (and tp!73083 e!583509))))

(declare-fun mapValue!38040 () ValueCell!11492)

(declare-fun mapKey!38040 () (_ BitVec 32))

(declare-fun mapRest!38040 () (Array (_ BitVec 32) ValueCell!11492))

(assert (=> mapNonEmpty!38040 (= (arr!31244 (_values!6186 thiss!1427)) (store mapRest!38040 mapKey!38040 mapValue!38040))))

(declare-fun b!1032910 () Bool)

(assert (=> b!1032910 (= e!583511 true)))

(declare-fun lt!456011 () Bool)

(assert (=> b!1032910 (= lt!456011 (arrayNoDuplicates!0 (_keys!11374 (_2!7849 lt!456015)) #b00000000000000000000000000000000 Nil!21859))))

(declare-fun b!1032911 () Bool)

(assert (=> b!1032911 (= e!583506 e!583512)))

(declare-fun res!690249 () Bool)

(assert (=> b!1032911 (=> (not res!690249) (not e!583512))))

(get-info :version)

(assert (=> b!1032911 (= res!690249 ((_ is Found!9664) lt!456013))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64895 (_ BitVec 32)) SeekEntryResult!9664)

(assert (=> b!1032911 (= lt!456013 (seekEntry!0 key!909 (_keys!11374 thiss!1427) (mask!30023 thiss!1427)))))

(declare-fun b!1032912 () Bool)

(declare-fun res!690251 () Bool)

(assert (=> b!1032912 (=> (not res!690251) (not e!583506))))

(assert (=> b!1032912 (= res!690251 (not (= key!909 (bvneg key!909))))))

(assert (= (and start!90298 res!690245) b!1032912))

(assert (= (and b!1032912 res!690251) b!1032911))

(assert (= (and b!1032911 res!690249) b!1032904))

(assert (= (and b!1032904 (not res!690248)) b!1032908))

(assert (= (and b!1032908 (not res!690247)) b!1032902))

(assert (= (and b!1032902 (not res!690246)) b!1032907))

(assert (= (and b!1032907 (not res!690250)) b!1032910))

(assert (= (and b!1032906 condMapEmpty!38040) mapIsEmpty!38040))

(assert (= (and b!1032906 (not condMapEmpty!38040)) mapNonEmpty!38040))

(assert (= (and mapNonEmpty!38040 ((_ is ValueCellFull!11492) mapValue!38040)) b!1032905))

(assert (= (and b!1032906 ((_ is ValueCellFull!11492) mapDefault!38040)) b!1032909))

(assert (= b!1032903 b!1032906))

(assert (= start!90298 b!1032903))

(declare-fun b_lambda!16025 () Bool)

(assert (=> (not b_lambda!16025) (not b!1032904)))

(declare-fun t!31018 () Bool)

(declare-fun tb!6981 () Bool)

(assert (=> (and b!1032903 (= (defaultEntry!6163 thiss!1427) (defaultEntry!6163 thiss!1427)) t!31018) tb!6981))

(declare-fun result!14299 () Bool)

(assert (=> tb!6981 (= result!14299 tp_is_empty!24391)))

(assert (=> b!1032904 t!31018))

(declare-fun b_and!33121 () Bool)

(assert (= b_and!33119 (and (=> t!31018 result!14299) b_and!33121)))

(declare-fun m!953441 () Bool)

(assert (=> b!1032908 m!953441))

(declare-fun m!953443 () Bool)

(assert (=> b!1032910 m!953443))

(declare-fun m!953445 () Bool)

(assert (=> b!1032904 m!953445))

(declare-fun m!953447 () Bool)

(assert (=> b!1032904 m!953447))

(declare-fun m!953449 () Bool)

(assert (=> b!1032904 m!953449))

(declare-fun m!953451 () Bool)

(assert (=> b!1032904 m!953451))

(declare-fun m!953453 () Bool)

(assert (=> b!1032904 m!953453))

(assert (=> b!1032904 m!953451))

(declare-fun m!953455 () Bool)

(assert (=> b!1032904 m!953455))

(declare-fun m!953457 () Bool)

(assert (=> b!1032904 m!953457))

(declare-fun m!953459 () Bool)

(assert (=> b!1032904 m!953459))

(declare-fun m!953461 () Bool)

(assert (=> b!1032904 m!953461))

(declare-fun m!953463 () Bool)

(assert (=> b!1032904 m!953463))

(declare-fun m!953465 () Bool)

(assert (=> b!1032904 m!953465))

(declare-fun m!953467 () Bool)

(assert (=> b!1032904 m!953467))

(declare-fun m!953469 () Bool)

(assert (=> b!1032904 m!953469))

(assert (=> b!1032904 m!953463))

(declare-fun m!953471 () Bool)

(assert (=> b!1032904 m!953471))

(declare-fun m!953473 () Bool)

(assert (=> b!1032904 m!953473))

(declare-fun m!953475 () Bool)

(assert (=> b!1032904 m!953475))

(declare-fun m!953477 () Bool)

(assert (=> b!1032904 m!953477))

(declare-fun m!953479 () Bool)

(assert (=> b!1032904 m!953479))

(declare-fun m!953481 () Bool)

(assert (=> start!90298 m!953481))

(declare-fun m!953483 () Bool)

(assert (=> b!1032911 m!953483))

(declare-fun m!953485 () Bool)

(assert (=> b!1032903 m!953485))

(declare-fun m!953487 () Bool)

(assert (=> b!1032903 m!953487))

(declare-fun m!953489 () Bool)

(assert (=> b!1032907 m!953489))

(declare-fun m!953491 () Bool)

(assert (=> mapNonEmpty!38040 m!953491))

(check-sat (not b_lambda!16025) (not b!1032911) (not b!1032904) (not b!1032907) (not b!1032910) (not b_next!20671) (not b!1032908) b_and!33121 (not mapNonEmpty!38040) tp_is_empty!24391 (not start!90298) (not b!1032903))
(check-sat b_and!33121 (not b_next!20671))
