; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23370 () Bool)

(assert start!23370)

(declare-fun b!245787 () Bool)

(declare-fun b_free!6563 () Bool)

(declare-fun b_next!6563 () Bool)

(assert (=> b!245787 (= b_free!6563 (not b_next!6563))))

(declare-fun tp!22923 () Bool)

(declare-fun b_and!13553 () Bool)

(assert (=> b!245787 (= tp!22923 b_and!13553)))

(declare-fun b!245778 () Bool)

(declare-fun e!159467 () Bool)

(declare-fun e!159458 () Bool)

(assert (=> b!245778 (= e!159467 e!159458)))

(declare-fun res!120535 () Bool)

(declare-fun call!22957 () Bool)

(assert (=> b!245778 (= res!120535 call!22957)))

(assert (=> b!245778 (=> (not res!120535) (not e!159458))))

(declare-fun b!245779 () Bool)

(declare-fun res!120539 () Bool)

(declare-datatypes ((V!8213 0))(
  ( (V!8214 (val!3257 Int)) )
))
(declare-datatypes ((ValueCell!2869 0))(
  ( (ValueCellFull!2869 (v!5310 V!8213)) (EmptyCell!2869) )
))
(declare-datatypes ((array!12149 0))(
  ( (array!12150 (arr!5766 (Array (_ BitVec 32) ValueCell!2869)) (size!6108 (_ BitVec 32))) )
))
(declare-datatypes ((array!12151 0))(
  ( (array!12152 (arr!5767 (Array (_ BitVec 32) (_ BitVec 64))) (size!6109 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3638 0))(
  ( (LongMapFixedSize!3639 (defaultEntry!4548 Int) (mask!10662 (_ BitVec 32)) (extraKeys!4285 (_ BitVec 32)) (zeroValue!4389 V!8213) (minValue!4389 V!8213) (_size!1868 (_ BitVec 32)) (_keys!6663 array!12151) (_values!4531 array!12149) (_vacant!1868 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3638)

(declare-datatypes ((SeekEntryResult!1092 0))(
  ( (MissingZero!1092 (index!6538 (_ BitVec 32))) (Found!1092 (index!6539 (_ BitVec 32))) (Intermediate!1092 (undefined!1904 Bool) (index!6540 (_ BitVec 32)) (x!24440 (_ BitVec 32))) (Undefined!1092) (MissingVacant!1092 (index!6541 (_ BitVec 32))) )
))
(declare-fun lt!123086 () SeekEntryResult!1092)

(assert (=> b!245779 (= res!120539 (= (select (arr!5767 (_keys!6663 thiss!1504)) (index!6541 lt!123086)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!245779 (=> (not res!120539) (not e!159458))))

(declare-fun b!245780 () Bool)

(declare-fun res!120538 () Bool)

(declare-fun e!159471 () Bool)

(assert (=> b!245780 (=> (not res!120538) (not e!159471))))

(assert (=> b!245780 (= res!120538 (= (select (arr!5767 (_keys!6663 thiss!1504)) (index!6538 lt!123086)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!245781 () Bool)

(declare-datatypes ((Unit!7590 0))(
  ( (Unit!7591) )
))
(declare-fun e!159461 () Unit!7590)

(declare-fun lt!123089 () Unit!7590)

(assert (=> b!245781 (= e!159461 lt!123089)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!379 (array!12151 array!12149 (_ BitVec 32) (_ BitVec 32) V!8213 V!8213 (_ BitVec 64) Int) Unit!7590)

(assert (=> b!245781 (= lt!123089 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!379 (_keys!6663 thiss!1504) (_values!4531 thiss!1504) (mask!10662 thiss!1504) (extraKeys!4285 thiss!1504) (zeroValue!4389 thiss!1504) (minValue!4389 thiss!1504) key!932 (defaultEntry!4548 thiss!1504)))))

(declare-fun c!41056 () Bool)

(assert (=> b!245781 (= c!41056 (is-MissingZero!1092 lt!123086))))

(declare-fun e!159460 () Bool)

(assert (=> b!245781 e!159460))

(declare-fun b!245782 () Bool)

(declare-fun e!159459 () Unit!7590)

(declare-fun Unit!7592 () Unit!7590)

(assert (=> b!245782 (= e!159459 Unit!7592)))

(declare-fun lt!123083 () Unit!7590)

(declare-fun lemmaArrayContainsKeyThenInListMap!176 (array!12151 array!12149 (_ BitVec 32) (_ BitVec 32) V!8213 V!8213 (_ BitVec 64) (_ BitVec 32) Int) Unit!7590)

(assert (=> b!245782 (= lt!123083 (lemmaArrayContainsKeyThenInListMap!176 (_keys!6663 thiss!1504) (_values!4531 thiss!1504) (mask!10662 thiss!1504) (extraKeys!4285 thiss!1504) (zeroValue!4389 thiss!1504) (minValue!4389 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4548 thiss!1504)))))

(assert (=> b!245782 false))

(declare-fun b!245783 () Bool)

(declare-fun c!41057 () Bool)

(assert (=> b!245783 (= c!41057 (is-MissingVacant!1092 lt!123086))))

(assert (=> b!245783 (= e!159460 e!159467)))

(declare-fun b!245784 () Bool)

(declare-fun Unit!7593 () Unit!7590)

(assert (=> b!245784 (= e!159461 Unit!7593)))

(declare-fun lt!123085 () Unit!7590)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!374 (array!12151 array!12149 (_ BitVec 32) (_ BitVec 32) V!8213 V!8213 (_ BitVec 64) Int) Unit!7590)

(assert (=> b!245784 (= lt!123085 (lemmaInListMapThenSeekEntryOrOpenFindsIt!374 (_keys!6663 thiss!1504) (_values!4531 thiss!1504) (mask!10662 thiss!1504) (extraKeys!4285 thiss!1504) (zeroValue!4389 thiss!1504) (minValue!4389 thiss!1504) key!932 (defaultEntry!4548 thiss!1504)))))

(assert (=> b!245784 false))

(declare-fun b!245785 () Bool)

(declare-fun e!159468 () Bool)

(declare-fun tp_is_empty!6425 () Bool)

(assert (=> b!245785 (= e!159468 tp_is_empty!6425)))

(declare-fun b!245786 () Bool)

(assert (=> b!245786 (= e!159467 (is-Undefined!1092 lt!123086))))

(declare-fun e!159457 () Bool)

(declare-fun e!159463 () Bool)

(declare-fun array_inv!3809 (array!12151) Bool)

(declare-fun array_inv!3810 (array!12149) Bool)

(assert (=> b!245787 (= e!159463 (and tp!22923 tp_is_empty!6425 (array_inv!3809 (_keys!6663 thiss!1504)) (array_inv!3810 (_values!4531 thiss!1504)) e!159457))))

(declare-fun b!245788 () Bool)

(declare-fun e!159465 () Bool)

(assert (=> b!245788 (= e!159465 (= (size!6109 (_keys!6663 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10662 thiss!1504))))))

(declare-fun b!245789 () Bool)

(declare-fun Unit!7594 () Unit!7590)

(assert (=> b!245789 (= e!159459 Unit!7594)))

(declare-fun b!245790 () Bool)

(declare-fun e!159462 () Bool)

(assert (=> b!245790 (= e!159462 (not e!159465))))

(declare-fun res!120537 () Bool)

(assert (=> b!245790 (=> res!120537 e!159465)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!245790 (= res!120537 (not (validMask!0 (mask!10662 thiss!1504))))))

(declare-fun lt!123088 () array!12151)

(declare-fun arrayCountValidKeys!0 (array!12151 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!245790 (= (arrayCountValidKeys!0 lt!123088 #b00000000000000000000000000000000 (size!6109 (_keys!6663 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6663 thiss!1504) #b00000000000000000000000000000000 (size!6109 (_keys!6663 thiss!1504)))))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun lt!123087 () Unit!7590)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12151 (_ BitVec 32) (_ BitVec 64)) Unit!7590)

(assert (=> b!245790 (= lt!123087 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6663 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3674 0))(
  ( (Nil!3671) (Cons!3670 (h!4327 (_ BitVec 64)) (t!8689 List!3674)) )
))
(declare-fun arrayNoDuplicates!0 (array!12151 (_ BitVec 32) List!3674) Bool)

(assert (=> b!245790 (arrayNoDuplicates!0 lt!123088 #b00000000000000000000000000000000 Nil!3671)))

(assert (=> b!245790 (= lt!123088 (array!12152 (store (arr!5767 (_keys!6663 thiss!1504)) index!297 key!932) (size!6109 (_keys!6663 thiss!1504))))))

(declare-fun lt!123084 () Unit!7590)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12151 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3674) Unit!7590)

(assert (=> b!245790 (= lt!123084 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6663 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3671))))

(declare-fun lt!123082 () Unit!7590)

(assert (=> b!245790 (= lt!123082 e!159459)))

(declare-fun c!41055 () Bool)

(declare-fun arrayContainsKey!0 (array!12151 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!245790 (= c!41055 (arrayContainsKey!0 (_keys!6663 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!245791 () Bool)

(declare-fun call!22956 () Bool)

(assert (=> b!245791 (= e!159471 (not call!22956))))

(declare-fun b!245792 () Bool)

(declare-fun e!159464 () Bool)

(assert (=> b!245792 (= e!159464 e!159462)))

(declare-fun res!120540 () Bool)

(assert (=> b!245792 (=> (not res!120540) (not e!159462))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!245792 (= res!120540 (inRange!0 index!297 (mask!10662 thiss!1504)))))

(declare-fun lt!123090 () Unit!7590)

(assert (=> b!245792 (= lt!123090 e!159461)))

(declare-fun c!41054 () Bool)

(declare-datatypes ((tuple2!4792 0))(
  ( (tuple2!4793 (_1!2407 (_ BitVec 64)) (_2!2407 V!8213)) )
))
(declare-datatypes ((List!3675 0))(
  ( (Nil!3672) (Cons!3671 (h!4328 tuple2!4792) (t!8690 List!3675)) )
))
(declare-datatypes ((ListLongMap!3705 0))(
  ( (ListLongMap!3706 (toList!1868 List!3675)) )
))
(declare-fun contains!1777 (ListLongMap!3705 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1396 (array!12151 array!12149 (_ BitVec 32) (_ BitVec 32) V!8213 V!8213 (_ BitVec 32) Int) ListLongMap!3705)

(assert (=> b!245792 (= c!41054 (contains!1777 (getCurrentListMap!1396 (_keys!6663 thiss!1504) (_values!4531 thiss!1504) (mask!10662 thiss!1504) (extraKeys!4285 thiss!1504) (zeroValue!4389 thiss!1504) (minValue!4389 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4548 thiss!1504)) key!932))))

(declare-fun mapNonEmpty!10900 () Bool)

(declare-fun mapRes!10900 () Bool)

(declare-fun tp!22924 () Bool)

(declare-fun e!159466 () Bool)

(assert (=> mapNonEmpty!10900 (= mapRes!10900 (and tp!22924 e!159466))))

(declare-fun mapRest!10900 () (Array (_ BitVec 32) ValueCell!2869))

(declare-fun mapKey!10900 () (_ BitVec 32))

(declare-fun mapValue!10900 () ValueCell!2869)

(assert (=> mapNonEmpty!10900 (= (arr!5766 (_values!4531 thiss!1504)) (store mapRest!10900 mapKey!10900 mapValue!10900))))

(declare-fun res!120542 () Bool)

(declare-fun e!159469 () Bool)

(assert (=> start!23370 (=> (not res!120542) (not e!159469))))

(declare-fun valid!1424 (LongMapFixedSize!3638) Bool)

(assert (=> start!23370 (= res!120542 (valid!1424 thiss!1504))))

(assert (=> start!23370 e!159469))

(assert (=> start!23370 e!159463))

(assert (=> start!23370 true))

(declare-fun b!245793 () Bool)

(assert (=> b!245793 (= e!159458 (not call!22956))))

(declare-fun b!245794 () Bool)

(declare-fun res!120536 () Bool)

(assert (=> b!245794 (=> (not res!120536) (not e!159471))))

(assert (=> b!245794 (= res!120536 call!22957)))

(assert (=> b!245794 (= e!159460 e!159471)))

(declare-fun b!245795 () Bool)

(assert (=> b!245795 (= e!159466 tp_is_empty!6425)))

(declare-fun b!245796 () Bool)

(assert (=> b!245796 (= e!159457 (and e!159468 mapRes!10900))))

(declare-fun condMapEmpty!10900 () Bool)

(declare-fun mapDefault!10900 () ValueCell!2869)

