; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25188 () Bool)

(assert start!25188)

(declare-fun b!262469 () Bool)

(declare-fun b_free!6787 () Bool)

(declare-fun b_next!6787 () Bool)

(assert (=> b!262469 (= b_free!6787 (not b_next!6787))))

(declare-fun tp!23695 () Bool)

(declare-fun b_and!13939 () Bool)

(assert (=> b!262469 (= tp!23695 b_and!13939)))

(declare-fun res!128196 () Bool)

(declare-fun e!170075 () Bool)

(assert (=> start!25188 (=> (not res!128196) (not e!170075))))

(declare-datatypes ((V!8513 0))(
  ( (V!8514 (val!3369 Int)) )
))
(declare-datatypes ((ValueCell!2981 0))(
  ( (ValueCellFull!2981 (v!5498 V!8513)) (EmptyCell!2981) )
))
(declare-datatypes ((array!12655 0))(
  ( (array!12656 (arr!5989 (Array (_ BitVec 32) ValueCell!2981)) (size!6340 (_ BitVec 32))) )
))
(declare-datatypes ((array!12657 0))(
  ( (array!12658 (arr!5990 (Array (_ BitVec 32) (_ BitVec 64))) (size!6341 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3862 0))(
  ( (LongMapFixedSize!3863 (defaultEntry!4834 Int) (mask!11193 (_ BitVec 32)) (extraKeys!4571 (_ BitVec 32)) (zeroValue!4675 V!8513) (minValue!4675 V!8513) (_size!1980 (_ BitVec 32)) (_keys!7024 array!12657) (_values!4817 array!12655) (_vacant!1980 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3862)

(declare-fun valid!1511 (LongMapFixedSize!3862) Bool)

(assert (=> start!25188 (= res!128196 (valid!1511 thiss!1504))))

(assert (=> start!25188 e!170075))

(declare-fun e!170086 () Bool)

(assert (=> start!25188 e!170086))

(assert (=> start!25188 true))

(declare-fun tp_is_empty!6649 () Bool)

(assert (=> start!25188 tp_is_empty!6649))

(declare-fun bm!25063 () Bool)

(declare-fun call!25066 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12657 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!25063 (= call!25066 (arrayContainsKey!0 (_keys!7024 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!262452 () Bool)

(declare-datatypes ((Unit!8147 0))(
  ( (Unit!8148) )
))
(declare-fun e!170084 () Unit!8147)

(declare-fun Unit!8149 () Unit!8147)

(assert (=> b!262452 (= e!170084 Unit!8149)))

(declare-fun lt!132697 () Unit!8147)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!448 (array!12657 array!12655 (_ BitVec 32) (_ BitVec 32) V!8513 V!8513 (_ BitVec 64) Int) Unit!8147)

(assert (=> b!262452 (= lt!132697 (lemmaInListMapThenSeekEntryOrOpenFindsIt!448 (_keys!7024 thiss!1504) (_values!4817 thiss!1504) (mask!11193 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) key!932 (defaultEntry!4834 thiss!1504)))))

(assert (=> b!262452 false))

(declare-fun b!262453 () Bool)

(declare-fun e!170073 () Bool)

(declare-fun e!170081 () Bool)

(declare-fun mapRes!11335 () Bool)

(assert (=> b!262453 (= e!170073 (and e!170081 mapRes!11335))))

(declare-fun condMapEmpty!11335 () Bool)

(declare-fun mapDefault!11335 () ValueCell!2981)

(assert (=> b!262453 (= condMapEmpty!11335 (= (arr!5989 (_values!4817 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2981)) mapDefault!11335)))))

(declare-fun b!262454 () Bool)

(declare-fun e!170083 () Bool)

(declare-fun e!170078 () Bool)

(assert (=> b!262454 (= e!170083 (not e!170078))))

(declare-fun res!128192 () Bool)

(assert (=> b!262454 (=> res!128192 e!170078)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!262454 (= res!128192 (not (validMask!0 (mask!11193 thiss!1504))))))

(declare-fun lt!132702 () array!12657)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!12657 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!262454 (= (arrayCountValidKeys!0 lt!132702 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!132698 () Unit!8147)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12657 (_ BitVec 32)) Unit!8147)

(assert (=> b!262454 (= lt!132698 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!132702 index!297))))

(assert (=> b!262454 (arrayContainsKey!0 lt!132702 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!132695 () Unit!8147)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12657 (_ BitVec 64) (_ BitVec 32)) Unit!8147)

(assert (=> b!262454 (= lt!132695 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!132702 key!932 index!297))))

(declare-datatypes ((tuple2!4880 0))(
  ( (tuple2!4881 (_1!2451 (_ BitVec 64)) (_2!2451 V!8513)) )
))
(declare-datatypes ((List!3757 0))(
  ( (Nil!3754) (Cons!3753 (h!4419 tuple2!4880) (t!8824 List!3757)) )
))
(declare-datatypes ((ListLongMap!3795 0))(
  ( (ListLongMap!3796 (toList!1913 List!3757)) )
))
(declare-fun lt!132703 () ListLongMap!3795)

(declare-fun v!346 () V!8513)

(declare-fun +!709 (ListLongMap!3795 tuple2!4880) ListLongMap!3795)

(declare-fun getCurrentListMap!1445 (array!12657 array!12655 (_ BitVec 32) (_ BitVec 32) V!8513 V!8513 (_ BitVec 32) Int) ListLongMap!3795)

(assert (=> b!262454 (= (+!709 lt!132703 (tuple2!4881 key!932 v!346)) (getCurrentListMap!1445 lt!132702 (array!12656 (store (arr!5989 (_values!4817 thiss!1504)) index!297 (ValueCellFull!2981 v!346)) (size!6340 (_values!4817 thiss!1504))) (mask!11193 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4834 thiss!1504)))))

(declare-fun lt!132700 () Unit!8147)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!124 (array!12657 array!12655 (_ BitVec 32) (_ BitVec 32) V!8513 V!8513 (_ BitVec 32) (_ BitVec 64) V!8513 Int) Unit!8147)

(assert (=> b!262454 (= lt!132700 (lemmaAddValidKeyToArrayThenAddPairToListMap!124 (_keys!7024 thiss!1504) (_values!4817 thiss!1504) (mask!11193 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) index!297 key!932 v!346 (defaultEntry!4834 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12657 (_ BitVec 32)) Bool)

(assert (=> b!262454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!132702 (mask!11193 thiss!1504))))

(declare-fun lt!132694 () Unit!8147)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12657 (_ BitVec 32) (_ BitVec 32)) Unit!8147)

(assert (=> b!262454 (= lt!132694 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!7024 thiss!1504) index!297 (mask!11193 thiss!1504)))))

(assert (=> b!262454 (= (arrayCountValidKeys!0 lt!132702 #b00000000000000000000000000000000 (size!6341 (_keys!7024 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!7024 thiss!1504) #b00000000000000000000000000000000 (size!6341 (_keys!7024 thiss!1504)))))))

(declare-fun lt!132696 () Unit!8147)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12657 (_ BitVec 32) (_ BitVec 64)) Unit!8147)

(assert (=> b!262454 (= lt!132696 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!7024 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3758 0))(
  ( (Nil!3755) (Cons!3754 (h!4420 (_ BitVec 64)) (t!8825 List!3758)) )
))
(declare-fun arrayNoDuplicates!0 (array!12657 (_ BitVec 32) List!3758) Bool)

(assert (=> b!262454 (arrayNoDuplicates!0 lt!132702 #b00000000000000000000000000000000 Nil!3755)))

(assert (=> b!262454 (= lt!132702 (array!12658 (store (arr!5990 (_keys!7024 thiss!1504)) index!297 key!932) (size!6341 (_keys!7024 thiss!1504))))))

(declare-fun lt!132706 () Unit!8147)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12657 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3758) Unit!8147)

(assert (=> b!262454 (= lt!132706 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!7024 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3755))))

(declare-fun lt!132707 () Unit!8147)

(declare-fun e!170082 () Unit!8147)

(assert (=> b!262454 (= lt!132707 e!170082)))

(declare-fun c!44730 () Bool)

(assert (=> b!262454 (= c!44730 (arrayContainsKey!0 (_keys!7024 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!262455 () Bool)

(declare-fun e!170072 () Bool)

(assert (=> b!262455 (= e!170072 (not call!25066))))

(declare-fun b!262456 () Bool)

(declare-fun e!170074 () Bool)

(assert (=> b!262456 (= e!170074 e!170072)))

(declare-fun res!128193 () Bool)

(declare-fun call!25067 () Bool)

(assert (=> b!262456 (= res!128193 call!25067)))

(assert (=> b!262456 (=> (not res!128193) (not e!170072))))

(declare-fun b!262457 () Bool)

(declare-fun res!128191 () Bool)

(assert (=> b!262457 (=> res!128191 e!170078)))

(assert (=> b!262457 (= res!128191 (or (not (= (size!6340 (_values!4817 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!11193 thiss!1504)))) (not (= (size!6341 (_keys!7024 thiss!1504)) (size!6340 (_values!4817 thiss!1504)))) (bvslt (mask!11193 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4571 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4571 thiss!1504) #b00000000000000000000000000000011) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6341 (_keys!7024 thiss!1504)))))))

(declare-fun b!262458 () Bool)

(declare-fun e!170085 () Bool)

(assert (=> b!262458 (= e!170085 tp_is_empty!6649)))

(declare-fun b!262459 () Bool)

(declare-fun res!128195 () Bool)

(declare-datatypes ((SeekEntryResult!1161 0))(
  ( (MissingZero!1161 (index!6814 (_ BitVec 32))) (Found!1161 (index!6815 (_ BitVec 32))) (Intermediate!1161 (undefined!1973 Bool) (index!6816 (_ BitVec 32)) (x!25185 (_ BitVec 32))) (Undefined!1161) (MissingVacant!1161 (index!6817 (_ BitVec 32))) )
))
(declare-fun lt!132704 () SeekEntryResult!1161)

(assert (=> b!262459 (= res!128195 (= (select (arr!5990 (_keys!7024 thiss!1504)) (index!6817 lt!132704)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!262459 (=> (not res!128195) (not e!170072))))

(declare-fun b!262460 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!262460 (= e!170078 (validKeyInArray!0 key!932))))

(declare-fun b!262461 () Bool)

(declare-fun res!128199 () Bool)

(assert (=> b!262461 (=> (not res!128199) (not e!170075))))

(assert (=> b!262461 (= res!128199 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!262462 () Bool)

(declare-fun c!44729 () Bool)

(get-info :version)

(assert (=> b!262462 (= c!44729 ((_ is MissingVacant!1161) lt!132704))))

(declare-fun e!170077 () Bool)

(assert (=> b!262462 (= e!170077 e!170074)))

(declare-fun b!262463 () Bool)

(declare-fun e!170076 () Bool)

(assert (=> b!262463 (= e!170075 e!170076)))

(declare-fun res!128194 () Bool)

(assert (=> b!262463 (=> (not res!128194) (not e!170076))))

(assert (=> b!262463 (= res!128194 (or (= lt!132704 (MissingZero!1161 index!297)) (= lt!132704 (MissingVacant!1161 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12657 (_ BitVec 32)) SeekEntryResult!1161)

(assert (=> b!262463 (= lt!132704 (seekEntryOrOpen!0 key!932 (_keys!7024 thiss!1504) (mask!11193 thiss!1504)))))

(declare-fun b!262464 () Bool)

(assert (=> b!262464 (= e!170076 e!170083)))

(declare-fun res!128190 () Bool)

(assert (=> b!262464 (=> (not res!128190) (not e!170083))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262464 (= res!128190 (inRange!0 index!297 (mask!11193 thiss!1504)))))

(declare-fun lt!132701 () Unit!8147)

(assert (=> b!262464 (= lt!132701 e!170084)))

(declare-fun c!44728 () Bool)

(declare-fun contains!1881 (ListLongMap!3795 (_ BitVec 64)) Bool)

(assert (=> b!262464 (= c!44728 (contains!1881 lt!132703 key!932))))

(assert (=> b!262464 (= lt!132703 (getCurrentListMap!1445 (_keys!7024 thiss!1504) (_values!4817 thiss!1504) (mask!11193 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4834 thiss!1504)))))

(declare-fun b!262465 () Bool)

(declare-fun Unit!8150 () Unit!8147)

(assert (=> b!262465 (= e!170082 Unit!8150)))

(declare-fun lt!132705 () Unit!8147)

(declare-fun lemmaArrayContainsKeyThenInListMap!267 (array!12657 array!12655 (_ BitVec 32) (_ BitVec 32) V!8513 V!8513 (_ BitVec 64) (_ BitVec 32) Int) Unit!8147)

(assert (=> b!262465 (= lt!132705 (lemmaArrayContainsKeyThenInListMap!267 (_keys!7024 thiss!1504) (_values!4817 thiss!1504) (mask!11193 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4834 thiss!1504)))))

(assert (=> b!262465 false))

(declare-fun b!262466 () Bool)

(declare-fun res!128198 () Bool)

(declare-fun e!170079 () Bool)

(assert (=> b!262466 (=> (not res!128198) (not e!170079))))

(assert (=> b!262466 (= res!128198 call!25067)))

(assert (=> b!262466 (= e!170077 e!170079)))

(declare-fun b!262467 () Bool)

(declare-fun res!128197 () Bool)

(assert (=> b!262467 (=> (not res!128197) (not e!170079))))

(assert (=> b!262467 (= res!128197 (= (select (arr!5990 (_keys!7024 thiss!1504)) (index!6814 lt!132704)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!11335 () Bool)

(declare-fun tp!23694 () Bool)

(assert (=> mapNonEmpty!11335 (= mapRes!11335 (and tp!23694 e!170085))))

(declare-fun mapValue!11335 () ValueCell!2981)

(declare-fun mapKey!11335 () (_ BitVec 32))

(declare-fun mapRest!11335 () (Array (_ BitVec 32) ValueCell!2981))

(assert (=> mapNonEmpty!11335 (= (arr!5989 (_values!4817 thiss!1504)) (store mapRest!11335 mapKey!11335 mapValue!11335))))

(declare-fun b!262468 () Bool)

(declare-fun Unit!8151 () Unit!8147)

(assert (=> b!262468 (= e!170082 Unit!8151)))

(declare-fun array_inv!3941 (array!12657) Bool)

(declare-fun array_inv!3942 (array!12655) Bool)

(assert (=> b!262469 (= e!170086 (and tp!23695 tp_is_empty!6649 (array_inv!3941 (_keys!7024 thiss!1504)) (array_inv!3942 (_values!4817 thiss!1504)) e!170073))))

(declare-fun b!262470 () Bool)

(declare-fun lt!132699 () Unit!8147)

(assert (=> b!262470 (= e!170084 lt!132699)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!439 (array!12657 array!12655 (_ BitVec 32) (_ BitVec 32) V!8513 V!8513 (_ BitVec 64) Int) Unit!8147)

(assert (=> b!262470 (= lt!132699 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!439 (_keys!7024 thiss!1504) (_values!4817 thiss!1504) (mask!11193 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) key!932 (defaultEntry!4834 thiss!1504)))))

(declare-fun c!44731 () Bool)

(assert (=> b!262470 (= c!44731 ((_ is MissingZero!1161) lt!132704))))

(assert (=> b!262470 e!170077))

(declare-fun b!262471 () Bool)

(assert (=> b!262471 (= e!170079 (not call!25066))))

(declare-fun mapIsEmpty!11335 () Bool)

(assert (=> mapIsEmpty!11335 mapRes!11335))

(declare-fun b!262472 () Bool)

(assert (=> b!262472 (= e!170081 tp_is_empty!6649)))

(declare-fun b!262473 () Bool)

(assert (=> b!262473 (= e!170074 ((_ is Undefined!1161) lt!132704))))

(declare-fun bm!25064 () Bool)

(assert (=> bm!25064 (= call!25067 (inRange!0 (ite c!44731 (index!6814 lt!132704) (index!6817 lt!132704)) (mask!11193 thiss!1504)))))

(assert (= (and start!25188 res!128196) b!262461))

(assert (= (and b!262461 res!128199) b!262463))

(assert (= (and b!262463 res!128194) b!262464))

(assert (= (and b!262464 c!44728) b!262452))

(assert (= (and b!262464 (not c!44728)) b!262470))

(assert (= (and b!262470 c!44731) b!262466))

(assert (= (and b!262470 (not c!44731)) b!262462))

(assert (= (and b!262466 res!128198) b!262467))

(assert (= (and b!262467 res!128197) b!262471))

(assert (= (and b!262462 c!44729) b!262456))

(assert (= (and b!262462 (not c!44729)) b!262473))

(assert (= (and b!262456 res!128193) b!262459))

(assert (= (and b!262459 res!128195) b!262455))

(assert (= (or b!262466 b!262456) bm!25064))

(assert (= (or b!262471 b!262455) bm!25063))

(assert (= (and b!262464 res!128190) b!262454))

(assert (= (and b!262454 c!44730) b!262465))

(assert (= (and b!262454 (not c!44730)) b!262468))

(assert (= (and b!262454 (not res!128192)) b!262457))

(assert (= (and b!262457 (not res!128191)) b!262460))

(assert (= (and b!262453 condMapEmpty!11335) mapIsEmpty!11335))

(assert (= (and b!262453 (not condMapEmpty!11335)) mapNonEmpty!11335))

(assert (= (and mapNonEmpty!11335 ((_ is ValueCellFull!2981) mapValue!11335)) b!262458))

(assert (= (and b!262453 ((_ is ValueCellFull!2981) mapDefault!11335)) b!262472))

(assert (= b!262469 b!262453))

(assert (= start!25188 b!262469))

(declare-fun m!278661 () Bool)

(assert (=> bm!25064 m!278661))

(declare-fun m!278663 () Bool)

(assert (=> start!25188 m!278663))

(declare-fun m!278665 () Bool)

(assert (=> b!262465 m!278665))

(declare-fun m!278667 () Bool)

(assert (=> bm!25063 m!278667))

(declare-fun m!278669 () Bool)

(assert (=> b!262467 m!278669))

(declare-fun m!278671 () Bool)

(assert (=> mapNonEmpty!11335 m!278671))

(declare-fun m!278673 () Bool)

(assert (=> b!262470 m!278673))

(declare-fun m!278675 () Bool)

(assert (=> b!262452 m!278675))

(declare-fun m!278677 () Bool)

(assert (=> b!262463 m!278677))

(declare-fun m!278679 () Bool)

(assert (=> b!262464 m!278679))

(declare-fun m!278681 () Bool)

(assert (=> b!262464 m!278681))

(declare-fun m!278683 () Bool)

(assert (=> b!262464 m!278683))

(declare-fun m!278685 () Bool)

(assert (=> b!262454 m!278685))

(assert (=> b!262454 m!278667))

(declare-fun m!278687 () Bool)

(assert (=> b!262454 m!278687))

(declare-fun m!278689 () Bool)

(assert (=> b!262454 m!278689))

(declare-fun m!278691 () Bool)

(assert (=> b!262454 m!278691))

(declare-fun m!278693 () Bool)

(assert (=> b!262454 m!278693))

(declare-fun m!278695 () Bool)

(assert (=> b!262454 m!278695))

(declare-fun m!278697 () Bool)

(assert (=> b!262454 m!278697))

(declare-fun m!278699 () Bool)

(assert (=> b!262454 m!278699))

(declare-fun m!278701 () Bool)

(assert (=> b!262454 m!278701))

(declare-fun m!278703 () Bool)

(assert (=> b!262454 m!278703))

(declare-fun m!278705 () Bool)

(assert (=> b!262454 m!278705))

(declare-fun m!278707 () Bool)

(assert (=> b!262454 m!278707))

(declare-fun m!278709 () Bool)

(assert (=> b!262454 m!278709))

(declare-fun m!278711 () Bool)

(assert (=> b!262454 m!278711))

(declare-fun m!278713 () Bool)

(assert (=> b!262454 m!278713))

(declare-fun m!278715 () Bool)

(assert (=> b!262454 m!278715))

(declare-fun m!278717 () Bool)

(assert (=> b!262454 m!278717))

(declare-fun m!278719 () Bool)

(assert (=> b!262469 m!278719))

(declare-fun m!278721 () Bool)

(assert (=> b!262469 m!278721))

(declare-fun m!278723 () Bool)

(assert (=> b!262459 m!278723))

(declare-fun m!278725 () Bool)

(assert (=> b!262460 m!278725))

(check-sat (not b_next!6787) (not mapNonEmpty!11335) (not b!262465) (not b!262469) (not b!262463) (not bm!25064) (not b!262470) (not b!262460) (not b!262452) b_and!13939 (not b!262464) (not bm!25063) (not b!262454) (not start!25188) tp_is_empty!6649)
(check-sat b_and!13939 (not b_next!6787))
(get-model)

(declare-fun d!63093 () Bool)

(assert (=> d!63093 (= (inRange!0 index!297 (mask!11193 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!11193 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!262464 d!63093))

(declare-fun d!63095 () Bool)

(declare-fun e!170181 () Bool)

(assert (=> d!63095 e!170181))

(declare-fun res!128262 () Bool)

(assert (=> d!63095 (=> res!128262 e!170181)))

(declare-fun lt!132803 () Bool)

(assert (=> d!63095 (= res!128262 (not lt!132803))))

(declare-fun lt!132802 () Bool)

(assert (=> d!63095 (= lt!132803 lt!132802)))

(declare-fun lt!132801 () Unit!8147)

(declare-fun e!170182 () Unit!8147)

(assert (=> d!63095 (= lt!132801 e!170182)))

(declare-fun c!44758 () Bool)

(assert (=> d!63095 (= c!44758 lt!132802)))

(declare-fun containsKey!311 (List!3757 (_ BitVec 64)) Bool)

(assert (=> d!63095 (= lt!132802 (containsKey!311 (toList!1913 lt!132703) key!932))))

(assert (=> d!63095 (= (contains!1881 lt!132703 key!932) lt!132803)))

(declare-fun b!262612 () Bool)

(declare-fun lt!132800 () Unit!8147)

(assert (=> b!262612 (= e!170182 lt!132800)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!259 (List!3757 (_ BitVec 64)) Unit!8147)

(assert (=> b!262612 (= lt!132800 (lemmaContainsKeyImpliesGetValueByKeyDefined!259 (toList!1913 lt!132703) key!932))))

(declare-datatypes ((Option!326 0))(
  ( (Some!325 (v!5503 V!8513)) (None!324) )
))
(declare-fun isDefined!260 (Option!326) Bool)

(declare-fun getValueByKey!320 (List!3757 (_ BitVec 64)) Option!326)

(assert (=> b!262612 (isDefined!260 (getValueByKey!320 (toList!1913 lt!132703) key!932))))

(declare-fun b!262613 () Bool)

(declare-fun Unit!8161 () Unit!8147)

(assert (=> b!262613 (= e!170182 Unit!8161)))

(declare-fun b!262614 () Bool)

(assert (=> b!262614 (= e!170181 (isDefined!260 (getValueByKey!320 (toList!1913 lt!132703) key!932)))))

(assert (= (and d!63095 c!44758) b!262612))

(assert (= (and d!63095 (not c!44758)) b!262613))

(assert (= (and d!63095 (not res!128262)) b!262614))

(declare-fun m!278859 () Bool)

(assert (=> d!63095 m!278859))

(declare-fun m!278861 () Bool)

(assert (=> b!262612 m!278861))

(declare-fun m!278863 () Bool)

(assert (=> b!262612 m!278863))

(assert (=> b!262612 m!278863))

(declare-fun m!278865 () Bool)

(assert (=> b!262612 m!278865))

(assert (=> b!262614 m!278863))

(assert (=> b!262614 m!278863))

(assert (=> b!262614 m!278865))

(assert (=> b!262464 d!63095))

(declare-fun b!262657 () Bool)

(declare-fun e!170221 () Bool)

(declare-fun e!170211 () Bool)

(assert (=> b!262657 (= e!170221 e!170211)))

(declare-fun c!44774 () Bool)

(assert (=> b!262657 (= c!44774 (not (= (bvand (extraKeys!4571 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!262658 () Bool)

(declare-fun e!170216 () ListLongMap!3795)

(declare-fun call!25096 () ListLongMap!3795)

(assert (=> b!262658 (= e!170216 call!25096)))

(declare-fun b!262659 () Bool)

(declare-fun e!170219 () Unit!8147)

(declare-fun lt!132851 () Unit!8147)

(assert (=> b!262659 (= e!170219 lt!132851)))

(declare-fun lt!132849 () ListLongMap!3795)

(declare-fun getCurrentListMapNoExtraKeys!577 (array!12657 array!12655 (_ BitVec 32) (_ BitVec 32) V!8513 V!8513 (_ BitVec 32) Int) ListLongMap!3795)

(assert (=> b!262659 (= lt!132849 (getCurrentListMapNoExtraKeys!577 (_keys!7024 thiss!1504) (_values!4817 thiss!1504) (mask!11193 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4834 thiss!1504)))))

(declare-fun lt!132866 () (_ BitVec 64))

(assert (=> b!262659 (= lt!132866 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132855 () (_ BitVec 64))

(assert (=> b!262659 (= lt!132855 (select (arr!5990 (_keys!7024 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!132860 () Unit!8147)

(declare-fun addStillContains!237 (ListLongMap!3795 (_ BitVec 64) V!8513 (_ BitVec 64)) Unit!8147)

(assert (=> b!262659 (= lt!132860 (addStillContains!237 lt!132849 lt!132866 (zeroValue!4675 thiss!1504) lt!132855))))

(assert (=> b!262659 (contains!1881 (+!709 lt!132849 (tuple2!4881 lt!132866 (zeroValue!4675 thiss!1504))) lt!132855)))

(declare-fun lt!132863 () Unit!8147)

(assert (=> b!262659 (= lt!132863 lt!132860)))

(declare-fun lt!132853 () ListLongMap!3795)

(assert (=> b!262659 (= lt!132853 (getCurrentListMapNoExtraKeys!577 (_keys!7024 thiss!1504) (_values!4817 thiss!1504) (mask!11193 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4834 thiss!1504)))))

(declare-fun lt!132854 () (_ BitVec 64))

(assert (=> b!262659 (= lt!132854 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132850 () (_ BitVec 64))

(assert (=> b!262659 (= lt!132850 (select (arr!5990 (_keys!7024 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!132868 () Unit!8147)

(declare-fun addApplyDifferent!237 (ListLongMap!3795 (_ BitVec 64) V!8513 (_ BitVec 64)) Unit!8147)

(assert (=> b!262659 (= lt!132868 (addApplyDifferent!237 lt!132853 lt!132854 (minValue!4675 thiss!1504) lt!132850))))

(declare-fun apply!261 (ListLongMap!3795 (_ BitVec 64)) V!8513)

(assert (=> b!262659 (= (apply!261 (+!709 lt!132853 (tuple2!4881 lt!132854 (minValue!4675 thiss!1504))) lt!132850) (apply!261 lt!132853 lt!132850))))

(declare-fun lt!132857 () Unit!8147)

(assert (=> b!262659 (= lt!132857 lt!132868)))

(declare-fun lt!132862 () ListLongMap!3795)

(assert (=> b!262659 (= lt!132862 (getCurrentListMapNoExtraKeys!577 (_keys!7024 thiss!1504) (_values!4817 thiss!1504) (mask!11193 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4834 thiss!1504)))))

(declare-fun lt!132867 () (_ BitVec 64))

(assert (=> b!262659 (= lt!132867 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132869 () (_ BitVec 64))

(assert (=> b!262659 (= lt!132869 (select (arr!5990 (_keys!7024 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!132848 () Unit!8147)

(assert (=> b!262659 (= lt!132848 (addApplyDifferent!237 lt!132862 lt!132867 (zeroValue!4675 thiss!1504) lt!132869))))

(assert (=> b!262659 (= (apply!261 (+!709 lt!132862 (tuple2!4881 lt!132867 (zeroValue!4675 thiss!1504))) lt!132869) (apply!261 lt!132862 lt!132869))))

(declare-fun lt!132852 () Unit!8147)

(assert (=> b!262659 (= lt!132852 lt!132848)))

(declare-fun lt!132856 () ListLongMap!3795)

(assert (=> b!262659 (= lt!132856 (getCurrentListMapNoExtraKeys!577 (_keys!7024 thiss!1504) (_values!4817 thiss!1504) (mask!11193 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4834 thiss!1504)))))

(declare-fun lt!132865 () (_ BitVec 64))

(assert (=> b!262659 (= lt!132865 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132858 () (_ BitVec 64))

(assert (=> b!262659 (= lt!132858 (select (arr!5990 (_keys!7024 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!262659 (= lt!132851 (addApplyDifferent!237 lt!132856 lt!132865 (minValue!4675 thiss!1504) lt!132858))))

(assert (=> b!262659 (= (apply!261 (+!709 lt!132856 (tuple2!4881 lt!132865 (minValue!4675 thiss!1504))) lt!132858) (apply!261 lt!132856 lt!132858))))

(declare-fun b!262660 () Bool)

(declare-fun e!170218 () Bool)

(declare-fun lt!132864 () ListLongMap!3795)

(assert (=> b!262660 (= e!170218 (= (apply!261 lt!132864 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4675 thiss!1504)))))

(declare-fun bm!25091 () Bool)

(declare-fun call!25099 () Bool)

(assert (=> bm!25091 (= call!25099 (contains!1881 lt!132864 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!262661 () Bool)

(declare-fun call!25100 () ListLongMap!3795)

(assert (=> b!262661 (= e!170216 call!25100)))

(declare-fun bm!25092 () Bool)

(declare-fun call!25097 () ListLongMap!3795)

(assert (=> bm!25092 (= call!25096 call!25097)))

(declare-fun b!262662 () Bool)

(declare-fun res!128282 () Bool)

(assert (=> b!262662 (=> (not res!128282) (not e!170221))))

(declare-fun e!170209 () Bool)

(assert (=> b!262662 (= res!128282 e!170209)))

(declare-fun c!44773 () Bool)

(assert (=> b!262662 (= c!44773 (not (= (bvand (extraKeys!4571 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!262663 () Bool)

(declare-fun e!170217 () Bool)

(assert (=> b!262663 (= e!170217 (validKeyInArray!0 (select (arr!5990 (_keys!7024 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!25093 () Bool)

(declare-fun call!25094 () ListLongMap!3795)

(assert (=> bm!25093 (= call!25094 (getCurrentListMapNoExtraKeys!577 (_keys!7024 thiss!1504) (_values!4817 thiss!1504) (mask!11193 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4834 thiss!1504)))))

(declare-fun bm!25094 () Bool)

(declare-fun call!25095 () ListLongMap!3795)

(assert (=> bm!25094 (= call!25100 call!25095)))

(declare-fun b!262664 () Bool)

(declare-fun call!25098 () Bool)

(assert (=> b!262664 (= e!170209 (not call!25098))))

(declare-fun b!262665 () Bool)

(declare-fun e!170213 () Bool)

(declare-fun e!170214 () Bool)

(assert (=> b!262665 (= e!170213 e!170214)))

(declare-fun res!128281 () Bool)

(assert (=> b!262665 (=> (not res!128281) (not e!170214))))

(assert (=> b!262665 (= res!128281 (contains!1881 lt!132864 (select (arr!5990 (_keys!7024 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!262665 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6341 (_keys!7024 thiss!1504))))))

(declare-fun bm!25095 () Bool)

(assert (=> bm!25095 (= call!25098 (contains!1881 lt!132864 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!63097 () Bool)

(assert (=> d!63097 e!170221))

(declare-fun res!128286 () Bool)

(assert (=> d!63097 (=> (not res!128286) (not e!170221))))

(assert (=> d!63097 (= res!128286 (or (bvsge #b00000000000000000000000000000000 (size!6341 (_keys!7024 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6341 (_keys!7024 thiss!1504))))))))

(declare-fun lt!132861 () ListLongMap!3795)

(assert (=> d!63097 (= lt!132864 lt!132861)))

(declare-fun lt!132859 () Unit!8147)

(assert (=> d!63097 (= lt!132859 e!170219)))

(declare-fun c!44772 () Bool)

(assert (=> d!63097 (= c!44772 e!170217)))

(declare-fun res!128287 () Bool)

(assert (=> d!63097 (=> (not res!128287) (not e!170217))))

(assert (=> d!63097 (= res!128287 (bvslt #b00000000000000000000000000000000 (size!6341 (_keys!7024 thiss!1504))))))

(declare-fun e!170210 () ListLongMap!3795)

(assert (=> d!63097 (= lt!132861 e!170210)))

(declare-fun c!44771 () Bool)

(assert (=> d!63097 (= c!44771 (and (not (= (bvand (extraKeys!4571 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4571 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!63097 (validMask!0 (mask!11193 thiss!1504))))

(assert (=> d!63097 (= (getCurrentListMap!1445 (_keys!7024 thiss!1504) (_values!4817 thiss!1504) (mask!11193 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4834 thiss!1504)) lt!132864)))

(declare-fun b!262666 () Bool)

(declare-fun e!170220 () Bool)

(assert (=> b!262666 (= e!170220 (validKeyInArray!0 (select (arr!5990 (_keys!7024 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!262667 () Bool)

(declare-fun e!170215 () ListLongMap!3795)

(assert (=> b!262667 (= e!170215 call!25100)))

(declare-fun b!262668 () Bool)

(declare-fun Unit!8162 () Unit!8147)

(assert (=> b!262668 (= e!170219 Unit!8162)))

(declare-fun bm!25096 () Bool)

(assert (=> bm!25096 (= call!25097 call!25094)))

(declare-fun b!262669 () Bool)

(declare-fun res!128288 () Bool)

(assert (=> b!262669 (=> (not res!128288) (not e!170221))))

(assert (=> b!262669 (= res!128288 e!170213)))

(declare-fun res!128285 () Bool)

(assert (=> b!262669 (=> res!128285 e!170213)))

(assert (=> b!262669 (= res!128285 (not e!170220))))

(declare-fun res!128289 () Bool)

(assert (=> b!262669 (=> (not res!128289) (not e!170220))))

(assert (=> b!262669 (= res!128289 (bvslt #b00000000000000000000000000000000 (size!6341 (_keys!7024 thiss!1504))))))

(declare-fun b!262670 () Bool)

(assert (=> b!262670 (= e!170211 e!170218)))

(declare-fun res!128283 () Bool)

(assert (=> b!262670 (= res!128283 call!25099)))

(assert (=> b!262670 (=> (not res!128283) (not e!170218))))

(declare-fun b!262671 () Bool)

(declare-fun c!44776 () Bool)

(assert (=> b!262671 (= c!44776 (and (not (= (bvand (extraKeys!4571 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4571 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!262671 (= e!170215 e!170216)))

(declare-fun b!262672 () Bool)

(assert (=> b!262672 (= e!170210 (+!709 call!25095 (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4675 thiss!1504))))))

(declare-fun bm!25097 () Bool)

(declare-fun c!44775 () Bool)

(assert (=> bm!25097 (= call!25095 (+!709 (ite c!44771 call!25094 (ite c!44775 call!25097 call!25096)) (ite (or c!44771 c!44775) (tuple2!4881 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4675 thiss!1504)) (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4675 thiss!1504)))))))

(declare-fun b!262673 () Bool)

(declare-fun e!170212 () Bool)

(assert (=> b!262673 (= e!170209 e!170212)))

(declare-fun res!128284 () Bool)

(assert (=> b!262673 (= res!128284 call!25098)))

(assert (=> b!262673 (=> (not res!128284) (not e!170212))))

(declare-fun b!262674 () Bool)

(assert (=> b!262674 (= e!170210 e!170215)))

(assert (=> b!262674 (= c!44775 (and (not (= (bvand (extraKeys!4571 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4571 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!262675 () Bool)

(declare-fun get!3096 (ValueCell!2981 V!8513) V!8513)

(declare-fun dynLambda!604 (Int (_ BitVec 64)) V!8513)

(assert (=> b!262675 (= e!170214 (= (apply!261 lt!132864 (select (arr!5990 (_keys!7024 thiss!1504)) #b00000000000000000000000000000000)) (get!3096 (select (arr!5989 (_values!4817 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!604 (defaultEntry!4834 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!262675 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6340 (_values!4817 thiss!1504))))))

(assert (=> b!262675 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6341 (_keys!7024 thiss!1504))))))

(declare-fun b!262676 () Bool)

(assert (=> b!262676 (= e!170212 (= (apply!261 lt!132864 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4675 thiss!1504)))))

(declare-fun b!262677 () Bool)

(assert (=> b!262677 (= e!170211 (not call!25099))))

(assert (= (and d!63097 c!44771) b!262672))

(assert (= (and d!63097 (not c!44771)) b!262674))

(assert (= (and b!262674 c!44775) b!262667))

(assert (= (and b!262674 (not c!44775)) b!262671))

(assert (= (and b!262671 c!44776) b!262661))

(assert (= (and b!262671 (not c!44776)) b!262658))

(assert (= (or b!262661 b!262658) bm!25092))

(assert (= (or b!262667 bm!25092) bm!25096))

(assert (= (or b!262667 b!262661) bm!25094))

(assert (= (or b!262672 bm!25096) bm!25093))

(assert (= (or b!262672 bm!25094) bm!25097))

(assert (= (and d!63097 res!128287) b!262663))

(assert (= (and d!63097 c!44772) b!262659))

(assert (= (and d!63097 (not c!44772)) b!262668))

(assert (= (and d!63097 res!128286) b!262669))

(assert (= (and b!262669 res!128289) b!262666))

(assert (= (and b!262669 (not res!128285)) b!262665))

(assert (= (and b!262665 res!128281) b!262675))

(assert (= (and b!262669 res!128288) b!262662))

(assert (= (and b!262662 c!44773) b!262673))

(assert (= (and b!262662 (not c!44773)) b!262664))

(assert (= (and b!262673 res!128284) b!262676))

(assert (= (or b!262673 b!262664) bm!25095))

(assert (= (and b!262662 res!128282) b!262657))

(assert (= (and b!262657 c!44774) b!262670))

(assert (= (and b!262657 (not c!44774)) b!262677))

(assert (= (and b!262670 res!128283) b!262660))

(assert (= (or b!262670 b!262677) bm!25091))

(declare-fun b_lambda!8345 () Bool)

(assert (=> (not b_lambda!8345) (not b!262675)))

(declare-fun t!8831 () Bool)

(declare-fun tb!3027 () Bool)

(assert (=> (and b!262469 (= (defaultEntry!4834 thiss!1504) (defaultEntry!4834 thiss!1504)) t!8831) tb!3027))

(declare-fun result!5419 () Bool)

(assert (=> tb!3027 (= result!5419 tp_is_empty!6649)))

(assert (=> b!262675 t!8831))

(declare-fun b_and!13945 () Bool)

(assert (= b_and!13939 (and (=> t!8831 result!5419) b_and!13945)))

(declare-fun m!278867 () Bool)

(assert (=> b!262672 m!278867))

(declare-fun m!278869 () Bool)

(assert (=> b!262659 m!278869))

(declare-fun m!278871 () Bool)

(assert (=> b!262659 m!278871))

(declare-fun m!278873 () Bool)

(assert (=> b!262659 m!278873))

(declare-fun m!278875 () Bool)

(assert (=> b!262659 m!278875))

(assert (=> b!262659 m!278869))

(declare-fun m!278877 () Bool)

(assert (=> b!262659 m!278877))

(declare-fun m!278879 () Bool)

(assert (=> b!262659 m!278879))

(declare-fun m!278881 () Bool)

(assert (=> b!262659 m!278881))

(declare-fun m!278883 () Bool)

(assert (=> b!262659 m!278883))

(declare-fun m!278885 () Bool)

(assert (=> b!262659 m!278885))

(assert (=> b!262659 m!278881))

(declare-fun m!278887 () Bool)

(assert (=> b!262659 m!278887))

(declare-fun m!278889 () Bool)

(assert (=> b!262659 m!278889))

(assert (=> b!262659 m!278889))

(declare-fun m!278891 () Bool)

(assert (=> b!262659 m!278891))

(assert (=> b!262659 m!278883))

(declare-fun m!278893 () Bool)

(assert (=> b!262659 m!278893))

(declare-fun m!278895 () Bool)

(assert (=> b!262659 m!278895))

(declare-fun m!278897 () Bool)

(assert (=> b!262659 m!278897))

(declare-fun m!278899 () Bool)

(assert (=> b!262659 m!278899))

(declare-fun m!278901 () Bool)

(assert (=> b!262659 m!278901))

(assert (=> b!262663 m!278885))

(assert (=> b!262663 m!278885))

(declare-fun m!278903 () Bool)

(assert (=> b!262663 m!278903))

(assert (=> d!63097 m!278685))

(assert (=> b!262665 m!278885))

(assert (=> b!262665 m!278885))

(declare-fun m!278905 () Bool)

(assert (=> b!262665 m!278905))

(declare-fun m!278907 () Bool)

(assert (=> b!262676 m!278907))

(declare-fun m!278909 () Bool)

(assert (=> bm!25091 m!278909))

(assert (=> b!262666 m!278885))

(assert (=> b!262666 m!278885))

(assert (=> b!262666 m!278903))

(declare-fun m!278911 () Bool)

(assert (=> b!262660 m!278911))

(declare-fun m!278913 () Bool)

(assert (=> bm!25097 m!278913))

(assert (=> bm!25093 m!278875))

(declare-fun m!278915 () Bool)

(assert (=> b!262675 m!278915))

(assert (=> b!262675 m!278885))

(declare-fun m!278917 () Bool)

(assert (=> b!262675 m!278917))

(declare-fun m!278919 () Bool)

(assert (=> b!262675 m!278919))

(assert (=> b!262675 m!278915))

(declare-fun m!278921 () Bool)

(assert (=> b!262675 m!278921))

(assert (=> b!262675 m!278885))

(assert (=> b!262675 m!278919))

(declare-fun m!278923 () Bool)

(assert (=> bm!25095 m!278923))

(assert (=> b!262464 d!63097))

(declare-fun b!262692 () Bool)

(declare-fun e!170229 () SeekEntryResult!1161)

(declare-fun lt!132876 () SeekEntryResult!1161)

(assert (=> b!262692 (= e!170229 (MissingZero!1161 (index!6816 lt!132876)))))

(declare-fun d!63099 () Bool)

(declare-fun lt!132877 () SeekEntryResult!1161)

(assert (=> d!63099 (and (or ((_ is Undefined!1161) lt!132877) (not ((_ is Found!1161) lt!132877)) (and (bvsge (index!6815 lt!132877) #b00000000000000000000000000000000) (bvslt (index!6815 lt!132877) (size!6341 (_keys!7024 thiss!1504))))) (or ((_ is Undefined!1161) lt!132877) ((_ is Found!1161) lt!132877) (not ((_ is MissingZero!1161) lt!132877)) (and (bvsge (index!6814 lt!132877) #b00000000000000000000000000000000) (bvslt (index!6814 lt!132877) (size!6341 (_keys!7024 thiss!1504))))) (or ((_ is Undefined!1161) lt!132877) ((_ is Found!1161) lt!132877) ((_ is MissingZero!1161) lt!132877) (not ((_ is MissingVacant!1161) lt!132877)) (and (bvsge (index!6817 lt!132877) #b00000000000000000000000000000000) (bvslt (index!6817 lt!132877) (size!6341 (_keys!7024 thiss!1504))))) (or ((_ is Undefined!1161) lt!132877) (ite ((_ is Found!1161) lt!132877) (= (select (arr!5990 (_keys!7024 thiss!1504)) (index!6815 lt!132877)) key!932) (ite ((_ is MissingZero!1161) lt!132877) (= (select (arr!5990 (_keys!7024 thiss!1504)) (index!6814 lt!132877)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1161) lt!132877) (= (select (arr!5990 (_keys!7024 thiss!1504)) (index!6817 lt!132877)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!170228 () SeekEntryResult!1161)

(assert (=> d!63099 (= lt!132877 e!170228)))

(declare-fun c!44783 () Bool)

(assert (=> d!63099 (= c!44783 (and ((_ is Intermediate!1161) lt!132876) (undefined!1973 lt!132876)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12657 (_ BitVec 32)) SeekEntryResult!1161)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!63099 (= lt!132876 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11193 thiss!1504)) key!932 (_keys!7024 thiss!1504) (mask!11193 thiss!1504)))))

(assert (=> d!63099 (validMask!0 (mask!11193 thiss!1504))))

(assert (=> d!63099 (= (seekEntryOrOpen!0 key!932 (_keys!7024 thiss!1504) (mask!11193 thiss!1504)) lt!132877)))

(declare-fun b!262693 () Bool)

(declare-fun e!170230 () SeekEntryResult!1161)

(assert (=> b!262693 (= e!170228 e!170230)))

(declare-fun lt!132878 () (_ BitVec 64))

(assert (=> b!262693 (= lt!132878 (select (arr!5990 (_keys!7024 thiss!1504)) (index!6816 lt!132876)))))

(declare-fun c!44785 () Bool)

(assert (=> b!262693 (= c!44785 (= lt!132878 key!932))))

(declare-fun b!262694 () Bool)

(declare-fun c!44784 () Bool)

(assert (=> b!262694 (= c!44784 (= lt!132878 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!262694 (= e!170230 e!170229)))

(declare-fun b!262695 () Bool)

(assert (=> b!262695 (= e!170230 (Found!1161 (index!6816 lt!132876)))))

(declare-fun b!262696 () Bool)

(assert (=> b!262696 (= e!170228 Undefined!1161)))

(declare-fun b!262697 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12657 (_ BitVec 32)) SeekEntryResult!1161)

(assert (=> b!262697 (= e!170229 (seekKeyOrZeroReturnVacant!0 (x!25185 lt!132876) (index!6816 lt!132876) (index!6816 lt!132876) key!932 (_keys!7024 thiss!1504) (mask!11193 thiss!1504)))))

(assert (= (and d!63099 c!44783) b!262696))

(assert (= (and d!63099 (not c!44783)) b!262693))

(assert (= (and b!262693 c!44785) b!262695))

(assert (= (and b!262693 (not c!44785)) b!262694))

(assert (= (and b!262694 c!44784) b!262692))

(assert (= (and b!262694 (not c!44784)) b!262697))

(declare-fun m!278925 () Bool)

(assert (=> d!63099 m!278925))

(assert (=> d!63099 m!278685))

(declare-fun m!278927 () Bool)

(assert (=> d!63099 m!278927))

(declare-fun m!278929 () Bool)

(assert (=> d!63099 m!278929))

(declare-fun m!278931 () Bool)

(assert (=> d!63099 m!278931))

(declare-fun m!278933 () Bool)

(assert (=> d!63099 m!278933))

(assert (=> d!63099 m!278931))

(declare-fun m!278935 () Bool)

(assert (=> b!262693 m!278935))

(declare-fun m!278937 () Bool)

(assert (=> b!262697 m!278937))

(assert (=> b!262463 d!63099))

(declare-fun d!63101 () Bool)

(declare-fun e!170233 () Bool)

(assert (=> d!63101 e!170233))

(declare-fun res!128294 () Bool)

(assert (=> d!63101 (=> (not res!128294) (not e!170233))))

(declare-fun lt!132884 () SeekEntryResult!1161)

(assert (=> d!63101 (= res!128294 ((_ is Found!1161) lt!132884))))

(assert (=> d!63101 (= lt!132884 (seekEntryOrOpen!0 key!932 (_keys!7024 thiss!1504) (mask!11193 thiss!1504)))))

(declare-fun lt!132883 () Unit!8147)

(declare-fun choose!1291 (array!12657 array!12655 (_ BitVec 32) (_ BitVec 32) V!8513 V!8513 (_ BitVec 64) Int) Unit!8147)

(assert (=> d!63101 (= lt!132883 (choose!1291 (_keys!7024 thiss!1504) (_values!4817 thiss!1504) (mask!11193 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) key!932 (defaultEntry!4834 thiss!1504)))))

(assert (=> d!63101 (validMask!0 (mask!11193 thiss!1504))))

(assert (=> d!63101 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!448 (_keys!7024 thiss!1504) (_values!4817 thiss!1504) (mask!11193 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) key!932 (defaultEntry!4834 thiss!1504)) lt!132883)))

(declare-fun b!262702 () Bool)

(declare-fun res!128295 () Bool)

(assert (=> b!262702 (=> (not res!128295) (not e!170233))))

(assert (=> b!262702 (= res!128295 (inRange!0 (index!6815 lt!132884) (mask!11193 thiss!1504)))))

(declare-fun b!262703 () Bool)

(assert (=> b!262703 (= e!170233 (= (select (arr!5990 (_keys!7024 thiss!1504)) (index!6815 lt!132884)) key!932))))

(assert (=> b!262703 (and (bvsge (index!6815 lt!132884) #b00000000000000000000000000000000) (bvslt (index!6815 lt!132884) (size!6341 (_keys!7024 thiss!1504))))))

(assert (= (and d!63101 res!128294) b!262702))

(assert (= (and b!262702 res!128295) b!262703))

(assert (=> d!63101 m!278677))

(declare-fun m!278939 () Bool)

(assert (=> d!63101 m!278939))

(assert (=> d!63101 m!278685))

(declare-fun m!278941 () Bool)

(assert (=> b!262702 m!278941))

(declare-fun m!278943 () Bool)

(assert (=> b!262703 m!278943))

(assert (=> b!262452 d!63101))

(declare-fun d!63103 () Bool)

(declare-fun res!128300 () Bool)

(declare-fun e!170238 () Bool)

(assert (=> d!63103 (=> res!128300 e!170238)))

(assert (=> d!63103 (= res!128300 (= (select (arr!5990 (_keys!7024 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!63103 (= (arrayContainsKey!0 (_keys!7024 thiss!1504) key!932 #b00000000000000000000000000000000) e!170238)))

(declare-fun b!262708 () Bool)

(declare-fun e!170239 () Bool)

(assert (=> b!262708 (= e!170238 e!170239)))

(declare-fun res!128301 () Bool)

(assert (=> b!262708 (=> (not res!128301) (not e!170239))))

(assert (=> b!262708 (= res!128301 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6341 (_keys!7024 thiss!1504))))))

(declare-fun b!262709 () Bool)

(assert (=> b!262709 (= e!170239 (arrayContainsKey!0 (_keys!7024 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!63103 (not res!128300)) b!262708))

(assert (= (and b!262708 res!128301) b!262709))

(assert (=> d!63103 m!278885))

(declare-fun m!278945 () Bool)

(assert (=> b!262709 m!278945))

(assert (=> bm!25063 d!63103))

(declare-fun d!63105 () Bool)

(declare-fun res!128308 () Bool)

(declare-fun e!170242 () Bool)

(assert (=> d!63105 (=> (not res!128308) (not e!170242))))

(declare-fun simpleValid!284 (LongMapFixedSize!3862) Bool)

(assert (=> d!63105 (= res!128308 (simpleValid!284 thiss!1504))))

(assert (=> d!63105 (= (valid!1511 thiss!1504) e!170242)))

(declare-fun b!262716 () Bool)

(declare-fun res!128309 () Bool)

(assert (=> b!262716 (=> (not res!128309) (not e!170242))))

(assert (=> b!262716 (= res!128309 (= (arrayCountValidKeys!0 (_keys!7024 thiss!1504) #b00000000000000000000000000000000 (size!6341 (_keys!7024 thiss!1504))) (_size!1980 thiss!1504)))))

(declare-fun b!262717 () Bool)

(declare-fun res!128310 () Bool)

(assert (=> b!262717 (=> (not res!128310) (not e!170242))))

(assert (=> b!262717 (= res!128310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!7024 thiss!1504) (mask!11193 thiss!1504)))))

(declare-fun b!262718 () Bool)

(assert (=> b!262718 (= e!170242 (arrayNoDuplicates!0 (_keys!7024 thiss!1504) #b00000000000000000000000000000000 Nil!3755))))

(assert (= (and d!63105 res!128308) b!262716))

(assert (= (and b!262716 res!128309) b!262717))

(assert (= (and b!262717 res!128310) b!262718))

(declare-fun m!278947 () Bool)

(assert (=> d!63105 m!278947))

(assert (=> b!262716 m!278703))

(declare-fun m!278949 () Bool)

(assert (=> b!262717 m!278949))

(declare-fun m!278951 () Bool)

(assert (=> b!262718 m!278951))

(assert (=> start!25188 d!63105))

(declare-fun d!63107 () Bool)

(assert (=> d!63107 (contains!1881 (getCurrentListMap!1445 (_keys!7024 thiss!1504) (_values!4817 thiss!1504) (mask!11193 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4834 thiss!1504)) key!932)))

(declare-fun lt!132887 () Unit!8147)

(declare-fun choose!1292 (array!12657 array!12655 (_ BitVec 32) (_ BitVec 32) V!8513 V!8513 (_ BitVec 64) (_ BitVec 32) Int) Unit!8147)

(assert (=> d!63107 (= lt!132887 (choose!1292 (_keys!7024 thiss!1504) (_values!4817 thiss!1504) (mask!11193 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4834 thiss!1504)))))

(assert (=> d!63107 (validMask!0 (mask!11193 thiss!1504))))

(assert (=> d!63107 (= (lemmaArrayContainsKeyThenInListMap!267 (_keys!7024 thiss!1504) (_values!4817 thiss!1504) (mask!11193 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4834 thiss!1504)) lt!132887)))

(declare-fun bs!9261 () Bool)

(assert (= bs!9261 d!63107))

(assert (=> bs!9261 m!278683))

(assert (=> bs!9261 m!278683))

(declare-fun m!278953 () Bool)

(assert (=> bs!9261 m!278953))

(declare-fun m!278955 () Bool)

(assert (=> bs!9261 m!278955))

(assert (=> bs!9261 m!278685))

(assert (=> b!262465 d!63107))

(declare-fun d!63109 () Bool)

(assert (=> d!63109 (= (array_inv!3941 (_keys!7024 thiss!1504)) (bvsge (size!6341 (_keys!7024 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!262469 d!63109))

(declare-fun d!63111 () Bool)

(assert (=> d!63111 (= (array_inv!3942 (_values!4817 thiss!1504)) (bvsge (size!6340 (_values!4817 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!262469 d!63111))

(declare-fun b!262729 () Bool)

(declare-fun e!170247 () Bool)

(assert (=> b!262729 (= e!170247 (bvslt (size!6341 (_keys!7024 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun d!63113 () Bool)

(declare-fun e!170248 () Bool)

(assert (=> d!63113 e!170248))

(declare-fun res!128320 () Bool)

(assert (=> d!63113 (=> (not res!128320) (not e!170248))))

(assert (=> d!63113 (= res!128320 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6341 (_keys!7024 thiss!1504)))))))

(declare-fun lt!132890 () Unit!8147)

(declare-fun choose!1 (array!12657 (_ BitVec 32) (_ BitVec 64)) Unit!8147)

(assert (=> d!63113 (= lt!132890 (choose!1 (_keys!7024 thiss!1504) index!297 key!932))))

(assert (=> d!63113 e!170247))

(declare-fun res!128319 () Bool)

(assert (=> d!63113 (=> (not res!128319) (not e!170247))))

(assert (=> d!63113 (= res!128319 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6341 (_keys!7024 thiss!1504)))))))

(assert (=> d!63113 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!7024 thiss!1504) index!297 key!932) lt!132890)))

(declare-fun b!262727 () Bool)

(declare-fun res!128322 () Bool)

(assert (=> b!262727 (=> (not res!128322) (not e!170247))))

(assert (=> b!262727 (= res!128322 (not (validKeyInArray!0 (select (arr!5990 (_keys!7024 thiss!1504)) index!297))))))

(declare-fun b!262728 () Bool)

(declare-fun res!128321 () Bool)

(assert (=> b!262728 (=> (not res!128321) (not e!170247))))

(assert (=> b!262728 (= res!128321 (validKeyInArray!0 key!932))))

(declare-fun b!262730 () Bool)

(assert (=> b!262730 (= e!170248 (= (arrayCountValidKeys!0 (array!12658 (store (arr!5990 (_keys!7024 thiss!1504)) index!297 key!932) (size!6341 (_keys!7024 thiss!1504))) #b00000000000000000000000000000000 (size!6341 (_keys!7024 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!7024 thiss!1504) #b00000000000000000000000000000000 (size!6341 (_keys!7024 thiss!1504))) #b00000000000000000000000000000001)))))

(assert (= (and d!63113 res!128319) b!262727))

(assert (= (and b!262727 res!128322) b!262728))

(assert (= (and b!262728 res!128321) b!262729))

(assert (= (and d!63113 res!128320) b!262730))

(declare-fun m!278957 () Bool)

(assert (=> d!63113 m!278957))

(declare-fun m!278959 () Bool)

(assert (=> b!262727 m!278959))

(assert (=> b!262727 m!278959))

(declare-fun m!278961 () Bool)

(assert (=> b!262727 m!278961))

(assert (=> b!262728 m!278725))

(assert (=> b!262730 m!278715))

(declare-fun m!278963 () Bool)

(assert (=> b!262730 m!278963))

(assert (=> b!262730 m!278703))

(assert (=> b!262454 d!63113))

(declare-fun d!63115 () Bool)

(declare-fun e!170251 () Bool)

(assert (=> d!63115 e!170251))

(declare-fun res!128327 () Bool)

(assert (=> d!63115 (=> (not res!128327) (not e!170251))))

(declare-fun lt!132900 () ListLongMap!3795)

(assert (=> d!63115 (= res!128327 (contains!1881 lt!132900 (_1!2451 (tuple2!4881 key!932 v!346))))))

(declare-fun lt!132901 () List!3757)

(assert (=> d!63115 (= lt!132900 (ListLongMap!3796 lt!132901))))

(declare-fun lt!132899 () Unit!8147)

(declare-fun lt!132902 () Unit!8147)

(assert (=> d!63115 (= lt!132899 lt!132902)))

(assert (=> d!63115 (= (getValueByKey!320 lt!132901 (_1!2451 (tuple2!4881 key!932 v!346))) (Some!325 (_2!2451 (tuple2!4881 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!176 (List!3757 (_ BitVec 64) V!8513) Unit!8147)

(assert (=> d!63115 (= lt!132902 (lemmaContainsTupThenGetReturnValue!176 lt!132901 (_1!2451 (tuple2!4881 key!932 v!346)) (_2!2451 (tuple2!4881 key!932 v!346))))))

(declare-fun insertStrictlySorted!179 (List!3757 (_ BitVec 64) V!8513) List!3757)

(assert (=> d!63115 (= lt!132901 (insertStrictlySorted!179 (toList!1913 lt!132703) (_1!2451 (tuple2!4881 key!932 v!346)) (_2!2451 (tuple2!4881 key!932 v!346))))))

(assert (=> d!63115 (= (+!709 lt!132703 (tuple2!4881 key!932 v!346)) lt!132900)))

(declare-fun b!262735 () Bool)

(declare-fun res!128328 () Bool)

(assert (=> b!262735 (=> (not res!128328) (not e!170251))))

(assert (=> b!262735 (= res!128328 (= (getValueByKey!320 (toList!1913 lt!132900) (_1!2451 (tuple2!4881 key!932 v!346))) (Some!325 (_2!2451 (tuple2!4881 key!932 v!346)))))))

(declare-fun b!262736 () Bool)

(declare-fun contains!1883 (List!3757 tuple2!4880) Bool)

(assert (=> b!262736 (= e!170251 (contains!1883 (toList!1913 lt!132900) (tuple2!4881 key!932 v!346)))))

(assert (= (and d!63115 res!128327) b!262735))

(assert (= (and b!262735 res!128328) b!262736))

(declare-fun m!278965 () Bool)

(assert (=> d!63115 m!278965))

(declare-fun m!278967 () Bool)

(assert (=> d!63115 m!278967))

(declare-fun m!278969 () Bool)

(assert (=> d!63115 m!278969))

(declare-fun m!278971 () Bool)

(assert (=> d!63115 m!278971))

(declare-fun m!278973 () Bool)

(assert (=> b!262735 m!278973))

(declare-fun m!278975 () Bool)

(assert (=> b!262736 m!278975))

(assert (=> b!262454 d!63115))

(declare-fun b!262745 () Bool)

(declare-fun e!170257 () (_ BitVec 32))

(assert (=> b!262745 (= e!170257 #b00000000000000000000000000000000)))

(declare-fun b!262746 () Bool)

(declare-fun e!170256 () (_ BitVec 32))

(declare-fun call!25103 () (_ BitVec 32))

(assert (=> b!262746 (= e!170256 (bvadd #b00000000000000000000000000000001 call!25103))))

(declare-fun b!262747 () Bool)

(assert (=> b!262747 (= e!170257 e!170256)))

(declare-fun c!44791 () Bool)

(assert (=> b!262747 (= c!44791 (validKeyInArray!0 (select (arr!5990 (_keys!7024 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!63117 () Bool)

(declare-fun lt!132905 () (_ BitVec 32))

(assert (=> d!63117 (and (bvsge lt!132905 #b00000000000000000000000000000000) (bvsle lt!132905 (bvsub (size!6341 (_keys!7024 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!63117 (= lt!132905 e!170257)))

(declare-fun c!44790 () Bool)

(assert (=> d!63117 (= c!44790 (bvsge #b00000000000000000000000000000000 (size!6341 (_keys!7024 thiss!1504))))))

(assert (=> d!63117 (and (bvsle #b00000000000000000000000000000000 (size!6341 (_keys!7024 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6341 (_keys!7024 thiss!1504)) (size!6341 (_keys!7024 thiss!1504))))))

(assert (=> d!63117 (= (arrayCountValidKeys!0 (_keys!7024 thiss!1504) #b00000000000000000000000000000000 (size!6341 (_keys!7024 thiss!1504))) lt!132905)))

(declare-fun b!262748 () Bool)

(assert (=> b!262748 (= e!170256 call!25103)))

(declare-fun bm!25100 () Bool)

(assert (=> bm!25100 (= call!25103 (arrayCountValidKeys!0 (_keys!7024 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6341 (_keys!7024 thiss!1504))))))

(assert (= (and d!63117 c!44790) b!262745))

(assert (= (and d!63117 (not c!44790)) b!262747))

(assert (= (and b!262747 c!44791) b!262746))

(assert (= (and b!262747 (not c!44791)) b!262748))

(assert (= (or b!262746 b!262748) bm!25100))

(assert (=> b!262747 m!278885))

(assert (=> b!262747 m!278885))

(assert (=> b!262747 m!278903))

(declare-fun m!278977 () Bool)

(assert (=> bm!25100 m!278977))

(assert (=> b!262454 d!63117))

(declare-fun d!63119 () Bool)

(declare-fun e!170260 () Bool)

(assert (=> d!63119 e!170260))

(declare-fun res!128331 () Bool)

(assert (=> d!63119 (=> (not res!128331) (not e!170260))))

(assert (=> d!63119 (= res!128331 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6341 (_keys!7024 thiss!1504))) (bvslt index!297 (size!6340 (_values!4817 thiss!1504)))))))

(declare-fun lt!132908 () Unit!8147)

(declare-fun choose!1293 (array!12657 array!12655 (_ BitVec 32) (_ BitVec 32) V!8513 V!8513 (_ BitVec 32) (_ BitVec 64) V!8513 Int) Unit!8147)

(assert (=> d!63119 (= lt!132908 (choose!1293 (_keys!7024 thiss!1504) (_values!4817 thiss!1504) (mask!11193 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) index!297 key!932 v!346 (defaultEntry!4834 thiss!1504)))))

(assert (=> d!63119 (validMask!0 (mask!11193 thiss!1504))))

(assert (=> d!63119 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!124 (_keys!7024 thiss!1504) (_values!4817 thiss!1504) (mask!11193 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) index!297 key!932 v!346 (defaultEntry!4834 thiss!1504)) lt!132908)))

(declare-fun b!262751 () Bool)

(assert (=> b!262751 (= e!170260 (= (+!709 (getCurrentListMap!1445 (_keys!7024 thiss!1504) (_values!4817 thiss!1504) (mask!11193 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4834 thiss!1504)) (tuple2!4881 key!932 v!346)) (getCurrentListMap!1445 (array!12658 (store (arr!5990 (_keys!7024 thiss!1504)) index!297 key!932) (size!6341 (_keys!7024 thiss!1504))) (array!12656 (store (arr!5989 (_values!4817 thiss!1504)) index!297 (ValueCellFull!2981 v!346)) (size!6340 (_values!4817 thiss!1504))) (mask!11193 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4834 thiss!1504))))))

(assert (= (and d!63119 res!128331) b!262751))

(declare-fun m!278979 () Bool)

(assert (=> d!63119 m!278979))

(assert (=> d!63119 m!278685))

(declare-fun m!278981 () Bool)

(assert (=> b!262751 m!278981))

(assert (=> b!262751 m!278683))

(assert (=> b!262751 m!278691))

(assert (=> b!262751 m!278715))

(assert (=> b!262751 m!278683))

(declare-fun m!278983 () Bool)

(assert (=> b!262751 m!278983))

(assert (=> b!262454 d!63119))

(declare-fun d!63121 () Bool)

(assert (=> d!63121 (= (arrayCountValidKeys!0 lt!132702 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!132911 () Unit!8147)

(declare-fun choose!2 (array!12657 (_ BitVec 32)) Unit!8147)

(assert (=> d!63121 (= lt!132911 (choose!2 lt!132702 index!297))))

(declare-fun e!170263 () Bool)

(assert (=> d!63121 e!170263))

(declare-fun res!128336 () Bool)

(assert (=> d!63121 (=> (not res!128336) (not e!170263))))

(assert (=> d!63121 (= res!128336 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6341 lt!132702))))))

(assert (=> d!63121 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!132702 index!297) lt!132911)))

(declare-fun b!262756 () Bool)

(declare-fun res!128337 () Bool)

(assert (=> b!262756 (=> (not res!128337) (not e!170263))))

(assert (=> b!262756 (= res!128337 (validKeyInArray!0 (select (arr!5990 lt!132702) index!297)))))

(declare-fun b!262757 () Bool)

(assert (=> b!262757 (= e!170263 (bvslt (size!6341 lt!132702) #b01111111111111111111111111111111))))

(assert (= (and d!63121 res!128336) b!262756))

(assert (= (and b!262756 res!128337) b!262757))

(declare-fun m!278985 () Bool)

(assert (=> d!63121 m!278985))

(declare-fun m!278987 () Bool)

(assert (=> d!63121 m!278987))

(declare-fun m!278989 () Bool)

(assert (=> b!262756 m!278989))

(assert (=> b!262756 m!278989))

(declare-fun m!278991 () Bool)

(assert (=> b!262756 m!278991))

(assert (=> b!262454 d!63121))

(declare-fun b!262758 () Bool)

(declare-fun e!170265 () (_ BitVec 32))

(assert (=> b!262758 (= e!170265 #b00000000000000000000000000000000)))

(declare-fun b!262759 () Bool)

(declare-fun e!170264 () (_ BitVec 32))

(declare-fun call!25104 () (_ BitVec 32))

(assert (=> b!262759 (= e!170264 (bvadd #b00000000000000000000000000000001 call!25104))))

(declare-fun b!262760 () Bool)

(assert (=> b!262760 (= e!170265 e!170264)))

(declare-fun c!44793 () Bool)

(assert (=> b!262760 (= c!44793 (validKeyInArray!0 (select (arr!5990 lt!132702) index!297)))))

(declare-fun d!63123 () Bool)

(declare-fun lt!132912 () (_ BitVec 32))

(assert (=> d!63123 (and (bvsge lt!132912 #b00000000000000000000000000000000) (bvsle lt!132912 (bvsub (size!6341 lt!132702) index!297)))))

(assert (=> d!63123 (= lt!132912 e!170265)))

(declare-fun c!44792 () Bool)

(assert (=> d!63123 (= c!44792 (bvsge index!297 (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!63123 (and (bvsle index!297 (bvadd #b00000000000000000000000000000001 index!297)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6341 lt!132702)))))

(assert (=> d!63123 (= (arrayCountValidKeys!0 lt!132702 index!297 (bvadd #b00000000000000000000000000000001 index!297)) lt!132912)))

(declare-fun b!262761 () Bool)

(assert (=> b!262761 (= e!170264 call!25104)))

(declare-fun bm!25101 () Bool)

(assert (=> bm!25101 (= call!25104 (arrayCountValidKeys!0 lt!132702 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (= (and d!63123 c!44792) b!262758))

(assert (= (and d!63123 (not c!44792)) b!262760))

(assert (= (and b!262760 c!44793) b!262759))

(assert (= (and b!262760 (not c!44793)) b!262761))

(assert (= (or b!262759 b!262761) bm!25101))

(assert (=> b!262760 m!278989))

(assert (=> b!262760 m!278989))

(assert (=> b!262760 m!278991))

(declare-fun m!278993 () Bool)

(assert (=> bm!25101 m!278993))

(assert (=> b!262454 d!63123))

(declare-fun b!262762 () Bool)

(declare-fun e!170278 () Bool)

(declare-fun e!170268 () Bool)

(assert (=> b!262762 (= e!170278 e!170268)))

(declare-fun c!44797 () Bool)

(assert (=> b!262762 (= c!44797 (not (= (bvand (extraKeys!4571 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!262763 () Bool)

(declare-fun e!170273 () ListLongMap!3795)

(declare-fun call!25107 () ListLongMap!3795)

(assert (=> b!262763 (= e!170273 call!25107)))

(declare-fun b!262764 () Bool)

(declare-fun e!170276 () Unit!8147)

(declare-fun lt!132916 () Unit!8147)

(assert (=> b!262764 (= e!170276 lt!132916)))

(declare-fun lt!132914 () ListLongMap!3795)

(assert (=> b!262764 (= lt!132914 (getCurrentListMapNoExtraKeys!577 lt!132702 (array!12656 (store (arr!5989 (_values!4817 thiss!1504)) index!297 (ValueCellFull!2981 v!346)) (size!6340 (_values!4817 thiss!1504))) (mask!11193 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4834 thiss!1504)))))

(declare-fun lt!132931 () (_ BitVec 64))

(assert (=> b!262764 (= lt!132931 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132920 () (_ BitVec 64))

(assert (=> b!262764 (= lt!132920 (select (arr!5990 lt!132702) #b00000000000000000000000000000000))))

(declare-fun lt!132925 () Unit!8147)

(assert (=> b!262764 (= lt!132925 (addStillContains!237 lt!132914 lt!132931 (zeroValue!4675 thiss!1504) lt!132920))))

(assert (=> b!262764 (contains!1881 (+!709 lt!132914 (tuple2!4881 lt!132931 (zeroValue!4675 thiss!1504))) lt!132920)))

(declare-fun lt!132928 () Unit!8147)

(assert (=> b!262764 (= lt!132928 lt!132925)))

(declare-fun lt!132918 () ListLongMap!3795)

(assert (=> b!262764 (= lt!132918 (getCurrentListMapNoExtraKeys!577 lt!132702 (array!12656 (store (arr!5989 (_values!4817 thiss!1504)) index!297 (ValueCellFull!2981 v!346)) (size!6340 (_values!4817 thiss!1504))) (mask!11193 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4834 thiss!1504)))))

(declare-fun lt!132919 () (_ BitVec 64))

(assert (=> b!262764 (= lt!132919 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132915 () (_ BitVec 64))

(assert (=> b!262764 (= lt!132915 (select (arr!5990 lt!132702) #b00000000000000000000000000000000))))

(declare-fun lt!132933 () Unit!8147)

(assert (=> b!262764 (= lt!132933 (addApplyDifferent!237 lt!132918 lt!132919 (minValue!4675 thiss!1504) lt!132915))))

(assert (=> b!262764 (= (apply!261 (+!709 lt!132918 (tuple2!4881 lt!132919 (minValue!4675 thiss!1504))) lt!132915) (apply!261 lt!132918 lt!132915))))

(declare-fun lt!132922 () Unit!8147)

(assert (=> b!262764 (= lt!132922 lt!132933)))

(declare-fun lt!132927 () ListLongMap!3795)

(assert (=> b!262764 (= lt!132927 (getCurrentListMapNoExtraKeys!577 lt!132702 (array!12656 (store (arr!5989 (_values!4817 thiss!1504)) index!297 (ValueCellFull!2981 v!346)) (size!6340 (_values!4817 thiss!1504))) (mask!11193 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4834 thiss!1504)))))

(declare-fun lt!132932 () (_ BitVec 64))

(assert (=> b!262764 (= lt!132932 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132934 () (_ BitVec 64))

(assert (=> b!262764 (= lt!132934 (select (arr!5990 lt!132702) #b00000000000000000000000000000000))))

(declare-fun lt!132913 () Unit!8147)

(assert (=> b!262764 (= lt!132913 (addApplyDifferent!237 lt!132927 lt!132932 (zeroValue!4675 thiss!1504) lt!132934))))

(assert (=> b!262764 (= (apply!261 (+!709 lt!132927 (tuple2!4881 lt!132932 (zeroValue!4675 thiss!1504))) lt!132934) (apply!261 lt!132927 lt!132934))))

(declare-fun lt!132917 () Unit!8147)

(assert (=> b!262764 (= lt!132917 lt!132913)))

(declare-fun lt!132921 () ListLongMap!3795)

(assert (=> b!262764 (= lt!132921 (getCurrentListMapNoExtraKeys!577 lt!132702 (array!12656 (store (arr!5989 (_values!4817 thiss!1504)) index!297 (ValueCellFull!2981 v!346)) (size!6340 (_values!4817 thiss!1504))) (mask!11193 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4834 thiss!1504)))))

(declare-fun lt!132930 () (_ BitVec 64))

(assert (=> b!262764 (= lt!132930 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!132923 () (_ BitVec 64))

(assert (=> b!262764 (= lt!132923 (select (arr!5990 lt!132702) #b00000000000000000000000000000000))))

(assert (=> b!262764 (= lt!132916 (addApplyDifferent!237 lt!132921 lt!132930 (minValue!4675 thiss!1504) lt!132923))))

(assert (=> b!262764 (= (apply!261 (+!709 lt!132921 (tuple2!4881 lt!132930 (minValue!4675 thiss!1504))) lt!132923) (apply!261 lt!132921 lt!132923))))

(declare-fun b!262765 () Bool)

(declare-fun e!170275 () Bool)

(declare-fun lt!132929 () ListLongMap!3795)

(assert (=> b!262765 (= e!170275 (= (apply!261 lt!132929 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4675 thiss!1504)))))

(declare-fun bm!25102 () Bool)

(declare-fun call!25110 () Bool)

(assert (=> bm!25102 (= call!25110 (contains!1881 lt!132929 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!262766 () Bool)

(declare-fun call!25111 () ListLongMap!3795)

(assert (=> b!262766 (= e!170273 call!25111)))

(declare-fun bm!25103 () Bool)

(declare-fun call!25108 () ListLongMap!3795)

(assert (=> bm!25103 (= call!25107 call!25108)))

(declare-fun b!262767 () Bool)

(declare-fun res!128339 () Bool)

(assert (=> b!262767 (=> (not res!128339) (not e!170278))))

(declare-fun e!170266 () Bool)

(assert (=> b!262767 (= res!128339 e!170266)))

(declare-fun c!44796 () Bool)

(assert (=> b!262767 (= c!44796 (not (= (bvand (extraKeys!4571 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!262768 () Bool)

(declare-fun e!170274 () Bool)

(assert (=> b!262768 (= e!170274 (validKeyInArray!0 (select (arr!5990 lt!132702) #b00000000000000000000000000000000)))))

(declare-fun call!25105 () ListLongMap!3795)

(declare-fun bm!25104 () Bool)

(assert (=> bm!25104 (= call!25105 (getCurrentListMapNoExtraKeys!577 lt!132702 (array!12656 (store (arr!5989 (_values!4817 thiss!1504)) index!297 (ValueCellFull!2981 v!346)) (size!6340 (_values!4817 thiss!1504))) (mask!11193 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4834 thiss!1504)))))

(declare-fun bm!25105 () Bool)

(declare-fun call!25106 () ListLongMap!3795)

(assert (=> bm!25105 (= call!25111 call!25106)))

(declare-fun b!262769 () Bool)

(declare-fun call!25109 () Bool)

(assert (=> b!262769 (= e!170266 (not call!25109))))

(declare-fun b!262770 () Bool)

(declare-fun e!170270 () Bool)

(declare-fun e!170271 () Bool)

(assert (=> b!262770 (= e!170270 e!170271)))

(declare-fun res!128338 () Bool)

(assert (=> b!262770 (=> (not res!128338) (not e!170271))))

(assert (=> b!262770 (= res!128338 (contains!1881 lt!132929 (select (arr!5990 lt!132702) #b00000000000000000000000000000000)))))

(assert (=> b!262770 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6341 lt!132702)))))

(declare-fun bm!25106 () Bool)

(assert (=> bm!25106 (= call!25109 (contains!1881 lt!132929 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!63125 () Bool)

(assert (=> d!63125 e!170278))

(declare-fun res!128343 () Bool)

(assert (=> d!63125 (=> (not res!128343) (not e!170278))))

(assert (=> d!63125 (= res!128343 (or (bvsge #b00000000000000000000000000000000 (size!6341 lt!132702)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6341 lt!132702)))))))

(declare-fun lt!132926 () ListLongMap!3795)

(assert (=> d!63125 (= lt!132929 lt!132926)))

(declare-fun lt!132924 () Unit!8147)

(assert (=> d!63125 (= lt!132924 e!170276)))

(declare-fun c!44795 () Bool)

(assert (=> d!63125 (= c!44795 e!170274)))

(declare-fun res!128344 () Bool)

(assert (=> d!63125 (=> (not res!128344) (not e!170274))))

(assert (=> d!63125 (= res!128344 (bvslt #b00000000000000000000000000000000 (size!6341 lt!132702)))))

(declare-fun e!170267 () ListLongMap!3795)

(assert (=> d!63125 (= lt!132926 e!170267)))

(declare-fun c!44794 () Bool)

(assert (=> d!63125 (= c!44794 (and (not (= (bvand (extraKeys!4571 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4571 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!63125 (validMask!0 (mask!11193 thiss!1504))))

(assert (=> d!63125 (= (getCurrentListMap!1445 lt!132702 (array!12656 (store (arr!5989 (_values!4817 thiss!1504)) index!297 (ValueCellFull!2981 v!346)) (size!6340 (_values!4817 thiss!1504))) (mask!11193 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4834 thiss!1504)) lt!132929)))

(declare-fun b!262771 () Bool)

(declare-fun e!170277 () Bool)

(assert (=> b!262771 (= e!170277 (validKeyInArray!0 (select (arr!5990 lt!132702) #b00000000000000000000000000000000)))))

(declare-fun b!262772 () Bool)

(declare-fun e!170272 () ListLongMap!3795)

(assert (=> b!262772 (= e!170272 call!25111)))

(declare-fun b!262773 () Bool)

(declare-fun Unit!8163 () Unit!8147)

(assert (=> b!262773 (= e!170276 Unit!8163)))

(declare-fun bm!25107 () Bool)

(assert (=> bm!25107 (= call!25108 call!25105)))

(declare-fun b!262774 () Bool)

(declare-fun res!128345 () Bool)

(assert (=> b!262774 (=> (not res!128345) (not e!170278))))

(assert (=> b!262774 (= res!128345 e!170270)))

(declare-fun res!128342 () Bool)

(assert (=> b!262774 (=> res!128342 e!170270)))

(assert (=> b!262774 (= res!128342 (not e!170277))))

(declare-fun res!128346 () Bool)

(assert (=> b!262774 (=> (not res!128346) (not e!170277))))

(assert (=> b!262774 (= res!128346 (bvslt #b00000000000000000000000000000000 (size!6341 lt!132702)))))

(declare-fun b!262775 () Bool)

(assert (=> b!262775 (= e!170268 e!170275)))

(declare-fun res!128340 () Bool)

(assert (=> b!262775 (= res!128340 call!25110)))

(assert (=> b!262775 (=> (not res!128340) (not e!170275))))

(declare-fun b!262776 () Bool)

(declare-fun c!44799 () Bool)

(assert (=> b!262776 (= c!44799 (and (not (= (bvand (extraKeys!4571 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4571 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!262776 (= e!170272 e!170273)))

(declare-fun b!262777 () Bool)

(assert (=> b!262777 (= e!170267 (+!709 call!25106 (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4675 thiss!1504))))))

(declare-fun c!44798 () Bool)

(declare-fun bm!25108 () Bool)

(assert (=> bm!25108 (= call!25106 (+!709 (ite c!44794 call!25105 (ite c!44798 call!25108 call!25107)) (ite (or c!44794 c!44798) (tuple2!4881 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4675 thiss!1504)) (tuple2!4881 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4675 thiss!1504)))))))

(declare-fun b!262778 () Bool)

(declare-fun e!170269 () Bool)

(assert (=> b!262778 (= e!170266 e!170269)))

(declare-fun res!128341 () Bool)

(assert (=> b!262778 (= res!128341 call!25109)))

(assert (=> b!262778 (=> (not res!128341) (not e!170269))))

(declare-fun b!262779 () Bool)

(assert (=> b!262779 (= e!170267 e!170272)))

(assert (=> b!262779 (= c!44798 (and (not (= (bvand (extraKeys!4571 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4571 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!262780 () Bool)

(assert (=> b!262780 (= e!170271 (= (apply!261 lt!132929 (select (arr!5990 lt!132702) #b00000000000000000000000000000000)) (get!3096 (select (arr!5989 (array!12656 (store (arr!5989 (_values!4817 thiss!1504)) index!297 (ValueCellFull!2981 v!346)) (size!6340 (_values!4817 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!604 (defaultEntry!4834 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!262780 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6340 (array!12656 (store (arr!5989 (_values!4817 thiss!1504)) index!297 (ValueCellFull!2981 v!346)) (size!6340 (_values!4817 thiss!1504))))))))

(assert (=> b!262780 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6341 lt!132702)))))

(declare-fun b!262781 () Bool)

(assert (=> b!262781 (= e!170269 (= (apply!261 lt!132929 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4675 thiss!1504)))))

(declare-fun b!262782 () Bool)

(assert (=> b!262782 (= e!170268 (not call!25110))))

(assert (= (and d!63125 c!44794) b!262777))

(assert (= (and d!63125 (not c!44794)) b!262779))

(assert (= (and b!262779 c!44798) b!262772))

(assert (= (and b!262779 (not c!44798)) b!262776))

(assert (= (and b!262776 c!44799) b!262766))

(assert (= (and b!262776 (not c!44799)) b!262763))

(assert (= (or b!262766 b!262763) bm!25103))

(assert (= (or b!262772 bm!25103) bm!25107))

(assert (= (or b!262772 b!262766) bm!25105))

(assert (= (or b!262777 bm!25107) bm!25104))

(assert (= (or b!262777 bm!25105) bm!25108))

(assert (= (and d!63125 res!128344) b!262768))

(assert (= (and d!63125 c!44795) b!262764))

(assert (= (and d!63125 (not c!44795)) b!262773))

(assert (= (and d!63125 res!128343) b!262774))

(assert (= (and b!262774 res!128346) b!262771))

(assert (= (and b!262774 (not res!128342)) b!262770))

(assert (= (and b!262770 res!128338) b!262780))

(assert (= (and b!262774 res!128345) b!262767))

(assert (= (and b!262767 c!44796) b!262778))

(assert (= (and b!262767 (not c!44796)) b!262769))

(assert (= (and b!262778 res!128341) b!262781))

(assert (= (or b!262778 b!262769) bm!25106))

(assert (= (and b!262767 res!128339) b!262762))

(assert (= (and b!262762 c!44797) b!262775))

(assert (= (and b!262762 (not c!44797)) b!262782))

(assert (= (and b!262775 res!128340) b!262765))

(assert (= (or b!262775 b!262782) bm!25102))

(declare-fun b_lambda!8347 () Bool)

(assert (=> (not b_lambda!8347) (not b!262780)))

(assert (=> b!262780 t!8831))

(declare-fun b_and!13947 () Bool)

(assert (= b_and!13945 (and (=> t!8831 result!5419) b_and!13947)))

(declare-fun m!278995 () Bool)

(assert (=> b!262777 m!278995))

(declare-fun m!278997 () Bool)

(assert (=> b!262764 m!278997))

(declare-fun m!278999 () Bool)

(assert (=> b!262764 m!278999))

(declare-fun m!279001 () Bool)

(assert (=> b!262764 m!279001))

(declare-fun m!279003 () Bool)

(assert (=> b!262764 m!279003))

(assert (=> b!262764 m!278997))

(declare-fun m!279005 () Bool)

(assert (=> b!262764 m!279005))

(declare-fun m!279007 () Bool)

(assert (=> b!262764 m!279007))

(declare-fun m!279009 () Bool)

(assert (=> b!262764 m!279009))

(declare-fun m!279011 () Bool)

(assert (=> b!262764 m!279011))

(declare-fun m!279013 () Bool)

(assert (=> b!262764 m!279013))

(assert (=> b!262764 m!279009))

(declare-fun m!279015 () Bool)

(assert (=> b!262764 m!279015))

(declare-fun m!279017 () Bool)

(assert (=> b!262764 m!279017))

(assert (=> b!262764 m!279017))

(declare-fun m!279019 () Bool)

(assert (=> b!262764 m!279019))

(assert (=> b!262764 m!279011))

(declare-fun m!279021 () Bool)

(assert (=> b!262764 m!279021))

(declare-fun m!279023 () Bool)

(assert (=> b!262764 m!279023))

(declare-fun m!279025 () Bool)

(assert (=> b!262764 m!279025))

(declare-fun m!279027 () Bool)

(assert (=> b!262764 m!279027))

(declare-fun m!279029 () Bool)

(assert (=> b!262764 m!279029))

(assert (=> b!262768 m!279013))

(assert (=> b!262768 m!279013))

(declare-fun m!279031 () Bool)

(assert (=> b!262768 m!279031))

(assert (=> d!63125 m!278685))

(assert (=> b!262770 m!279013))

(assert (=> b!262770 m!279013))

(declare-fun m!279033 () Bool)

(assert (=> b!262770 m!279033))

(declare-fun m!279035 () Bool)

(assert (=> b!262781 m!279035))

(declare-fun m!279037 () Bool)

(assert (=> bm!25102 m!279037))

(assert (=> b!262771 m!279013))

(assert (=> b!262771 m!279013))

(assert (=> b!262771 m!279031))

(declare-fun m!279039 () Bool)

(assert (=> b!262765 m!279039))

(declare-fun m!279041 () Bool)

(assert (=> bm!25108 m!279041))

(assert (=> bm!25104 m!279003))

(assert (=> b!262780 m!278915))

(assert (=> b!262780 m!279013))

(declare-fun m!279043 () Bool)

(assert (=> b!262780 m!279043))

(declare-fun m!279045 () Bool)

(assert (=> b!262780 m!279045))

(assert (=> b!262780 m!278915))

(declare-fun m!279047 () Bool)

(assert (=> b!262780 m!279047))

(assert (=> b!262780 m!279013))

(assert (=> b!262780 m!279045))

(declare-fun m!279049 () Bool)

(assert (=> bm!25106 m!279049))

(assert (=> b!262454 d!63125))

(declare-fun b!262783 () Bool)

(declare-fun e!170280 () (_ BitVec 32))

(assert (=> b!262783 (= e!170280 #b00000000000000000000000000000000)))

(declare-fun b!262784 () Bool)

(declare-fun e!170279 () (_ BitVec 32))

(declare-fun call!25112 () (_ BitVec 32))

(assert (=> b!262784 (= e!170279 (bvadd #b00000000000000000000000000000001 call!25112))))

(declare-fun b!262785 () Bool)

(assert (=> b!262785 (= e!170280 e!170279)))

(declare-fun c!44801 () Bool)

(assert (=> b!262785 (= c!44801 (validKeyInArray!0 (select (arr!5990 lt!132702) #b00000000000000000000000000000000)))))

(declare-fun d!63127 () Bool)

(declare-fun lt!132935 () (_ BitVec 32))

(assert (=> d!63127 (and (bvsge lt!132935 #b00000000000000000000000000000000) (bvsle lt!132935 (bvsub (size!6341 lt!132702) #b00000000000000000000000000000000)))))

(assert (=> d!63127 (= lt!132935 e!170280)))

(declare-fun c!44800 () Bool)

(assert (=> d!63127 (= c!44800 (bvsge #b00000000000000000000000000000000 (size!6341 (_keys!7024 thiss!1504))))))

(assert (=> d!63127 (and (bvsle #b00000000000000000000000000000000 (size!6341 (_keys!7024 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6341 (_keys!7024 thiss!1504)) (size!6341 lt!132702)))))

(assert (=> d!63127 (= (arrayCountValidKeys!0 lt!132702 #b00000000000000000000000000000000 (size!6341 (_keys!7024 thiss!1504))) lt!132935)))

(declare-fun b!262786 () Bool)

(assert (=> b!262786 (= e!170279 call!25112)))

(declare-fun bm!25109 () Bool)

(assert (=> bm!25109 (= call!25112 (arrayCountValidKeys!0 lt!132702 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6341 (_keys!7024 thiss!1504))))))

(assert (= (and d!63127 c!44800) b!262783))

(assert (= (and d!63127 (not c!44800)) b!262785))

(assert (= (and b!262785 c!44801) b!262784))

(assert (= (and b!262785 (not c!44801)) b!262786))

(assert (= (or b!262784 b!262786) bm!25109))

(assert (=> b!262785 m!279013))

(assert (=> b!262785 m!279013))

(assert (=> b!262785 m!279031))

(declare-fun m!279051 () Bool)

(assert (=> bm!25109 m!279051))

(assert (=> b!262454 d!63127))

(declare-fun bm!25112 () Bool)

(declare-fun call!25115 () Bool)

(declare-fun c!44804 () Bool)

(assert (=> bm!25112 (= call!25115 (arrayNoDuplicates!0 lt!132702 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44804 (Cons!3754 (select (arr!5990 lt!132702) #b00000000000000000000000000000000) Nil!3755) Nil!3755)))))

(declare-fun b!262797 () Bool)

(declare-fun e!170289 () Bool)

(assert (=> b!262797 (= e!170289 call!25115)))

(declare-fun b!262798 () Bool)

(assert (=> b!262798 (= e!170289 call!25115)))

(declare-fun d!63129 () Bool)

(declare-fun res!128355 () Bool)

(declare-fun e!170291 () Bool)

(assert (=> d!63129 (=> res!128355 e!170291)))

(assert (=> d!63129 (= res!128355 (bvsge #b00000000000000000000000000000000 (size!6341 lt!132702)))))

(assert (=> d!63129 (= (arrayNoDuplicates!0 lt!132702 #b00000000000000000000000000000000 Nil!3755) e!170291)))

(declare-fun b!262799 () Bool)

(declare-fun e!170292 () Bool)

(assert (=> b!262799 (= e!170292 e!170289)))

(assert (=> b!262799 (= c!44804 (validKeyInArray!0 (select (arr!5990 lt!132702) #b00000000000000000000000000000000)))))

(declare-fun b!262800 () Bool)

(assert (=> b!262800 (= e!170291 e!170292)))

(declare-fun res!128353 () Bool)

(assert (=> b!262800 (=> (not res!128353) (not e!170292))))

(declare-fun e!170290 () Bool)

(assert (=> b!262800 (= res!128353 (not e!170290))))

(declare-fun res!128354 () Bool)

(assert (=> b!262800 (=> (not res!128354) (not e!170290))))

(assert (=> b!262800 (= res!128354 (validKeyInArray!0 (select (arr!5990 lt!132702) #b00000000000000000000000000000000)))))

(declare-fun b!262801 () Bool)

(declare-fun contains!1884 (List!3758 (_ BitVec 64)) Bool)

(assert (=> b!262801 (= e!170290 (contains!1884 Nil!3755 (select (arr!5990 lt!132702) #b00000000000000000000000000000000)))))

(assert (= (and d!63129 (not res!128355)) b!262800))

(assert (= (and b!262800 res!128354) b!262801))

(assert (= (and b!262800 res!128353) b!262799))

(assert (= (and b!262799 c!44804) b!262798))

(assert (= (and b!262799 (not c!44804)) b!262797))

(assert (= (or b!262798 b!262797) bm!25112))

(assert (=> bm!25112 m!279013))

(declare-fun m!279053 () Bool)

(assert (=> bm!25112 m!279053))

(assert (=> b!262799 m!279013))

(assert (=> b!262799 m!279013))

(assert (=> b!262799 m!279031))

(assert (=> b!262800 m!279013))

(assert (=> b!262800 m!279013))

(assert (=> b!262800 m!279031))

(assert (=> b!262801 m!279013))

(assert (=> b!262801 m!279013))

(declare-fun m!279055 () Bool)

(assert (=> b!262801 m!279055))

(assert (=> b!262454 d!63129))

(declare-fun d!63131 () Bool)

(declare-fun res!128360 () Bool)

(declare-fun e!170301 () Bool)

(assert (=> d!63131 (=> res!128360 e!170301)))

(assert (=> d!63131 (= res!128360 (bvsge #b00000000000000000000000000000000 (size!6341 lt!132702)))))

(assert (=> d!63131 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!132702 (mask!11193 thiss!1504)) e!170301)))

(declare-fun b!262810 () Bool)

(declare-fun e!170300 () Bool)

(declare-fun call!25118 () Bool)

(assert (=> b!262810 (= e!170300 call!25118)))

(declare-fun b!262811 () Bool)

(declare-fun e!170299 () Bool)

(assert (=> b!262811 (= e!170299 call!25118)))

(declare-fun b!262812 () Bool)

(assert (=> b!262812 (= e!170301 e!170299)))

(declare-fun c!44807 () Bool)

(assert (=> b!262812 (= c!44807 (validKeyInArray!0 (select (arr!5990 lt!132702) #b00000000000000000000000000000000)))))

(declare-fun b!262813 () Bool)

(assert (=> b!262813 (= e!170299 e!170300)))

(declare-fun lt!132944 () (_ BitVec 64))

(assert (=> b!262813 (= lt!132944 (select (arr!5990 lt!132702) #b00000000000000000000000000000000))))

(declare-fun lt!132943 () Unit!8147)

(assert (=> b!262813 (= lt!132943 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!132702 lt!132944 #b00000000000000000000000000000000))))

(assert (=> b!262813 (arrayContainsKey!0 lt!132702 lt!132944 #b00000000000000000000000000000000)))

(declare-fun lt!132942 () Unit!8147)

(assert (=> b!262813 (= lt!132942 lt!132943)))

(declare-fun res!128361 () Bool)

(assert (=> b!262813 (= res!128361 (= (seekEntryOrOpen!0 (select (arr!5990 lt!132702) #b00000000000000000000000000000000) lt!132702 (mask!11193 thiss!1504)) (Found!1161 #b00000000000000000000000000000000)))))

(assert (=> b!262813 (=> (not res!128361) (not e!170300))))

(declare-fun bm!25115 () Bool)

(assert (=> bm!25115 (= call!25118 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!132702 (mask!11193 thiss!1504)))))

(assert (= (and d!63131 (not res!128360)) b!262812))

(assert (= (and b!262812 c!44807) b!262813))

(assert (= (and b!262812 (not c!44807)) b!262811))

(assert (= (and b!262813 res!128361) b!262810))

(assert (= (or b!262810 b!262811) bm!25115))

(assert (=> b!262812 m!279013))

(assert (=> b!262812 m!279013))

(assert (=> b!262812 m!279031))

(assert (=> b!262813 m!279013))

(declare-fun m!279057 () Bool)

(assert (=> b!262813 m!279057))

(declare-fun m!279059 () Bool)

(assert (=> b!262813 m!279059))

(assert (=> b!262813 m!279013))

(declare-fun m!279061 () Bool)

(assert (=> b!262813 m!279061))

(declare-fun m!279063 () Bool)

(assert (=> bm!25115 m!279063))

(assert (=> b!262454 d!63131))

(declare-fun d!63133 () Bool)

(assert (=> d!63133 (arrayContainsKey!0 lt!132702 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!132947 () Unit!8147)

(declare-fun choose!13 (array!12657 (_ BitVec 64) (_ BitVec 32)) Unit!8147)

(assert (=> d!63133 (= lt!132947 (choose!13 lt!132702 key!932 index!297))))

(assert (=> d!63133 (bvsge index!297 #b00000000000000000000000000000000)))

(assert (=> d!63133 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!132702 key!932 index!297) lt!132947)))

(declare-fun bs!9262 () Bool)

(assert (= bs!9262 d!63133))

(assert (=> bs!9262 m!278709))

(declare-fun m!279065 () Bool)

(assert (=> bs!9262 m!279065))

(assert (=> b!262454 d!63133))

(declare-fun d!63135 () Bool)

(declare-fun e!170304 () Bool)

(assert (=> d!63135 e!170304))

(declare-fun res!128364 () Bool)

(assert (=> d!63135 (=> (not res!128364) (not e!170304))))

(assert (=> d!63135 (= res!128364 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6341 (_keys!7024 thiss!1504)))))))

(declare-fun lt!132950 () Unit!8147)

(declare-fun choose!41 (array!12657 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3758) Unit!8147)

(assert (=> d!63135 (= lt!132950 (choose!41 (_keys!7024 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3755))))

(assert (=> d!63135 (bvslt (size!6341 (_keys!7024 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!63135 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!7024 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3755) lt!132950)))

(declare-fun b!262816 () Bool)

(assert (=> b!262816 (= e!170304 (arrayNoDuplicates!0 (array!12658 (store (arr!5990 (_keys!7024 thiss!1504)) index!297 key!932) (size!6341 (_keys!7024 thiss!1504))) #b00000000000000000000000000000000 Nil!3755))))

(assert (= (and d!63135 res!128364) b!262816))

(declare-fun m!279067 () Bool)

(assert (=> d!63135 m!279067))

(assert (=> b!262816 m!278715))

(declare-fun m!279069 () Bool)

(assert (=> b!262816 m!279069))

(assert (=> b!262454 d!63135))

(assert (=> b!262454 d!63103))

(declare-fun d!63137 () Bool)

(declare-fun e!170307 () Bool)

(assert (=> d!63137 e!170307))

(declare-fun res!128367 () Bool)

(assert (=> d!63137 (=> (not res!128367) (not e!170307))))

(assert (=> d!63137 (= res!128367 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6341 (_keys!7024 thiss!1504)))))))

(declare-fun lt!132953 () Unit!8147)

(declare-fun choose!102 ((_ BitVec 64) array!12657 (_ BitVec 32) (_ BitVec 32)) Unit!8147)

(assert (=> d!63137 (= lt!132953 (choose!102 key!932 (_keys!7024 thiss!1504) index!297 (mask!11193 thiss!1504)))))

(assert (=> d!63137 (validMask!0 (mask!11193 thiss!1504))))

(assert (=> d!63137 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!7024 thiss!1504) index!297 (mask!11193 thiss!1504)) lt!132953)))

(declare-fun b!262819 () Bool)

(assert (=> b!262819 (= e!170307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12658 (store (arr!5990 (_keys!7024 thiss!1504)) index!297 key!932) (size!6341 (_keys!7024 thiss!1504))) (mask!11193 thiss!1504)))))

(assert (= (and d!63137 res!128367) b!262819))

(declare-fun m!279071 () Bool)

(assert (=> d!63137 m!279071))

(assert (=> d!63137 m!278685))

(assert (=> b!262819 m!278715))

(declare-fun m!279073 () Bool)

(assert (=> b!262819 m!279073))

(assert (=> b!262454 d!63137))

(declare-fun d!63139 () Bool)

(declare-fun res!128368 () Bool)

(declare-fun e!170308 () Bool)

(assert (=> d!63139 (=> res!128368 e!170308)))

(assert (=> d!63139 (= res!128368 (= (select (arr!5990 lt!132702) #b00000000000000000000000000000000) key!932))))

(assert (=> d!63139 (= (arrayContainsKey!0 lt!132702 key!932 #b00000000000000000000000000000000) e!170308)))

(declare-fun b!262820 () Bool)

(declare-fun e!170309 () Bool)

(assert (=> b!262820 (= e!170308 e!170309)))

(declare-fun res!128369 () Bool)

(assert (=> b!262820 (=> (not res!128369) (not e!170309))))

(assert (=> b!262820 (= res!128369 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6341 lt!132702)))))

(declare-fun b!262821 () Bool)

(assert (=> b!262821 (= e!170309 (arrayContainsKey!0 lt!132702 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!63139 (not res!128368)) b!262820))

(assert (= (and b!262820 res!128369) b!262821))

(assert (=> d!63139 m!279013))

(declare-fun m!279075 () Bool)

(assert (=> b!262821 m!279075))

(assert (=> b!262454 d!63139))

(declare-fun d!63141 () Bool)

(assert (=> d!63141 (= (validMask!0 (mask!11193 thiss!1504)) (and (or (= (mask!11193 thiss!1504) #b00000000000000000000000000000111) (= (mask!11193 thiss!1504) #b00000000000000000000000000001111) (= (mask!11193 thiss!1504) #b00000000000000000000000000011111) (= (mask!11193 thiss!1504) #b00000000000000000000000000111111) (= (mask!11193 thiss!1504) #b00000000000000000000000001111111) (= (mask!11193 thiss!1504) #b00000000000000000000000011111111) (= (mask!11193 thiss!1504) #b00000000000000000000000111111111) (= (mask!11193 thiss!1504) #b00000000000000000000001111111111) (= (mask!11193 thiss!1504) #b00000000000000000000011111111111) (= (mask!11193 thiss!1504) #b00000000000000000000111111111111) (= (mask!11193 thiss!1504) #b00000000000000000001111111111111) (= (mask!11193 thiss!1504) #b00000000000000000011111111111111) (= (mask!11193 thiss!1504) #b00000000000000000111111111111111) (= (mask!11193 thiss!1504) #b00000000000000001111111111111111) (= (mask!11193 thiss!1504) #b00000000000000011111111111111111) (= (mask!11193 thiss!1504) #b00000000000000111111111111111111) (= (mask!11193 thiss!1504) #b00000000000001111111111111111111) (= (mask!11193 thiss!1504) #b00000000000011111111111111111111) (= (mask!11193 thiss!1504) #b00000000000111111111111111111111) (= (mask!11193 thiss!1504) #b00000000001111111111111111111111) (= (mask!11193 thiss!1504) #b00000000011111111111111111111111) (= (mask!11193 thiss!1504) #b00000000111111111111111111111111) (= (mask!11193 thiss!1504) #b00000001111111111111111111111111) (= (mask!11193 thiss!1504) #b00000011111111111111111111111111) (= (mask!11193 thiss!1504) #b00000111111111111111111111111111) (= (mask!11193 thiss!1504) #b00001111111111111111111111111111) (= (mask!11193 thiss!1504) #b00011111111111111111111111111111) (= (mask!11193 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!11193 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!262454 d!63141))

(declare-fun b!262838 () Bool)

(declare-fun res!128378 () Bool)

(declare-fun e!170318 () Bool)

(assert (=> b!262838 (=> (not res!128378) (not e!170318))))

(declare-fun call!25124 () Bool)

(assert (=> b!262838 (= res!128378 call!25124)))

(declare-fun e!170320 () Bool)

(assert (=> b!262838 (= e!170320 e!170318)))

(declare-fun b!262839 () Bool)

(declare-fun lt!132959 () SeekEntryResult!1161)

(assert (=> b!262839 (and (bvsge (index!6814 lt!132959) #b00000000000000000000000000000000) (bvslt (index!6814 lt!132959) (size!6341 (_keys!7024 thiss!1504))))))

(declare-fun res!128379 () Bool)

(assert (=> b!262839 (= res!128379 (= (select (arr!5990 (_keys!7024 thiss!1504)) (index!6814 lt!132959)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!170321 () Bool)

(assert (=> b!262839 (=> (not res!128379) (not e!170321))))

(declare-fun d!63143 () Bool)

(declare-fun e!170319 () Bool)

(assert (=> d!63143 e!170319))

(declare-fun c!44812 () Bool)

(assert (=> d!63143 (= c!44812 ((_ is MissingZero!1161) lt!132959))))

(assert (=> d!63143 (= lt!132959 (seekEntryOrOpen!0 key!932 (_keys!7024 thiss!1504) (mask!11193 thiss!1504)))))

(declare-fun lt!132958 () Unit!8147)

(declare-fun choose!1294 (array!12657 array!12655 (_ BitVec 32) (_ BitVec 32) V!8513 V!8513 (_ BitVec 64) Int) Unit!8147)

(assert (=> d!63143 (= lt!132958 (choose!1294 (_keys!7024 thiss!1504) (_values!4817 thiss!1504) (mask!11193 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) key!932 (defaultEntry!4834 thiss!1504)))))

(assert (=> d!63143 (validMask!0 (mask!11193 thiss!1504))))

(assert (=> d!63143 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!439 (_keys!7024 thiss!1504) (_values!4817 thiss!1504) (mask!11193 thiss!1504) (extraKeys!4571 thiss!1504) (zeroValue!4675 thiss!1504) (minValue!4675 thiss!1504) key!932 (defaultEntry!4834 thiss!1504)) lt!132958)))

(declare-fun b!262840 () Bool)

(declare-fun res!128381 () Bool)

(assert (=> b!262840 (=> (not res!128381) (not e!170318))))

(assert (=> b!262840 (= res!128381 (= (select (arr!5990 (_keys!7024 thiss!1504)) (index!6817 lt!132959)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!262840 (and (bvsge (index!6817 lt!132959) #b00000000000000000000000000000000) (bvslt (index!6817 lt!132959) (size!6341 (_keys!7024 thiss!1504))))))

(declare-fun bm!25120 () Bool)

(assert (=> bm!25120 (= call!25124 (inRange!0 (ite c!44812 (index!6814 lt!132959) (index!6817 lt!132959)) (mask!11193 thiss!1504)))))

(declare-fun b!262841 () Bool)

(declare-fun call!25123 () Bool)

(assert (=> b!262841 (= e!170321 (not call!25123))))

(declare-fun b!262842 () Bool)

(assert (=> b!262842 (= e!170320 ((_ is Undefined!1161) lt!132959))))

(declare-fun b!262843 () Bool)

(assert (=> b!262843 (= e!170319 e!170321)))

(declare-fun res!128380 () Bool)

(assert (=> b!262843 (= res!128380 call!25124)))

(assert (=> b!262843 (=> (not res!128380) (not e!170321))))

(declare-fun b!262844 () Bool)

(assert (=> b!262844 (= e!170318 (not call!25123))))

(declare-fun b!262845 () Bool)

(assert (=> b!262845 (= e!170319 e!170320)))

(declare-fun c!44813 () Bool)

(assert (=> b!262845 (= c!44813 ((_ is MissingVacant!1161) lt!132959))))

(declare-fun bm!25121 () Bool)

(assert (=> bm!25121 (= call!25123 (arrayContainsKey!0 (_keys!7024 thiss!1504) key!932 #b00000000000000000000000000000000))))

(assert (= (and d!63143 c!44812) b!262843))

(assert (= (and d!63143 (not c!44812)) b!262845))

(assert (= (and b!262843 res!128380) b!262839))

(assert (= (and b!262839 res!128379) b!262841))

(assert (= (and b!262845 c!44813) b!262838))

(assert (= (and b!262845 (not c!44813)) b!262842))

(assert (= (and b!262838 res!128378) b!262840))

(assert (= (and b!262840 res!128381) b!262844))

(assert (= (or b!262843 b!262838) bm!25120))

(assert (= (or b!262841 b!262844) bm!25121))

(declare-fun m!279077 () Bool)

(assert (=> b!262839 m!279077))

(declare-fun m!279079 () Bool)

(assert (=> b!262840 m!279079))

(declare-fun m!279081 () Bool)

(assert (=> bm!25120 m!279081))

(assert (=> d!63143 m!278677))

(declare-fun m!279083 () Bool)

(assert (=> d!63143 m!279083))

(assert (=> d!63143 m!278685))

(assert (=> bm!25121 m!278667))

(assert (=> b!262470 d!63143))

(declare-fun d!63145 () Bool)

(assert (=> d!63145 (= (inRange!0 (ite c!44731 (index!6814 lt!132704) (index!6817 lt!132704)) (mask!11193 thiss!1504)) (and (bvsge (ite c!44731 (index!6814 lt!132704) (index!6817 lt!132704)) #b00000000000000000000000000000000) (bvslt (ite c!44731 (index!6814 lt!132704) (index!6817 lt!132704)) (bvadd (mask!11193 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!25064 d!63145))

(declare-fun d!63147 () Bool)

(assert (=> d!63147 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!262460 d!63147))

(declare-fun b!262853 () Bool)

(declare-fun e!170326 () Bool)

(assert (=> b!262853 (= e!170326 tp_is_empty!6649)))

(declare-fun mapNonEmpty!11344 () Bool)

(declare-fun mapRes!11344 () Bool)

(declare-fun tp!23710 () Bool)

(declare-fun e!170327 () Bool)

(assert (=> mapNonEmpty!11344 (= mapRes!11344 (and tp!23710 e!170327))))

(declare-fun mapRest!11344 () (Array (_ BitVec 32) ValueCell!2981))

(declare-fun mapValue!11344 () ValueCell!2981)

(declare-fun mapKey!11344 () (_ BitVec 32))

(assert (=> mapNonEmpty!11344 (= mapRest!11335 (store mapRest!11344 mapKey!11344 mapValue!11344))))

(declare-fun b!262852 () Bool)

(assert (=> b!262852 (= e!170327 tp_is_empty!6649)))

(declare-fun mapIsEmpty!11344 () Bool)

(assert (=> mapIsEmpty!11344 mapRes!11344))

(declare-fun condMapEmpty!11344 () Bool)

(declare-fun mapDefault!11344 () ValueCell!2981)

(assert (=> mapNonEmpty!11335 (= condMapEmpty!11344 (= mapRest!11335 ((as const (Array (_ BitVec 32) ValueCell!2981)) mapDefault!11344)))))

(assert (=> mapNonEmpty!11335 (= tp!23694 (and e!170326 mapRes!11344))))

(assert (= (and mapNonEmpty!11335 condMapEmpty!11344) mapIsEmpty!11344))

(assert (= (and mapNonEmpty!11335 (not condMapEmpty!11344)) mapNonEmpty!11344))

(assert (= (and mapNonEmpty!11344 ((_ is ValueCellFull!2981) mapValue!11344)) b!262852))

(assert (= (and mapNonEmpty!11335 ((_ is ValueCellFull!2981) mapDefault!11344)) b!262853))

(declare-fun m!279085 () Bool)

(assert (=> mapNonEmpty!11344 m!279085))

(declare-fun b_lambda!8349 () Bool)

(assert (= b_lambda!8345 (or (and b!262469 b_free!6787) b_lambda!8349)))

(declare-fun b_lambda!8351 () Bool)

(assert (= b_lambda!8347 (or (and b!262469 b_free!6787) b_lambda!8351)))

(check-sat (not b!262800) (not bm!25101) (not b!262676) (not b!262812) (not b!262675) (not b!262756) (not b!262816) (not b!262764) (not b!262813) (not b!262730) (not bm!25102) (not b!262777) (not b!262770) (not b!262727) (not b_next!6787) (not b_lambda!8349) (not bm!25109) (not bm!25115) (not d!63119) (not b!262665) (not bm!25108) (not d!63135) (not b!262799) (not bm!25120) (not b!262718) (not mapNonEmpty!11344) (not b!262760) (not d!63107) (not bm!25093) (not b_lambda!8351) (not b!262666) (not b!262819) (not b!262663) (not b!262780) (not bm!25112) (not bm!25097) (not bm!25091) (not b!262785) (not d!63113) (not d!63137) (not b!262765) (not bm!25121) (not b!262781) (not bm!25095) (not d!63133) (not d!63097) (not b!262672) (not b!262709) (not b!262771) (not bm!25100) (not b!262747) (not b!262716) (not b!262702) (not b!262736) (not b!262717) (not d!63105) (not b!262660) (not b!262697) (not b!262659) (not b!262735) (not d!63125) (not d!63121) (not b!262751) (not d!63101) (not b!262614) (not b!262821) (not b!262768) (not d!63115) (not bm!25106) (not b!262728) (not d!63095) (not bm!25104) (not d!63099) b_and!13947 (not d!63143) (not b!262801) (not b!262612) tp_is_empty!6649)
(check-sat b_and!13947 (not b_next!6787))
