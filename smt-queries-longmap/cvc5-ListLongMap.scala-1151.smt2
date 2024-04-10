; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24180 () Bool)

(assert start!24180)

(declare-fun b!252833 () Bool)

(declare-fun b_free!6655 () Bool)

(declare-fun b_next!6655 () Bool)

(assert (=> b!252833 (= b_free!6655 (not b_next!6655))))

(declare-fun tp!23247 () Bool)

(declare-fun b_and!13693 () Bool)

(assert (=> b!252833 (= tp!23247 b_and!13693)))

(declare-fun b!252819 () Bool)

(declare-fun res!123757 () Bool)

(declare-fun e!163944 () Bool)

(assert (=> b!252819 (=> (not res!123757) (not e!163944))))

(declare-fun call!23833 () Bool)

(assert (=> b!252819 (= res!123757 call!23833)))

(declare-fun e!163946 () Bool)

(assert (=> b!252819 (= e!163946 e!163944)))

(declare-fun b!252820 () Bool)

(declare-datatypes ((Unit!7825 0))(
  ( (Unit!7826) )
))
(declare-fun e!163942 () Unit!7825)

(declare-fun Unit!7827 () Unit!7825)

(assert (=> b!252820 (= e!163942 Unit!7827)))

(declare-fun lt!126734 () Unit!7825)

(declare-datatypes ((V!8337 0))(
  ( (V!8338 (val!3303 Int)) )
))
(declare-datatypes ((ValueCell!2915 0))(
  ( (ValueCellFull!2915 (v!5375 V!8337)) (EmptyCell!2915) )
))
(declare-datatypes ((array!12361 0))(
  ( (array!12362 (arr!5858 (Array (_ BitVec 32) ValueCell!2915)) (size!6205 (_ BitVec 32))) )
))
(declare-datatypes ((array!12363 0))(
  ( (array!12364 (arr!5859 (Array (_ BitVec 32) (_ BitVec 64))) (size!6206 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3730 0))(
  ( (LongMapFixedSize!3731 (defaultEntry!4670 Int) (mask!10896 (_ BitVec 32)) (extraKeys!4407 (_ BitVec 32)) (zeroValue!4511 V!8337) (minValue!4511 V!8337) (_size!1914 (_ BitVec 32)) (_keys!6820 array!12363) (_values!4653 array!12361) (_vacant!1914 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3730)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!212 (array!12363 array!12361 (_ BitVec 32) (_ BitVec 32) V!8337 V!8337 (_ BitVec 64) (_ BitVec 32) Int) Unit!7825)

(assert (=> b!252820 (= lt!126734 (lemmaArrayContainsKeyThenInListMap!212 (_keys!6820 thiss!1504) (_values!4653 thiss!1504) (mask!10896 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4670 thiss!1504)))))

(assert (=> b!252820 false))

(declare-fun b!252821 () Bool)

(declare-fun call!23832 () Bool)

(assert (=> b!252821 (= e!163944 (not call!23832))))

(declare-fun b!252823 () Bool)

(declare-fun e!163943 () Unit!7825)

(declare-fun Unit!7828 () Unit!7825)

(assert (=> b!252823 (= e!163943 Unit!7828)))

(declare-fun lt!126736 () Unit!7825)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!407 (array!12363 array!12361 (_ BitVec 32) (_ BitVec 32) V!8337 V!8337 (_ BitVec 64) Int) Unit!7825)

(assert (=> b!252823 (= lt!126736 (lemmaInListMapThenSeekEntryOrOpenFindsIt!407 (_keys!6820 thiss!1504) (_values!4653 thiss!1504) (mask!10896 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) key!932 (defaultEntry!4670 thiss!1504)))))

(assert (=> b!252823 false))

(declare-fun b!252824 () Bool)

(declare-fun res!123749 () Bool)

(declare-fun e!163934 () Bool)

(assert (=> b!252824 (=> res!123749 e!163934)))

(assert (=> b!252824 (= res!123749 (or (not (= (size!6205 (_values!4653 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10896 thiss!1504)))) (not (= (size!6206 (_keys!6820 thiss!1504)) (size!6205 (_values!4653 thiss!1504)))) (bvslt (mask!10896 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4407 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4407 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!252825 () Bool)

(declare-fun e!163941 () Bool)

(declare-fun e!163940 () Bool)

(assert (=> b!252825 (= e!163941 e!163940)))

(declare-fun res!123747 () Bool)

(assert (=> b!252825 (= res!123747 call!23833)))

(assert (=> b!252825 (=> (not res!123747) (not e!163940))))

(declare-fun b!252826 () Bool)

(declare-fun e!163948 () Bool)

(declare-fun e!163937 () Bool)

(assert (=> b!252826 (= e!163948 e!163937)))

(declare-fun res!123751 () Bool)

(assert (=> b!252826 (=> (not res!123751) (not e!163937))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!252826 (= res!123751 (inRange!0 index!297 (mask!10896 thiss!1504)))))

(declare-fun lt!126735 () Unit!7825)

(assert (=> b!252826 (= lt!126735 e!163943)))

(declare-fun c!42618 () Bool)

(declare-datatypes ((tuple2!4866 0))(
  ( (tuple2!4867 (_1!2444 (_ BitVec 64)) (_2!2444 V!8337)) )
))
(declare-datatypes ((List!3746 0))(
  ( (Nil!3743) (Cons!3742 (h!4404 tuple2!4866) (t!8789 List!3746)) )
))
(declare-datatypes ((ListLongMap!3779 0))(
  ( (ListLongMap!3780 (toList!1905 List!3746)) )
))
(declare-fun contains!1833 (ListLongMap!3779 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1433 (array!12363 array!12361 (_ BitVec 32) (_ BitVec 32) V!8337 V!8337 (_ BitVec 32) Int) ListLongMap!3779)

(assert (=> b!252826 (= c!42618 (contains!1833 (getCurrentListMap!1433 (_keys!6820 thiss!1504) (_values!4653 thiss!1504) (mask!10896 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4670 thiss!1504)) key!932))))

(declare-fun b!252827 () Bool)

(declare-fun lt!126737 () Unit!7825)

(assert (=> b!252827 (= e!163943 lt!126737)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!411 (array!12363 array!12361 (_ BitVec 32) (_ BitVec 32) V!8337 V!8337 (_ BitVec 64) Int) Unit!7825)

(assert (=> b!252827 (= lt!126737 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!411 (_keys!6820 thiss!1504) (_values!4653 thiss!1504) (mask!10896 thiss!1504) (extraKeys!4407 thiss!1504) (zeroValue!4511 thiss!1504) (minValue!4511 thiss!1504) key!932 (defaultEntry!4670 thiss!1504)))))

(declare-fun c!42616 () Bool)

(declare-datatypes ((SeekEntryResult!1135 0))(
  ( (MissingZero!1135 (index!6710 (_ BitVec 32))) (Found!1135 (index!6711 (_ BitVec 32))) (Intermediate!1135 (undefined!1947 Bool) (index!6712 (_ BitVec 32)) (x!24791 (_ BitVec 32))) (Undefined!1135) (MissingVacant!1135 (index!6713 (_ BitVec 32))) )
))
(declare-fun lt!126732 () SeekEntryResult!1135)

(assert (=> b!252827 (= c!42616 (is-MissingZero!1135 lt!126732))))

(assert (=> b!252827 e!163946))

(declare-fun b!252828 () Bool)

(assert (=> b!252828 (= e!163937 (not e!163934))))

(declare-fun res!123748 () Bool)

(assert (=> b!252828 (=> res!123748 e!163934)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!252828 (= res!123748 (not (validMask!0 (mask!10896 thiss!1504))))))

(declare-fun lt!126738 () array!12363)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12363 (_ BitVec 32)) Bool)

(assert (=> b!252828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!126738 (mask!10896 thiss!1504))))

(declare-fun lt!126740 () Unit!7825)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12363 (_ BitVec 32) (_ BitVec 32)) Unit!7825)

(assert (=> b!252828 (= lt!126740 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6820 thiss!1504) index!297 (mask!10896 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12363 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!252828 (= (arrayCountValidKeys!0 lt!126738 #b00000000000000000000000000000000 (size!6206 (_keys!6820 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6820 thiss!1504) #b00000000000000000000000000000000 (size!6206 (_keys!6820 thiss!1504)))))))

(declare-fun lt!126733 () Unit!7825)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12363 (_ BitVec 32) (_ BitVec 64)) Unit!7825)

(assert (=> b!252828 (= lt!126733 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6820 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3747 0))(
  ( (Nil!3744) (Cons!3743 (h!4405 (_ BitVec 64)) (t!8790 List!3747)) )
))
(declare-fun arrayNoDuplicates!0 (array!12363 (_ BitVec 32) List!3747) Bool)

(assert (=> b!252828 (arrayNoDuplicates!0 lt!126738 #b00000000000000000000000000000000 Nil!3744)))

(assert (=> b!252828 (= lt!126738 (array!12364 (store (arr!5859 (_keys!6820 thiss!1504)) index!297 key!932) (size!6206 (_keys!6820 thiss!1504))))))

(declare-fun lt!126739 () Unit!7825)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12363 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3747) Unit!7825)

(assert (=> b!252828 (= lt!126739 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6820 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3744))))

(declare-fun lt!126741 () Unit!7825)

(assert (=> b!252828 (= lt!126741 e!163942)))

(declare-fun c!42615 () Bool)

(declare-fun arrayContainsKey!0 (array!12363 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!252828 (= c!42615 (arrayContainsKey!0 (_keys!6820 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!252829 () Bool)

(declare-fun e!163938 () Bool)

(assert (=> b!252829 (= e!163938 e!163948)))

(declare-fun res!123753 () Bool)

(assert (=> b!252829 (=> (not res!123753) (not e!163948))))

(assert (=> b!252829 (= res!123753 (or (= lt!126732 (MissingZero!1135 index!297)) (= lt!126732 (MissingVacant!1135 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12363 (_ BitVec 32)) SeekEntryResult!1135)

(assert (=> b!252829 (= lt!126732 (seekEntryOrOpen!0 key!932 (_keys!6820 thiss!1504) (mask!10896 thiss!1504)))))

(declare-fun b!252830 () Bool)

(declare-fun res!123758 () Bool)

(assert (=> b!252830 (=> res!123758 e!163934)))

(assert (=> b!252830 (= res!123758 (not (arrayNoDuplicates!0 (_keys!6820 thiss!1504) #b00000000000000000000000000000000 Nil!3744)))))

(declare-fun b!252831 () Bool)

(declare-fun e!163945 () Bool)

(declare-fun tp_is_empty!6517 () Bool)

(assert (=> b!252831 (= e!163945 tp_is_empty!6517)))

(declare-fun mapNonEmpty!11085 () Bool)

(declare-fun mapRes!11085 () Bool)

(declare-fun tp!23246 () Bool)

(assert (=> mapNonEmpty!11085 (= mapRes!11085 (and tp!23246 e!163945))))

(declare-fun mapKey!11085 () (_ BitVec 32))

(declare-fun mapValue!11085 () ValueCell!2915)

(declare-fun mapRest!11085 () (Array (_ BitVec 32) ValueCell!2915))

(assert (=> mapNonEmpty!11085 (= (arr!5858 (_values!4653 thiss!1504)) (store mapRest!11085 mapKey!11085 mapValue!11085))))

(declare-fun bm!23829 () Bool)

(assert (=> bm!23829 (= call!23832 (arrayContainsKey!0 (_keys!6820 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!252832 () Bool)

(assert (=> b!252832 (= e!163940 (not call!23832))))

(declare-fun e!163935 () Bool)

(declare-fun e!163947 () Bool)

(declare-fun array_inv!3873 (array!12363) Bool)

(declare-fun array_inv!3874 (array!12361) Bool)

(assert (=> b!252833 (= e!163935 (and tp!23247 tp_is_empty!6517 (array_inv!3873 (_keys!6820 thiss!1504)) (array_inv!3874 (_values!4653 thiss!1504)) e!163947))))

(declare-fun bm!23830 () Bool)

(assert (=> bm!23830 (= call!23833 (inRange!0 (ite c!42616 (index!6710 lt!126732) (index!6713 lt!126732)) (mask!10896 thiss!1504)))))

(declare-fun b!252822 () Bool)

(declare-fun Unit!7829 () Unit!7825)

(assert (=> b!252822 (= e!163942 Unit!7829)))

(declare-fun res!123755 () Bool)

(assert (=> start!24180 (=> (not res!123755) (not e!163938))))

(declare-fun valid!1460 (LongMapFixedSize!3730) Bool)

(assert (=> start!24180 (= res!123755 (valid!1460 thiss!1504))))

(assert (=> start!24180 e!163938))

(assert (=> start!24180 e!163935))

(assert (=> start!24180 true))

(declare-fun b!252834 () Bool)

(declare-fun res!123750 () Bool)

(assert (=> b!252834 (=> (not res!123750) (not e!163938))))

(assert (=> b!252834 (= res!123750 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!252835 () Bool)

(assert (=> b!252835 (= e!163934 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6206 (_keys!6820 thiss!1504)))))))

(declare-fun b!252836 () Bool)

(declare-fun res!123756 () Bool)

(assert (=> b!252836 (=> res!123756 e!163934)))

(assert (=> b!252836 (= res!123756 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6820 thiss!1504) (mask!10896 thiss!1504))))))

(declare-fun b!252837 () Bool)

(declare-fun res!123754 () Bool)

(assert (=> b!252837 (= res!123754 (= (select (arr!5859 (_keys!6820 thiss!1504)) (index!6713 lt!126732)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!252837 (=> (not res!123754) (not e!163940))))

(declare-fun b!252838 () Bool)

(declare-fun res!123752 () Bool)

(assert (=> b!252838 (=> (not res!123752) (not e!163944))))

(assert (=> b!252838 (= res!123752 (= (select (arr!5859 (_keys!6820 thiss!1504)) (index!6710 lt!126732)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!252839 () Bool)

(declare-fun c!42617 () Bool)

(assert (=> b!252839 (= c!42617 (is-MissingVacant!1135 lt!126732))))

(assert (=> b!252839 (= e!163946 e!163941)))

(declare-fun mapIsEmpty!11085 () Bool)

(assert (=> mapIsEmpty!11085 mapRes!11085))

(declare-fun b!252840 () Bool)

(assert (=> b!252840 (= e!163941 (is-Undefined!1135 lt!126732))))

(declare-fun b!252841 () Bool)

(declare-fun e!163939 () Bool)

(assert (=> b!252841 (= e!163939 tp_is_empty!6517)))

(declare-fun b!252842 () Bool)

(assert (=> b!252842 (= e!163947 (and e!163939 mapRes!11085))))

(declare-fun condMapEmpty!11085 () Bool)

(declare-fun mapDefault!11085 () ValueCell!2915)

