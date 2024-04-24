; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92126 () Bool)

(assert start!92126)

(declare-fun b!1046553 () Bool)

(declare-fun b_free!21133 () Bool)

(declare-fun b_next!21133 () Bool)

(assert (=> b!1046553 (= b_free!21133 (not b_next!21133))))

(declare-fun tp!74654 () Bool)

(declare-fun b_and!33755 () Bool)

(assert (=> b!1046553 (= tp!74654 b_and!33755)))

(declare-fun mapIsEmpty!38918 () Bool)

(declare-fun mapRes!38918 () Bool)

(assert (=> mapIsEmpty!38918 mapRes!38918))

(declare-fun b!1046545 () Bool)

(declare-fun res!696512 () Bool)

(declare-fun e!593302 () Bool)

(assert (=> b!1046545 (=> (not res!696512) (not e!593302))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1046545 (= res!696512 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1046546 () Bool)

(declare-fun e!593304 () Bool)

(declare-fun tp_is_empty!24853 () Bool)

(assert (=> b!1046546 (= e!593304 tp_is_empty!24853)))

(declare-fun b!1046547 () Bool)

(declare-fun e!593305 () Bool)

(assert (=> b!1046547 (= e!593302 e!593305)))

(declare-fun res!696515 () Bool)

(assert (=> b!1046547 (=> (not res!696515) (not e!593305))))

(declare-datatypes ((SeekEntryResult!9803 0))(
  ( (MissingZero!9803 (index!41583 (_ BitVec 32))) (Found!9803 (index!41584 (_ BitVec 32))) (Intermediate!9803 (undefined!10615 Bool) (index!41585 (_ BitVec 32)) (x!93335 (_ BitVec 32))) (Undefined!9803) (MissingVacant!9803 (index!41586 (_ BitVec 32))) )
))
(declare-fun lt!461864 () SeekEntryResult!9803)

(get-info :version)

(assert (=> b!1046547 (= res!696515 ((_ is Found!9803) lt!461864))))

(declare-datatypes ((V!38011 0))(
  ( (V!38012 (val!12477 Int)) )
))
(declare-datatypes ((ValueCell!11723 0))(
  ( (ValueCellFull!11723 (v!15068 V!38011)) (EmptyCell!11723) )
))
(declare-datatypes ((array!65929 0))(
  ( (array!65930 (arr!31705 (Array (_ BitVec 32) (_ BitVec 64))) (size!32241 (_ BitVec 32))) )
))
(declare-datatypes ((array!65931 0))(
  ( (array!65932 (arr!31706 (Array (_ BitVec 32) ValueCell!11723)) (size!32242 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6040 0))(
  ( (LongMapFixedSize!6041 (defaultEntry!6414 Int) (mask!30599 (_ BitVec 32)) (extraKeys!6142 (_ BitVec 32)) (zeroValue!6248 V!38011) (minValue!6248 V!38011) (_size!3075 (_ BitVec 32)) (_keys!11722 array!65929) (_values!6437 array!65931) (_vacant!3075 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6040)

(declare-fun seekEntry!0 ((_ BitVec 64) array!65929 (_ BitVec 32)) SeekEntryResult!9803)

(assert (=> b!1046547 (= lt!461864 (seekEntry!0 key!909 (_keys!11722 thiss!1427) (mask!30599 thiss!1427)))))

(declare-fun b!1046548 () Bool)

(declare-fun res!696513 () Bool)

(declare-fun e!593303 () Bool)

(assert (=> b!1046548 (=> res!696513 e!593303)))

(declare-datatypes ((Unit!34155 0))(
  ( (Unit!34156) )
))
(declare-datatypes ((tuple2!15784 0))(
  ( (tuple2!15785 (_1!7903 Unit!34155) (_2!7903 LongMapFixedSize!6040)) )
))
(declare-fun lt!461862 () tuple2!15784)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1046548 (= res!696513 (not (validMask!0 (mask!30599 (_2!7903 lt!461862)))))))

(declare-fun b!1046549 () Bool)

(declare-fun e!593306 () Bool)

(assert (=> b!1046549 (= e!593306 (and e!593304 mapRes!38918))))

(declare-fun condMapEmpty!38918 () Bool)

(declare-fun mapDefault!38918 () ValueCell!11723)

(assert (=> b!1046549 (= condMapEmpty!38918 (= (arr!31706 (_values!6437 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11723)) mapDefault!38918)))))

(declare-fun b!1046550 () Bool)

(declare-fun e!593308 () Bool)

(assert (=> b!1046550 (= e!593308 tp_is_empty!24853)))

(declare-fun mapNonEmpty!38918 () Bool)

(declare-fun tp!74655 () Bool)

(assert (=> mapNonEmpty!38918 (= mapRes!38918 (and tp!74655 e!593308))))

(declare-fun mapValue!38918 () ValueCell!11723)

(declare-fun mapKey!38918 () (_ BitVec 32))

(declare-fun mapRest!38918 () (Array (_ BitVec 32) ValueCell!11723))

(assert (=> mapNonEmpty!38918 (= (arr!31706 (_values!6437 thiss!1427)) (store mapRest!38918 mapKey!38918 mapValue!38918))))

(declare-fun b!1046551 () Bool)

(assert (=> b!1046551 (= e!593305 (not e!593303))))

(declare-fun res!696514 () Bool)

(assert (=> b!1046551 (=> res!696514 e!593303)))

(declare-datatypes ((tuple2!15786 0))(
  ( (tuple2!15787 (_1!7904 (_ BitVec 64)) (_2!7904 V!38011)) )
))
(declare-datatypes ((List!22009 0))(
  ( (Nil!22006) (Cons!22005 (h!23222 tuple2!15786) (t!31261 List!22009)) )
))
(declare-datatypes ((ListLongMap!13797 0))(
  ( (ListLongMap!13798 (toList!6914 List!22009)) )
))
(declare-fun contains!6107 (ListLongMap!13797 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3958 (array!65929 array!65931 (_ BitVec 32) (_ BitVec 32) V!38011 V!38011 (_ BitVec 32) Int) ListLongMap!13797)

(assert (=> b!1046551 (= res!696514 (not (contains!6107 (getCurrentListMap!3958 (_keys!11722 (_2!7903 lt!461862)) (_values!6437 (_2!7903 lt!461862)) (mask!30599 (_2!7903 lt!461862)) (extraKeys!6142 (_2!7903 lt!461862)) (zeroValue!6248 (_2!7903 lt!461862)) (minValue!6248 (_2!7903 lt!461862)) #b00000000000000000000000000000000 (defaultEntry!6414 (_2!7903 lt!461862))) key!909)))))

(declare-fun lt!461868 () array!65929)

(declare-fun lt!461869 () array!65931)

(declare-fun Unit!34157 () Unit!34155)

(declare-fun Unit!34158 () Unit!34155)

(assert (=> b!1046551 (= lt!461862 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3075 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15785 Unit!34157 (LongMapFixedSize!6041 (defaultEntry!6414 thiss!1427) (mask!30599 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) (bvsub (_size!3075 thiss!1427) #b00000000000000000000000000000001) lt!461868 lt!461869 (bvadd #b00000000000000000000000000000001 (_vacant!3075 thiss!1427)))) (tuple2!15785 Unit!34158 (LongMapFixedSize!6041 (defaultEntry!6414 thiss!1427) (mask!30599 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) (bvsub (_size!3075 thiss!1427) #b00000000000000000000000000000001) lt!461868 lt!461869 (_vacant!3075 thiss!1427)))))))

(declare-fun -!537 (ListLongMap!13797 (_ BitVec 64)) ListLongMap!13797)

(assert (=> b!1046551 (= (-!537 (getCurrentListMap!3958 (_keys!11722 thiss!1427) (_values!6437 thiss!1427) (mask!30599 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6414 thiss!1427)) key!909) (getCurrentListMap!3958 lt!461868 lt!461869 (mask!30599 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6414 thiss!1427)))))

(declare-fun dynLambda!2029 (Int (_ BitVec 64)) V!38011)

(assert (=> b!1046551 (= lt!461869 (array!65932 (store (arr!31706 (_values!6437 thiss!1427)) (index!41584 lt!461864) (ValueCellFull!11723 (dynLambda!2029 (defaultEntry!6414 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32242 (_values!6437 thiss!1427))))))

(declare-fun lt!461863 () Unit!34155)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!59 (array!65929 array!65931 (_ BitVec 32) (_ BitVec 32) V!38011 V!38011 (_ BitVec 32) (_ BitVec 64) Int) Unit!34155)

(assert (=> b!1046551 (= lt!461863 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!59 (_keys!11722 thiss!1427) (_values!6437 thiss!1427) (mask!30599 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) (index!41584 lt!461864) key!909 (defaultEntry!6414 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65929 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1046551 (not (arrayContainsKey!0 lt!461868 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!461866 () Unit!34155)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65929 (_ BitVec 32) (_ BitVec 64)) Unit!34155)

(assert (=> b!1046551 (= lt!461866 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11722 thiss!1427) (index!41584 lt!461864) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65929 (_ BitVec 32)) Bool)

(assert (=> b!1046551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!461868 (mask!30599 thiss!1427))))

(declare-fun lt!461861 () Unit!34155)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65929 (_ BitVec 32) (_ BitVec 32)) Unit!34155)

(assert (=> b!1046551 (= lt!461861 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11722 thiss!1427) (index!41584 lt!461864) (mask!30599 thiss!1427)))))

(declare-datatypes ((List!22010 0))(
  ( (Nil!22007) (Cons!22006 (h!23223 (_ BitVec 64)) (t!31262 List!22010)) )
))
(declare-fun arrayNoDuplicates!0 (array!65929 (_ BitVec 32) List!22010) Bool)

(assert (=> b!1046551 (arrayNoDuplicates!0 lt!461868 #b00000000000000000000000000000000 Nil!22007)))

(declare-fun lt!461865 () Unit!34155)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65929 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22010) Unit!34155)

(assert (=> b!1046551 (= lt!461865 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11722 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41584 lt!461864) #b00000000000000000000000000000000 Nil!22007))))

(declare-fun arrayCountValidKeys!0 (array!65929 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1046551 (= (arrayCountValidKeys!0 lt!461868 #b00000000000000000000000000000000 (size!32241 (_keys!11722 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11722 thiss!1427) #b00000000000000000000000000000000 (size!32241 (_keys!11722 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1046551 (= lt!461868 (array!65930 (store (arr!31705 (_keys!11722 thiss!1427)) (index!41584 lt!461864) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32241 (_keys!11722 thiss!1427))))))

(declare-fun lt!461867 () Unit!34155)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65929 (_ BitVec 32) (_ BitVec 64)) Unit!34155)

(assert (=> b!1046551 (= lt!461867 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11722 thiss!1427) (index!41584 lt!461864) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!696516 () Bool)

(assert (=> start!92126 (=> (not res!696516) (not e!593302))))

(declare-fun valid!2272 (LongMapFixedSize!6040) Bool)

(assert (=> start!92126 (= res!696516 (valid!2272 thiss!1427))))

(assert (=> start!92126 e!593302))

(declare-fun e!593307 () Bool)

(assert (=> start!92126 e!593307))

(assert (=> start!92126 true))

(declare-fun b!1046552 () Bool)

(assert (=> b!1046552 (= e!593303 (or (not (= (size!32242 (_values!6437 (_2!7903 lt!461862))) (bvadd #b00000000000000000000000000000001 (mask!30599 (_2!7903 lt!461862))))) (not (= (size!32241 (_keys!11722 (_2!7903 lt!461862))) (size!32242 (_values!6437 (_2!7903 lt!461862))))) (bvslt (mask!30599 (_2!7903 lt!461862)) #b00000000000000000000000000000000) (bvsge (extraKeys!6142 (_2!7903 lt!461862)) #b00000000000000000000000000000000)))))

(declare-fun array_inv!24501 (array!65929) Bool)

(declare-fun array_inv!24502 (array!65931) Bool)

(assert (=> b!1046553 (= e!593307 (and tp!74654 tp_is_empty!24853 (array_inv!24501 (_keys!11722 thiss!1427)) (array_inv!24502 (_values!6437 thiss!1427)) e!593306))))

(assert (= (and start!92126 res!696516) b!1046545))

(assert (= (and b!1046545 res!696512) b!1046547))

(assert (= (and b!1046547 res!696515) b!1046551))

(assert (= (and b!1046551 (not res!696514)) b!1046548))

(assert (= (and b!1046548 (not res!696513)) b!1046552))

(assert (= (and b!1046549 condMapEmpty!38918) mapIsEmpty!38918))

(assert (= (and b!1046549 (not condMapEmpty!38918)) mapNonEmpty!38918))

(assert (= (and mapNonEmpty!38918 ((_ is ValueCellFull!11723) mapValue!38918)) b!1046550))

(assert (= (and b!1046549 ((_ is ValueCellFull!11723) mapDefault!38918)) b!1046546))

(assert (= b!1046553 b!1046549))

(assert (= start!92126 b!1046553))

(declare-fun b_lambda!16295 () Bool)

(assert (=> (not b_lambda!16295) (not b!1046551)))

(declare-fun t!31260 () Bool)

(declare-fun tb!7073 () Bool)

(assert (=> (and b!1046553 (= (defaultEntry!6414 thiss!1427) (defaultEntry!6414 thiss!1427)) t!31260) tb!7073))

(declare-fun result!14579 () Bool)

(assert (=> tb!7073 (= result!14579 tp_is_empty!24853)))

(assert (=> b!1046551 t!31260))

(declare-fun b_and!33757 () Bool)

(assert (= b_and!33755 (and (=> t!31260 result!14579) b_and!33757)))

(declare-fun m!966535 () Bool)

(assert (=> b!1046548 m!966535))

(declare-fun m!966537 () Bool)

(assert (=> b!1046553 m!966537))

(declare-fun m!966539 () Bool)

(assert (=> b!1046553 m!966539))

(declare-fun m!966541 () Bool)

(assert (=> mapNonEmpty!38918 m!966541))

(declare-fun m!966543 () Bool)

(assert (=> b!1046551 m!966543))

(declare-fun m!966545 () Bool)

(assert (=> b!1046551 m!966545))

(declare-fun m!966547 () Bool)

(assert (=> b!1046551 m!966547))

(declare-fun m!966549 () Bool)

(assert (=> b!1046551 m!966549))

(declare-fun m!966551 () Bool)

(assert (=> b!1046551 m!966551))

(declare-fun m!966553 () Bool)

(assert (=> b!1046551 m!966553))

(declare-fun m!966555 () Bool)

(assert (=> b!1046551 m!966555))

(assert (=> b!1046551 m!966553))

(declare-fun m!966557 () Bool)

(assert (=> b!1046551 m!966557))

(declare-fun m!966559 () Bool)

(assert (=> b!1046551 m!966559))

(declare-fun m!966561 () Bool)

(assert (=> b!1046551 m!966561))

(declare-fun m!966563 () Bool)

(assert (=> b!1046551 m!966563))

(declare-fun m!966565 () Bool)

(assert (=> b!1046551 m!966565))

(declare-fun m!966567 () Bool)

(assert (=> b!1046551 m!966567))

(declare-fun m!966569 () Bool)

(assert (=> b!1046551 m!966569))

(declare-fun m!966571 () Bool)

(assert (=> b!1046551 m!966571))

(assert (=> b!1046551 m!966569))

(declare-fun m!966573 () Bool)

(assert (=> b!1046551 m!966573))

(declare-fun m!966575 () Bool)

(assert (=> b!1046551 m!966575))

(declare-fun m!966577 () Bool)

(assert (=> b!1046551 m!966577))

(declare-fun m!966579 () Bool)

(assert (=> b!1046547 m!966579))

(declare-fun m!966581 () Bool)

(assert (=> start!92126 m!966581))

(check-sat (not b!1046551) (not b!1046548) (not b!1046547) tp_is_empty!24853 (not b!1046553) (not mapNonEmpty!38918) (not start!92126) b_and!33757 (not b_lambda!16295) (not b_next!21133))
(check-sat b_and!33757 (not b_next!21133))
(get-model)

(declare-fun b_lambda!16301 () Bool)

(assert (= b_lambda!16295 (or (and b!1046553 b_free!21133) b_lambda!16301)))

(check-sat (not b!1046551) (not b_lambda!16301) (not b!1046548) (not b_next!21133) (not b!1046547) tp_is_empty!24853 (not b!1046553) (not mapNonEmpty!38918) (not start!92126) b_and!33757)
(check-sat b_and!33757 (not b_next!21133))
(get-model)

(declare-fun d!126963 () Bool)

(assert (=> d!126963 (= (validMask!0 (mask!30599 (_2!7903 lt!461862))) (and (or (= (mask!30599 (_2!7903 lt!461862)) #b00000000000000000000000000000111) (= (mask!30599 (_2!7903 lt!461862)) #b00000000000000000000000000001111) (= (mask!30599 (_2!7903 lt!461862)) #b00000000000000000000000000011111) (= (mask!30599 (_2!7903 lt!461862)) #b00000000000000000000000000111111) (= (mask!30599 (_2!7903 lt!461862)) #b00000000000000000000000001111111) (= (mask!30599 (_2!7903 lt!461862)) #b00000000000000000000000011111111) (= (mask!30599 (_2!7903 lt!461862)) #b00000000000000000000000111111111) (= (mask!30599 (_2!7903 lt!461862)) #b00000000000000000000001111111111) (= (mask!30599 (_2!7903 lt!461862)) #b00000000000000000000011111111111) (= (mask!30599 (_2!7903 lt!461862)) #b00000000000000000000111111111111) (= (mask!30599 (_2!7903 lt!461862)) #b00000000000000000001111111111111) (= (mask!30599 (_2!7903 lt!461862)) #b00000000000000000011111111111111) (= (mask!30599 (_2!7903 lt!461862)) #b00000000000000000111111111111111) (= (mask!30599 (_2!7903 lt!461862)) #b00000000000000001111111111111111) (= (mask!30599 (_2!7903 lt!461862)) #b00000000000000011111111111111111) (= (mask!30599 (_2!7903 lt!461862)) #b00000000000000111111111111111111) (= (mask!30599 (_2!7903 lt!461862)) #b00000000000001111111111111111111) (= (mask!30599 (_2!7903 lt!461862)) #b00000000000011111111111111111111) (= (mask!30599 (_2!7903 lt!461862)) #b00000000000111111111111111111111) (= (mask!30599 (_2!7903 lt!461862)) #b00000000001111111111111111111111) (= (mask!30599 (_2!7903 lt!461862)) #b00000000011111111111111111111111) (= (mask!30599 (_2!7903 lt!461862)) #b00000000111111111111111111111111) (= (mask!30599 (_2!7903 lt!461862)) #b00000001111111111111111111111111) (= (mask!30599 (_2!7903 lt!461862)) #b00000011111111111111111111111111) (= (mask!30599 (_2!7903 lt!461862)) #b00000111111111111111111111111111) (= (mask!30599 (_2!7903 lt!461862)) #b00001111111111111111111111111111) (= (mask!30599 (_2!7903 lt!461862)) #b00011111111111111111111111111111) (= (mask!30599 (_2!7903 lt!461862)) #b00111111111111111111111111111111)) (bvsle (mask!30599 (_2!7903 lt!461862)) #b00111111111111111111111111111111)))))

(assert (=> b!1046548 d!126963))

(declare-fun d!126965 () Bool)

(assert (=> d!126965 (= (array_inv!24501 (_keys!11722 thiss!1427)) (bvsge (size!32241 (_keys!11722 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1046553 d!126965))

(declare-fun d!126967 () Bool)

(assert (=> d!126967 (= (array_inv!24502 (_values!6437 thiss!1427)) (bvsge (size!32242 (_values!6437 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1046553 d!126967))

(declare-fun d!126969 () Bool)

(declare-fun res!696553 () Bool)

(declare-fun e!593359 () Bool)

(assert (=> d!126969 (=> (not res!696553) (not e!593359))))

(declare-fun simpleValid!452 (LongMapFixedSize!6040) Bool)

(assert (=> d!126969 (= res!696553 (simpleValid!452 thiss!1427))))

(assert (=> d!126969 (= (valid!2272 thiss!1427) e!593359)))

(declare-fun b!1046620 () Bool)

(declare-fun res!696554 () Bool)

(assert (=> b!1046620 (=> (not res!696554) (not e!593359))))

(assert (=> b!1046620 (= res!696554 (= (arrayCountValidKeys!0 (_keys!11722 thiss!1427) #b00000000000000000000000000000000 (size!32241 (_keys!11722 thiss!1427))) (_size!3075 thiss!1427)))))

(declare-fun b!1046621 () Bool)

(declare-fun res!696555 () Bool)

(assert (=> b!1046621 (=> (not res!696555) (not e!593359))))

(assert (=> b!1046621 (= res!696555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11722 thiss!1427) (mask!30599 thiss!1427)))))

(declare-fun b!1046622 () Bool)

(assert (=> b!1046622 (= e!593359 (arrayNoDuplicates!0 (_keys!11722 thiss!1427) #b00000000000000000000000000000000 Nil!22007))))

(assert (= (and d!126969 res!696553) b!1046620))

(assert (= (and b!1046620 res!696554) b!1046621))

(assert (= (and b!1046621 res!696555) b!1046622))

(declare-fun m!966679 () Bool)

(assert (=> d!126969 m!966679))

(assert (=> b!1046620 m!966549))

(declare-fun m!966681 () Bool)

(assert (=> b!1046621 m!966681))

(declare-fun m!966683 () Bool)

(assert (=> b!1046622 m!966683))

(assert (=> start!92126 d!126969))

(declare-fun d!126971 () Bool)

(declare-fun e!593362 () Bool)

(assert (=> d!126971 e!593362))

(declare-fun res!696558 () Bool)

(assert (=> d!126971 (=> (not res!696558) (not e!593362))))

(assert (=> d!126971 (= res!696558 (and (bvsge (index!41584 lt!461864) #b00000000000000000000000000000000) (bvslt (index!41584 lt!461864) (size!32241 (_keys!11722 thiss!1427)))))))

(declare-fun lt!461926 () Unit!34155)

(declare-fun choose!53 (array!65929 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22010) Unit!34155)

(assert (=> d!126971 (= lt!461926 (choose!53 (_keys!11722 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41584 lt!461864) #b00000000000000000000000000000000 Nil!22007))))

(assert (=> d!126971 (bvslt (size!32241 (_keys!11722 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126971 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11722 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41584 lt!461864) #b00000000000000000000000000000000 Nil!22007) lt!461926)))

(declare-fun b!1046625 () Bool)

(assert (=> b!1046625 (= e!593362 (arrayNoDuplicates!0 (array!65930 (store (arr!31705 (_keys!11722 thiss!1427)) (index!41584 lt!461864) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32241 (_keys!11722 thiss!1427))) #b00000000000000000000000000000000 Nil!22007))))

(assert (= (and d!126971 res!696558) b!1046625))

(declare-fun m!966685 () Bool)

(assert (=> d!126971 m!966685))

(assert (=> b!1046625 m!966575))

(declare-fun m!966687 () Bool)

(assert (=> b!1046625 m!966687))

(assert (=> b!1046551 d!126971))

(declare-fun d!126973 () Bool)

(declare-fun e!593367 () Bool)

(assert (=> d!126973 e!593367))

(declare-fun res!696561 () Bool)

(assert (=> d!126973 (=> res!696561 e!593367)))

(declare-fun lt!461938 () Bool)

(assert (=> d!126973 (= res!696561 (not lt!461938))))

(declare-fun lt!461936 () Bool)

(assert (=> d!126973 (= lt!461938 lt!461936)))

(declare-fun lt!461935 () Unit!34155)

(declare-fun e!593368 () Unit!34155)

(assert (=> d!126973 (= lt!461935 e!593368)))

(declare-fun c!106663 () Bool)

(assert (=> d!126973 (= c!106663 lt!461936)))

(declare-fun containsKey!571 (List!22009 (_ BitVec 64)) Bool)

(assert (=> d!126973 (= lt!461936 (containsKey!571 (toList!6914 (getCurrentListMap!3958 (_keys!11722 (_2!7903 lt!461862)) (_values!6437 (_2!7903 lt!461862)) (mask!30599 (_2!7903 lt!461862)) (extraKeys!6142 (_2!7903 lt!461862)) (zeroValue!6248 (_2!7903 lt!461862)) (minValue!6248 (_2!7903 lt!461862)) #b00000000000000000000000000000000 (defaultEntry!6414 (_2!7903 lt!461862)))) key!909))))

(assert (=> d!126973 (= (contains!6107 (getCurrentListMap!3958 (_keys!11722 (_2!7903 lt!461862)) (_values!6437 (_2!7903 lt!461862)) (mask!30599 (_2!7903 lt!461862)) (extraKeys!6142 (_2!7903 lt!461862)) (zeroValue!6248 (_2!7903 lt!461862)) (minValue!6248 (_2!7903 lt!461862)) #b00000000000000000000000000000000 (defaultEntry!6414 (_2!7903 lt!461862))) key!909) lt!461938)))

(declare-fun b!1046632 () Bool)

(declare-fun lt!461937 () Unit!34155)

(assert (=> b!1046632 (= e!593368 lt!461937)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!402 (List!22009 (_ BitVec 64)) Unit!34155)

(assert (=> b!1046632 (= lt!461937 (lemmaContainsKeyImpliesGetValueByKeyDefined!402 (toList!6914 (getCurrentListMap!3958 (_keys!11722 (_2!7903 lt!461862)) (_values!6437 (_2!7903 lt!461862)) (mask!30599 (_2!7903 lt!461862)) (extraKeys!6142 (_2!7903 lt!461862)) (zeroValue!6248 (_2!7903 lt!461862)) (minValue!6248 (_2!7903 lt!461862)) #b00000000000000000000000000000000 (defaultEntry!6414 (_2!7903 lt!461862)))) key!909))))

(declare-datatypes ((Option!641 0))(
  ( (Some!640 (v!15071 V!38011)) (None!639) )
))
(declare-fun isDefined!440 (Option!641) Bool)

(declare-fun getValueByKey!590 (List!22009 (_ BitVec 64)) Option!641)

(assert (=> b!1046632 (isDefined!440 (getValueByKey!590 (toList!6914 (getCurrentListMap!3958 (_keys!11722 (_2!7903 lt!461862)) (_values!6437 (_2!7903 lt!461862)) (mask!30599 (_2!7903 lt!461862)) (extraKeys!6142 (_2!7903 lt!461862)) (zeroValue!6248 (_2!7903 lt!461862)) (minValue!6248 (_2!7903 lt!461862)) #b00000000000000000000000000000000 (defaultEntry!6414 (_2!7903 lt!461862)))) key!909))))

(declare-fun b!1046633 () Bool)

(declare-fun Unit!34161 () Unit!34155)

(assert (=> b!1046633 (= e!593368 Unit!34161)))

(declare-fun b!1046634 () Bool)

(assert (=> b!1046634 (= e!593367 (isDefined!440 (getValueByKey!590 (toList!6914 (getCurrentListMap!3958 (_keys!11722 (_2!7903 lt!461862)) (_values!6437 (_2!7903 lt!461862)) (mask!30599 (_2!7903 lt!461862)) (extraKeys!6142 (_2!7903 lt!461862)) (zeroValue!6248 (_2!7903 lt!461862)) (minValue!6248 (_2!7903 lt!461862)) #b00000000000000000000000000000000 (defaultEntry!6414 (_2!7903 lt!461862)))) key!909)))))

(assert (= (and d!126973 c!106663) b!1046632))

(assert (= (and d!126973 (not c!106663)) b!1046633))

(assert (= (and d!126973 (not res!696561)) b!1046634))

(declare-fun m!966689 () Bool)

(assert (=> d!126973 m!966689))

(declare-fun m!966691 () Bool)

(assert (=> b!1046632 m!966691))

(declare-fun m!966693 () Bool)

(assert (=> b!1046632 m!966693))

(assert (=> b!1046632 m!966693))

(declare-fun m!966695 () Bool)

(assert (=> b!1046632 m!966695))

(assert (=> b!1046634 m!966693))

(assert (=> b!1046634 m!966693))

(assert (=> b!1046634 m!966695))

(assert (=> b!1046551 d!126973))

(declare-fun b!1046677 () Bool)

(declare-fun e!593395 () ListLongMap!13797)

(declare-fun call!44565 () ListLongMap!13797)

(assert (=> b!1046677 (= e!593395 call!44565)))

(declare-fun b!1046678 () Bool)

(declare-fun e!593397 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1046678 (= e!593397 (validKeyInArray!0 (select (arr!31705 (_keys!11722 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1046679 () Bool)

(declare-fun e!593405 () Unit!34155)

(declare-fun Unit!34162 () Unit!34155)

(assert (=> b!1046679 (= e!593405 Unit!34162)))

(declare-fun b!1046680 () Bool)

(declare-fun e!593401 () Bool)

(declare-fun e!593402 () Bool)

(assert (=> b!1046680 (= e!593401 e!593402)))

(declare-fun res!696580 () Bool)

(declare-fun call!44562 () Bool)

(assert (=> b!1046680 (= res!696580 call!44562)))

(assert (=> b!1046680 (=> (not res!696580) (not e!593402))))

(declare-fun b!1046681 () Bool)

(declare-fun e!593403 () Bool)

(declare-fun e!593398 () Bool)

(assert (=> b!1046681 (= e!593403 e!593398)))

(declare-fun res!696583 () Bool)

(declare-fun call!44561 () Bool)

(assert (=> b!1046681 (= res!696583 call!44561)))

(assert (=> b!1046681 (=> (not res!696583) (not e!593398))))

(declare-fun bm!44557 () Bool)

(declare-fun lt!461993 () ListLongMap!13797)

(assert (=> bm!44557 (= call!44561 (contains!6107 lt!461993 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!44558 () Bool)

(assert (=> bm!44558 (= call!44562 (contains!6107 lt!461993 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1046682 () Bool)

(declare-fun lt!462000 () Unit!34155)

(assert (=> b!1046682 (= e!593405 lt!462000)))

(declare-fun lt!461995 () ListLongMap!13797)

(declare-fun getCurrentListMapNoExtraKeys!3574 (array!65929 array!65931 (_ BitVec 32) (_ BitVec 32) V!38011 V!38011 (_ BitVec 32) Int) ListLongMap!13797)

(assert (=> b!1046682 (= lt!461995 (getCurrentListMapNoExtraKeys!3574 (_keys!11722 thiss!1427) (_values!6437 thiss!1427) (mask!30599 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6414 thiss!1427)))))

(declare-fun lt!461994 () (_ BitVec 64))

(assert (=> b!1046682 (= lt!461994 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461996 () (_ BitVec 64))

(assert (=> b!1046682 (= lt!461996 (select (arr!31705 (_keys!11722 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!461990 () Unit!34155)

(declare-fun addStillContains!633 (ListLongMap!13797 (_ BitVec 64) V!38011 (_ BitVec 64)) Unit!34155)

(assert (=> b!1046682 (= lt!461990 (addStillContains!633 lt!461995 lt!461994 (zeroValue!6248 thiss!1427) lt!461996))))

(declare-fun +!3134 (ListLongMap!13797 tuple2!15786) ListLongMap!13797)

(assert (=> b!1046682 (contains!6107 (+!3134 lt!461995 (tuple2!15787 lt!461994 (zeroValue!6248 thiss!1427))) lt!461996)))

(declare-fun lt!461997 () Unit!34155)

(assert (=> b!1046682 (= lt!461997 lt!461990)))

(declare-fun lt!461999 () ListLongMap!13797)

(assert (=> b!1046682 (= lt!461999 (getCurrentListMapNoExtraKeys!3574 (_keys!11722 thiss!1427) (_values!6437 thiss!1427) (mask!30599 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6414 thiss!1427)))))

(declare-fun lt!461983 () (_ BitVec 64))

(assert (=> b!1046682 (= lt!461983 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461992 () (_ BitVec 64))

(assert (=> b!1046682 (= lt!461992 (select (arr!31705 (_keys!11722 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!461984 () Unit!34155)

(declare-fun addApplyDifferent!489 (ListLongMap!13797 (_ BitVec 64) V!38011 (_ BitVec 64)) Unit!34155)

(assert (=> b!1046682 (= lt!461984 (addApplyDifferent!489 lt!461999 lt!461983 (minValue!6248 thiss!1427) lt!461992))))

(declare-fun apply!923 (ListLongMap!13797 (_ BitVec 64)) V!38011)

(assert (=> b!1046682 (= (apply!923 (+!3134 lt!461999 (tuple2!15787 lt!461983 (minValue!6248 thiss!1427))) lt!461992) (apply!923 lt!461999 lt!461992))))

(declare-fun lt!461998 () Unit!34155)

(assert (=> b!1046682 (= lt!461998 lt!461984)))

(declare-fun lt!461985 () ListLongMap!13797)

(assert (=> b!1046682 (= lt!461985 (getCurrentListMapNoExtraKeys!3574 (_keys!11722 thiss!1427) (_values!6437 thiss!1427) (mask!30599 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6414 thiss!1427)))))

(declare-fun lt!462003 () (_ BitVec 64))

(assert (=> b!1046682 (= lt!462003 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461989 () (_ BitVec 64))

(assert (=> b!1046682 (= lt!461989 (select (arr!31705 (_keys!11722 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!462004 () Unit!34155)

(assert (=> b!1046682 (= lt!462004 (addApplyDifferent!489 lt!461985 lt!462003 (zeroValue!6248 thiss!1427) lt!461989))))

(assert (=> b!1046682 (= (apply!923 (+!3134 lt!461985 (tuple2!15787 lt!462003 (zeroValue!6248 thiss!1427))) lt!461989) (apply!923 lt!461985 lt!461989))))

(declare-fun lt!461986 () Unit!34155)

(assert (=> b!1046682 (= lt!461986 lt!462004)))

(declare-fun lt!461987 () ListLongMap!13797)

(assert (=> b!1046682 (= lt!461987 (getCurrentListMapNoExtraKeys!3574 (_keys!11722 thiss!1427) (_values!6437 thiss!1427) (mask!30599 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6414 thiss!1427)))))

(declare-fun lt!461988 () (_ BitVec 64))

(assert (=> b!1046682 (= lt!461988 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!462002 () (_ BitVec 64))

(assert (=> b!1046682 (= lt!462002 (select (arr!31705 (_keys!11722 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1046682 (= lt!462000 (addApplyDifferent!489 lt!461987 lt!461988 (minValue!6248 thiss!1427) lt!462002))))

(assert (=> b!1046682 (= (apply!923 (+!3134 lt!461987 (tuple2!15787 lt!461988 (minValue!6248 thiss!1427))) lt!462002) (apply!923 lt!461987 lt!462002))))

(declare-fun b!1046683 () Bool)

(assert (=> b!1046683 (= e!593403 (not call!44561))))

(declare-fun b!1046684 () Bool)

(declare-fun res!696588 () Bool)

(declare-fun e!593400 () Bool)

(assert (=> b!1046684 (=> (not res!696588) (not e!593400))))

(assert (=> b!1046684 (= res!696588 e!593401)))

(declare-fun c!106681 () Bool)

(assert (=> b!1046684 (= c!106681 (not (= (bvand (extraKeys!6142 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1046685 () Bool)

(declare-fun e!593399 () ListLongMap!13797)

(declare-fun call!44564 () ListLongMap!13797)

(assert (=> b!1046685 (= e!593399 (+!3134 call!44564 (tuple2!15787 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6248 thiss!1427))))))

(declare-fun b!1046686 () Bool)

(assert (=> b!1046686 (= e!593401 (not call!44562))))

(declare-fun b!1046687 () Bool)

(declare-fun e!593396 () Bool)

(declare-fun get!16588 (ValueCell!11723 V!38011) V!38011)

(assert (=> b!1046687 (= e!593396 (= (apply!923 lt!461993 (select (arr!31705 (_keys!11722 thiss!1427)) #b00000000000000000000000000000000)) (get!16588 (select (arr!31706 (_values!6437 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2029 (defaultEntry!6414 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1046687 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32242 (_values!6437 thiss!1427))))))

(assert (=> b!1046687 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32241 (_keys!11722 thiss!1427))))))

(declare-fun b!1046688 () Bool)

(declare-fun res!696581 () Bool)

(assert (=> b!1046688 (=> (not res!696581) (not e!593400))))

(declare-fun e!593407 () Bool)

(assert (=> b!1046688 (= res!696581 e!593407)))

(declare-fun res!696586 () Bool)

(assert (=> b!1046688 (=> res!696586 e!593407)))

(declare-fun e!593406 () Bool)

(assert (=> b!1046688 (= res!696586 (not e!593406))))

(declare-fun res!696582 () Bool)

(assert (=> b!1046688 (=> (not res!696582) (not e!593406))))

(assert (=> b!1046688 (= res!696582 (bvslt #b00000000000000000000000000000000 (size!32241 (_keys!11722 thiss!1427))))))

(declare-fun b!1046689 () Bool)

(assert (=> b!1046689 (= e!593402 (= (apply!923 lt!461993 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6248 thiss!1427)))))

(declare-fun bm!44559 () Bool)

(declare-fun call!44566 () ListLongMap!13797)

(declare-fun call!44560 () ListLongMap!13797)

(assert (=> bm!44559 (= call!44566 call!44560)))

(declare-fun b!1046690 () Bool)

(assert (=> b!1046690 (= e!593406 (validKeyInArray!0 (select (arr!31705 (_keys!11722 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44560 () Bool)

(assert (=> bm!44560 (= call!44560 (getCurrentListMapNoExtraKeys!3574 (_keys!11722 thiss!1427) (_values!6437 thiss!1427) (mask!30599 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6414 thiss!1427)))))

(declare-fun b!1046691 () Bool)

(assert (=> b!1046691 (= e!593407 e!593396)))

(declare-fun res!696584 () Bool)

(assert (=> b!1046691 (=> (not res!696584) (not e!593396))))

(assert (=> b!1046691 (= res!696584 (contains!6107 lt!461993 (select (arr!31705 (_keys!11722 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1046691 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32241 (_keys!11722 thiss!1427))))))

(declare-fun b!1046692 () Bool)

(declare-fun c!106678 () Bool)

(assert (=> b!1046692 (= c!106678 (and (not (= (bvand (extraKeys!6142 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6142 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!593404 () ListLongMap!13797)

(assert (=> b!1046692 (= e!593404 e!593395)))

(declare-fun bm!44561 () Bool)

(declare-fun call!44563 () ListLongMap!13797)

(assert (=> bm!44561 (= call!44563 call!44564)))

(declare-fun bm!44562 () Bool)

(assert (=> bm!44562 (= call!44565 call!44566)))

(declare-fun b!1046693 () Bool)

(assert (=> b!1046693 (= e!593398 (= (apply!923 lt!461993 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6248 thiss!1427)))))

(declare-fun b!1046694 () Bool)

(assert (=> b!1046694 (= e!593395 call!44563)))

(declare-fun d!126975 () Bool)

(assert (=> d!126975 e!593400))

(declare-fun res!696585 () Bool)

(assert (=> d!126975 (=> (not res!696585) (not e!593400))))

(assert (=> d!126975 (= res!696585 (or (bvsge #b00000000000000000000000000000000 (size!32241 (_keys!11722 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32241 (_keys!11722 thiss!1427))))))))

(declare-fun lt!462001 () ListLongMap!13797)

(assert (=> d!126975 (= lt!461993 lt!462001)))

(declare-fun lt!461991 () Unit!34155)

(assert (=> d!126975 (= lt!461991 e!593405)))

(declare-fun c!106679 () Bool)

(assert (=> d!126975 (= c!106679 e!593397)))

(declare-fun res!696587 () Bool)

(assert (=> d!126975 (=> (not res!696587) (not e!593397))))

(assert (=> d!126975 (= res!696587 (bvslt #b00000000000000000000000000000000 (size!32241 (_keys!11722 thiss!1427))))))

(assert (=> d!126975 (= lt!462001 e!593399)))

(declare-fun c!106677 () Bool)

(assert (=> d!126975 (= c!106677 (and (not (= (bvand (extraKeys!6142 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6142 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126975 (validMask!0 (mask!30599 thiss!1427))))

(assert (=> d!126975 (= (getCurrentListMap!3958 (_keys!11722 thiss!1427) (_values!6437 thiss!1427) (mask!30599 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6414 thiss!1427)) lt!461993)))

(declare-fun b!1046695 () Bool)

(assert (=> b!1046695 (= e!593400 e!593403)))

(declare-fun c!106680 () Bool)

(assert (=> b!1046695 (= c!106680 (not (= (bvand (extraKeys!6142 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44563 () Bool)

(declare-fun c!106676 () Bool)

(assert (=> bm!44563 (= call!44564 (+!3134 (ite c!106677 call!44560 (ite c!106676 call!44566 call!44565)) (ite (or c!106677 c!106676) (tuple2!15787 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6248 thiss!1427)) (tuple2!15787 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6248 thiss!1427)))))))

(declare-fun b!1046696 () Bool)

(assert (=> b!1046696 (= e!593404 call!44563)))

(declare-fun b!1046697 () Bool)

(assert (=> b!1046697 (= e!593399 e!593404)))

(assert (=> b!1046697 (= c!106676 (and (not (= (bvand (extraKeys!6142 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6142 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!126975 c!106677) b!1046685))

(assert (= (and d!126975 (not c!106677)) b!1046697))

(assert (= (and b!1046697 c!106676) b!1046696))

(assert (= (and b!1046697 (not c!106676)) b!1046692))

(assert (= (and b!1046692 c!106678) b!1046694))

(assert (= (and b!1046692 (not c!106678)) b!1046677))

(assert (= (or b!1046694 b!1046677) bm!44562))

(assert (= (or b!1046696 bm!44562) bm!44559))

(assert (= (or b!1046696 b!1046694) bm!44561))

(assert (= (or b!1046685 bm!44559) bm!44560))

(assert (= (or b!1046685 bm!44561) bm!44563))

(assert (= (and d!126975 res!696587) b!1046678))

(assert (= (and d!126975 c!106679) b!1046682))

(assert (= (and d!126975 (not c!106679)) b!1046679))

(assert (= (and d!126975 res!696585) b!1046688))

(assert (= (and b!1046688 res!696582) b!1046690))

(assert (= (and b!1046688 (not res!696586)) b!1046691))

(assert (= (and b!1046691 res!696584) b!1046687))

(assert (= (and b!1046688 res!696581) b!1046684))

(assert (= (and b!1046684 c!106681) b!1046680))

(assert (= (and b!1046684 (not c!106681)) b!1046686))

(assert (= (and b!1046680 res!696580) b!1046689))

(assert (= (or b!1046680 b!1046686) bm!44558))

(assert (= (and b!1046684 res!696588) b!1046695))

(assert (= (and b!1046695 c!106680) b!1046681))

(assert (= (and b!1046695 (not c!106680)) b!1046683))

(assert (= (and b!1046681 res!696583) b!1046693))

(assert (= (or b!1046681 b!1046683) bm!44557))

(declare-fun b_lambda!16303 () Bool)

(assert (=> (not b_lambda!16303) (not b!1046687)))

(assert (=> b!1046687 t!31260))

(declare-fun b_and!33767 () Bool)

(assert (= b_and!33757 (and (=> t!31260 result!14579) b_and!33767)))

(declare-fun m!966697 () Bool)

(assert (=> b!1046689 m!966697))

(declare-fun m!966699 () Bool)

(assert (=> b!1046687 m!966699))

(assert (=> b!1046687 m!966577))

(declare-fun m!966701 () Bool)

(assert (=> b!1046687 m!966701))

(assert (=> b!1046687 m!966577))

(declare-fun m!966703 () Bool)

(assert (=> b!1046687 m!966703))

(declare-fun m!966705 () Bool)

(assert (=> b!1046687 m!966705))

(assert (=> b!1046687 m!966699))

(assert (=> b!1046687 m!966703))

(declare-fun m!966707 () Bool)

(assert (=> b!1046693 m!966707))

(assert (=> b!1046690 m!966703))

(assert (=> b!1046690 m!966703))

(declare-fun m!966709 () Bool)

(assert (=> b!1046690 m!966709))

(declare-fun m!966711 () Bool)

(assert (=> bm!44560 m!966711))

(declare-fun m!966713 () Bool)

(assert (=> b!1046685 m!966713))

(declare-fun m!966715 () Bool)

(assert (=> bm!44557 m!966715))

(declare-fun m!966717 () Bool)

(assert (=> b!1046682 m!966717))

(declare-fun m!966719 () Bool)

(assert (=> b!1046682 m!966719))

(declare-fun m!966721 () Bool)

(assert (=> b!1046682 m!966721))

(declare-fun m!966723 () Bool)

(assert (=> b!1046682 m!966723))

(assert (=> b!1046682 m!966703))

(declare-fun m!966725 () Bool)

(assert (=> b!1046682 m!966725))

(declare-fun m!966727 () Bool)

(assert (=> b!1046682 m!966727))

(declare-fun m!966729 () Bool)

(assert (=> b!1046682 m!966729))

(declare-fun m!966731 () Bool)

(assert (=> b!1046682 m!966731))

(declare-fun m!966733 () Bool)

(assert (=> b!1046682 m!966733))

(declare-fun m!966735 () Bool)

(assert (=> b!1046682 m!966735))

(assert (=> b!1046682 m!966711))

(assert (=> b!1046682 m!966721))

(declare-fun m!966737 () Bool)

(assert (=> b!1046682 m!966737))

(assert (=> b!1046682 m!966731))

(assert (=> b!1046682 m!966735))

(declare-fun m!966739 () Bool)

(assert (=> b!1046682 m!966739))

(declare-fun m!966741 () Bool)

(assert (=> b!1046682 m!966741))

(assert (=> b!1046682 m!966725))

(declare-fun m!966743 () Bool)

(assert (=> b!1046682 m!966743))

(declare-fun m!966745 () Bool)

(assert (=> b!1046682 m!966745))

(declare-fun m!966747 () Bool)

(assert (=> d!126975 m!966747))

(declare-fun m!966749 () Bool)

(assert (=> bm!44558 m!966749))

(declare-fun m!966751 () Bool)

(assert (=> bm!44563 m!966751))

(assert (=> b!1046691 m!966703))

(assert (=> b!1046691 m!966703))

(declare-fun m!966753 () Bool)

(assert (=> b!1046691 m!966753))

(assert (=> b!1046678 m!966703))

(assert (=> b!1046678 m!966703))

(assert (=> b!1046678 m!966709))

(assert (=> b!1046551 d!126975))

(declare-fun b!1046698 () Bool)

(declare-fun e!593408 () ListLongMap!13797)

(declare-fun call!44572 () ListLongMap!13797)

(assert (=> b!1046698 (= e!593408 call!44572)))

(declare-fun b!1046699 () Bool)

(declare-fun e!593410 () Bool)

(assert (=> b!1046699 (= e!593410 (validKeyInArray!0 (select (arr!31705 lt!461868) #b00000000000000000000000000000000)))))

(declare-fun b!1046700 () Bool)

(declare-fun e!593418 () Unit!34155)

(declare-fun Unit!34163 () Unit!34155)

(assert (=> b!1046700 (= e!593418 Unit!34163)))

(declare-fun b!1046701 () Bool)

(declare-fun e!593414 () Bool)

(declare-fun e!593415 () Bool)

(assert (=> b!1046701 (= e!593414 e!593415)))

(declare-fun res!696589 () Bool)

(declare-fun call!44569 () Bool)

(assert (=> b!1046701 (= res!696589 call!44569)))

(assert (=> b!1046701 (=> (not res!696589) (not e!593415))))

(declare-fun b!1046702 () Bool)

(declare-fun e!593416 () Bool)

(declare-fun e!593411 () Bool)

(assert (=> b!1046702 (= e!593416 e!593411)))

(declare-fun res!696592 () Bool)

(declare-fun call!44568 () Bool)

(assert (=> b!1046702 (= res!696592 call!44568)))

(assert (=> b!1046702 (=> (not res!696592) (not e!593411))))

(declare-fun bm!44564 () Bool)

(declare-fun lt!462015 () ListLongMap!13797)

(assert (=> bm!44564 (= call!44568 (contains!6107 lt!462015 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!44565 () Bool)

(assert (=> bm!44565 (= call!44569 (contains!6107 lt!462015 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1046703 () Bool)

(declare-fun lt!462022 () Unit!34155)

(assert (=> b!1046703 (= e!593418 lt!462022)))

(declare-fun lt!462017 () ListLongMap!13797)

(assert (=> b!1046703 (= lt!462017 (getCurrentListMapNoExtraKeys!3574 lt!461868 lt!461869 (mask!30599 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6414 thiss!1427)))))

(declare-fun lt!462016 () (_ BitVec 64))

(assert (=> b!1046703 (= lt!462016 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!462018 () (_ BitVec 64))

(assert (=> b!1046703 (= lt!462018 (select (arr!31705 lt!461868) #b00000000000000000000000000000000))))

(declare-fun lt!462012 () Unit!34155)

(assert (=> b!1046703 (= lt!462012 (addStillContains!633 lt!462017 lt!462016 (zeroValue!6248 thiss!1427) lt!462018))))

(assert (=> b!1046703 (contains!6107 (+!3134 lt!462017 (tuple2!15787 lt!462016 (zeroValue!6248 thiss!1427))) lt!462018)))

(declare-fun lt!462019 () Unit!34155)

(assert (=> b!1046703 (= lt!462019 lt!462012)))

(declare-fun lt!462021 () ListLongMap!13797)

(assert (=> b!1046703 (= lt!462021 (getCurrentListMapNoExtraKeys!3574 lt!461868 lt!461869 (mask!30599 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6414 thiss!1427)))))

(declare-fun lt!462005 () (_ BitVec 64))

(assert (=> b!1046703 (= lt!462005 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!462014 () (_ BitVec 64))

(assert (=> b!1046703 (= lt!462014 (select (arr!31705 lt!461868) #b00000000000000000000000000000000))))

(declare-fun lt!462006 () Unit!34155)

(assert (=> b!1046703 (= lt!462006 (addApplyDifferent!489 lt!462021 lt!462005 (minValue!6248 thiss!1427) lt!462014))))

(assert (=> b!1046703 (= (apply!923 (+!3134 lt!462021 (tuple2!15787 lt!462005 (minValue!6248 thiss!1427))) lt!462014) (apply!923 lt!462021 lt!462014))))

(declare-fun lt!462020 () Unit!34155)

(assert (=> b!1046703 (= lt!462020 lt!462006)))

(declare-fun lt!462007 () ListLongMap!13797)

(assert (=> b!1046703 (= lt!462007 (getCurrentListMapNoExtraKeys!3574 lt!461868 lt!461869 (mask!30599 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6414 thiss!1427)))))

(declare-fun lt!462025 () (_ BitVec 64))

(assert (=> b!1046703 (= lt!462025 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!462011 () (_ BitVec 64))

(assert (=> b!1046703 (= lt!462011 (select (arr!31705 lt!461868) #b00000000000000000000000000000000))))

(declare-fun lt!462026 () Unit!34155)

(assert (=> b!1046703 (= lt!462026 (addApplyDifferent!489 lt!462007 lt!462025 (zeroValue!6248 thiss!1427) lt!462011))))

(assert (=> b!1046703 (= (apply!923 (+!3134 lt!462007 (tuple2!15787 lt!462025 (zeroValue!6248 thiss!1427))) lt!462011) (apply!923 lt!462007 lt!462011))))

(declare-fun lt!462008 () Unit!34155)

(assert (=> b!1046703 (= lt!462008 lt!462026)))

(declare-fun lt!462009 () ListLongMap!13797)

(assert (=> b!1046703 (= lt!462009 (getCurrentListMapNoExtraKeys!3574 lt!461868 lt!461869 (mask!30599 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6414 thiss!1427)))))

(declare-fun lt!462010 () (_ BitVec 64))

(assert (=> b!1046703 (= lt!462010 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!462024 () (_ BitVec 64))

(assert (=> b!1046703 (= lt!462024 (select (arr!31705 lt!461868) #b00000000000000000000000000000000))))

(assert (=> b!1046703 (= lt!462022 (addApplyDifferent!489 lt!462009 lt!462010 (minValue!6248 thiss!1427) lt!462024))))

(assert (=> b!1046703 (= (apply!923 (+!3134 lt!462009 (tuple2!15787 lt!462010 (minValue!6248 thiss!1427))) lt!462024) (apply!923 lt!462009 lt!462024))))

(declare-fun b!1046704 () Bool)

(assert (=> b!1046704 (= e!593416 (not call!44568))))

(declare-fun b!1046705 () Bool)

(declare-fun res!696597 () Bool)

(declare-fun e!593413 () Bool)

(assert (=> b!1046705 (=> (not res!696597) (not e!593413))))

(assert (=> b!1046705 (= res!696597 e!593414)))

(declare-fun c!106687 () Bool)

(assert (=> b!1046705 (= c!106687 (not (= (bvand (extraKeys!6142 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1046706 () Bool)

(declare-fun e!593412 () ListLongMap!13797)

(declare-fun call!44571 () ListLongMap!13797)

(assert (=> b!1046706 (= e!593412 (+!3134 call!44571 (tuple2!15787 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6248 thiss!1427))))))

(declare-fun b!1046707 () Bool)

(assert (=> b!1046707 (= e!593414 (not call!44569))))

(declare-fun b!1046708 () Bool)

(declare-fun e!593409 () Bool)

(assert (=> b!1046708 (= e!593409 (= (apply!923 lt!462015 (select (arr!31705 lt!461868) #b00000000000000000000000000000000)) (get!16588 (select (arr!31706 lt!461869) #b00000000000000000000000000000000) (dynLambda!2029 (defaultEntry!6414 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1046708 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32242 lt!461869)))))

(assert (=> b!1046708 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32241 lt!461868)))))

(declare-fun b!1046709 () Bool)

(declare-fun res!696590 () Bool)

(assert (=> b!1046709 (=> (not res!696590) (not e!593413))))

(declare-fun e!593420 () Bool)

(assert (=> b!1046709 (= res!696590 e!593420)))

(declare-fun res!696595 () Bool)

(assert (=> b!1046709 (=> res!696595 e!593420)))

(declare-fun e!593419 () Bool)

(assert (=> b!1046709 (= res!696595 (not e!593419))))

(declare-fun res!696591 () Bool)

(assert (=> b!1046709 (=> (not res!696591) (not e!593419))))

(assert (=> b!1046709 (= res!696591 (bvslt #b00000000000000000000000000000000 (size!32241 lt!461868)))))

(declare-fun b!1046710 () Bool)

(assert (=> b!1046710 (= e!593415 (= (apply!923 lt!462015 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6248 thiss!1427)))))

(declare-fun bm!44566 () Bool)

(declare-fun call!44573 () ListLongMap!13797)

(declare-fun call!44567 () ListLongMap!13797)

(assert (=> bm!44566 (= call!44573 call!44567)))

(declare-fun b!1046711 () Bool)

(assert (=> b!1046711 (= e!593419 (validKeyInArray!0 (select (arr!31705 lt!461868) #b00000000000000000000000000000000)))))

(declare-fun bm!44567 () Bool)

(assert (=> bm!44567 (= call!44567 (getCurrentListMapNoExtraKeys!3574 lt!461868 lt!461869 (mask!30599 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6414 thiss!1427)))))

(declare-fun b!1046712 () Bool)

(assert (=> b!1046712 (= e!593420 e!593409)))

(declare-fun res!696593 () Bool)

(assert (=> b!1046712 (=> (not res!696593) (not e!593409))))

(assert (=> b!1046712 (= res!696593 (contains!6107 lt!462015 (select (arr!31705 lt!461868) #b00000000000000000000000000000000)))))

(assert (=> b!1046712 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32241 lt!461868)))))

(declare-fun b!1046713 () Bool)

(declare-fun c!106684 () Bool)

(assert (=> b!1046713 (= c!106684 (and (not (= (bvand (extraKeys!6142 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6142 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!593417 () ListLongMap!13797)

(assert (=> b!1046713 (= e!593417 e!593408)))

(declare-fun bm!44568 () Bool)

(declare-fun call!44570 () ListLongMap!13797)

(assert (=> bm!44568 (= call!44570 call!44571)))

(declare-fun bm!44569 () Bool)

(assert (=> bm!44569 (= call!44572 call!44573)))

(declare-fun b!1046714 () Bool)

(assert (=> b!1046714 (= e!593411 (= (apply!923 lt!462015 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6248 thiss!1427)))))

(declare-fun b!1046715 () Bool)

(assert (=> b!1046715 (= e!593408 call!44570)))

(declare-fun d!126977 () Bool)

(assert (=> d!126977 e!593413))

(declare-fun res!696594 () Bool)

(assert (=> d!126977 (=> (not res!696594) (not e!593413))))

(assert (=> d!126977 (= res!696594 (or (bvsge #b00000000000000000000000000000000 (size!32241 lt!461868)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32241 lt!461868)))))))

(declare-fun lt!462023 () ListLongMap!13797)

(assert (=> d!126977 (= lt!462015 lt!462023)))

(declare-fun lt!462013 () Unit!34155)

(assert (=> d!126977 (= lt!462013 e!593418)))

(declare-fun c!106685 () Bool)

(assert (=> d!126977 (= c!106685 e!593410)))

(declare-fun res!696596 () Bool)

(assert (=> d!126977 (=> (not res!696596) (not e!593410))))

(assert (=> d!126977 (= res!696596 (bvslt #b00000000000000000000000000000000 (size!32241 lt!461868)))))

(assert (=> d!126977 (= lt!462023 e!593412)))

(declare-fun c!106683 () Bool)

(assert (=> d!126977 (= c!106683 (and (not (= (bvand (extraKeys!6142 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6142 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126977 (validMask!0 (mask!30599 thiss!1427))))

(assert (=> d!126977 (= (getCurrentListMap!3958 lt!461868 lt!461869 (mask!30599 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6414 thiss!1427)) lt!462015)))

(declare-fun b!1046716 () Bool)

(assert (=> b!1046716 (= e!593413 e!593416)))

(declare-fun c!106686 () Bool)

(assert (=> b!1046716 (= c!106686 (not (= (bvand (extraKeys!6142 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44570 () Bool)

(declare-fun c!106682 () Bool)

(assert (=> bm!44570 (= call!44571 (+!3134 (ite c!106683 call!44567 (ite c!106682 call!44573 call!44572)) (ite (or c!106683 c!106682) (tuple2!15787 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6248 thiss!1427)) (tuple2!15787 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6248 thiss!1427)))))))

(declare-fun b!1046717 () Bool)

(assert (=> b!1046717 (= e!593417 call!44570)))

(declare-fun b!1046718 () Bool)

(assert (=> b!1046718 (= e!593412 e!593417)))

(assert (=> b!1046718 (= c!106682 (and (not (= (bvand (extraKeys!6142 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6142 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!126977 c!106683) b!1046706))

(assert (= (and d!126977 (not c!106683)) b!1046718))

(assert (= (and b!1046718 c!106682) b!1046717))

(assert (= (and b!1046718 (not c!106682)) b!1046713))

(assert (= (and b!1046713 c!106684) b!1046715))

(assert (= (and b!1046713 (not c!106684)) b!1046698))

(assert (= (or b!1046715 b!1046698) bm!44569))

(assert (= (or b!1046717 bm!44569) bm!44566))

(assert (= (or b!1046717 b!1046715) bm!44568))

(assert (= (or b!1046706 bm!44566) bm!44567))

(assert (= (or b!1046706 bm!44568) bm!44570))

(assert (= (and d!126977 res!696596) b!1046699))

(assert (= (and d!126977 c!106685) b!1046703))

(assert (= (and d!126977 (not c!106685)) b!1046700))

(assert (= (and d!126977 res!696594) b!1046709))

(assert (= (and b!1046709 res!696591) b!1046711))

(assert (= (and b!1046709 (not res!696595)) b!1046712))

(assert (= (and b!1046712 res!696593) b!1046708))

(assert (= (and b!1046709 res!696590) b!1046705))

(assert (= (and b!1046705 c!106687) b!1046701))

(assert (= (and b!1046705 (not c!106687)) b!1046707))

(assert (= (and b!1046701 res!696589) b!1046710))

(assert (= (or b!1046701 b!1046707) bm!44565))

(assert (= (and b!1046705 res!696597) b!1046716))

(assert (= (and b!1046716 c!106686) b!1046702))

(assert (= (and b!1046716 (not c!106686)) b!1046704))

(assert (= (and b!1046702 res!696592) b!1046714))

(assert (= (or b!1046702 b!1046704) bm!44564))

(declare-fun b_lambda!16305 () Bool)

(assert (=> (not b_lambda!16305) (not b!1046708)))

(assert (=> b!1046708 t!31260))

(declare-fun b_and!33769 () Bool)

(assert (= b_and!33767 (and (=> t!31260 result!14579) b_and!33769)))

(declare-fun m!966755 () Bool)

(assert (=> b!1046710 m!966755))

(declare-fun m!966757 () Bool)

(assert (=> b!1046708 m!966757))

(assert (=> b!1046708 m!966577))

(declare-fun m!966759 () Bool)

(assert (=> b!1046708 m!966759))

(assert (=> b!1046708 m!966577))

(declare-fun m!966761 () Bool)

(assert (=> b!1046708 m!966761))

(declare-fun m!966763 () Bool)

(assert (=> b!1046708 m!966763))

(assert (=> b!1046708 m!966757))

(assert (=> b!1046708 m!966761))

(declare-fun m!966765 () Bool)

(assert (=> b!1046714 m!966765))

(assert (=> b!1046711 m!966761))

(assert (=> b!1046711 m!966761))

(declare-fun m!966767 () Bool)

(assert (=> b!1046711 m!966767))

(declare-fun m!966769 () Bool)

(assert (=> bm!44567 m!966769))

(declare-fun m!966771 () Bool)

(assert (=> b!1046706 m!966771))

(declare-fun m!966773 () Bool)

(assert (=> bm!44564 m!966773))

(declare-fun m!966775 () Bool)

(assert (=> b!1046703 m!966775))

(declare-fun m!966777 () Bool)

(assert (=> b!1046703 m!966777))

(declare-fun m!966779 () Bool)

(assert (=> b!1046703 m!966779))

(declare-fun m!966781 () Bool)

(assert (=> b!1046703 m!966781))

(assert (=> b!1046703 m!966761))

(declare-fun m!966783 () Bool)

(assert (=> b!1046703 m!966783))

(declare-fun m!966785 () Bool)

(assert (=> b!1046703 m!966785))

(declare-fun m!966787 () Bool)

(assert (=> b!1046703 m!966787))

(declare-fun m!966789 () Bool)

(assert (=> b!1046703 m!966789))

(declare-fun m!966791 () Bool)

(assert (=> b!1046703 m!966791))

(declare-fun m!966793 () Bool)

(assert (=> b!1046703 m!966793))

(assert (=> b!1046703 m!966769))

(assert (=> b!1046703 m!966779))

(declare-fun m!966795 () Bool)

(assert (=> b!1046703 m!966795))

(assert (=> b!1046703 m!966789))

(assert (=> b!1046703 m!966793))

(declare-fun m!966797 () Bool)

(assert (=> b!1046703 m!966797))

(declare-fun m!966799 () Bool)

(assert (=> b!1046703 m!966799))

(assert (=> b!1046703 m!966783))

(declare-fun m!966801 () Bool)

(assert (=> b!1046703 m!966801))

(declare-fun m!966803 () Bool)

(assert (=> b!1046703 m!966803))

(assert (=> d!126977 m!966747))

(declare-fun m!966805 () Bool)

(assert (=> bm!44565 m!966805))

(declare-fun m!966807 () Bool)

(assert (=> bm!44570 m!966807))

(assert (=> b!1046712 m!966761))

(assert (=> b!1046712 m!966761))

(declare-fun m!966809 () Bool)

(assert (=> b!1046712 m!966809))

(assert (=> b!1046699 m!966761))

(assert (=> b!1046699 m!966761))

(assert (=> b!1046699 m!966767))

(assert (=> b!1046551 d!126977))

(declare-fun d!126979 () Bool)

(declare-fun e!593423 () Bool)

(assert (=> d!126979 e!593423))

(declare-fun res!696600 () Bool)

(assert (=> d!126979 (=> (not res!696600) (not e!593423))))

(assert (=> d!126979 (= res!696600 (and (bvsge (index!41584 lt!461864) #b00000000000000000000000000000000) (bvslt (index!41584 lt!461864) (size!32241 (_keys!11722 thiss!1427)))))))

(declare-fun lt!462029 () Unit!34155)

(declare-fun choose!25 (array!65929 (_ BitVec 32) (_ BitVec 32)) Unit!34155)

(assert (=> d!126979 (= lt!462029 (choose!25 (_keys!11722 thiss!1427) (index!41584 lt!461864) (mask!30599 thiss!1427)))))

(assert (=> d!126979 (validMask!0 (mask!30599 thiss!1427))))

(assert (=> d!126979 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11722 thiss!1427) (index!41584 lt!461864) (mask!30599 thiss!1427)) lt!462029)))

(declare-fun b!1046721 () Bool)

(assert (=> b!1046721 (= e!593423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65930 (store (arr!31705 (_keys!11722 thiss!1427)) (index!41584 lt!461864) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32241 (_keys!11722 thiss!1427))) (mask!30599 thiss!1427)))))

(assert (= (and d!126979 res!696600) b!1046721))

(declare-fun m!966811 () Bool)

(assert (=> d!126979 m!966811))

(assert (=> d!126979 m!966747))

(assert (=> b!1046721 m!966575))

(declare-fun m!966813 () Bool)

(assert (=> b!1046721 m!966813))

(assert (=> b!1046551 d!126979))

(declare-fun d!126981 () Bool)

(declare-fun lt!462032 () ListLongMap!13797)

(assert (=> d!126981 (not (contains!6107 lt!462032 key!909))))

(declare-fun removeStrictlySorted!63 (List!22009 (_ BitVec 64)) List!22009)

(assert (=> d!126981 (= lt!462032 (ListLongMap!13798 (removeStrictlySorted!63 (toList!6914 (getCurrentListMap!3958 (_keys!11722 thiss!1427) (_values!6437 thiss!1427) (mask!30599 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6414 thiss!1427))) key!909)))))

(assert (=> d!126981 (= (-!537 (getCurrentListMap!3958 (_keys!11722 thiss!1427) (_values!6437 thiss!1427) (mask!30599 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6414 thiss!1427)) key!909) lt!462032)))

(declare-fun bs!30547 () Bool)

(assert (= bs!30547 d!126981))

(declare-fun m!966815 () Bool)

(assert (=> bs!30547 m!966815))

(declare-fun m!966817 () Bool)

(assert (=> bs!30547 m!966817))

(assert (=> b!1046551 d!126981))

(declare-fun d!126983 () Bool)

(declare-fun e!593426 () Bool)

(assert (=> d!126983 e!593426))

(declare-fun res!696603 () Bool)

(assert (=> d!126983 (=> (not res!696603) (not e!593426))))

(assert (=> d!126983 (= res!696603 (bvslt (index!41584 lt!461864) (size!32241 (_keys!11722 thiss!1427))))))

(declare-fun lt!462035 () Unit!34155)

(declare-fun choose!121 (array!65929 (_ BitVec 32) (_ BitVec 64)) Unit!34155)

(assert (=> d!126983 (= lt!462035 (choose!121 (_keys!11722 thiss!1427) (index!41584 lt!461864) key!909))))

(assert (=> d!126983 (bvsge (index!41584 lt!461864) #b00000000000000000000000000000000)))

(assert (=> d!126983 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11722 thiss!1427) (index!41584 lt!461864) key!909) lt!462035)))

(declare-fun b!1046724 () Bool)

(assert (=> b!1046724 (= e!593426 (not (arrayContainsKey!0 (array!65930 (store (arr!31705 (_keys!11722 thiss!1427)) (index!41584 lt!461864) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32241 (_keys!11722 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126983 res!696603) b!1046724))

(declare-fun m!966819 () Bool)

(assert (=> d!126983 m!966819))

(assert (=> b!1046724 m!966575))

(declare-fun m!966821 () Bool)

(assert (=> b!1046724 m!966821))

(assert (=> b!1046551 d!126983))

(declare-fun d!126985 () Bool)

(declare-fun e!593429 () Bool)

(assert (=> d!126985 e!593429))

(declare-fun res!696606 () Bool)

(assert (=> d!126985 (=> (not res!696606) (not e!593429))))

(assert (=> d!126985 (= res!696606 (and (bvsge (index!41584 lt!461864) #b00000000000000000000000000000000) (bvslt (index!41584 lt!461864) (size!32241 (_keys!11722 thiss!1427)))))))

(declare-fun lt!462038 () Unit!34155)

(declare-fun choose!1718 (array!65929 array!65931 (_ BitVec 32) (_ BitVec 32) V!38011 V!38011 (_ BitVec 32) (_ BitVec 64) Int) Unit!34155)

(assert (=> d!126985 (= lt!462038 (choose!1718 (_keys!11722 thiss!1427) (_values!6437 thiss!1427) (mask!30599 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) (index!41584 lt!461864) key!909 (defaultEntry!6414 thiss!1427)))))

(assert (=> d!126985 (validMask!0 (mask!30599 thiss!1427))))

(assert (=> d!126985 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!59 (_keys!11722 thiss!1427) (_values!6437 thiss!1427) (mask!30599 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) (index!41584 lt!461864) key!909 (defaultEntry!6414 thiss!1427)) lt!462038)))

(declare-fun b!1046727 () Bool)

(assert (=> b!1046727 (= e!593429 (= (-!537 (getCurrentListMap!3958 (_keys!11722 thiss!1427) (_values!6437 thiss!1427) (mask!30599 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6414 thiss!1427)) key!909) (getCurrentListMap!3958 (array!65930 (store (arr!31705 (_keys!11722 thiss!1427)) (index!41584 lt!461864) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32241 (_keys!11722 thiss!1427))) (array!65932 (store (arr!31706 (_values!6437 thiss!1427)) (index!41584 lt!461864) (ValueCellFull!11723 (dynLambda!2029 (defaultEntry!6414 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32242 (_values!6437 thiss!1427))) (mask!30599 thiss!1427) (extraKeys!6142 thiss!1427) (zeroValue!6248 thiss!1427) (minValue!6248 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6414 thiss!1427))))))

(assert (=> b!1046727 (bvslt (index!41584 lt!461864) (size!32242 (_values!6437 thiss!1427)))))

(assert (= (and d!126985 res!696606) b!1046727))

(declare-fun b_lambda!16307 () Bool)

(assert (=> (not b_lambda!16307) (not b!1046727)))

(assert (=> b!1046727 t!31260))

(declare-fun b_and!33771 () Bool)

(assert (= b_and!33769 (and (=> t!31260 result!14579) b_and!33771)))

(declare-fun m!966823 () Bool)

(assert (=> d!126985 m!966823))

(assert (=> d!126985 m!966747))

(assert (=> b!1046727 m!966553))

(assert (=> b!1046727 m!966555))

(assert (=> b!1046727 m!966575))

(declare-fun m!966825 () Bool)

(assert (=> b!1046727 m!966825))

(assert (=> b!1046727 m!966577))

(assert (=> b!1046727 m!966553))

(assert (=> b!1046727 m!966551))

(assert (=> b!1046551 d!126985))

(declare-fun b!1046738 () Bool)

(declare-fun e!593438 () Bool)

(declare-fun contains!6108 (List!22010 (_ BitVec 64)) Bool)

(assert (=> b!1046738 (= e!593438 (contains!6108 Nil!22007 (select (arr!31705 lt!461868) #b00000000000000000000000000000000)))))

(declare-fun d!126987 () Bool)

(declare-fun res!696614 () Bool)

(declare-fun e!593439 () Bool)

(assert (=> d!126987 (=> res!696614 e!593439)))

(assert (=> d!126987 (= res!696614 (bvsge #b00000000000000000000000000000000 (size!32241 lt!461868)))))

(assert (=> d!126987 (= (arrayNoDuplicates!0 lt!461868 #b00000000000000000000000000000000 Nil!22007) e!593439)))

(declare-fun b!1046739 () Bool)

(declare-fun e!593441 () Bool)

(declare-fun call!44576 () Bool)

(assert (=> b!1046739 (= e!593441 call!44576)))

(declare-fun b!1046740 () Bool)

(assert (=> b!1046740 (= e!593441 call!44576)))

(declare-fun bm!44573 () Bool)

(declare-fun c!106690 () Bool)

(assert (=> bm!44573 (= call!44576 (arrayNoDuplicates!0 lt!461868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106690 (Cons!22006 (select (arr!31705 lt!461868) #b00000000000000000000000000000000) Nil!22007) Nil!22007)))))

(declare-fun b!1046741 () Bool)

(declare-fun e!593440 () Bool)

(assert (=> b!1046741 (= e!593439 e!593440)))

(declare-fun res!696613 () Bool)

(assert (=> b!1046741 (=> (not res!696613) (not e!593440))))

(assert (=> b!1046741 (= res!696613 (not e!593438))))

(declare-fun res!696615 () Bool)

(assert (=> b!1046741 (=> (not res!696615) (not e!593438))))

(assert (=> b!1046741 (= res!696615 (validKeyInArray!0 (select (arr!31705 lt!461868) #b00000000000000000000000000000000)))))

(declare-fun b!1046742 () Bool)

(assert (=> b!1046742 (= e!593440 e!593441)))

(assert (=> b!1046742 (= c!106690 (validKeyInArray!0 (select (arr!31705 lt!461868) #b00000000000000000000000000000000)))))

(assert (= (and d!126987 (not res!696614)) b!1046741))

(assert (= (and b!1046741 res!696615) b!1046738))

(assert (= (and b!1046741 res!696613) b!1046742))

(assert (= (and b!1046742 c!106690) b!1046739))

(assert (= (and b!1046742 (not c!106690)) b!1046740))

(assert (= (or b!1046739 b!1046740) bm!44573))

(assert (=> b!1046738 m!966761))

(assert (=> b!1046738 m!966761))

(declare-fun m!966827 () Bool)

(assert (=> b!1046738 m!966827))

(assert (=> bm!44573 m!966761))

(declare-fun m!966829 () Bool)

(assert (=> bm!44573 m!966829))

(assert (=> b!1046741 m!966761))

(assert (=> b!1046741 m!966761))

(assert (=> b!1046741 m!966767))

(assert (=> b!1046742 m!966761))

(assert (=> b!1046742 m!966761))

(assert (=> b!1046742 m!966767))

(assert (=> b!1046551 d!126987))

(declare-fun d!126989 () Bool)

(declare-fun res!696620 () Bool)

(declare-fun e!593446 () Bool)

(assert (=> d!126989 (=> res!696620 e!593446)))

(assert (=> d!126989 (= res!696620 (= (select (arr!31705 lt!461868) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126989 (= (arrayContainsKey!0 lt!461868 key!909 #b00000000000000000000000000000000) e!593446)))

(declare-fun b!1046747 () Bool)

(declare-fun e!593447 () Bool)

(assert (=> b!1046747 (= e!593446 e!593447)))

(declare-fun res!696621 () Bool)

(assert (=> b!1046747 (=> (not res!696621) (not e!593447))))

(assert (=> b!1046747 (= res!696621 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32241 lt!461868)))))

(declare-fun b!1046748 () Bool)

(assert (=> b!1046748 (= e!593447 (arrayContainsKey!0 lt!461868 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126989 (not res!696620)) b!1046747))

(assert (= (and b!1046747 res!696621) b!1046748))

(assert (=> d!126989 m!966761))

(declare-fun m!966831 () Bool)

(assert (=> b!1046748 m!966831))

(assert (=> b!1046551 d!126989))

(declare-fun b!1046757 () Bool)

(declare-fun e!593453 () (_ BitVec 32))

(declare-fun call!44579 () (_ BitVec 32))

(assert (=> b!1046757 (= e!593453 call!44579)))

(declare-fun b!1046758 () Bool)

(assert (=> b!1046758 (= e!593453 (bvadd #b00000000000000000000000000000001 call!44579))))

(declare-fun d!126991 () Bool)

(declare-fun lt!462041 () (_ BitVec 32))

(assert (=> d!126991 (and (bvsge lt!462041 #b00000000000000000000000000000000) (bvsle lt!462041 (bvsub (size!32241 (_keys!11722 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!593452 () (_ BitVec 32))

(assert (=> d!126991 (= lt!462041 e!593452)))

(declare-fun c!106696 () Bool)

(assert (=> d!126991 (= c!106696 (bvsge #b00000000000000000000000000000000 (size!32241 (_keys!11722 thiss!1427))))))

(assert (=> d!126991 (and (bvsle #b00000000000000000000000000000000 (size!32241 (_keys!11722 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32241 (_keys!11722 thiss!1427)) (size!32241 (_keys!11722 thiss!1427))))))

(assert (=> d!126991 (= (arrayCountValidKeys!0 (_keys!11722 thiss!1427) #b00000000000000000000000000000000 (size!32241 (_keys!11722 thiss!1427))) lt!462041)))

(declare-fun bm!44576 () Bool)

(assert (=> bm!44576 (= call!44579 (arrayCountValidKeys!0 (_keys!11722 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32241 (_keys!11722 thiss!1427))))))

(declare-fun b!1046759 () Bool)

(assert (=> b!1046759 (= e!593452 e!593453)))

(declare-fun c!106695 () Bool)

(assert (=> b!1046759 (= c!106695 (validKeyInArray!0 (select (arr!31705 (_keys!11722 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1046760 () Bool)

(assert (=> b!1046760 (= e!593452 #b00000000000000000000000000000000)))

(assert (= (and d!126991 c!106696) b!1046760))

(assert (= (and d!126991 (not c!106696)) b!1046759))

(assert (= (and b!1046759 c!106695) b!1046758))

(assert (= (and b!1046759 (not c!106695)) b!1046757))

(assert (= (or b!1046758 b!1046757) bm!44576))

(declare-fun m!966833 () Bool)

(assert (=> bm!44576 m!966833))

(assert (=> b!1046759 m!966703))

(assert (=> b!1046759 m!966703))

(assert (=> b!1046759 m!966709))

(assert (=> b!1046551 d!126991))

(declare-fun b!1046761 () Bool)

(declare-fun e!593454 () ListLongMap!13797)

(declare-fun call!44585 () ListLongMap!13797)

(assert (=> b!1046761 (= e!593454 call!44585)))

(declare-fun b!1046762 () Bool)

(declare-fun e!593456 () Bool)

(assert (=> b!1046762 (= e!593456 (validKeyInArray!0 (select (arr!31705 (_keys!11722 (_2!7903 lt!461862))) #b00000000000000000000000000000000)))))

(declare-fun b!1046763 () Bool)

(declare-fun e!593464 () Unit!34155)

(declare-fun Unit!34164 () Unit!34155)

(assert (=> b!1046763 (= e!593464 Unit!34164)))

(declare-fun b!1046764 () Bool)

(declare-fun e!593460 () Bool)

(declare-fun e!593461 () Bool)

(assert (=> b!1046764 (= e!593460 e!593461)))

(declare-fun res!696622 () Bool)

(declare-fun call!44582 () Bool)

(assert (=> b!1046764 (= res!696622 call!44582)))

(assert (=> b!1046764 (=> (not res!696622) (not e!593461))))

(declare-fun b!1046765 () Bool)

(declare-fun e!593462 () Bool)

(declare-fun e!593457 () Bool)

(assert (=> b!1046765 (= e!593462 e!593457)))

(declare-fun res!696625 () Bool)

(declare-fun call!44581 () Bool)

(assert (=> b!1046765 (= res!696625 call!44581)))

(assert (=> b!1046765 (=> (not res!696625) (not e!593457))))

(declare-fun bm!44577 () Bool)

(declare-fun lt!462052 () ListLongMap!13797)

(assert (=> bm!44577 (= call!44581 (contains!6107 lt!462052 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!44578 () Bool)

(assert (=> bm!44578 (= call!44582 (contains!6107 lt!462052 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1046766 () Bool)

(declare-fun lt!462059 () Unit!34155)

(assert (=> b!1046766 (= e!593464 lt!462059)))

(declare-fun lt!462054 () ListLongMap!13797)

(assert (=> b!1046766 (= lt!462054 (getCurrentListMapNoExtraKeys!3574 (_keys!11722 (_2!7903 lt!461862)) (_values!6437 (_2!7903 lt!461862)) (mask!30599 (_2!7903 lt!461862)) (extraKeys!6142 (_2!7903 lt!461862)) (zeroValue!6248 (_2!7903 lt!461862)) (minValue!6248 (_2!7903 lt!461862)) #b00000000000000000000000000000000 (defaultEntry!6414 (_2!7903 lt!461862))))))

(declare-fun lt!462053 () (_ BitVec 64))

(assert (=> b!1046766 (= lt!462053 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!462055 () (_ BitVec 64))

(assert (=> b!1046766 (= lt!462055 (select (arr!31705 (_keys!11722 (_2!7903 lt!461862))) #b00000000000000000000000000000000))))

(declare-fun lt!462049 () Unit!34155)

(assert (=> b!1046766 (= lt!462049 (addStillContains!633 lt!462054 lt!462053 (zeroValue!6248 (_2!7903 lt!461862)) lt!462055))))

(assert (=> b!1046766 (contains!6107 (+!3134 lt!462054 (tuple2!15787 lt!462053 (zeroValue!6248 (_2!7903 lt!461862)))) lt!462055)))

(declare-fun lt!462056 () Unit!34155)

(assert (=> b!1046766 (= lt!462056 lt!462049)))

(declare-fun lt!462058 () ListLongMap!13797)

(assert (=> b!1046766 (= lt!462058 (getCurrentListMapNoExtraKeys!3574 (_keys!11722 (_2!7903 lt!461862)) (_values!6437 (_2!7903 lt!461862)) (mask!30599 (_2!7903 lt!461862)) (extraKeys!6142 (_2!7903 lt!461862)) (zeroValue!6248 (_2!7903 lt!461862)) (minValue!6248 (_2!7903 lt!461862)) #b00000000000000000000000000000000 (defaultEntry!6414 (_2!7903 lt!461862))))))

(declare-fun lt!462042 () (_ BitVec 64))

(assert (=> b!1046766 (= lt!462042 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!462051 () (_ BitVec 64))

(assert (=> b!1046766 (= lt!462051 (select (arr!31705 (_keys!11722 (_2!7903 lt!461862))) #b00000000000000000000000000000000))))

(declare-fun lt!462043 () Unit!34155)

(assert (=> b!1046766 (= lt!462043 (addApplyDifferent!489 lt!462058 lt!462042 (minValue!6248 (_2!7903 lt!461862)) lt!462051))))

(assert (=> b!1046766 (= (apply!923 (+!3134 lt!462058 (tuple2!15787 lt!462042 (minValue!6248 (_2!7903 lt!461862)))) lt!462051) (apply!923 lt!462058 lt!462051))))

(declare-fun lt!462057 () Unit!34155)

(assert (=> b!1046766 (= lt!462057 lt!462043)))

(declare-fun lt!462044 () ListLongMap!13797)

(assert (=> b!1046766 (= lt!462044 (getCurrentListMapNoExtraKeys!3574 (_keys!11722 (_2!7903 lt!461862)) (_values!6437 (_2!7903 lt!461862)) (mask!30599 (_2!7903 lt!461862)) (extraKeys!6142 (_2!7903 lt!461862)) (zeroValue!6248 (_2!7903 lt!461862)) (minValue!6248 (_2!7903 lt!461862)) #b00000000000000000000000000000000 (defaultEntry!6414 (_2!7903 lt!461862))))))

(declare-fun lt!462062 () (_ BitVec 64))

(assert (=> b!1046766 (= lt!462062 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!462048 () (_ BitVec 64))

(assert (=> b!1046766 (= lt!462048 (select (arr!31705 (_keys!11722 (_2!7903 lt!461862))) #b00000000000000000000000000000000))))

(declare-fun lt!462063 () Unit!34155)

(assert (=> b!1046766 (= lt!462063 (addApplyDifferent!489 lt!462044 lt!462062 (zeroValue!6248 (_2!7903 lt!461862)) lt!462048))))

(assert (=> b!1046766 (= (apply!923 (+!3134 lt!462044 (tuple2!15787 lt!462062 (zeroValue!6248 (_2!7903 lt!461862)))) lt!462048) (apply!923 lt!462044 lt!462048))))

(declare-fun lt!462045 () Unit!34155)

(assert (=> b!1046766 (= lt!462045 lt!462063)))

(declare-fun lt!462046 () ListLongMap!13797)

(assert (=> b!1046766 (= lt!462046 (getCurrentListMapNoExtraKeys!3574 (_keys!11722 (_2!7903 lt!461862)) (_values!6437 (_2!7903 lt!461862)) (mask!30599 (_2!7903 lt!461862)) (extraKeys!6142 (_2!7903 lt!461862)) (zeroValue!6248 (_2!7903 lt!461862)) (minValue!6248 (_2!7903 lt!461862)) #b00000000000000000000000000000000 (defaultEntry!6414 (_2!7903 lt!461862))))))

(declare-fun lt!462047 () (_ BitVec 64))

(assert (=> b!1046766 (= lt!462047 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!462061 () (_ BitVec 64))

(assert (=> b!1046766 (= lt!462061 (select (arr!31705 (_keys!11722 (_2!7903 lt!461862))) #b00000000000000000000000000000000))))

(assert (=> b!1046766 (= lt!462059 (addApplyDifferent!489 lt!462046 lt!462047 (minValue!6248 (_2!7903 lt!461862)) lt!462061))))

(assert (=> b!1046766 (= (apply!923 (+!3134 lt!462046 (tuple2!15787 lt!462047 (minValue!6248 (_2!7903 lt!461862)))) lt!462061) (apply!923 lt!462046 lt!462061))))

(declare-fun b!1046767 () Bool)

(assert (=> b!1046767 (= e!593462 (not call!44581))))

(declare-fun b!1046768 () Bool)

(declare-fun res!696630 () Bool)

(declare-fun e!593459 () Bool)

(assert (=> b!1046768 (=> (not res!696630) (not e!593459))))

(assert (=> b!1046768 (= res!696630 e!593460)))

(declare-fun c!106702 () Bool)

(assert (=> b!1046768 (= c!106702 (not (= (bvand (extraKeys!6142 (_2!7903 lt!461862)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1046769 () Bool)

(declare-fun e!593458 () ListLongMap!13797)

(declare-fun call!44584 () ListLongMap!13797)

(assert (=> b!1046769 (= e!593458 (+!3134 call!44584 (tuple2!15787 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6248 (_2!7903 lt!461862)))))))

(declare-fun b!1046770 () Bool)

(assert (=> b!1046770 (= e!593460 (not call!44582))))

(declare-fun b!1046771 () Bool)

(declare-fun e!593455 () Bool)

(assert (=> b!1046771 (= e!593455 (= (apply!923 lt!462052 (select (arr!31705 (_keys!11722 (_2!7903 lt!461862))) #b00000000000000000000000000000000)) (get!16588 (select (arr!31706 (_values!6437 (_2!7903 lt!461862))) #b00000000000000000000000000000000) (dynLambda!2029 (defaultEntry!6414 (_2!7903 lt!461862)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1046771 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32242 (_values!6437 (_2!7903 lt!461862)))))))

(assert (=> b!1046771 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32241 (_keys!11722 (_2!7903 lt!461862)))))))

(declare-fun b!1046772 () Bool)

(declare-fun res!696623 () Bool)

(assert (=> b!1046772 (=> (not res!696623) (not e!593459))))

(declare-fun e!593466 () Bool)

(assert (=> b!1046772 (= res!696623 e!593466)))

(declare-fun res!696628 () Bool)

(assert (=> b!1046772 (=> res!696628 e!593466)))

(declare-fun e!593465 () Bool)

(assert (=> b!1046772 (= res!696628 (not e!593465))))

(declare-fun res!696624 () Bool)

(assert (=> b!1046772 (=> (not res!696624) (not e!593465))))

(assert (=> b!1046772 (= res!696624 (bvslt #b00000000000000000000000000000000 (size!32241 (_keys!11722 (_2!7903 lt!461862)))))))

(declare-fun b!1046773 () Bool)

(assert (=> b!1046773 (= e!593461 (= (apply!923 lt!462052 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6248 (_2!7903 lt!461862))))))

(declare-fun bm!44579 () Bool)

(declare-fun call!44586 () ListLongMap!13797)

(declare-fun call!44580 () ListLongMap!13797)

(assert (=> bm!44579 (= call!44586 call!44580)))

(declare-fun b!1046774 () Bool)

(assert (=> b!1046774 (= e!593465 (validKeyInArray!0 (select (arr!31705 (_keys!11722 (_2!7903 lt!461862))) #b00000000000000000000000000000000)))))

(declare-fun bm!44580 () Bool)

(assert (=> bm!44580 (= call!44580 (getCurrentListMapNoExtraKeys!3574 (_keys!11722 (_2!7903 lt!461862)) (_values!6437 (_2!7903 lt!461862)) (mask!30599 (_2!7903 lt!461862)) (extraKeys!6142 (_2!7903 lt!461862)) (zeroValue!6248 (_2!7903 lt!461862)) (minValue!6248 (_2!7903 lt!461862)) #b00000000000000000000000000000000 (defaultEntry!6414 (_2!7903 lt!461862))))))

(declare-fun b!1046775 () Bool)

(assert (=> b!1046775 (= e!593466 e!593455)))

(declare-fun res!696626 () Bool)

(assert (=> b!1046775 (=> (not res!696626) (not e!593455))))

(assert (=> b!1046775 (= res!696626 (contains!6107 lt!462052 (select (arr!31705 (_keys!11722 (_2!7903 lt!461862))) #b00000000000000000000000000000000)))))

(assert (=> b!1046775 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32241 (_keys!11722 (_2!7903 lt!461862)))))))

(declare-fun b!1046776 () Bool)

(declare-fun c!106699 () Bool)

(assert (=> b!1046776 (= c!106699 (and (not (= (bvand (extraKeys!6142 (_2!7903 lt!461862)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6142 (_2!7903 lt!461862)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!593463 () ListLongMap!13797)

(assert (=> b!1046776 (= e!593463 e!593454)))

(declare-fun bm!44581 () Bool)

(declare-fun call!44583 () ListLongMap!13797)

(assert (=> bm!44581 (= call!44583 call!44584)))

(declare-fun bm!44582 () Bool)

(assert (=> bm!44582 (= call!44585 call!44586)))

(declare-fun b!1046777 () Bool)

(assert (=> b!1046777 (= e!593457 (= (apply!923 lt!462052 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6248 (_2!7903 lt!461862))))))

(declare-fun b!1046778 () Bool)

(assert (=> b!1046778 (= e!593454 call!44583)))

(declare-fun d!126993 () Bool)

(assert (=> d!126993 e!593459))

(declare-fun res!696627 () Bool)

(assert (=> d!126993 (=> (not res!696627) (not e!593459))))

(assert (=> d!126993 (= res!696627 (or (bvsge #b00000000000000000000000000000000 (size!32241 (_keys!11722 (_2!7903 lt!461862)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32241 (_keys!11722 (_2!7903 lt!461862)))))))))

(declare-fun lt!462060 () ListLongMap!13797)

(assert (=> d!126993 (= lt!462052 lt!462060)))

(declare-fun lt!462050 () Unit!34155)

(assert (=> d!126993 (= lt!462050 e!593464)))

(declare-fun c!106700 () Bool)

(assert (=> d!126993 (= c!106700 e!593456)))

(declare-fun res!696629 () Bool)

(assert (=> d!126993 (=> (not res!696629) (not e!593456))))

(assert (=> d!126993 (= res!696629 (bvslt #b00000000000000000000000000000000 (size!32241 (_keys!11722 (_2!7903 lt!461862)))))))

(assert (=> d!126993 (= lt!462060 e!593458)))

(declare-fun c!106698 () Bool)

(assert (=> d!126993 (= c!106698 (and (not (= (bvand (extraKeys!6142 (_2!7903 lt!461862)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6142 (_2!7903 lt!461862)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126993 (validMask!0 (mask!30599 (_2!7903 lt!461862)))))

(assert (=> d!126993 (= (getCurrentListMap!3958 (_keys!11722 (_2!7903 lt!461862)) (_values!6437 (_2!7903 lt!461862)) (mask!30599 (_2!7903 lt!461862)) (extraKeys!6142 (_2!7903 lt!461862)) (zeroValue!6248 (_2!7903 lt!461862)) (minValue!6248 (_2!7903 lt!461862)) #b00000000000000000000000000000000 (defaultEntry!6414 (_2!7903 lt!461862))) lt!462052)))

(declare-fun b!1046779 () Bool)

(assert (=> b!1046779 (= e!593459 e!593462)))

(declare-fun c!106701 () Bool)

(assert (=> b!1046779 (= c!106701 (not (= (bvand (extraKeys!6142 (_2!7903 lt!461862)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44583 () Bool)

(declare-fun c!106697 () Bool)

(assert (=> bm!44583 (= call!44584 (+!3134 (ite c!106698 call!44580 (ite c!106697 call!44586 call!44585)) (ite (or c!106698 c!106697) (tuple2!15787 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6248 (_2!7903 lt!461862))) (tuple2!15787 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6248 (_2!7903 lt!461862))))))))

(declare-fun b!1046780 () Bool)

(assert (=> b!1046780 (= e!593463 call!44583)))

(declare-fun b!1046781 () Bool)

(assert (=> b!1046781 (= e!593458 e!593463)))

(assert (=> b!1046781 (= c!106697 (and (not (= (bvand (extraKeys!6142 (_2!7903 lt!461862)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6142 (_2!7903 lt!461862)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!126993 c!106698) b!1046769))

(assert (= (and d!126993 (not c!106698)) b!1046781))

(assert (= (and b!1046781 c!106697) b!1046780))

(assert (= (and b!1046781 (not c!106697)) b!1046776))

(assert (= (and b!1046776 c!106699) b!1046778))

(assert (= (and b!1046776 (not c!106699)) b!1046761))

(assert (= (or b!1046778 b!1046761) bm!44582))

(assert (= (or b!1046780 bm!44582) bm!44579))

(assert (= (or b!1046780 b!1046778) bm!44581))

(assert (= (or b!1046769 bm!44579) bm!44580))

(assert (= (or b!1046769 bm!44581) bm!44583))

(assert (= (and d!126993 res!696629) b!1046762))

(assert (= (and d!126993 c!106700) b!1046766))

(assert (= (and d!126993 (not c!106700)) b!1046763))

(assert (= (and d!126993 res!696627) b!1046772))

(assert (= (and b!1046772 res!696624) b!1046774))

(assert (= (and b!1046772 (not res!696628)) b!1046775))

(assert (= (and b!1046775 res!696626) b!1046771))

(assert (= (and b!1046772 res!696623) b!1046768))

(assert (= (and b!1046768 c!106702) b!1046764))

(assert (= (and b!1046768 (not c!106702)) b!1046770))

(assert (= (and b!1046764 res!696622) b!1046773))

(assert (= (or b!1046764 b!1046770) bm!44578))

(assert (= (and b!1046768 res!696630) b!1046779))

(assert (= (and b!1046779 c!106701) b!1046765))

(assert (= (and b!1046779 (not c!106701)) b!1046767))

(assert (= (and b!1046765 res!696625) b!1046777))

(assert (= (or b!1046765 b!1046767) bm!44577))

(declare-fun b_lambda!16309 () Bool)

(assert (=> (not b_lambda!16309) (not b!1046771)))

(declare-fun tb!7079 () Bool)

(declare-fun t!31268 () Bool)

(assert (=> (and b!1046553 (= (defaultEntry!6414 thiss!1427) (defaultEntry!6414 (_2!7903 lt!461862))) t!31268) tb!7079))

(declare-fun result!14591 () Bool)

(assert (=> tb!7079 (= result!14591 tp_is_empty!24853)))

(assert (=> b!1046771 t!31268))

(declare-fun b_and!33773 () Bool)

(assert (= b_and!33771 (and (=> t!31268 result!14591) b_and!33773)))

(declare-fun m!966835 () Bool)

(assert (=> b!1046773 m!966835))

(declare-fun m!966837 () Bool)

(assert (=> b!1046771 m!966837))

(declare-fun m!966839 () Bool)

(assert (=> b!1046771 m!966839))

(declare-fun m!966841 () Bool)

(assert (=> b!1046771 m!966841))

(assert (=> b!1046771 m!966839))

(declare-fun m!966843 () Bool)

(assert (=> b!1046771 m!966843))

(declare-fun m!966845 () Bool)

(assert (=> b!1046771 m!966845))

(assert (=> b!1046771 m!966837))

(assert (=> b!1046771 m!966843))

(declare-fun m!966847 () Bool)

(assert (=> b!1046777 m!966847))

(assert (=> b!1046774 m!966843))

(assert (=> b!1046774 m!966843))

(declare-fun m!966849 () Bool)

(assert (=> b!1046774 m!966849))

(declare-fun m!966851 () Bool)

(assert (=> bm!44580 m!966851))

(declare-fun m!966853 () Bool)

(assert (=> b!1046769 m!966853))

(declare-fun m!966855 () Bool)

(assert (=> bm!44577 m!966855))

(declare-fun m!966857 () Bool)

(assert (=> b!1046766 m!966857))

(declare-fun m!966859 () Bool)

(assert (=> b!1046766 m!966859))

(declare-fun m!966861 () Bool)

(assert (=> b!1046766 m!966861))

(declare-fun m!966863 () Bool)

(assert (=> b!1046766 m!966863))

(assert (=> b!1046766 m!966843))

(declare-fun m!966865 () Bool)

(assert (=> b!1046766 m!966865))

(declare-fun m!966867 () Bool)

(assert (=> b!1046766 m!966867))

(declare-fun m!966869 () Bool)

(assert (=> b!1046766 m!966869))

(declare-fun m!966871 () Bool)

(assert (=> b!1046766 m!966871))

(declare-fun m!966873 () Bool)

(assert (=> b!1046766 m!966873))

(declare-fun m!966875 () Bool)

(assert (=> b!1046766 m!966875))

(assert (=> b!1046766 m!966851))

(assert (=> b!1046766 m!966861))

(declare-fun m!966877 () Bool)

(assert (=> b!1046766 m!966877))

(assert (=> b!1046766 m!966871))

(assert (=> b!1046766 m!966875))

(declare-fun m!966879 () Bool)

(assert (=> b!1046766 m!966879))

(declare-fun m!966881 () Bool)

(assert (=> b!1046766 m!966881))

(assert (=> b!1046766 m!966865))

(declare-fun m!966883 () Bool)

(assert (=> b!1046766 m!966883))

(declare-fun m!966885 () Bool)

(assert (=> b!1046766 m!966885))

(assert (=> d!126993 m!966535))

(declare-fun m!966887 () Bool)

(assert (=> bm!44578 m!966887))

(declare-fun m!966889 () Bool)

(assert (=> bm!44583 m!966889))

(assert (=> b!1046775 m!966843))

(assert (=> b!1046775 m!966843))

(declare-fun m!966891 () Bool)

(assert (=> b!1046775 m!966891))

(assert (=> b!1046762 m!966843))

(assert (=> b!1046762 m!966843))

(assert (=> b!1046762 m!966849))

(assert (=> b!1046551 d!126993))

(declare-fun b!1046792 () Bool)

(declare-fun e!593472 () Bool)

(assert (=> b!1046792 (= e!593472 (bvslt (size!32241 (_keys!11722 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1046791 () Bool)

(declare-fun res!696642 () Bool)

(assert (=> b!1046791 (=> (not res!696642) (not e!593472))))

(assert (=> b!1046791 (= res!696642 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1046793 () Bool)

(declare-fun e!593471 () Bool)

(assert (=> b!1046793 (= e!593471 (= (arrayCountValidKeys!0 (array!65930 (store (arr!31705 (_keys!11722 thiss!1427)) (index!41584 lt!461864) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32241 (_keys!11722 thiss!1427))) #b00000000000000000000000000000000 (size!32241 (_keys!11722 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11722 thiss!1427) #b00000000000000000000000000000000 (size!32241 (_keys!11722 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun d!126995 () Bool)

(assert (=> d!126995 e!593471))

(declare-fun res!696640 () Bool)

(assert (=> d!126995 (=> (not res!696640) (not e!593471))))

(assert (=> d!126995 (= res!696640 (and (bvsge (index!41584 lt!461864) #b00000000000000000000000000000000) (bvslt (index!41584 lt!461864) (size!32241 (_keys!11722 thiss!1427)))))))

(declare-fun lt!462066 () Unit!34155)

(declare-fun choose!82 (array!65929 (_ BitVec 32) (_ BitVec 64)) Unit!34155)

(assert (=> d!126995 (= lt!462066 (choose!82 (_keys!11722 thiss!1427) (index!41584 lt!461864) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!126995 e!593472))

(declare-fun res!696639 () Bool)

(assert (=> d!126995 (=> (not res!696639) (not e!593472))))

(assert (=> d!126995 (= res!696639 (and (bvsge (index!41584 lt!461864) #b00000000000000000000000000000000) (bvslt (index!41584 lt!461864) (size!32241 (_keys!11722 thiss!1427)))))))

(assert (=> d!126995 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11722 thiss!1427) (index!41584 lt!461864) #b1000000000000000000000000000000000000000000000000000000000000000) lt!462066)))

(declare-fun b!1046790 () Bool)

(declare-fun res!696641 () Bool)

(assert (=> b!1046790 (=> (not res!696641) (not e!593472))))

(assert (=> b!1046790 (= res!696641 (validKeyInArray!0 (select (arr!31705 (_keys!11722 thiss!1427)) (index!41584 lt!461864))))))

(assert (= (and d!126995 res!696639) b!1046790))

(assert (= (and b!1046790 res!696641) b!1046791))

(assert (= (and b!1046791 res!696642) b!1046792))

(assert (= (and d!126995 res!696640) b!1046793))

(declare-fun m!966893 () Bool)

(assert (=> b!1046791 m!966893))

(assert (=> b!1046793 m!966575))

(declare-fun m!966895 () Bool)

(assert (=> b!1046793 m!966895))

(assert (=> b!1046793 m!966549))

(declare-fun m!966897 () Bool)

(assert (=> d!126995 m!966897))

(declare-fun m!966899 () Bool)

(assert (=> b!1046790 m!966899))

(assert (=> b!1046790 m!966899))

(declare-fun m!966901 () Bool)

(assert (=> b!1046790 m!966901))

(assert (=> b!1046551 d!126995))

(declare-fun b!1046794 () Bool)

(declare-fun e!593474 () (_ BitVec 32))

(declare-fun call!44587 () (_ BitVec 32))

(assert (=> b!1046794 (= e!593474 call!44587)))

(declare-fun b!1046795 () Bool)

(assert (=> b!1046795 (= e!593474 (bvadd #b00000000000000000000000000000001 call!44587))))

(declare-fun d!126997 () Bool)

(declare-fun lt!462067 () (_ BitVec 32))

(assert (=> d!126997 (and (bvsge lt!462067 #b00000000000000000000000000000000) (bvsle lt!462067 (bvsub (size!32241 lt!461868) #b00000000000000000000000000000000)))))

(declare-fun e!593473 () (_ BitVec 32))

(assert (=> d!126997 (= lt!462067 e!593473)))

(declare-fun c!106704 () Bool)

(assert (=> d!126997 (= c!106704 (bvsge #b00000000000000000000000000000000 (size!32241 (_keys!11722 thiss!1427))))))

(assert (=> d!126997 (and (bvsle #b00000000000000000000000000000000 (size!32241 (_keys!11722 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32241 (_keys!11722 thiss!1427)) (size!32241 lt!461868)))))

(assert (=> d!126997 (= (arrayCountValidKeys!0 lt!461868 #b00000000000000000000000000000000 (size!32241 (_keys!11722 thiss!1427))) lt!462067)))

(declare-fun bm!44584 () Bool)

(assert (=> bm!44584 (= call!44587 (arrayCountValidKeys!0 lt!461868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32241 (_keys!11722 thiss!1427))))))

(declare-fun b!1046796 () Bool)

(assert (=> b!1046796 (= e!593473 e!593474)))

(declare-fun c!106703 () Bool)

(assert (=> b!1046796 (= c!106703 (validKeyInArray!0 (select (arr!31705 lt!461868) #b00000000000000000000000000000000)))))

(declare-fun b!1046797 () Bool)

(assert (=> b!1046797 (= e!593473 #b00000000000000000000000000000000)))

(assert (= (and d!126997 c!106704) b!1046797))

(assert (= (and d!126997 (not c!106704)) b!1046796))

(assert (= (and b!1046796 c!106703) b!1046795))

(assert (= (and b!1046796 (not c!106703)) b!1046794))

(assert (= (or b!1046795 b!1046794) bm!44584))

(declare-fun m!966903 () Bool)

(assert (=> bm!44584 m!966903))

(assert (=> b!1046796 m!966761))

(assert (=> b!1046796 m!966761))

(assert (=> b!1046796 m!966767))

(assert (=> b!1046551 d!126997))

(declare-fun b!1046806 () Bool)

(declare-fun e!593481 () Bool)

(declare-fun e!593483 () Bool)

(assert (=> b!1046806 (= e!593481 e!593483)))

(declare-fun c!106707 () Bool)

(assert (=> b!1046806 (= c!106707 (validKeyInArray!0 (select (arr!31705 lt!461868) #b00000000000000000000000000000000)))))

(declare-fun d!126999 () Bool)

(declare-fun res!696648 () Bool)

(assert (=> d!126999 (=> res!696648 e!593481)))

(assert (=> d!126999 (= res!696648 (bvsge #b00000000000000000000000000000000 (size!32241 lt!461868)))))

(assert (=> d!126999 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!461868 (mask!30599 thiss!1427)) e!593481)))

(declare-fun b!1046807 () Bool)

(declare-fun e!593482 () Bool)

(declare-fun call!44590 () Bool)

(assert (=> b!1046807 (= e!593482 call!44590)))

(declare-fun b!1046808 () Bool)

(assert (=> b!1046808 (= e!593483 call!44590)))

(declare-fun b!1046809 () Bool)

(assert (=> b!1046809 (= e!593483 e!593482)))

(declare-fun lt!462074 () (_ BitVec 64))

(assert (=> b!1046809 (= lt!462074 (select (arr!31705 lt!461868) #b00000000000000000000000000000000))))

(declare-fun lt!462076 () Unit!34155)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65929 (_ BitVec 64) (_ BitVec 32)) Unit!34155)

(assert (=> b!1046809 (= lt!462076 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!461868 lt!462074 #b00000000000000000000000000000000))))

(assert (=> b!1046809 (arrayContainsKey!0 lt!461868 lt!462074 #b00000000000000000000000000000000)))

(declare-fun lt!462075 () Unit!34155)

(assert (=> b!1046809 (= lt!462075 lt!462076)))

(declare-fun res!696647 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65929 (_ BitVec 32)) SeekEntryResult!9803)

(assert (=> b!1046809 (= res!696647 (= (seekEntryOrOpen!0 (select (arr!31705 lt!461868) #b00000000000000000000000000000000) lt!461868 (mask!30599 thiss!1427)) (Found!9803 #b00000000000000000000000000000000)))))

(assert (=> b!1046809 (=> (not res!696647) (not e!593482))))

(declare-fun bm!44587 () Bool)

(assert (=> bm!44587 (= call!44590 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!461868 (mask!30599 thiss!1427)))))

(assert (= (and d!126999 (not res!696648)) b!1046806))

(assert (= (and b!1046806 c!106707) b!1046809))

(assert (= (and b!1046806 (not c!106707)) b!1046808))

(assert (= (and b!1046809 res!696647) b!1046807))

(assert (= (or b!1046807 b!1046808) bm!44587))

(assert (=> b!1046806 m!966761))

(assert (=> b!1046806 m!966761))

(assert (=> b!1046806 m!966767))

(assert (=> b!1046809 m!966761))

(declare-fun m!966905 () Bool)

(assert (=> b!1046809 m!966905))

(declare-fun m!966907 () Bool)

(assert (=> b!1046809 m!966907))

(assert (=> b!1046809 m!966761))

(declare-fun m!966909 () Bool)

(assert (=> b!1046809 m!966909))

(declare-fun m!966911 () Bool)

(assert (=> bm!44587 m!966911))

(assert (=> b!1046551 d!126999))

(declare-fun d!127001 () Bool)

(declare-fun lt!462087 () SeekEntryResult!9803)

(assert (=> d!127001 (and (or ((_ is MissingVacant!9803) lt!462087) (not ((_ is Found!9803) lt!462087)) (and (bvsge (index!41584 lt!462087) #b00000000000000000000000000000000) (bvslt (index!41584 lt!462087) (size!32241 (_keys!11722 thiss!1427))))) (not ((_ is MissingVacant!9803) lt!462087)) (or (not ((_ is Found!9803) lt!462087)) (= (select (arr!31705 (_keys!11722 thiss!1427)) (index!41584 lt!462087)) key!909)))))

(declare-fun e!593490 () SeekEntryResult!9803)

(assert (=> d!127001 (= lt!462087 e!593490)))

(declare-fun c!106716 () Bool)

(declare-fun lt!462088 () SeekEntryResult!9803)

(assert (=> d!127001 (= c!106716 (and ((_ is Intermediate!9803) lt!462088) (undefined!10615 lt!462088)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65929 (_ BitVec 32)) SeekEntryResult!9803)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!127001 (= lt!462088 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30599 thiss!1427)) key!909 (_keys!11722 thiss!1427) (mask!30599 thiss!1427)))))

(assert (=> d!127001 (validMask!0 (mask!30599 thiss!1427))))

(assert (=> d!127001 (= (seekEntry!0 key!909 (_keys!11722 thiss!1427) (mask!30599 thiss!1427)) lt!462087)))

(declare-fun b!1046822 () Bool)

(declare-fun e!593491 () SeekEntryResult!9803)

(assert (=> b!1046822 (= e!593491 (Found!9803 (index!41585 lt!462088)))))

(declare-fun b!1046823 () Bool)

(declare-fun c!106714 () Bool)

(declare-fun lt!462086 () (_ BitVec 64))

(assert (=> b!1046823 (= c!106714 (= lt!462086 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!593492 () SeekEntryResult!9803)

(assert (=> b!1046823 (= e!593491 e!593492)))

(declare-fun b!1046824 () Bool)

(assert (=> b!1046824 (= e!593492 (MissingZero!9803 (index!41585 lt!462088)))))

(declare-fun b!1046825 () Bool)

(assert (=> b!1046825 (= e!593490 Undefined!9803)))

(declare-fun b!1046826 () Bool)

(assert (=> b!1046826 (= e!593490 e!593491)))

(assert (=> b!1046826 (= lt!462086 (select (arr!31705 (_keys!11722 thiss!1427)) (index!41585 lt!462088)))))

(declare-fun c!106715 () Bool)

(assert (=> b!1046826 (= c!106715 (= lt!462086 key!909))))

(declare-fun b!1046827 () Bool)

(declare-fun lt!462085 () SeekEntryResult!9803)

(assert (=> b!1046827 (= e!593492 (ite ((_ is MissingVacant!9803) lt!462085) (MissingZero!9803 (index!41586 lt!462085)) lt!462085))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65929 (_ BitVec 32)) SeekEntryResult!9803)

(assert (=> b!1046827 (= lt!462085 (seekKeyOrZeroReturnVacant!0 (x!93335 lt!462088) (index!41585 lt!462088) (index!41585 lt!462088) key!909 (_keys!11722 thiss!1427) (mask!30599 thiss!1427)))))

(assert (= (and d!127001 c!106716) b!1046825))

(assert (= (and d!127001 (not c!106716)) b!1046826))

(assert (= (and b!1046826 c!106715) b!1046822))

(assert (= (and b!1046826 (not c!106715)) b!1046823))

(assert (= (and b!1046823 c!106714) b!1046824))

(assert (= (and b!1046823 (not c!106714)) b!1046827))

(declare-fun m!966913 () Bool)

(assert (=> d!127001 m!966913))

(declare-fun m!966915 () Bool)

(assert (=> d!127001 m!966915))

(assert (=> d!127001 m!966915))

(declare-fun m!966917 () Bool)

(assert (=> d!127001 m!966917))

(assert (=> d!127001 m!966747))

(declare-fun m!966919 () Bool)

(assert (=> b!1046826 m!966919))

(declare-fun m!966921 () Bool)

(assert (=> b!1046827 m!966921))

(assert (=> b!1046547 d!127001))

(declare-fun b!1046835 () Bool)

(declare-fun e!593498 () Bool)

(assert (=> b!1046835 (= e!593498 tp_is_empty!24853)))

(declare-fun b!1046834 () Bool)

(declare-fun e!593497 () Bool)

(assert (=> b!1046834 (= e!593497 tp_is_empty!24853)))

(declare-fun condMapEmpty!38927 () Bool)

(declare-fun mapDefault!38927 () ValueCell!11723)

(assert (=> mapNonEmpty!38918 (= condMapEmpty!38927 (= mapRest!38918 ((as const (Array (_ BitVec 32) ValueCell!11723)) mapDefault!38927)))))

(declare-fun mapRes!38927 () Bool)

(assert (=> mapNonEmpty!38918 (= tp!74655 (and e!593498 mapRes!38927))))

(declare-fun mapIsEmpty!38927 () Bool)

(assert (=> mapIsEmpty!38927 mapRes!38927))

(declare-fun mapNonEmpty!38927 () Bool)

(declare-fun tp!74670 () Bool)

(assert (=> mapNonEmpty!38927 (= mapRes!38927 (and tp!74670 e!593497))))

(declare-fun mapKey!38927 () (_ BitVec 32))

(declare-fun mapValue!38927 () ValueCell!11723)

(declare-fun mapRest!38927 () (Array (_ BitVec 32) ValueCell!11723))

(assert (=> mapNonEmpty!38927 (= mapRest!38918 (store mapRest!38927 mapKey!38927 mapValue!38927))))

(assert (= (and mapNonEmpty!38918 condMapEmpty!38927) mapIsEmpty!38927))

(assert (= (and mapNonEmpty!38918 (not condMapEmpty!38927)) mapNonEmpty!38927))

(assert (= (and mapNonEmpty!38927 ((_ is ValueCellFull!11723) mapValue!38927)) b!1046834))

(assert (= (and mapNonEmpty!38918 ((_ is ValueCellFull!11723) mapDefault!38927)) b!1046835))

(declare-fun m!966923 () Bool)

(assert (=> mapNonEmpty!38927 m!966923))

(declare-fun b_lambda!16311 () Bool)

(assert (= b_lambda!16307 (or (and b!1046553 b_free!21133) b_lambda!16311)))

(declare-fun b_lambda!16313 () Bool)

(assert (= b_lambda!16305 (or (and b!1046553 b_free!21133) b_lambda!16313)))

(declare-fun b_lambda!16315 () Bool)

(assert (= b_lambda!16303 (or (and b!1046553 b_free!21133) b_lambda!16315)))

(check-sat (not d!126983) (not d!126973) b_and!33773 (not b!1046711) (not b_next!21133) (not b!1046714) (not b_lambda!16311) (not bm!44558) (not bm!44576) (not b!1046721) (not b!1046806) (not d!127001) (not bm!44564) (not b!1046622) (not b!1046773) (not d!126971) (not b!1046727) (not b!1046809) (not b!1046693) (not b!1046706) (not b!1046741) (not bm!44565) (not d!126985) (not mapNonEmpty!38927) (not b_lambda!16301) (not b!1046682) (not b!1046793) (not bm!44563) (not bm!44557) (not d!126969) (not bm!44560) (not b!1046796) (not b!1046690) (not d!126993) (not b!1046742) (not b!1046689) (not d!126995) (not b_lambda!16313) (not b!1046620) (not bm!44584) (not b!1046791) (not b_lambda!16315) (not b!1046712) (not bm!44587) (not b!1046703) (not b!1046724) (not b!1046691) (not b!1046738) (not b!1046632) (not b!1046827) (not bm!44567) (not b!1046634) (not b!1046708) (not d!126977) (not d!126981) (not b!1046759) (not bm!44573) (not b!1046687) (not b!1046771) (not b!1046748) (not b!1046774) (not b!1046621) (not b!1046710) (not b!1046766) (not b!1046790) (not bm!44578) (not b!1046678) (not b!1046685) (not d!126979) (not b_lambda!16309) (not bm!44583) (not bm!44570) (not d!126975) tp_is_empty!24853 (not b!1046769) (not bm!44577) (not b!1046625) (not b!1046762) (not bm!44580) (not b!1046777) (not b!1046699) (not b!1046775))
(check-sat b_and!33773 (not b_next!21133))
