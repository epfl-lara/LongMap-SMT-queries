; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91930 () Bool)

(assert start!91930)

(declare-fun b!1045392 () Bool)

(declare-fun b_free!21139 () Bool)

(declare-fun b_next!21139 () Bool)

(assert (=> b!1045392 (= b_free!21139 (not b_next!21139))))

(declare-fun tp!74675 () Bool)

(declare-fun b_and!33739 () Bool)

(assert (=> b!1045392 (= tp!74675 b_and!33739)))

(declare-fun b!1045388 () Bool)

(declare-fun e!592584 () Bool)

(declare-fun e!592581 () Bool)

(declare-fun mapRes!38930 () Bool)

(assert (=> b!1045388 (= e!592584 (and e!592581 mapRes!38930))))

(declare-fun condMapEmpty!38930 () Bool)

(declare-datatypes ((V!38019 0))(
  ( (V!38020 (val!12480 Int)) )
))
(declare-datatypes ((ValueCell!11726 0))(
  ( (ValueCellFull!11726 (v!15075 V!38019)) (EmptyCell!11726) )
))
(declare-datatypes ((array!65833 0))(
  ( (array!65834 (arr!31662 (Array (_ BitVec 32) (_ BitVec 64))) (size!32199 (_ BitVec 32))) )
))
(declare-datatypes ((array!65835 0))(
  ( (array!65836 (arr!31663 (Array (_ BitVec 32) ValueCell!11726)) (size!32200 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6046 0))(
  ( (LongMapFixedSize!6047 (defaultEntry!6419 Int) (mask!30545 (_ BitVec 32)) (extraKeys!6147 (_ BitVec 32)) (zeroValue!6253 V!38019) (minValue!6253 V!38019) (_size!3078 (_ BitVec 32)) (_keys!11687 array!65833) (_values!6442 array!65835) (_vacant!3078 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6046)

(declare-fun mapDefault!38930 () ValueCell!11726)

(assert (=> b!1045388 (= condMapEmpty!38930 (= (arr!31663 (_values!6442 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11726)) mapDefault!38930)))))

(declare-fun b!1045389 () Bool)

(declare-fun e!592587 () Bool)

(declare-fun e!592586 () Bool)

(assert (=> b!1045389 (= e!592587 (not e!592586))))

(declare-fun res!696086 () Bool)

(assert (=> b!1045389 (=> res!696086 e!592586)))

(declare-datatypes ((Unit!34033 0))(
  ( (Unit!34034) )
))
(declare-datatypes ((tuple2!15860 0))(
  ( (tuple2!15861 (_1!7941 Unit!34033) (_2!7941 LongMapFixedSize!6046)) )
))
(declare-fun lt!461394 () tuple2!15860)

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15862 0))(
  ( (tuple2!15863 (_1!7942 (_ BitVec 64)) (_2!7942 V!38019)) )
))
(declare-datatypes ((List!22054 0))(
  ( (Nil!22051) (Cons!22050 (h!23258 tuple2!15862) (t!31313 List!22054)) )
))
(declare-datatypes ((ListLongMap!13861 0))(
  ( (ListLongMap!13862 (toList!6946 List!22054)) )
))
(declare-fun contains!6059 (ListLongMap!13861 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3912 (array!65833 array!65835 (_ BitVec 32) (_ BitVec 32) V!38019 V!38019 (_ BitVec 32) Int) ListLongMap!13861)

(assert (=> b!1045389 (= res!696086 (not (contains!6059 (getCurrentListMap!3912 (_keys!11687 (_2!7941 lt!461394)) (_values!6442 (_2!7941 lt!461394)) (mask!30545 (_2!7941 lt!461394)) (extraKeys!6147 (_2!7941 lt!461394)) (zeroValue!6253 (_2!7941 lt!461394)) (minValue!6253 (_2!7941 lt!461394)) #b00000000000000000000000000000000 (defaultEntry!6419 (_2!7941 lt!461394))) key!909)))))

(declare-fun lt!461397 () array!65833)

(declare-fun lt!461395 () array!65835)

(declare-fun Unit!34035 () Unit!34033)

(declare-fun Unit!34036 () Unit!34033)

(assert (=> b!1045389 (= lt!461394 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3078 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15861 Unit!34035 (LongMapFixedSize!6047 (defaultEntry!6419 thiss!1427) (mask!30545 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) (bvsub (_size!3078 thiss!1427) #b00000000000000000000000000000001) lt!461397 lt!461395 (bvadd #b00000000000000000000000000000001 (_vacant!3078 thiss!1427)))) (tuple2!15861 Unit!34036 (LongMapFixedSize!6047 (defaultEntry!6419 thiss!1427) (mask!30545 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) (bvsub (_size!3078 thiss!1427) #b00000000000000000000000000000001) lt!461397 lt!461395 (_vacant!3078 thiss!1427)))))))

(declare-fun -!538 (ListLongMap!13861 (_ BitVec 64)) ListLongMap!13861)

(assert (=> b!1045389 (= (-!538 (getCurrentListMap!3912 (_keys!11687 thiss!1427) (_values!6442 thiss!1427) (mask!30545 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6419 thiss!1427)) key!909) (getCurrentListMap!3912 lt!461397 lt!461395 (mask!30545 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6419 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9848 0))(
  ( (MissingZero!9848 (index!41763 (_ BitVec 32))) (Found!9848 (index!41764 (_ BitVec 32))) (Intermediate!9848 (undefined!10660 Bool) (index!41765 (_ BitVec 32)) (x!93387 (_ BitVec 32))) (Undefined!9848) (MissingVacant!9848 (index!41766 (_ BitVec 32))) )
))
(declare-fun lt!461398 () SeekEntryResult!9848)

(declare-fun dynLambda!1999 (Int (_ BitVec 64)) V!38019)

(assert (=> b!1045389 (= lt!461395 (array!65836 (store (arr!31663 (_values!6442 thiss!1427)) (index!41764 lt!461398) (ValueCellFull!11726 (dynLambda!1999 (defaultEntry!6419 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32200 (_values!6442 thiss!1427))))))

(declare-fun lt!461396 () Unit!34033)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!60 (array!65833 array!65835 (_ BitVec 32) (_ BitVec 32) V!38019 V!38019 (_ BitVec 32) (_ BitVec 64) Int) Unit!34033)

(assert (=> b!1045389 (= lt!461396 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!60 (_keys!11687 thiss!1427) (_values!6442 thiss!1427) (mask!30545 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) (index!41764 lt!461398) key!909 (defaultEntry!6419 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65833 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1045389 (not (arrayContainsKey!0 lt!461397 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!461393 () Unit!34033)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65833 (_ BitVec 32) (_ BitVec 64)) Unit!34033)

(assert (=> b!1045389 (= lt!461393 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11687 thiss!1427) (index!41764 lt!461398) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65833 (_ BitVec 32)) Bool)

(assert (=> b!1045389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!461397 (mask!30545 thiss!1427))))

(declare-fun lt!461400 () Unit!34033)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65833 (_ BitVec 32) (_ BitVec 32)) Unit!34033)

(assert (=> b!1045389 (= lt!461400 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11687 thiss!1427) (index!41764 lt!461398) (mask!30545 thiss!1427)))))

(declare-datatypes ((List!22055 0))(
  ( (Nil!22052) (Cons!22051 (h!23259 (_ BitVec 64)) (t!31314 List!22055)) )
))
(declare-fun arrayNoDuplicates!0 (array!65833 (_ BitVec 32) List!22055) Bool)

(assert (=> b!1045389 (arrayNoDuplicates!0 lt!461397 #b00000000000000000000000000000000 Nil!22052)))

(declare-fun lt!461392 () Unit!34033)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65833 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22055) Unit!34033)

(assert (=> b!1045389 (= lt!461392 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11687 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41764 lt!461398) #b00000000000000000000000000000000 Nil!22052))))

(declare-fun arrayCountValidKeys!0 (array!65833 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1045389 (= (arrayCountValidKeys!0 lt!461397 #b00000000000000000000000000000000 (size!32199 (_keys!11687 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11687 thiss!1427) #b00000000000000000000000000000000 (size!32199 (_keys!11687 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1045389 (= lt!461397 (array!65834 (store (arr!31662 (_keys!11687 thiss!1427)) (index!41764 lt!461398) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32199 (_keys!11687 thiss!1427))))))

(declare-fun lt!461399 () Unit!34033)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65833 (_ BitVec 32) (_ BitVec 64)) Unit!34033)

(assert (=> b!1045389 (= lt!461399 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11687 thiss!1427) (index!41764 lt!461398) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045390 () Bool)

(declare-fun e!592583 () Bool)

(assert (=> b!1045390 (= e!592583 e!592587)))

(declare-fun res!696085 () Bool)

(assert (=> b!1045390 (=> (not res!696085) (not e!592587))))

(get-info :version)

(assert (=> b!1045390 (= res!696085 ((_ is Found!9848) lt!461398))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65833 (_ BitVec 32)) SeekEntryResult!9848)

(assert (=> b!1045390 (= lt!461398 (seekEntry!0 key!909 (_keys!11687 thiss!1427) (mask!30545 thiss!1427)))))

(declare-fun b!1045391 () Bool)

(assert (=> b!1045391 (= e!592586 (or (not (= (size!32200 (_values!6442 (_2!7941 lt!461394))) (bvadd #b00000000000000000000000000000001 (mask!30545 (_2!7941 lt!461394))))) (not (= (size!32199 (_keys!11687 (_2!7941 lt!461394))) (size!32200 (_values!6442 (_2!7941 lt!461394))))) (bvslt (mask!30545 (_2!7941 lt!461394)) #b00000000000000000000000000000000) (bvslt (extraKeys!6147 (_2!7941 lt!461394)) #b00000000000000000000000000000000) (bvsle (extraKeys!6147 (_2!7941 lt!461394)) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!38930 () Bool)

(assert (=> mapIsEmpty!38930 mapRes!38930))

(declare-fun tp_is_empty!24859 () Bool)

(declare-fun e!592582 () Bool)

(declare-fun array_inv!24467 (array!65833) Bool)

(declare-fun array_inv!24468 (array!65835) Bool)

(assert (=> b!1045392 (= e!592582 (and tp!74675 tp_is_empty!24859 (array_inv!24467 (_keys!11687 thiss!1427)) (array_inv!24468 (_values!6442 thiss!1427)) e!592584))))

(declare-fun mapNonEmpty!38930 () Bool)

(declare-fun tp!74676 () Bool)

(declare-fun e!592588 () Bool)

(assert (=> mapNonEmpty!38930 (= mapRes!38930 (and tp!74676 e!592588))))

(declare-fun mapRest!38930 () (Array (_ BitVec 32) ValueCell!11726))

(declare-fun mapKey!38930 () (_ BitVec 32))

(declare-fun mapValue!38930 () ValueCell!11726)

(assert (=> mapNonEmpty!38930 (= (arr!31663 (_values!6442 thiss!1427)) (store mapRest!38930 mapKey!38930 mapValue!38930))))

(declare-fun b!1045393 () Bool)

(assert (=> b!1045393 (= e!592581 tp_is_empty!24859)))

(declare-fun b!1045394 () Bool)

(declare-fun res!696082 () Bool)

(assert (=> b!1045394 (=> (not res!696082) (not e!592583))))

(assert (=> b!1045394 (= res!696082 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1045395 () Bool)

(declare-fun res!696084 () Bool)

(assert (=> b!1045395 (=> res!696084 e!592586)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1045395 (= res!696084 (not (validMask!0 (mask!30545 (_2!7941 lt!461394)))))))

(declare-fun b!1045396 () Bool)

(assert (=> b!1045396 (= e!592588 tp_is_empty!24859)))

(declare-fun res!696083 () Bool)

(assert (=> start!91930 (=> (not res!696083) (not e!592583))))

(declare-fun valid!2263 (LongMapFixedSize!6046) Bool)

(assert (=> start!91930 (= res!696083 (valid!2263 thiss!1427))))

(assert (=> start!91930 e!592583))

(assert (=> start!91930 e!592582))

(assert (=> start!91930 true))

(assert (= (and start!91930 res!696083) b!1045394))

(assert (= (and b!1045394 res!696082) b!1045390))

(assert (= (and b!1045390 res!696085) b!1045389))

(assert (= (and b!1045389 (not res!696086)) b!1045395))

(assert (= (and b!1045395 (not res!696084)) b!1045391))

(assert (= (and b!1045388 condMapEmpty!38930) mapIsEmpty!38930))

(assert (= (and b!1045388 (not condMapEmpty!38930)) mapNonEmpty!38930))

(assert (= (and mapNonEmpty!38930 ((_ is ValueCellFull!11726) mapValue!38930)) b!1045396))

(assert (= (and b!1045388 ((_ is ValueCellFull!11726) mapDefault!38930)) b!1045393))

(assert (= b!1045392 b!1045388))

(assert (= start!91930 b!1045392))

(declare-fun b_lambda!16285 () Bool)

(assert (=> (not b_lambda!16285) (not b!1045389)))

(declare-fun t!31312 () Bool)

(declare-fun tb!7081 () Bool)

(assert (=> (and b!1045392 (= (defaultEntry!6419 thiss!1427) (defaultEntry!6419 thiss!1427)) t!31312) tb!7081))

(declare-fun result!14595 () Bool)

(assert (=> tb!7081 (= result!14595 tp_is_empty!24859)))

(assert (=> b!1045389 t!31312))

(declare-fun b_and!33741 () Bool)

(assert (= b_and!33739 (and (=> t!31312 result!14595) b_and!33741)))

(declare-fun m!964641 () Bool)

(assert (=> mapNonEmpty!38930 m!964641))

(declare-fun m!964643 () Bool)

(assert (=> b!1045389 m!964643))

(declare-fun m!964645 () Bool)

(assert (=> b!1045389 m!964645))

(declare-fun m!964647 () Bool)

(assert (=> b!1045389 m!964647))

(declare-fun m!964649 () Bool)

(assert (=> b!1045389 m!964649))

(declare-fun m!964651 () Bool)

(assert (=> b!1045389 m!964651))

(declare-fun m!964653 () Bool)

(assert (=> b!1045389 m!964653))

(declare-fun m!964655 () Bool)

(assert (=> b!1045389 m!964655))

(declare-fun m!964657 () Bool)

(assert (=> b!1045389 m!964657))

(declare-fun m!964659 () Bool)

(assert (=> b!1045389 m!964659))

(declare-fun m!964661 () Bool)

(assert (=> b!1045389 m!964661))

(declare-fun m!964663 () Bool)

(assert (=> b!1045389 m!964663))

(assert (=> b!1045389 m!964661))

(assert (=> b!1045389 m!964643))

(declare-fun m!964665 () Bool)

(assert (=> b!1045389 m!964665))

(declare-fun m!964667 () Bool)

(assert (=> b!1045389 m!964667))

(declare-fun m!964669 () Bool)

(assert (=> b!1045389 m!964669))

(declare-fun m!964671 () Bool)

(assert (=> b!1045389 m!964671))

(declare-fun m!964673 () Bool)

(assert (=> b!1045389 m!964673))

(declare-fun m!964675 () Bool)

(assert (=> b!1045389 m!964675))

(declare-fun m!964677 () Bool)

(assert (=> b!1045389 m!964677))

(declare-fun m!964679 () Bool)

(assert (=> b!1045395 m!964679))

(declare-fun m!964681 () Bool)

(assert (=> b!1045392 m!964681))

(declare-fun m!964683 () Bool)

(assert (=> b!1045392 m!964683))

(declare-fun m!964685 () Bool)

(assert (=> b!1045390 m!964685))

(declare-fun m!964687 () Bool)

(assert (=> start!91930 m!964687))

(check-sat (not b!1045389) (not b_lambda!16285) (not b!1045392) tp_is_empty!24859 (not b_next!21139) (not b!1045395) (not start!91930) (not mapNonEmpty!38930) b_and!33741 (not b!1045390))
(check-sat b_and!33741 (not b_next!21139))
(get-model)

(declare-fun b_lambda!16291 () Bool)

(assert (= b_lambda!16285 (or (and b!1045392 b_free!21139) b_lambda!16291)))

(check-sat (not b!1045389) (not b!1045392) tp_is_empty!24859 (not b_next!21139) (not b_lambda!16291) (not b!1045395) (not start!91930) (not mapNonEmpty!38930) b_and!33741 (not b!1045390))
(check-sat b_and!33741 (not b_next!21139))
(get-model)

(declare-fun d!126393 () Bool)

(declare-fun res!696123 () Bool)

(declare-fun e!592639 () Bool)

(assert (=> d!126393 (=> (not res!696123) (not e!592639))))

(declare-fun simpleValid!453 (LongMapFixedSize!6046) Bool)

(assert (=> d!126393 (= res!696123 (simpleValid!453 thiss!1427))))

(assert (=> d!126393 (= (valid!2263 thiss!1427) e!592639)))

(declare-fun b!1045463 () Bool)

(declare-fun res!696124 () Bool)

(assert (=> b!1045463 (=> (not res!696124) (not e!592639))))

(assert (=> b!1045463 (= res!696124 (= (arrayCountValidKeys!0 (_keys!11687 thiss!1427) #b00000000000000000000000000000000 (size!32199 (_keys!11687 thiss!1427))) (_size!3078 thiss!1427)))))

(declare-fun b!1045464 () Bool)

(declare-fun res!696125 () Bool)

(assert (=> b!1045464 (=> (not res!696125) (not e!592639))))

(assert (=> b!1045464 (= res!696125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11687 thiss!1427) (mask!30545 thiss!1427)))))

(declare-fun b!1045465 () Bool)

(assert (=> b!1045465 (= e!592639 (arrayNoDuplicates!0 (_keys!11687 thiss!1427) #b00000000000000000000000000000000 Nil!22052))))

(assert (= (and d!126393 res!696123) b!1045463))

(assert (= (and b!1045463 res!696124) b!1045464))

(assert (= (and b!1045464 res!696125) b!1045465))

(declare-fun m!964785 () Bool)

(assert (=> d!126393 m!964785))

(assert (=> b!1045463 m!964653))

(declare-fun m!964787 () Bool)

(assert (=> b!1045464 m!964787))

(declare-fun m!964789 () Bool)

(assert (=> b!1045465 m!964789))

(assert (=> start!91930 d!126393))

(declare-fun d!126395 () Bool)

(declare-fun e!592642 () Bool)

(assert (=> d!126395 e!592642))

(declare-fun res!696128 () Bool)

(assert (=> d!126395 (=> (not res!696128) (not e!592642))))

(assert (=> d!126395 (= res!696128 (and (bvsge (index!41764 lt!461398) #b00000000000000000000000000000000) (bvslt (index!41764 lt!461398) (size!32199 (_keys!11687 thiss!1427)))))))

(declare-fun lt!461457 () Unit!34033)

(declare-fun choose!1722 (array!65833 array!65835 (_ BitVec 32) (_ BitVec 32) V!38019 V!38019 (_ BitVec 32) (_ BitVec 64) Int) Unit!34033)

(assert (=> d!126395 (= lt!461457 (choose!1722 (_keys!11687 thiss!1427) (_values!6442 thiss!1427) (mask!30545 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) (index!41764 lt!461398) key!909 (defaultEntry!6419 thiss!1427)))))

(assert (=> d!126395 (validMask!0 (mask!30545 thiss!1427))))

(assert (=> d!126395 (= (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!60 (_keys!11687 thiss!1427) (_values!6442 thiss!1427) (mask!30545 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) (index!41764 lt!461398) key!909 (defaultEntry!6419 thiss!1427)) lt!461457)))

(declare-fun b!1045468 () Bool)

(assert (=> b!1045468 (= e!592642 (= (-!538 (getCurrentListMap!3912 (_keys!11687 thiss!1427) (_values!6442 thiss!1427) (mask!30545 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6419 thiss!1427)) key!909) (getCurrentListMap!3912 (array!65834 (store (arr!31662 (_keys!11687 thiss!1427)) (index!41764 lt!461398) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32199 (_keys!11687 thiss!1427))) (array!65836 (store (arr!31663 (_values!6442 thiss!1427)) (index!41764 lt!461398) (ValueCellFull!11726 (dynLambda!1999 (defaultEntry!6419 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32200 (_values!6442 thiss!1427))) (mask!30545 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6419 thiss!1427))))))

(assert (=> b!1045468 (bvslt (index!41764 lt!461398) (size!32200 (_values!6442 thiss!1427)))))

(assert (= (and d!126395 res!696128) b!1045468))

(declare-fun b_lambda!16293 () Bool)

(assert (=> (not b_lambda!16293) (not b!1045468)))

(assert (=> b!1045468 t!31312))

(declare-fun b_and!33751 () Bool)

(assert (= b_and!33741 (and (=> t!31312 result!14595) b_and!33751)))

(declare-fun m!964791 () Bool)

(assert (=> d!126395 m!964791))

(declare-fun m!964793 () Bool)

(assert (=> d!126395 m!964793))

(assert (=> b!1045468 m!964673))

(assert (=> b!1045468 m!964661))

(assert (=> b!1045468 m!964663))

(assert (=> b!1045468 m!964647))

(assert (=> b!1045468 m!964649))

(assert (=> b!1045468 m!964661))

(declare-fun m!964795 () Bool)

(assert (=> b!1045468 m!964795))

(assert (=> b!1045389 d!126395))

(declare-fun b!1045477 () Bool)

(declare-fun e!592649 () Bool)

(declare-fun e!592650 () Bool)

(assert (=> b!1045477 (= e!592649 e!592650)))

(declare-fun c!106270 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1045477 (= c!106270 (validKeyInArray!0 (select (arr!31662 lt!461397) #b00000000000000000000000000000000)))))

(declare-fun b!1045478 () Bool)

(declare-fun e!592651 () Bool)

(declare-fun call!44503 () Bool)

(assert (=> b!1045478 (= e!592651 call!44503)))

(declare-fun d!126397 () Bool)

(declare-fun res!696134 () Bool)

(assert (=> d!126397 (=> res!696134 e!592649)))

(assert (=> d!126397 (= res!696134 (bvsge #b00000000000000000000000000000000 (size!32199 lt!461397)))))

(assert (=> d!126397 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!461397 (mask!30545 thiss!1427)) e!592649)))

(declare-fun b!1045479 () Bool)

(assert (=> b!1045479 (= e!592650 e!592651)))

(declare-fun lt!461464 () (_ BitVec 64))

(assert (=> b!1045479 (= lt!461464 (select (arr!31662 lt!461397) #b00000000000000000000000000000000))))

(declare-fun lt!461465 () Unit!34033)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65833 (_ BitVec 64) (_ BitVec 32)) Unit!34033)

(assert (=> b!1045479 (= lt!461465 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!461397 lt!461464 #b00000000000000000000000000000000))))

(assert (=> b!1045479 (arrayContainsKey!0 lt!461397 lt!461464 #b00000000000000000000000000000000)))

(declare-fun lt!461466 () Unit!34033)

(assert (=> b!1045479 (= lt!461466 lt!461465)))

(declare-fun res!696133 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65833 (_ BitVec 32)) SeekEntryResult!9848)

(assert (=> b!1045479 (= res!696133 (= (seekEntryOrOpen!0 (select (arr!31662 lt!461397) #b00000000000000000000000000000000) lt!461397 (mask!30545 thiss!1427)) (Found!9848 #b00000000000000000000000000000000)))))

(assert (=> b!1045479 (=> (not res!696133) (not e!592651))))

(declare-fun bm!44500 () Bool)

(assert (=> bm!44500 (= call!44503 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!461397 (mask!30545 thiss!1427)))))

(declare-fun b!1045480 () Bool)

(assert (=> b!1045480 (= e!592650 call!44503)))

(assert (= (and d!126397 (not res!696134)) b!1045477))

(assert (= (and b!1045477 c!106270) b!1045479))

(assert (= (and b!1045477 (not c!106270)) b!1045480))

(assert (= (and b!1045479 res!696133) b!1045478))

(assert (= (or b!1045478 b!1045480) bm!44500))

(declare-fun m!964797 () Bool)

(assert (=> b!1045477 m!964797))

(assert (=> b!1045477 m!964797))

(declare-fun m!964799 () Bool)

(assert (=> b!1045477 m!964799))

(assert (=> b!1045479 m!964797))

(declare-fun m!964801 () Bool)

(assert (=> b!1045479 m!964801))

(declare-fun m!964803 () Bool)

(assert (=> b!1045479 m!964803))

(assert (=> b!1045479 m!964797))

(declare-fun m!964805 () Bool)

(assert (=> b!1045479 m!964805))

(declare-fun m!964807 () Bool)

(assert (=> bm!44500 m!964807))

(assert (=> b!1045389 d!126397))

(declare-fun bm!44503 () Bool)

(declare-fun call!44506 () Bool)

(declare-fun c!106273 () Bool)

(assert (=> bm!44503 (= call!44506 (arrayNoDuplicates!0 lt!461397 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106273 (Cons!22051 (select (arr!31662 lt!461397) #b00000000000000000000000000000000) Nil!22052) Nil!22052)))))

(declare-fun b!1045491 () Bool)

(declare-fun e!592661 () Bool)

(assert (=> b!1045491 (= e!592661 call!44506)))

(declare-fun d!126399 () Bool)

(declare-fun res!696143 () Bool)

(declare-fun e!592660 () Bool)

(assert (=> d!126399 (=> res!696143 e!592660)))

(assert (=> d!126399 (= res!696143 (bvsge #b00000000000000000000000000000000 (size!32199 lt!461397)))))

(assert (=> d!126399 (= (arrayNoDuplicates!0 lt!461397 #b00000000000000000000000000000000 Nil!22052) e!592660)))

(declare-fun b!1045492 () Bool)

(declare-fun e!592663 () Bool)

(assert (=> b!1045492 (= e!592663 e!592661)))

(assert (=> b!1045492 (= c!106273 (validKeyInArray!0 (select (arr!31662 lt!461397) #b00000000000000000000000000000000)))))

(declare-fun b!1045493 () Bool)

(declare-fun e!592662 () Bool)

(declare-fun contains!6061 (List!22055 (_ BitVec 64)) Bool)

(assert (=> b!1045493 (= e!592662 (contains!6061 Nil!22052 (select (arr!31662 lt!461397) #b00000000000000000000000000000000)))))

(declare-fun b!1045494 () Bool)

(assert (=> b!1045494 (= e!592660 e!592663)))

(declare-fun res!696141 () Bool)

(assert (=> b!1045494 (=> (not res!696141) (not e!592663))))

(assert (=> b!1045494 (= res!696141 (not e!592662))))

(declare-fun res!696142 () Bool)

(assert (=> b!1045494 (=> (not res!696142) (not e!592662))))

(assert (=> b!1045494 (= res!696142 (validKeyInArray!0 (select (arr!31662 lt!461397) #b00000000000000000000000000000000)))))

(declare-fun b!1045495 () Bool)

(assert (=> b!1045495 (= e!592661 call!44506)))

(assert (= (and d!126399 (not res!696143)) b!1045494))

(assert (= (and b!1045494 res!696142) b!1045493))

(assert (= (and b!1045494 res!696141) b!1045492))

(assert (= (and b!1045492 c!106273) b!1045491))

(assert (= (and b!1045492 (not c!106273)) b!1045495))

(assert (= (or b!1045491 b!1045495) bm!44503))

(assert (=> bm!44503 m!964797))

(declare-fun m!964809 () Bool)

(assert (=> bm!44503 m!964809))

(assert (=> b!1045492 m!964797))

(assert (=> b!1045492 m!964797))

(assert (=> b!1045492 m!964799))

(assert (=> b!1045493 m!964797))

(assert (=> b!1045493 m!964797))

(declare-fun m!964811 () Bool)

(assert (=> b!1045493 m!964811))

(assert (=> b!1045494 m!964797))

(assert (=> b!1045494 m!964797))

(assert (=> b!1045494 m!964799))

(assert (=> b!1045389 d!126399))

(declare-fun d!126401 () Bool)

(declare-fun lt!461469 () ListLongMap!13861)

(assert (=> d!126401 (not (contains!6059 lt!461469 key!909))))

(declare-fun removeStrictlySorted!65 (List!22054 (_ BitVec 64)) List!22054)

(assert (=> d!126401 (= lt!461469 (ListLongMap!13862 (removeStrictlySorted!65 (toList!6946 (getCurrentListMap!3912 (_keys!11687 thiss!1427) (_values!6442 thiss!1427) (mask!30545 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6419 thiss!1427))) key!909)))))

(assert (=> d!126401 (= (-!538 (getCurrentListMap!3912 (_keys!11687 thiss!1427) (_values!6442 thiss!1427) (mask!30545 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6419 thiss!1427)) key!909) lt!461469)))

(declare-fun bs!30502 () Bool)

(assert (= bs!30502 d!126401))

(declare-fun m!964813 () Bool)

(assert (=> bs!30502 m!964813))

(declare-fun m!964815 () Bool)

(assert (=> bs!30502 m!964815))

(assert (=> b!1045389 d!126401))

(declare-fun b!1045538 () Bool)

(declare-fun e!592701 () Bool)

(declare-fun call!44521 () Bool)

(assert (=> b!1045538 (= e!592701 (not call!44521))))

(declare-fun b!1045539 () Bool)

(declare-fun res!696170 () Bool)

(declare-fun e!592691 () Bool)

(assert (=> b!1045539 (=> (not res!696170) (not e!592691))))

(assert (=> b!1045539 (= res!696170 e!592701)))

(declare-fun c!106289 () Bool)

(assert (=> b!1045539 (= c!106289 (not (= (bvand (extraKeys!6147 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!44519 () Bool)

(declare-fun call!44522 () ListLongMap!13861)

(declare-fun getCurrentListMapNoExtraKeys!3574 (array!65833 array!65835 (_ BitVec 32) (_ BitVec 32) V!38019 V!38019 (_ BitVec 32) Int) ListLongMap!13861)

(assert (=> bm!44519 (= call!44522 (getCurrentListMapNoExtraKeys!3574 lt!461397 lt!461395 (mask!30545 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6419 thiss!1427)))))

(declare-fun b!1045540 () Bool)

(declare-fun c!106291 () Bool)

(assert (=> b!1045540 (= c!106291 (and (not (= (bvand (extraKeys!6147 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6147 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!592694 () ListLongMap!13861)

(declare-fun e!592692 () ListLongMap!13861)

(assert (=> b!1045540 (= e!592694 e!592692)))

(declare-fun bm!44520 () Bool)

(declare-fun call!44523 () Bool)

(declare-fun lt!461518 () ListLongMap!13861)

(assert (=> bm!44520 (= call!44523 (contains!6059 lt!461518 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045541 () Bool)

(declare-fun e!592690 () Bool)

(declare-fun apply!908 (ListLongMap!13861 (_ BitVec 64)) V!38019)

(assert (=> b!1045541 (= e!592690 (= (apply!908 lt!461518 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6253 thiss!1427)))))

(declare-fun b!1045542 () Bool)

(declare-fun e!592693 () Unit!34033)

(declare-fun Unit!34043 () Unit!34033)

(assert (=> b!1045542 (= e!592693 Unit!34043)))

(declare-fun b!1045543 () Bool)

(declare-fun e!592700 () Bool)

(assert (=> b!1045543 (= e!592700 (= (apply!908 lt!461518 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6253 thiss!1427)))))

(declare-fun b!1045544 () Bool)

(declare-fun e!592699 () Bool)

(assert (=> b!1045544 (= e!592699 (validKeyInArray!0 (select (arr!31662 lt!461397) #b00000000000000000000000000000000)))))

(declare-fun bm!44521 () Bool)

(declare-fun call!44527 () ListLongMap!13861)

(assert (=> bm!44521 (= call!44527 call!44522)))

(declare-fun d!126403 () Bool)

(assert (=> d!126403 e!592691))

(declare-fun res!696166 () Bool)

(assert (=> d!126403 (=> (not res!696166) (not e!592691))))

(assert (=> d!126403 (= res!696166 (or (bvsge #b00000000000000000000000000000000 (size!32199 lt!461397)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32199 lt!461397)))))))

(declare-fun lt!461522 () ListLongMap!13861)

(assert (=> d!126403 (= lt!461518 lt!461522)))

(declare-fun lt!461529 () Unit!34033)

(assert (=> d!126403 (= lt!461529 e!592693)))

(declare-fun c!106287 () Bool)

(declare-fun e!592702 () Bool)

(assert (=> d!126403 (= c!106287 e!592702)))

(declare-fun res!696162 () Bool)

(assert (=> d!126403 (=> (not res!696162) (not e!592702))))

(assert (=> d!126403 (= res!696162 (bvslt #b00000000000000000000000000000000 (size!32199 lt!461397)))))

(declare-fun e!592696 () ListLongMap!13861)

(assert (=> d!126403 (= lt!461522 e!592696)))

(declare-fun c!106286 () Bool)

(assert (=> d!126403 (= c!106286 (and (not (= (bvand (extraKeys!6147 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6147 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126403 (validMask!0 (mask!30545 thiss!1427))))

(assert (=> d!126403 (= (getCurrentListMap!3912 lt!461397 lt!461395 (mask!30545 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6419 thiss!1427)) lt!461518)))

(declare-fun bm!44518 () Bool)

(assert (=> bm!44518 (= call!44521 (contains!6059 lt!461518 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!44522 () Bool)

(declare-fun call!44526 () ListLongMap!13861)

(declare-fun call!44524 () ListLongMap!13861)

(assert (=> bm!44522 (= call!44526 call!44524)))

(declare-fun b!1045545 () Bool)

(declare-fun +!3139 (ListLongMap!13861 tuple2!15862) ListLongMap!13861)

(assert (=> b!1045545 (= e!592696 (+!3139 call!44524 (tuple2!15863 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6253 thiss!1427))))))

(declare-fun bm!44523 () Bool)

(declare-fun call!44525 () ListLongMap!13861)

(assert (=> bm!44523 (= call!44525 call!44527)))

(declare-fun b!1045546 () Bool)

(assert (=> b!1045546 (= e!592692 call!44526)))

(declare-fun c!106288 () Bool)

(declare-fun bm!44524 () Bool)

(assert (=> bm!44524 (= call!44524 (+!3139 (ite c!106286 call!44522 (ite c!106288 call!44527 call!44525)) (ite (or c!106286 c!106288) (tuple2!15863 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6253 thiss!1427)) (tuple2!15863 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6253 thiss!1427)))))))

(declare-fun b!1045547 () Bool)

(declare-fun e!592697 () Bool)

(declare-fun get!16557 (ValueCell!11726 V!38019) V!38019)

(assert (=> b!1045547 (= e!592697 (= (apply!908 lt!461518 (select (arr!31662 lt!461397) #b00000000000000000000000000000000)) (get!16557 (select (arr!31663 lt!461395) #b00000000000000000000000000000000) (dynLambda!1999 (defaultEntry!6419 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1045547 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32200 lt!461395)))))

(assert (=> b!1045547 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32199 lt!461397)))))

(declare-fun b!1045548 () Bool)

(assert (=> b!1045548 (= e!592702 (validKeyInArray!0 (select (arr!31662 lt!461397) #b00000000000000000000000000000000)))))

(declare-fun b!1045549 () Bool)

(declare-fun e!592698 () Bool)

(assert (=> b!1045549 (= e!592698 e!592700)))

(declare-fun res!696169 () Bool)

(assert (=> b!1045549 (= res!696169 call!44523)))

(assert (=> b!1045549 (=> (not res!696169) (not e!592700))))

(declare-fun b!1045550 () Bool)

(assert (=> b!1045550 (= e!592691 e!592698)))

(declare-fun c!106290 () Bool)

(assert (=> b!1045550 (= c!106290 (not (= (bvand (extraKeys!6147 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1045551 () Bool)

(assert (=> b!1045551 (= e!592698 (not call!44523))))

(declare-fun b!1045552 () Bool)

(assert (=> b!1045552 (= e!592696 e!592694)))

(assert (=> b!1045552 (= c!106288 (and (not (= (bvand (extraKeys!6147 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6147 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1045553 () Bool)

(assert (=> b!1045553 (= e!592692 call!44525)))

(declare-fun b!1045554 () Bool)

(declare-fun lt!461531 () Unit!34033)

(assert (=> b!1045554 (= e!592693 lt!461531)))

(declare-fun lt!461530 () ListLongMap!13861)

(assert (=> b!1045554 (= lt!461530 (getCurrentListMapNoExtraKeys!3574 lt!461397 lt!461395 (mask!30545 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6419 thiss!1427)))))

(declare-fun lt!461519 () (_ BitVec 64))

(assert (=> b!1045554 (= lt!461519 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461533 () (_ BitVec 64))

(assert (=> b!1045554 (= lt!461533 (select (arr!31662 lt!461397) #b00000000000000000000000000000000))))

(declare-fun lt!461528 () Unit!34033)

(declare-fun addStillContains!627 (ListLongMap!13861 (_ BitVec 64) V!38019 (_ BitVec 64)) Unit!34033)

(assert (=> b!1045554 (= lt!461528 (addStillContains!627 lt!461530 lt!461519 (zeroValue!6253 thiss!1427) lt!461533))))

(assert (=> b!1045554 (contains!6059 (+!3139 lt!461530 (tuple2!15863 lt!461519 (zeroValue!6253 thiss!1427))) lt!461533)))

(declare-fun lt!461527 () Unit!34033)

(assert (=> b!1045554 (= lt!461527 lt!461528)))

(declare-fun lt!461520 () ListLongMap!13861)

(assert (=> b!1045554 (= lt!461520 (getCurrentListMapNoExtraKeys!3574 lt!461397 lt!461395 (mask!30545 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6419 thiss!1427)))))

(declare-fun lt!461532 () (_ BitVec 64))

(assert (=> b!1045554 (= lt!461532 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461523 () (_ BitVec 64))

(assert (=> b!1045554 (= lt!461523 (select (arr!31662 lt!461397) #b00000000000000000000000000000000))))

(declare-fun lt!461524 () Unit!34033)

(declare-fun addApplyDifferent!483 (ListLongMap!13861 (_ BitVec 64) V!38019 (_ BitVec 64)) Unit!34033)

(assert (=> b!1045554 (= lt!461524 (addApplyDifferent!483 lt!461520 lt!461532 (minValue!6253 thiss!1427) lt!461523))))

(assert (=> b!1045554 (= (apply!908 (+!3139 lt!461520 (tuple2!15863 lt!461532 (minValue!6253 thiss!1427))) lt!461523) (apply!908 lt!461520 lt!461523))))

(declare-fun lt!461534 () Unit!34033)

(assert (=> b!1045554 (= lt!461534 lt!461524)))

(declare-fun lt!461514 () ListLongMap!13861)

(assert (=> b!1045554 (= lt!461514 (getCurrentListMapNoExtraKeys!3574 lt!461397 lt!461395 (mask!30545 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6419 thiss!1427)))))

(declare-fun lt!461516 () (_ BitVec 64))

(assert (=> b!1045554 (= lt!461516 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461535 () (_ BitVec 64))

(assert (=> b!1045554 (= lt!461535 (select (arr!31662 lt!461397) #b00000000000000000000000000000000))))

(declare-fun lt!461515 () Unit!34033)

(assert (=> b!1045554 (= lt!461515 (addApplyDifferent!483 lt!461514 lt!461516 (zeroValue!6253 thiss!1427) lt!461535))))

(assert (=> b!1045554 (= (apply!908 (+!3139 lt!461514 (tuple2!15863 lt!461516 (zeroValue!6253 thiss!1427))) lt!461535) (apply!908 lt!461514 lt!461535))))

(declare-fun lt!461521 () Unit!34033)

(assert (=> b!1045554 (= lt!461521 lt!461515)))

(declare-fun lt!461525 () ListLongMap!13861)

(assert (=> b!1045554 (= lt!461525 (getCurrentListMapNoExtraKeys!3574 lt!461397 lt!461395 (mask!30545 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6419 thiss!1427)))))

(declare-fun lt!461517 () (_ BitVec 64))

(assert (=> b!1045554 (= lt!461517 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461526 () (_ BitVec 64))

(assert (=> b!1045554 (= lt!461526 (select (arr!31662 lt!461397) #b00000000000000000000000000000000))))

(assert (=> b!1045554 (= lt!461531 (addApplyDifferent!483 lt!461525 lt!461517 (minValue!6253 thiss!1427) lt!461526))))

(assert (=> b!1045554 (= (apply!908 (+!3139 lt!461525 (tuple2!15863 lt!461517 (minValue!6253 thiss!1427))) lt!461526) (apply!908 lt!461525 lt!461526))))

(declare-fun b!1045555 () Bool)

(declare-fun e!592695 () Bool)

(assert (=> b!1045555 (= e!592695 e!592697)))

(declare-fun res!696163 () Bool)

(assert (=> b!1045555 (=> (not res!696163) (not e!592697))))

(assert (=> b!1045555 (= res!696163 (contains!6059 lt!461518 (select (arr!31662 lt!461397) #b00000000000000000000000000000000)))))

(assert (=> b!1045555 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32199 lt!461397)))))

(declare-fun b!1045556 () Bool)

(declare-fun res!696167 () Bool)

(assert (=> b!1045556 (=> (not res!696167) (not e!592691))))

(assert (=> b!1045556 (= res!696167 e!592695)))

(declare-fun res!696168 () Bool)

(assert (=> b!1045556 (=> res!696168 e!592695)))

(assert (=> b!1045556 (= res!696168 (not e!592699))))

(declare-fun res!696165 () Bool)

(assert (=> b!1045556 (=> (not res!696165) (not e!592699))))

(assert (=> b!1045556 (= res!696165 (bvslt #b00000000000000000000000000000000 (size!32199 lt!461397)))))

(declare-fun b!1045557 () Bool)

(assert (=> b!1045557 (= e!592694 call!44526)))

(declare-fun b!1045558 () Bool)

(assert (=> b!1045558 (= e!592701 e!592690)))

(declare-fun res!696164 () Bool)

(assert (=> b!1045558 (= res!696164 call!44521)))

(assert (=> b!1045558 (=> (not res!696164) (not e!592690))))

(assert (= (and d!126403 c!106286) b!1045545))

(assert (= (and d!126403 (not c!106286)) b!1045552))

(assert (= (and b!1045552 c!106288) b!1045557))

(assert (= (and b!1045552 (not c!106288)) b!1045540))

(assert (= (and b!1045540 c!106291) b!1045546))

(assert (= (and b!1045540 (not c!106291)) b!1045553))

(assert (= (or b!1045546 b!1045553) bm!44523))

(assert (= (or b!1045557 bm!44523) bm!44521))

(assert (= (or b!1045557 b!1045546) bm!44522))

(assert (= (or b!1045545 bm!44521) bm!44519))

(assert (= (or b!1045545 bm!44522) bm!44524))

(assert (= (and d!126403 res!696162) b!1045548))

(assert (= (and d!126403 c!106287) b!1045554))

(assert (= (and d!126403 (not c!106287)) b!1045542))

(assert (= (and d!126403 res!696166) b!1045556))

(assert (= (and b!1045556 res!696165) b!1045544))

(assert (= (and b!1045556 (not res!696168)) b!1045555))

(assert (= (and b!1045555 res!696163) b!1045547))

(assert (= (and b!1045556 res!696167) b!1045539))

(assert (= (and b!1045539 c!106289) b!1045558))

(assert (= (and b!1045539 (not c!106289)) b!1045538))

(assert (= (and b!1045558 res!696164) b!1045541))

(assert (= (or b!1045558 b!1045538) bm!44518))

(assert (= (and b!1045539 res!696170) b!1045550))

(assert (= (and b!1045550 c!106290) b!1045549))

(assert (= (and b!1045550 (not c!106290)) b!1045551))

(assert (= (and b!1045549 res!696169) b!1045543))

(assert (= (or b!1045549 b!1045551) bm!44520))

(declare-fun b_lambda!16295 () Bool)

(assert (=> (not b_lambda!16295) (not b!1045547)))

(assert (=> b!1045547 t!31312))

(declare-fun b_and!33753 () Bool)

(assert (= b_and!33751 (and (=> t!31312 result!14595) b_and!33753)))

(declare-fun m!964817 () Bool)

(assert (=> b!1045547 m!964817))

(assert (=> b!1045547 m!964673))

(assert (=> b!1045547 m!964817))

(assert (=> b!1045547 m!964673))

(declare-fun m!964819 () Bool)

(assert (=> b!1045547 m!964819))

(assert (=> b!1045547 m!964797))

(assert (=> b!1045547 m!964797))

(declare-fun m!964821 () Bool)

(assert (=> b!1045547 m!964821))

(declare-fun m!964823 () Bool)

(assert (=> bm!44519 m!964823))

(assert (=> b!1045554 m!964823))

(declare-fun m!964825 () Bool)

(assert (=> b!1045554 m!964825))

(declare-fun m!964827 () Bool)

(assert (=> b!1045554 m!964827))

(declare-fun m!964829 () Bool)

(assert (=> b!1045554 m!964829))

(declare-fun m!964831 () Bool)

(assert (=> b!1045554 m!964831))

(declare-fun m!964833 () Bool)

(assert (=> b!1045554 m!964833))

(declare-fun m!964835 () Bool)

(assert (=> b!1045554 m!964835))

(declare-fun m!964837 () Bool)

(assert (=> b!1045554 m!964837))

(declare-fun m!964839 () Bool)

(assert (=> b!1045554 m!964839))

(declare-fun m!964841 () Bool)

(assert (=> b!1045554 m!964841))

(declare-fun m!964843 () Bool)

(assert (=> b!1045554 m!964843))

(assert (=> b!1045554 m!964841))

(assert (=> b!1045554 m!964827))

(assert (=> b!1045554 m!964833))

(declare-fun m!964845 () Bool)

(assert (=> b!1045554 m!964845))

(declare-fun m!964847 () Bool)

(assert (=> b!1045554 m!964847))

(declare-fun m!964849 () Bool)

(assert (=> b!1045554 m!964849))

(assert (=> b!1045554 m!964847))

(assert (=> b!1045554 m!964797))

(declare-fun m!964851 () Bool)

(assert (=> b!1045554 m!964851))

(declare-fun m!964853 () Bool)

(assert (=> b!1045554 m!964853))

(assert (=> b!1045544 m!964797))

(assert (=> b!1045544 m!964797))

(assert (=> b!1045544 m!964799))

(assert (=> b!1045548 m!964797))

(assert (=> b!1045548 m!964797))

(assert (=> b!1045548 m!964799))

(assert (=> d!126403 m!964793))

(declare-fun m!964855 () Bool)

(assert (=> bm!44520 m!964855))

(declare-fun m!964857 () Bool)

(assert (=> b!1045543 m!964857))

(declare-fun m!964859 () Bool)

(assert (=> b!1045541 m!964859))

(declare-fun m!964861 () Bool)

(assert (=> bm!44524 m!964861))

(assert (=> b!1045555 m!964797))

(assert (=> b!1045555 m!964797))

(declare-fun m!964863 () Bool)

(assert (=> b!1045555 m!964863))

(declare-fun m!964865 () Bool)

(assert (=> bm!44518 m!964865))

(declare-fun m!964867 () Bool)

(assert (=> b!1045545 m!964867))

(assert (=> b!1045389 d!126403))

(declare-fun d!126405 () Bool)

(declare-fun e!592705 () Bool)

(assert (=> d!126405 e!592705))

(declare-fun res!696173 () Bool)

(assert (=> d!126405 (=> (not res!696173) (not e!592705))))

(assert (=> d!126405 (= res!696173 (and (bvsge (index!41764 lt!461398) #b00000000000000000000000000000000) (bvslt (index!41764 lt!461398) (size!32199 (_keys!11687 thiss!1427)))))))

(declare-fun lt!461538 () Unit!34033)

(declare-fun choose!53 (array!65833 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22055) Unit!34033)

(assert (=> d!126405 (= lt!461538 (choose!53 (_keys!11687 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41764 lt!461398) #b00000000000000000000000000000000 Nil!22052))))

(assert (=> d!126405 (bvslt (size!32199 (_keys!11687 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126405 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11687 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41764 lt!461398) #b00000000000000000000000000000000 Nil!22052) lt!461538)))

(declare-fun b!1045561 () Bool)

(assert (=> b!1045561 (= e!592705 (arrayNoDuplicates!0 (array!65834 (store (arr!31662 (_keys!11687 thiss!1427)) (index!41764 lt!461398) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32199 (_keys!11687 thiss!1427))) #b00000000000000000000000000000000 Nil!22052))))

(assert (= (and d!126405 res!696173) b!1045561))

(declare-fun m!964869 () Bool)

(assert (=> d!126405 m!964869))

(assert (=> b!1045561 m!964649))

(declare-fun m!964871 () Bool)

(assert (=> b!1045561 m!964871))

(assert (=> b!1045389 d!126405))

(declare-fun d!126407 () Bool)

(declare-fun e!592711 () Bool)

(assert (=> d!126407 e!592711))

(declare-fun res!696176 () Bool)

(assert (=> d!126407 (=> res!696176 e!592711)))

(declare-fun lt!461550 () Bool)

(assert (=> d!126407 (= res!696176 (not lt!461550))))

(declare-fun lt!461548 () Bool)

(assert (=> d!126407 (= lt!461550 lt!461548)))

(declare-fun lt!461549 () Unit!34033)

(declare-fun e!592710 () Unit!34033)

(assert (=> d!126407 (= lt!461549 e!592710)))

(declare-fun c!106294 () Bool)

(assert (=> d!126407 (= c!106294 lt!461548)))

(declare-fun containsKey!570 (List!22054 (_ BitVec 64)) Bool)

(assert (=> d!126407 (= lt!461548 (containsKey!570 (toList!6946 (getCurrentListMap!3912 (_keys!11687 (_2!7941 lt!461394)) (_values!6442 (_2!7941 lt!461394)) (mask!30545 (_2!7941 lt!461394)) (extraKeys!6147 (_2!7941 lt!461394)) (zeroValue!6253 (_2!7941 lt!461394)) (minValue!6253 (_2!7941 lt!461394)) #b00000000000000000000000000000000 (defaultEntry!6419 (_2!7941 lt!461394)))) key!909))))

(assert (=> d!126407 (= (contains!6059 (getCurrentListMap!3912 (_keys!11687 (_2!7941 lt!461394)) (_values!6442 (_2!7941 lt!461394)) (mask!30545 (_2!7941 lt!461394)) (extraKeys!6147 (_2!7941 lt!461394)) (zeroValue!6253 (_2!7941 lt!461394)) (minValue!6253 (_2!7941 lt!461394)) #b00000000000000000000000000000000 (defaultEntry!6419 (_2!7941 lt!461394))) key!909) lt!461550)))

(declare-fun b!1045568 () Bool)

(declare-fun lt!461547 () Unit!34033)

(assert (=> b!1045568 (= e!592710 lt!461547)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!402 (List!22054 (_ BitVec 64)) Unit!34033)

(assert (=> b!1045568 (= lt!461547 (lemmaContainsKeyImpliesGetValueByKeyDefined!402 (toList!6946 (getCurrentListMap!3912 (_keys!11687 (_2!7941 lt!461394)) (_values!6442 (_2!7941 lt!461394)) (mask!30545 (_2!7941 lt!461394)) (extraKeys!6147 (_2!7941 lt!461394)) (zeroValue!6253 (_2!7941 lt!461394)) (minValue!6253 (_2!7941 lt!461394)) #b00000000000000000000000000000000 (defaultEntry!6419 (_2!7941 lt!461394)))) key!909))))

(declare-datatypes ((Option!648 0))(
  ( (Some!647 (v!15078 V!38019)) (None!646) )
))
(declare-fun isDefined!445 (Option!648) Bool)

(declare-fun getValueByKey!597 (List!22054 (_ BitVec 64)) Option!648)

(assert (=> b!1045568 (isDefined!445 (getValueByKey!597 (toList!6946 (getCurrentListMap!3912 (_keys!11687 (_2!7941 lt!461394)) (_values!6442 (_2!7941 lt!461394)) (mask!30545 (_2!7941 lt!461394)) (extraKeys!6147 (_2!7941 lt!461394)) (zeroValue!6253 (_2!7941 lt!461394)) (minValue!6253 (_2!7941 lt!461394)) #b00000000000000000000000000000000 (defaultEntry!6419 (_2!7941 lt!461394)))) key!909))))

(declare-fun b!1045569 () Bool)

(declare-fun Unit!34044 () Unit!34033)

(assert (=> b!1045569 (= e!592710 Unit!34044)))

(declare-fun b!1045570 () Bool)

(assert (=> b!1045570 (= e!592711 (isDefined!445 (getValueByKey!597 (toList!6946 (getCurrentListMap!3912 (_keys!11687 (_2!7941 lt!461394)) (_values!6442 (_2!7941 lt!461394)) (mask!30545 (_2!7941 lt!461394)) (extraKeys!6147 (_2!7941 lt!461394)) (zeroValue!6253 (_2!7941 lt!461394)) (minValue!6253 (_2!7941 lt!461394)) #b00000000000000000000000000000000 (defaultEntry!6419 (_2!7941 lt!461394)))) key!909)))))

(assert (= (and d!126407 c!106294) b!1045568))

(assert (= (and d!126407 (not c!106294)) b!1045569))

(assert (= (and d!126407 (not res!696176)) b!1045570))

(declare-fun m!964873 () Bool)

(assert (=> d!126407 m!964873))

(declare-fun m!964875 () Bool)

(assert (=> b!1045568 m!964875))

(declare-fun m!964877 () Bool)

(assert (=> b!1045568 m!964877))

(assert (=> b!1045568 m!964877))

(declare-fun m!964879 () Bool)

(assert (=> b!1045568 m!964879))

(assert (=> b!1045570 m!964877))

(assert (=> b!1045570 m!964877))

(assert (=> b!1045570 m!964879))

(assert (=> b!1045389 d!126407))

(declare-fun b!1045571 () Bool)

(declare-fun e!592723 () Bool)

(declare-fun call!44528 () Bool)

(assert (=> b!1045571 (= e!592723 (not call!44528))))

(declare-fun b!1045572 () Bool)

(declare-fun res!696185 () Bool)

(declare-fun e!592713 () Bool)

(assert (=> b!1045572 (=> (not res!696185) (not e!592713))))

(assert (=> b!1045572 (= res!696185 e!592723)))

(declare-fun c!106298 () Bool)

(assert (=> b!1045572 (= c!106298 (not (= (bvand (extraKeys!6147 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!44526 () Bool)

(declare-fun call!44529 () ListLongMap!13861)

(assert (=> bm!44526 (= call!44529 (getCurrentListMapNoExtraKeys!3574 (_keys!11687 thiss!1427) (_values!6442 thiss!1427) (mask!30545 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6419 thiss!1427)))))

(declare-fun b!1045573 () Bool)

(declare-fun c!106300 () Bool)

(assert (=> b!1045573 (= c!106300 (and (not (= (bvand (extraKeys!6147 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6147 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!592716 () ListLongMap!13861)

(declare-fun e!592714 () ListLongMap!13861)

(assert (=> b!1045573 (= e!592716 e!592714)))

(declare-fun bm!44527 () Bool)

(declare-fun call!44530 () Bool)

(declare-fun lt!461555 () ListLongMap!13861)

(assert (=> bm!44527 (= call!44530 (contains!6059 lt!461555 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045574 () Bool)

(declare-fun e!592712 () Bool)

(assert (=> b!1045574 (= e!592712 (= (apply!908 lt!461555 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6253 thiss!1427)))))

(declare-fun b!1045575 () Bool)

(declare-fun e!592715 () Unit!34033)

(declare-fun Unit!34045 () Unit!34033)

(assert (=> b!1045575 (= e!592715 Unit!34045)))

(declare-fun b!1045576 () Bool)

(declare-fun e!592722 () Bool)

(assert (=> b!1045576 (= e!592722 (= (apply!908 lt!461555 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6253 thiss!1427)))))

(declare-fun b!1045577 () Bool)

(declare-fun e!592721 () Bool)

(assert (=> b!1045577 (= e!592721 (validKeyInArray!0 (select (arr!31662 (_keys!11687 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44528 () Bool)

(declare-fun call!44534 () ListLongMap!13861)

(assert (=> bm!44528 (= call!44534 call!44529)))

(declare-fun d!126409 () Bool)

(assert (=> d!126409 e!592713))

(declare-fun res!696181 () Bool)

(assert (=> d!126409 (=> (not res!696181) (not e!592713))))

(assert (=> d!126409 (= res!696181 (or (bvsge #b00000000000000000000000000000000 (size!32199 (_keys!11687 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32199 (_keys!11687 thiss!1427))))))))

(declare-fun lt!461559 () ListLongMap!13861)

(assert (=> d!126409 (= lt!461555 lt!461559)))

(declare-fun lt!461566 () Unit!34033)

(assert (=> d!126409 (= lt!461566 e!592715)))

(declare-fun c!106296 () Bool)

(declare-fun e!592724 () Bool)

(assert (=> d!126409 (= c!106296 e!592724)))

(declare-fun res!696177 () Bool)

(assert (=> d!126409 (=> (not res!696177) (not e!592724))))

(assert (=> d!126409 (= res!696177 (bvslt #b00000000000000000000000000000000 (size!32199 (_keys!11687 thiss!1427))))))

(declare-fun e!592718 () ListLongMap!13861)

(assert (=> d!126409 (= lt!461559 e!592718)))

(declare-fun c!106295 () Bool)

(assert (=> d!126409 (= c!106295 (and (not (= (bvand (extraKeys!6147 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6147 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126409 (validMask!0 (mask!30545 thiss!1427))))

(assert (=> d!126409 (= (getCurrentListMap!3912 (_keys!11687 thiss!1427) (_values!6442 thiss!1427) (mask!30545 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6419 thiss!1427)) lt!461555)))

(declare-fun bm!44525 () Bool)

(assert (=> bm!44525 (= call!44528 (contains!6059 lt!461555 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!44529 () Bool)

(declare-fun call!44533 () ListLongMap!13861)

(declare-fun call!44531 () ListLongMap!13861)

(assert (=> bm!44529 (= call!44533 call!44531)))

(declare-fun b!1045578 () Bool)

(assert (=> b!1045578 (= e!592718 (+!3139 call!44531 (tuple2!15863 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6253 thiss!1427))))))

(declare-fun bm!44530 () Bool)

(declare-fun call!44532 () ListLongMap!13861)

(assert (=> bm!44530 (= call!44532 call!44534)))

(declare-fun b!1045579 () Bool)

(assert (=> b!1045579 (= e!592714 call!44533)))

(declare-fun c!106297 () Bool)

(declare-fun bm!44531 () Bool)

(assert (=> bm!44531 (= call!44531 (+!3139 (ite c!106295 call!44529 (ite c!106297 call!44534 call!44532)) (ite (or c!106295 c!106297) (tuple2!15863 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6253 thiss!1427)) (tuple2!15863 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6253 thiss!1427)))))))

(declare-fun b!1045580 () Bool)

(declare-fun e!592719 () Bool)

(assert (=> b!1045580 (= e!592719 (= (apply!908 lt!461555 (select (arr!31662 (_keys!11687 thiss!1427)) #b00000000000000000000000000000000)) (get!16557 (select (arr!31663 (_values!6442 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1999 (defaultEntry!6419 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1045580 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32200 (_values!6442 thiss!1427))))))

(assert (=> b!1045580 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32199 (_keys!11687 thiss!1427))))))

(declare-fun b!1045581 () Bool)

(assert (=> b!1045581 (= e!592724 (validKeyInArray!0 (select (arr!31662 (_keys!11687 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1045582 () Bool)

(declare-fun e!592720 () Bool)

(assert (=> b!1045582 (= e!592720 e!592722)))

(declare-fun res!696184 () Bool)

(assert (=> b!1045582 (= res!696184 call!44530)))

(assert (=> b!1045582 (=> (not res!696184) (not e!592722))))

(declare-fun b!1045583 () Bool)

(assert (=> b!1045583 (= e!592713 e!592720)))

(declare-fun c!106299 () Bool)

(assert (=> b!1045583 (= c!106299 (not (= (bvand (extraKeys!6147 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1045584 () Bool)

(assert (=> b!1045584 (= e!592720 (not call!44530))))

(declare-fun b!1045585 () Bool)

(assert (=> b!1045585 (= e!592718 e!592716)))

(assert (=> b!1045585 (= c!106297 (and (not (= (bvand (extraKeys!6147 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6147 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1045586 () Bool)

(assert (=> b!1045586 (= e!592714 call!44532)))

(declare-fun b!1045587 () Bool)

(declare-fun lt!461568 () Unit!34033)

(assert (=> b!1045587 (= e!592715 lt!461568)))

(declare-fun lt!461567 () ListLongMap!13861)

(assert (=> b!1045587 (= lt!461567 (getCurrentListMapNoExtraKeys!3574 (_keys!11687 thiss!1427) (_values!6442 thiss!1427) (mask!30545 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6419 thiss!1427)))))

(declare-fun lt!461556 () (_ BitVec 64))

(assert (=> b!1045587 (= lt!461556 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461570 () (_ BitVec 64))

(assert (=> b!1045587 (= lt!461570 (select (arr!31662 (_keys!11687 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!461565 () Unit!34033)

(assert (=> b!1045587 (= lt!461565 (addStillContains!627 lt!461567 lt!461556 (zeroValue!6253 thiss!1427) lt!461570))))

(assert (=> b!1045587 (contains!6059 (+!3139 lt!461567 (tuple2!15863 lt!461556 (zeroValue!6253 thiss!1427))) lt!461570)))

(declare-fun lt!461564 () Unit!34033)

(assert (=> b!1045587 (= lt!461564 lt!461565)))

(declare-fun lt!461557 () ListLongMap!13861)

(assert (=> b!1045587 (= lt!461557 (getCurrentListMapNoExtraKeys!3574 (_keys!11687 thiss!1427) (_values!6442 thiss!1427) (mask!30545 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6419 thiss!1427)))))

(declare-fun lt!461569 () (_ BitVec 64))

(assert (=> b!1045587 (= lt!461569 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461560 () (_ BitVec 64))

(assert (=> b!1045587 (= lt!461560 (select (arr!31662 (_keys!11687 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!461561 () Unit!34033)

(assert (=> b!1045587 (= lt!461561 (addApplyDifferent!483 lt!461557 lt!461569 (minValue!6253 thiss!1427) lt!461560))))

(assert (=> b!1045587 (= (apply!908 (+!3139 lt!461557 (tuple2!15863 lt!461569 (minValue!6253 thiss!1427))) lt!461560) (apply!908 lt!461557 lt!461560))))

(declare-fun lt!461571 () Unit!34033)

(assert (=> b!1045587 (= lt!461571 lt!461561)))

(declare-fun lt!461551 () ListLongMap!13861)

(assert (=> b!1045587 (= lt!461551 (getCurrentListMapNoExtraKeys!3574 (_keys!11687 thiss!1427) (_values!6442 thiss!1427) (mask!30545 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6419 thiss!1427)))))

(declare-fun lt!461553 () (_ BitVec 64))

(assert (=> b!1045587 (= lt!461553 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461572 () (_ BitVec 64))

(assert (=> b!1045587 (= lt!461572 (select (arr!31662 (_keys!11687 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!461552 () Unit!34033)

(assert (=> b!1045587 (= lt!461552 (addApplyDifferent!483 lt!461551 lt!461553 (zeroValue!6253 thiss!1427) lt!461572))))

(assert (=> b!1045587 (= (apply!908 (+!3139 lt!461551 (tuple2!15863 lt!461553 (zeroValue!6253 thiss!1427))) lt!461572) (apply!908 lt!461551 lt!461572))))

(declare-fun lt!461558 () Unit!34033)

(assert (=> b!1045587 (= lt!461558 lt!461552)))

(declare-fun lt!461562 () ListLongMap!13861)

(assert (=> b!1045587 (= lt!461562 (getCurrentListMapNoExtraKeys!3574 (_keys!11687 thiss!1427) (_values!6442 thiss!1427) (mask!30545 thiss!1427) (extraKeys!6147 thiss!1427) (zeroValue!6253 thiss!1427) (minValue!6253 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6419 thiss!1427)))))

(declare-fun lt!461554 () (_ BitVec 64))

(assert (=> b!1045587 (= lt!461554 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461563 () (_ BitVec 64))

(assert (=> b!1045587 (= lt!461563 (select (arr!31662 (_keys!11687 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1045587 (= lt!461568 (addApplyDifferent!483 lt!461562 lt!461554 (minValue!6253 thiss!1427) lt!461563))))

(assert (=> b!1045587 (= (apply!908 (+!3139 lt!461562 (tuple2!15863 lt!461554 (minValue!6253 thiss!1427))) lt!461563) (apply!908 lt!461562 lt!461563))))

(declare-fun b!1045588 () Bool)

(declare-fun e!592717 () Bool)

(assert (=> b!1045588 (= e!592717 e!592719)))

(declare-fun res!696178 () Bool)

(assert (=> b!1045588 (=> (not res!696178) (not e!592719))))

(assert (=> b!1045588 (= res!696178 (contains!6059 lt!461555 (select (arr!31662 (_keys!11687 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1045588 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32199 (_keys!11687 thiss!1427))))))

(declare-fun b!1045589 () Bool)

(declare-fun res!696182 () Bool)

(assert (=> b!1045589 (=> (not res!696182) (not e!592713))))

(assert (=> b!1045589 (= res!696182 e!592717)))

(declare-fun res!696183 () Bool)

(assert (=> b!1045589 (=> res!696183 e!592717)))

(assert (=> b!1045589 (= res!696183 (not e!592721))))

(declare-fun res!696180 () Bool)

(assert (=> b!1045589 (=> (not res!696180) (not e!592721))))

(assert (=> b!1045589 (= res!696180 (bvslt #b00000000000000000000000000000000 (size!32199 (_keys!11687 thiss!1427))))))

(declare-fun b!1045590 () Bool)

(assert (=> b!1045590 (= e!592716 call!44533)))

(declare-fun b!1045591 () Bool)

(assert (=> b!1045591 (= e!592723 e!592712)))

(declare-fun res!696179 () Bool)

(assert (=> b!1045591 (= res!696179 call!44528)))

(assert (=> b!1045591 (=> (not res!696179) (not e!592712))))

(assert (= (and d!126409 c!106295) b!1045578))

(assert (= (and d!126409 (not c!106295)) b!1045585))

(assert (= (and b!1045585 c!106297) b!1045590))

(assert (= (and b!1045585 (not c!106297)) b!1045573))

(assert (= (and b!1045573 c!106300) b!1045579))

(assert (= (and b!1045573 (not c!106300)) b!1045586))

(assert (= (or b!1045579 b!1045586) bm!44530))

(assert (= (or b!1045590 bm!44530) bm!44528))

(assert (= (or b!1045590 b!1045579) bm!44529))

(assert (= (or b!1045578 bm!44528) bm!44526))

(assert (= (or b!1045578 bm!44529) bm!44531))

(assert (= (and d!126409 res!696177) b!1045581))

(assert (= (and d!126409 c!106296) b!1045587))

(assert (= (and d!126409 (not c!106296)) b!1045575))

(assert (= (and d!126409 res!696181) b!1045589))

(assert (= (and b!1045589 res!696180) b!1045577))

(assert (= (and b!1045589 (not res!696183)) b!1045588))

(assert (= (and b!1045588 res!696178) b!1045580))

(assert (= (and b!1045589 res!696182) b!1045572))

(assert (= (and b!1045572 c!106298) b!1045591))

(assert (= (and b!1045572 (not c!106298)) b!1045571))

(assert (= (and b!1045591 res!696179) b!1045574))

(assert (= (or b!1045591 b!1045571) bm!44525))

(assert (= (and b!1045572 res!696185) b!1045583))

(assert (= (and b!1045583 c!106299) b!1045582))

(assert (= (and b!1045583 (not c!106299)) b!1045584))

(assert (= (and b!1045582 res!696184) b!1045576))

(assert (= (or b!1045582 b!1045584) bm!44527))

(declare-fun b_lambda!16297 () Bool)

(assert (=> (not b_lambda!16297) (not b!1045580)))

(assert (=> b!1045580 t!31312))

(declare-fun b_and!33755 () Bool)

(assert (= b_and!33753 (and (=> t!31312 result!14595) b_and!33755)))

(declare-fun m!964881 () Bool)

(assert (=> b!1045580 m!964881))

(assert (=> b!1045580 m!964673))

(assert (=> b!1045580 m!964881))

(assert (=> b!1045580 m!964673))

(declare-fun m!964883 () Bool)

(assert (=> b!1045580 m!964883))

(declare-fun m!964885 () Bool)

(assert (=> b!1045580 m!964885))

(assert (=> b!1045580 m!964885))

(declare-fun m!964887 () Bool)

(assert (=> b!1045580 m!964887))

(declare-fun m!964889 () Bool)

(assert (=> bm!44526 m!964889))

(assert (=> b!1045587 m!964889))

(declare-fun m!964891 () Bool)

(assert (=> b!1045587 m!964891))

(declare-fun m!964893 () Bool)

(assert (=> b!1045587 m!964893))

(declare-fun m!964895 () Bool)

(assert (=> b!1045587 m!964895))

(declare-fun m!964897 () Bool)

(assert (=> b!1045587 m!964897))

(declare-fun m!964899 () Bool)

(assert (=> b!1045587 m!964899))

(declare-fun m!964901 () Bool)

(assert (=> b!1045587 m!964901))

(declare-fun m!964903 () Bool)

(assert (=> b!1045587 m!964903))

(declare-fun m!964905 () Bool)

(assert (=> b!1045587 m!964905))

(declare-fun m!964907 () Bool)

(assert (=> b!1045587 m!964907))

(declare-fun m!964909 () Bool)

(assert (=> b!1045587 m!964909))

(assert (=> b!1045587 m!964907))

(assert (=> b!1045587 m!964893))

(assert (=> b!1045587 m!964899))

(declare-fun m!964911 () Bool)

(assert (=> b!1045587 m!964911))

(declare-fun m!964913 () Bool)

(assert (=> b!1045587 m!964913))

(declare-fun m!964915 () Bool)

(assert (=> b!1045587 m!964915))

(assert (=> b!1045587 m!964913))

(assert (=> b!1045587 m!964885))

(declare-fun m!964917 () Bool)

(assert (=> b!1045587 m!964917))

(declare-fun m!964919 () Bool)

(assert (=> b!1045587 m!964919))

(assert (=> b!1045577 m!964885))

(assert (=> b!1045577 m!964885))

(declare-fun m!964921 () Bool)

(assert (=> b!1045577 m!964921))

(assert (=> b!1045581 m!964885))

(assert (=> b!1045581 m!964885))

(assert (=> b!1045581 m!964921))

(assert (=> d!126409 m!964793))

(declare-fun m!964923 () Bool)

(assert (=> bm!44527 m!964923))

(declare-fun m!964925 () Bool)

(assert (=> b!1045576 m!964925))

(declare-fun m!964927 () Bool)

(assert (=> b!1045574 m!964927))

(declare-fun m!964929 () Bool)

(assert (=> bm!44531 m!964929))

(assert (=> b!1045588 m!964885))

(assert (=> b!1045588 m!964885))

(declare-fun m!964931 () Bool)

(assert (=> b!1045588 m!964931))

(declare-fun m!964933 () Bool)

(assert (=> bm!44525 m!964933))

(declare-fun m!964935 () Bool)

(assert (=> b!1045578 m!964935))

(assert (=> b!1045389 d!126409))

(declare-fun d!126411 () Bool)

(declare-fun e!592727 () Bool)

(assert (=> d!126411 e!592727))

(declare-fun res!696188 () Bool)

(assert (=> d!126411 (=> (not res!696188) (not e!592727))))

(assert (=> d!126411 (= res!696188 (bvslt (index!41764 lt!461398) (size!32199 (_keys!11687 thiss!1427))))))

(declare-fun lt!461575 () Unit!34033)

(declare-fun choose!121 (array!65833 (_ BitVec 32) (_ BitVec 64)) Unit!34033)

(assert (=> d!126411 (= lt!461575 (choose!121 (_keys!11687 thiss!1427) (index!41764 lt!461398) key!909))))

(assert (=> d!126411 (bvsge (index!41764 lt!461398) #b00000000000000000000000000000000)))

(assert (=> d!126411 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11687 thiss!1427) (index!41764 lt!461398) key!909) lt!461575)))

(declare-fun b!1045594 () Bool)

(assert (=> b!1045594 (= e!592727 (not (arrayContainsKey!0 (array!65834 (store (arr!31662 (_keys!11687 thiss!1427)) (index!41764 lt!461398) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32199 (_keys!11687 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126411 res!696188) b!1045594))

(declare-fun m!964937 () Bool)

(assert (=> d!126411 m!964937))

(assert (=> b!1045594 m!964649))

(declare-fun m!964939 () Bool)

(assert (=> b!1045594 m!964939))

(assert (=> b!1045389 d!126411))

(declare-fun bm!44534 () Bool)

(declare-fun call!44537 () (_ BitVec 32))

(assert (=> bm!44534 (= call!44537 (arrayCountValidKeys!0 lt!461397 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32199 (_keys!11687 thiss!1427))))))

(declare-fun d!126413 () Bool)

(declare-fun lt!461578 () (_ BitVec 32))

(assert (=> d!126413 (and (bvsge lt!461578 #b00000000000000000000000000000000) (bvsle lt!461578 (bvsub (size!32199 lt!461397) #b00000000000000000000000000000000)))))

(declare-fun e!592733 () (_ BitVec 32))

(assert (=> d!126413 (= lt!461578 e!592733)))

(declare-fun c!106306 () Bool)

(assert (=> d!126413 (= c!106306 (bvsge #b00000000000000000000000000000000 (size!32199 (_keys!11687 thiss!1427))))))

(assert (=> d!126413 (and (bvsle #b00000000000000000000000000000000 (size!32199 (_keys!11687 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32199 (_keys!11687 thiss!1427)) (size!32199 lt!461397)))))

(assert (=> d!126413 (= (arrayCountValidKeys!0 lt!461397 #b00000000000000000000000000000000 (size!32199 (_keys!11687 thiss!1427))) lt!461578)))

(declare-fun b!1045603 () Bool)

(declare-fun e!592732 () (_ BitVec 32))

(assert (=> b!1045603 (= e!592733 e!592732)))

(declare-fun c!106305 () Bool)

(assert (=> b!1045603 (= c!106305 (validKeyInArray!0 (select (arr!31662 lt!461397) #b00000000000000000000000000000000)))))

(declare-fun b!1045604 () Bool)

(assert (=> b!1045604 (= e!592732 (bvadd #b00000000000000000000000000000001 call!44537))))

(declare-fun b!1045605 () Bool)

(assert (=> b!1045605 (= e!592733 #b00000000000000000000000000000000)))

(declare-fun b!1045606 () Bool)

(assert (=> b!1045606 (= e!592732 call!44537)))

(assert (= (and d!126413 c!106306) b!1045605))

(assert (= (and d!126413 (not c!106306)) b!1045603))

(assert (= (and b!1045603 c!106305) b!1045604))

(assert (= (and b!1045603 (not c!106305)) b!1045606))

(assert (= (or b!1045604 b!1045606) bm!44534))

(declare-fun m!964941 () Bool)

(assert (=> bm!44534 m!964941))

(assert (=> b!1045603 m!964797))

(assert (=> b!1045603 m!964797))

(assert (=> b!1045603 m!964799))

(assert (=> b!1045389 d!126413))

(declare-fun d!126415 () Bool)

(declare-fun e!592736 () Bool)

(assert (=> d!126415 e!592736))

(declare-fun res!696191 () Bool)

(assert (=> d!126415 (=> (not res!696191) (not e!592736))))

(assert (=> d!126415 (= res!696191 (and (bvsge (index!41764 lt!461398) #b00000000000000000000000000000000) (bvslt (index!41764 lt!461398) (size!32199 (_keys!11687 thiss!1427)))))))

(declare-fun lt!461581 () Unit!34033)

(declare-fun choose!25 (array!65833 (_ BitVec 32) (_ BitVec 32)) Unit!34033)

(assert (=> d!126415 (= lt!461581 (choose!25 (_keys!11687 thiss!1427) (index!41764 lt!461398) (mask!30545 thiss!1427)))))

(assert (=> d!126415 (validMask!0 (mask!30545 thiss!1427))))

(assert (=> d!126415 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11687 thiss!1427) (index!41764 lt!461398) (mask!30545 thiss!1427)) lt!461581)))

(declare-fun b!1045609 () Bool)

(assert (=> b!1045609 (= e!592736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65834 (store (arr!31662 (_keys!11687 thiss!1427)) (index!41764 lt!461398) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32199 (_keys!11687 thiss!1427))) (mask!30545 thiss!1427)))))

(assert (= (and d!126415 res!696191) b!1045609))

(declare-fun m!964943 () Bool)

(assert (=> d!126415 m!964943))

(assert (=> d!126415 m!964793))

(assert (=> b!1045609 m!964649))

(declare-fun m!964945 () Bool)

(assert (=> b!1045609 m!964945))

(assert (=> b!1045389 d!126415))

(declare-fun d!126417 () Bool)

(declare-fun res!696196 () Bool)

(declare-fun e!592741 () Bool)

(assert (=> d!126417 (=> res!696196 e!592741)))

(assert (=> d!126417 (= res!696196 (= (select (arr!31662 lt!461397) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126417 (= (arrayContainsKey!0 lt!461397 key!909 #b00000000000000000000000000000000) e!592741)))

(declare-fun b!1045614 () Bool)

(declare-fun e!592742 () Bool)

(assert (=> b!1045614 (= e!592741 e!592742)))

(declare-fun res!696197 () Bool)

(assert (=> b!1045614 (=> (not res!696197) (not e!592742))))

(assert (=> b!1045614 (= res!696197 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32199 lt!461397)))))

(declare-fun b!1045615 () Bool)

(assert (=> b!1045615 (= e!592742 (arrayContainsKey!0 lt!461397 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126417 (not res!696196)) b!1045614))

(assert (= (and b!1045614 res!696197) b!1045615))

(assert (=> d!126417 m!964797))

(declare-fun m!964947 () Bool)

(assert (=> b!1045615 m!964947))

(assert (=> b!1045389 d!126417))

(declare-fun b!1045616 () Bool)

(declare-fun e!592754 () Bool)

(declare-fun call!44538 () Bool)

(assert (=> b!1045616 (= e!592754 (not call!44538))))

(declare-fun b!1045617 () Bool)

(declare-fun res!696206 () Bool)

(declare-fun e!592744 () Bool)

(assert (=> b!1045617 (=> (not res!696206) (not e!592744))))

(assert (=> b!1045617 (= res!696206 e!592754)))

(declare-fun c!106310 () Bool)

(assert (=> b!1045617 (= c!106310 (not (= (bvand (extraKeys!6147 (_2!7941 lt!461394)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!44536 () Bool)

(declare-fun call!44539 () ListLongMap!13861)

(assert (=> bm!44536 (= call!44539 (getCurrentListMapNoExtraKeys!3574 (_keys!11687 (_2!7941 lt!461394)) (_values!6442 (_2!7941 lt!461394)) (mask!30545 (_2!7941 lt!461394)) (extraKeys!6147 (_2!7941 lt!461394)) (zeroValue!6253 (_2!7941 lt!461394)) (minValue!6253 (_2!7941 lt!461394)) #b00000000000000000000000000000000 (defaultEntry!6419 (_2!7941 lt!461394))))))

(declare-fun b!1045618 () Bool)

(declare-fun c!106312 () Bool)

(assert (=> b!1045618 (= c!106312 (and (not (= (bvand (extraKeys!6147 (_2!7941 lt!461394)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6147 (_2!7941 lt!461394)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!592747 () ListLongMap!13861)

(declare-fun e!592745 () ListLongMap!13861)

(assert (=> b!1045618 (= e!592747 e!592745)))

(declare-fun bm!44537 () Bool)

(declare-fun call!44540 () Bool)

(declare-fun lt!461586 () ListLongMap!13861)

(assert (=> bm!44537 (= call!44540 (contains!6059 lt!461586 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1045619 () Bool)

(declare-fun e!592743 () Bool)

(assert (=> b!1045619 (= e!592743 (= (apply!908 lt!461586 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6253 (_2!7941 lt!461394))))))

(declare-fun b!1045620 () Bool)

(declare-fun e!592746 () Unit!34033)

(declare-fun Unit!34046 () Unit!34033)

(assert (=> b!1045620 (= e!592746 Unit!34046)))

(declare-fun b!1045621 () Bool)

(declare-fun e!592753 () Bool)

(assert (=> b!1045621 (= e!592753 (= (apply!908 lt!461586 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6253 (_2!7941 lt!461394))))))

(declare-fun b!1045622 () Bool)

(declare-fun e!592752 () Bool)

(assert (=> b!1045622 (= e!592752 (validKeyInArray!0 (select (arr!31662 (_keys!11687 (_2!7941 lt!461394))) #b00000000000000000000000000000000)))))

(declare-fun bm!44538 () Bool)

(declare-fun call!44544 () ListLongMap!13861)

(assert (=> bm!44538 (= call!44544 call!44539)))

(declare-fun d!126419 () Bool)

(assert (=> d!126419 e!592744))

(declare-fun res!696202 () Bool)

(assert (=> d!126419 (=> (not res!696202) (not e!592744))))

(assert (=> d!126419 (= res!696202 (or (bvsge #b00000000000000000000000000000000 (size!32199 (_keys!11687 (_2!7941 lt!461394)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32199 (_keys!11687 (_2!7941 lt!461394)))))))))

(declare-fun lt!461590 () ListLongMap!13861)

(assert (=> d!126419 (= lt!461586 lt!461590)))

(declare-fun lt!461597 () Unit!34033)

(assert (=> d!126419 (= lt!461597 e!592746)))

(declare-fun c!106308 () Bool)

(declare-fun e!592755 () Bool)

(assert (=> d!126419 (= c!106308 e!592755)))

(declare-fun res!696198 () Bool)

(assert (=> d!126419 (=> (not res!696198) (not e!592755))))

(assert (=> d!126419 (= res!696198 (bvslt #b00000000000000000000000000000000 (size!32199 (_keys!11687 (_2!7941 lt!461394)))))))

(declare-fun e!592749 () ListLongMap!13861)

(assert (=> d!126419 (= lt!461590 e!592749)))

(declare-fun c!106307 () Bool)

(assert (=> d!126419 (= c!106307 (and (not (= (bvand (extraKeys!6147 (_2!7941 lt!461394)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!6147 (_2!7941 lt!461394)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!126419 (validMask!0 (mask!30545 (_2!7941 lt!461394)))))

(assert (=> d!126419 (= (getCurrentListMap!3912 (_keys!11687 (_2!7941 lt!461394)) (_values!6442 (_2!7941 lt!461394)) (mask!30545 (_2!7941 lt!461394)) (extraKeys!6147 (_2!7941 lt!461394)) (zeroValue!6253 (_2!7941 lt!461394)) (minValue!6253 (_2!7941 lt!461394)) #b00000000000000000000000000000000 (defaultEntry!6419 (_2!7941 lt!461394))) lt!461586)))

(declare-fun bm!44535 () Bool)

(assert (=> bm!44535 (= call!44538 (contains!6059 lt!461586 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!44539 () Bool)

(declare-fun call!44543 () ListLongMap!13861)

(declare-fun call!44541 () ListLongMap!13861)

(assert (=> bm!44539 (= call!44543 call!44541)))

(declare-fun b!1045623 () Bool)

(assert (=> b!1045623 (= e!592749 (+!3139 call!44541 (tuple2!15863 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6253 (_2!7941 lt!461394)))))))

(declare-fun bm!44540 () Bool)

(declare-fun call!44542 () ListLongMap!13861)

(assert (=> bm!44540 (= call!44542 call!44544)))

(declare-fun b!1045624 () Bool)

(assert (=> b!1045624 (= e!592745 call!44543)))

(declare-fun c!106309 () Bool)

(declare-fun bm!44541 () Bool)

(assert (=> bm!44541 (= call!44541 (+!3139 (ite c!106307 call!44539 (ite c!106309 call!44544 call!44542)) (ite (or c!106307 c!106309) (tuple2!15863 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6253 (_2!7941 lt!461394))) (tuple2!15863 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6253 (_2!7941 lt!461394))))))))

(declare-fun b!1045625 () Bool)

(declare-fun e!592750 () Bool)

(assert (=> b!1045625 (= e!592750 (= (apply!908 lt!461586 (select (arr!31662 (_keys!11687 (_2!7941 lt!461394))) #b00000000000000000000000000000000)) (get!16557 (select (arr!31663 (_values!6442 (_2!7941 lt!461394))) #b00000000000000000000000000000000) (dynLambda!1999 (defaultEntry!6419 (_2!7941 lt!461394)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1045625 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32200 (_values!6442 (_2!7941 lt!461394)))))))

(assert (=> b!1045625 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32199 (_keys!11687 (_2!7941 lt!461394)))))))

(declare-fun b!1045626 () Bool)

(assert (=> b!1045626 (= e!592755 (validKeyInArray!0 (select (arr!31662 (_keys!11687 (_2!7941 lt!461394))) #b00000000000000000000000000000000)))))

(declare-fun b!1045627 () Bool)

(declare-fun e!592751 () Bool)

(assert (=> b!1045627 (= e!592751 e!592753)))

(declare-fun res!696205 () Bool)

(assert (=> b!1045627 (= res!696205 call!44540)))

(assert (=> b!1045627 (=> (not res!696205) (not e!592753))))

(declare-fun b!1045628 () Bool)

(assert (=> b!1045628 (= e!592744 e!592751)))

(declare-fun c!106311 () Bool)

(assert (=> b!1045628 (= c!106311 (not (= (bvand (extraKeys!6147 (_2!7941 lt!461394)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1045629 () Bool)

(assert (=> b!1045629 (= e!592751 (not call!44540))))

(declare-fun b!1045630 () Bool)

(assert (=> b!1045630 (= e!592749 e!592747)))

(assert (=> b!1045630 (= c!106309 (and (not (= (bvand (extraKeys!6147 (_2!7941 lt!461394)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!6147 (_2!7941 lt!461394)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1045631 () Bool)

(assert (=> b!1045631 (= e!592745 call!44542)))

(declare-fun b!1045632 () Bool)

(declare-fun lt!461599 () Unit!34033)

(assert (=> b!1045632 (= e!592746 lt!461599)))

(declare-fun lt!461598 () ListLongMap!13861)

(assert (=> b!1045632 (= lt!461598 (getCurrentListMapNoExtraKeys!3574 (_keys!11687 (_2!7941 lt!461394)) (_values!6442 (_2!7941 lt!461394)) (mask!30545 (_2!7941 lt!461394)) (extraKeys!6147 (_2!7941 lt!461394)) (zeroValue!6253 (_2!7941 lt!461394)) (minValue!6253 (_2!7941 lt!461394)) #b00000000000000000000000000000000 (defaultEntry!6419 (_2!7941 lt!461394))))))

(declare-fun lt!461587 () (_ BitVec 64))

(assert (=> b!1045632 (= lt!461587 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461601 () (_ BitVec 64))

(assert (=> b!1045632 (= lt!461601 (select (arr!31662 (_keys!11687 (_2!7941 lt!461394))) #b00000000000000000000000000000000))))

(declare-fun lt!461596 () Unit!34033)

(assert (=> b!1045632 (= lt!461596 (addStillContains!627 lt!461598 lt!461587 (zeroValue!6253 (_2!7941 lt!461394)) lt!461601))))

(assert (=> b!1045632 (contains!6059 (+!3139 lt!461598 (tuple2!15863 lt!461587 (zeroValue!6253 (_2!7941 lt!461394)))) lt!461601)))

(declare-fun lt!461595 () Unit!34033)

(assert (=> b!1045632 (= lt!461595 lt!461596)))

(declare-fun lt!461588 () ListLongMap!13861)

(assert (=> b!1045632 (= lt!461588 (getCurrentListMapNoExtraKeys!3574 (_keys!11687 (_2!7941 lt!461394)) (_values!6442 (_2!7941 lt!461394)) (mask!30545 (_2!7941 lt!461394)) (extraKeys!6147 (_2!7941 lt!461394)) (zeroValue!6253 (_2!7941 lt!461394)) (minValue!6253 (_2!7941 lt!461394)) #b00000000000000000000000000000000 (defaultEntry!6419 (_2!7941 lt!461394))))))

(declare-fun lt!461600 () (_ BitVec 64))

(assert (=> b!1045632 (= lt!461600 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461591 () (_ BitVec 64))

(assert (=> b!1045632 (= lt!461591 (select (arr!31662 (_keys!11687 (_2!7941 lt!461394))) #b00000000000000000000000000000000))))

(declare-fun lt!461592 () Unit!34033)

(assert (=> b!1045632 (= lt!461592 (addApplyDifferent!483 lt!461588 lt!461600 (minValue!6253 (_2!7941 lt!461394)) lt!461591))))

(assert (=> b!1045632 (= (apply!908 (+!3139 lt!461588 (tuple2!15863 lt!461600 (minValue!6253 (_2!7941 lt!461394)))) lt!461591) (apply!908 lt!461588 lt!461591))))

(declare-fun lt!461602 () Unit!34033)

(assert (=> b!1045632 (= lt!461602 lt!461592)))

(declare-fun lt!461582 () ListLongMap!13861)

(assert (=> b!1045632 (= lt!461582 (getCurrentListMapNoExtraKeys!3574 (_keys!11687 (_2!7941 lt!461394)) (_values!6442 (_2!7941 lt!461394)) (mask!30545 (_2!7941 lt!461394)) (extraKeys!6147 (_2!7941 lt!461394)) (zeroValue!6253 (_2!7941 lt!461394)) (minValue!6253 (_2!7941 lt!461394)) #b00000000000000000000000000000000 (defaultEntry!6419 (_2!7941 lt!461394))))))

(declare-fun lt!461584 () (_ BitVec 64))

(assert (=> b!1045632 (= lt!461584 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461603 () (_ BitVec 64))

(assert (=> b!1045632 (= lt!461603 (select (arr!31662 (_keys!11687 (_2!7941 lt!461394))) #b00000000000000000000000000000000))))

(declare-fun lt!461583 () Unit!34033)

(assert (=> b!1045632 (= lt!461583 (addApplyDifferent!483 lt!461582 lt!461584 (zeroValue!6253 (_2!7941 lt!461394)) lt!461603))))

(assert (=> b!1045632 (= (apply!908 (+!3139 lt!461582 (tuple2!15863 lt!461584 (zeroValue!6253 (_2!7941 lt!461394)))) lt!461603) (apply!908 lt!461582 lt!461603))))

(declare-fun lt!461589 () Unit!34033)

(assert (=> b!1045632 (= lt!461589 lt!461583)))

(declare-fun lt!461593 () ListLongMap!13861)

(assert (=> b!1045632 (= lt!461593 (getCurrentListMapNoExtraKeys!3574 (_keys!11687 (_2!7941 lt!461394)) (_values!6442 (_2!7941 lt!461394)) (mask!30545 (_2!7941 lt!461394)) (extraKeys!6147 (_2!7941 lt!461394)) (zeroValue!6253 (_2!7941 lt!461394)) (minValue!6253 (_2!7941 lt!461394)) #b00000000000000000000000000000000 (defaultEntry!6419 (_2!7941 lt!461394))))))

(declare-fun lt!461585 () (_ BitVec 64))

(assert (=> b!1045632 (= lt!461585 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!461594 () (_ BitVec 64))

(assert (=> b!1045632 (= lt!461594 (select (arr!31662 (_keys!11687 (_2!7941 lt!461394))) #b00000000000000000000000000000000))))

(assert (=> b!1045632 (= lt!461599 (addApplyDifferent!483 lt!461593 lt!461585 (minValue!6253 (_2!7941 lt!461394)) lt!461594))))

(assert (=> b!1045632 (= (apply!908 (+!3139 lt!461593 (tuple2!15863 lt!461585 (minValue!6253 (_2!7941 lt!461394)))) lt!461594) (apply!908 lt!461593 lt!461594))))

(declare-fun b!1045633 () Bool)

(declare-fun e!592748 () Bool)

(assert (=> b!1045633 (= e!592748 e!592750)))

(declare-fun res!696199 () Bool)

(assert (=> b!1045633 (=> (not res!696199) (not e!592750))))

(assert (=> b!1045633 (= res!696199 (contains!6059 lt!461586 (select (arr!31662 (_keys!11687 (_2!7941 lt!461394))) #b00000000000000000000000000000000)))))

(assert (=> b!1045633 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32199 (_keys!11687 (_2!7941 lt!461394)))))))

(declare-fun b!1045634 () Bool)

(declare-fun res!696203 () Bool)

(assert (=> b!1045634 (=> (not res!696203) (not e!592744))))

(assert (=> b!1045634 (= res!696203 e!592748)))

(declare-fun res!696204 () Bool)

(assert (=> b!1045634 (=> res!696204 e!592748)))

(assert (=> b!1045634 (= res!696204 (not e!592752))))

(declare-fun res!696201 () Bool)

(assert (=> b!1045634 (=> (not res!696201) (not e!592752))))

(assert (=> b!1045634 (= res!696201 (bvslt #b00000000000000000000000000000000 (size!32199 (_keys!11687 (_2!7941 lt!461394)))))))

(declare-fun b!1045635 () Bool)

(assert (=> b!1045635 (= e!592747 call!44543)))

(declare-fun b!1045636 () Bool)

(assert (=> b!1045636 (= e!592754 e!592743)))

(declare-fun res!696200 () Bool)

(assert (=> b!1045636 (= res!696200 call!44538)))

(assert (=> b!1045636 (=> (not res!696200) (not e!592743))))

(assert (= (and d!126419 c!106307) b!1045623))

(assert (= (and d!126419 (not c!106307)) b!1045630))

(assert (= (and b!1045630 c!106309) b!1045635))

(assert (= (and b!1045630 (not c!106309)) b!1045618))

(assert (= (and b!1045618 c!106312) b!1045624))

(assert (= (and b!1045618 (not c!106312)) b!1045631))

(assert (= (or b!1045624 b!1045631) bm!44540))

(assert (= (or b!1045635 bm!44540) bm!44538))

(assert (= (or b!1045635 b!1045624) bm!44539))

(assert (= (or b!1045623 bm!44538) bm!44536))

(assert (= (or b!1045623 bm!44539) bm!44541))

(assert (= (and d!126419 res!696198) b!1045626))

(assert (= (and d!126419 c!106308) b!1045632))

(assert (= (and d!126419 (not c!106308)) b!1045620))

(assert (= (and d!126419 res!696202) b!1045634))

(assert (= (and b!1045634 res!696201) b!1045622))

(assert (= (and b!1045634 (not res!696204)) b!1045633))

(assert (= (and b!1045633 res!696199) b!1045625))

(assert (= (and b!1045634 res!696203) b!1045617))

(assert (= (and b!1045617 c!106310) b!1045636))

(assert (= (and b!1045617 (not c!106310)) b!1045616))

(assert (= (and b!1045636 res!696200) b!1045619))

(assert (= (or b!1045636 b!1045616) bm!44535))

(assert (= (and b!1045617 res!696206) b!1045628))

(assert (= (and b!1045628 c!106311) b!1045627))

(assert (= (and b!1045628 (not c!106311)) b!1045629))

(assert (= (and b!1045627 res!696205) b!1045621))

(assert (= (or b!1045627 b!1045629) bm!44537))

(declare-fun b_lambda!16299 () Bool)

(assert (=> (not b_lambda!16299) (not b!1045625)))

(declare-fun t!31322 () Bool)

(declare-fun tb!7087 () Bool)

(assert (=> (and b!1045392 (= (defaultEntry!6419 thiss!1427) (defaultEntry!6419 (_2!7941 lt!461394))) t!31322) tb!7087))

(declare-fun result!14607 () Bool)

(assert (=> tb!7087 (= result!14607 tp_is_empty!24859)))

(assert (=> b!1045625 t!31322))

(declare-fun b_and!33757 () Bool)

(assert (= b_and!33755 (and (=> t!31322 result!14607) b_and!33757)))

(declare-fun m!964949 () Bool)

(assert (=> b!1045625 m!964949))

(declare-fun m!964951 () Bool)

(assert (=> b!1045625 m!964951))

(assert (=> b!1045625 m!964949))

(assert (=> b!1045625 m!964951))

(declare-fun m!964953 () Bool)

(assert (=> b!1045625 m!964953))

(declare-fun m!964955 () Bool)

(assert (=> b!1045625 m!964955))

(assert (=> b!1045625 m!964955))

(declare-fun m!964957 () Bool)

(assert (=> b!1045625 m!964957))

(declare-fun m!964959 () Bool)

(assert (=> bm!44536 m!964959))

(assert (=> b!1045632 m!964959))

(declare-fun m!964961 () Bool)

(assert (=> b!1045632 m!964961))

(declare-fun m!964963 () Bool)

(assert (=> b!1045632 m!964963))

(declare-fun m!964965 () Bool)

(assert (=> b!1045632 m!964965))

(declare-fun m!964967 () Bool)

(assert (=> b!1045632 m!964967))

(declare-fun m!964969 () Bool)

(assert (=> b!1045632 m!964969))

(declare-fun m!964971 () Bool)

(assert (=> b!1045632 m!964971))

(declare-fun m!964973 () Bool)

(assert (=> b!1045632 m!964973))

(declare-fun m!964975 () Bool)

(assert (=> b!1045632 m!964975))

(declare-fun m!964977 () Bool)

(assert (=> b!1045632 m!964977))

(declare-fun m!964979 () Bool)

(assert (=> b!1045632 m!964979))

(assert (=> b!1045632 m!964977))

(assert (=> b!1045632 m!964963))

(assert (=> b!1045632 m!964969))

(declare-fun m!964981 () Bool)

(assert (=> b!1045632 m!964981))

(declare-fun m!964983 () Bool)

(assert (=> b!1045632 m!964983))

(declare-fun m!964985 () Bool)

(assert (=> b!1045632 m!964985))

(assert (=> b!1045632 m!964983))

(assert (=> b!1045632 m!964955))

(declare-fun m!964987 () Bool)

(assert (=> b!1045632 m!964987))

(declare-fun m!964989 () Bool)

(assert (=> b!1045632 m!964989))

(assert (=> b!1045622 m!964955))

(assert (=> b!1045622 m!964955))

(declare-fun m!964991 () Bool)

(assert (=> b!1045622 m!964991))

(assert (=> b!1045626 m!964955))

(assert (=> b!1045626 m!964955))

(assert (=> b!1045626 m!964991))

(assert (=> d!126419 m!964679))

(declare-fun m!964993 () Bool)

(assert (=> bm!44537 m!964993))

(declare-fun m!964995 () Bool)

(assert (=> b!1045621 m!964995))

(declare-fun m!964997 () Bool)

(assert (=> b!1045619 m!964997))

(declare-fun m!964999 () Bool)

(assert (=> bm!44541 m!964999))

(assert (=> b!1045633 m!964955))

(assert (=> b!1045633 m!964955))

(declare-fun m!965001 () Bool)

(assert (=> b!1045633 m!965001))

(declare-fun m!965003 () Bool)

(assert (=> bm!44535 m!965003))

(declare-fun m!965005 () Bool)

(assert (=> b!1045623 m!965005))

(assert (=> b!1045389 d!126419))

(declare-fun bm!44542 () Bool)

(declare-fun call!44545 () (_ BitVec 32))

(assert (=> bm!44542 (= call!44545 (arrayCountValidKeys!0 (_keys!11687 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32199 (_keys!11687 thiss!1427))))))

(declare-fun d!126421 () Bool)

(declare-fun lt!461604 () (_ BitVec 32))

(assert (=> d!126421 (and (bvsge lt!461604 #b00000000000000000000000000000000) (bvsle lt!461604 (bvsub (size!32199 (_keys!11687 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!592757 () (_ BitVec 32))

(assert (=> d!126421 (= lt!461604 e!592757)))

(declare-fun c!106314 () Bool)

(assert (=> d!126421 (= c!106314 (bvsge #b00000000000000000000000000000000 (size!32199 (_keys!11687 thiss!1427))))))

(assert (=> d!126421 (and (bvsle #b00000000000000000000000000000000 (size!32199 (_keys!11687 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32199 (_keys!11687 thiss!1427)) (size!32199 (_keys!11687 thiss!1427))))))

(assert (=> d!126421 (= (arrayCountValidKeys!0 (_keys!11687 thiss!1427) #b00000000000000000000000000000000 (size!32199 (_keys!11687 thiss!1427))) lt!461604)))

(declare-fun b!1045637 () Bool)

(declare-fun e!592756 () (_ BitVec 32))

(assert (=> b!1045637 (= e!592757 e!592756)))

(declare-fun c!106313 () Bool)

(assert (=> b!1045637 (= c!106313 (validKeyInArray!0 (select (arr!31662 (_keys!11687 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1045638 () Bool)

(assert (=> b!1045638 (= e!592756 (bvadd #b00000000000000000000000000000001 call!44545))))

(declare-fun b!1045639 () Bool)

(assert (=> b!1045639 (= e!592757 #b00000000000000000000000000000000)))

(declare-fun b!1045640 () Bool)

(assert (=> b!1045640 (= e!592756 call!44545)))

(assert (= (and d!126421 c!106314) b!1045639))

(assert (= (and d!126421 (not c!106314)) b!1045637))

(assert (= (and b!1045637 c!106313) b!1045638))

(assert (= (and b!1045637 (not c!106313)) b!1045640))

(assert (= (or b!1045638 b!1045640) bm!44542))

(declare-fun m!965007 () Bool)

(assert (=> bm!44542 m!965007))

(assert (=> b!1045637 m!964885))

(assert (=> b!1045637 m!964885))

(assert (=> b!1045637 m!964921))

(assert (=> b!1045389 d!126421))

(declare-fun b!1045650 () Bool)

(declare-fun res!696217 () Bool)

(declare-fun e!592762 () Bool)

(assert (=> b!1045650 (=> (not res!696217) (not e!592762))))

(assert (=> b!1045650 (= res!696217 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1045652 () Bool)

(declare-fun e!592763 () Bool)

(assert (=> b!1045652 (= e!592763 (= (arrayCountValidKeys!0 (array!65834 (store (arr!31662 (_keys!11687 thiss!1427)) (index!41764 lt!461398) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32199 (_keys!11687 thiss!1427))) #b00000000000000000000000000000000 (size!32199 (_keys!11687 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11687 thiss!1427) #b00000000000000000000000000000000 (size!32199 (_keys!11687 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1045649 () Bool)

(declare-fun res!696216 () Bool)

(assert (=> b!1045649 (=> (not res!696216) (not e!592762))))

(assert (=> b!1045649 (= res!696216 (validKeyInArray!0 (select (arr!31662 (_keys!11687 thiss!1427)) (index!41764 lt!461398))))))

(declare-fun b!1045651 () Bool)

(assert (=> b!1045651 (= e!592762 (bvslt (size!32199 (_keys!11687 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun d!126423 () Bool)

(assert (=> d!126423 e!592763))

(declare-fun res!696215 () Bool)

(assert (=> d!126423 (=> (not res!696215) (not e!592763))))

(assert (=> d!126423 (= res!696215 (and (bvsge (index!41764 lt!461398) #b00000000000000000000000000000000) (bvslt (index!41764 lt!461398) (size!32199 (_keys!11687 thiss!1427)))))))

(declare-fun lt!461607 () Unit!34033)

(declare-fun choose!82 (array!65833 (_ BitVec 32) (_ BitVec 64)) Unit!34033)

(assert (=> d!126423 (= lt!461607 (choose!82 (_keys!11687 thiss!1427) (index!41764 lt!461398) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!126423 e!592762))

(declare-fun res!696218 () Bool)

(assert (=> d!126423 (=> (not res!696218) (not e!592762))))

(assert (=> d!126423 (= res!696218 (and (bvsge (index!41764 lt!461398) #b00000000000000000000000000000000) (bvslt (index!41764 lt!461398) (size!32199 (_keys!11687 thiss!1427)))))))

(assert (=> d!126423 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11687 thiss!1427) (index!41764 lt!461398) #b1000000000000000000000000000000000000000000000000000000000000000) lt!461607)))

(assert (= (and d!126423 res!696218) b!1045649))

(assert (= (and b!1045649 res!696216) b!1045650))

(assert (= (and b!1045650 res!696217) b!1045651))

(assert (= (and d!126423 res!696215) b!1045652))

(declare-fun m!965009 () Bool)

(assert (=> b!1045650 m!965009))

(assert (=> b!1045652 m!964649))

(declare-fun m!965011 () Bool)

(assert (=> b!1045652 m!965011))

(assert (=> b!1045652 m!964653))

(declare-fun m!965013 () Bool)

(assert (=> b!1045649 m!965013))

(assert (=> b!1045649 m!965013))

(declare-fun m!965015 () Bool)

(assert (=> b!1045649 m!965015))

(declare-fun m!965017 () Bool)

(assert (=> d!126423 m!965017))

(assert (=> b!1045389 d!126423))

(declare-fun b!1045665 () Bool)

(declare-fun e!592771 () SeekEntryResult!9848)

(assert (=> b!1045665 (= e!592771 Undefined!9848)))

(declare-fun d!126425 () Bool)

(declare-fun lt!461616 () SeekEntryResult!9848)

(assert (=> d!126425 (and (or ((_ is MissingVacant!9848) lt!461616) (not ((_ is Found!9848) lt!461616)) (and (bvsge (index!41764 lt!461616) #b00000000000000000000000000000000) (bvslt (index!41764 lt!461616) (size!32199 (_keys!11687 thiss!1427))))) (not ((_ is MissingVacant!9848) lt!461616)) (or (not ((_ is Found!9848) lt!461616)) (= (select (arr!31662 (_keys!11687 thiss!1427)) (index!41764 lt!461616)) key!909)))))

(assert (=> d!126425 (= lt!461616 e!592771)))

(declare-fun c!106321 () Bool)

(declare-fun lt!461619 () SeekEntryResult!9848)

(assert (=> d!126425 (= c!106321 (and ((_ is Intermediate!9848) lt!461619) (undefined!10660 lt!461619)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65833 (_ BitVec 32)) SeekEntryResult!9848)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126425 (= lt!461619 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30545 thiss!1427)) key!909 (_keys!11687 thiss!1427) (mask!30545 thiss!1427)))))

(assert (=> d!126425 (validMask!0 (mask!30545 thiss!1427))))

(assert (=> d!126425 (= (seekEntry!0 key!909 (_keys!11687 thiss!1427) (mask!30545 thiss!1427)) lt!461616)))

(declare-fun b!1045666 () Bool)

(declare-fun e!592772 () SeekEntryResult!9848)

(declare-fun lt!461617 () SeekEntryResult!9848)

(assert (=> b!1045666 (= e!592772 (ite ((_ is MissingVacant!9848) lt!461617) (MissingZero!9848 (index!41766 lt!461617)) lt!461617))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65833 (_ BitVec 32)) SeekEntryResult!9848)

(assert (=> b!1045666 (= lt!461617 (seekKeyOrZeroReturnVacant!0 (x!93387 lt!461619) (index!41765 lt!461619) (index!41765 lt!461619) key!909 (_keys!11687 thiss!1427) (mask!30545 thiss!1427)))))

(declare-fun b!1045667 () Bool)

(declare-fun e!592770 () SeekEntryResult!9848)

(assert (=> b!1045667 (= e!592771 e!592770)))

(declare-fun lt!461618 () (_ BitVec 64))

(assert (=> b!1045667 (= lt!461618 (select (arr!31662 (_keys!11687 thiss!1427)) (index!41765 lt!461619)))))

(declare-fun c!106323 () Bool)

(assert (=> b!1045667 (= c!106323 (= lt!461618 key!909))))

(declare-fun b!1045668 () Bool)

(assert (=> b!1045668 (= e!592772 (MissingZero!9848 (index!41765 lt!461619)))))

(declare-fun b!1045669 () Bool)

(assert (=> b!1045669 (= e!592770 (Found!9848 (index!41765 lt!461619)))))

(declare-fun b!1045670 () Bool)

(declare-fun c!106322 () Bool)

(assert (=> b!1045670 (= c!106322 (= lt!461618 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1045670 (= e!592770 e!592772)))

(assert (= (and d!126425 c!106321) b!1045665))

(assert (= (and d!126425 (not c!106321)) b!1045667))

(assert (= (and b!1045667 c!106323) b!1045669))

(assert (= (and b!1045667 (not c!106323)) b!1045670))

(assert (= (and b!1045670 c!106322) b!1045668))

(assert (= (and b!1045670 (not c!106322)) b!1045666))

(declare-fun m!965019 () Bool)

(assert (=> d!126425 m!965019))

(declare-fun m!965021 () Bool)

(assert (=> d!126425 m!965021))

(assert (=> d!126425 m!965021))

(declare-fun m!965023 () Bool)

(assert (=> d!126425 m!965023))

(assert (=> d!126425 m!964793))

(declare-fun m!965025 () Bool)

(assert (=> b!1045666 m!965025))

(declare-fun m!965027 () Bool)

(assert (=> b!1045667 m!965027))

(assert (=> b!1045390 d!126425))

(declare-fun d!126427 () Bool)

(assert (=> d!126427 (= (array_inv!24467 (_keys!11687 thiss!1427)) (bvsge (size!32199 (_keys!11687 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1045392 d!126427))

(declare-fun d!126429 () Bool)

(assert (=> d!126429 (= (array_inv!24468 (_values!6442 thiss!1427)) (bvsge (size!32200 (_values!6442 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1045392 d!126429))

(declare-fun d!126431 () Bool)

(assert (=> d!126431 (= (validMask!0 (mask!30545 (_2!7941 lt!461394))) (and (or (= (mask!30545 (_2!7941 lt!461394)) #b00000000000000000000000000000111) (= (mask!30545 (_2!7941 lt!461394)) #b00000000000000000000000000001111) (= (mask!30545 (_2!7941 lt!461394)) #b00000000000000000000000000011111) (= (mask!30545 (_2!7941 lt!461394)) #b00000000000000000000000000111111) (= (mask!30545 (_2!7941 lt!461394)) #b00000000000000000000000001111111) (= (mask!30545 (_2!7941 lt!461394)) #b00000000000000000000000011111111) (= (mask!30545 (_2!7941 lt!461394)) #b00000000000000000000000111111111) (= (mask!30545 (_2!7941 lt!461394)) #b00000000000000000000001111111111) (= (mask!30545 (_2!7941 lt!461394)) #b00000000000000000000011111111111) (= (mask!30545 (_2!7941 lt!461394)) #b00000000000000000000111111111111) (= (mask!30545 (_2!7941 lt!461394)) #b00000000000000000001111111111111) (= (mask!30545 (_2!7941 lt!461394)) #b00000000000000000011111111111111) (= (mask!30545 (_2!7941 lt!461394)) #b00000000000000000111111111111111) (= (mask!30545 (_2!7941 lt!461394)) #b00000000000000001111111111111111) (= (mask!30545 (_2!7941 lt!461394)) #b00000000000000011111111111111111) (= (mask!30545 (_2!7941 lt!461394)) #b00000000000000111111111111111111) (= (mask!30545 (_2!7941 lt!461394)) #b00000000000001111111111111111111) (= (mask!30545 (_2!7941 lt!461394)) #b00000000000011111111111111111111) (= (mask!30545 (_2!7941 lt!461394)) #b00000000000111111111111111111111) (= (mask!30545 (_2!7941 lt!461394)) #b00000000001111111111111111111111) (= (mask!30545 (_2!7941 lt!461394)) #b00000000011111111111111111111111) (= (mask!30545 (_2!7941 lt!461394)) #b00000000111111111111111111111111) (= (mask!30545 (_2!7941 lt!461394)) #b00000001111111111111111111111111) (= (mask!30545 (_2!7941 lt!461394)) #b00000011111111111111111111111111) (= (mask!30545 (_2!7941 lt!461394)) #b00000111111111111111111111111111) (= (mask!30545 (_2!7941 lt!461394)) #b00001111111111111111111111111111) (= (mask!30545 (_2!7941 lt!461394)) #b00011111111111111111111111111111) (= (mask!30545 (_2!7941 lt!461394)) #b00111111111111111111111111111111)) (bvsle (mask!30545 (_2!7941 lt!461394)) #b00111111111111111111111111111111)))))

(assert (=> b!1045395 d!126431))

(declare-fun b!1045677 () Bool)

(declare-fun e!592777 () Bool)

(assert (=> b!1045677 (= e!592777 tp_is_empty!24859)))

(declare-fun condMapEmpty!38939 () Bool)

(declare-fun mapDefault!38939 () ValueCell!11726)

(assert (=> mapNonEmpty!38930 (= condMapEmpty!38939 (= mapRest!38930 ((as const (Array (_ BitVec 32) ValueCell!11726)) mapDefault!38939)))))

(declare-fun e!592778 () Bool)

(declare-fun mapRes!38939 () Bool)

(assert (=> mapNonEmpty!38930 (= tp!74676 (and e!592778 mapRes!38939))))

(declare-fun mapNonEmpty!38939 () Bool)

(declare-fun tp!74691 () Bool)

(assert (=> mapNonEmpty!38939 (= mapRes!38939 (and tp!74691 e!592777))))

(declare-fun mapKey!38939 () (_ BitVec 32))

(declare-fun mapRest!38939 () (Array (_ BitVec 32) ValueCell!11726))

(declare-fun mapValue!38939 () ValueCell!11726)

(assert (=> mapNonEmpty!38939 (= mapRest!38930 (store mapRest!38939 mapKey!38939 mapValue!38939))))

(declare-fun mapIsEmpty!38939 () Bool)

(assert (=> mapIsEmpty!38939 mapRes!38939))

(declare-fun b!1045678 () Bool)

(assert (=> b!1045678 (= e!592778 tp_is_empty!24859)))

(assert (= (and mapNonEmpty!38930 condMapEmpty!38939) mapIsEmpty!38939))

(assert (= (and mapNonEmpty!38930 (not condMapEmpty!38939)) mapNonEmpty!38939))

(assert (= (and mapNonEmpty!38939 ((_ is ValueCellFull!11726) mapValue!38939)) b!1045677))

(assert (= (and mapNonEmpty!38930 ((_ is ValueCellFull!11726) mapDefault!38939)) b!1045678))

(declare-fun m!965029 () Bool)

(assert (=> mapNonEmpty!38939 m!965029))

(declare-fun b_lambda!16301 () Bool)

(assert (= b_lambda!16295 (or (and b!1045392 b_free!21139) b_lambda!16301)))

(declare-fun b_lambda!16303 () Bool)

(assert (= b_lambda!16297 (or (and b!1045392 b_free!21139) b_lambda!16303)))

(declare-fun b_lambda!16305 () Bool)

(assert (= b_lambda!16293 (or (and b!1045392 b_free!21139) b_lambda!16305)))

(check-sat (not bm!44534) (not b!1045626) (not b!1045650) (not d!126395) (not bm!44536) (not b!1045632) (not b!1045555) (not b!1045619) (not bm!44531) (not bm!44526) (not bm!44525) (not b!1045479) (not b!1045594) (not b!1045649) (not b!1045543) (not bm!44537) (not mapNonEmpty!38939) (not d!126405) (not bm!44541) (not b!1045544) (not b!1045492) (not b!1045568) (not b!1045578) (not b_lambda!16299) (not b!1045587) (not b!1045623) (not b!1045580) (not d!126407) (not b!1045615) (not b!1045577) (not b_lambda!16303) (not d!126411) (not b!1045494) (not b_lambda!16305) (not b!1045652) (not d!126419) (not bm!44519) (not bm!44542) tp_is_empty!24859 (not d!126401) (not b!1045463) (not b!1045541) (not b!1045570) (not b!1045545) (not b!1045554) (not b!1045468) (not b!1045581) (not b!1045609) (not b!1045637) (not b!1045622) (not d!126415) (not b!1045603) (not d!126403) (not b!1045561) (not b!1045574) (not b_next!21139) (not b!1045576) (not bm!44535) (not bm!44520) (not b_lambda!16291) (not d!126425) (not b!1045666) (not b!1045625) (not b!1045493) (not bm!44503) (not bm!44527) (not b!1045621) (not d!126423) b_and!33757 (not d!126409) (not b!1045588) (not bm!44524) (not b!1045548) (not b!1045477) (not bm!44500) (not d!126393) (not bm!44518) (not b!1045547) (not b!1045633) (not b!1045464) (not b!1045465) (not b_lambda!16301))
(check-sat b_and!33757 (not b_next!21139))
