; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19764 () Bool)

(assert start!19764)

(declare-fun b!193673 () Bool)

(declare-fun b_free!4711 () Bool)

(declare-fun b_next!4711 () Bool)

(assert (=> b!193673 (= b_free!4711 (not b_next!4711))))

(declare-fun tp!16999 () Bool)

(declare-fun b_and!11435 () Bool)

(assert (=> b!193673 (= tp!16999 b_and!11435)))

(declare-fun mapIsEmpty!7754 () Bool)

(declare-fun mapRes!7754 () Bool)

(assert (=> mapIsEmpty!7754 mapRes!7754))

(declare-fun b!193668 () Bool)

(declare-fun e!127414 () Bool)

(declare-fun e!127416 () Bool)

(assert (=> b!193668 (= e!127414 (not e!127416))))

(declare-fun res!91528 () Bool)

(assert (=> b!193668 (=> res!91528 e!127416)))

(declare-datatypes ((V!5625 0))(
  ( (V!5626 (val!2286 Int)) )
))
(declare-datatypes ((ValueCell!1898 0))(
  ( (ValueCellFull!1898 (v!4246 V!5625)) (EmptyCell!1898) )
))
(declare-datatypes ((array!8201 0))(
  ( (array!8202 (arr!3860 (Array (_ BitVec 32) (_ BitVec 64))) (size!4184 (_ BitVec 32))) )
))
(declare-datatypes ((array!8203 0))(
  ( (array!8204 (arr!3861 (Array (_ BitVec 32) ValueCell!1898)) (size!4185 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2704 0))(
  ( (LongMapFixedSize!2705 (defaultEntry!3952 Int) (mask!9209 (_ BitVec 32)) (extraKeys!3689 (_ BitVec 32)) (zeroValue!3793 V!5625) (minValue!3793 V!5625) (_size!1401 (_ BitVec 32)) (_keys!5944 array!8201) (_values!3935 array!8203) (_vacant!1401 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2704)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!193668 (= res!91528 (not (validMask!0 (mask!9209 thiss!1248))))))

(declare-datatypes ((SeekEntryResult!679 0))(
  ( (MissingZero!679 (index!4886 (_ BitVec 32))) (Found!679 (index!4887 (_ BitVec 32))) (Intermediate!679 (undefined!1491 Bool) (index!4888 (_ BitVec 32)) (x!20657 (_ BitVec 32))) (Undefined!679) (MissingVacant!679 (index!4889 (_ BitVec 32))) )
))
(declare-fun lt!96479 () SeekEntryResult!679)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun v!309 () V!5625)

(declare-datatypes ((tuple2!3496 0))(
  ( (tuple2!3497 (_1!1759 (_ BitVec 64)) (_2!1759 V!5625)) )
))
(declare-datatypes ((List!2404 0))(
  ( (Nil!2401) (Cons!2400 (h!3041 tuple2!3496) (t!7320 List!2404)) )
))
(declare-datatypes ((ListLongMap!2417 0))(
  ( (ListLongMap!2418 (toList!1224 List!2404)) )
))
(declare-fun lt!96476 () ListLongMap!2417)

(declare-fun +!317 (ListLongMap!2417 tuple2!3496) ListLongMap!2417)

(declare-fun getCurrentListMap!876 (array!8201 array!8203 (_ BitVec 32) (_ BitVec 32) V!5625 V!5625 (_ BitVec 32) Int) ListLongMap!2417)

(assert (=> b!193668 (= (+!317 lt!96476 (tuple2!3497 key!828 v!309)) (getCurrentListMap!876 (_keys!5944 thiss!1248) (array!8204 (store (arr!3861 (_values!3935 thiss!1248)) (index!4887 lt!96479) (ValueCellFull!1898 v!309)) (size!4185 (_values!3935 thiss!1248))) (mask!9209 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3952 thiss!1248)))))

(declare-datatypes ((Unit!5846 0))(
  ( (Unit!5847) )
))
(declare-fun lt!96477 () Unit!5846)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!121 (array!8201 array!8203 (_ BitVec 32) (_ BitVec 32) V!5625 V!5625 (_ BitVec 32) (_ BitVec 64) V!5625 Int) Unit!5846)

(assert (=> b!193668 (= lt!96477 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!121 (_keys!5944 thiss!1248) (_values!3935 thiss!1248) (mask!9209 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) (index!4887 lt!96479) key!828 v!309 (defaultEntry!3952 thiss!1248)))))

(declare-fun lt!96481 () Unit!5846)

(declare-fun e!127420 () Unit!5846)

(assert (=> b!193668 (= lt!96481 e!127420)))

(declare-fun c!34935 () Bool)

(declare-fun contains!1359 (ListLongMap!2417 (_ BitVec 64)) Bool)

(assert (=> b!193668 (= c!34935 (contains!1359 lt!96476 key!828))))

(assert (=> b!193668 (= lt!96476 (getCurrentListMap!876 (_keys!5944 thiss!1248) (_values!3935 thiss!1248) (mask!9209 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3952 thiss!1248)))))

(declare-fun b!193669 () Bool)

(declare-fun res!91521 () Bool)

(assert (=> b!193669 (=> res!91521 e!127416)))

(assert (=> b!193669 (= res!91521 (or (not (= (size!4185 (_values!3935 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9209 thiss!1248)))) (not (= (size!4184 (_keys!5944 thiss!1248)) (size!4185 (_values!3935 thiss!1248)))) (bvslt (mask!9209 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3689 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3689 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun res!91527 () Bool)

(declare-fun e!127422 () Bool)

(assert (=> start!19764 (=> (not res!91527) (not e!127422))))

(declare-fun valid!1130 (LongMapFixedSize!2704) Bool)

(assert (=> start!19764 (= res!91527 (valid!1130 thiss!1248))))

(assert (=> start!19764 e!127422))

(declare-fun e!127419 () Bool)

(assert (=> start!19764 e!127419))

(assert (=> start!19764 true))

(declare-fun tp_is_empty!4483 () Bool)

(assert (=> start!19764 tp_is_empty!4483))

(declare-fun b!193670 () Bool)

(declare-fun lt!96478 () Unit!5846)

(assert (=> b!193670 (= e!127420 lt!96478)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!181 (array!8201 array!8203 (_ BitVec 32) (_ BitVec 32) V!5625 V!5625 (_ BitVec 64) Int) Unit!5846)

(assert (=> b!193670 (= lt!96478 (lemmaInListMapThenSeekEntryOrOpenFindsIt!181 (_keys!5944 thiss!1248) (_values!3935 thiss!1248) (mask!9209 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) key!828 (defaultEntry!3952 thiss!1248)))))

(declare-fun res!91524 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!193670 (= res!91524 (inRange!0 (index!4887 lt!96479) (mask!9209 thiss!1248)))))

(declare-fun e!127421 () Bool)

(assert (=> b!193670 (=> (not res!91524) (not e!127421))))

(assert (=> b!193670 e!127421))

(declare-fun b!193671 () Bool)

(declare-fun res!91520 () Bool)

(assert (=> b!193671 (=> res!91520 e!127416)))

(assert (=> b!193671 (= res!91520 (or (bvslt (index!4887 lt!96479) #b00000000000000000000000000000000) (bvsge (index!4887 lt!96479) (size!4184 (_keys!5944 thiss!1248)))))))

(declare-fun b!193672 () Bool)

(declare-fun res!91525 () Bool)

(assert (=> b!193672 (=> res!91525 e!127416)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8201 (_ BitVec 32)) Bool)

(assert (=> b!193672 (= res!91525 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5944 thiss!1248) (mask!9209 thiss!1248))))))

(declare-fun e!127418 () Bool)

(declare-fun array_inv!2493 (array!8201) Bool)

(declare-fun array_inv!2494 (array!8203) Bool)

(assert (=> b!193673 (= e!127419 (and tp!16999 tp_is_empty!4483 (array_inv!2493 (_keys!5944 thiss!1248)) (array_inv!2494 (_values!3935 thiss!1248)) e!127418))))

(declare-fun b!193674 () Bool)

(declare-fun res!91526 () Bool)

(assert (=> b!193674 (=> (not res!91526) (not e!127422))))

(assert (=> b!193674 (= res!91526 (not (= key!828 (bvneg key!828))))))

(declare-fun b!193675 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!193675 (= e!127416 (validKeyInArray!0 (select (arr!3860 (_keys!5944 thiss!1248)) (index!4887 lt!96479))))))

(declare-fun b!193676 () Bool)

(declare-fun e!127415 () Bool)

(assert (=> b!193676 (= e!127415 tp_is_empty!4483)))

(declare-fun b!193677 () Bool)

(assert (=> b!193677 (= e!127422 e!127414)))

(declare-fun res!91522 () Bool)

(assert (=> b!193677 (=> (not res!91522) (not e!127414))))

(get-info :version)

(assert (=> b!193677 (= res!91522 (and (not ((_ is Undefined!679) lt!96479)) (not ((_ is MissingVacant!679) lt!96479)) (not ((_ is MissingZero!679) lt!96479)) ((_ is Found!679) lt!96479)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8201 (_ BitVec 32)) SeekEntryResult!679)

(assert (=> b!193677 (= lt!96479 (seekEntryOrOpen!0 key!828 (_keys!5944 thiss!1248) (mask!9209 thiss!1248)))))

(declare-fun b!193678 () Bool)

(assert (=> b!193678 (= e!127418 (and e!127415 mapRes!7754))))

(declare-fun condMapEmpty!7754 () Bool)

(declare-fun mapDefault!7754 () ValueCell!1898)

(assert (=> b!193678 (= condMapEmpty!7754 (= (arr!3861 (_values!3935 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1898)) mapDefault!7754)))))

(declare-fun b!193679 () Bool)

(declare-fun res!91523 () Bool)

(assert (=> b!193679 (=> res!91523 e!127416)))

(declare-datatypes ((List!2405 0))(
  ( (Nil!2402) (Cons!2401 (h!3042 (_ BitVec 64)) (t!7321 List!2405)) )
))
(declare-fun arrayNoDuplicates!0 (array!8201 (_ BitVec 32) List!2405) Bool)

(assert (=> b!193679 (= res!91523 (not (arrayNoDuplicates!0 (_keys!5944 thiss!1248) #b00000000000000000000000000000000 Nil!2402)))))

(declare-fun b!193680 () Bool)

(assert (=> b!193680 (= e!127421 (= (select (arr!3860 (_keys!5944 thiss!1248)) (index!4887 lt!96479)) key!828))))

(declare-fun b!193681 () Bool)

(declare-fun e!127413 () Bool)

(assert (=> b!193681 (= e!127413 tp_is_empty!4483)))

(declare-fun b!193682 () Bool)

(declare-fun Unit!5848 () Unit!5846)

(assert (=> b!193682 (= e!127420 Unit!5848)))

(declare-fun lt!96480 () Unit!5846)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!179 (array!8201 array!8203 (_ BitVec 32) (_ BitVec 32) V!5625 V!5625 (_ BitVec 64) Int) Unit!5846)

(assert (=> b!193682 (= lt!96480 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!179 (_keys!5944 thiss!1248) (_values!3935 thiss!1248) (mask!9209 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) key!828 (defaultEntry!3952 thiss!1248)))))

(assert (=> b!193682 false))

(declare-fun mapNonEmpty!7754 () Bool)

(declare-fun tp!17000 () Bool)

(assert (=> mapNonEmpty!7754 (= mapRes!7754 (and tp!17000 e!127413))))

(declare-fun mapValue!7754 () ValueCell!1898)

(declare-fun mapKey!7754 () (_ BitVec 32))

(declare-fun mapRest!7754 () (Array (_ BitVec 32) ValueCell!1898))

(assert (=> mapNonEmpty!7754 (= (arr!3861 (_values!3935 thiss!1248)) (store mapRest!7754 mapKey!7754 mapValue!7754))))

(assert (= (and start!19764 res!91527) b!193674))

(assert (= (and b!193674 res!91526) b!193677))

(assert (= (and b!193677 res!91522) b!193668))

(assert (= (and b!193668 c!34935) b!193670))

(assert (= (and b!193668 (not c!34935)) b!193682))

(assert (= (and b!193670 res!91524) b!193680))

(assert (= (and b!193668 (not res!91528)) b!193669))

(assert (= (and b!193669 (not res!91521)) b!193672))

(assert (= (and b!193672 (not res!91525)) b!193679))

(assert (= (and b!193679 (not res!91523)) b!193671))

(assert (= (and b!193671 (not res!91520)) b!193675))

(assert (= (and b!193678 condMapEmpty!7754) mapIsEmpty!7754))

(assert (= (and b!193678 (not condMapEmpty!7754)) mapNonEmpty!7754))

(assert (= (and mapNonEmpty!7754 ((_ is ValueCellFull!1898) mapValue!7754)) b!193681))

(assert (= (and b!193678 ((_ is ValueCellFull!1898) mapDefault!7754)) b!193676))

(assert (= b!193673 b!193678))

(assert (= start!19764 b!193673))

(declare-fun m!220571 () Bool)

(assert (=> b!193682 m!220571))

(declare-fun m!220573 () Bool)

(assert (=> b!193677 m!220573))

(declare-fun m!220575 () Bool)

(assert (=> b!193668 m!220575))

(declare-fun m!220577 () Bool)

(assert (=> b!193668 m!220577))

(declare-fun m!220579 () Bool)

(assert (=> b!193668 m!220579))

(declare-fun m!220581 () Bool)

(assert (=> b!193668 m!220581))

(declare-fun m!220583 () Bool)

(assert (=> b!193668 m!220583))

(declare-fun m!220585 () Bool)

(assert (=> b!193668 m!220585))

(declare-fun m!220587 () Bool)

(assert (=> b!193668 m!220587))

(declare-fun m!220589 () Bool)

(assert (=> b!193672 m!220589))

(declare-fun m!220591 () Bool)

(assert (=> start!19764 m!220591))

(declare-fun m!220593 () Bool)

(assert (=> b!193673 m!220593))

(declare-fun m!220595 () Bool)

(assert (=> b!193673 m!220595))

(declare-fun m!220597 () Bool)

(assert (=> mapNonEmpty!7754 m!220597))

(declare-fun m!220599 () Bool)

(assert (=> b!193675 m!220599))

(assert (=> b!193675 m!220599))

(declare-fun m!220601 () Bool)

(assert (=> b!193675 m!220601))

(assert (=> b!193680 m!220599))

(declare-fun m!220603 () Bool)

(assert (=> b!193679 m!220603))

(declare-fun m!220605 () Bool)

(assert (=> b!193670 m!220605))

(declare-fun m!220607 () Bool)

(assert (=> b!193670 m!220607))

(check-sat (not start!19764) (not b!193677) (not b_next!4711) (not b!193672) (not b!193679) (not mapNonEmpty!7754) (not b!193673) tp_is_empty!4483 (not b!193675) (not b!193668) (not b!193682) b_and!11435 (not b!193670))
(check-sat b_and!11435 (not b_next!4711))
(get-model)

(declare-fun d!56679 () Bool)

(declare-fun e!127485 () Bool)

(assert (=> d!56679 e!127485))

(declare-fun res!91588 () Bool)

(assert (=> d!56679 (=> (not res!91588) (not e!127485))))

(declare-fun lt!96522 () SeekEntryResult!679)

(assert (=> d!56679 (= res!91588 ((_ is Found!679) lt!96522))))

(assert (=> d!56679 (= lt!96522 (seekEntryOrOpen!0 key!828 (_keys!5944 thiss!1248) (mask!9209 thiss!1248)))))

(declare-fun lt!96523 () Unit!5846)

(declare-fun choose!1067 (array!8201 array!8203 (_ BitVec 32) (_ BitVec 32) V!5625 V!5625 (_ BitVec 64) Int) Unit!5846)

(assert (=> d!56679 (= lt!96523 (choose!1067 (_keys!5944 thiss!1248) (_values!3935 thiss!1248) (mask!9209 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) key!828 (defaultEntry!3952 thiss!1248)))))

(assert (=> d!56679 (validMask!0 (mask!9209 thiss!1248))))

(assert (=> d!56679 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!181 (_keys!5944 thiss!1248) (_values!3935 thiss!1248) (mask!9209 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) key!828 (defaultEntry!3952 thiss!1248)) lt!96523)))

(declare-fun b!193777 () Bool)

(declare-fun res!91587 () Bool)

(assert (=> b!193777 (=> (not res!91587) (not e!127485))))

(assert (=> b!193777 (= res!91587 (inRange!0 (index!4887 lt!96522) (mask!9209 thiss!1248)))))

(declare-fun b!193778 () Bool)

(assert (=> b!193778 (= e!127485 (= (select (arr!3860 (_keys!5944 thiss!1248)) (index!4887 lt!96522)) key!828))))

(assert (=> b!193778 (and (bvsge (index!4887 lt!96522) #b00000000000000000000000000000000) (bvslt (index!4887 lt!96522) (size!4184 (_keys!5944 thiss!1248))))))

(assert (= (and d!56679 res!91588) b!193777))

(assert (= (and b!193777 res!91587) b!193778))

(assert (=> d!56679 m!220573))

(declare-fun m!220685 () Bool)

(assert (=> d!56679 m!220685))

(assert (=> d!56679 m!220581))

(declare-fun m!220687 () Bool)

(assert (=> b!193777 m!220687))

(declare-fun m!220689 () Bool)

(assert (=> b!193778 m!220689))

(assert (=> b!193670 d!56679))

(declare-fun d!56681 () Bool)

(assert (=> d!56681 (= (inRange!0 (index!4887 lt!96479) (mask!9209 thiss!1248)) (and (bvsge (index!4887 lt!96479) #b00000000000000000000000000000000) (bvslt (index!4887 lt!96479) (bvadd (mask!9209 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!193670 d!56681))

(declare-fun d!56683 () Bool)

(assert (=> d!56683 (= (validKeyInArray!0 (select (arr!3860 (_keys!5944 thiss!1248)) (index!4887 lt!96479))) (and (not (= (select (arr!3860 (_keys!5944 thiss!1248)) (index!4887 lt!96479)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3860 (_keys!5944 thiss!1248)) (index!4887 lt!96479)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!193675 d!56683))

(declare-fun d!56685 () Bool)

(assert (=> d!56685 (= (validMask!0 (mask!9209 thiss!1248)) (and (or (= (mask!9209 thiss!1248) #b00000000000000000000000000000111) (= (mask!9209 thiss!1248) #b00000000000000000000000000001111) (= (mask!9209 thiss!1248) #b00000000000000000000000000011111) (= (mask!9209 thiss!1248) #b00000000000000000000000000111111) (= (mask!9209 thiss!1248) #b00000000000000000000000001111111) (= (mask!9209 thiss!1248) #b00000000000000000000000011111111) (= (mask!9209 thiss!1248) #b00000000000000000000000111111111) (= (mask!9209 thiss!1248) #b00000000000000000000001111111111) (= (mask!9209 thiss!1248) #b00000000000000000000011111111111) (= (mask!9209 thiss!1248) #b00000000000000000000111111111111) (= (mask!9209 thiss!1248) #b00000000000000000001111111111111) (= (mask!9209 thiss!1248) #b00000000000000000011111111111111) (= (mask!9209 thiss!1248) #b00000000000000000111111111111111) (= (mask!9209 thiss!1248) #b00000000000000001111111111111111) (= (mask!9209 thiss!1248) #b00000000000000011111111111111111) (= (mask!9209 thiss!1248) #b00000000000000111111111111111111) (= (mask!9209 thiss!1248) #b00000000000001111111111111111111) (= (mask!9209 thiss!1248) #b00000000000011111111111111111111) (= (mask!9209 thiss!1248) #b00000000000111111111111111111111) (= (mask!9209 thiss!1248) #b00000000001111111111111111111111) (= (mask!9209 thiss!1248) #b00000000011111111111111111111111) (= (mask!9209 thiss!1248) #b00000000111111111111111111111111) (= (mask!9209 thiss!1248) #b00000001111111111111111111111111) (= (mask!9209 thiss!1248) #b00000011111111111111111111111111) (= (mask!9209 thiss!1248) #b00000111111111111111111111111111) (= (mask!9209 thiss!1248) #b00001111111111111111111111111111) (= (mask!9209 thiss!1248) #b00011111111111111111111111111111) (= (mask!9209 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9209 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!193668 d!56685))

(declare-fun b!193821 () Bool)

(declare-fun c!34959 () Bool)

(assert (=> b!193821 (= c!34959 (and (not (= (bvand (extraKeys!3689 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3689 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!127516 () ListLongMap!2417)

(declare-fun e!127522 () ListLongMap!2417)

(assert (=> b!193821 (= e!127516 e!127522)))

(declare-fun b!193822 () Bool)

(declare-fun e!127512 () Unit!5846)

(declare-fun lt!96569 () Unit!5846)

(assert (=> b!193822 (= e!127512 lt!96569)))

(declare-fun lt!96586 () ListLongMap!2417)

(declare-fun getCurrentListMapNoExtraKeys!218 (array!8201 array!8203 (_ BitVec 32) (_ BitVec 32) V!5625 V!5625 (_ BitVec 32) Int) ListLongMap!2417)

(assert (=> b!193822 (= lt!96586 (getCurrentListMapNoExtraKeys!218 (_keys!5944 thiss!1248) (array!8204 (store (arr!3861 (_values!3935 thiss!1248)) (index!4887 lt!96479) (ValueCellFull!1898 v!309)) (size!4185 (_values!3935 thiss!1248))) (mask!9209 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3952 thiss!1248)))))

(declare-fun lt!96575 () (_ BitVec 64))

(assert (=> b!193822 (= lt!96575 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96571 () (_ BitVec 64))

(assert (=> b!193822 (= lt!96571 (select (arr!3860 (_keys!5944 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96581 () Unit!5846)

(declare-fun addStillContains!163 (ListLongMap!2417 (_ BitVec 64) V!5625 (_ BitVec 64)) Unit!5846)

(assert (=> b!193822 (= lt!96581 (addStillContains!163 lt!96586 lt!96575 (zeroValue!3793 thiss!1248) lt!96571))))

(assert (=> b!193822 (contains!1359 (+!317 lt!96586 (tuple2!3497 lt!96575 (zeroValue!3793 thiss!1248))) lt!96571)))

(declare-fun lt!96570 () Unit!5846)

(assert (=> b!193822 (= lt!96570 lt!96581)))

(declare-fun lt!96587 () ListLongMap!2417)

(assert (=> b!193822 (= lt!96587 (getCurrentListMapNoExtraKeys!218 (_keys!5944 thiss!1248) (array!8204 (store (arr!3861 (_values!3935 thiss!1248)) (index!4887 lt!96479) (ValueCellFull!1898 v!309)) (size!4185 (_values!3935 thiss!1248))) (mask!9209 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3952 thiss!1248)))))

(declare-fun lt!96574 () (_ BitVec 64))

(assert (=> b!193822 (= lt!96574 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96578 () (_ BitVec 64))

(assert (=> b!193822 (= lt!96578 (select (arr!3860 (_keys!5944 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96582 () Unit!5846)

(declare-fun addApplyDifferent!163 (ListLongMap!2417 (_ BitVec 64) V!5625 (_ BitVec 64)) Unit!5846)

(assert (=> b!193822 (= lt!96582 (addApplyDifferent!163 lt!96587 lt!96574 (minValue!3793 thiss!1248) lt!96578))))

(declare-fun apply!187 (ListLongMap!2417 (_ BitVec 64)) V!5625)

(assert (=> b!193822 (= (apply!187 (+!317 lt!96587 (tuple2!3497 lt!96574 (minValue!3793 thiss!1248))) lt!96578) (apply!187 lt!96587 lt!96578))))

(declare-fun lt!96589 () Unit!5846)

(assert (=> b!193822 (= lt!96589 lt!96582)))

(declare-fun lt!96583 () ListLongMap!2417)

(assert (=> b!193822 (= lt!96583 (getCurrentListMapNoExtraKeys!218 (_keys!5944 thiss!1248) (array!8204 (store (arr!3861 (_values!3935 thiss!1248)) (index!4887 lt!96479) (ValueCellFull!1898 v!309)) (size!4185 (_values!3935 thiss!1248))) (mask!9209 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3952 thiss!1248)))))

(declare-fun lt!96579 () (_ BitVec 64))

(assert (=> b!193822 (= lt!96579 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96588 () (_ BitVec 64))

(assert (=> b!193822 (= lt!96588 (select (arr!3860 (_keys!5944 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96568 () Unit!5846)

(assert (=> b!193822 (= lt!96568 (addApplyDifferent!163 lt!96583 lt!96579 (zeroValue!3793 thiss!1248) lt!96588))))

(assert (=> b!193822 (= (apply!187 (+!317 lt!96583 (tuple2!3497 lt!96579 (zeroValue!3793 thiss!1248))) lt!96588) (apply!187 lt!96583 lt!96588))))

(declare-fun lt!96580 () Unit!5846)

(assert (=> b!193822 (= lt!96580 lt!96568)))

(declare-fun lt!96585 () ListLongMap!2417)

(assert (=> b!193822 (= lt!96585 (getCurrentListMapNoExtraKeys!218 (_keys!5944 thiss!1248) (array!8204 (store (arr!3861 (_values!3935 thiss!1248)) (index!4887 lt!96479) (ValueCellFull!1898 v!309)) (size!4185 (_values!3935 thiss!1248))) (mask!9209 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3952 thiss!1248)))))

(declare-fun lt!96572 () (_ BitVec 64))

(assert (=> b!193822 (= lt!96572 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96573 () (_ BitVec 64))

(assert (=> b!193822 (= lt!96573 (select (arr!3860 (_keys!5944 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!193822 (= lt!96569 (addApplyDifferent!163 lt!96585 lt!96572 (minValue!3793 thiss!1248) lt!96573))))

(assert (=> b!193822 (= (apply!187 (+!317 lt!96585 (tuple2!3497 lt!96572 (minValue!3793 thiss!1248))) lt!96573) (apply!187 lt!96585 lt!96573))))

(declare-fun b!193823 () Bool)

(declare-fun e!127519 () Bool)

(declare-fun lt!96576 () ListLongMap!2417)

(assert (=> b!193823 (= e!127519 (= (apply!187 lt!96576 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3793 thiss!1248)))))

(declare-fun b!193824 () Bool)

(declare-fun e!127520 () Bool)

(assert (=> b!193824 (= e!127520 (= (apply!187 lt!96576 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3793 thiss!1248)))))

(declare-fun bm!19569 () Bool)

(declare-fun call!19578 () Bool)

(assert (=> bm!19569 (= call!19578 (contains!1359 lt!96576 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!193825 () Bool)

(declare-fun call!19574 () ListLongMap!2417)

(assert (=> b!193825 (= e!127522 call!19574)))

(declare-fun bm!19570 () Bool)

(declare-fun call!19572 () ListLongMap!2417)

(declare-fun call!19573 () ListLongMap!2417)

(assert (=> bm!19570 (= call!19572 call!19573)))

(declare-fun call!19577 () ListLongMap!2417)

(declare-fun bm!19571 () Bool)

(declare-fun c!34957 () Bool)

(declare-fun call!19575 () ListLongMap!2417)

(declare-fun c!34956 () Bool)

(assert (=> bm!19571 (= call!19575 (+!317 (ite c!34957 call!19577 (ite c!34956 call!19573 call!19572)) (ite (or c!34957 c!34956) (tuple2!3497 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3793 thiss!1248)) (tuple2!3497 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3793 thiss!1248)))))))

(declare-fun b!193827 () Bool)

(declare-fun e!127515 () Bool)

(declare-fun e!127521 () Bool)

(assert (=> b!193827 (= e!127515 e!127521)))

(declare-fun res!91614 () Bool)

(assert (=> b!193827 (=> (not res!91614) (not e!127521))))

(assert (=> b!193827 (= res!91614 (contains!1359 lt!96576 (select (arr!3860 (_keys!5944 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!193827 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4184 (_keys!5944 thiss!1248))))))

(declare-fun b!193828 () Bool)

(assert (=> b!193828 (= e!127522 call!19572)))

(declare-fun bm!19572 () Bool)

(assert (=> bm!19572 (= call!19573 call!19577)))

(declare-fun bm!19573 () Bool)

(assert (=> bm!19573 (= call!19577 (getCurrentListMapNoExtraKeys!218 (_keys!5944 thiss!1248) (array!8204 (store (arr!3861 (_values!3935 thiss!1248)) (index!4887 lt!96479) (ValueCellFull!1898 v!309)) (size!4185 (_values!3935 thiss!1248))) (mask!9209 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3952 thiss!1248)))))

(declare-fun b!193829 () Bool)

(declare-fun get!2240 (ValueCell!1898 V!5625) V!5625)

(declare-fun dynLambda!530 (Int (_ BitVec 64)) V!5625)

(assert (=> b!193829 (= e!127521 (= (apply!187 lt!96576 (select (arr!3860 (_keys!5944 thiss!1248)) #b00000000000000000000000000000000)) (get!2240 (select (arr!3861 (array!8204 (store (arr!3861 (_values!3935 thiss!1248)) (index!4887 lt!96479) (ValueCellFull!1898 v!309)) (size!4185 (_values!3935 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!530 (defaultEntry!3952 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!193829 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4185 (array!8204 (store (arr!3861 (_values!3935 thiss!1248)) (index!4887 lt!96479) (ValueCellFull!1898 v!309)) (size!4185 (_values!3935 thiss!1248))))))))

(assert (=> b!193829 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4184 (_keys!5944 thiss!1248))))))

(declare-fun b!193830 () Bool)

(declare-fun e!127513 () Bool)

(assert (=> b!193830 (= e!127513 e!127519)))

(declare-fun res!91615 () Bool)

(assert (=> b!193830 (= res!91615 call!19578)))

(assert (=> b!193830 (=> (not res!91615) (not e!127519))))

(declare-fun b!193831 () Bool)

(declare-fun res!91613 () Bool)

(declare-fun e!127517 () Bool)

(assert (=> b!193831 (=> (not res!91613) (not e!127517))))

(assert (=> b!193831 (= res!91613 e!127515)))

(declare-fun res!91612 () Bool)

(assert (=> b!193831 (=> res!91612 e!127515)))

(declare-fun e!127518 () Bool)

(assert (=> b!193831 (= res!91612 (not e!127518))))

(declare-fun res!91609 () Bool)

(assert (=> b!193831 (=> (not res!91609) (not e!127518))))

(assert (=> b!193831 (= res!91609 (bvslt #b00000000000000000000000000000000 (size!4184 (_keys!5944 thiss!1248))))))

(declare-fun b!193832 () Bool)

(declare-fun e!127514 () Bool)

(declare-fun call!19576 () Bool)

(assert (=> b!193832 (= e!127514 (not call!19576))))

(declare-fun b!193833 () Bool)

(assert (=> b!193833 (= e!127514 e!127520)))

(declare-fun res!91608 () Bool)

(assert (=> b!193833 (= res!91608 call!19576)))

(assert (=> b!193833 (=> (not res!91608) (not e!127520))))

(declare-fun b!193834 () Bool)

(declare-fun e!127523 () Bool)

(assert (=> b!193834 (= e!127523 (validKeyInArray!0 (select (arr!3860 (_keys!5944 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19574 () Bool)

(assert (=> bm!19574 (= call!19574 call!19575)))

(declare-fun bm!19575 () Bool)

(assert (=> bm!19575 (= call!19576 (contains!1359 lt!96576 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!193835 () Bool)

(assert (=> b!193835 (= e!127513 (not call!19578))))

(declare-fun b!193836 () Bool)

(declare-fun res!91610 () Bool)

(assert (=> b!193836 (=> (not res!91610) (not e!127517))))

(assert (=> b!193836 (= res!91610 e!127514)))

(declare-fun c!34955 () Bool)

(assert (=> b!193836 (= c!34955 (not (= (bvand (extraKeys!3689 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!193826 () Bool)

(assert (=> b!193826 (= e!127516 call!19574)))

(declare-fun d!56687 () Bool)

(assert (=> d!56687 e!127517))

(declare-fun res!91611 () Bool)

(assert (=> d!56687 (=> (not res!91611) (not e!127517))))

(assert (=> d!56687 (= res!91611 (or (bvsge #b00000000000000000000000000000000 (size!4184 (_keys!5944 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4184 (_keys!5944 thiss!1248))))))))

(declare-fun lt!96577 () ListLongMap!2417)

(assert (=> d!56687 (= lt!96576 lt!96577)))

(declare-fun lt!96584 () Unit!5846)

(assert (=> d!56687 (= lt!96584 e!127512)))

(declare-fun c!34954 () Bool)

(assert (=> d!56687 (= c!34954 e!127523)))

(declare-fun res!91607 () Bool)

(assert (=> d!56687 (=> (not res!91607) (not e!127523))))

(assert (=> d!56687 (= res!91607 (bvslt #b00000000000000000000000000000000 (size!4184 (_keys!5944 thiss!1248))))))

(declare-fun e!127524 () ListLongMap!2417)

(assert (=> d!56687 (= lt!96577 e!127524)))

(assert (=> d!56687 (= c!34957 (and (not (= (bvand (extraKeys!3689 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3689 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56687 (validMask!0 (mask!9209 thiss!1248))))

(assert (=> d!56687 (= (getCurrentListMap!876 (_keys!5944 thiss!1248) (array!8204 (store (arr!3861 (_values!3935 thiss!1248)) (index!4887 lt!96479) (ValueCellFull!1898 v!309)) (size!4185 (_values!3935 thiss!1248))) (mask!9209 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3952 thiss!1248)) lt!96576)))

(declare-fun b!193837 () Bool)

(declare-fun Unit!5855 () Unit!5846)

(assert (=> b!193837 (= e!127512 Unit!5855)))

(declare-fun b!193838 () Bool)

(assert (=> b!193838 (= e!127517 e!127513)))

(declare-fun c!34958 () Bool)

(assert (=> b!193838 (= c!34958 (not (= (bvand (extraKeys!3689 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!193839 () Bool)

(assert (=> b!193839 (= e!127524 (+!317 call!19575 (tuple2!3497 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3793 thiss!1248))))))

(declare-fun b!193840 () Bool)

(assert (=> b!193840 (= e!127524 e!127516)))

(assert (=> b!193840 (= c!34956 (and (not (= (bvand (extraKeys!3689 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3689 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!193841 () Bool)

(assert (=> b!193841 (= e!127518 (validKeyInArray!0 (select (arr!3860 (_keys!5944 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!56687 c!34957) b!193839))

(assert (= (and d!56687 (not c!34957)) b!193840))

(assert (= (and b!193840 c!34956) b!193826))

(assert (= (and b!193840 (not c!34956)) b!193821))

(assert (= (and b!193821 c!34959) b!193825))

(assert (= (and b!193821 (not c!34959)) b!193828))

(assert (= (or b!193825 b!193828) bm!19570))

(assert (= (or b!193826 bm!19570) bm!19572))

(assert (= (or b!193826 b!193825) bm!19574))

(assert (= (or b!193839 bm!19572) bm!19573))

(assert (= (or b!193839 bm!19574) bm!19571))

(assert (= (and d!56687 res!91607) b!193834))

(assert (= (and d!56687 c!34954) b!193822))

(assert (= (and d!56687 (not c!34954)) b!193837))

(assert (= (and d!56687 res!91611) b!193831))

(assert (= (and b!193831 res!91609) b!193841))

(assert (= (and b!193831 (not res!91612)) b!193827))

(assert (= (and b!193827 res!91614) b!193829))

(assert (= (and b!193831 res!91613) b!193836))

(assert (= (and b!193836 c!34955) b!193833))

(assert (= (and b!193836 (not c!34955)) b!193832))

(assert (= (and b!193833 res!91608) b!193824))

(assert (= (or b!193833 b!193832) bm!19575))

(assert (= (and b!193836 res!91610) b!193838))

(assert (= (and b!193838 c!34958) b!193830))

(assert (= (and b!193838 (not c!34958)) b!193835))

(assert (= (and b!193830 res!91615) b!193823))

(assert (= (or b!193830 b!193835) bm!19569))

(declare-fun b_lambda!7493 () Bool)

(assert (=> (not b_lambda!7493) (not b!193829)))

(declare-fun t!7325 () Bool)

(declare-fun tb!2877 () Bool)

(assert (=> (and b!193673 (= (defaultEntry!3952 thiss!1248) (defaultEntry!3952 thiss!1248)) t!7325) tb!2877))

(declare-fun result!4925 () Bool)

(assert (=> tb!2877 (= result!4925 tp_is_empty!4483)))

(assert (=> b!193829 t!7325))

(declare-fun b_and!11441 () Bool)

(assert (= b_and!11435 (and (=> t!7325 result!4925) b_and!11441)))

(declare-fun m!220691 () Bool)

(assert (=> bm!19569 m!220691))

(declare-fun m!220693 () Bool)

(assert (=> b!193822 m!220693))

(declare-fun m!220695 () Bool)

(assert (=> b!193822 m!220695))

(declare-fun m!220697 () Bool)

(assert (=> b!193822 m!220697))

(declare-fun m!220699 () Bool)

(assert (=> b!193822 m!220699))

(declare-fun m!220701 () Bool)

(assert (=> b!193822 m!220701))

(declare-fun m!220703 () Bool)

(assert (=> b!193822 m!220703))

(declare-fun m!220705 () Bool)

(assert (=> b!193822 m!220705))

(assert (=> b!193822 m!220705))

(declare-fun m!220707 () Bool)

(assert (=> b!193822 m!220707))

(declare-fun m!220709 () Bool)

(assert (=> b!193822 m!220709))

(assert (=> b!193822 m!220695))

(assert (=> b!193822 m!220693))

(declare-fun m!220711 () Bool)

(assert (=> b!193822 m!220711))

(declare-fun m!220713 () Bool)

(assert (=> b!193822 m!220713))

(declare-fun m!220715 () Bool)

(assert (=> b!193822 m!220715))

(declare-fun m!220717 () Bool)

(assert (=> b!193822 m!220717))

(declare-fun m!220719 () Bool)

(assert (=> b!193822 m!220719))

(assert (=> b!193822 m!220701))

(declare-fun m!220721 () Bool)

(assert (=> b!193822 m!220721))

(declare-fun m!220723 () Bool)

(assert (=> b!193822 m!220723))

(declare-fun m!220725 () Bool)

(assert (=> b!193822 m!220725))

(assert (=> b!193829 m!220719))

(declare-fun m!220727 () Bool)

(assert (=> b!193829 m!220727))

(declare-fun m!220729 () Bool)

(assert (=> b!193829 m!220729))

(declare-fun m!220731 () Bool)

(assert (=> b!193829 m!220731))

(assert (=> b!193829 m!220719))

(declare-fun m!220733 () Bool)

(assert (=> b!193829 m!220733))

(assert (=> b!193829 m!220729))

(assert (=> b!193829 m!220727))

(declare-fun m!220735 () Bool)

(assert (=> bm!19571 m!220735))

(declare-fun m!220737 () Bool)

(assert (=> b!193824 m!220737))

(assert (=> b!193841 m!220719))

(assert (=> b!193841 m!220719))

(declare-fun m!220739 () Bool)

(assert (=> b!193841 m!220739))

(assert (=> d!56687 m!220581))

(assert (=> bm!19573 m!220723))

(declare-fun m!220741 () Bool)

(assert (=> b!193823 m!220741))

(assert (=> b!193834 m!220719))

(assert (=> b!193834 m!220719))

(assert (=> b!193834 m!220739))

(declare-fun m!220743 () Bool)

(assert (=> b!193839 m!220743))

(declare-fun m!220745 () Bool)

(assert (=> bm!19575 m!220745))

(assert (=> b!193827 m!220719))

(assert (=> b!193827 m!220719))

(declare-fun m!220747 () Bool)

(assert (=> b!193827 m!220747))

(assert (=> b!193668 d!56687))

(declare-fun d!56689 () Bool)

(declare-fun e!127527 () Bool)

(assert (=> d!56689 e!127527))

(declare-fun res!91618 () Bool)

(assert (=> d!56689 (=> (not res!91618) (not e!127527))))

(assert (=> d!56689 (= res!91618 (and (bvsge (index!4887 lt!96479) #b00000000000000000000000000000000) (bvslt (index!4887 lt!96479) (size!4185 (_values!3935 thiss!1248)))))))

(declare-fun lt!96592 () Unit!5846)

(declare-fun choose!1068 (array!8201 array!8203 (_ BitVec 32) (_ BitVec 32) V!5625 V!5625 (_ BitVec 32) (_ BitVec 64) V!5625 Int) Unit!5846)

(assert (=> d!56689 (= lt!96592 (choose!1068 (_keys!5944 thiss!1248) (_values!3935 thiss!1248) (mask!9209 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) (index!4887 lt!96479) key!828 v!309 (defaultEntry!3952 thiss!1248)))))

(assert (=> d!56689 (validMask!0 (mask!9209 thiss!1248))))

(assert (=> d!56689 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!121 (_keys!5944 thiss!1248) (_values!3935 thiss!1248) (mask!9209 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) (index!4887 lt!96479) key!828 v!309 (defaultEntry!3952 thiss!1248)) lt!96592)))

(declare-fun b!193846 () Bool)

(assert (=> b!193846 (= e!127527 (= (+!317 (getCurrentListMap!876 (_keys!5944 thiss!1248) (_values!3935 thiss!1248) (mask!9209 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3952 thiss!1248)) (tuple2!3497 key!828 v!309)) (getCurrentListMap!876 (_keys!5944 thiss!1248) (array!8204 (store (arr!3861 (_values!3935 thiss!1248)) (index!4887 lt!96479) (ValueCellFull!1898 v!309)) (size!4185 (_values!3935 thiss!1248))) (mask!9209 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3952 thiss!1248))))))

(assert (= (and d!56689 res!91618) b!193846))

(declare-fun m!220749 () Bool)

(assert (=> d!56689 m!220749))

(assert (=> d!56689 m!220581))

(assert (=> b!193846 m!220577))

(assert (=> b!193846 m!220577))

(declare-fun m!220751 () Bool)

(assert (=> b!193846 m!220751))

(assert (=> b!193846 m!220587))

(assert (=> b!193846 m!220583))

(assert (=> b!193668 d!56689))

(declare-fun d!56691 () Bool)

(declare-fun e!127533 () Bool)

(assert (=> d!56691 e!127533))

(declare-fun res!91621 () Bool)

(assert (=> d!56691 (=> res!91621 e!127533)))

(declare-fun lt!96604 () Bool)

(assert (=> d!56691 (= res!91621 (not lt!96604))))

(declare-fun lt!96603 () Bool)

(assert (=> d!56691 (= lt!96604 lt!96603)))

(declare-fun lt!96601 () Unit!5846)

(declare-fun e!127532 () Unit!5846)

(assert (=> d!56691 (= lt!96601 e!127532)))

(declare-fun c!34962 () Bool)

(assert (=> d!56691 (= c!34962 lt!96603)))

(declare-fun containsKey!248 (List!2404 (_ BitVec 64)) Bool)

(assert (=> d!56691 (= lt!96603 (containsKey!248 (toList!1224 lt!96476) key!828))))

(assert (=> d!56691 (= (contains!1359 lt!96476 key!828) lt!96604)))

(declare-fun b!193853 () Bool)

(declare-fun lt!96602 () Unit!5846)

(assert (=> b!193853 (= e!127532 lt!96602)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!196 (List!2404 (_ BitVec 64)) Unit!5846)

(assert (=> b!193853 (= lt!96602 (lemmaContainsKeyImpliesGetValueByKeyDefined!196 (toList!1224 lt!96476) key!828))))

(declare-datatypes ((Option!251 0))(
  ( (Some!250 (v!4251 V!5625)) (None!249) )
))
(declare-fun isDefined!197 (Option!251) Bool)

(declare-fun getValueByKey!245 (List!2404 (_ BitVec 64)) Option!251)

(assert (=> b!193853 (isDefined!197 (getValueByKey!245 (toList!1224 lt!96476) key!828))))

(declare-fun b!193854 () Bool)

(declare-fun Unit!5856 () Unit!5846)

(assert (=> b!193854 (= e!127532 Unit!5856)))

(declare-fun b!193855 () Bool)

(assert (=> b!193855 (= e!127533 (isDefined!197 (getValueByKey!245 (toList!1224 lt!96476) key!828)))))

(assert (= (and d!56691 c!34962) b!193853))

(assert (= (and d!56691 (not c!34962)) b!193854))

(assert (= (and d!56691 (not res!91621)) b!193855))

(declare-fun m!220753 () Bool)

(assert (=> d!56691 m!220753))

(declare-fun m!220755 () Bool)

(assert (=> b!193853 m!220755))

(declare-fun m!220757 () Bool)

(assert (=> b!193853 m!220757))

(assert (=> b!193853 m!220757))

(declare-fun m!220759 () Bool)

(assert (=> b!193853 m!220759))

(assert (=> b!193855 m!220757))

(assert (=> b!193855 m!220757))

(assert (=> b!193855 m!220759))

(assert (=> b!193668 d!56691))

(declare-fun d!56693 () Bool)

(declare-fun e!127536 () Bool)

(assert (=> d!56693 e!127536))

(declare-fun res!91627 () Bool)

(assert (=> d!56693 (=> (not res!91627) (not e!127536))))

(declare-fun lt!96613 () ListLongMap!2417)

(assert (=> d!56693 (= res!91627 (contains!1359 lt!96613 (_1!1759 (tuple2!3497 key!828 v!309))))))

(declare-fun lt!96616 () List!2404)

(assert (=> d!56693 (= lt!96613 (ListLongMap!2418 lt!96616))))

(declare-fun lt!96614 () Unit!5846)

(declare-fun lt!96615 () Unit!5846)

(assert (=> d!56693 (= lt!96614 lt!96615)))

(assert (=> d!56693 (= (getValueByKey!245 lt!96616 (_1!1759 (tuple2!3497 key!828 v!309))) (Some!250 (_2!1759 (tuple2!3497 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!132 (List!2404 (_ BitVec 64) V!5625) Unit!5846)

(assert (=> d!56693 (= lt!96615 (lemmaContainsTupThenGetReturnValue!132 lt!96616 (_1!1759 (tuple2!3497 key!828 v!309)) (_2!1759 (tuple2!3497 key!828 v!309))))))

(declare-fun insertStrictlySorted!135 (List!2404 (_ BitVec 64) V!5625) List!2404)

(assert (=> d!56693 (= lt!96616 (insertStrictlySorted!135 (toList!1224 lt!96476) (_1!1759 (tuple2!3497 key!828 v!309)) (_2!1759 (tuple2!3497 key!828 v!309))))))

(assert (=> d!56693 (= (+!317 lt!96476 (tuple2!3497 key!828 v!309)) lt!96613)))

(declare-fun b!193860 () Bool)

(declare-fun res!91626 () Bool)

(assert (=> b!193860 (=> (not res!91626) (not e!127536))))

(assert (=> b!193860 (= res!91626 (= (getValueByKey!245 (toList!1224 lt!96613) (_1!1759 (tuple2!3497 key!828 v!309))) (Some!250 (_2!1759 (tuple2!3497 key!828 v!309)))))))

(declare-fun b!193861 () Bool)

(declare-fun contains!1361 (List!2404 tuple2!3496) Bool)

(assert (=> b!193861 (= e!127536 (contains!1361 (toList!1224 lt!96613) (tuple2!3497 key!828 v!309)))))

(assert (= (and d!56693 res!91627) b!193860))

(assert (= (and b!193860 res!91626) b!193861))

(declare-fun m!220761 () Bool)

(assert (=> d!56693 m!220761))

(declare-fun m!220763 () Bool)

(assert (=> d!56693 m!220763))

(declare-fun m!220765 () Bool)

(assert (=> d!56693 m!220765))

(declare-fun m!220767 () Bool)

(assert (=> d!56693 m!220767))

(declare-fun m!220769 () Bool)

(assert (=> b!193860 m!220769))

(declare-fun m!220771 () Bool)

(assert (=> b!193861 m!220771))

(assert (=> b!193668 d!56693))

(declare-fun b!193862 () Bool)

(declare-fun c!34968 () Bool)

(assert (=> b!193862 (= c!34968 (and (not (= (bvand (extraKeys!3689 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3689 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!127541 () ListLongMap!2417)

(declare-fun e!127547 () ListLongMap!2417)

(assert (=> b!193862 (= e!127541 e!127547)))

(declare-fun b!193863 () Bool)

(declare-fun e!127537 () Unit!5846)

(declare-fun lt!96618 () Unit!5846)

(assert (=> b!193863 (= e!127537 lt!96618)))

(declare-fun lt!96635 () ListLongMap!2417)

(assert (=> b!193863 (= lt!96635 (getCurrentListMapNoExtraKeys!218 (_keys!5944 thiss!1248) (_values!3935 thiss!1248) (mask!9209 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3952 thiss!1248)))))

(declare-fun lt!96624 () (_ BitVec 64))

(assert (=> b!193863 (= lt!96624 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96620 () (_ BitVec 64))

(assert (=> b!193863 (= lt!96620 (select (arr!3860 (_keys!5944 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96630 () Unit!5846)

(assert (=> b!193863 (= lt!96630 (addStillContains!163 lt!96635 lt!96624 (zeroValue!3793 thiss!1248) lt!96620))))

(assert (=> b!193863 (contains!1359 (+!317 lt!96635 (tuple2!3497 lt!96624 (zeroValue!3793 thiss!1248))) lt!96620)))

(declare-fun lt!96619 () Unit!5846)

(assert (=> b!193863 (= lt!96619 lt!96630)))

(declare-fun lt!96636 () ListLongMap!2417)

(assert (=> b!193863 (= lt!96636 (getCurrentListMapNoExtraKeys!218 (_keys!5944 thiss!1248) (_values!3935 thiss!1248) (mask!9209 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3952 thiss!1248)))))

(declare-fun lt!96623 () (_ BitVec 64))

(assert (=> b!193863 (= lt!96623 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96627 () (_ BitVec 64))

(assert (=> b!193863 (= lt!96627 (select (arr!3860 (_keys!5944 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96631 () Unit!5846)

(assert (=> b!193863 (= lt!96631 (addApplyDifferent!163 lt!96636 lt!96623 (minValue!3793 thiss!1248) lt!96627))))

(assert (=> b!193863 (= (apply!187 (+!317 lt!96636 (tuple2!3497 lt!96623 (minValue!3793 thiss!1248))) lt!96627) (apply!187 lt!96636 lt!96627))))

(declare-fun lt!96638 () Unit!5846)

(assert (=> b!193863 (= lt!96638 lt!96631)))

(declare-fun lt!96632 () ListLongMap!2417)

(assert (=> b!193863 (= lt!96632 (getCurrentListMapNoExtraKeys!218 (_keys!5944 thiss!1248) (_values!3935 thiss!1248) (mask!9209 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3952 thiss!1248)))))

(declare-fun lt!96628 () (_ BitVec 64))

(assert (=> b!193863 (= lt!96628 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96637 () (_ BitVec 64))

(assert (=> b!193863 (= lt!96637 (select (arr!3860 (_keys!5944 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96617 () Unit!5846)

(assert (=> b!193863 (= lt!96617 (addApplyDifferent!163 lt!96632 lt!96628 (zeroValue!3793 thiss!1248) lt!96637))))

(assert (=> b!193863 (= (apply!187 (+!317 lt!96632 (tuple2!3497 lt!96628 (zeroValue!3793 thiss!1248))) lt!96637) (apply!187 lt!96632 lt!96637))))

(declare-fun lt!96629 () Unit!5846)

(assert (=> b!193863 (= lt!96629 lt!96617)))

(declare-fun lt!96634 () ListLongMap!2417)

(assert (=> b!193863 (= lt!96634 (getCurrentListMapNoExtraKeys!218 (_keys!5944 thiss!1248) (_values!3935 thiss!1248) (mask!9209 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3952 thiss!1248)))))

(declare-fun lt!96621 () (_ BitVec 64))

(assert (=> b!193863 (= lt!96621 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96622 () (_ BitVec 64))

(assert (=> b!193863 (= lt!96622 (select (arr!3860 (_keys!5944 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!193863 (= lt!96618 (addApplyDifferent!163 lt!96634 lt!96621 (minValue!3793 thiss!1248) lt!96622))))

(assert (=> b!193863 (= (apply!187 (+!317 lt!96634 (tuple2!3497 lt!96621 (minValue!3793 thiss!1248))) lt!96622) (apply!187 lt!96634 lt!96622))))

(declare-fun b!193864 () Bool)

(declare-fun e!127544 () Bool)

(declare-fun lt!96625 () ListLongMap!2417)

(assert (=> b!193864 (= e!127544 (= (apply!187 lt!96625 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3793 thiss!1248)))))

(declare-fun b!193865 () Bool)

(declare-fun e!127545 () Bool)

(assert (=> b!193865 (= e!127545 (= (apply!187 lt!96625 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3793 thiss!1248)))))

(declare-fun bm!19576 () Bool)

(declare-fun call!19585 () Bool)

(assert (=> bm!19576 (= call!19585 (contains!1359 lt!96625 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!193866 () Bool)

(declare-fun call!19581 () ListLongMap!2417)

(assert (=> b!193866 (= e!127547 call!19581)))

(declare-fun bm!19577 () Bool)

(declare-fun call!19579 () ListLongMap!2417)

(declare-fun call!19580 () ListLongMap!2417)

(assert (=> bm!19577 (= call!19579 call!19580)))

(declare-fun c!34966 () Bool)

(declare-fun c!34965 () Bool)

(declare-fun call!19584 () ListLongMap!2417)

(declare-fun call!19582 () ListLongMap!2417)

(declare-fun bm!19578 () Bool)

(assert (=> bm!19578 (= call!19582 (+!317 (ite c!34966 call!19584 (ite c!34965 call!19580 call!19579)) (ite (or c!34966 c!34965) (tuple2!3497 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3793 thiss!1248)) (tuple2!3497 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3793 thiss!1248)))))))

(declare-fun b!193868 () Bool)

(declare-fun e!127540 () Bool)

(declare-fun e!127546 () Bool)

(assert (=> b!193868 (= e!127540 e!127546)))

(declare-fun res!91635 () Bool)

(assert (=> b!193868 (=> (not res!91635) (not e!127546))))

(assert (=> b!193868 (= res!91635 (contains!1359 lt!96625 (select (arr!3860 (_keys!5944 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!193868 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4184 (_keys!5944 thiss!1248))))))

(declare-fun b!193869 () Bool)

(assert (=> b!193869 (= e!127547 call!19579)))

(declare-fun bm!19579 () Bool)

(assert (=> bm!19579 (= call!19580 call!19584)))

(declare-fun bm!19580 () Bool)

(assert (=> bm!19580 (= call!19584 (getCurrentListMapNoExtraKeys!218 (_keys!5944 thiss!1248) (_values!3935 thiss!1248) (mask!9209 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3952 thiss!1248)))))

(declare-fun b!193870 () Bool)

(assert (=> b!193870 (= e!127546 (= (apply!187 lt!96625 (select (arr!3860 (_keys!5944 thiss!1248)) #b00000000000000000000000000000000)) (get!2240 (select (arr!3861 (_values!3935 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!530 (defaultEntry!3952 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!193870 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4185 (_values!3935 thiss!1248))))))

(assert (=> b!193870 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4184 (_keys!5944 thiss!1248))))))

(declare-fun b!193871 () Bool)

(declare-fun e!127538 () Bool)

(assert (=> b!193871 (= e!127538 e!127544)))

(declare-fun res!91636 () Bool)

(assert (=> b!193871 (= res!91636 call!19585)))

(assert (=> b!193871 (=> (not res!91636) (not e!127544))))

(declare-fun b!193872 () Bool)

(declare-fun res!91634 () Bool)

(declare-fun e!127542 () Bool)

(assert (=> b!193872 (=> (not res!91634) (not e!127542))))

(assert (=> b!193872 (= res!91634 e!127540)))

(declare-fun res!91633 () Bool)

(assert (=> b!193872 (=> res!91633 e!127540)))

(declare-fun e!127543 () Bool)

(assert (=> b!193872 (= res!91633 (not e!127543))))

(declare-fun res!91630 () Bool)

(assert (=> b!193872 (=> (not res!91630) (not e!127543))))

(assert (=> b!193872 (= res!91630 (bvslt #b00000000000000000000000000000000 (size!4184 (_keys!5944 thiss!1248))))))

(declare-fun b!193873 () Bool)

(declare-fun e!127539 () Bool)

(declare-fun call!19583 () Bool)

(assert (=> b!193873 (= e!127539 (not call!19583))))

(declare-fun b!193874 () Bool)

(assert (=> b!193874 (= e!127539 e!127545)))

(declare-fun res!91629 () Bool)

(assert (=> b!193874 (= res!91629 call!19583)))

(assert (=> b!193874 (=> (not res!91629) (not e!127545))))

(declare-fun b!193875 () Bool)

(declare-fun e!127548 () Bool)

(assert (=> b!193875 (= e!127548 (validKeyInArray!0 (select (arr!3860 (_keys!5944 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19581 () Bool)

(assert (=> bm!19581 (= call!19581 call!19582)))

(declare-fun bm!19582 () Bool)

(assert (=> bm!19582 (= call!19583 (contains!1359 lt!96625 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!193876 () Bool)

(assert (=> b!193876 (= e!127538 (not call!19585))))

(declare-fun b!193877 () Bool)

(declare-fun res!91631 () Bool)

(assert (=> b!193877 (=> (not res!91631) (not e!127542))))

(assert (=> b!193877 (= res!91631 e!127539)))

(declare-fun c!34964 () Bool)

(assert (=> b!193877 (= c!34964 (not (= (bvand (extraKeys!3689 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!193867 () Bool)

(assert (=> b!193867 (= e!127541 call!19581)))

(declare-fun d!56695 () Bool)

(assert (=> d!56695 e!127542))

(declare-fun res!91632 () Bool)

(assert (=> d!56695 (=> (not res!91632) (not e!127542))))

(assert (=> d!56695 (= res!91632 (or (bvsge #b00000000000000000000000000000000 (size!4184 (_keys!5944 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4184 (_keys!5944 thiss!1248))))))))

(declare-fun lt!96626 () ListLongMap!2417)

(assert (=> d!56695 (= lt!96625 lt!96626)))

(declare-fun lt!96633 () Unit!5846)

(assert (=> d!56695 (= lt!96633 e!127537)))

(declare-fun c!34963 () Bool)

(assert (=> d!56695 (= c!34963 e!127548)))

(declare-fun res!91628 () Bool)

(assert (=> d!56695 (=> (not res!91628) (not e!127548))))

(assert (=> d!56695 (= res!91628 (bvslt #b00000000000000000000000000000000 (size!4184 (_keys!5944 thiss!1248))))))

(declare-fun e!127549 () ListLongMap!2417)

(assert (=> d!56695 (= lt!96626 e!127549)))

(assert (=> d!56695 (= c!34966 (and (not (= (bvand (extraKeys!3689 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3689 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56695 (validMask!0 (mask!9209 thiss!1248))))

(assert (=> d!56695 (= (getCurrentListMap!876 (_keys!5944 thiss!1248) (_values!3935 thiss!1248) (mask!9209 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3952 thiss!1248)) lt!96625)))

(declare-fun b!193878 () Bool)

(declare-fun Unit!5857 () Unit!5846)

(assert (=> b!193878 (= e!127537 Unit!5857)))

(declare-fun b!193879 () Bool)

(assert (=> b!193879 (= e!127542 e!127538)))

(declare-fun c!34967 () Bool)

(assert (=> b!193879 (= c!34967 (not (= (bvand (extraKeys!3689 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!193880 () Bool)

(assert (=> b!193880 (= e!127549 (+!317 call!19582 (tuple2!3497 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3793 thiss!1248))))))

(declare-fun b!193881 () Bool)

(assert (=> b!193881 (= e!127549 e!127541)))

(assert (=> b!193881 (= c!34965 (and (not (= (bvand (extraKeys!3689 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3689 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!193882 () Bool)

(assert (=> b!193882 (= e!127543 (validKeyInArray!0 (select (arr!3860 (_keys!5944 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!56695 c!34966) b!193880))

(assert (= (and d!56695 (not c!34966)) b!193881))

(assert (= (and b!193881 c!34965) b!193867))

(assert (= (and b!193881 (not c!34965)) b!193862))

(assert (= (and b!193862 c!34968) b!193866))

(assert (= (and b!193862 (not c!34968)) b!193869))

(assert (= (or b!193866 b!193869) bm!19577))

(assert (= (or b!193867 bm!19577) bm!19579))

(assert (= (or b!193867 b!193866) bm!19581))

(assert (= (or b!193880 bm!19579) bm!19580))

(assert (= (or b!193880 bm!19581) bm!19578))

(assert (= (and d!56695 res!91628) b!193875))

(assert (= (and d!56695 c!34963) b!193863))

(assert (= (and d!56695 (not c!34963)) b!193878))

(assert (= (and d!56695 res!91632) b!193872))

(assert (= (and b!193872 res!91630) b!193882))

(assert (= (and b!193872 (not res!91633)) b!193868))

(assert (= (and b!193868 res!91635) b!193870))

(assert (= (and b!193872 res!91634) b!193877))

(assert (= (and b!193877 c!34964) b!193874))

(assert (= (and b!193877 (not c!34964)) b!193873))

(assert (= (and b!193874 res!91629) b!193865))

(assert (= (or b!193874 b!193873) bm!19582))

(assert (= (and b!193877 res!91631) b!193879))

(assert (= (and b!193879 c!34967) b!193871))

(assert (= (and b!193879 (not c!34967)) b!193876))

(assert (= (and b!193871 res!91636) b!193864))

(assert (= (or b!193871 b!193876) bm!19576))

(declare-fun b_lambda!7495 () Bool)

(assert (=> (not b_lambda!7495) (not b!193870)))

(assert (=> b!193870 t!7325))

(declare-fun b_and!11443 () Bool)

(assert (= b_and!11441 (and (=> t!7325 result!4925) b_and!11443)))

(declare-fun m!220773 () Bool)

(assert (=> bm!19576 m!220773))

(declare-fun m!220775 () Bool)

(assert (=> b!193863 m!220775))

(declare-fun m!220777 () Bool)

(assert (=> b!193863 m!220777))

(declare-fun m!220779 () Bool)

(assert (=> b!193863 m!220779))

(declare-fun m!220781 () Bool)

(assert (=> b!193863 m!220781))

(declare-fun m!220783 () Bool)

(assert (=> b!193863 m!220783))

(declare-fun m!220785 () Bool)

(assert (=> b!193863 m!220785))

(declare-fun m!220787 () Bool)

(assert (=> b!193863 m!220787))

(assert (=> b!193863 m!220787))

(declare-fun m!220789 () Bool)

(assert (=> b!193863 m!220789))

(declare-fun m!220791 () Bool)

(assert (=> b!193863 m!220791))

(assert (=> b!193863 m!220777))

(assert (=> b!193863 m!220775))

(declare-fun m!220793 () Bool)

(assert (=> b!193863 m!220793))

(declare-fun m!220795 () Bool)

(assert (=> b!193863 m!220795))

(declare-fun m!220797 () Bool)

(assert (=> b!193863 m!220797))

(declare-fun m!220799 () Bool)

(assert (=> b!193863 m!220799))

(assert (=> b!193863 m!220719))

(assert (=> b!193863 m!220783))

(declare-fun m!220801 () Bool)

(assert (=> b!193863 m!220801))

(declare-fun m!220803 () Bool)

(assert (=> b!193863 m!220803))

(declare-fun m!220805 () Bool)

(assert (=> b!193863 m!220805))

(assert (=> b!193870 m!220719))

(declare-fun m!220807 () Bool)

(assert (=> b!193870 m!220807))

(assert (=> b!193870 m!220729))

(declare-fun m!220809 () Bool)

(assert (=> b!193870 m!220809))

(assert (=> b!193870 m!220719))

(declare-fun m!220811 () Bool)

(assert (=> b!193870 m!220811))

(assert (=> b!193870 m!220729))

(assert (=> b!193870 m!220807))

(declare-fun m!220813 () Bool)

(assert (=> bm!19578 m!220813))

(declare-fun m!220815 () Bool)

(assert (=> b!193865 m!220815))

(assert (=> b!193882 m!220719))

(assert (=> b!193882 m!220719))

(assert (=> b!193882 m!220739))

(assert (=> d!56695 m!220581))

(assert (=> bm!19580 m!220803))

(declare-fun m!220817 () Bool)

(assert (=> b!193864 m!220817))

(assert (=> b!193875 m!220719))

(assert (=> b!193875 m!220719))

(assert (=> b!193875 m!220739))

(declare-fun m!220819 () Bool)

(assert (=> b!193880 m!220819))

(declare-fun m!220821 () Bool)

(assert (=> bm!19582 m!220821))

(assert (=> b!193868 m!220719))

(assert (=> b!193868 m!220719))

(declare-fun m!220823 () Bool)

(assert (=> b!193868 m!220823))

(assert (=> b!193668 d!56695))

(declare-fun bm!19585 () Bool)

(declare-fun call!19588 () Bool)

(declare-fun c!34971 () Bool)

(assert (=> bm!19585 (= call!19588 (arrayNoDuplicates!0 (_keys!5944 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!34971 (Cons!2401 (select (arr!3860 (_keys!5944 thiss!1248)) #b00000000000000000000000000000000) Nil!2402) Nil!2402)))))

(declare-fun b!193893 () Bool)

(declare-fun e!127561 () Bool)

(declare-fun contains!1362 (List!2405 (_ BitVec 64)) Bool)

(assert (=> b!193893 (= e!127561 (contains!1362 Nil!2402 (select (arr!3860 (_keys!5944 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193894 () Bool)

(declare-fun e!127558 () Bool)

(assert (=> b!193894 (= e!127558 call!19588)))

(declare-fun b!193895 () Bool)

(assert (=> b!193895 (= e!127558 call!19588)))

(declare-fun b!193896 () Bool)

(declare-fun e!127560 () Bool)

(assert (=> b!193896 (= e!127560 e!127558)))

(assert (=> b!193896 (= c!34971 (validKeyInArray!0 (select (arr!3860 (_keys!5944 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193897 () Bool)

(declare-fun e!127559 () Bool)

(assert (=> b!193897 (= e!127559 e!127560)))

(declare-fun res!91644 () Bool)

(assert (=> b!193897 (=> (not res!91644) (not e!127560))))

(assert (=> b!193897 (= res!91644 (not e!127561))))

(declare-fun res!91645 () Bool)

(assert (=> b!193897 (=> (not res!91645) (not e!127561))))

(assert (=> b!193897 (= res!91645 (validKeyInArray!0 (select (arr!3860 (_keys!5944 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!56697 () Bool)

(declare-fun res!91643 () Bool)

(assert (=> d!56697 (=> res!91643 e!127559)))

(assert (=> d!56697 (= res!91643 (bvsge #b00000000000000000000000000000000 (size!4184 (_keys!5944 thiss!1248))))))

(assert (=> d!56697 (= (arrayNoDuplicates!0 (_keys!5944 thiss!1248) #b00000000000000000000000000000000 Nil!2402) e!127559)))

(assert (= (and d!56697 (not res!91643)) b!193897))

(assert (= (and b!193897 res!91645) b!193893))

(assert (= (and b!193897 res!91644) b!193896))

(assert (= (and b!193896 c!34971) b!193894))

(assert (= (and b!193896 (not c!34971)) b!193895))

(assert (= (or b!193894 b!193895) bm!19585))

(assert (=> bm!19585 m!220719))

(declare-fun m!220825 () Bool)

(assert (=> bm!19585 m!220825))

(assert (=> b!193893 m!220719))

(assert (=> b!193893 m!220719))

(declare-fun m!220827 () Bool)

(assert (=> b!193893 m!220827))

(assert (=> b!193896 m!220719))

(assert (=> b!193896 m!220719))

(assert (=> b!193896 m!220739))

(assert (=> b!193897 m!220719))

(assert (=> b!193897 m!220719))

(assert (=> b!193897 m!220739))

(assert (=> b!193679 d!56697))

(declare-fun d!56699 () Bool)

(assert (=> d!56699 (= (array_inv!2493 (_keys!5944 thiss!1248)) (bvsge (size!4184 (_keys!5944 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!193673 d!56699))

(declare-fun d!56701 () Bool)

(assert (=> d!56701 (= (array_inv!2494 (_values!3935 thiss!1248)) (bvsge (size!4185 (_values!3935 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!193673 d!56701))

(declare-fun d!56703 () Bool)

(declare-fun res!91650 () Bool)

(declare-fun e!127569 () Bool)

(assert (=> d!56703 (=> res!91650 e!127569)))

(assert (=> d!56703 (= res!91650 (bvsge #b00000000000000000000000000000000 (size!4184 (_keys!5944 thiss!1248))))))

(assert (=> d!56703 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5944 thiss!1248) (mask!9209 thiss!1248)) e!127569)))

(declare-fun b!193906 () Bool)

(declare-fun e!127568 () Bool)

(declare-fun e!127570 () Bool)

(assert (=> b!193906 (= e!127568 e!127570)))

(declare-fun lt!96647 () (_ BitVec 64))

(assert (=> b!193906 (= lt!96647 (select (arr!3860 (_keys!5944 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96645 () Unit!5846)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8201 (_ BitVec 64) (_ BitVec 32)) Unit!5846)

(assert (=> b!193906 (= lt!96645 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5944 thiss!1248) lt!96647 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!8201 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!193906 (arrayContainsKey!0 (_keys!5944 thiss!1248) lt!96647 #b00000000000000000000000000000000)))

(declare-fun lt!96646 () Unit!5846)

(assert (=> b!193906 (= lt!96646 lt!96645)))

(declare-fun res!91651 () Bool)

(assert (=> b!193906 (= res!91651 (= (seekEntryOrOpen!0 (select (arr!3860 (_keys!5944 thiss!1248)) #b00000000000000000000000000000000) (_keys!5944 thiss!1248) (mask!9209 thiss!1248)) (Found!679 #b00000000000000000000000000000000)))))

(assert (=> b!193906 (=> (not res!91651) (not e!127570))))

(declare-fun b!193907 () Bool)

(assert (=> b!193907 (= e!127569 e!127568)))

(declare-fun c!34974 () Bool)

(assert (=> b!193907 (= c!34974 (validKeyInArray!0 (select (arr!3860 (_keys!5944 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19588 () Bool)

(declare-fun call!19591 () Bool)

(assert (=> bm!19588 (= call!19591 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5944 thiss!1248) (mask!9209 thiss!1248)))))

(declare-fun b!193908 () Bool)

(assert (=> b!193908 (= e!127570 call!19591)))

(declare-fun b!193909 () Bool)

(assert (=> b!193909 (= e!127568 call!19591)))

(assert (= (and d!56703 (not res!91650)) b!193907))

(assert (= (and b!193907 c!34974) b!193906))

(assert (= (and b!193907 (not c!34974)) b!193909))

(assert (= (and b!193906 res!91651) b!193908))

(assert (= (or b!193908 b!193909) bm!19588))

(assert (=> b!193906 m!220719))

(declare-fun m!220829 () Bool)

(assert (=> b!193906 m!220829))

(declare-fun m!220831 () Bool)

(assert (=> b!193906 m!220831))

(assert (=> b!193906 m!220719))

(declare-fun m!220833 () Bool)

(assert (=> b!193906 m!220833))

(assert (=> b!193907 m!220719))

(assert (=> b!193907 m!220719))

(assert (=> b!193907 m!220739))

(declare-fun m!220835 () Bool)

(assert (=> bm!19588 m!220835))

(assert (=> b!193672 d!56703))

(declare-fun d!56705 () Bool)

(declare-fun res!91658 () Bool)

(declare-fun e!127573 () Bool)

(assert (=> d!56705 (=> (not res!91658) (not e!127573))))

(declare-fun simpleValid!203 (LongMapFixedSize!2704) Bool)

(assert (=> d!56705 (= res!91658 (simpleValid!203 thiss!1248))))

(assert (=> d!56705 (= (valid!1130 thiss!1248) e!127573)))

(declare-fun b!193916 () Bool)

(declare-fun res!91659 () Bool)

(assert (=> b!193916 (=> (not res!91659) (not e!127573))))

(declare-fun arrayCountValidKeys!0 (array!8201 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!193916 (= res!91659 (= (arrayCountValidKeys!0 (_keys!5944 thiss!1248) #b00000000000000000000000000000000 (size!4184 (_keys!5944 thiss!1248))) (_size!1401 thiss!1248)))))

(declare-fun b!193917 () Bool)

(declare-fun res!91660 () Bool)

(assert (=> b!193917 (=> (not res!91660) (not e!127573))))

(assert (=> b!193917 (= res!91660 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5944 thiss!1248) (mask!9209 thiss!1248)))))

(declare-fun b!193918 () Bool)

(assert (=> b!193918 (= e!127573 (arrayNoDuplicates!0 (_keys!5944 thiss!1248) #b00000000000000000000000000000000 Nil!2402))))

(assert (= (and d!56705 res!91658) b!193916))

(assert (= (and b!193916 res!91659) b!193917))

(assert (= (and b!193917 res!91660) b!193918))

(declare-fun m!220837 () Bool)

(assert (=> d!56705 m!220837))

(declare-fun m!220839 () Bool)

(assert (=> b!193916 m!220839))

(assert (=> b!193917 m!220589))

(assert (=> b!193918 m!220603))

(assert (=> start!19764 d!56705))

(declare-fun b!193935 () Bool)

(declare-fun e!127583 () Bool)

(declare-fun e!127582 () Bool)

(assert (=> b!193935 (= e!127583 e!127582)))

(declare-fun c!34979 () Bool)

(declare-fun lt!96652 () SeekEntryResult!679)

(assert (=> b!193935 (= c!34979 ((_ is MissingVacant!679) lt!96652))))

(declare-fun b!193936 () Bool)

(declare-fun e!127585 () Bool)

(declare-fun call!19597 () Bool)

(assert (=> b!193936 (= e!127585 (not call!19597))))

(declare-fun b!193937 () Bool)

(declare-fun e!127584 () Bool)

(assert (=> b!193937 (= e!127584 (not call!19597))))

(declare-fun d!56707 () Bool)

(assert (=> d!56707 e!127583))

(declare-fun c!34980 () Bool)

(assert (=> d!56707 (= c!34980 ((_ is MissingZero!679) lt!96652))))

(assert (=> d!56707 (= lt!96652 (seekEntryOrOpen!0 key!828 (_keys!5944 thiss!1248) (mask!9209 thiss!1248)))))

(declare-fun lt!96653 () Unit!5846)

(declare-fun choose!1069 (array!8201 array!8203 (_ BitVec 32) (_ BitVec 32) V!5625 V!5625 (_ BitVec 64) Int) Unit!5846)

(assert (=> d!56707 (= lt!96653 (choose!1069 (_keys!5944 thiss!1248) (_values!3935 thiss!1248) (mask!9209 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) key!828 (defaultEntry!3952 thiss!1248)))))

(assert (=> d!56707 (validMask!0 (mask!9209 thiss!1248))))

(assert (=> d!56707 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!179 (_keys!5944 thiss!1248) (_values!3935 thiss!1248) (mask!9209 thiss!1248) (extraKeys!3689 thiss!1248) (zeroValue!3793 thiss!1248) (minValue!3793 thiss!1248) key!828 (defaultEntry!3952 thiss!1248)) lt!96653)))

(declare-fun b!193938 () Bool)

(assert (=> b!193938 (= e!127583 e!127585)))

(declare-fun res!91669 () Bool)

(declare-fun call!19596 () Bool)

(assert (=> b!193938 (= res!91669 call!19596)))

(assert (=> b!193938 (=> (not res!91669) (not e!127585))))

(declare-fun b!193939 () Bool)

(declare-fun res!91672 () Bool)

(assert (=> b!193939 (=> (not res!91672) (not e!127584))))

(assert (=> b!193939 (= res!91672 (= (select (arr!3860 (_keys!5944 thiss!1248)) (index!4889 lt!96652)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!193939 (and (bvsge (index!4889 lt!96652) #b00000000000000000000000000000000) (bvslt (index!4889 lt!96652) (size!4184 (_keys!5944 thiss!1248))))))

(declare-fun bm!19593 () Bool)

(assert (=> bm!19593 (= call!19597 (arrayContainsKey!0 (_keys!5944 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!193940 () Bool)

(assert (=> b!193940 (and (bvsge (index!4886 lt!96652) #b00000000000000000000000000000000) (bvslt (index!4886 lt!96652) (size!4184 (_keys!5944 thiss!1248))))))

(declare-fun res!91671 () Bool)

(assert (=> b!193940 (= res!91671 (= (select (arr!3860 (_keys!5944 thiss!1248)) (index!4886 lt!96652)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!193940 (=> (not res!91671) (not e!127585))))

(declare-fun b!193941 () Bool)

(assert (=> b!193941 (= e!127582 ((_ is Undefined!679) lt!96652))))

(declare-fun bm!19594 () Bool)

(assert (=> bm!19594 (= call!19596 (inRange!0 (ite c!34980 (index!4886 lt!96652) (index!4889 lt!96652)) (mask!9209 thiss!1248)))))

(declare-fun b!193942 () Bool)

(declare-fun res!91670 () Bool)

(assert (=> b!193942 (=> (not res!91670) (not e!127584))))

(assert (=> b!193942 (= res!91670 call!19596)))

(assert (=> b!193942 (= e!127582 e!127584)))

(assert (= (and d!56707 c!34980) b!193938))

(assert (= (and d!56707 (not c!34980)) b!193935))

(assert (= (and b!193938 res!91669) b!193940))

(assert (= (and b!193940 res!91671) b!193936))

(assert (= (and b!193935 c!34979) b!193942))

(assert (= (and b!193935 (not c!34979)) b!193941))

(assert (= (and b!193942 res!91670) b!193939))

(assert (= (and b!193939 res!91672) b!193937))

(assert (= (or b!193938 b!193942) bm!19594))

(assert (= (or b!193936 b!193937) bm!19593))

(assert (=> d!56707 m!220573))

(declare-fun m!220841 () Bool)

(assert (=> d!56707 m!220841))

(assert (=> d!56707 m!220581))

(declare-fun m!220843 () Bool)

(assert (=> bm!19594 m!220843))

(declare-fun m!220845 () Bool)

(assert (=> b!193940 m!220845))

(declare-fun m!220847 () Bool)

(assert (=> bm!19593 m!220847))

(declare-fun m!220849 () Bool)

(assert (=> b!193939 m!220849))

(assert (=> b!193682 d!56707))

(declare-fun b!193955 () Bool)

(declare-fun c!34988 () Bool)

(declare-fun lt!96660 () (_ BitVec 64))

(assert (=> b!193955 (= c!34988 (= lt!96660 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!127593 () SeekEntryResult!679)

(declare-fun e!127594 () SeekEntryResult!679)

(assert (=> b!193955 (= e!127593 e!127594)))

(declare-fun d!56709 () Bool)

(declare-fun lt!96661 () SeekEntryResult!679)

(assert (=> d!56709 (and (or ((_ is Undefined!679) lt!96661) (not ((_ is Found!679) lt!96661)) (and (bvsge (index!4887 lt!96661) #b00000000000000000000000000000000) (bvslt (index!4887 lt!96661) (size!4184 (_keys!5944 thiss!1248))))) (or ((_ is Undefined!679) lt!96661) ((_ is Found!679) lt!96661) (not ((_ is MissingZero!679) lt!96661)) (and (bvsge (index!4886 lt!96661) #b00000000000000000000000000000000) (bvslt (index!4886 lt!96661) (size!4184 (_keys!5944 thiss!1248))))) (or ((_ is Undefined!679) lt!96661) ((_ is Found!679) lt!96661) ((_ is MissingZero!679) lt!96661) (not ((_ is MissingVacant!679) lt!96661)) (and (bvsge (index!4889 lt!96661) #b00000000000000000000000000000000) (bvslt (index!4889 lt!96661) (size!4184 (_keys!5944 thiss!1248))))) (or ((_ is Undefined!679) lt!96661) (ite ((_ is Found!679) lt!96661) (= (select (arr!3860 (_keys!5944 thiss!1248)) (index!4887 lt!96661)) key!828) (ite ((_ is MissingZero!679) lt!96661) (= (select (arr!3860 (_keys!5944 thiss!1248)) (index!4886 lt!96661)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!679) lt!96661) (= (select (arr!3860 (_keys!5944 thiss!1248)) (index!4889 lt!96661)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!127592 () SeekEntryResult!679)

(assert (=> d!56709 (= lt!96661 e!127592)))

(declare-fun c!34989 () Bool)

(declare-fun lt!96662 () SeekEntryResult!679)

(assert (=> d!56709 (= c!34989 (and ((_ is Intermediate!679) lt!96662) (undefined!1491 lt!96662)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8201 (_ BitVec 32)) SeekEntryResult!679)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!56709 (= lt!96662 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9209 thiss!1248)) key!828 (_keys!5944 thiss!1248) (mask!9209 thiss!1248)))))

(assert (=> d!56709 (validMask!0 (mask!9209 thiss!1248))))

(assert (=> d!56709 (= (seekEntryOrOpen!0 key!828 (_keys!5944 thiss!1248) (mask!9209 thiss!1248)) lt!96661)))

(declare-fun b!193956 () Bool)

(assert (=> b!193956 (= e!127592 e!127593)))

(assert (=> b!193956 (= lt!96660 (select (arr!3860 (_keys!5944 thiss!1248)) (index!4888 lt!96662)))))

(declare-fun c!34987 () Bool)

(assert (=> b!193956 (= c!34987 (= lt!96660 key!828))))

(declare-fun b!193957 () Bool)

(assert (=> b!193957 (= e!127594 (MissingZero!679 (index!4888 lt!96662)))))

(declare-fun b!193958 () Bool)

(assert (=> b!193958 (= e!127593 (Found!679 (index!4888 lt!96662)))))

(declare-fun b!193959 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8201 (_ BitVec 32)) SeekEntryResult!679)

(assert (=> b!193959 (= e!127594 (seekKeyOrZeroReturnVacant!0 (x!20657 lt!96662) (index!4888 lt!96662) (index!4888 lt!96662) key!828 (_keys!5944 thiss!1248) (mask!9209 thiss!1248)))))

(declare-fun b!193960 () Bool)

(assert (=> b!193960 (= e!127592 Undefined!679)))

(assert (= (and d!56709 c!34989) b!193960))

(assert (= (and d!56709 (not c!34989)) b!193956))

(assert (= (and b!193956 c!34987) b!193958))

(assert (= (and b!193956 (not c!34987)) b!193955))

(assert (= (and b!193955 c!34988) b!193957))

(assert (= (and b!193955 (not c!34988)) b!193959))

(declare-fun m!220851 () Bool)

(assert (=> d!56709 m!220851))

(declare-fun m!220853 () Bool)

(assert (=> d!56709 m!220853))

(declare-fun m!220855 () Bool)

(assert (=> d!56709 m!220855))

(assert (=> d!56709 m!220853))

(assert (=> d!56709 m!220581))

(declare-fun m!220857 () Bool)

(assert (=> d!56709 m!220857))

(declare-fun m!220859 () Bool)

(assert (=> d!56709 m!220859))

(declare-fun m!220861 () Bool)

(assert (=> b!193956 m!220861))

(declare-fun m!220863 () Bool)

(assert (=> b!193959 m!220863))

(assert (=> b!193677 d!56709))

(declare-fun mapNonEmpty!7763 () Bool)

(declare-fun mapRes!7763 () Bool)

(declare-fun tp!17015 () Bool)

(declare-fun e!127599 () Bool)

(assert (=> mapNonEmpty!7763 (= mapRes!7763 (and tp!17015 e!127599))))

(declare-fun mapRest!7763 () (Array (_ BitVec 32) ValueCell!1898))

(declare-fun mapValue!7763 () ValueCell!1898)

(declare-fun mapKey!7763 () (_ BitVec 32))

(assert (=> mapNonEmpty!7763 (= mapRest!7754 (store mapRest!7763 mapKey!7763 mapValue!7763))))

(declare-fun b!193968 () Bool)

(declare-fun e!127600 () Bool)

(assert (=> b!193968 (= e!127600 tp_is_empty!4483)))

(declare-fun b!193967 () Bool)

(assert (=> b!193967 (= e!127599 tp_is_empty!4483)))

(declare-fun mapIsEmpty!7763 () Bool)

(assert (=> mapIsEmpty!7763 mapRes!7763))

(declare-fun condMapEmpty!7763 () Bool)

(declare-fun mapDefault!7763 () ValueCell!1898)

(assert (=> mapNonEmpty!7754 (= condMapEmpty!7763 (= mapRest!7754 ((as const (Array (_ BitVec 32) ValueCell!1898)) mapDefault!7763)))))

(assert (=> mapNonEmpty!7754 (= tp!17000 (and e!127600 mapRes!7763))))

(assert (= (and mapNonEmpty!7754 condMapEmpty!7763) mapIsEmpty!7763))

(assert (= (and mapNonEmpty!7754 (not condMapEmpty!7763)) mapNonEmpty!7763))

(assert (= (and mapNonEmpty!7763 ((_ is ValueCellFull!1898) mapValue!7763)) b!193967))

(assert (= (and mapNonEmpty!7754 ((_ is ValueCellFull!1898) mapDefault!7763)) b!193968))

(declare-fun m!220865 () Bool)

(assert (=> mapNonEmpty!7763 m!220865))

(declare-fun b_lambda!7497 () Bool)

(assert (= b_lambda!7495 (or (and b!193673 b_free!4711) b_lambda!7497)))

(declare-fun b_lambda!7499 () Bool)

(assert (= b_lambda!7493 (or (and b!193673 b_free!4711) b_lambda!7499)))

(check-sat (not bm!19594) (not d!56679) (not b!193846) (not b!193882) (not d!56689) (not bm!19580) (not b_next!4711) (not b!193860) (not b!193868) (not bm!19578) (not bm!19576) (not bm!19569) (not b_lambda!7497) (not b!193829) (not b!193870) (not b_lambda!7499) (not bm!19588) (not b!193917) (not d!56707) (not b!193827) (not d!56709) (not bm!19573) (not b!193907) (not b!193834) (not b!193864) (not d!56705) (not b!193824) (not bm!19582) (not b!193863) (not b!193822) tp_is_empty!4483 (not b!193853) (not b!193839) (not d!56693) (not b!193875) (not d!56691) (not bm!19571) (not b!193959) (not bm!19593) (not bm!19585) (not b!193865) (not d!56695) (not b!193893) (not b!193777) (not b!193918) (not b!193855) (not b!193880) (not b!193861) (not mapNonEmpty!7763) (not b!193906) (not bm!19575) (not d!56687) (not b!193897) (not b!193823) (not b!193916) b_and!11443 (not b!193841) (not b!193896))
(check-sat b_and!11443 (not b_next!4711))
