; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21964 () Bool)

(assert start!21964)

(declare-fun b!224848 () Bool)

(declare-fun b_free!6031 () Bool)

(declare-fun b_next!6031 () Bool)

(assert (=> b!224848 (= b_free!6031 (not b_next!6031))))

(declare-fun tp!21235 () Bool)

(declare-fun b_and!12929 () Bool)

(assert (=> b!224848 (= tp!21235 b_and!12929)))

(declare-fun b!224827 () Bool)

(declare-fun e!145961 () Bool)

(declare-fun tp_is_empty!5893 () Bool)

(assert (=> b!224827 (= e!145961 tp_is_empty!5893)))

(declare-fun b!224828 () Bool)

(declare-fun e!145962 () Bool)

(declare-fun e!145957 () Bool)

(assert (=> b!224828 (= e!145962 e!145957)))

(declare-fun res!110638 () Bool)

(assert (=> b!224828 (=> (not res!110638) (not e!145957))))

(declare-datatypes ((SeekEntryResult!861 0))(
  ( (MissingZero!861 (index!5614 (_ BitVec 32))) (Found!861 (index!5615 (_ BitVec 32))) (Intermediate!861 (undefined!1673 Bool) (index!5616 (_ BitVec 32)) (x!23153 (_ BitVec 32))) (Undefined!861) (MissingVacant!861 (index!5617 (_ BitVec 32))) )
))
(declare-fun lt!113276 () SeekEntryResult!861)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!224828 (= res!110638 (or (= lt!113276 (MissingZero!861 index!297)) (= lt!113276 (MissingVacant!861 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7505 0))(
  ( (V!7506 (val!2991 Int)) )
))
(declare-datatypes ((ValueCell!2603 0))(
  ( (ValueCellFull!2603 (v!5011 V!7505)) (EmptyCell!2603) )
))
(declare-datatypes ((array!11029 0))(
  ( (array!11030 (arr!5234 (Array (_ BitVec 32) ValueCell!2603)) (size!5567 (_ BitVec 32))) )
))
(declare-datatypes ((array!11031 0))(
  ( (array!11032 (arr!5235 (Array (_ BitVec 32) (_ BitVec 64))) (size!5568 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3106 0))(
  ( (LongMapFixedSize!3107 (defaultEntry!4212 Int) (mask!10050 (_ BitVec 32)) (extraKeys!3949 (_ BitVec 32)) (zeroValue!4053 V!7505) (minValue!4053 V!7505) (_size!1602 (_ BitVec 32)) (_keys!6266 array!11031) (_values!4195 array!11029) (_vacant!1602 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3106)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11031 (_ BitVec 32)) SeekEntryResult!861)

(assert (=> b!224828 (= lt!113276 (seekEntryOrOpen!0 key!932 (_keys!6266 thiss!1504) (mask!10050 thiss!1504)))))

(declare-fun b!224829 () Bool)

(declare-datatypes ((Unit!6765 0))(
  ( (Unit!6766) )
))
(declare-fun e!145953 () Unit!6765)

(declare-fun Unit!6767 () Unit!6765)

(assert (=> b!224829 (= e!145953 Unit!6767)))

(declare-fun lt!113282 () Unit!6765)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!242 (array!11031 array!11029 (_ BitVec 32) (_ BitVec 32) V!7505 V!7505 (_ BitVec 64) Int) Unit!6765)

(assert (=> b!224829 (= lt!113282 (lemmaInListMapThenSeekEntryOrOpenFindsIt!242 (_keys!6266 thiss!1504) (_values!4195 thiss!1504) (mask!10050 thiss!1504) (extraKeys!3949 thiss!1504) (zeroValue!4053 thiss!1504) (minValue!4053 thiss!1504) key!932 (defaultEntry!4212 thiss!1504)))))

(assert (=> b!224829 false))

(declare-fun b!224830 () Bool)

(declare-fun e!145955 () Bool)

(declare-fun e!145963 () Bool)

(assert (=> b!224830 (= e!145955 (not e!145963))))

(declare-fun res!110635 () Bool)

(assert (=> b!224830 (=> res!110635 e!145963)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!224830 (= res!110635 (not (validMask!0 (mask!10050 thiss!1504))))))

(declare-fun lt!113278 () array!11031)

(declare-fun arrayCountValidKeys!0 (array!11031 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!224830 (= (arrayCountValidKeys!0 lt!113278 #b00000000000000000000000000000000 (size!5568 (_keys!6266 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6266 thiss!1504) #b00000000000000000000000000000000 (size!5568 (_keys!6266 thiss!1504)))))))

(declare-fun lt!113281 () Unit!6765)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11031 (_ BitVec 32) (_ BitVec 64)) Unit!6765)

(assert (=> b!224830 (= lt!113281 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6266 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3342 0))(
  ( (Nil!3339) (Cons!3338 (h!3986 (_ BitVec 64)) (t!8301 List!3342)) )
))
(declare-fun arrayNoDuplicates!0 (array!11031 (_ BitVec 32) List!3342) Bool)

(assert (=> b!224830 (arrayNoDuplicates!0 lt!113278 #b00000000000000000000000000000000 Nil!3339)))

(assert (=> b!224830 (= lt!113278 (array!11032 (store (arr!5235 (_keys!6266 thiss!1504)) index!297 key!932) (size!5568 (_keys!6266 thiss!1504))))))

(declare-fun lt!113277 () Unit!6765)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11031 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3342) Unit!6765)

(assert (=> b!224830 (= lt!113277 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6266 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3339))))

(declare-fun lt!113285 () Unit!6765)

(declare-fun e!145954 () Unit!6765)

(assert (=> b!224830 (= lt!113285 e!145954)))

(declare-fun c!37284 () Bool)

(declare-fun lt!113279 () Bool)

(assert (=> b!224830 (= c!37284 lt!113279)))

(declare-fun arrayContainsKey!0 (array!11031 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224830 (= lt!113279 (arrayContainsKey!0 (_keys!6266 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!224831 () Bool)

(declare-fun e!145959 () Bool)

(declare-fun e!145958 () Bool)

(assert (=> b!224831 (= e!145959 e!145958)))

(declare-fun res!110633 () Bool)

(declare-fun call!20927 () Bool)

(assert (=> b!224831 (= res!110633 call!20927)))

(assert (=> b!224831 (=> (not res!110633) (not e!145958))))

(declare-fun b!224832 () Bool)

(declare-fun Unit!6768 () Unit!6765)

(assert (=> b!224832 (= e!145954 Unit!6768)))

(declare-fun lt!113284 () Unit!6765)

(declare-fun lemmaArrayContainsKeyThenInListMap!81 (array!11031 array!11029 (_ BitVec 32) (_ BitVec 32) V!7505 V!7505 (_ BitVec 64) (_ BitVec 32) Int) Unit!6765)

(assert (=> b!224832 (= lt!113284 (lemmaArrayContainsKeyThenInListMap!81 (_keys!6266 thiss!1504) (_values!4195 thiss!1504) (mask!10050 thiss!1504) (extraKeys!3949 thiss!1504) (zeroValue!4053 thiss!1504) (minValue!4053 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4212 thiss!1504)))))

(assert (=> b!224832 false))

(declare-fun b!224833 () Bool)

(declare-fun res!110637 () Bool)

(assert (=> b!224833 (=> res!110637 e!145963)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11031 (_ BitVec 32)) Bool)

(assert (=> b!224833 (= res!110637 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6266 thiss!1504) (mask!10050 thiss!1504))))))

(declare-fun b!224834 () Bool)

(declare-fun res!110632 () Bool)

(declare-fun e!145956 () Bool)

(assert (=> b!224834 (=> (not res!110632) (not e!145956))))

(assert (=> b!224834 (= res!110632 call!20927)))

(declare-fun e!145960 () Bool)

(assert (=> b!224834 (= e!145960 e!145956)))

(declare-fun res!110630 () Bool)

(assert (=> start!21964 (=> (not res!110630) (not e!145962))))

(declare-fun valid!1252 (LongMapFixedSize!3106) Bool)

(assert (=> start!21964 (= res!110630 (valid!1252 thiss!1504))))

(assert (=> start!21964 e!145962))

(declare-fun e!145950 () Bool)

(assert (=> start!21964 e!145950))

(assert (=> start!21964 true))

(declare-fun mapIsEmpty!10009 () Bool)

(declare-fun mapRes!10009 () Bool)

(assert (=> mapIsEmpty!10009 mapRes!10009))

(declare-fun b!224835 () Bool)

(declare-fun res!110641 () Bool)

(assert (=> b!224835 (=> res!110641 e!145963)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!224835 (= res!110641 (not (validKeyInArray!0 key!932)))))

(declare-fun b!224836 () Bool)

(assert (=> b!224836 (= e!145959 (is-Undefined!861 lt!113276))))

(declare-fun b!224837 () Bool)

(declare-fun c!37281 () Bool)

(assert (=> b!224837 (= c!37281 (is-MissingVacant!861 lt!113276))))

(assert (=> b!224837 (= e!145960 e!145959)))

(declare-fun b!224838 () Bool)

(declare-fun res!110629 () Bool)

(assert (=> b!224838 (=> res!110629 e!145963)))

(assert (=> b!224838 (= res!110629 lt!113279)))

(declare-fun b!224839 () Bool)

(assert (=> b!224839 (= e!145957 e!145955)))

(declare-fun res!110639 () Bool)

(assert (=> b!224839 (=> (not res!110639) (not e!145955))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!224839 (= res!110639 (inRange!0 index!297 (mask!10050 thiss!1504)))))

(declare-fun lt!113280 () Unit!6765)

(assert (=> b!224839 (= lt!113280 e!145953)))

(declare-fun c!37282 () Bool)

(declare-datatypes ((tuple2!4430 0))(
  ( (tuple2!4431 (_1!2226 (_ BitVec 64)) (_2!2226 V!7505)) )
))
(declare-datatypes ((List!3343 0))(
  ( (Nil!3340) (Cons!3339 (h!3987 tuple2!4430) (t!8302 List!3343)) )
))
(declare-datatypes ((ListLongMap!3343 0))(
  ( (ListLongMap!3344 (toList!1687 List!3343)) )
))
(declare-fun contains!1561 (ListLongMap!3343 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1215 (array!11031 array!11029 (_ BitVec 32) (_ BitVec 32) V!7505 V!7505 (_ BitVec 32) Int) ListLongMap!3343)

(assert (=> b!224839 (= c!37282 (contains!1561 (getCurrentListMap!1215 (_keys!6266 thiss!1504) (_values!4195 thiss!1504) (mask!10050 thiss!1504) (extraKeys!3949 thiss!1504) (zeroValue!4053 thiss!1504) (minValue!4053 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4212 thiss!1504)) key!932))))

(declare-fun b!224840 () Bool)

(declare-fun call!20928 () Bool)

(assert (=> b!224840 (= e!145956 (not call!20928))))

(declare-fun b!224841 () Bool)

(declare-fun res!110631 () Bool)

(assert (=> b!224841 (=> (not res!110631) (not e!145962))))

(assert (=> b!224841 (= res!110631 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!224842 () Bool)

(declare-fun res!110636 () Bool)

(assert (=> b!224842 (=> res!110636 e!145963)))

(assert (=> b!224842 (= res!110636 (or (not (= (size!5568 (_keys!6266 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10050 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!5568 (_keys!6266 thiss!1504)))))))

(declare-fun b!224843 () Bool)

(assert (=> b!224843 (= e!145958 (not call!20928))))

(declare-fun b!224844 () Bool)

(declare-fun e!145964 () Bool)

(assert (=> b!224844 (= e!145964 tp_is_empty!5893)))

(declare-fun b!224845 () Bool)

(declare-fun res!110640 () Bool)

(assert (=> b!224845 (=> (not res!110640) (not e!145956))))

(assert (=> b!224845 (= res!110640 (= (select (arr!5235 (_keys!6266 thiss!1504)) (index!5614 lt!113276)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!10009 () Bool)

(declare-fun tp!21234 () Bool)

(assert (=> mapNonEmpty!10009 (= mapRes!10009 (and tp!21234 e!145964))))

(declare-fun mapKey!10009 () (_ BitVec 32))

(declare-fun mapValue!10009 () ValueCell!2603)

(declare-fun mapRest!10009 () (Array (_ BitVec 32) ValueCell!2603))

(assert (=> mapNonEmpty!10009 (= (arr!5234 (_values!4195 thiss!1504)) (store mapRest!10009 mapKey!10009 mapValue!10009))))

(declare-fun b!224846 () Bool)

(declare-fun res!110634 () Bool)

(assert (=> b!224846 (= res!110634 (= (select (arr!5235 (_keys!6266 thiss!1504)) (index!5617 lt!113276)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!224846 (=> (not res!110634) (not e!145958))))

(declare-fun b!224847 () Bool)

(declare-fun lt!113283 () Unit!6765)

(assert (=> b!224847 (= e!145953 lt!113283)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!253 (array!11031 array!11029 (_ BitVec 32) (_ BitVec 32) V!7505 V!7505 (_ BitVec 64) Int) Unit!6765)

(assert (=> b!224847 (= lt!113283 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!253 (_keys!6266 thiss!1504) (_values!4195 thiss!1504) (mask!10050 thiss!1504) (extraKeys!3949 thiss!1504) (zeroValue!4053 thiss!1504) (minValue!4053 thiss!1504) key!932 (defaultEntry!4212 thiss!1504)))))

(declare-fun c!37283 () Bool)

(assert (=> b!224847 (= c!37283 (is-MissingZero!861 lt!113276))))

(assert (=> b!224847 e!145960))

(declare-fun bm!20924 () Bool)

(assert (=> bm!20924 (= call!20927 (inRange!0 (ite c!37283 (index!5614 lt!113276) (index!5617 lt!113276)) (mask!10050 thiss!1504)))))

(declare-fun e!145952 () Bool)

(declare-fun array_inv!3463 (array!11031) Bool)

(declare-fun array_inv!3464 (array!11029) Bool)

(assert (=> b!224848 (= e!145950 (and tp!21235 tp_is_empty!5893 (array_inv!3463 (_keys!6266 thiss!1504)) (array_inv!3464 (_values!4195 thiss!1504)) e!145952))))

(declare-fun b!224849 () Bool)

(declare-fun Unit!6769 () Unit!6765)

(assert (=> b!224849 (= e!145954 Unit!6769)))

(declare-fun b!224850 () Bool)

(assert (=> b!224850 (= e!145952 (and e!145961 mapRes!10009))))

(declare-fun condMapEmpty!10009 () Bool)

(declare-fun mapDefault!10009 () ValueCell!2603)

