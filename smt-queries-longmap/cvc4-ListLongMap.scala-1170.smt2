; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25126 () Bool)

(assert start!25126)

(declare-fun b!261732 () Bool)

(declare-fun b_free!6773 () Bool)

(declare-fun b_next!6773 () Bool)

(assert (=> b!261732 (= b_free!6773 (not b_next!6773))))

(declare-fun tp!23650 () Bool)

(declare-fun b_and!13907 () Bool)

(assert (=> b!261732 (= tp!23650 b_and!13907)))

(declare-fun b!261724 () Bool)

(declare-datatypes ((Unit!8139 0))(
  ( (Unit!8140) )
))
(declare-fun e!169601 () Unit!8139)

(declare-fun Unit!8141 () Unit!8139)

(assert (=> b!261724 (= e!169601 Unit!8141)))

(declare-fun lt!132176 () Unit!8139)

(declare-datatypes ((V!8493 0))(
  ( (V!8494 (val!3362 Int)) )
))
(declare-datatypes ((ValueCell!2974 0))(
  ( (ValueCellFull!2974 (v!5487 V!8493)) (EmptyCell!2974) )
))
(declare-datatypes ((array!12627 0))(
  ( (array!12628 (arr!5976 (Array (_ BitVec 32) ValueCell!2974)) (size!6327 (_ BitVec 32))) )
))
(declare-datatypes ((array!12629 0))(
  ( (array!12630 (arr!5977 (Array (_ BitVec 32) (_ BitVec 64))) (size!6328 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3848 0))(
  ( (LongMapFixedSize!3849 (defaultEntry!4822 Int) (mask!11170 (_ BitVec 32)) (extraKeys!4559 (_ BitVec 32)) (zeroValue!4663 V!8493) (minValue!4663 V!8493) (_size!1973 (_ BitVec 32)) (_keys!7010 array!12629) (_values!4805 array!12627) (_vacant!1973 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3848)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!447 (array!12629 array!12627 (_ BitVec 32) (_ BitVec 32) V!8493 V!8493 (_ BitVec 64) Int) Unit!8139)

(assert (=> b!261724 (= lt!132176 (lemmaInListMapThenSeekEntryOrOpenFindsIt!447 (_keys!7010 thiss!1504) (_values!4805 thiss!1504) (mask!11170 thiss!1504) (extraKeys!4559 thiss!1504) (zeroValue!4663 thiss!1504) (minValue!4663 thiss!1504) key!932 (defaultEntry!4822 thiss!1504)))))

(assert (=> b!261724 false))

(declare-fun b!261725 () Bool)

(declare-fun res!127873 () Bool)

(declare-datatypes ((SeekEntryResult!1189 0))(
  ( (MissingZero!1189 (index!6926 (_ BitVec 32))) (Found!1189 (index!6927 (_ BitVec 32))) (Intermediate!1189 (undefined!2001 Bool) (index!6928 (_ BitVec 32)) (x!25179 (_ BitVec 32))) (Undefined!1189) (MissingVacant!1189 (index!6929 (_ BitVec 32))) )
))
(declare-fun lt!132177 () SeekEntryResult!1189)

(assert (=> b!261725 (= res!127873 (= (select (arr!5977 (_keys!7010 thiss!1504)) (index!6929 lt!132177)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!169593 () Bool)

(assert (=> b!261725 (=> (not res!127873) (not e!169593))))

(declare-fun mapIsEmpty!11311 () Bool)

(declare-fun mapRes!11311 () Bool)

(assert (=> mapIsEmpty!11311 mapRes!11311))

(declare-fun b!261726 () Bool)

(declare-fun call!24991 () Bool)

(assert (=> b!261726 (= e!169593 (not call!24991))))

(declare-fun b!261727 () Bool)

(declare-fun e!169599 () Bool)

(assert (=> b!261727 (= e!169599 (not true))))

(declare-fun lt!132174 () array!12629)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!12629 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!261727 (= (arrayCountValidKeys!0 lt!132174 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!132186 () Unit!8139)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12629 (_ BitVec 32)) Unit!8139)

(assert (=> b!261727 (= lt!132186 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!132174 index!297))))

(declare-fun arrayContainsKey!0 (array!12629 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!261727 (arrayContainsKey!0 lt!132174 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!132185 () Unit!8139)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12629 (_ BitVec 64) (_ BitVec 32)) Unit!8139)

(assert (=> b!261727 (= lt!132185 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!132174 key!932 index!297))))

(declare-datatypes ((tuple2!4960 0))(
  ( (tuple2!4961 (_1!2491 (_ BitVec 64)) (_2!2491 V!8493)) )
))
(declare-datatypes ((List!3836 0))(
  ( (Nil!3833) (Cons!3832 (h!4498 tuple2!4960) (t!8909 List!3836)) )
))
(declare-datatypes ((ListLongMap!3873 0))(
  ( (ListLongMap!3874 (toList!1952 List!3836)) )
))
(declare-fun lt!132173 () ListLongMap!3873)

(declare-fun v!346 () V!8493)

(declare-fun +!703 (ListLongMap!3873 tuple2!4960) ListLongMap!3873)

(declare-fun getCurrentListMap!1480 (array!12629 array!12627 (_ BitVec 32) (_ BitVec 32) V!8493 V!8493 (_ BitVec 32) Int) ListLongMap!3873)

(assert (=> b!261727 (= (+!703 lt!132173 (tuple2!4961 key!932 v!346)) (getCurrentListMap!1480 lt!132174 (array!12628 (store (arr!5976 (_values!4805 thiss!1504)) index!297 (ValueCellFull!2974 v!346)) (size!6327 (_values!4805 thiss!1504))) (mask!11170 thiss!1504) (extraKeys!4559 thiss!1504) (zeroValue!4663 thiss!1504) (minValue!4663 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4822 thiss!1504)))))

(declare-fun lt!132182 () Unit!8139)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!113 (array!12629 array!12627 (_ BitVec 32) (_ BitVec 32) V!8493 V!8493 (_ BitVec 32) (_ BitVec 64) V!8493 Int) Unit!8139)

(assert (=> b!261727 (= lt!132182 (lemmaAddValidKeyToArrayThenAddPairToListMap!113 (_keys!7010 thiss!1504) (_values!4805 thiss!1504) (mask!11170 thiss!1504) (extraKeys!4559 thiss!1504) (zeroValue!4663 thiss!1504) (minValue!4663 thiss!1504) index!297 key!932 v!346 (defaultEntry!4822 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12629 (_ BitVec 32)) Bool)

(assert (=> b!261727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!132174 (mask!11170 thiss!1504))))

(declare-fun lt!132181 () Unit!8139)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12629 (_ BitVec 32) (_ BitVec 32)) Unit!8139)

(assert (=> b!261727 (= lt!132181 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!7010 thiss!1504) index!297 (mask!11170 thiss!1504)))))

(assert (=> b!261727 (= (arrayCountValidKeys!0 lt!132174 #b00000000000000000000000000000000 (size!6328 (_keys!7010 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!7010 thiss!1504) #b00000000000000000000000000000000 (size!6328 (_keys!7010 thiss!1504)))))))

(declare-fun lt!132175 () Unit!8139)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12629 (_ BitVec 32) (_ BitVec 64)) Unit!8139)

(assert (=> b!261727 (= lt!132175 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!7010 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3837 0))(
  ( (Nil!3834) (Cons!3833 (h!4499 (_ BitVec 64)) (t!8910 List!3837)) )
))
(declare-fun arrayNoDuplicates!0 (array!12629 (_ BitVec 32) List!3837) Bool)

(assert (=> b!261727 (arrayNoDuplicates!0 lt!132174 #b00000000000000000000000000000000 Nil!3834)))

(assert (=> b!261727 (= lt!132174 (array!12630 (store (arr!5977 (_keys!7010 thiss!1504)) index!297 key!932) (size!6328 (_keys!7010 thiss!1504))))))

(declare-fun lt!132180 () Unit!8139)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12629 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3837) Unit!8139)

(assert (=> b!261727 (= lt!132180 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!7010 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3834))))

(declare-fun lt!132178 () Unit!8139)

(declare-fun e!169592 () Unit!8139)

(assert (=> b!261727 (= lt!132178 e!169592)))

(declare-fun c!44575 () Bool)

(assert (=> b!261727 (= c!44575 (arrayContainsKey!0 (_keys!7010 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!261728 () Bool)

(declare-fun res!127870 () Bool)

(declare-fun e!169600 () Bool)

(assert (=> b!261728 (=> (not res!127870) (not e!169600))))

(assert (=> b!261728 (= res!127870 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!261729 () Bool)

(declare-fun res!127867 () Bool)

(declare-fun e!169603 () Bool)

(assert (=> b!261729 (=> (not res!127867) (not e!169603))))

(declare-fun call!24992 () Bool)

(assert (=> b!261729 (= res!127867 call!24992)))

(declare-fun e!169596 () Bool)

(assert (=> b!261729 (= e!169596 e!169603)))

(declare-fun b!261730 () Bool)

(declare-fun Unit!8142 () Unit!8139)

(assert (=> b!261730 (= e!169592 Unit!8142)))

(declare-fun lt!132184 () Unit!8139)

(declare-fun lemmaArrayContainsKeyThenInListMap!255 (array!12629 array!12627 (_ BitVec 32) (_ BitVec 32) V!8493 V!8493 (_ BitVec 64) (_ BitVec 32) Int) Unit!8139)

(assert (=> b!261730 (= lt!132184 (lemmaArrayContainsKeyThenInListMap!255 (_keys!7010 thiss!1504) (_values!4805 thiss!1504) (mask!11170 thiss!1504) (extraKeys!4559 thiss!1504) (zeroValue!4663 thiss!1504) (minValue!4663 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4822 thiss!1504)))))

(assert (=> b!261730 false))

(declare-fun b!261731 () Bool)

(assert (=> b!261731 (= e!169603 (not call!24991))))

(declare-fun e!169597 () Bool)

(declare-fun tp_is_empty!6635 () Bool)

(declare-fun e!169605 () Bool)

(declare-fun array_inv!3949 (array!12629) Bool)

(declare-fun array_inv!3950 (array!12627) Bool)

(assert (=> b!261732 (= e!169597 (and tp!23650 tp_is_empty!6635 (array_inv!3949 (_keys!7010 thiss!1504)) (array_inv!3950 (_values!4805 thiss!1504)) e!169605))))

(declare-fun b!261733 () Bool)

(declare-fun e!169598 () Bool)

(assert (=> b!261733 (= e!169600 e!169598)))

(declare-fun res!127872 () Bool)

(assert (=> b!261733 (=> (not res!127872) (not e!169598))))

(assert (=> b!261733 (= res!127872 (or (= lt!132177 (MissingZero!1189 index!297)) (= lt!132177 (MissingVacant!1189 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12629 (_ BitVec 32)) SeekEntryResult!1189)

(assert (=> b!261733 (= lt!132177 (seekEntryOrOpen!0 key!932 (_keys!7010 thiss!1504) (mask!11170 thiss!1504)))))

(declare-fun b!261734 () Bool)

(declare-fun e!169595 () Bool)

(assert (=> b!261734 (= e!169595 e!169593)))

(declare-fun res!127871 () Bool)

(assert (=> b!261734 (= res!127871 call!24992)))

(assert (=> b!261734 (=> (not res!127871) (not e!169593))))

(declare-fun b!261735 () Bool)

(declare-fun c!44574 () Bool)

(assert (=> b!261735 (= c!44574 (is-MissingVacant!1189 lt!132177))))

(assert (=> b!261735 (= e!169596 e!169595)))

(declare-fun b!261736 () Bool)

(declare-fun lt!132183 () Unit!8139)

(assert (=> b!261736 (= e!169601 lt!132183)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!449 (array!12629 array!12627 (_ BitVec 32) (_ BitVec 32) V!8493 V!8493 (_ BitVec 64) Int) Unit!8139)

(assert (=> b!261736 (= lt!132183 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!449 (_keys!7010 thiss!1504) (_values!4805 thiss!1504) (mask!11170 thiss!1504) (extraKeys!4559 thiss!1504) (zeroValue!4663 thiss!1504) (minValue!4663 thiss!1504) key!932 (defaultEntry!4822 thiss!1504)))))

(declare-fun c!44576 () Bool)

(assert (=> b!261736 (= c!44576 (is-MissingZero!1189 lt!132177))))

(assert (=> b!261736 e!169596))

(declare-fun bm!24988 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!24988 (= call!24992 (inRange!0 (ite c!44576 (index!6926 lt!132177) (index!6929 lt!132177)) (mask!11170 thiss!1504)))))

(declare-fun b!261737 () Bool)

(declare-fun e!169602 () Bool)

(assert (=> b!261737 (= e!169602 tp_is_empty!6635)))

(declare-fun b!261738 () Bool)

(declare-fun Unit!8143 () Unit!8139)

(assert (=> b!261738 (= e!169592 Unit!8143)))

(declare-fun b!261739 () Bool)

(assert (=> b!261739 (= e!169595 (is-Undefined!1189 lt!132177))))

(declare-fun b!261740 () Bool)

(assert (=> b!261740 (= e!169605 (and e!169602 mapRes!11311))))

(declare-fun condMapEmpty!11311 () Bool)

(declare-fun mapDefault!11311 () ValueCell!2974)

