; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23572 () Bool)

(assert start!23572)

(declare-fun b!247688 () Bool)

(declare-fun b_free!6591 () Bool)

(declare-fun b_next!6591 () Bool)

(assert (=> b!247688 (= b_free!6591 (not b_next!6591))))

(declare-fun tp!23021 () Bool)

(declare-fun b_and!13593 () Bool)

(assert (=> b!247688 (= tp!23021 b_and!13593)))

(declare-fun b!247680 () Bool)

(declare-fun res!121393 () Bool)

(declare-fun e!160673 () Bool)

(assert (=> b!247680 (=> (not res!121393) (not e!160673))))

(declare-fun call!23194 () Bool)

(assert (=> b!247680 (= res!121393 call!23194)))

(declare-fun e!160685 () Bool)

(assert (=> b!247680 (= e!160685 e!160673)))

(declare-fun b!247681 () Bool)

(declare-fun e!160686 () Bool)

(declare-fun e!160677 () Bool)

(declare-fun mapRes!10955 () Bool)

(assert (=> b!247681 (= e!160686 (and e!160677 mapRes!10955))))

(declare-fun condMapEmpty!10955 () Bool)

(declare-datatypes ((V!8251 0))(
  ( (V!8252 (val!3271 Int)) )
))
(declare-datatypes ((ValueCell!2883 0))(
  ( (ValueCellFull!2883 (v!5329 V!8251)) (EmptyCell!2883) )
))
(declare-datatypes ((array!12213 0))(
  ( (array!12214 (arr!5794 (Array (_ BitVec 32) ValueCell!2883)) (size!6137 (_ BitVec 32))) )
))
(declare-datatypes ((array!12215 0))(
  ( (array!12216 (arr!5795 (Array (_ BitVec 32) (_ BitVec 64))) (size!6138 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3666 0))(
  ( (LongMapFixedSize!3667 (defaultEntry!4582 Int) (mask!10722 (_ BitVec 32)) (extraKeys!4319 (_ BitVec 32)) (zeroValue!4423 V!8251) (minValue!4423 V!8251) (_size!1882 (_ BitVec 32)) (_keys!6704 array!12215) (_values!4565 array!12213) (_vacant!1882 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3666)

(declare-fun mapDefault!10955 () ValueCell!2883)

(assert (=> b!247681 (= condMapEmpty!10955 (= (arr!5794 (_values!4565 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2883)) mapDefault!10955)))))

(declare-fun b!247682 () Bool)

(declare-fun res!121395 () Bool)

(declare-datatypes ((SeekEntryResult!1104 0))(
  ( (MissingZero!1104 (index!6586 (_ BitVec 32))) (Found!1104 (index!6587 (_ BitVec 32))) (Intermediate!1104 (undefined!1916 Bool) (index!6588 (_ BitVec 32)) (x!24540 (_ BitVec 32))) (Undefined!1104) (MissingVacant!1104 (index!6589 (_ BitVec 32))) )
))
(declare-fun lt!124041 () SeekEntryResult!1104)

(assert (=> b!247682 (= res!121395 (= (select (arr!5795 (_keys!6704 thiss!1504)) (index!6589 lt!124041)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!160675 () Bool)

(assert (=> b!247682 (=> (not res!121395) (not e!160675))))

(declare-fun b!247683 () Bool)

(declare-fun call!23195 () Bool)

(assert (=> b!247683 (= e!160673 (not call!23195))))

(declare-fun b!247684 () Bool)

(declare-fun e!160680 () Bool)

(declare-fun e!160682 () Bool)

(assert (=> b!247684 (= e!160680 e!160682)))

(declare-fun res!121392 () Bool)

(assert (=> b!247684 (=> (not res!121392) (not e!160682))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!247684 (= res!121392 (or (= lt!124041 (MissingZero!1104 index!297)) (= lt!124041 (MissingVacant!1104 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12215 (_ BitVec 32)) SeekEntryResult!1104)

(assert (=> b!247684 (= lt!124041 (seekEntryOrOpen!0 key!932 (_keys!6704 thiss!1504) (mask!10722 thiss!1504)))))

(declare-fun b!247685 () Bool)

(declare-fun e!160684 () Bool)

(assert (=> b!247685 (= e!160684 (not true))))

(declare-fun lt!124036 () array!12215)

(declare-fun arrayCountValidKeys!0 (array!12215 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!247685 (= (arrayCountValidKeys!0 lt!124036 #b00000000000000000000000000000000 (size!6138 (_keys!6704 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6704 thiss!1504) #b00000000000000000000000000000000 (size!6138 (_keys!6704 thiss!1504)))))))

(declare-datatypes ((Unit!7661 0))(
  ( (Unit!7662) )
))
(declare-fun lt!124038 () Unit!7661)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12215 (_ BitVec 32) (_ BitVec 64)) Unit!7661)

(assert (=> b!247685 (= lt!124038 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6704 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3697 0))(
  ( (Nil!3694) (Cons!3693 (h!4351 (_ BitVec 64)) (t!8720 List!3697)) )
))
(declare-fun arrayNoDuplicates!0 (array!12215 (_ BitVec 32) List!3697) Bool)

(assert (=> b!247685 (arrayNoDuplicates!0 lt!124036 #b00000000000000000000000000000000 Nil!3694)))

(assert (=> b!247685 (= lt!124036 (array!12216 (store (arr!5795 (_keys!6704 thiss!1504)) index!297 key!932) (size!6138 (_keys!6704 thiss!1504))))))

(declare-fun lt!124039 () Unit!7661)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12215 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3697) Unit!7661)

(assert (=> b!247685 (= lt!124039 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6704 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3694))))

(declare-fun lt!124043 () Unit!7661)

(declare-fun e!160678 () Unit!7661)

(assert (=> b!247685 (= lt!124043 e!160678)))

(declare-fun c!41473 () Bool)

(declare-fun arrayContainsKey!0 (array!12215 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!247685 (= c!41473 (arrayContainsKey!0 (_keys!6704 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!247686 () Bool)

(declare-fun res!121399 () Bool)

(assert (=> b!247686 (=> (not res!121399) (not e!160680))))

(assert (=> b!247686 (= res!121399 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!247687 () Bool)

(declare-fun e!160683 () Unit!7661)

(declare-fun Unit!7663 () Unit!7661)

(assert (=> b!247687 (= e!160683 Unit!7663)))

(declare-fun lt!124044 () Unit!7661)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!385 (array!12215 array!12213 (_ BitVec 32) (_ BitVec 32) V!8251 V!8251 (_ BitVec 64) Int) Unit!7661)

(assert (=> b!247687 (= lt!124044 (lemmaInListMapThenSeekEntryOrOpenFindsIt!385 (_keys!6704 thiss!1504) (_values!4565 thiss!1504) (mask!10722 thiss!1504) (extraKeys!4319 thiss!1504) (zeroValue!4423 thiss!1504) (minValue!4423 thiss!1504) key!932 (defaultEntry!4582 thiss!1504)))))

(assert (=> b!247687 false))

(declare-fun mapIsEmpty!10955 () Bool)

(assert (=> mapIsEmpty!10955 mapRes!10955))

(declare-fun e!160676 () Bool)

(declare-fun tp_is_empty!6453 () Bool)

(declare-fun array_inv!3827 (array!12215) Bool)

(declare-fun array_inv!3828 (array!12213) Bool)

(assert (=> b!247688 (= e!160676 (and tp!23021 tp_is_empty!6453 (array_inv!3827 (_keys!6704 thiss!1504)) (array_inv!3828 (_values!4565 thiss!1504)) e!160686))))

(declare-fun b!247689 () Bool)

(declare-fun Unit!7664 () Unit!7661)

(assert (=> b!247689 (= e!160678 Unit!7664)))

(declare-fun lt!124040 () Unit!7661)

(declare-fun lemmaArrayContainsKeyThenInListMap!187 (array!12215 array!12213 (_ BitVec 32) (_ BitVec 32) V!8251 V!8251 (_ BitVec 64) (_ BitVec 32) Int) Unit!7661)

(assert (=> b!247689 (= lt!124040 (lemmaArrayContainsKeyThenInListMap!187 (_keys!6704 thiss!1504) (_values!4565 thiss!1504) (mask!10722 thiss!1504) (extraKeys!4319 thiss!1504) (zeroValue!4423 thiss!1504) (minValue!4423 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4582 thiss!1504)))))

(assert (=> b!247689 false))

(declare-fun b!247690 () Bool)

(assert (=> b!247690 (= e!160682 e!160684)))

(declare-fun res!121394 () Bool)

(assert (=> b!247690 (=> (not res!121394) (not e!160684))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!247690 (= res!121394 (inRange!0 index!297 (mask!10722 thiss!1504)))))

(declare-fun lt!124042 () Unit!7661)

(assert (=> b!247690 (= lt!124042 e!160683)))

(declare-fun c!41472 () Bool)

(declare-datatypes ((tuple2!4816 0))(
  ( (tuple2!4817 (_1!2419 (_ BitVec 64)) (_2!2419 V!8251)) )
))
(declare-datatypes ((List!3698 0))(
  ( (Nil!3695) (Cons!3694 (h!4352 tuple2!4816) (t!8721 List!3698)) )
))
(declare-datatypes ((ListLongMap!3729 0))(
  ( (ListLongMap!3730 (toList!1880 List!3698)) )
))
(declare-fun contains!1794 (ListLongMap!3729 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1408 (array!12215 array!12213 (_ BitVec 32) (_ BitVec 32) V!8251 V!8251 (_ BitVec 32) Int) ListLongMap!3729)

(assert (=> b!247690 (= c!41472 (contains!1794 (getCurrentListMap!1408 (_keys!6704 thiss!1504) (_values!4565 thiss!1504) (mask!10722 thiss!1504) (extraKeys!4319 thiss!1504) (zeroValue!4423 thiss!1504) (minValue!4423 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4582 thiss!1504)) key!932))))

(declare-fun b!247691 () Bool)

(assert (=> b!247691 (= e!160677 tp_is_empty!6453)))

(declare-fun b!247692 () Bool)

(declare-fun e!160681 () Bool)

(get-info :version)

(assert (=> b!247692 (= e!160681 ((_ is Undefined!1104) lt!124041))))

(declare-fun b!247693 () Bool)

(declare-fun lt!124037 () Unit!7661)

(assert (=> b!247693 (= e!160683 lt!124037)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!389 (array!12215 array!12213 (_ BitVec 32) (_ BitVec 32) V!8251 V!8251 (_ BitVec 64) Int) Unit!7661)

(assert (=> b!247693 (= lt!124037 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!389 (_keys!6704 thiss!1504) (_values!4565 thiss!1504) (mask!10722 thiss!1504) (extraKeys!4319 thiss!1504) (zeroValue!4423 thiss!1504) (minValue!4423 thiss!1504) key!932 (defaultEntry!4582 thiss!1504)))))

(declare-fun c!41471 () Bool)

(assert (=> b!247693 (= c!41471 ((_ is MissingZero!1104) lt!124041))))

(assert (=> b!247693 e!160685))

(declare-fun b!247694 () Bool)

(assert (=> b!247694 (= e!160681 e!160675)))

(declare-fun res!121398 () Bool)

(assert (=> b!247694 (= res!121398 call!23194)))

(assert (=> b!247694 (=> (not res!121398) (not e!160675))))

(declare-fun bm!23191 () Bool)

(assert (=> bm!23191 (= call!23194 (inRange!0 (ite c!41471 (index!6586 lt!124041) (index!6589 lt!124041)) (mask!10722 thiss!1504)))))

(declare-fun b!247695 () Bool)

(declare-fun res!121397 () Bool)

(assert (=> b!247695 (=> (not res!121397) (not e!160673))))

(assert (=> b!247695 (= res!121397 (= (select (arr!5795 (_keys!6704 thiss!1504)) (index!6586 lt!124041)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!247696 () Bool)

(assert (=> b!247696 (= e!160675 (not call!23195))))

(declare-fun mapNonEmpty!10955 () Bool)

(declare-fun tp!23020 () Bool)

(declare-fun e!160679 () Bool)

(assert (=> mapNonEmpty!10955 (= mapRes!10955 (and tp!23020 e!160679))))

(declare-fun mapRest!10955 () (Array (_ BitVec 32) ValueCell!2883))

(declare-fun mapValue!10955 () ValueCell!2883)

(declare-fun mapKey!10955 () (_ BitVec 32))

(assert (=> mapNonEmpty!10955 (= (arr!5794 (_values!4565 thiss!1504)) (store mapRest!10955 mapKey!10955 mapValue!10955))))

(declare-fun res!121396 () Bool)

(assert (=> start!23572 (=> (not res!121396) (not e!160680))))

(declare-fun valid!1434 (LongMapFixedSize!3666) Bool)

(assert (=> start!23572 (= res!121396 (valid!1434 thiss!1504))))

(assert (=> start!23572 e!160680))

(assert (=> start!23572 e!160676))

(assert (=> start!23572 true))

(declare-fun b!247697 () Bool)

(declare-fun c!41474 () Bool)

(assert (=> b!247697 (= c!41474 ((_ is MissingVacant!1104) lt!124041))))

(assert (=> b!247697 (= e!160685 e!160681)))

(declare-fun b!247698 () Bool)

(assert (=> b!247698 (= e!160679 tp_is_empty!6453)))

(declare-fun bm!23192 () Bool)

(assert (=> bm!23192 (= call!23195 (arrayContainsKey!0 (_keys!6704 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!247699 () Bool)

(declare-fun Unit!7665 () Unit!7661)

(assert (=> b!247699 (= e!160678 Unit!7665)))

(assert (= (and start!23572 res!121396) b!247686))

(assert (= (and b!247686 res!121399) b!247684))

(assert (= (and b!247684 res!121392) b!247690))

(assert (= (and b!247690 c!41472) b!247687))

(assert (= (and b!247690 (not c!41472)) b!247693))

(assert (= (and b!247693 c!41471) b!247680))

(assert (= (and b!247693 (not c!41471)) b!247697))

(assert (= (and b!247680 res!121393) b!247695))

(assert (= (and b!247695 res!121397) b!247683))

(assert (= (and b!247697 c!41474) b!247694))

(assert (= (and b!247697 (not c!41474)) b!247692))

(assert (= (and b!247694 res!121398) b!247682))

(assert (= (and b!247682 res!121395) b!247696))

(assert (= (or b!247680 b!247694) bm!23191))

(assert (= (or b!247683 b!247696) bm!23192))

(assert (= (and b!247690 res!121394) b!247685))

(assert (= (and b!247685 c!41473) b!247689))

(assert (= (and b!247685 (not c!41473)) b!247699))

(assert (= (and b!247681 condMapEmpty!10955) mapIsEmpty!10955))

(assert (= (and b!247681 (not condMapEmpty!10955)) mapNonEmpty!10955))

(assert (= (and mapNonEmpty!10955 ((_ is ValueCellFull!2883) mapValue!10955)) b!247698))

(assert (= (and b!247681 ((_ is ValueCellFull!2883) mapDefault!10955)) b!247691))

(assert (= b!247688 b!247681))

(assert (= start!23572 b!247688))

(declare-fun m!264673 () Bool)

(assert (=> start!23572 m!264673))

(declare-fun m!264675 () Bool)

(assert (=> b!247693 m!264675))

(declare-fun m!264677 () Bool)

(assert (=> bm!23192 m!264677))

(declare-fun m!264679 () Bool)

(assert (=> b!247690 m!264679))

(declare-fun m!264681 () Bool)

(assert (=> b!247690 m!264681))

(assert (=> b!247690 m!264681))

(declare-fun m!264683 () Bool)

(assert (=> b!247690 m!264683))

(declare-fun m!264685 () Bool)

(assert (=> b!247695 m!264685))

(declare-fun m!264687 () Bool)

(assert (=> b!247688 m!264687))

(declare-fun m!264689 () Bool)

(assert (=> b!247688 m!264689))

(declare-fun m!264691 () Bool)

(assert (=> b!247687 m!264691))

(declare-fun m!264693 () Bool)

(assert (=> bm!23191 m!264693))

(declare-fun m!264695 () Bool)

(assert (=> b!247684 m!264695))

(assert (=> b!247685 m!264677))

(declare-fun m!264697 () Bool)

(assert (=> b!247685 m!264697))

(declare-fun m!264699 () Bool)

(assert (=> b!247685 m!264699))

(declare-fun m!264701 () Bool)

(assert (=> b!247685 m!264701))

(declare-fun m!264703 () Bool)

(assert (=> b!247685 m!264703))

(declare-fun m!264705 () Bool)

(assert (=> b!247685 m!264705))

(declare-fun m!264707 () Bool)

(assert (=> b!247685 m!264707))

(declare-fun m!264709 () Bool)

(assert (=> mapNonEmpty!10955 m!264709))

(declare-fun m!264711 () Bool)

(assert (=> b!247682 m!264711))

(declare-fun m!264713 () Bool)

(assert (=> b!247689 m!264713))

(check-sat (not b!247690) (not b!247687) (not b!247684) (not b!247685) (not b_next!6591) tp_is_empty!6453 (not b!247688) (not bm!23191) (not start!23572) (not b!247693) b_and!13593 (not mapNonEmpty!10955) (not bm!23192) (not b!247689))
(check-sat b_and!13593 (not b_next!6591))
