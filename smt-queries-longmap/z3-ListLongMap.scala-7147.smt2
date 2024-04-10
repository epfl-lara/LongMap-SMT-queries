; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90838 () Bool)

(assert start!90838)

(declare-fun b!1038355 () Bool)

(declare-fun b_free!20937 () Bool)

(declare-fun b_next!20937 () Bool)

(assert (=> b!1038355 (= b_free!20937 (not b_next!20937))))

(declare-fun tp!73971 () Bool)

(declare-fun b_and!33469 () Bool)

(assert (=> b!1038355 (= tp!73971 b_and!33469)))

(declare-fun b!1038345 () Bool)

(declare-fun e!587495 () Bool)

(declare-fun tp_is_empty!24657 () Bool)

(assert (=> b!1038345 (= e!587495 tp_is_empty!24657)))

(declare-fun mapIsEmpty!38529 () Bool)

(declare-fun mapRes!38529 () Bool)

(assert (=> mapIsEmpty!38529 mapRes!38529))

(declare-fun res!692680 () Bool)

(declare-fun e!587500 () Bool)

(assert (=> start!90838 (=> (not res!692680) (not e!587500))))

(declare-datatypes ((V!37749 0))(
  ( (V!37750 (val!12379 Int)) )
))
(declare-datatypes ((ValueCell!11625 0))(
  ( (ValueCellFull!11625 (v!14965 V!37749)) (EmptyCell!11625) )
))
(declare-datatypes ((array!65428 0))(
  ( (array!65429 (arr!31491 (Array (_ BitVec 32) (_ BitVec 64))) (size!32021 (_ BitVec 32))) )
))
(declare-datatypes ((array!65430 0))(
  ( (array!65431 (arr!31492 (Array (_ BitVec 32) ValueCell!11625)) (size!32022 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5844 0))(
  ( (LongMapFixedSize!5845 (defaultEntry!6304 Int) (mask!30240 (_ BitVec 32)) (extraKeys!6032 (_ BitVec 32)) (zeroValue!6138 V!37749) (minValue!6138 V!37749) (_size!2977 (_ BitVec 32)) (_keys!11505 array!65428) (_values!6327 array!65430) (_vacant!2977 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5844)

(declare-fun valid!2201 (LongMapFixedSize!5844) Bool)

(assert (=> start!90838 (= res!692680 (valid!2201 thiss!1427))))

(assert (=> start!90838 e!587500))

(declare-fun e!587498 () Bool)

(assert (=> start!90838 e!587498))

(assert (=> start!90838 true))

(declare-fun b!1038346 () Bool)

(declare-fun e!587497 () Bool)

(declare-datatypes ((SeekEntryResult!9769 0))(
  ( (MissingZero!9769 (index!41447 (_ BitVec 32))) (Found!9769 (index!41448 (_ BitVec 32))) (Intermediate!9769 (undefined!10581 Bool) (index!41449 (_ BitVec 32)) (x!92648 (_ BitVec 32))) (Undefined!9769) (MissingVacant!9769 (index!41450 (_ BitVec 32))) )
))
(declare-fun lt!457705 () SeekEntryResult!9769)

(assert (=> b!1038346 (= e!587497 true)))

(declare-fun b!1038347 () Bool)

(declare-fun res!692685 () Bool)

(assert (=> b!1038347 (=> res!692685 e!587497)))

(declare-datatypes ((List!21935 0))(
  ( (Nil!21932) (Cons!21931 (h!23134 (_ BitVec 64)) (t!31149 List!21935)) )
))
(declare-fun arrayNoDuplicates!0 (array!65428 (_ BitVec 32) List!21935) Bool)

(assert (=> b!1038347 (= res!692685 (not (arrayNoDuplicates!0 (_keys!11505 thiss!1427) #b00000000000000000000000000000000 Nil!21932)))))

(declare-fun b!1038348 () Bool)

(declare-fun res!692682 () Bool)

(assert (=> b!1038348 (=> res!692682 e!587497)))

(declare-fun contains!6036 (List!21935 (_ BitVec 64)) Bool)

(assert (=> b!1038348 (= res!692682 (contains!6036 Nil!21932 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1038349 () Bool)

(declare-fun res!692678 () Bool)

(assert (=> b!1038349 (=> res!692678 e!587497)))

(assert (=> b!1038349 (= res!692678 (contains!6036 Nil!21932 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1038350 () Bool)

(declare-fun e!587499 () Bool)

(declare-fun e!587501 () Bool)

(assert (=> b!1038350 (= e!587499 (and e!587501 mapRes!38529))))

(declare-fun condMapEmpty!38529 () Bool)

(declare-fun mapDefault!38529 () ValueCell!11625)

(assert (=> b!1038350 (= condMapEmpty!38529 (= (arr!31492 (_values!6327 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11625)) mapDefault!38529)))))

(declare-fun b!1038351 () Bool)

(declare-fun e!587494 () Bool)

(assert (=> b!1038351 (= e!587500 e!587494)))

(declare-fun res!692681 () Bool)

(assert (=> b!1038351 (=> (not res!692681) (not e!587494))))

(get-info :version)

(assert (=> b!1038351 (= res!692681 ((_ is Found!9769) lt!457705))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65428 (_ BitVec 32)) SeekEntryResult!9769)

(assert (=> b!1038351 (= lt!457705 (seekEntry!0 key!909 (_keys!11505 thiss!1427) (mask!30240 thiss!1427)))))

(declare-fun b!1038352 () Bool)

(assert (=> b!1038352 (= e!587501 tp_is_empty!24657)))

(declare-fun b!1038353 () Bool)

(assert (=> b!1038353 (= e!587494 (not e!587497))))

(declare-fun res!692684 () Bool)

(assert (=> b!1038353 (=> res!692684 e!587497)))

(assert (=> b!1038353 (= res!692684 (or (bvsge (size!32021 (_keys!11505 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!32021 (_keys!11505 thiss!1427)))))))

(declare-fun arrayCountValidKeys!0 (array!65428 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1038353 (= (arrayCountValidKeys!0 (array!65429 (store (arr!31491 (_keys!11505 thiss!1427)) (index!41448 lt!457705) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32021 (_keys!11505 thiss!1427))) #b00000000000000000000000000000000 (size!32021 (_keys!11505 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11505 thiss!1427) #b00000000000000000000000000000000 (size!32021 (_keys!11505 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33973 0))(
  ( (Unit!33974) )
))
(declare-fun lt!457704 () Unit!33973)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65428 (_ BitVec 32) (_ BitVec 64)) Unit!33973)

(assert (=> b!1038353 (= lt!457704 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11505 thiss!1427) (index!41448 lt!457705) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!38529 () Bool)

(declare-fun tp!73972 () Bool)

(assert (=> mapNonEmpty!38529 (= mapRes!38529 (and tp!73972 e!587495))))

(declare-fun mapRest!38529 () (Array (_ BitVec 32) ValueCell!11625))

(declare-fun mapValue!38529 () ValueCell!11625)

(declare-fun mapKey!38529 () (_ BitVec 32))

(assert (=> mapNonEmpty!38529 (= (arr!31492 (_values!6327 thiss!1427)) (store mapRest!38529 mapKey!38529 mapValue!38529))))

(declare-fun b!1038354 () Bool)

(declare-fun res!692683 () Bool)

(assert (=> b!1038354 (=> res!692683 e!587497)))

(declare-fun noDuplicate!1483 (List!21935) Bool)

(assert (=> b!1038354 (= res!692683 (not (noDuplicate!1483 Nil!21932)))))

(declare-fun array_inv!24349 (array!65428) Bool)

(declare-fun array_inv!24350 (array!65430) Bool)

(assert (=> b!1038355 (= e!587498 (and tp!73971 tp_is_empty!24657 (array_inv!24349 (_keys!11505 thiss!1427)) (array_inv!24350 (_values!6327 thiss!1427)) e!587499))))

(declare-fun b!1038356 () Bool)

(declare-fun res!692679 () Bool)

(assert (=> b!1038356 (=> (not res!692679) (not e!587500))))

(assert (=> b!1038356 (= res!692679 (not (= key!909 (bvneg key!909))))))

(assert (= (and start!90838 res!692680) b!1038356))

(assert (= (and b!1038356 res!692679) b!1038351))

(assert (= (and b!1038351 res!692681) b!1038353))

(assert (= (and b!1038353 (not res!692684)) b!1038354))

(assert (= (and b!1038354 (not res!692683)) b!1038348))

(assert (= (and b!1038348 (not res!692682)) b!1038349))

(assert (= (and b!1038349 (not res!692678)) b!1038347))

(assert (= (and b!1038347 (not res!692685)) b!1038346))

(assert (= (and b!1038350 condMapEmpty!38529) mapIsEmpty!38529))

(assert (= (and b!1038350 (not condMapEmpty!38529)) mapNonEmpty!38529))

(assert (= (and mapNonEmpty!38529 ((_ is ValueCellFull!11625) mapValue!38529)) b!1038345))

(assert (= (and b!1038350 ((_ is ValueCellFull!11625) mapDefault!38529)) b!1038352))

(assert (= b!1038355 b!1038350))

(assert (= start!90838 b!1038355))

(declare-fun m!958297 () Bool)

(assert (=> b!1038353 m!958297))

(declare-fun m!958299 () Bool)

(assert (=> b!1038353 m!958299))

(declare-fun m!958301 () Bool)

(assert (=> b!1038353 m!958301))

(declare-fun m!958303 () Bool)

(assert (=> b!1038353 m!958303))

(declare-fun m!958305 () Bool)

(assert (=> b!1038348 m!958305))

(declare-fun m!958307 () Bool)

(assert (=> b!1038347 m!958307))

(declare-fun m!958309 () Bool)

(assert (=> start!90838 m!958309))

(declare-fun m!958311 () Bool)

(assert (=> b!1038351 m!958311))

(declare-fun m!958313 () Bool)

(assert (=> mapNonEmpty!38529 m!958313))

(declare-fun m!958315 () Bool)

(assert (=> b!1038355 m!958315))

(declare-fun m!958317 () Bool)

(assert (=> b!1038355 m!958317))

(declare-fun m!958319 () Bool)

(assert (=> b!1038354 m!958319))

(declare-fun m!958321 () Bool)

(assert (=> b!1038349 m!958321))

(check-sat (not start!90838) (not b!1038353) (not b!1038355) (not b!1038348) (not b_next!20937) (not b!1038351) (not mapNonEmpty!38529) (not b!1038349) (not b!1038347) (not b!1038354) b_and!33469 tp_is_empty!24657)
(check-sat b_and!33469 (not b_next!20937))
