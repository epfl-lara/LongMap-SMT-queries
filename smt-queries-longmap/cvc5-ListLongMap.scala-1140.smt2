; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23570 () Bool)

(assert start!23570)

(declare-fun b!247621 () Bool)

(declare-fun b_free!6589 () Bool)

(declare-fun b_next!6589 () Bool)

(assert (=> b!247621 (= b_free!6589 (not b_next!6589))))

(declare-fun tp!23014 () Bool)

(declare-fun b_and!13591 () Bool)

(assert (=> b!247621 (= tp!23014 b_and!13591)))

(declare-fun mapNonEmpty!10952 () Bool)

(declare-fun mapRes!10952 () Bool)

(declare-fun tp!23015 () Bool)

(declare-fun e!160639 () Bool)

(assert (=> mapNonEmpty!10952 (= mapRes!10952 (and tp!23015 e!160639))))

(declare-fun mapKey!10952 () (_ BitVec 32))

(declare-datatypes ((V!8249 0))(
  ( (V!8250 (val!3270 Int)) )
))
(declare-datatypes ((ValueCell!2882 0))(
  ( (ValueCellFull!2882 (v!5328 V!8249)) (EmptyCell!2882) )
))
(declare-fun mapValue!10952 () ValueCell!2882)

(declare-datatypes ((array!12209 0))(
  ( (array!12210 (arr!5792 (Array (_ BitVec 32) ValueCell!2882)) (size!6135 (_ BitVec 32))) )
))
(declare-datatypes ((array!12211 0))(
  ( (array!12212 (arr!5793 (Array (_ BitVec 32) (_ BitVec 64))) (size!6136 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3664 0))(
  ( (LongMapFixedSize!3665 (defaultEntry!4581 Int) (mask!10721 (_ BitVec 32)) (extraKeys!4318 (_ BitVec 32)) (zeroValue!4422 V!8249) (minValue!4422 V!8249) (_size!1881 (_ BitVec 32)) (_keys!6703 array!12211) (_values!4564 array!12209) (_vacant!1881 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3664)

(declare-fun mapRest!10952 () (Array (_ BitVec 32) ValueCell!2882))

(assert (=> mapNonEmpty!10952 (= (arr!5792 (_values!4564 thiss!1504)) (store mapRest!10952 mapKey!10952 mapValue!10952))))

(declare-fun b!247620 () Bool)

(declare-fun e!160635 () Bool)

(assert (=> b!247620 (= e!160635 (not true))))

(declare-fun lt!124015 () array!12211)

(declare-fun arrayCountValidKeys!0 (array!12211 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!247620 (= (arrayCountValidKeys!0 lt!124015 #b00000000000000000000000000000000 (size!6136 (_keys!6703 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6703 thiss!1504) #b00000000000000000000000000000000 (size!6136 (_keys!6703 thiss!1504)))))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((Unit!7656 0))(
  ( (Unit!7657) )
))
(declare-fun lt!124017 () Unit!7656)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12211 (_ BitVec 32) (_ BitVec 64)) Unit!7656)

(assert (=> b!247620 (= lt!124017 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6703 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3695 0))(
  ( (Nil!3692) (Cons!3691 (h!4349 (_ BitVec 64)) (t!8718 List!3695)) )
))
(declare-fun arrayNoDuplicates!0 (array!12211 (_ BitVec 32) List!3695) Bool)

(assert (=> b!247620 (arrayNoDuplicates!0 lt!124015 #b00000000000000000000000000000000 Nil!3692)))

(assert (=> b!247620 (= lt!124015 (array!12212 (store (arr!5793 (_keys!6703 thiss!1504)) index!297 key!932) (size!6136 (_keys!6703 thiss!1504))))))

(declare-fun lt!124012 () Unit!7656)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12211 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3695) Unit!7656)

(assert (=> b!247620 (= lt!124012 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6703 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3692))))

(declare-fun lt!124011 () Unit!7656)

(declare-fun e!160642 () Unit!7656)

(assert (=> b!247620 (= lt!124011 e!160642)))

(declare-fun c!41462 () Bool)

(declare-fun arrayContainsKey!0 (array!12211 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!247620 (= c!41462 (arrayContainsKey!0 (_keys!6703 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun e!160634 () Bool)

(declare-fun tp_is_empty!6451 () Bool)

(declare-fun e!160643 () Bool)

(declare-fun array_inv!3825 (array!12211) Bool)

(declare-fun array_inv!3826 (array!12209) Bool)

(assert (=> b!247621 (= e!160643 (and tp!23014 tp_is_empty!6451 (array_inv!3825 (_keys!6703 thiss!1504)) (array_inv!3826 (_values!4564 thiss!1504)) e!160634))))

(declare-fun b!247622 () Bool)

(declare-fun c!41461 () Bool)

(declare-datatypes ((SeekEntryResult!1103 0))(
  ( (MissingZero!1103 (index!6582 (_ BitVec 32))) (Found!1103 (index!6583 (_ BitVec 32))) (Intermediate!1103 (undefined!1915 Bool) (index!6584 (_ BitVec 32)) (x!24539 (_ BitVec 32))) (Undefined!1103) (MissingVacant!1103 (index!6585 (_ BitVec 32))) )
))
(declare-fun lt!124016 () SeekEntryResult!1103)

(assert (=> b!247622 (= c!41461 (is-MissingVacant!1103 lt!124016))))

(declare-fun e!160636 () Bool)

(declare-fun e!160633 () Bool)

(assert (=> b!247622 (= e!160636 e!160633)))

(declare-fun b!247623 () Bool)

(assert (=> b!247623 (= e!160639 tp_is_empty!6451)))

(declare-fun b!247624 () Bool)

(declare-fun e!160641 () Bool)

(declare-fun call!23189 () Bool)

(assert (=> b!247624 (= e!160641 (not call!23189))))

(declare-fun b!247625 () Bool)

(declare-fun Unit!7658 () Unit!7656)

(assert (=> b!247625 (= e!160642 Unit!7658)))

(declare-fun lt!124014 () Unit!7656)

(declare-fun lemmaArrayContainsKeyThenInListMap!186 (array!12211 array!12209 (_ BitVec 32) (_ BitVec 32) V!8249 V!8249 (_ BitVec 64) (_ BitVec 32) Int) Unit!7656)

(assert (=> b!247625 (= lt!124014 (lemmaArrayContainsKeyThenInListMap!186 (_keys!6703 thiss!1504) (_values!4564 thiss!1504) (mask!10721 thiss!1504) (extraKeys!4318 thiss!1504) (zeroValue!4422 thiss!1504) (minValue!4422 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4581 thiss!1504)))))

(assert (=> b!247625 false))

(declare-fun b!247626 () Bool)

(assert (=> b!247626 (= e!160633 (is-Undefined!1103 lt!124016))))

(declare-fun b!247627 () Bool)

(declare-fun res!121368 () Bool)

(declare-fun e!160638 () Bool)

(assert (=> b!247627 (=> (not res!121368) (not e!160638))))

(assert (=> b!247627 (= res!121368 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!247628 () Bool)

(declare-fun e!160640 () Bool)

(assert (=> b!247628 (= e!160633 e!160640)))

(declare-fun res!121373 () Bool)

(declare-fun call!23188 () Bool)

(assert (=> b!247628 (= res!121373 call!23188)))

(assert (=> b!247628 (=> (not res!121373) (not e!160640))))

(declare-fun b!247629 () Bool)

(declare-fun e!160637 () Bool)

(assert (=> b!247629 (= e!160637 tp_is_empty!6451)))

(declare-fun b!247630 () Bool)

(declare-fun e!160631 () Bool)

(assert (=> b!247630 (= e!160638 e!160631)))

(declare-fun res!121374 () Bool)

(assert (=> b!247630 (=> (not res!121374) (not e!160631))))

(assert (=> b!247630 (= res!121374 (or (= lt!124016 (MissingZero!1103 index!297)) (= lt!124016 (MissingVacant!1103 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12211 (_ BitVec 32)) SeekEntryResult!1103)

(assert (=> b!247630 (= lt!124016 (seekEntryOrOpen!0 key!932 (_keys!6703 thiss!1504) (mask!10721 thiss!1504)))))

(declare-fun res!121370 () Bool)

(assert (=> start!23570 (=> (not res!121370) (not e!160638))))

(declare-fun valid!1433 (LongMapFixedSize!3664) Bool)

(assert (=> start!23570 (= res!121370 (valid!1433 thiss!1504))))

(assert (=> start!23570 e!160638))

(assert (=> start!23570 e!160643))

(assert (=> start!23570 true))

(declare-fun bm!23185 () Bool)

(assert (=> bm!23185 (= call!23189 (arrayContainsKey!0 (_keys!6703 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!247631 () Bool)

(declare-fun e!160644 () Unit!7656)

(declare-fun Unit!7659 () Unit!7656)

(assert (=> b!247631 (= e!160644 Unit!7659)))

(declare-fun lt!124009 () Unit!7656)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!384 (array!12211 array!12209 (_ BitVec 32) (_ BitVec 32) V!8249 V!8249 (_ BitVec 64) Int) Unit!7656)

(assert (=> b!247631 (= lt!124009 (lemmaInListMapThenSeekEntryOrOpenFindsIt!384 (_keys!6703 thiss!1504) (_values!4564 thiss!1504) (mask!10721 thiss!1504) (extraKeys!4318 thiss!1504) (zeroValue!4422 thiss!1504) (minValue!4422 thiss!1504) key!932 (defaultEntry!4581 thiss!1504)))))

(assert (=> b!247631 false))

(declare-fun b!247632 () Bool)

(assert (=> b!247632 (= e!160631 e!160635)))

(declare-fun res!121375 () Bool)

(assert (=> b!247632 (=> (not res!121375) (not e!160635))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!247632 (= res!121375 (inRange!0 index!297 (mask!10721 thiss!1504)))))

(declare-fun lt!124010 () Unit!7656)

(assert (=> b!247632 (= lt!124010 e!160644)))

(declare-fun c!41459 () Bool)

(declare-datatypes ((tuple2!4814 0))(
  ( (tuple2!4815 (_1!2418 (_ BitVec 64)) (_2!2418 V!8249)) )
))
(declare-datatypes ((List!3696 0))(
  ( (Nil!3693) (Cons!3692 (h!4350 tuple2!4814) (t!8719 List!3696)) )
))
(declare-datatypes ((ListLongMap!3727 0))(
  ( (ListLongMap!3728 (toList!1879 List!3696)) )
))
(declare-fun contains!1793 (ListLongMap!3727 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1407 (array!12211 array!12209 (_ BitVec 32) (_ BitVec 32) V!8249 V!8249 (_ BitVec 32) Int) ListLongMap!3727)

(assert (=> b!247632 (= c!41459 (contains!1793 (getCurrentListMap!1407 (_keys!6703 thiss!1504) (_values!4564 thiss!1504) (mask!10721 thiss!1504) (extraKeys!4318 thiss!1504) (zeroValue!4422 thiss!1504) (minValue!4422 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4581 thiss!1504)) key!932))))

(declare-fun b!247633 () Bool)

(declare-fun Unit!7660 () Unit!7656)

(assert (=> b!247633 (= e!160642 Unit!7660)))

(declare-fun bm!23186 () Bool)

(declare-fun c!41460 () Bool)

(assert (=> bm!23186 (= call!23188 (inRange!0 (ite c!41460 (index!6582 lt!124016) (index!6585 lt!124016)) (mask!10721 thiss!1504)))))

(declare-fun b!247634 () Bool)

(declare-fun lt!124013 () Unit!7656)

(assert (=> b!247634 (= e!160644 lt!124013)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!388 (array!12211 array!12209 (_ BitVec 32) (_ BitVec 32) V!8249 V!8249 (_ BitVec 64) Int) Unit!7656)

(assert (=> b!247634 (= lt!124013 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!388 (_keys!6703 thiss!1504) (_values!4564 thiss!1504) (mask!10721 thiss!1504) (extraKeys!4318 thiss!1504) (zeroValue!4422 thiss!1504) (minValue!4422 thiss!1504) key!932 (defaultEntry!4581 thiss!1504)))))

(assert (=> b!247634 (= c!41460 (is-MissingZero!1103 lt!124016))))

(assert (=> b!247634 e!160636))

(declare-fun mapIsEmpty!10952 () Bool)

(assert (=> mapIsEmpty!10952 mapRes!10952))

(declare-fun b!247635 () Bool)

(assert (=> b!247635 (= e!160634 (and e!160637 mapRes!10952))))

(declare-fun condMapEmpty!10952 () Bool)

(declare-fun mapDefault!10952 () ValueCell!2882)

