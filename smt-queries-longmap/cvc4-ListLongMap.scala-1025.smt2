; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21836 () Bool)

(assert start!21836)

(declare-fun b!219804 () Bool)

(declare-fun b_free!5903 () Bool)

(declare-fun b_next!5903 () Bool)

(assert (=> b!219804 (= b_free!5903 (not b_next!5903))))

(declare-fun tp!20850 () Bool)

(declare-fun b_and!12801 () Bool)

(assert (=> b!219804 (= tp!20850 b_and!12801)))

(declare-fun b!219796 () Bool)

(declare-fun e!142950 () Bool)

(declare-fun call!20543 () Bool)

(assert (=> b!219796 (= e!142950 (not call!20543))))

(declare-fun b!219797 () Bool)

(declare-fun res!107744 () Bool)

(declare-fun e!142948 () Bool)

(assert (=> b!219797 (=> (not res!107744) (not e!142948))))

(declare-datatypes ((V!7333 0))(
  ( (V!7334 (val!2927 Int)) )
))
(declare-datatypes ((ValueCell!2539 0))(
  ( (ValueCellFull!2539 (v!4947 V!7333)) (EmptyCell!2539) )
))
(declare-datatypes ((array!10773 0))(
  ( (array!10774 (arr!5106 (Array (_ BitVec 32) ValueCell!2539)) (size!5439 (_ BitVec 32))) )
))
(declare-datatypes ((array!10775 0))(
  ( (array!10776 (arr!5107 (Array (_ BitVec 32) (_ BitVec 64))) (size!5440 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2978 0))(
  ( (LongMapFixedSize!2979 (defaultEntry!4148 Int) (mask!9942 (_ BitVec 32)) (extraKeys!3885 (_ BitVec 32)) (zeroValue!3989 V!7333) (minValue!3989 V!7333) (_size!1538 (_ BitVec 32)) (_keys!6202 array!10775) (_values!4131 array!10773) (_vacant!1538 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2978)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10775 (_ BitVec 32)) Bool)

(assert (=> b!219797 (= res!107744 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6202 thiss!1504) (mask!9942 thiss!1504)))))

(declare-fun b!219798 () Bool)

(declare-fun res!107746 () Bool)

(declare-fun e!142951 () Bool)

(assert (=> b!219798 (=> (not res!107746) (not e!142951))))

(declare-datatypes ((SeekEntryResult!802 0))(
  ( (MissingZero!802 (index!5378 (_ BitVec 32))) (Found!802 (index!5379 (_ BitVec 32))) (Intermediate!802 (undefined!1614 Bool) (index!5380 (_ BitVec 32)) (x!22918 (_ BitVec 32))) (Undefined!802) (MissingVacant!802 (index!5381 (_ BitVec 32))) )
))
(declare-fun lt!112036 () SeekEntryResult!802)

(assert (=> b!219798 (= res!107746 (= (select (arr!5107 (_keys!6202 thiss!1504)) (index!5378 lt!112036)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!219799 () Bool)

(declare-fun res!107743 () Bool)

(assert (=> b!219799 (=> (not res!107743) (not e!142948))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!219799 (= res!107743 (validMask!0 (mask!9942 thiss!1504)))))

(declare-fun b!219800 () Bool)

(declare-fun res!107739 () Bool)

(assert (=> b!219800 (= res!107739 (= (select (arr!5107 (_keys!6202 thiss!1504)) (index!5381 lt!112036)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!219800 (=> (not res!107739) (not e!142950))))

(declare-fun b!219801 () Bool)

(declare-fun res!107749 () Bool)

(assert (=> b!219801 (=> (not res!107749) (not e!142951))))

(declare-fun call!20544 () Bool)

(assert (=> b!219801 (= res!107749 call!20544)))

(declare-fun e!142955 () Bool)

(assert (=> b!219801 (= e!142955 e!142951)))

(declare-fun mapNonEmpty!9817 () Bool)

(declare-fun mapRes!9817 () Bool)

(declare-fun tp!20851 () Bool)

(declare-fun e!142956 () Bool)

(assert (=> mapNonEmpty!9817 (= mapRes!9817 (and tp!20851 e!142956))))

(declare-fun mapValue!9817 () ValueCell!2539)

(declare-fun mapRest!9817 () (Array (_ BitVec 32) ValueCell!2539))

(declare-fun mapKey!9817 () (_ BitVec 32))

(assert (=> mapNonEmpty!9817 (= (arr!5106 (_values!4131 thiss!1504)) (store mapRest!9817 mapKey!9817 mapValue!9817))))

(declare-fun b!219802 () Bool)

(declare-datatypes ((Unit!6555 0))(
  ( (Unit!6556) )
))
(declare-fun e!142949 () Unit!6555)

(declare-fun Unit!6557 () Unit!6555)

(assert (=> b!219802 (= e!142949 Unit!6557)))

(declare-fun lt!112037 () Unit!6555)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!198 (array!10775 array!10773 (_ BitVec 32) (_ BitVec 32) V!7333 V!7333 (_ BitVec 64) Int) Unit!6555)

(assert (=> b!219802 (= lt!112037 (lemmaInListMapThenSeekEntryOrOpenFindsIt!198 (_keys!6202 thiss!1504) (_values!4131 thiss!1504) (mask!9942 thiss!1504) (extraKeys!3885 thiss!1504) (zeroValue!3989 thiss!1504) (minValue!3989 thiss!1504) key!932 (defaultEntry!4148 thiss!1504)))))

(assert (=> b!219802 false))

(declare-fun bm!20540 () Bool)

(declare-fun arrayContainsKey!0 (array!10775 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20540 (= call!20543 (arrayContainsKey!0 (_keys!6202 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!219803 () Bool)

(declare-fun res!107740 () Bool)

(assert (=> b!219803 (=> (not res!107740) (not e!142948))))

(assert (=> b!219803 (= res!107740 (arrayContainsKey!0 (_keys!6202 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun tp_is_empty!5765 () Bool)

(declare-fun e!142958 () Bool)

(declare-fun e!142957 () Bool)

(declare-fun array_inv!3381 (array!10775) Bool)

(declare-fun array_inv!3382 (array!10773) Bool)

(assert (=> b!219804 (= e!142958 (and tp!20850 tp_is_empty!5765 (array_inv!3381 (_keys!6202 thiss!1504)) (array_inv!3382 (_values!4131 thiss!1504)) e!142957))))

(declare-fun b!219805 () Bool)

(declare-fun res!107741 () Bool)

(declare-fun e!142954 () Bool)

(assert (=> b!219805 (=> (not res!107741) (not e!142954))))

(assert (=> b!219805 (= res!107741 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!107747 () Bool)

(assert (=> start!21836 (=> (not res!107747) (not e!142954))))

(declare-fun valid!1205 (LongMapFixedSize!2978) Bool)

(assert (=> start!21836 (= res!107747 (valid!1205 thiss!1504))))

(assert (=> start!21836 e!142954))

(assert (=> start!21836 e!142958))

(assert (=> start!21836 true))

(declare-fun b!219806 () Bool)

(assert (=> b!219806 (= e!142951 (not call!20543))))

(declare-fun c!36597 () Bool)

(declare-fun bm!20541 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20541 (= call!20544 (inRange!0 (ite c!36597 (index!5378 lt!112036) (index!5381 lt!112036)) (mask!9942 thiss!1504)))))

(declare-fun b!219807 () Bool)

(declare-fun e!142946 () Bool)

(assert (=> b!219807 (= e!142954 e!142946)))

(declare-fun res!107745 () Bool)

(assert (=> b!219807 (=> (not res!107745) (not e!142946))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!219807 (= res!107745 (or (= lt!112036 (MissingZero!802 index!297)) (= lt!112036 (MissingVacant!802 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10775 (_ BitVec 32)) SeekEntryResult!802)

(assert (=> b!219807 (= lt!112036 (seekEntryOrOpen!0 key!932 (_keys!6202 thiss!1504) (mask!9942 thiss!1504)))))

(declare-fun b!219808 () Bool)

(assert (=> b!219808 (= e!142956 tp_is_empty!5765)))

(declare-fun b!219809 () Bool)

(declare-fun e!142952 () Bool)

(assert (=> b!219809 (= e!142952 (is-Undefined!802 lt!112036))))

(declare-fun b!219810 () Bool)

(assert (=> b!219810 (= e!142952 e!142950)))

(declare-fun res!107738 () Bool)

(assert (=> b!219810 (= res!107738 call!20544)))

(assert (=> b!219810 (=> (not res!107738) (not e!142950))))

(declare-fun b!219811 () Bool)

(declare-fun lt!112035 () Unit!6555)

(assert (=> b!219811 (= e!142949 lt!112035)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!210 (array!10775 array!10773 (_ BitVec 32) (_ BitVec 32) V!7333 V!7333 (_ BitVec 64) Int) Unit!6555)

(assert (=> b!219811 (= lt!112035 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!210 (_keys!6202 thiss!1504) (_values!4131 thiss!1504) (mask!9942 thiss!1504) (extraKeys!3885 thiss!1504) (zeroValue!3989 thiss!1504) (minValue!3989 thiss!1504) key!932 (defaultEntry!4148 thiss!1504)))))

(assert (=> b!219811 (= c!36597 (is-MissingZero!802 lt!112036))))

(assert (=> b!219811 e!142955))

(declare-fun b!219812 () Bool)

(assert (=> b!219812 (= e!142948 false)))

(declare-fun lt!112033 () Bool)

(declare-datatypes ((List!3248 0))(
  ( (Nil!3245) (Cons!3244 (h!3892 (_ BitVec 64)) (t!8207 List!3248)) )
))
(declare-fun arrayNoDuplicates!0 (array!10775 (_ BitVec 32) List!3248) Bool)

(assert (=> b!219812 (= lt!112033 (arrayNoDuplicates!0 (_keys!6202 thiss!1504) #b00000000000000000000000000000000 Nil!3245))))

(declare-fun b!219813 () Bool)

(assert (=> b!219813 (= e!142946 e!142948)))

(declare-fun res!107742 () Bool)

(assert (=> b!219813 (=> (not res!107742) (not e!142948))))

(assert (=> b!219813 (= res!107742 (inRange!0 index!297 (mask!9942 thiss!1504)))))

(declare-fun lt!112034 () Unit!6555)

(assert (=> b!219813 (= lt!112034 e!142949)))

(declare-fun c!36595 () Bool)

(declare-datatypes ((tuple2!4346 0))(
  ( (tuple2!4347 (_1!2184 (_ BitVec 64)) (_2!2184 V!7333)) )
))
(declare-datatypes ((List!3249 0))(
  ( (Nil!3246) (Cons!3245 (h!3893 tuple2!4346) (t!8208 List!3249)) )
))
(declare-datatypes ((ListLongMap!3259 0))(
  ( (ListLongMap!3260 (toList!1645 List!3249)) )
))
(declare-fun contains!1488 (ListLongMap!3259 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1173 (array!10775 array!10773 (_ BitVec 32) (_ BitVec 32) V!7333 V!7333 (_ BitVec 32) Int) ListLongMap!3259)

(assert (=> b!219813 (= c!36595 (contains!1488 (getCurrentListMap!1173 (_keys!6202 thiss!1504) (_values!4131 thiss!1504) (mask!9942 thiss!1504) (extraKeys!3885 thiss!1504) (zeroValue!3989 thiss!1504) (minValue!3989 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4148 thiss!1504)) key!932))))

(declare-fun b!219814 () Bool)

(declare-fun e!142947 () Bool)

(assert (=> b!219814 (= e!142957 (and e!142947 mapRes!9817))))

(declare-fun condMapEmpty!9817 () Bool)

(declare-fun mapDefault!9817 () ValueCell!2539)

