; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89422 () Bool)

(assert start!89422)

(declare-fun b!1025330 () Bool)

(declare-fun b_free!20421 () Bool)

(declare-fun b_next!20421 () Bool)

(assert (=> b!1025330 (= b_free!20421 (not b_next!20421))))

(declare-fun tp!72308 () Bool)

(declare-fun b_and!32667 () Bool)

(assert (=> b!1025330 (= tp!72308 b_and!32667)))

(declare-fun b!1025320 () Bool)

(declare-fun e!578105 () Bool)

(declare-fun e!578110 () Bool)

(declare-fun mapRes!37640 () Bool)

(assert (=> b!1025320 (= e!578105 (and e!578110 mapRes!37640))))

(declare-fun condMapEmpty!37640 () Bool)

(declare-datatypes ((V!37061 0))(
  ( (V!37062 (val!12121 Int)) )
))
(declare-datatypes ((ValueCell!11367 0))(
  ( (ValueCellFull!11367 (v!14690 V!37061)) (EmptyCell!11367) )
))
(declare-datatypes ((array!64332 0))(
  ( (array!64333 (arr!30975 (Array (_ BitVec 32) (_ BitVec 64))) (size!31488 (_ BitVec 32))) )
))
(declare-datatypes ((array!64334 0))(
  ( (array!64335 (arr!30976 (Array (_ BitVec 32) ValueCell!11367)) (size!31489 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5328 0))(
  ( (LongMapFixedSize!5329 (defaultEntry!6016 Int) (mask!29684 (_ BitVec 32)) (extraKeys!5748 (_ BitVec 32)) (zeroValue!5852 V!37061) (minValue!5852 V!37061) (_size!2719 (_ BitVec 32)) (_keys!11163 array!64332) (_values!6039 array!64334) (_vacant!2719 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5328)

(declare-fun mapDefault!37640 () ValueCell!11367)

(assert (=> b!1025320 (= condMapEmpty!37640 (= (arr!30976 (_values!6039 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11367)) mapDefault!37640)))))

(declare-fun res!686460 () Bool)

(declare-fun e!578106 () Bool)

(assert (=> start!89422 (=> (not res!686460) (not e!578106))))

(declare-fun valid!2025 (LongMapFixedSize!5328) Bool)

(assert (=> start!89422 (= res!686460 (valid!2025 thiss!1427))))

(assert (=> start!89422 e!578106))

(declare-fun e!578107 () Bool)

(assert (=> start!89422 e!578107))

(assert (=> start!89422 true))

(declare-fun b!1025321 () Bool)

(declare-fun tp_is_empty!24141 () Bool)

(assert (=> b!1025321 (= e!578110 tp_is_empty!24141)))

(declare-fun b!1025322 () Bool)

(declare-fun res!686458 () Bool)

(declare-fun e!578103 () Bool)

(assert (=> b!1025322 (=> res!686458 e!578103)))

(declare-datatypes ((List!21750 0))(
  ( (Nil!21747) (Cons!21746 (h!22944 (_ BitVec 64)) (t!30812 List!21750)) )
))
(declare-fun arrayNoDuplicates!0 (array!64332 (_ BitVec 32) List!21750) Bool)

(assert (=> b!1025322 (= res!686458 (not (arrayNoDuplicates!0 (_keys!11163 thiss!1427) #b00000000000000000000000000000000 Nil!21747)))))

(declare-fun mapNonEmpty!37640 () Bool)

(declare-fun tp!72309 () Bool)

(declare-fun e!578109 () Bool)

(assert (=> mapNonEmpty!37640 (= mapRes!37640 (and tp!72309 e!578109))))

(declare-fun mapRest!37640 () (Array (_ BitVec 32) ValueCell!11367))

(declare-fun mapValue!37640 () ValueCell!11367)

(declare-fun mapKey!37640 () (_ BitVec 32))

(assert (=> mapNonEmpty!37640 (= (arr!30976 (_values!6039 thiss!1427)) (store mapRest!37640 mapKey!37640 mapValue!37640))))

(declare-fun mapIsEmpty!37640 () Bool)

(assert (=> mapIsEmpty!37640 mapRes!37640))

(declare-fun b!1025323 () Bool)

(declare-fun e!578104 () Bool)

(assert (=> b!1025323 (= e!578106 e!578104)))

(declare-fun res!686462 () Bool)

(assert (=> b!1025323 (=> (not res!686462) (not e!578104))))

(declare-datatypes ((SeekEntryResult!9615 0))(
  ( (MissingZero!9615 (index!40831 (_ BitVec 32))) (Found!9615 (index!40832 (_ BitVec 32))) (Intermediate!9615 (undefined!10427 Bool) (index!40833 (_ BitVec 32)) (x!91173 (_ BitVec 32))) (Undefined!9615) (MissingVacant!9615 (index!40834 (_ BitVec 32))) )
))
(declare-fun lt!450884 () SeekEntryResult!9615)

(get-info :version)

(assert (=> b!1025323 (= res!686462 ((_ is Found!9615) lt!450884))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64332 (_ BitVec 32)) SeekEntryResult!9615)

(assert (=> b!1025323 (= lt!450884 (seekEntry!0 key!909 (_keys!11163 thiss!1427) (mask!29684 thiss!1427)))))

(declare-fun b!1025324 () Bool)

(assert (=> b!1025324 (= e!578109 tp_is_empty!24141)))

(declare-fun b!1025325 () Bool)

(assert (=> b!1025325 (= e!578104 (not e!578103))))

(declare-fun res!686456 () Bool)

(assert (=> b!1025325 (=> res!686456 e!578103)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1025325 (= res!686456 (not (validMask!0 (mask!29684 thiss!1427))))))

(declare-fun lt!450885 () array!64332)

(assert (=> b!1025325 (arrayNoDuplicates!0 lt!450885 #b00000000000000000000000000000000 Nil!21747)))

(declare-datatypes ((Unit!33385 0))(
  ( (Unit!33386) )
))
(declare-fun lt!450888 () Unit!33385)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64332 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21750) Unit!33385)

(assert (=> b!1025325 (= lt!450888 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11163 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40832 lt!450884) #b00000000000000000000000000000000 Nil!21747))))

(declare-fun arrayCountValidKeys!0 (array!64332 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025325 (= (arrayCountValidKeys!0 lt!450885 #b00000000000000000000000000000000 (size!31488 (_keys!11163 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11163 thiss!1427) #b00000000000000000000000000000000 (size!31488 (_keys!11163 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1025325 (= lt!450885 (array!64333 (store (arr!30975 (_keys!11163 thiss!1427)) (index!40832 lt!450884) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31488 (_keys!11163 thiss!1427))))))

(declare-fun lt!450886 () Unit!33385)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64332 (_ BitVec 32) (_ BitVec 64)) Unit!33385)

(assert (=> b!1025325 (= lt!450886 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11163 thiss!1427) (index!40832 lt!450884) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1025326 () Bool)

(declare-fun res!686459 () Bool)

(assert (=> b!1025326 (=> res!686459 e!578103)))

(assert (=> b!1025326 (= res!686459 (or (not (= (size!31488 (_keys!11163 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29684 thiss!1427)))) (bvslt (index!40832 lt!450884) #b00000000000000000000000000000000) (bvsge (index!40832 lt!450884) (size!31488 (_keys!11163 thiss!1427)))))))

(declare-fun b!1025327 () Bool)

(declare-fun res!686457 () Bool)

(assert (=> b!1025327 (=> res!686457 e!578103)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1025327 (= res!686457 (not (validKeyInArray!0 (select (arr!30975 (_keys!11163 thiss!1427)) (index!40832 lt!450884)))))))

(declare-fun b!1025328 () Bool)

(declare-fun res!686461 () Bool)

(assert (=> b!1025328 (=> (not res!686461) (not e!578106))))

(assert (=> b!1025328 (= res!686461 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1025329 () Bool)

(assert (=> b!1025329 (= e!578103 true)))

(declare-fun lt!450887 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64332 (_ BitVec 32)) Bool)

(assert (=> b!1025329 (= lt!450887 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11163 thiss!1427) (mask!29684 thiss!1427)))))

(declare-fun array_inv!23989 (array!64332) Bool)

(declare-fun array_inv!23990 (array!64334) Bool)

(assert (=> b!1025330 (= e!578107 (and tp!72308 tp_is_empty!24141 (array_inv!23989 (_keys!11163 thiss!1427)) (array_inv!23990 (_values!6039 thiss!1427)) e!578105))))

(assert (= (and start!89422 res!686460) b!1025328))

(assert (= (and b!1025328 res!686461) b!1025323))

(assert (= (and b!1025323 res!686462) b!1025325))

(assert (= (and b!1025325 (not res!686456)) b!1025326))

(assert (= (and b!1025326 (not res!686459)) b!1025327))

(assert (= (and b!1025327 (not res!686457)) b!1025322))

(assert (= (and b!1025322 (not res!686458)) b!1025329))

(assert (= (and b!1025320 condMapEmpty!37640) mapIsEmpty!37640))

(assert (= (and b!1025320 (not condMapEmpty!37640)) mapNonEmpty!37640))

(assert (= (and mapNonEmpty!37640 ((_ is ValueCellFull!11367) mapValue!37640)) b!1025324))

(assert (= (and b!1025320 ((_ is ValueCellFull!11367) mapDefault!37640)) b!1025321))

(assert (= b!1025330 b!1025320))

(assert (= start!89422 b!1025330))

(declare-fun m!943503 () Bool)

(assert (=> b!1025329 m!943503))

(declare-fun m!943505 () Bool)

(assert (=> b!1025330 m!943505))

(declare-fun m!943507 () Bool)

(assert (=> b!1025330 m!943507))

(declare-fun m!943509 () Bool)

(assert (=> b!1025322 m!943509))

(declare-fun m!943511 () Bool)

(assert (=> b!1025323 m!943511))

(declare-fun m!943513 () Bool)

(assert (=> b!1025327 m!943513))

(assert (=> b!1025327 m!943513))

(declare-fun m!943515 () Bool)

(assert (=> b!1025327 m!943515))

(declare-fun m!943517 () Bool)

(assert (=> b!1025325 m!943517))

(declare-fun m!943519 () Bool)

(assert (=> b!1025325 m!943519))

(declare-fun m!943521 () Bool)

(assert (=> b!1025325 m!943521))

(declare-fun m!943523 () Bool)

(assert (=> b!1025325 m!943523))

(declare-fun m!943525 () Bool)

(assert (=> b!1025325 m!943525))

(declare-fun m!943527 () Bool)

(assert (=> b!1025325 m!943527))

(declare-fun m!943529 () Bool)

(assert (=> b!1025325 m!943529))

(declare-fun m!943531 () Bool)

(assert (=> mapNonEmpty!37640 m!943531))

(declare-fun m!943533 () Bool)

(assert (=> start!89422 m!943533))

(check-sat (not start!89422) (not b!1025323) (not b_next!20421) b_and!32667 (not mapNonEmpty!37640) tp_is_empty!24141 (not b!1025329) (not b!1025325) (not b!1025322) (not b!1025327) (not b!1025330))
(check-sat b_and!32667 (not b_next!20421))
