; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19762 () Bool)

(assert start!19762)

(declare-fun b!193670 () Bool)

(declare-fun b_free!4713 () Bool)

(declare-fun b_next!4713 () Bool)

(assert (=> b!193670 (= b_free!4713 (not b_next!4713))))

(declare-fun tp!17005 () Bool)

(declare-fun b_and!11423 () Bool)

(assert (=> b!193670 (= tp!17005 b_and!11423)))

(declare-fun b!193666 () Bool)

(declare-fun res!91529 () Bool)

(declare-fun e!127420 () Bool)

(assert (=> b!193666 (=> res!91529 e!127420)))

(declare-datatypes ((V!5627 0))(
  ( (V!5628 (val!2287 Int)) )
))
(declare-datatypes ((ValueCell!1899 0))(
  ( (ValueCellFull!1899 (v!4246 V!5627)) (EmptyCell!1899) )
))
(declare-datatypes ((array!8219 0))(
  ( (array!8220 (arr!3869 (Array (_ BitVec 32) (_ BitVec 64))) (size!4193 (_ BitVec 32))) )
))
(declare-datatypes ((array!8221 0))(
  ( (array!8222 (arr!3870 (Array (_ BitVec 32) ValueCell!1899)) (size!4194 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2706 0))(
  ( (LongMapFixedSize!2707 (defaultEntry!3953 Int) (mask!9210 (_ BitVec 32)) (extraKeys!3690 (_ BitVec 32)) (zeroValue!3794 V!5627) (minValue!3794 V!5627) (_size!1402 (_ BitVec 32)) (_keys!5945 array!8219) (_values!3936 array!8221) (_vacant!1402 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2706)

(assert (=> b!193666 (= res!91529 (or (not (= (size!4194 (_values!3936 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9210 thiss!1248)))) (not (= (size!4193 (_keys!5945 thiss!1248)) (size!4194 (_values!3936 thiss!1248)))) (bvslt (mask!9210 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3690 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3690 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!193667 () Bool)

(declare-fun res!91533 () Bool)

(assert (=> b!193667 (=> res!91533 e!127420)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8219 (_ BitVec 32)) Bool)

(assert (=> b!193667 (= res!91533 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5945 thiss!1248) (mask!9210 thiss!1248))))))

(declare-fun res!91530 () Bool)

(declare-fun e!127425 () Bool)

(assert (=> start!19762 (=> (not res!91530) (not e!127425))))

(declare-fun valid!1110 (LongMapFixedSize!2706) Bool)

(assert (=> start!19762 (= res!91530 (valid!1110 thiss!1248))))

(assert (=> start!19762 e!127425))

(declare-fun e!127419 () Bool)

(assert (=> start!19762 e!127419))

(assert (=> start!19762 true))

(declare-fun tp_is_empty!4485 () Bool)

(assert (=> start!19762 tp_is_empty!4485))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!691 0))(
  ( (MissingZero!691 (index!4934 (_ BitVec 32))) (Found!691 (index!4935 (_ BitVec 32))) (Intermediate!691 (undefined!1503 Bool) (index!4936 (_ BitVec 32)) (x!20669 (_ BitVec 32))) (Undefined!691) (MissingVacant!691 (index!4937 (_ BitVec 32))) )
))
(declare-fun lt!96437 () SeekEntryResult!691)

(declare-fun e!127421 () Bool)

(declare-fun b!193668 () Bool)

(assert (=> b!193668 (= e!127421 (= (select (arr!3869 (_keys!5945 thiss!1248)) (index!4935 lt!96437)) key!828))))

(declare-fun b!193669 () Bool)

(declare-fun res!91531 () Bool)

(assert (=> b!193669 (=> res!91531 e!127420)))

(declare-datatypes ((List!2445 0))(
  ( (Nil!2442) (Cons!2441 (h!3082 (_ BitVec 64)) (t!7369 List!2445)) )
))
(declare-fun arrayNoDuplicates!0 (array!8219 (_ BitVec 32) List!2445) Bool)

(assert (=> b!193669 (= res!91531 (not (arrayNoDuplicates!0 (_keys!5945 thiss!1248) #b00000000000000000000000000000000 Nil!2442)))))

(declare-fun e!127428 () Bool)

(declare-fun array_inv!2511 (array!8219) Bool)

(declare-fun array_inv!2512 (array!8221) Bool)

(assert (=> b!193670 (= e!127419 (and tp!17005 tp_is_empty!4485 (array_inv!2511 (_keys!5945 thiss!1248)) (array_inv!2512 (_values!3936 thiss!1248)) e!127428))))

(declare-fun b!193671 () Bool)

(declare-fun e!127424 () Bool)

(assert (=> b!193671 (= e!127424 tp_is_empty!4485)))

(declare-fun b!193672 () Bool)

(declare-fun e!127422 () Bool)

(assert (=> b!193672 (= e!127422 tp_is_empty!4485)))

(declare-fun mapNonEmpty!7757 () Bool)

(declare-fun mapRes!7757 () Bool)

(declare-fun tp!17006 () Bool)

(assert (=> mapNonEmpty!7757 (= mapRes!7757 (and tp!17006 e!127424))))

(declare-fun mapRest!7757 () (Array (_ BitVec 32) ValueCell!1899))

(declare-fun mapKey!7757 () (_ BitVec 32))

(declare-fun mapValue!7757 () ValueCell!1899)

(assert (=> mapNonEmpty!7757 (= (arr!3870 (_values!3936 thiss!1248)) (store mapRest!7757 mapKey!7757 mapValue!7757))))

(declare-fun b!193673 () Bool)

(assert (=> b!193673 (= e!127428 (and e!127422 mapRes!7757))))

(declare-fun condMapEmpty!7757 () Bool)

(declare-fun mapDefault!7757 () ValueCell!1899)

(assert (=> b!193673 (= condMapEmpty!7757 (= (arr!3870 (_values!3936 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1899)) mapDefault!7757)))))

(declare-fun b!193674 () Bool)

(declare-fun res!91532 () Bool)

(assert (=> b!193674 (=> (not res!91532) (not e!127425))))

(assert (=> b!193674 (= res!91532 (not (= key!828 (bvneg key!828))))))

(declare-fun b!193675 () Bool)

(declare-datatypes ((Unit!5867 0))(
  ( (Unit!5868) )
))
(declare-fun e!127423 () Unit!5867)

(declare-fun lt!96435 () Unit!5867)

(assert (=> b!193675 (= e!127423 lt!96435)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!184 (array!8219 array!8221 (_ BitVec 32) (_ BitVec 32) V!5627 V!5627 (_ BitVec 64) Int) Unit!5867)

(assert (=> b!193675 (= lt!96435 (lemmaInListMapThenSeekEntryOrOpenFindsIt!184 (_keys!5945 thiss!1248) (_values!3936 thiss!1248) (mask!9210 thiss!1248) (extraKeys!3690 thiss!1248) (zeroValue!3794 thiss!1248) (minValue!3794 thiss!1248) key!828 (defaultEntry!3953 thiss!1248)))))

(declare-fun res!91527 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!193675 (= res!91527 (inRange!0 (index!4935 lt!96437) (mask!9210 thiss!1248)))))

(assert (=> b!193675 (=> (not res!91527) (not e!127421))))

(assert (=> b!193675 e!127421))

(declare-fun b!193676 () Bool)

(declare-fun e!127426 () Bool)

(assert (=> b!193676 (= e!127426 (not e!127420))))

(declare-fun res!91534 () Bool)

(assert (=> b!193676 (=> res!91534 e!127420)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!193676 (= res!91534 (not (validMask!0 (mask!9210 thiss!1248))))))

(declare-datatypes ((tuple2!3554 0))(
  ( (tuple2!3555 (_1!1788 (_ BitVec 64)) (_2!1788 V!5627)) )
))
(declare-datatypes ((List!2446 0))(
  ( (Nil!2443) (Cons!2442 (h!3083 tuple2!3554) (t!7370 List!2446)) )
))
(declare-datatypes ((ListLongMap!2471 0))(
  ( (ListLongMap!2472 (toList!1251 List!2446)) )
))
(declare-fun lt!96438 () ListLongMap!2471)

(declare-fun v!309 () V!5627)

(declare-fun +!319 (ListLongMap!2471 tuple2!3554) ListLongMap!2471)

(declare-fun getCurrentListMap!899 (array!8219 array!8221 (_ BitVec 32) (_ BitVec 32) V!5627 V!5627 (_ BitVec 32) Int) ListLongMap!2471)

(assert (=> b!193676 (= (+!319 lt!96438 (tuple2!3555 key!828 v!309)) (getCurrentListMap!899 (_keys!5945 thiss!1248) (array!8222 (store (arr!3870 (_values!3936 thiss!1248)) (index!4935 lt!96437) (ValueCellFull!1899 v!309)) (size!4194 (_values!3936 thiss!1248))) (mask!9210 thiss!1248) (extraKeys!3690 thiss!1248) (zeroValue!3794 thiss!1248) (minValue!3794 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3953 thiss!1248)))))

(declare-fun lt!96439 () Unit!5867)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!120 (array!8219 array!8221 (_ BitVec 32) (_ BitVec 32) V!5627 V!5627 (_ BitVec 32) (_ BitVec 64) V!5627 Int) Unit!5867)

(assert (=> b!193676 (= lt!96439 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!120 (_keys!5945 thiss!1248) (_values!3936 thiss!1248) (mask!9210 thiss!1248) (extraKeys!3690 thiss!1248) (zeroValue!3794 thiss!1248) (minValue!3794 thiss!1248) (index!4935 lt!96437) key!828 v!309 (defaultEntry!3953 thiss!1248)))))

(declare-fun lt!96440 () Unit!5867)

(assert (=> b!193676 (= lt!96440 e!127423)))

(declare-fun c!34925 () Bool)

(declare-fun contains!1374 (ListLongMap!2471 (_ BitVec 64)) Bool)

(assert (=> b!193676 (= c!34925 (contains!1374 lt!96438 key!828))))

(assert (=> b!193676 (= lt!96438 (getCurrentListMap!899 (_keys!5945 thiss!1248) (_values!3936 thiss!1248) (mask!9210 thiss!1248) (extraKeys!3690 thiss!1248) (zeroValue!3794 thiss!1248) (minValue!3794 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3953 thiss!1248)))))

(declare-fun b!193677 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!193677 (= e!127420 (validKeyInArray!0 (select (arr!3869 (_keys!5945 thiss!1248)) (index!4935 lt!96437))))))

(declare-fun b!193678 () Bool)

(declare-fun Unit!5869 () Unit!5867)

(assert (=> b!193678 (= e!127423 Unit!5869)))

(declare-fun lt!96436 () Unit!5867)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!194 (array!8219 array!8221 (_ BitVec 32) (_ BitVec 32) V!5627 V!5627 (_ BitVec 64) Int) Unit!5867)

(assert (=> b!193678 (= lt!96436 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!194 (_keys!5945 thiss!1248) (_values!3936 thiss!1248) (mask!9210 thiss!1248) (extraKeys!3690 thiss!1248) (zeroValue!3794 thiss!1248) (minValue!3794 thiss!1248) key!828 (defaultEntry!3953 thiss!1248)))))

(assert (=> b!193678 false))

(declare-fun mapIsEmpty!7757 () Bool)

(assert (=> mapIsEmpty!7757 mapRes!7757))

(declare-fun b!193679 () Bool)

(declare-fun res!91528 () Bool)

(assert (=> b!193679 (=> res!91528 e!127420)))

(assert (=> b!193679 (= res!91528 (or (bvslt (index!4935 lt!96437) #b00000000000000000000000000000000) (bvsge (index!4935 lt!96437) (size!4193 (_keys!5945 thiss!1248)))))))

(declare-fun b!193680 () Bool)

(assert (=> b!193680 (= e!127425 e!127426)))

(declare-fun res!91526 () Bool)

(assert (=> b!193680 (=> (not res!91526) (not e!127426))))

(get-info :version)

(assert (=> b!193680 (= res!91526 (and (not ((_ is Undefined!691) lt!96437)) (not ((_ is MissingVacant!691) lt!96437)) (not ((_ is MissingZero!691) lt!96437)) ((_ is Found!691) lt!96437)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8219 (_ BitVec 32)) SeekEntryResult!691)

(assert (=> b!193680 (= lt!96437 (seekEntryOrOpen!0 key!828 (_keys!5945 thiss!1248) (mask!9210 thiss!1248)))))

(assert (= (and start!19762 res!91530) b!193674))

(assert (= (and b!193674 res!91532) b!193680))

(assert (= (and b!193680 res!91526) b!193676))

(assert (= (and b!193676 c!34925) b!193675))

(assert (= (and b!193676 (not c!34925)) b!193678))

(assert (= (and b!193675 res!91527) b!193668))

(assert (= (and b!193676 (not res!91534)) b!193666))

(assert (= (and b!193666 (not res!91529)) b!193667))

(assert (= (and b!193667 (not res!91533)) b!193669))

(assert (= (and b!193669 (not res!91531)) b!193679))

(assert (= (and b!193679 (not res!91528)) b!193677))

(assert (= (and b!193673 condMapEmpty!7757) mapIsEmpty!7757))

(assert (= (and b!193673 (not condMapEmpty!7757)) mapNonEmpty!7757))

(assert (= (and mapNonEmpty!7757 ((_ is ValueCellFull!1899) mapValue!7757)) b!193671))

(assert (= (and b!193673 ((_ is ValueCellFull!1899) mapDefault!7757)) b!193672))

(assert (= b!193670 b!193673))

(assert (= start!19762 b!193670))

(declare-fun m!220427 () Bool)

(assert (=> b!193677 m!220427))

(assert (=> b!193677 m!220427))

(declare-fun m!220429 () Bool)

(assert (=> b!193677 m!220429))

(assert (=> b!193668 m!220427))

(declare-fun m!220431 () Bool)

(assert (=> b!193669 m!220431))

(declare-fun m!220433 () Bool)

(assert (=> b!193680 m!220433))

(declare-fun m!220435 () Bool)

(assert (=> b!193675 m!220435))

(declare-fun m!220437 () Bool)

(assert (=> b!193675 m!220437))

(declare-fun m!220439 () Bool)

(assert (=> start!19762 m!220439))

(declare-fun m!220441 () Bool)

(assert (=> b!193667 m!220441))

(declare-fun m!220443 () Bool)

(assert (=> b!193670 m!220443))

(declare-fun m!220445 () Bool)

(assert (=> b!193670 m!220445))

(declare-fun m!220447 () Bool)

(assert (=> b!193676 m!220447))

(declare-fun m!220449 () Bool)

(assert (=> b!193676 m!220449))

(declare-fun m!220451 () Bool)

(assert (=> b!193676 m!220451))

(declare-fun m!220453 () Bool)

(assert (=> b!193676 m!220453))

(declare-fun m!220455 () Bool)

(assert (=> b!193676 m!220455))

(declare-fun m!220457 () Bool)

(assert (=> b!193676 m!220457))

(declare-fun m!220459 () Bool)

(assert (=> b!193676 m!220459))

(declare-fun m!220461 () Bool)

(assert (=> b!193678 m!220461))

(declare-fun m!220463 () Bool)

(assert (=> mapNonEmpty!7757 m!220463))

(check-sat (not b!193667) (not b!193677) tp_is_empty!4485 (not b!193669) (not b_next!4713) (not b!193670) (not b!193675) (not mapNonEmpty!7757) (not b!193680) b_and!11423 (not b!193678) (not b!193676) (not start!19762))
(check-sat b_and!11423 (not b_next!4713))
(get-model)

(declare-fun b!193742 () Bool)

(declare-fun lt!96463 () SeekEntryResult!691)

(assert (=> b!193742 (and (bvsge (index!4934 lt!96463) #b00000000000000000000000000000000) (bvslt (index!4934 lt!96463) (size!4193 (_keys!5945 thiss!1248))))))

(declare-fun res!91571 () Bool)

(assert (=> b!193742 (= res!91571 (= (select (arr!3869 (_keys!5945 thiss!1248)) (index!4934 lt!96463)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!127468 () Bool)

(assert (=> b!193742 (=> (not res!91571) (not e!127468))))

(declare-fun c!34933 () Bool)

(declare-fun call!19575 () Bool)

(declare-fun bm!19571 () Bool)

(assert (=> bm!19571 (= call!19575 (inRange!0 (ite c!34933 (index!4934 lt!96463) (index!4937 lt!96463)) (mask!9210 thiss!1248)))))

(declare-fun b!193743 () Bool)

(declare-fun e!127467 () Bool)

(declare-fun e!127469 () Bool)

(assert (=> b!193743 (= e!127467 e!127469)))

(declare-fun c!34934 () Bool)

(assert (=> b!193743 (= c!34934 ((_ is MissingVacant!691) lt!96463))))

(declare-fun b!193744 () Bool)

(declare-fun e!127470 () Bool)

(declare-fun call!19574 () Bool)

(assert (=> b!193744 (= e!127470 (not call!19574))))

(declare-fun b!193745 () Bool)

(assert (=> b!193745 (= e!127467 e!127468)))

(declare-fun res!91570 () Bool)

(assert (=> b!193745 (= res!91570 call!19575)))

(assert (=> b!193745 (=> (not res!91570) (not e!127468))))

(declare-fun b!193746 () Bool)

(assert (=> b!193746 (= e!127469 ((_ is Undefined!691) lt!96463))))

(declare-fun d!56605 () Bool)

(assert (=> d!56605 e!127467))

(assert (=> d!56605 (= c!34933 ((_ is MissingZero!691) lt!96463))))

(assert (=> d!56605 (= lt!96463 (seekEntryOrOpen!0 key!828 (_keys!5945 thiss!1248) (mask!9210 thiss!1248)))))

(declare-fun lt!96464 () Unit!5867)

(declare-fun choose!1060 (array!8219 array!8221 (_ BitVec 32) (_ BitVec 32) V!5627 V!5627 (_ BitVec 64) Int) Unit!5867)

(assert (=> d!56605 (= lt!96464 (choose!1060 (_keys!5945 thiss!1248) (_values!3936 thiss!1248) (mask!9210 thiss!1248) (extraKeys!3690 thiss!1248) (zeroValue!3794 thiss!1248) (minValue!3794 thiss!1248) key!828 (defaultEntry!3953 thiss!1248)))))

(assert (=> d!56605 (validMask!0 (mask!9210 thiss!1248))))

(assert (=> d!56605 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!194 (_keys!5945 thiss!1248) (_values!3936 thiss!1248) (mask!9210 thiss!1248) (extraKeys!3690 thiss!1248) (zeroValue!3794 thiss!1248) (minValue!3794 thiss!1248) key!828 (defaultEntry!3953 thiss!1248)) lt!96464)))

(declare-fun b!193747 () Bool)

(declare-fun res!91573 () Bool)

(assert (=> b!193747 (=> (not res!91573) (not e!127470))))

(assert (=> b!193747 (= res!91573 call!19575)))

(assert (=> b!193747 (= e!127469 e!127470)))

(declare-fun b!193748 () Bool)

(assert (=> b!193748 (= e!127468 (not call!19574))))

(declare-fun b!193749 () Bool)

(declare-fun res!91572 () Bool)

(assert (=> b!193749 (=> (not res!91572) (not e!127470))))

(assert (=> b!193749 (= res!91572 (= (select (arr!3869 (_keys!5945 thiss!1248)) (index!4937 lt!96463)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!193749 (and (bvsge (index!4937 lt!96463) #b00000000000000000000000000000000) (bvslt (index!4937 lt!96463) (size!4193 (_keys!5945 thiss!1248))))))

(declare-fun bm!19572 () Bool)

(declare-fun arrayContainsKey!0 (array!8219 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!19572 (= call!19574 (arrayContainsKey!0 (_keys!5945 thiss!1248) key!828 #b00000000000000000000000000000000))))

(assert (= (and d!56605 c!34933) b!193745))

(assert (= (and d!56605 (not c!34933)) b!193743))

(assert (= (and b!193745 res!91570) b!193742))

(assert (= (and b!193742 res!91571) b!193748))

(assert (= (and b!193743 c!34934) b!193747))

(assert (= (and b!193743 (not c!34934)) b!193746))

(assert (= (and b!193747 res!91573) b!193749))

(assert (= (and b!193749 res!91572) b!193744))

(assert (= (or b!193745 b!193747) bm!19571))

(assert (= (or b!193748 b!193744) bm!19572))

(declare-fun m!220503 () Bool)

(assert (=> bm!19572 m!220503))

(declare-fun m!220505 () Bool)

(assert (=> bm!19571 m!220505))

(declare-fun m!220507 () Bool)

(assert (=> b!193742 m!220507))

(assert (=> d!56605 m!220433))

(declare-fun m!220509 () Bool)

(assert (=> d!56605 m!220509))

(assert (=> d!56605 m!220457))

(declare-fun m!220511 () Bool)

(assert (=> b!193749 m!220511))

(assert (=> b!193678 d!56605))

(declare-fun b!193758 () Bool)

(declare-fun e!127478 () Bool)

(declare-fun e!127477 () Bool)

(assert (=> b!193758 (= e!127478 e!127477)))

(declare-fun c!34937 () Bool)

(assert (=> b!193758 (= c!34937 (validKeyInArray!0 (select (arr!3869 (_keys!5945 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193759 () Bool)

(declare-fun e!127479 () Bool)

(assert (=> b!193759 (= e!127477 e!127479)))

(declare-fun lt!96473 () (_ BitVec 64))

(assert (=> b!193759 (= lt!96473 (select (arr!3869 (_keys!5945 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96471 () Unit!5867)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8219 (_ BitVec 64) (_ BitVec 32)) Unit!5867)

(assert (=> b!193759 (= lt!96471 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5945 thiss!1248) lt!96473 #b00000000000000000000000000000000))))

(assert (=> b!193759 (arrayContainsKey!0 (_keys!5945 thiss!1248) lt!96473 #b00000000000000000000000000000000)))

(declare-fun lt!96472 () Unit!5867)

(assert (=> b!193759 (= lt!96472 lt!96471)))

(declare-fun res!91579 () Bool)

(assert (=> b!193759 (= res!91579 (= (seekEntryOrOpen!0 (select (arr!3869 (_keys!5945 thiss!1248)) #b00000000000000000000000000000000) (_keys!5945 thiss!1248) (mask!9210 thiss!1248)) (Found!691 #b00000000000000000000000000000000)))))

(assert (=> b!193759 (=> (not res!91579) (not e!127479))))

(declare-fun b!193760 () Bool)

(declare-fun call!19578 () Bool)

(assert (=> b!193760 (= e!127477 call!19578)))

(declare-fun b!193761 () Bool)

(assert (=> b!193761 (= e!127479 call!19578)))

(declare-fun bm!19575 () Bool)

(assert (=> bm!19575 (= call!19578 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5945 thiss!1248) (mask!9210 thiss!1248)))))

(declare-fun d!56607 () Bool)

(declare-fun res!91578 () Bool)

(assert (=> d!56607 (=> res!91578 e!127478)))

(assert (=> d!56607 (= res!91578 (bvsge #b00000000000000000000000000000000 (size!4193 (_keys!5945 thiss!1248))))))

(assert (=> d!56607 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5945 thiss!1248) (mask!9210 thiss!1248)) e!127478)))

(assert (= (and d!56607 (not res!91578)) b!193758))

(assert (= (and b!193758 c!34937) b!193759))

(assert (= (and b!193758 (not c!34937)) b!193760))

(assert (= (and b!193759 res!91579) b!193761))

(assert (= (or b!193761 b!193760) bm!19575))

(declare-fun m!220513 () Bool)

(assert (=> b!193758 m!220513))

(assert (=> b!193758 m!220513))

(declare-fun m!220515 () Bool)

(assert (=> b!193758 m!220515))

(assert (=> b!193759 m!220513))

(declare-fun m!220517 () Bool)

(assert (=> b!193759 m!220517))

(declare-fun m!220519 () Bool)

(assert (=> b!193759 m!220519))

(assert (=> b!193759 m!220513))

(declare-fun m!220521 () Bool)

(assert (=> b!193759 m!220521))

(declare-fun m!220523 () Bool)

(assert (=> bm!19575 m!220523))

(assert (=> b!193667 d!56607))

(declare-fun d!56609 () Bool)

(assert (=> d!56609 (= (validKeyInArray!0 (select (arr!3869 (_keys!5945 thiss!1248)) (index!4935 lt!96437))) (and (not (= (select (arr!3869 (_keys!5945 thiss!1248)) (index!4935 lt!96437)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3869 (_keys!5945 thiss!1248)) (index!4935 lt!96437)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!193677 d!56609))

(declare-fun d!56611 () Bool)

(assert (=> d!56611 (= (validMask!0 (mask!9210 thiss!1248)) (and (or (= (mask!9210 thiss!1248) #b00000000000000000000000000000111) (= (mask!9210 thiss!1248) #b00000000000000000000000000001111) (= (mask!9210 thiss!1248) #b00000000000000000000000000011111) (= (mask!9210 thiss!1248) #b00000000000000000000000000111111) (= (mask!9210 thiss!1248) #b00000000000000000000000001111111) (= (mask!9210 thiss!1248) #b00000000000000000000000011111111) (= (mask!9210 thiss!1248) #b00000000000000000000000111111111) (= (mask!9210 thiss!1248) #b00000000000000000000001111111111) (= (mask!9210 thiss!1248) #b00000000000000000000011111111111) (= (mask!9210 thiss!1248) #b00000000000000000000111111111111) (= (mask!9210 thiss!1248) #b00000000000000000001111111111111) (= (mask!9210 thiss!1248) #b00000000000000000011111111111111) (= (mask!9210 thiss!1248) #b00000000000000000111111111111111) (= (mask!9210 thiss!1248) #b00000000000000001111111111111111) (= (mask!9210 thiss!1248) #b00000000000000011111111111111111) (= (mask!9210 thiss!1248) #b00000000000000111111111111111111) (= (mask!9210 thiss!1248) #b00000000000001111111111111111111) (= (mask!9210 thiss!1248) #b00000000000011111111111111111111) (= (mask!9210 thiss!1248) #b00000000000111111111111111111111) (= (mask!9210 thiss!1248) #b00000000001111111111111111111111) (= (mask!9210 thiss!1248) #b00000000011111111111111111111111) (= (mask!9210 thiss!1248) #b00000000111111111111111111111111) (= (mask!9210 thiss!1248) #b00000001111111111111111111111111) (= (mask!9210 thiss!1248) #b00000011111111111111111111111111) (= (mask!9210 thiss!1248) #b00000111111111111111111111111111) (= (mask!9210 thiss!1248) #b00001111111111111111111111111111) (= (mask!9210 thiss!1248) #b00011111111111111111111111111111) (= (mask!9210 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9210 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!193676 d!56611))

(declare-fun d!56613 () Bool)

(declare-fun e!127482 () Bool)

(assert (=> d!56613 e!127482))

(declare-fun res!91582 () Bool)

(assert (=> d!56613 (=> (not res!91582) (not e!127482))))

(assert (=> d!56613 (= res!91582 (and (bvsge (index!4935 lt!96437) #b00000000000000000000000000000000) (bvslt (index!4935 lt!96437) (size!4194 (_values!3936 thiss!1248)))))))

(declare-fun lt!96476 () Unit!5867)

(declare-fun choose!1061 (array!8219 array!8221 (_ BitVec 32) (_ BitVec 32) V!5627 V!5627 (_ BitVec 32) (_ BitVec 64) V!5627 Int) Unit!5867)

(assert (=> d!56613 (= lt!96476 (choose!1061 (_keys!5945 thiss!1248) (_values!3936 thiss!1248) (mask!9210 thiss!1248) (extraKeys!3690 thiss!1248) (zeroValue!3794 thiss!1248) (minValue!3794 thiss!1248) (index!4935 lt!96437) key!828 v!309 (defaultEntry!3953 thiss!1248)))))

(assert (=> d!56613 (validMask!0 (mask!9210 thiss!1248))))

(assert (=> d!56613 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!120 (_keys!5945 thiss!1248) (_values!3936 thiss!1248) (mask!9210 thiss!1248) (extraKeys!3690 thiss!1248) (zeroValue!3794 thiss!1248) (minValue!3794 thiss!1248) (index!4935 lt!96437) key!828 v!309 (defaultEntry!3953 thiss!1248)) lt!96476)))

(declare-fun b!193764 () Bool)

(assert (=> b!193764 (= e!127482 (= (+!319 (getCurrentListMap!899 (_keys!5945 thiss!1248) (_values!3936 thiss!1248) (mask!9210 thiss!1248) (extraKeys!3690 thiss!1248) (zeroValue!3794 thiss!1248) (minValue!3794 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3953 thiss!1248)) (tuple2!3555 key!828 v!309)) (getCurrentListMap!899 (_keys!5945 thiss!1248) (array!8222 (store (arr!3870 (_values!3936 thiss!1248)) (index!4935 lt!96437) (ValueCellFull!1899 v!309)) (size!4194 (_values!3936 thiss!1248))) (mask!9210 thiss!1248) (extraKeys!3690 thiss!1248) (zeroValue!3794 thiss!1248) (minValue!3794 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3953 thiss!1248))))))

(assert (= (and d!56613 res!91582) b!193764))

(declare-fun m!220525 () Bool)

(assert (=> d!56613 m!220525))

(assert (=> d!56613 m!220457))

(assert (=> b!193764 m!220451))

(assert (=> b!193764 m!220451))

(declare-fun m!220527 () Bool)

(assert (=> b!193764 m!220527))

(assert (=> b!193764 m!220447))

(assert (=> b!193764 m!220449))

(assert (=> b!193676 d!56613))

(declare-fun b!193807 () Bool)

(declare-fun e!127515 () Bool)

(assert (=> b!193807 (= e!127515 (validKeyInArray!0 (select (arr!3869 (_keys!5945 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19590 () Bool)

(declare-fun call!19596 () ListLongMap!2471)

(declare-fun call!19599 () ListLongMap!2471)

(assert (=> bm!19590 (= call!19596 call!19599)))

(declare-fun b!193808 () Bool)

(declare-fun e!127512 () ListLongMap!2471)

(declare-fun e!127509 () ListLongMap!2471)

(assert (=> b!193808 (= e!127512 e!127509)))

(declare-fun c!34953 () Bool)

(assert (=> b!193808 (= c!34953 (and (not (= (bvand (extraKeys!3690 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3690 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19591 () Bool)

(declare-fun call!19598 () ListLongMap!2471)

(declare-fun call!19594 () ListLongMap!2471)

(assert (=> bm!19591 (= call!19598 call!19594)))

(declare-fun b!193809 () Bool)

(declare-fun e!127521 () Bool)

(declare-fun e!127511 () Bool)

(assert (=> b!193809 (= e!127521 e!127511)))

(declare-fun res!91607 () Bool)

(declare-fun call!19597 () Bool)

(assert (=> b!193809 (= res!91607 call!19597)))

(assert (=> b!193809 (=> (not res!91607) (not e!127511))))

(declare-fun b!193810 () Bool)

(declare-fun e!127514 () Bool)

(declare-fun lt!96533 () ListLongMap!2471)

(declare-fun apply!187 (ListLongMap!2471 (_ BitVec 64)) V!5627)

(assert (=> b!193810 (= e!127514 (= (apply!187 lt!96533 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3794 thiss!1248)))))

(declare-fun b!193811 () Bool)

(declare-fun res!91604 () Bool)

(declare-fun e!127510 () Bool)

(assert (=> b!193811 (=> (not res!91604) (not e!127510))))

(assert (=> b!193811 (= res!91604 e!127521)))

(declare-fun c!34951 () Bool)

(assert (=> b!193811 (= c!34951 (not (= (bvand (extraKeys!3690 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!127518 () Bool)

(declare-fun b!193812 () Bool)

(declare-fun get!2234 (ValueCell!1899 V!5627) V!5627)

(declare-fun dynLambda!530 (Int (_ BitVec 64)) V!5627)

(assert (=> b!193812 (= e!127518 (= (apply!187 lt!96533 (select (arr!3869 (_keys!5945 thiss!1248)) #b00000000000000000000000000000000)) (get!2234 (select (arr!3870 (array!8222 (store (arr!3870 (_values!3936 thiss!1248)) (index!4935 lt!96437) (ValueCellFull!1899 v!309)) (size!4194 (_values!3936 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!530 (defaultEntry!3953 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!193812 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4194 (array!8222 (store (arr!3870 (_values!3936 thiss!1248)) (index!4935 lt!96437) (ValueCellFull!1899 v!309)) (size!4194 (_values!3936 thiss!1248))))))))

(assert (=> b!193812 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4193 (_keys!5945 thiss!1248))))))

(declare-fun b!193813 () Bool)

(declare-fun c!34955 () Bool)

(assert (=> b!193813 (= c!34955 (and (not (= (bvand (extraKeys!3690 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3690 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!127517 () ListLongMap!2471)

(assert (=> b!193813 (= e!127509 e!127517)))

(declare-fun b!193814 () Bool)

(assert (=> b!193814 (= e!127512 (+!319 call!19599 (tuple2!3555 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3794 thiss!1248))))))

(declare-fun b!193815 () Bool)

(assert (=> b!193815 (= e!127509 call!19596)))

(declare-fun d!56615 () Bool)

(assert (=> d!56615 e!127510))

(declare-fun res!91601 () Bool)

(assert (=> d!56615 (=> (not res!91601) (not e!127510))))

(assert (=> d!56615 (= res!91601 (or (bvsge #b00000000000000000000000000000000 (size!4193 (_keys!5945 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4193 (_keys!5945 thiss!1248))))))))

(declare-fun lt!96535 () ListLongMap!2471)

(assert (=> d!56615 (= lt!96533 lt!96535)))

(declare-fun lt!96534 () Unit!5867)

(declare-fun e!127519 () Unit!5867)

(assert (=> d!56615 (= lt!96534 e!127519)))

(declare-fun c!34954 () Bool)

(declare-fun e!127513 () Bool)

(assert (=> d!56615 (= c!34954 e!127513)))

(declare-fun res!91603 () Bool)

(assert (=> d!56615 (=> (not res!91603) (not e!127513))))

(assert (=> d!56615 (= res!91603 (bvslt #b00000000000000000000000000000000 (size!4193 (_keys!5945 thiss!1248))))))

(assert (=> d!56615 (= lt!96535 e!127512)))

(declare-fun c!34952 () Bool)

(assert (=> d!56615 (= c!34952 (and (not (= (bvand (extraKeys!3690 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3690 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56615 (validMask!0 (mask!9210 thiss!1248))))

(assert (=> d!56615 (= (getCurrentListMap!899 (_keys!5945 thiss!1248) (array!8222 (store (arr!3870 (_values!3936 thiss!1248)) (index!4935 lt!96437) (ValueCellFull!1899 v!309)) (size!4194 (_values!3936 thiss!1248))) (mask!9210 thiss!1248) (extraKeys!3690 thiss!1248) (zeroValue!3794 thiss!1248) (minValue!3794 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3953 thiss!1248)) lt!96533)))

(declare-fun b!193816 () Bool)

(assert (=> b!193816 (= e!127513 (validKeyInArray!0 (select (arr!3869 (_keys!5945 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193817 () Bool)

(declare-fun res!91609 () Bool)

(assert (=> b!193817 (=> (not res!91609) (not e!127510))))

(declare-fun e!127516 () Bool)

(assert (=> b!193817 (= res!91609 e!127516)))

(declare-fun res!91606 () Bool)

(assert (=> b!193817 (=> res!91606 e!127516)))

(assert (=> b!193817 (= res!91606 (not e!127515))))

(declare-fun res!91608 () Bool)

(assert (=> b!193817 (=> (not res!91608) (not e!127515))))

(assert (=> b!193817 (= res!91608 (bvslt #b00000000000000000000000000000000 (size!4193 (_keys!5945 thiss!1248))))))

(declare-fun b!193818 () Bool)

(declare-fun Unit!5872 () Unit!5867)

(assert (=> b!193818 (= e!127519 Unit!5872)))

(declare-fun b!193819 () Bool)

(declare-fun e!127520 () Bool)

(assert (=> b!193819 (= e!127510 e!127520)))

(declare-fun c!34950 () Bool)

(assert (=> b!193819 (= c!34950 (not (= (bvand (extraKeys!3690 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!193820 () Bool)

(declare-fun lt!96526 () Unit!5867)

(assert (=> b!193820 (= e!127519 lt!96526)))

(declare-fun lt!96521 () ListLongMap!2471)

(declare-fun getCurrentListMapNoExtraKeys!220 (array!8219 array!8221 (_ BitVec 32) (_ BitVec 32) V!5627 V!5627 (_ BitVec 32) Int) ListLongMap!2471)

(assert (=> b!193820 (= lt!96521 (getCurrentListMapNoExtraKeys!220 (_keys!5945 thiss!1248) (array!8222 (store (arr!3870 (_values!3936 thiss!1248)) (index!4935 lt!96437) (ValueCellFull!1899 v!309)) (size!4194 (_values!3936 thiss!1248))) (mask!9210 thiss!1248) (extraKeys!3690 thiss!1248) (zeroValue!3794 thiss!1248) (minValue!3794 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3953 thiss!1248)))))

(declare-fun lt!96537 () (_ BitVec 64))

(assert (=> b!193820 (= lt!96537 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96525 () (_ BitVec 64))

(assert (=> b!193820 (= lt!96525 (select (arr!3869 (_keys!5945 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96522 () Unit!5867)

(declare-fun addStillContains!163 (ListLongMap!2471 (_ BitVec 64) V!5627 (_ BitVec 64)) Unit!5867)

(assert (=> b!193820 (= lt!96522 (addStillContains!163 lt!96521 lt!96537 (zeroValue!3794 thiss!1248) lt!96525))))

(assert (=> b!193820 (contains!1374 (+!319 lt!96521 (tuple2!3555 lt!96537 (zeroValue!3794 thiss!1248))) lt!96525)))

(declare-fun lt!96539 () Unit!5867)

(assert (=> b!193820 (= lt!96539 lt!96522)))

(declare-fun lt!96527 () ListLongMap!2471)

(assert (=> b!193820 (= lt!96527 (getCurrentListMapNoExtraKeys!220 (_keys!5945 thiss!1248) (array!8222 (store (arr!3870 (_values!3936 thiss!1248)) (index!4935 lt!96437) (ValueCellFull!1899 v!309)) (size!4194 (_values!3936 thiss!1248))) (mask!9210 thiss!1248) (extraKeys!3690 thiss!1248) (zeroValue!3794 thiss!1248) (minValue!3794 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3953 thiss!1248)))))

(declare-fun lt!96530 () (_ BitVec 64))

(assert (=> b!193820 (= lt!96530 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96531 () (_ BitVec 64))

(assert (=> b!193820 (= lt!96531 (select (arr!3869 (_keys!5945 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96523 () Unit!5867)

(declare-fun addApplyDifferent!163 (ListLongMap!2471 (_ BitVec 64) V!5627 (_ BitVec 64)) Unit!5867)

(assert (=> b!193820 (= lt!96523 (addApplyDifferent!163 lt!96527 lt!96530 (minValue!3794 thiss!1248) lt!96531))))

(assert (=> b!193820 (= (apply!187 (+!319 lt!96527 (tuple2!3555 lt!96530 (minValue!3794 thiss!1248))) lt!96531) (apply!187 lt!96527 lt!96531))))

(declare-fun lt!96542 () Unit!5867)

(assert (=> b!193820 (= lt!96542 lt!96523)))

(declare-fun lt!96536 () ListLongMap!2471)

(assert (=> b!193820 (= lt!96536 (getCurrentListMapNoExtraKeys!220 (_keys!5945 thiss!1248) (array!8222 (store (arr!3870 (_values!3936 thiss!1248)) (index!4935 lt!96437) (ValueCellFull!1899 v!309)) (size!4194 (_values!3936 thiss!1248))) (mask!9210 thiss!1248) (extraKeys!3690 thiss!1248) (zeroValue!3794 thiss!1248) (minValue!3794 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3953 thiss!1248)))))

(declare-fun lt!96524 () (_ BitVec 64))

(assert (=> b!193820 (= lt!96524 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96532 () (_ BitVec 64))

(assert (=> b!193820 (= lt!96532 (select (arr!3869 (_keys!5945 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96528 () Unit!5867)

(assert (=> b!193820 (= lt!96528 (addApplyDifferent!163 lt!96536 lt!96524 (zeroValue!3794 thiss!1248) lt!96532))))

(assert (=> b!193820 (= (apply!187 (+!319 lt!96536 (tuple2!3555 lt!96524 (zeroValue!3794 thiss!1248))) lt!96532) (apply!187 lt!96536 lt!96532))))

(declare-fun lt!96529 () Unit!5867)

(assert (=> b!193820 (= lt!96529 lt!96528)))

(declare-fun lt!96538 () ListLongMap!2471)

(assert (=> b!193820 (= lt!96538 (getCurrentListMapNoExtraKeys!220 (_keys!5945 thiss!1248) (array!8222 (store (arr!3870 (_values!3936 thiss!1248)) (index!4935 lt!96437) (ValueCellFull!1899 v!309)) (size!4194 (_values!3936 thiss!1248))) (mask!9210 thiss!1248) (extraKeys!3690 thiss!1248) (zeroValue!3794 thiss!1248) (minValue!3794 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3953 thiss!1248)))))

(declare-fun lt!96540 () (_ BitVec 64))

(assert (=> b!193820 (= lt!96540 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96541 () (_ BitVec 64))

(assert (=> b!193820 (= lt!96541 (select (arr!3869 (_keys!5945 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!193820 (= lt!96526 (addApplyDifferent!163 lt!96538 lt!96540 (minValue!3794 thiss!1248) lt!96541))))

(assert (=> b!193820 (= (apply!187 (+!319 lt!96538 (tuple2!3555 lt!96540 (minValue!3794 thiss!1248))) lt!96541) (apply!187 lt!96538 lt!96541))))

(declare-fun b!193821 () Bool)

(assert (=> b!193821 (= e!127517 call!19596)))

(declare-fun b!193822 () Bool)

(assert (=> b!193822 (= e!127521 (not call!19597))))

(declare-fun bm!19592 () Bool)

(assert (=> bm!19592 (= call!19597 (contains!1374 lt!96533 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!19595 () ListLongMap!2471)

(declare-fun bm!19593 () Bool)

(assert (=> bm!19593 (= call!19599 (+!319 (ite c!34952 call!19594 (ite c!34953 call!19598 call!19595)) (ite (or c!34952 c!34953) (tuple2!3555 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3794 thiss!1248)) (tuple2!3555 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3794 thiss!1248)))))))

(declare-fun b!193823 () Bool)

(assert (=> b!193823 (= e!127511 (= (apply!187 lt!96533 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3794 thiss!1248)))))

(declare-fun b!193824 () Bool)

(assert (=> b!193824 (= e!127516 e!127518)))

(declare-fun res!91602 () Bool)

(assert (=> b!193824 (=> (not res!91602) (not e!127518))))

(assert (=> b!193824 (= res!91602 (contains!1374 lt!96533 (select (arr!3869 (_keys!5945 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!193824 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4193 (_keys!5945 thiss!1248))))))

(declare-fun bm!19594 () Bool)

(assert (=> bm!19594 (= call!19594 (getCurrentListMapNoExtraKeys!220 (_keys!5945 thiss!1248) (array!8222 (store (arr!3870 (_values!3936 thiss!1248)) (index!4935 lt!96437) (ValueCellFull!1899 v!309)) (size!4194 (_values!3936 thiss!1248))) (mask!9210 thiss!1248) (extraKeys!3690 thiss!1248) (zeroValue!3794 thiss!1248) (minValue!3794 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3953 thiss!1248)))))

(declare-fun bm!19595 () Bool)

(assert (=> bm!19595 (= call!19595 call!19598)))

(declare-fun b!193825 () Bool)

(assert (=> b!193825 (= e!127520 e!127514)))

(declare-fun res!91605 () Bool)

(declare-fun call!19593 () Bool)

(assert (=> b!193825 (= res!91605 call!19593)))

(assert (=> b!193825 (=> (not res!91605) (not e!127514))))

(declare-fun bm!19596 () Bool)

(assert (=> bm!19596 (= call!19593 (contains!1374 lt!96533 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!193826 () Bool)

(assert (=> b!193826 (= e!127520 (not call!19593))))

(declare-fun b!193827 () Bool)

(assert (=> b!193827 (= e!127517 call!19595)))

(assert (= (and d!56615 c!34952) b!193814))

(assert (= (and d!56615 (not c!34952)) b!193808))

(assert (= (and b!193808 c!34953) b!193815))

(assert (= (and b!193808 (not c!34953)) b!193813))

(assert (= (and b!193813 c!34955) b!193821))

(assert (= (and b!193813 (not c!34955)) b!193827))

(assert (= (or b!193821 b!193827) bm!19595))

(assert (= (or b!193815 bm!19595) bm!19591))

(assert (= (or b!193815 b!193821) bm!19590))

(assert (= (or b!193814 bm!19591) bm!19594))

(assert (= (or b!193814 bm!19590) bm!19593))

(assert (= (and d!56615 res!91603) b!193816))

(assert (= (and d!56615 c!34954) b!193820))

(assert (= (and d!56615 (not c!34954)) b!193818))

(assert (= (and d!56615 res!91601) b!193817))

(assert (= (and b!193817 res!91608) b!193807))

(assert (= (and b!193817 (not res!91606)) b!193824))

(assert (= (and b!193824 res!91602) b!193812))

(assert (= (and b!193817 res!91609) b!193811))

(assert (= (and b!193811 c!34951) b!193809))

(assert (= (and b!193811 (not c!34951)) b!193822))

(assert (= (and b!193809 res!91607) b!193823))

(assert (= (or b!193809 b!193822) bm!19592))

(assert (= (and b!193811 res!91604) b!193819))

(assert (= (and b!193819 c!34950) b!193825))

(assert (= (and b!193819 (not c!34950)) b!193826))

(assert (= (and b!193825 res!91605) b!193810))

(assert (= (or b!193825 b!193826) bm!19596))

(declare-fun b_lambda!7471 () Bool)

(assert (=> (not b_lambda!7471) (not b!193812)))

(declare-fun t!7373 () Bool)

(declare-fun tb!2885 () Bool)

(assert (=> (and b!193670 (= (defaultEntry!3953 thiss!1248) (defaultEntry!3953 thiss!1248)) t!7373) tb!2885))

(declare-fun result!4933 () Bool)

(assert (=> tb!2885 (= result!4933 tp_is_empty!4485)))

(assert (=> b!193812 t!7373))

(declare-fun b_and!11427 () Bool)

(assert (= b_and!11423 (and (=> t!7373 result!4933) b_and!11427)))

(assert (=> b!193816 m!220513))

(assert (=> b!193816 m!220513))

(assert (=> b!193816 m!220515))

(declare-fun m!220529 () Bool)

(assert (=> b!193814 m!220529))

(declare-fun m!220531 () Bool)

(assert (=> b!193810 m!220531))

(assert (=> b!193807 m!220513))

(assert (=> b!193807 m!220513))

(assert (=> b!193807 m!220515))

(declare-fun m!220533 () Bool)

(assert (=> b!193823 m!220533))

(declare-fun m!220535 () Bool)

(assert (=> bm!19596 m!220535))

(declare-fun m!220537 () Bool)

(assert (=> bm!19594 m!220537))

(declare-fun m!220539 () Bool)

(assert (=> b!193820 m!220539))

(declare-fun m!220541 () Bool)

(assert (=> b!193820 m!220541))

(assert (=> b!193820 m!220539))

(declare-fun m!220543 () Bool)

(assert (=> b!193820 m!220543))

(declare-fun m!220545 () Bool)

(assert (=> b!193820 m!220545))

(declare-fun m!220547 () Bool)

(assert (=> b!193820 m!220547))

(declare-fun m!220549 () Bool)

(assert (=> b!193820 m!220549))

(declare-fun m!220551 () Bool)

(assert (=> b!193820 m!220551))

(assert (=> b!193820 m!220541))

(declare-fun m!220553 () Bool)

(assert (=> b!193820 m!220553))

(declare-fun m!220555 () Bool)

(assert (=> b!193820 m!220555))

(assert (=> b!193820 m!220549))

(declare-fun m!220557 () Bool)

(assert (=> b!193820 m!220557))

(assert (=> b!193820 m!220547))

(declare-fun m!220559 () Bool)

(assert (=> b!193820 m!220559))

(declare-fun m!220561 () Bool)

(assert (=> b!193820 m!220561))

(declare-fun m!220563 () Bool)

(assert (=> b!193820 m!220563))

(declare-fun m!220565 () Bool)

(assert (=> b!193820 m!220565))

(assert (=> b!193820 m!220537))

(assert (=> b!193820 m!220513))

(declare-fun m!220567 () Bool)

(assert (=> b!193820 m!220567))

(assert (=> d!56615 m!220457))

(declare-fun m!220569 () Bool)

(assert (=> bm!19592 m!220569))

(declare-fun m!220571 () Bool)

(assert (=> b!193812 m!220571))

(declare-fun m!220573 () Bool)

(assert (=> b!193812 m!220573))

(assert (=> b!193812 m!220513))

(declare-fun m!220575 () Bool)

(assert (=> b!193812 m!220575))

(assert (=> b!193812 m!220573))

(assert (=> b!193812 m!220571))

(declare-fun m!220577 () Bool)

(assert (=> b!193812 m!220577))

(assert (=> b!193812 m!220513))

(declare-fun m!220579 () Bool)

(assert (=> bm!19593 m!220579))

(assert (=> b!193824 m!220513))

(assert (=> b!193824 m!220513))

(declare-fun m!220581 () Bool)

(assert (=> b!193824 m!220581))

(assert (=> b!193676 d!56615))

(declare-fun d!56617 () Bool)

(declare-fun e!127524 () Bool)

(assert (=> d!56617 e!127524))

(declare-fun res!91615 () Bool)

(assert (=> d!56617 (=> (not res!91615) (not e!127524))))

(declare-fun lt!96554 () ListLongMap!2471)

(assert (=> d!56617 (= res!91615 (contains!1374 lt!96554 (_1!1788 (tuple2!3555 key!828 v!309))))))

(declare-fun lt!96551 () List!2446)

(assert (=> d!56617 (= lt!96554 (ListLongMap!2472 lt!96551))))

(declare-fun lt!96553 () Unit!5867)

(declare-fun lt!96552 () Unit!5867)

(assert (=> d!56617 (= lt!96553 lt!96552)))

(declare-datatypes ((Option!250 0))(
  ( (Some!249 (v!4250 V!5627)) (None!248) )
))
(declare-fun getValueByKey!244 (List!2446 (_ BitVec 64)) Option!250)

(assert (=> d!56617 (= (getValueByKey!244 lt!96551 (_1!1788 (tuple2!3555 key!828 v!309))) (Some!249 (_2!1788 (tuple2!3555 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!131 (List!2446 (_ BitVec 64) V!5627) Unit!5867)

(assert (=> d!56617 (= lt!96552 (lemmaContainsTupThenGetReturnValue!131 lt!96551 (_1!1788 (tuple2!3555 key!828 v!309)) (_2!1788 (tuple2!3555 key!828 v!309))))))

(declare-fun insertStrictlySorted!134 (List!2446 (_ BitVec 64) V!5627) List!2446)

(assert (=> d!56617 (= lt!96551 (insertStrictlySorted!134 (toList!1251 lt!96438) (_1!1788 (tuple2!3555 key!828 v!309)) (_2!1788 (tuple2!3555 key!828 v!309))))))

(assert (=> d!56617 (= (+!319 lt!96438 (tuple2!3555 key!828 v!309)) lt!96554)))

(declare-fun b!193834 () Bool)

(declare-fun res!91614 () Bool)

(assert (=> b!193834 (=> (not res!91614) (not e!127524))))

(assert (=> b!193834 (= res!91614 (= (getValueByKey!244 (toList!1251 lt!96554) (_1!1788 (tuple2!3555 key!828 v!309))) (Some!249 (_2!1788 (tuple2!3555 key!828 v!309)))))))

(declare-fun b!193835 () Bool)

(declare-fun contains!1376 (List!2446 tuple2!3554) Bool)

(assert (=> b!193835 (= e!127524 (contains!1376 (toList!1251 lt!96554) (tuple2!3555 key!828 v!309)))))

(assert (= (and d!56617 res!91615) b!193834))

(assert (= (and b!193834 res!91614) b!193835))

(declare-fun m!220583 () Bool)

(assert (=> d!56617 m!220583))

(declare-fun m!220585 () Bool)

(assert (=> d!56617 m!220585))

(declare-fun m!220587 () Bool)

(assert (=> d!56617 m!220587))

(declare-fun m!220589 () Bool)

(assert (=> d!56617 m!220589))

(declare-fun m!220591 () Bool)

(assert (=> b!193834 m!220591))

(declare-fun m!220593 () Bool)

(assert (=> b!193835 m!220593))

(assert (=> b!193676 d!56617))

(declare-fun b!193836 () Bool)

(declare-fun e!127531 () Bool)

(assert (=> b!193836 (= e!127531 (validKeyInArray!0 (select (arr!3869 (_keys!5945 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19597 () Bool)

(declare-fun call!19603 () ListLongMap!2471)

(declare-fun call!19606 () ListLongMap!2471)

(assert (=> bm!19597 (= call!19603 call!19606)))

(declare-fun b!193837 () Bool)

(declare-fun e!127528 () ListLongMap!2471)

(declare-fun e!127525 () ListLongMap!2471)

(assert (=> b!193837 (= e!127528 e!127525)))

(declare-fun c!34959 () Bool)

(assert (=> b!193837 (= c!34959 (and (not (= (bvand (extraKeys!3690 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3690 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19598 () Bool)

(declare-fun call!19605 () ListLongMap!2471)

(declare-fun call!19601 () ListLongMap!2471)

(assert (=> bm!19598 (= call!19605 call!19601)))

(declare-fun b!193838 () Bool)

(declare-fun e!127537 () Bool)

(declare-fun e!127527 () Bool)

(assert (=> b!193838 (= e!127537 e!127527)))

(declare-fun res!91622 () Bool)

(declare-fun call!19604 () Bool)

(assert (=> b!193838 (= res!91622 call!19604)))

(assert (=> b!193838 (=> (not res!91622) (not e!127527))))

(declare-fun b!193839 () Bool)

(declare-fun e!127530 () Bool)

(declare-fun lt!96567 () ListLongMap!2471)

(assert (=> b!193839 (= e!127530 (= (apply!187 lt!96567 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3794 thiss!1248)))))

(declare-fun b!193840 () Bool)

(declare-fun res!91619 () Bool)

(declare-fun e!127526 () Bool)

(assert (=> b!193840 (=> (not res!91619) (not e!127526))))

(assert (=> b!193840 (= res!91619 e!127537)))

(declare-fun c!34957 () Bool)

(assert (=> b!193840 (= c!34957 (not (= (bvand (extraKeys!3690 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!193841 () Bool)

(declare-fun e!127534 () Bool)

(assert (=> b!193841 (= e!127534 (= (apply!187 lt!96567 (select (arr!3869 (_keys!5945 thiss!1248)) #b00000000000000000000000000000000)) (get!2234 (select (arr!3870 (_values!3936 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!530 (defaultEntry!3953 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!193841 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4194 (_values!3936 thiss!1248))))))

(assert (=> b!193841 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4193 (_keys!5945 thiss!1248))))))

(declare-fun b!193842 () Bool)

(declare-fun c!34961 () Bool)

(assert (=> b!193842 (= c!34961 (and (not (= (bvand (extraKeys!3690 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3690 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!127533 () ListLongMap!2471)

(assert (=> b!193842 (= e!127525 e!127533)))

(declare-fun b!193843 () Bool)

(assert (=> b!193843 (= e!127528 (+!319 call!19606 (tuple2!3555 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3794 thiss!1248))))))

(declare-fun b!193844 () Bool)

(assert (=> b!193844 (= e!127525 call!19603)))

(declare-fun d!56619 () Bool)

(assert (=> d!56619 e!127526))

(declare-fun res!91616 () Bool)

(assert (=> d!56619 (=> (not res!91616) (not e!127526))))

(assert (=> d!56619 (= res!91616 (or (bvsge #b00000000000000000000000000000000 (size!4193 (_keys!5945 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4193 (_keys!5945 thiss!1248))))))))

(declare-fun lt!96569 () ListLongMap!2471)

(assert (=> d!56619 (= lt!96567 lt!96569)))

(declare-fun lt!96568 () Unit!5867)

(declare-fun e!127535 () Unit!5867)

(assert (=> d!56619 (= lt!96568 e!127535)))

(declare-fun c!34960 () Bool)

(declare-fun e!127529 () Bool)

(assert (=> d!56619 (= c!34960 e!127529)))

(declare-fun res!91618 () Bool)

(assert (=> d!56619 (=> (not res!91618) (not e!127529))))

(assert (=> d!56619 (= res!91618 (bvslt #b00000000000000000000000000000000 (size!4193 (_keys!5945 thiss!1248))))))

(assert (=> d!56619 (= lt!96569 e!127528)))

(declare-fun c!34958 () Bool)

(assert (=> d!56619 (= c!34958 (and (not (= (bvand (extraKeys!3690 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3690 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56619 (validMask!0 (mask!9210 thiss!1248))))

(assert (=> d!56619 (= (getCurrentListMap!899 (_keys!5945 thiss!1248) (_values!3936 thiss!1248) (mask!9210 thiss!1248) (extraKeys!3690 thiss!1248) (zeroValue!3794 thiss!1248) (minValue!3794 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3953 thiss!1248)) lt!96567)))

(declare-fun b!193845 () Bool)

(assert (=> b!193845 (= e!127529 (validKeyInArray!0 (select (arr!3869 (_keys!5945 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193846 () Bool)

(declare-fun res!91624 () Bool)

(assert (=> b!193846 (=> (not res!91624) (not e!127526))))

(declare-fun e!127532 () Bool)

(assert (=> b!193846 (= res!91624 e!127532)))

(declare-fun res!91621 () Bool)

(assert (=> b!193846 (=> res!91621 e!127532)))

(assert (=> b!193846 (= res!91621 (not e!127531))))

(declare-fun res!91623 () Bool)

(assert (=> b!193846 (=> (not res!91623) (not e!127531))))

(assert (=> b!193846 (= res!91623 (bvslt #b00000000000000000000000000000000 (size!4193 (_keys!5945 thiss!1248))))))

(declare-fun b!193847 () Bool)

(declare-fun Unit!5873 () Unit!5867)

(assert (=> b!193847 (= e!127535 Unit!5873)))

(declare-fun b!193848 () Bool)

(declare-fun e!127536 () Bool)

(assert (=> b!193848 (= e!127526 e!127536)))

(declare-fun c!34956 () Bool)

(assert (=> b!193848 (= c!34956 (not (= (bvand (extraKeys!3690 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!193849 () Bool)

(declare-fun lt!96560 () Unit!5867)

(assert (=> b!193849 (= e!127535 lt!96560)))

(declare-fun lt!96555 () ListLongMap!2471)

(assert (=> b!193849 (= lt!96555 (getCurrentListMapNoExtraKeys!220 (_keys!5945 thiss!1248) (_values!3936 thiss!1248) (mask!9210 thiss!1248) (extraKeys!3690 thiss!1248) (zeroValue!3794 thiss!1248) (minValue!3794 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3953 thiss!1248)))))

(declare-fun lt!96571 () (_ BitVec 64))

(assert (=> b!193849 (= lt!96571 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96559 () (_ BitVec 64))

(assert (=> b!193849 (= lt!96559 (select (arr!3869 (_keys!5945 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96556 () Unit!5867)

(assert (=> b!193849 (= lt!96556 (addStillContains!163 lt!96555 lt!96571 (zeroValue!3794 thiss!1248) lt!96559))))

(assert (=> b!193849 (contains!1374 (+!319 lt!96555 (tuple2!3555 lt!96571 (zeroValue!3794 thiss!1248))) lt!96559)))

(declare-fun lt!96573 () Unit!5867)

(assert (=> b!193849 (= lt!96573 lt!96556)))

(declare-fun lt!96561 () ListLongMap!2471)

(assert (=> b!193849 (= lt!96561 (getCurrentListMapNoExtraKeys!220 (_keys!5945 thiss!1248) (_values!3936 thiss!1248) (mask!9210 thiss!1248) (extraKeys!3690 thiss!1248) (zeroValue!3794 thiss!1248) (minValue!3794 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3953 thiss!1248)))))

(declare-fun lt!96564 () (_ BitVec 64))

(assert (=> b!193849 (= lt!96564 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96565 () (_ BitVec 64))

(assert (=> b!193849 (= lt!96565 (select (arr!3869 (_keys!5945 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96557 () Unit!5867)

(assert (=> b!193849 (= lt!96557 (addApplyDifferent!163 lt!96561 lt!96564 (minValue!3794 thiss!1248) lt!96565))))

(assert (=> b!193849 (= (apply!187 (+!319 lt!96561 (tuple2!3555 lt!96564 (minValue!3794 thiss!1248))) lt!96565) (apply!187 lt!96561 lt!96565))))

(declare-fun lt!96576 () Unit!5867)

(assert (=> b!193849 (= lt!96576 lt!96557)))

(declare-fun lt!96570 () ListLongMap!2471)

(assert (=> b!193849 (= lt!96570 (getCurrentListMapNoExtraKeys!220 (_keys!5945 thiss!1248) (_values!3936 thiss!1248) (mask!9210 thiss!1248) (extraKeys!3690 thiss!1248) (zeroValue!3794 thiss!1248) (minValue!3794 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3953 thiss!1248)))))

(declare-fun lt!96558 () (_ BitVec 64))

(assert (=> b!193849 (= lt!96558 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96566 () (_ BitVec 64))

(assert (=> b!193849 (= lt!96566 (select (arr!3869 (_keys!5945 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96562 () Unit!5867)

(assert (=> b!193849 (= lt!96562 (addApplyDifferent!163 lt!96570 lt!96558 (zeroValue!3794 thiss!1248) lt!96566))))

(assert (=> b!193849 (= (apply!187 (+!319 lt!96570 (tuple2!3555 lt!96558 (zeroValue!3794 thiss!1248))) lt!96566) (apply!187 lt!96570 lt!96566))))

(declare-fun lt!96563 () Unit!5867)

(assert (=> b!193849 (= lt!96563 lt!96562)))

(declare-fun lt!96572 () ListLongMap!2471)

(assert (=> b!193849 (= lt!96572 (getCurrentListMapNoExtraKeys!220 (_keys!5945 thiss!1248) (_values!3936 thiss!1248) (mask!9210 thiss!1248) (extraKeys!3690 thiss!1248) (zeroValue!3794 thiss!1248) (minValue!3794 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3953 thiss!1248)))))

(declare-fun lt!96574 () (_ BitVec 64))

(assert (=> b!193849 (= lt!96574 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96575 () (_ BitVec 64))

(assert (=> b!193849 (= lt!96575 (select (arr!3869 (_keys!5945 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!193849 (= lt!96560 (addApplyDifferent!163 lt!96572 lt!96574 (minValue!3794 thiss!1248) lt!96575))))

(assert (=> b!193849 (= (apply!187 (+!319 lt!96572 (tuple2!3555 lt!96574 (minValue!3794 thiss!1248))) lt!96575) (apply!187 lt!96572 lt!96575))))

(declare-fun b!193850 () Bool)

(assert (=> b!193850 (= e!127533 call!19603)))

(declare-fun b!193851 () Bool)

(assert (=> b!193851 (= e!127537 (not call!19604))))

(declare-fun bm!19599 () Bool)

(assert (=> bm!19599 (= call!19604 (contains!1374 lt!96567 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!19602 () ListLongMap!2471)

(declare-fun bm!19600 () Bool)

(assert (=> bm!19600 (= call!19606 (+!319 (ite c!34958 call!19601 (ite c!34959 call!19605 call!19602)) (ite (or c!34958 c!34959) (tuple2!3555 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3794 thiss!1248)) (tuple2!3555 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3794 thiss!1248)))))))

(declare-fun b!193852 () Bool)

(assert (=> b!193852 (= e!127527 (= (apply!187 lt!96567 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3794 thiss!1248)))))

(declare-fun b!193853 () Bool)

(assert (=> b!193853 (= e!127532 e!127534)))

(declare-fun res!91617 () Bool)

(assert (=> b!193853 (=> (not res!91617) (not e!127534))))

(assert (=> b!193853 (= res!91617 (contains!1374 lt!96567 (select (arr!3869 (_keys!5945 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!193853 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4193 (_keys!5945 thiss!1248))))))

(declare-fun bm!19601 () Bool)

(assert (=> bm!19601 (= call!19601 (getCurrentListMapNoExtraKeys!220 (_keys!5945 thiss!1248) (_values!3936 thiss!1248) (mask!9210 thiss!1248) (extraKeys!3690 thiss!1248) (zeroValue!3794 thiss!1248) (minValue!3794 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3953 thiss!1248)))))

(declare-fun bm!19602 () Bool)

(assert (=> bm!19602 (= call!19602 call!19605)))

(declare-fun b!193854 () Bool)

(assert (=> b!193854 (= e!127536 e!127530)))

(declare-fun res!91620 () Bool)

(declare-fun call!19600 () Bool)

(assert (=> b!193854 (= res!91620 call!19600)))

(assert (=> b!193854 (=> (not res!91620) (not e!127530))))

(declare-fun bm!19603 () Bool)

(assert (=> bm!19603 (= call!19600 (contains!1374 lt!96567 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!193855 () Bool)

(assert (=> b!193855 (= e!127536 (not call!19600))))

(declare-fun b!193856 () Bool)

(assert (=> b!193856 (= e!127533 call!19602)))

(assert (= (and d!56619 c!34958) b!193843))

(assert (= (and d!56619 (not c!34958)) b!193837))

(assert (= (and b!193837 c!34959) b!193844))

(assert (= (and b!193837 (not c!34959)) b!193842))

(assert (= (and b!193842 c!34961) b!193850))

(assert (= (and b!193842 (not c!34961)) b!193856))

(assert (= (or b!193850 b!193856) bm!19602))

(assert (= (or b!193844 bm!19602) bm!19598))

(assert (= (or b!193844 b!193850) bm!19597))

(assert (= (or b!193843 bm!19598) bm!19601))

(assert (= (or b!193843 bm!19597) bm!19600))

(assert (= (and d!56619 res!91618) b!193845))

(assert (= (and d!56619 c!34960) b!193849))

(assert (= (and d!56619 (not c!34960)) b!193847))

(assert (= (and d!56619 res!91616) b!193846))

(assert (= (and b!193846 res!91623) b!193836))

(assert (= (and b!193846 (not res!91621)) b!193853))

(assert (= (and b!193853 res!91617) b!193841))

(assert (= (and b!193846 res!91624) b!193840))

(assert (= (and b!193840 c!34957) b!193838))

(assert (= (and b!193840 (not c!34957)) b!193851))

(assert (= (and b!193838 res!91622) b!193852))

(assert (= (or b!193838 b!193851) bm!19599))

(assert (= (and b!193840 res!91619) b!193848))

(assert (= (and b!193848 c!34956) b!193854))

(assert (= (and b!193848 (not c!34956)) b!193855))

(assert (= (and b!193854 res!91620) b!193839))

(assert (= (or b!193854 b!193855) bm!19603))

(declare-fun b_lambda!7473 () Bool)

(assert (=> (not b_lambda!7473) (not b!193841)))

(assert (=> b!193841 t!7373))

(declare-fun b_and!11429 () Bool)

(assert (= b_and!11427 (and (=> t!7373 result!4933) b_and!11429)))

(assert (=> b!193845 m!220513))

(assert (=> b!193845 m!220513))

(assert (=> b!193845 m!220515))

(declare-fun m!220595 () Bool)

(assert (=> b!193843 m!220595))

(declare-fun m!220597 () Bool)

(assert (=> b!193839 m!220597))

(assert (=> b!193836 m!220513))

(assert (=> b!193836 m!220513))

(assert (=> b!193836 m!220515))

(declare-fun m!220599 () Bool)

(assert (=> b!193852 m!220599))

(declare-fun m!220601 () Bool)

(assert (=> bm!19603 m!220601))

(declare-fun m!220603 () Bool)

(assert (=> bm!19601 m!220603))

(declare-fun m!220605 () Bool)

(assert (=> b!193849 m!220605))

(declare-fun m!220607 () Bool)

(assert (=> b!193849 m!220607))

(assert (=> b!193849 m!220605))

(declare-fun m!220609 () Bool)

(assert (=> b!193849 m!220609))

(declare-fun m!220611 () Bool)

(assert (=> b!193849 m!220611))

(declare-fun m!220613 () Bool)

(assert (=> b!193849 m!220613))

(declare-fun m!220615 () Bool)

(assert (=> b!193849 m!220615))

(declare-fun m!220617 () Bool)

(assert (=> b!193849 m!220617))

(assert (=> b!193849 m!220607))

(declare-fun m!220619 () Bool)

(assert (=> b!193849 m!220619))

(declare-fun m!220621 () Bool)

(assert (=> b!193849 m!220621))

(assert (=> b!193849 m!220615))

(declare-fun m!220623 () Bool)

(assert (=> b!193849 m!220623))

(assert (=> b!193849 m!220613))

(declare-fun m!220625 () Bool)

(assert (=> b!193849 m!220625))

(declare-fun m!220627 () Bool)

(assert (=> b!193849 m!220627))

(declare-fun m!220629 () Bool)

(assert (=> b!193849 m!220629))

(declare-fun m!220631 () Bool)

(assert (=> b!193849 m!220631))

(assert (=> b!193849 m!220603))

(assert (=> b!193849 m!220513))

(declare-fun m!220633 () Bool)

(assert (=> b!193849 m!220633))

(assert (=> d!56619 m!220457))

(declare-fun m!220635 () Bool)

(assert (=> bm!19599 m!220635))

(assert (=> b!193841 m!220571))

(declare-fun m!220637 () Bool)

(assert (=> b!193841 m!220637))

(assert (=> b!193841 m!220513))

(declare-fun m!220639 () Bool)

(assert (=> b!193841 m!220639))

(assert (=> b!193841 m!220637))

(assert (=> b!193841 m!220571))

(declare-fun m!220641 () Bool)

(assert (=> b!193841 m!220641))

(assert (=> b!193841 m!220513))

(declare-fun m!220643 () Bool)

(assert (=> bm!19600 m!220643))

(assert (=> b!193853 m!220513))

(assert (=> b!193853 m!220513))

(declare-fun m!220645 () Bool)

(assert (=> b!193853 m!220645))

(assert (=> b!193676 d!56619))

(declare-fun d!56621 () Bool)

(declare-fun e!127542 () Bool)

(assert (=> d!56621 e!127542))

(declare-fun res!91627 () Bool)

(assert (=> d!56621 (=> res!91627 e!127542)))

(declare-fun lt!96586 () Bool)

(assert (=> d!56621 (= res!91627 (not lt!96586))))

(declare-fun lt!96585 () Bool)

(assert (=> d!56621 (= lt!96586 lt!96585)))

(declare-fun lt!96588 () Unit!5867)

(declare-fun e!127543 () Unit!5867)

(assert (=> d!56621 (= lt!96588 e!127543)))

(declare-fun c!34964 () Bool)

(assert (=> d!56621 (= c!34964 lt!96585)))

(declare-fun containsKey!248 (List!2446 (_ BitVec 64)) Bool)

(assert (=> d!56621 (= lt!96585 (containsKey!248 (toList!1251 lt!96438) key!828))))

(assert (=> d!56621 (= (contains!1374 lt!96438 key!828) lt!96586)))

(declare-fun b!193863 () Bool)

(declare-fun lt!96587 () Unit!5867)

(assert (=> b!193863 (= e!127543 lt!96587)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!196 (List!2446 (_ BitVec 64)) Unit!5867)

(assert (=> b!193863 (= lt!96587 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1251 lt!96438) key!828))))

(declare-fun isDefined!197 (Option!250) Bool)

(assert (=> b!193863 (isDefined!197 (getValueByKey!244 (toList!1251 lt!96438) key!828))))

(declare-fun b!193864 () Bool)

(declare-fun Unit!5874 () Unit!5867)

(assert (=> b!193864 (= e!127543 Unit!5874)))

(declare-fun b!193865 () Bool)

(assert (=> b!193865 (= e!127542 (isDefined!197 (getValueByKey!244 (toList!1251 lt!96438) key!828)))))

(assert (= (and d!56621 c!34964) b!193863))

(assert (= (and d!56621 (not c!34964)) b!193864))

(assert (= (and d!56621 (not res!91627)) b!193865))

(declare-fun m!220647 () Bool)

(assert (=> d!56621 m!220647))

(declare-fun m!220649 () Bool)

(assert (=> b!193863 m!220649))

(declare-fun m!220651 () Bool)

(assert (=> b!193863 m!220651))

(assert (=> b!193863 m!220651))

(declare-fun m!220653 () Bool)

(assert (=> b!193863 m!220653))

(assert (=> b!193865 m!220651))

(assert (=> b!193865 m!220651))

(assert (=> b!193865 m!220653))

(assert (=> b!193676 d!56621))

(declare-fun d!56623 () Bool)

(declare-fun res!91634 () Bool)

(declare-fun e!127546 () Bool)

(assert (=> d!56623 (=> (not res!91634) (not e!127546))))

(declare-fun simpleValid!203 (LongMapFixedSize!2706) Bool)

(assert (=> d!56623 (= res!91634 (simpleValid!203 thiss!1248))))

(assert (=> d!56623 (= (valid!1110 thiss!1248) e!127546)))

(declare-fun b!193872 () Bool)

(declare-fun res!91635 () Bool)

(assert (=> b!193872 (=> (not res!91635) (not e!127546))))

(declare-fun arrayCountValidKeys!0 (array!8219 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!193872 (= res!91635 (= (arrayCountValidKeys!0 (_keys!5945 thiss!1248) #b00000000000000000000000000000000 (size!4193 (_keys!5945 thiss!1248))) (_size!1402 thiss!1248)))))

(declare-fun b!193873 () Bool)

(declare-fun res!91636 () Bool)

(assert (=> b!193873 (=> (not res!91636) (not e!127546))))

(assert (=> b!193873 (= res!91636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5945 thiss!1248) (mask!9210 thiss!1248)))))

(declare-fun b!193874 () Bool)

(assert (=> b!193874 (= e!127546 (arrayNoDuplicates!0 (_keys!5945 thiss!1248) #b00000000000000000000000000000000 Nil!2442))))

(assert (= (and d!56623 res!91634) b!193872))

(assert (= (and b!193872 res!91635) b!193873))

(assert (= (and b!193873 res!91636) b!193874))

(declare-fun m!220655 () Bool)

(assert (=> d!56623 m!220655))

(declare-fun m!220657 () Bool)

(assert (=> b!193872 m!220657))

(assert (=> b!193873 m!220441))

(assert (=> b!193874 m!220431))

(assert (=> start!19762 d!56623))

(declare-fun b!193887 () Bool)

(declare-fun c!34972 () Bool)

(declare-fun lt!96597 () (_ BitVec 64))

(assert (=> b!193887 (= c!34972 (= lt!96597 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!127553 () SeekEntryResult!691)

(declare-fun e!127554 () SeekEntryResult!691)

(assert (=> b!193887 (= e!127553 e!127554)))

(declare-fun d!56625 () Bool)

(declare-fun lt!96595 () SeekEntryResult!691)

(assert (=> d!56625 (and (or ((_ is Undefined!691) lt!96595) (not ((_ is Found!691) lt!96595)) (and (bvsge (index!4935 lt!96595) #b00000000000000000000000000000000) (bvslt (index!4935 lt!96595) (size!4193 (_keys!5945 thiss!1248))))) (or ((_ is Undefined!691) lt!96595) ((_ is Found!691) lt!96595) (not ((_ is MissingZero!691) lt!96595)) (and (bvsge (index!4934 lt!96595) #b00000000000000000000000000000000) (bvslt (index!4934 lt!96595) (size!4193 (_keys!5945 thiss!1248))))) (or ((_ is Undefined!691) lt!96595) ((_ is Found!691) lt!96595) ((_ is MissingZero!691) lt!96595) (not ((_ is MissingVacant!691) lt!96595)) (and (bvsge (index!4937 lt!96595) #b00000000000000000000000000000000) (bvslt (index!4937 lt!96595) (size!4193 (_keys!5945 thiss!1248))))) (or ((_ is Undefined!691) lt!96595) (ite ((_ is Found!691) lt!96595) (= (select (arr!3869 (_keys!5945 thiss!1248)) (index!4935 lt!96595)) key!828) (ite ((_ is MissingZero!691) lt!96595) (= (select (arr!3869 (_keys!5945 thiss!1248)) (index!4934 lt!96595)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!691) lt!96595) (= (select (arr!3869 (_keys!5945 thiss!1248)) (index!4937 lt!96595)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!127555 () SeekEntryResult!691)

(assert (=> d!56625 (= lt!96595 e!127555)))

(declare-fun c!34971 () Bool)

(declare-fun lt!96596 () SeekEntryResult!691)

(assert (=> d!56625 (= c!34971 (and ((_ is Intermediate!691) lt!96596) (undefined!1503 lt!96596)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8219 (_ BitVec 32)) SeekEntryResult!691)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!56625 (= lt!96596 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9210 thiss!1248)) key!828 (_keys!5945 thiss!1248) (mask!9210 thiss!1248)))))

(assert (=> d!56625 (validMask!0 (mask!9210 thiss!1248))))

(assert (=> d!56625 (= (seekEntryOrOpen!0 key!828 (_keys!5945 thiss!1248) (mask!9210 thiss!1248)) lt!96595)))

(declare-fun b!193888 () Bool)

(assert (=> b!193888 (= e!127555 e!127553)))

(assert (=> b!193888 (= lt!96597 (select (arr!3869 (_keys!5945 thiss!1248)) (index!4936 lt!96596)))))

(declare-fun c!34973 () Bool)

(assert (=> b!193888 (= c!34973 (= lt!96597 key!828))))

(declare-fun b!193889 () Bool)

(assert (=> b!193889 (= e!127554 (MissingZero!691 (index!4936 lt!96596)))))

(declare-fun b!193890 () Bool)

(assert (=> b!193890 (= e!127555 Undefined!691)))

(declare-fun b!193891 () Bool)

(assert (=> b!193891 (= e!127553 (Found!691 (index!4936 lt!96596)))))

(declare-fun b!193892 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8219 (_ BitVec 32)) SeekEntryResult!691)

(assert (=> b!193892 (= e!127554 (seekKeyOrZeroReturnVacant!0 (x!20669 lt!96596) (index!4936 lt!96596) (index!4936 lt!96596) key!828 (_keys!5945 thiss!1248) (mask!9210 thiss!1248)))))

(assert (= (and d!56625 c!34971) b!193890))

(assert (= (and d!56625 (not c!34971)) b!193888))

(assert (= (and b!193888 c!34973) b!193891))

(assert (= (and b!193888 (not c!34973)) b!193887))

(assert (= (and b!193887 c!34972) b!193889))

(assert (= (and b!193887 (not c!34972)) b!193892))

(declare-fun m!220659 () Bool)

(assert (=> d!56625 m!220659))

(declare-fun m!220661 () Bool)

(assert (=> d!56625 m!220661))

(declare-fun m!220663 () Bool)

(assert (=> d!56625 m!220663))

(declare-fun m!220665 () Bool)

(assert (=> d!56625 m!220665))

(declare-fun m!220667 () Bool)

(assert (=> d!56625 m!220667))

(assert (=> d!56625 m!220661))

(assert (=> d!56625 m!220457))

(declare-fun m!220669 () Bool)

(assert (=> b!193888 m!220669))

(declare-fun m!220671 () Bool)

(assert (=> b!193892 m!220671))

(assert (=> b!193680 d!56625))

(declare-fun d!56627 () Bool)

(declare-fun e!127558 () Bool)

(assert (=> d!56627 e!127558))

(declare-fun res!91642 () Bool)

(assert (=> d!56627 (=> (not res!91642) (not e!127558))))

(declare-fun lt!96603 () SeekEntryResult!691)

(assert (=> d!56627 (= res!91642 ((_ is Found!691) lt!96603))))

(assert (=> d!56627 (= lt!96603 (seekEntryOrOpen!0 key!828 (_keys!5945 thiss!1248) (mask!9210 thiss!1248)))))

(declare-fun lt!96602 () Unit!5867)

(declare-fun choose!1062 (array!8219 array!8221 (_ BitVec 32) (_ BitVec 32) V!5627 V!5627 (_ BitVec 64) Int) Unit!5867)

(assert (=> d!56627 (= lt!96602 (choose!1062 (_keys!5945 thiss!1248) (_values!3936 thiss!1248) (mask!9210 thiss!1248) (extraKeys!3690 thiss!1248) (zeroValue!3794 thiss!1248) (minValue!3794 thiss!1248) key!828 (defaultEntry!3953 thiss!1248)))))

(assert (=> d!56627 (validMask!0 (mask!9210 thiss!1248))))

(assert (=> d!56627 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!184 (_keys!5945 thiss!1248) (_values!3936 thiss!1248) (mask!9210 thiss!1248) (extraKeys!3690 thiss!1248) (zeroValue!3794 thiss!1248) (minValue!3794 thiss!1248) key!828 (defaultEntry!3953 thiss!1248)) lt!96602)))

(declare-fun b!193897 () Bool)

(declare-fun res!91641 () Bool)

(assert (=> b!193897 (=> (not res!91641) (not e!127558))))

(assert (=> b!193897 (= res!91641 (inRange!0 (index!4935 lt!96603) (mask!9210 thiss!1248)))))

(declare-fun b!193898 () Bool)

(assert (=> b!193898 (= e!127558 (= (select (arr!3869 (_keys!5945 thiss!1248)) (index!4935 lt!96603)) key!828))))

(assert (=> b!193898 (and (bvsge (index!4935 lt!96603) #b00000000000000000000000000000000) (bvslt (index!4935 lt!96603) (size!4193 (_keys!5945 thiss!1248))))))

(assert (= (and d!56627 res!91642) b!193897))

(assert (= (and b!193897 res!91641) b!193898))

(assert (=> d!56627 m!220433))

(declare-fun m!220673 () Bool)

(assert (=> d!56627 m!220673))

(assert (=> d!56627 m!220457))

(declare-fun m!220675 () Bool)

(assert (=> b!193897 m!220675))

(declare-fun m!220677 () Bool)

(assert (=> b!193898 m!220677))

(assert (=> b!193675 d!56627))

(declare-fun d!56629 () Bool)

(assert (=> d!56629 (= (inRange!0 (index!4935 lt!96437) (mask!9210 thiss!1248)) (and (bvsge (index!4935 lt!96437) #b00000000000000000000000000000000) (bvslt (index!4935 lt!96437) (bvadd (mask!9210 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!193675 d!56629))

(declare-fun d!56631 () Bool)

(assert (=> d!56631 (= (array_inv!2511 (_keys!5945 thiss!1248)) (bvsge (size!4193 (_keys!5945 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!193670 d!56631))

(declare-fun d!56633 () Bool)

(assert (=> d!56633 (= (array_inv!2512 (_values!3936 thiss!1248)) (bvsge (size!4194 (_values!3936 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!193670 d!56633))

(declare-fun b!193909 () Bool)

(declare-fun e!127570 () Bool)

(declare-fun contains!1377 (List!2445 (_ BitVec 64)) Bool)

(assert (=> b!193909 (= e!127570 (contains!1377 Nil!2442 (select (arr!3869 (_keys!5945 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193910 () Bool)

(declare-fun e!127567 () Bool)

(declare-fun e!127569 () Bool)

(assert (=> b!193910 (= e!127567 e!127569)))

(declare-fun c!34976 () Bool)

(assert (=> b!193910 (= c!34976 (validKeyInArray!0 (select (arr!3869 (_keys!5945 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19606 () Bool)

(declare-fun call!19609 () Bool)

(assert (=> bm!19606 (= call!19609 (arrayNoDuplicates!0 (_keys!5945 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!34976 (Cons!2441 (select (arr!3869 (_keys!5945 thiss!1248)) #b00000000000000000000000000000000) Nil!2442) Nil!2442)))))

(declare-fun b!193911 () Bool)

(assert (=> b!193911 (= e!127569 call!19609)))

(declare-fun b!193912 () Bool)

(declare-fun e!127568 () Bool)

(assert (=> b!193912 (= e!127568 e!127567)))

(declare-fun res!91650 () Bool)

(assert (=> b!193912 (=> (not res!91650) (not e!127567))))

(assert (=> b!193912 (= res!91650 (not e!127570))))

(declare-fun res!91651 () Bool)

(assert (=> b!193912 (=> (not res!91651) (not e!127570))))

(assert (=> b!193912 (= res!91651 (validKeyInArray!0 (select (arr!3869 (_keys!5945 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193913 () Bool)

(assert (=> b!193913 (= e!127569 call!19609)))

(declare-fun d!56635 () Bool)

(declare-fun res!91649 () Bool)

(assert (=> d!56635 (=> res!91649 e!127568)))

(assert (=> d!56635 (= res!91649 (bvsge #b00000000000000000000000000000000 (size!4193 (_keys!5945 thiss!1248))))))

(assert (=> d!56635 (= (arrayNoDuplicates!0 (_keys!5945 thiss!1248) #b00000000000000000000000000000000 Nil!2442) e!127568)))

(assert (= (and d!56635 (not res!91649)) b!193912))

(assert (= (and b!193912 res!91651) b!193909))

(assert (= (and b!193912 res!91650) b!193910))

(assert (= (and b!193910 c!34976) b!193913))

(assert (= (and b!193910 (not c!34976)) b!193911))

(assert (= (or b!193913 b!193911) bm!19606))

(assert (=> b!193909 m!220513))

(assert (=> b!193909 m!220513))

(declare-fun m!220679 () Bool)

(assert (=> b!193909 m!220679))

(assert (=> b!193910 m!220513))

(assert (=> b!193910 m!220513))

(assert (=> b!193910 m!220515))

(assert (=> bm!19606 m!220513))

(declare-fun m!220681 () Bool)

(assert (=> bm!19606 m!220681))

(assert (=> b!193912 m!220513))

(assert (=> b!193912 m!220513))

(assert (=> b!193912 m!220515))

(assert (=> b!193669 d!56635))

(declare-fun condMapEmpty!7763 () Bool)

(declare-fun mapDefault!7763 () ValueCell!1899)

(assert (=> mapNonEmpty!7757 (= condMapEmpty!7763 (= mapRest!7757 ((as const (Array (_ BitVec 32) ValueCell!1899)) mapDefault!7763)))))

(declare-fun e!127575 () Bool)

(declare-fun mapRes!7763 () Bool)

(assert (=> mapNonEmpty!7757 (= tp!17006 (and e!127575 mapRes!7763))))

(declare-fun mapIsEmpty!7763 () Bool)

(assert (=> mapIsEmpty!7763 mapRes!7763))

(declare-fun mapNonEmpty!7763 () Bool)

(declare-fun tp!17015 () Bool)

(declare-fun e!127576 () Bool)

(assert (=> mapNonEmpty!7763 (= mapRes!7763 (and tp!17015 e!127576))))

(declare-fun mapKey!7763 () (_ BitVec 32))

(declare-fun mapValue!7763 () ValueCell!1899)

(declare-fun mapRest!7763 () (Array (_ BitVec 32) ValueCell!1899))

(assert (=> mapNonEmpty!7763 (= mapRest!7757 (store mapRest!7763 mapKey!7763 mapValue!7763))))

(declare-fun b!193921 () Bool)

(assert (=> b!193921 (= e!127575 tp_is_empty!4485)))

(declare-fun b!193920 () Bool)

(assert (=> b!193920 (= e!127576 tp_is_empty!4485)))

(assert (= (and mapNonEmpty!7757 condMapEmpty!7763) mapIsEmpty!7763))

(assert (= (and mapNonEmpty!7757 (not condMapEmpty!7763)) mapNonEmpty!7763))

(assert (= (and mapNonEmpty!7763 ((_ is ValueCellFull!1899) mapValue!7763)) b!193920))

(assert (= (and mapNonEmpty!7757 ((_ is ValueCellFull!1899) mapDefault!7763)) b!193921))

(declare-fun m!220683 () Bool)

(assert (=> mapNonEmpty!7763 m!220683))

(declare-fun b_lambda!7475 () Bool)

(assert (= b_lambda!7473 (or (and b!193670 b_free!4713) b_lambda!7475)))

(declare-fun b_lambda!7477 () Bool)

(assert (= b_lambda!7471 (or (and b!193670 b_free!4713) b_lambda!7477)))

(check-sat (not b!193824) (not b!193865) (not b!193909) (not b!193807) (not mapNonEmpty!7763) (not d!56615) (not bm!19592) (not b!193873) (not b!193910) (not d!56605) (not b!193892) (not b!193912) (not b!193759) (not b!193874) (not b!193820) (not b!193897) (not b!193872) (not b!193834) (not b!193814) (not b_lambda!7475) (not b!193836) (not bm!19606) (not b_lambda!7477) b_and!11429 (not d!56623) (not bm!19594) tp_is_empty!4485 (not b!193758) (not bm!19593) (not b!193853) (not d!56613) (not b!193810) (not d!56617) (not bm!19599) (not d!56625) (not b_next!4713) (not b!193812) (not bm!19571) (not bm!19603) (not b!193841) (not bm!19601) (not bm!19596) (not bm!19600) (not b!193764) (not b!193843) (not d!56627) (not b!193845) (not b!193852) (not bm!19572) (not b!193835) (not b!193839) (not b!193823) (not d!56621) (not bm!19575) (not b!193849) (not b!193863) (not d!56619) (not b!193816))
(check-sat b_and!11429 (not b_next!4713))
