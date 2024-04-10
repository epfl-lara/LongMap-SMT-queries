; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23660 () Bool)

(assert start!23660)

(declare-fun b!248667 () Bool)

(declare-fun b_free!6607 () Bool)

(declare-fun b_next!6607 () Bool)

(assert (=> b!248667 (= b_free!6607 (not b_next!6607))))

(declare-fun tp!23075 () Bool)

(declare-fun b_and!13613 () Bool)

(assert (=> b!248667 (= tp!23075 b_and!13613)))

(declare-fun b!248652 () Bool)

(declare-datatypes ((Unit!7698 0))(
  ( (Unit!7699) )
))
(declare-fun e!161276 () Unit!7698)

(declare-fun Unit!7700 () Unit!7698)

(assert (=> b!248652 (= e!161276 Unit!7700)))

(declare-fun lt!124518 () Unit!7698)

(declare-datatypes ((V!8273 0))(
  ( (V!8274 (val!3279 Int)) )
))
(declare-datatypes ((ValueCell!2891 0))(
  ( (ValueCellFull!2891 (v!5339 V!8273)) (EmptyCell!2891) )
))
(declare-datatypes ((array!12249 0))(
  ( (array!12250 (arr!5810 (Array (_ BitVec 32) ValueCell!2891)) (size!6153 (_ BitVec 32))) )
))
(declare-datatypes ((array!12251 0))(
  ( (array!12252 (arr!5811 (Array (_ BitVec 32) (_ BitVec 64))) (size!6154 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3682 0))(
  ( (LongMapFixedSize!3683 (defaultEntry!4598 Int) (mask!10752 (_ BitVec 32)) (extraKeys!4335 (_ BitVec 32)) (zeroValue!4439 V!8273) (minValue!4439 V!8273) (_size!1890 (_ BitVec 32)) (_keys!6724 array!12251) (_values!4581 array!12249) (_vacant!1890 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3682)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!194 (array!12251 array!12249 (_ BitVec 32) (_ BitVec 32) V!8273 V!8273 (_ BitVec 64) (_ BitVec 32) Int) Unit!7698)

(assert (=> b!248652 (= lt!124518 (lemmaArrayContainsKeyThenInListMap!194 (_keys!6724 thiss!1504) (_values!4581 thiss!1504) (mask!10752 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4598 thiss!1504)))))

(assert (=> b!248652 false))

(declare-fun b!248653 () Bool)

(declare-fun Unit!7701 () Unit!7698)

(assert (=> b!248653 (= e!161276 Unit!7701)))

(declare-fun b!248654 () Bool)

(declare-fun res!121856 () Bool)

(declare-fun e!161286 () Bool)

(assert (=> b!248654 (=> (not res!121856) (not e!161286))))

(declare-fun call!23317 () Bool)

(assert (=> b!248654 (= res!121856 call!23317)))

(declare-fun e!161281 () Bool)

(assert (=> b!248654 (= e!161281 e!161286)))

(declare-fun b!248655 () Bool)

(declare-fun e!161280 () Bool)

(declare-fun call!23318 () Bool)

(assert (=> b!248655 (= e!161280 (not call!23318))))

(declare-fun b!248656 () Bool)

(declare-fun e!161284 () Bool)

(assert (=> b!248656 (= e!161284 e!161280)))

(declare-fun res!121861 () Bool)

(assert (=> b!248656 (= res!121861 call!23317)))

(assert (=> b!248656 (=> (not res!121861) (not e!161280))))

(declare-fun b!248657 () Bool)

(declare-fun e!161288 () Bool)

(declare-fun tp_is_empty!6469 () Bool)

(assert (=> b!248657 (= e!161288 tp_is_empty!6469)))

(declare-fun b!248658 () Bool)

(declare-fun c!41668 () Bool)

(declare-datatypes ((SeekEntryResult!1112 0))(
  ( (MissingZero!1112 (index!6618 (_ BitVec 32))) (Found!1112 (index!6619 (_ BitVec 32))) (Intermediate!1112 (undefined!1924 Bool) (index!6620 (_ BitVec 32)) (x!24592 (_ BitVec 32))) (Undefined!1112) (MissingVacant!1112 (index!6621 (_ BitVec 32))) )
))
(declare-fun lt!124523 () SeekEntryResult!1112)

(assert (=> b!248658 (= c!41668 (is-MissingVacant!1112 lt!124523))))

(assert (=> b!248658 (= e!161281 e!161284)))

(declare-fun b!248659 () Bool)

(assert (=> b!248659 (= e!161284 (is-Undefined!1112 lt!124523))))

(declare-fun b!248660 () Bool)

(declare-fun e!161285 () Unit!7698)

(declare-fun Unit!7702 () Unit!7698)

(assert (=> b!248660 (= e!161285 Unit!7702)))

(declare-fun lt!124519 () Unit!7698)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!390 (array!12251 array!12249 (_ BitVec 32) (_ BitVec 32) V!8273 V!8273 (_ BitVec 64) Int) Unit!7698)

(assert (=> b!248660 (= lt!124519 (lemmaInListMapThenSeekEntryOrOpenFindsIt!390 (_keys!6724 thiss!1504) (_values!4581 thiss!1504) (mask!10752 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) key!932 (defaultEntry!4598 thiss!1504)))))

(assert (=> b!248660 false))

(declare-fun b!248661 () Bool)

(declare-fun e!161279 () Bool)

(declare-fun e!161283 () Bool)

(assert (=> b!248661 (= e!161279 e!161283)))

(declare-fun res!121855 () Bool)

(assert (=> b!248661 (=> (not res!121855) (not e!161283))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!248661 (= res!121855 (inRange!0 index!297 (mask!10752 thiss!1504)))))

(declare-fun lt!124521 () Unit!7698)

(assert (=> b!248661 (= lt!124521 e!161285)))

(declare-fun c!41670 () Bool)

(declare-datatypes ((tuple2!4826 0))(
  ( (tuple2!4827 (_1!2424 (_ BitVec 64)) (_2!2424 V!8273)) )
))
(declare-datatypes ((List!3707 0))(
  ( (Nil!3704) (Cons!3703 (h!4361 tuple2!4826) (t!8734 List!3707)) )
))
(declare-datatypes ((ListLongMap!3739 0))(
  ( (ListLongMap!3740 (toList!1885 List!3707)) )
))
(declare-fun contains!1801 (ListLongMap!3739 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1413 (array!12251 array!12249 (_ BitVec 32) (_ BitVec 32) V!8273 V!8273 (_ BitVec 32) Int) ListLongMap!3739)

(assert (=> b!248661 (= c!41670 (contains!1801 (getCurrentListMap!1413 (_keys!6724 thiss!1504) (_values!4581 thiss!1504) (mask!10752 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4598 thiss!1504)) key!932))))

(declare-fun mapNonEmpty!10985 () Bool)

(declare-fun mapRes!10985 () Bool)

(declare-fun tp!23074 () Bool)

(declare-fun e!161275 () Bool)

(assert (=> mapNonEmpty!10985 (= mapRes!10985 (and tp!23074 e!161275))))

(declare-fun mapValue!10985 () ValueCell!2891)

(declare-fun mapRest!10985 () (Array (_ BitVec 32) ValueCell!2891))

(declare-fun mapKey!10985 () (_ BitVec 32))

(assert (=> mapNonEmpty!10985 (= (arr!5810 (_values!4581 thiss!1504)) (store mapRest!10985 mapKey!10985 mapValue!10985))))

(declare-fun b!248662 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!248662 (= e!161283 (not (validMask!0 (mask!10752 thiss!1504))))))

(declare-fun lt!124516 () array!12251)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12251 (_ BitVec 32)) Bool)

(assert (=> b!248662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!124516 (mask!10752 thiss!1504))))

(declare-fun lt!124515 () Unit!7698)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12251 (_ BitVec 32) (_ BitVec 32)) Unit!7698)

(assert (=> b!248662 (= lt!124515 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6724 thiss!1504) index!297 (mask!10752 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12251 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!248662 (= (arrayCountValidKeys!0 lt!124516 #b00000000000000000000000000000000 (size!6154 (_keys!6724 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6724 thiss!1504) #b00000000000000000000000000000000 (size!6154 (_keys!6724 thiss!1504)))))))

(declare-fun lt!124514 () Unit!7698)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12251 (_ BitVec 32) (_ BitVec 64)) Unit!7698)

(assert (=> b!248662 (= lt!124514 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6724 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3708 0))(
  ( (Nil!3705) (Cons!3704 (h!4362 (_ BitVec 64)) (t!8735 List!3708)) )
))
(declare-fun arrayNoDuplicates!0 (array!12251 (_ BitVec 32) List!3708) Bool)

(assert (=> b!248662 (arrayNoDuplicates!0 lt!124516 #b00000000000000000000000000000000 Nil!3705)))

(assert (=> b!248662 (= lt!124516 (array!12252 (store (arr!5811 (_keys!6724 thiss!1504)) index!297 key!932) (size!6154 (_keys!6724 thiss!1504))))))

(declare-fun lt!124522 () Unit!7698)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12251 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3708) Unit!7698)

(assert (=> b!248662 (= lt!124522 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6724 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3705))))

(declare-fun lt!124520 () Unit!7698)

(assert (=> b!248662 (= lt!124520 e!161276)))

(declare-fun c!41671 () Bool)

(declare-fun arrayContainsKey!0 (array!12251 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!248662 (= c!41671 (arrayContainsKey!0 (_keys!6724 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!248663 () Bool)

(declare-fun res!121859 () Bool)

(declare-fun e!161277 () Bool)

(assert (=> b!248663 (=> (not res!121859) (not e!161277))))

(assert (=> b!248663 (= res!121859 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!248664 () Bool)

(assert (=> b!248664 (= e!161286 (not call!23318))))

(declare-fun b!248665 () Bool)

(declare-fun res!121858 () Bool)

(assert (=> b!248665 (=> (not res!121858) (not e!161286))))

(assert (=> b!248665 (= res!121858 (= (select (arr!5811 (_keys!6724 thiss!1504)) (index!6618 lt!124523)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!10985 () Bool)

(assert (=> mapIsEmpty!10985 mapRes!10985))

(declare-fun bm!23314 () Bool)

(declare-fun c!41669 () Bool)

(assert (=> bm!23314 (= call!23317 (inRange!0 (ite c!41669 (index!6618 lt!124523) (index!6621 lt!124523)) (mask!10752 thiss!1504)))))

(declare-fun b!248666 () Bool)

(assert (=> b!248666 (= e!161277 e!161279)))

(declare-fun res!121854 () Bool)

(assert (=> b!248666 (=> (not res!121854) (not e!161279))))

(assert (=> b!248666 (= res!121854 (or (= lt!124523 (MissingZero!1112 index!297)) (= lt!124523 (MissingVacant!1112 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12251 (_ BitVec 32)) SeekEntryResult!1112)

(assert (=> b!248666 (= lt!124523 (seekEntryOrOpen!0 key!932 (_keys!6724 thiss!1504) (mask!10752 thiss!1504)))))

(declare-fun bm!23315 () Bool)

(assert (=> bm!23315 (= call!23318 (arrayContainsKey!0 (_keys!6724 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun e!161282 () Bool)

(declare-fun e!161278 () Bool)

(declare-fun array_inv!3835 (array!12251) Bool)

(declare-fun array_inv!3836 (array!12249) Bool)

(assert (=> b!248667 (= e!161278 (and tp!23075 tp_is_empty!6469 (array_inv!3835 (_keys!6724 thiss!1504)) (array_inv!3836 (_values!4581 thiss!1504)) e!161282))))

(declare-fun res!121857 () Bool)

(assert (=> start!23660 (=> (not res!121857) (not e!161277))))

(declare-fun valid!1441 (LongMapFixedSize!3682) Bool)

(assert (=> start!23660 (= res!121857 (valid!1441 thiss!1504))))

(assert (=> start!23660 e!161277))

(assert (=> start!23660 e!161278))

(assert (=> start!23660 true))

(declare-fun b!248668 () Bool)

(assert (=> b!248668 (= e!161275 tp_is_empty!6469)))

(declare-fun b!248669 () Bool)

(declare-fun lt!124517 () Unit!7698)

(assert (=> b!248669 (= e!161285 lt!124517)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!393 (array!12251 array!12249 (_ BitVec 32) (_ BitVec 32) V!8273 V!8273 (_ BitVec 64) Int) Unit!7698)

(assert (=> b!248669 (= lt!124517 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!393 (_keys!6724 thiss!1504) (_values!4581 thiss!1504) (mask!10752 thiss!1504) (extraKeys!4335 thiss!1504) (zeroValue!4439 thiss!1504) (minValue!4439 thiss!1504) key!932 (defaultEntry!4598 thiss!1504)))))

(assert (=> b!248669 (= c!41669 (is-MissingZero!1112 lt!124523))))

(assert (=> b!248669 e!161281))

(declare-fun b!248670 () Bool)

(assert (=> b!248670 (= e!161282 (and e!161288 mapRes!10985))))

(declare-fun condMapEmpty!10985 () Bool)

(declare-fun mapDefault!10985 () ValueCell!2891)

