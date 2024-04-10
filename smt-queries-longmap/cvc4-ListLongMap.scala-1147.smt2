; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23924 () Bool)

(assert start!23924)

(declare-fun b!250843 () Bool)

(declare-fun b_free!6635 () Bool)

(declare-fun b_next!6635 () Bool)

(assert (=> b!250843 (= b_free!6635 (not b_next!6635))))

(declare-fun tp!23172 () Bool)

(declare-fun b_and!13657 () Bool)

(assert (=> b!250843 (= tp!23172 b_and!13657)))

(declare-fun res!122837 () Bool)

(declare-fun e!162698 () Bool)

(assert (=> start!23924 (=> (not res!122837) (not e!162698))))

(declare-datatypes ((V!8309 0))(
  ( (V!8310 (val!3293 Int)) )
))
(declare-datatypes ((ValueCell!2905 0))(
  ( (ValueCellFull!2905 (v!5359 V!8309)) (EmptyCell!2905) )
))
(declare-datatypes ((array!12313 0))(
  ( (array!12314 (arr!5838 (Array (_ BitVec 32) ValueCell!2905)) (size!6183 (_ BitVec 32))) )
))
(declare-datatypes ((array!12315 0))(
  ( (array!12316 (arr!5839 (Array (_ BitVec 32) (_ BitVec 64))) (size!6184 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3710 0))(
  ( (LongMapFixedSize!3711 (defaultEntry!4636 Int) (mask!10826 (_ BitVec 32)) (extraKeys!4373 (_ BitVec 32)) (zeroValue!4477 V!8309) (minValue!4477 V!8309) (_size!1904 (_ BitVec 32)) (_keys!6774 array!12315) (_values!4619 array!12313) (_vacant!1904 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3710)

(declare-fun valid!1450 (LongMapFixedSize!3710) Bool)

(assert (=> start!23924 (= res!122837 (valid!1450 thiss!1504))))

(assert (=> start!23924 e!162698))

(declare-fun e!162697 () Bool)

(assert (=> start!23924 e!162697))

(assert (=> start!23924 true))

(declare-fun b!250835 () Bool)

(declare-fun res!122835 () Bool)

(assert (=> b!250835 (=> (not res!122835) (not e!162698))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!250835 (= res!122835 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!250836 () Bool)

(declare-fun e!162690 () Bool)

(declare-fun tp_is_empty!6497 () Bool)

(assert (=> b!250836 (= e!162690 tp_is_empty!6497)))

(declare-fun b!250837 () Bool)

(declare-fun e!162691 () Bool)

(declare-fun e!162700 () Bool)

(assert (=> b!250837 (= e!162691 (not e!162700))))

(declare-fun res!122839 () Bool)

(assert (=> b!250837 (=> res!122839 e!162700)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!250837 (= res!122839 (not (validMask!0 (mask!10826 thiss!1504))))))

(declare-fun lt!125684 () array!12315)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12315 (_ BitVec 32)) Bool)

(assert (=> b!250837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!125684 (mask!10826 thiss!1504))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((Unit!7765 0))(
  ( (Unit!7766) )
))
(declare-fun lt!125688 () Unit!7765)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12315 (_ BitVec 32) (_ BitVec 32)) Unit!7765)

(assert (=> b!250837 (= lt!125688 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6774 thiss!1504) index!297 (mask!10826 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12315 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!250837 (= (arrayCountValidKeys!0 lt!125684 #b00000000000000000000000000000000 (size!6184 (_keys!6774 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6774 thiss!1504) #b00000000000000000000000000000000 (size!6184 (_keys!6774 thiss!1504)))))))

(declare-fun lt!125682 () Unit!7765)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12315 (_ BitVec 32) (_ BitVec 64)) Unit!7765)

(assert (=> b!250837 (= lt!125682 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6774 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3728 0))(
  ( (Nil!3725) (Cons!3724 (h!4384 (_ BitVec 64)) (t!8763 List!3728)) )
))
(declare-fun arrayNoDuplicates!0 (array!12315 (_ BitVec 32) List!3728) Bool)

(assert (=> b!250837 (arrayNoDuplicates!0 lt!125684 #b00000000000000000000000000000000 Nil!3725)))

(assert (=> b!250837 (= lt!125684 (array!12316 (store (arr!5839 (_keys!6774 thiss!1504)) index!297 key!932) (size!6184 (_keys!6774 thiss!1504))))))

(declare-fun lt!125683 () Unit!7765)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12315 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3728) Unit!7765)

(assert (=> b!250837 (= lt!125683 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6774 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3725))))

(declare-fun lt!125685 () Unit!7765)

(declare-fun e!162696 () Unit!7765)

(assert (=> b!250837 (= lt!125685 e!162696)))

(declare-fun c!42166 () Bool)

(declare-fun arrayContainsKey!0 (array!12315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!250837 (= c!42166 (arrayContainsKey!0 (_keys!6774 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!250838 () Bool)

(declare-fun e!162686 () Unit!7765)

(declare-fun lt!125686 () Unit!7765)

(assert (=> b!250838 (= e!162686 lt!125686)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!403 (array!12315 array!12313 (_ BitVec 32) (_ BitVec 32) V!8309 V!8309 (_ BitVec 64) Int) Unit!7765)

(assert (=> b!250838 (= lt!125686 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!403 (_keys!6774 thiss!1504) (_values!4619 thiss!1504) (mask!10826 thiss!1504) (extraKeys!4373 thiss!1504) (zeroValue!4477 thiss!1504) (minValue!4477 thiss!1504) key!932 (defaultEntry!4636 thiss!1504)))))

(declare-fun c!42167 () Bool)

(declare-datatypes ((SeekEntryResult!1125 0))(
  ( (MissingZero!1125 (index!6670 (_ BitVec 32))) (Found!1125 (index!6671 (_ BitVec 32))) (Intermediate!1125 (undefined!1937 Bool) (index!6672 (_ BitVec 32)) (x!24693 (_ BitVec 32))) (Undefined!1125) (MissingVacant!1125 (index!6673 (_ BitVec 32))) )
))
(declare-fun lt!125687 () SeekEntryResult!1125)

(assert (=> b!250838 (= c!42167 (is-MissingZero!1125 lt!125687))))

(declare-fun e!162695 () Bool)

(assert (=> b!250838 e!162695))

(declare-fun b!250839 () Bool)

(assert (=> b!250839 (= e!162700 (or (not (= (size!6183 (_values!4619 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10826 thiss!1504)))) (not (= (size!6184 (_keys!6774 thiss!1504)) (size!6183 (_values!4619 thiss!1504)))) (bvslt (mask!10826 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4373 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun bm!23582 () Bool)

(declare-fun call!23586 () Bool)

(assert (=> bm!23582 (= call!23586 (arrayContainsKey!0 (_keys!6774 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!250840 () Bool)

(declare-fun e!162699 () Bool)

(assert (=> b!250840 (= e!162699 (not call!23586))))

(declare-fun b!250841 () Bool)

(declare-fun e!162689 () Bool)

(assert (=> b!250841 (= e!162689 e!162699)))

(declare-fun res!122838 () Bool)

(declare-fun call!23585 () Bool)

(assert (=> b!250841 (= res!122838 call!23585)))

(assert (=> b!250841 (=> (not res!122838) (not e!162699))))

(declare-fun b!250842 () Bool)

(declare-fun Unit!7767 () Unit!7765)

(assert (=> b!250842 (= e!162696 Unit!7767)))

(declare-fun e!162692 () Bool)

(declare-fun array_inv!3855 (array!12315) Bool)

(declare-fun array_inv!3856 (array!12313) Bool)

(assert (=> b!250843 (= e!162697 (and tp!23172 tp_is_empty!6497 (array_inv!3855 (_keys!6774 thiss!1504)) (array_inv!3856 (_values!4619 thiss!1504)) e!162692))))

(declare-fun b!250844 () Bool)

(declare-fun e!162694 () Bool)

(assert (=> b!250844 (= e!162694 e!162691)))

(declare-fun res!122833 () Bool)

(assert (=> b!250844 (=> (not res!122833) (not e!162691))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!250844 (= res!122833 (inRange!0 index!297 (mask!10826 thiss!1504)))))

(declare-fun lt!125680 () Unit!7765)

(assert (=> b!250844 (= lt!125680 e!162686)))

(declare-fun c!42164 () Bool)

(declare-datatypes ((tuple2!4848 0))(
  ( (tuple2!4849 (_1!2435 (_ BitVec 64)) (_2!2435 V!8309)) )
))
(declare-datatypes ((List!3729 0))(
  ( (Nil!3726) (Cons!3725 (h!4385 tuple2!4848) (t!8764 List!3729)) )
))
(declare-datatypes ((ListLongMap!3761 0))(
  ( (ListLongMap!3762 (toList!1896 List!3729)) )
))
(declare-fun contains!1818 (ListLongMap!3761 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1424 (array!12315 array!12313 (_ BitVec 32) (_ BitVec 32) V!8309 V!8309 (_ BitVec 32) Int) ListLongMap!3761)

(assert (=> b!250844 (= c!42164 (contains!1818 (getCurrentListMap!1424 (_keys!6774 thiss!1504) (_values!4619 thiss!1504) (mask!10826 thiss!1504) (extraKeys!4373 thiss!1504) (zeroValue!4477 thiss!1504) (minValue!4477 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4636 thiss!1504)) key!932))))

(declare-fun bm!23583 () Bool)

(assert (=> bm!23583 (= call!23585 (inRange!0 (ite c!42167 (index!6670 lt!125687) (index!6673 lt!125687)) (mask!10826 thiss!1504)))))

(declare-fun b!250845 () Bool)

(declare-fun Unit!7768 () Unit!7765)

(assert (=> b!250845 (= e!162686 Unit!7768)))

(declare-fun lt!125689 () Unit!7765)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!400 (array!12315 array!12313 (_ BitVec 32) (_ BitVec 32) V!8309 V!8309 (_ BitVec 64) Int) Unit!7765)

(assert (=> b!250845 (= lt!125689 (lemmaInListMapThenSeekEntryOrOpenFindsIt!400 (_keys!6774 thiss!1504) (_values!4619 thiss!1504) (mask!10826 thiss!1504) (extraKeys!4373 thiss!1504) (zeroValue!4477 thiss!1504) (minValue!4477 thiss!1504) key!932 (defaultEntry!4636 thiss!1504)))))

(assert (=> b!250845 false))

(declare-fun b!250846 () Bool)

(assert (=> b!250846 (= e!162698 e!162694)))

(declare-fun res!122832 () Bool)

(assert (=> b!250846 (=> (not res!122832) (not e!162694))))

(assert (=> b!250846 (= res!122832 (or (= lt!125687 (MissingZero!1125 index!297)) (= lt!125687 (MissingVacant!1125 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12315 (_ BitVec 32)) SeekEntryResult!1125)

(assert (=> b!250846 (= lt!125687 (seekEntryOrOpen!0 key!932 (_keys!6774 thiss!1504) (mask!10826 thiss!1504)))))

(declare-fun b!250847 () Bool)

(declare-fun Unit!7769 () Unit!7765)

(assert (=> b!250847 (= e!162696 Unit!7769)))

(declare-fun lt!125681 () Unit!7765)

(declare-fun lemmaArrayContainsKeyThenInListMap!203 (array!12315 array!12313 (_ BitVec 32) (_ BitVec 32) V!8309 V!8309 (_ BitVec 64) (_ BitVec 32) Int) Unit!7765)

(assert (=> b!250847 (= lt!125681 (lemmaArrayContainsKeyThenInListMap!203 (_keys!6774 thiss!1504) (_values!4619 thiss!1504) (mask!10826 thiss!1504) (extraKeys!4373 thiss!1504) (zeroValue!4477 thiss!1504) (minValue!4477 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4636 thiss!1504)))))

(assert (=> b!250847 false))

(declare-fun b!250848 () Bool)

(declare-fun mapRes!11041 () Bool)

(assert (=> b!250848 (= e!162692 (and e!162690 mapRes!11041))))

(declare-fun condMapEmpty!11041 () Bool)

(declare-fun mapDefault!11041 () ValueCell!2905)

