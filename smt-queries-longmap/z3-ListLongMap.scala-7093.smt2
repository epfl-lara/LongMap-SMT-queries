; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89970 () Bool)

(assert start!89970)

(declare-fun b!1030195 () Bool)

(declare-fun b_free!20611 () Bool)

(declare-fun b_next!20611 () Bool)

(assert (=> b!1030195 (= b_free!20611 (not b_next!20611))))

(declare-fun tp!72901 () Bool)

(declare-fun b_and!32957 () Bool)

(assert (=> b!1030195 (= tp!72901 b_and!32957)))

(declare-fun mapIsEmpty!37947 () Bool)

(declare-fun mapRes!37947 () Bool)

(assert (=> mapIsEmpty!37947 mapRes!37947))

(declare-fun res!688952 () Bool)

(declare-fun e!581728 () Bool)

(assert (=> start!89970 (=> (not res!688952) (not e!581728))))

(declare-datatypes ((V!37315 0))(
  ( (V!37316 (val!12216 Int)) )
))
(declare-datatypes ((ValueCell!11462 0))(
  ( (ValueCellFull!11462 (v!14792 V!37315)) (EmptyCell!11462) )
))
(declare-datatypes ((array!64663 0))(
  ( (array!64664 (arr!31134 (Array (_ BitVec 32) (_ BitVec 64))) (size!31653 (_ BitVec 32))) )
))
(declare-datatypes ((array!64665 0))(
  ( (array!64666 (arr!31135 (Array (_ BitVec 32) ValueCell!11462)) (size!31654 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5518 0))(
  ( (LongMapFixedSize!5519 (defaultEntry!6131 Int) (mask!29902 (_ BitVec 32)) (extraKeys!5863 (_ BitVec 32)) (zeroValue!5967 V!37315) (minValue!5967 V!37315) (_size!2814 (_ BitVec 32)) (_keys!11298 array!64663) (_values!6154 array!64665) (_vacant!2814 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5518)

(declare-fun valid!2081 (LongMapFixedSize!5518) Bool)

(assert (=> start!89970 (= res!688952 (valid!2081 thiss!1427))))

(assert (=> start!89970 e!581728))

(declare-fun e!581727 () Bool)

(assert (=> start!89970 e!581727))

(assert (=> start!89970 true))

(declare-fun b!1030192 () Bool)

(declare-fun e!581725 () Bool)

(declare-fun e!581721 () Bool)

(assert (=> b!1030192 (= e!581725 (and e!581721 mapRes!37947))))

(declare-fun condMapEmpty!37947 () Bool)

(declare-fun mapDefault!37947 () ValueCell!11462)

(assert (=> b!1030192 (= condMapEmpty!37947 (= (arr!31135 (_values!6154 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11462)) mapDefault!37947)))))

(declare-fun b!1030193 () Bool)

(declare-fun e!581723 () Bool)

(declare-fun tp_is_empty!24331 () Bool)

(assert (=> b!1030193 (= e!581723 tp_is_empty!24331)))

(declare-fun b!1030194 () Bool)

(declare-fun e!581722 () Bool)

(assert (=> b!1030194 (= e!581728 e!581722)))

(declare-fun res!688955 () Bool)

(assert (=> b!1030194 (=> (not res!688955) (not e!581722))))

(declare-datatypes ((SeekEntryResult!9678 0))(
  ( (MissingZero!9678 (index!41083 (_ BitVec 32))) (Found!9678 (index!41084 (_ BitVec 32))) (Intermediate!9678 (undefined!10490 Bool) (index!41085 (_ BitVec 32)) (x!91681 (_ BitVec 32))) (Undefined!9678) (MissingVacant!9678 (index!41086 (_ BitVec 32))) )
))
(declare-fun lt!454275 () SeekEntryResult!9678)

(get-info :version)

(assert (=> b!1030194 (= res!688955 ((_ is Found!9678) lt!454275))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64663 (_ BitVec 32)) SeekEntryResult!9678)

(assert (=> b!1030194 (= lt!454275 (seekEntry!0 key!909 (_keys!11298 thiss!1427) (mask!29902 thiss!1427)))))

(declare-fun mapNonEmpty!37947 () Bool)

(declare-fun tp!72900 () Bool)

(assert (=> mapNonEmpty!37947 (= mapRes!37947 (and tp!72900 e!581723))))

(declare-fun mapValue!37947 () ValueCell!11462)

(declare-fun mapKey!37947 () (_ BitVec 32))

(declare-fun mapRest!37947 () (Array (_ BitVec 32) ValueCell!11462))

(assert (=> mapNonEmpty!37947 (= (arr!31135 (_values!6154 thiss!1427)) (store mapRest!37947 mapKey!37947 mapValue!37947))))

(declare-fun array_inv!24103 (array!64663) Bool)

(declare-fun array_inv!24104 (array!64665) Bool)

(assert (=> b!1030195 (= e!581727 (and tp!72901 tp_is_empty!24331 (array_inv!24103 (_keys!11298 thiss!1427)) (array_inv!24104 (_values!6154 thiss!1427)) e!581725))))

(declare-fun b!1030196 () Bool)

(declare-fun res!688950 () Bool)

(declare-fun e!581726 () Bool)

(assert (=> b!1030196 (=> res!688950 e!581726)))

(declare-datatypes ((Unit!33543 0))(
  ( (Unit!33544) )
))
(declare-datatypes ((tuple2!15668 0))(
  ( (tuple2!15669 (_1!7845 Unit!33543) (_2!7845 LongMapFixedSize!5518)) )
))
(declare-fun lt!454281 () tuple2!15668)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64663 (_ BitVec 32)) Bool)

(assert (=> b!1030196 (= res!688950 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11298 (_2!7845 lt!454281)) (mask!29902 (_2!7845 lt!454281)))))))

(declare-fun b!1030197 () Bool)

(assert (=> b!1030197 (= e!581721 tp_is_empty!24331)))

(declare-fun b!1030198 () Bool)

(declare-datatypes ((List!21868 0))(
  ( (Nil!21865) (Cons!21864 (h!23066 (_ BitVec 64)) (t!30965 List!21868)) )
))
(declare-fun arrayNoDuplicates!0 (array!64663 (_ BitVec 32) List!21868) Bool)

(assert (=> b!1030198 (= e!581726 (arrayNoDuplicates!0 (_keys!11298 (_2!7845 lt!454281)) #b00000000000000000000000000000000 Nil!21865))))

(declare-fun b!1030199 () Bool)

(declare-fun res!688954 () Bool)

(assert (=> b!1030199 (=> (not res!688954) (not e!581728))))

(assert (=> b!1030199 (= res!688954 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1030200 () Bool)

(assert (=> b!1030200 (= e!581722 (not e!581726))))

(declare-fun res!688953 () Bool)

(assert (=> b!1030200 (=> res!688953 e!581726)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1030200 (= res!688953 (not (validMask!0 (mask!29902 (_2!7845 lt!454281)))))))

(declare-fun lt!454277 () array!64665)

(declare-fun lt!454274 () array!64663)

(declare-fun Unit!33545 () Unit!33543)

(declare-fun Unit!33546 () Unit!33543)

(assert (=> b!1030200 (= lt!454281 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2814 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15669 Unit!33545 (LongMapFixedSize!5519 (defaultEntry!6131 thiss!1427) (mask!29902 thiss!1427) (extraKeys!5863 thiss!1427) (zeroValue!5967 thiss!1427) (minValue!5967 thiss!1427) (bvsub (_size!2814 thiss!1427) #b00000000000000000000000000000001) lt!454274 lt!454277 (bvadd #b00000000000000000000000000000001 (_vacant!2814 thiss!1427)))) (tuple2!15669 Unit!33546 (LongMapFixedSize!5519 (defaultEntry!6131 thiss!1427) (mask!29902 thiss!1427) (extraKeys!5863 thiss!1427) (zeroValue!5967 thiss!1427) (minValue!5967 thiss!1427) (bvsub (_size!2814 thiss!1427) #b00000000000000000000000000000001) lt!454274 lt!454277 (_vacant!2814 thiss!1427)))))))

(declare-datatypes ((tuple2!15670 0))(
  ( (tuple2!15671 (_1!7846 (_ BitVec 64)) (_2!7846 V!37315)) )
))
(declare-datatypes ((List!21869 0))(
  ( (Nil!21866) (Cons!21865 (h!23067 tuple2!15670) (t!30966 List!21869)) )
))
(declare-datatypes ((ListLongMap!13769 0))(
  ( (ListLongMap!13770 (toList!6900 List!21869)) )
))
(declare-fun -!492 (ListLongMap!13769 (_ BitVec 64)) ListLongMap!13769)

(declare-fun getCurrentListMap!3867 (array!64663 array!64665 (_ BitVec 32) (_ BitVec 32) V!37315 V!37315 (_ BitVec 32) Int) ListLongMap!13769)

(assert (=> b!1030200 (= (-!492 (getCurrentListMap!3867 (_keys!11298 thiss!1427) (_values!6154 thiss!1427) (mask!29902 thiss!1427) (extraKeys!5863 thiss!1427) (zeroValue!5967 thiss!1427) (minValue!5967 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6131 thiss!1427)) key!909) (getCurrentListMap!3867 lt!454274 lt!454277 (mask!29902 thiss!1427) (extraKeys!5863 thiss!1427) (zeroValue!5967 thiss!1427) (minValue!5967 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6131 thiss!1427)))))

(declare-fun dynLambda!1954 (Int (_ BitVec 64)) V!37315)

(assert (=> b!1030200 (= lt!454277 (array!64666 (store (arr!31135 (_values!6154 thiss!1427)) (index!41084 lt!454275) (ValueCellFull!11462 (dynLambda!1954 (defaultEntry!6131 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31654 (_values!6154 thiss!1427))))))

(declare-fun lt!454282 () Unit!33543)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!17 (array!64663 array!64665 (_ BitVec 32) (_ BitVec 32) V!37315 V!37315 (_ BitVec 32) (_ BitVec 64) Int) Unit!33543)

(assert (=> b!1030200 (= lt!454282 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!17 (_keys!11298 thiss!1427) (_values!6154 thiss!1427) (mask!29902 thiss!1427) (extraKeys!5863 thiss!1427) (zeroValue!5967 thiss!1427) (minValue!5967 thiss!1427) (index!41084 lt!454275) key!909 (defaultEntry!6131 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64663 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1030200 (not (arrayContainsKey!0 lt!454274 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!454279 () Unit!33543)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64663 (_ BitVec 32) (_ BitVec 64)) Unit!33543)

(assert (=> b!1030200 (= lt!454279 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11298 thiss!1427) (index!41084 lt!454275) key!909))))

(assert (=> b!1030200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!454274 (mask!29902 thiss!1427))))

(declare-fun lt!454280 () Unit!33543)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64663 (_ BitVec 32) (_ BitVec 32)) Unit!33543)

(assert (=> b!1030200 (= lt!454280 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11298 thiss!1427) (index!41084 lt!454275) (mask!29902 thiss!1427)))))

(assert (=> b!1030200 (arrayNoDuplicates!0 lt!454274 #b00000000000000000000000000000000 Nil!21865)))

(declare-fun lt!454278 () Unit!33543)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64663 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21868) Unit!33543)

(assert (=> b!1030200 (= lt!454278 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11298 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41084 lt!454275) #b00000000000000000000000000000000 Nil!21865))))

(declare-fun arrayCountValidKeys!0 (array!64663 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1030200 (= (arrayCountValidKeys!0 lt!454274 #b00000000000000000000000000000000 (size!31653 (_keys!11298 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11298 thiss!1427) #b00000000000000000000000000000000 (size!31653 (_keys!11298 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1030200 (= lt!454274 (array!64664 (store (arr!31134 (_keys!11298 thiss!1427)) (index!41084 lt!454275) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31653 (_keys!11298 thiss!1427))))))

(declare-fun lt!454276 () Unit!33543)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64663 (_ BitVec 32) (_ BitVec 64)) Unit!33543)

(assert (=> b!1030200 (= lt!454276 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11298 thiss!1427) (index!41084 lt!454275) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1030201 () Bool)

(declare-fun res!688951 () Bool)

(assert (=> b!1030201 (=> res!688951 e!581726)))

(assert (=> b!1030201 (= res!688951 (or (not (= (size!31654 (_values!6154 (_2!7845 lt!454281))) (bvadd #b00000000000000000000000000000001 (mask!29902 (_2!7845 lt!454281))))) (not (= (size!31653 (_keys!11298 (_2!7845 lt!454281))) (size!31654 (_values!6154 (_2!7845 lt!454281))))) (bvslt (mask!29902 (_2!7845 lt!454281)) #b00000000000000000000000000000000) (bvslt (extraKeys!5863 (_2!7845 lt!454281)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5863 (_2!7845 lt!454281)) #b00000000000000000000000000000011)))))

(assert (= (and start!89970 res!688952) b!1030199))

(assert (= (and b!1030199 res!688954) b!1030194))

(assert (= (and b!1030194 res!688955) b!1030200))

(assert (= (and b!1030200 (not res!688953)) b!1030201))

(assert (= (and b!1030201 (not res!688951)) b!1030196))

(assert (= (and b!1030196 (not res!688950)) b!1030198))

(assert (= (and b!1030192 condMapEmpty!37947) mapIsEmpty!37947))

(assert (= (and b!1030192 (not condMapEmpty!37947)) mapNonEmpty!37947))

(assert (= (and mapNonEmpty!37947 ((_ is ValueCellFull!11462) mapValue!37947)) b!1030193))

(assert (= (and b!1030192 ((_ is ValueCellFull!11462) mapDefault!37947)) b!1030197))

(assert (= b!1030195 b!1030192))

(assert (= start!89970 b!1030195))

(declare-fun b_lambda!15919 () Bool)

(assert (=> (not b_lambda!15919) (not b!1030200)))

(declare-fun t!30964 () Bool)

(declare-fun tb!6921 () Bool)

(assert (=> (and b!1030195 (= (defaultEntry!6131 thiss!1427) (defaultEntry!6131 thiss!1427)) t!30964) tb!6921))

(declare-fun result!14177 () Bool)

(assert (=> tb!6921 (= result!14177 tp_is_empty!24331)))

(assert (=> b!1030200 t!30964))

(declare-fun b_and!32959 () Bool)

(assert (= b_and!32957 (and (=> t!30964 result!14177) b_and!32959)))

(declare-fun m!949425 () Bool)

(assert (=> b!1030194 m!949425))

(declare-fun m!949427 () Bool)

(assert (=> b!1030195 m!949427))

(declare-fun m!949429 () Bool)

(assert (=> b!1030195 m!949429))

(declare-fun m!949431 () Bool)

(assert (=> b!1030196 m!949431))

(declare-fun m!949433 () Bool)

(assert (=> b!1030200 m!949433))

(declare-fun m!949435 () Bool)

(assert (=> b!1030200 m!949435))

(declare-fun m!949437 () Bool)

(assert (=> b!1030200 m!949437))

(declare-fun m!949439 () Bool)

(assert (=> b!1030200 m!949439))

(declare-fun m!949441 () Bool)

(assert (=> b!1030200 m!949441))

(declare-fun m!949443 () Bool)

(assert (=> b!1030200 m!949443))

(declare-fun m!949445 () Bool)

(assert (=> b!1030200 m!949445))

(declare-fun m!949447 () Bool)

(assert (=> b!1030200 m!949447))

(declare-fun m!949449 () Bool)

(assert (=> b!1030200 m!949449))

(declare-fun m!949451 () Bool)

(assert (=> b!1030200 m!949451))

(declare-fun m!949453 () Bool)

(assert (=> b!1030200 m!949453))

(declare-fun m!949455 () Bool)

(assert (=> b!1030200 m!949455))

(declare-fun m!949457 () Bool)

(assert (=> b!1030200 m!949457))

(declare-fun m!949459 () Bool)

(assert (=> b!1030200 m!949459))

(declare-fun m!949461 () Bool)

(assert (=> b!1030200 m!949461))

(declare-fun m!949463 () Bool)

(assert (=> b!1030200 m!949463))

(declare-fun m!949465 () Bool)

(assert (=> b!1030200 m!949465))

(assert (=> b!1030200 m!949455))

(declare-fun m!949467 () Bool)

(assert (=> start!89970 m!949467))

(declare-fun m!949469 () Bool)

(assert (=> b!1030198 m!949469))

(declare-fun m!949471 () Bool)

(assert (=> mapNonEmpty!37947 m!949471))

(check-sat (not b!1030195) (not b!1030198) (not b!1030194) (not b!1030200) (not b!1030196) (not mapNonEmpty!37947) tp_is_empty!24331 b_and!32959 (not b_lambda!15919) (not start!89970) (not b_next!20611))
(check-sat b_and!32959 (not b_next!20611))
