; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21896 () Bool)

(assert start!21896)

(declare-fun b!221847 () Bool)

(declare-fun b_free!5963 () Bool)

(declare-fun b_next!5963 () Bool)

(assert (=> b!221847 (= b_free!5963 (not b_next!5963))))

(declare-fun tp!21031 () Bool)

(declare-fun b_and!12861 () Bool)

(assert (=> b!221847 (= tp!21031 b_and!12861)))

(declare-fun b!221824 () Bool)

(declare-fun e!144156 () Bool)

(declare-fun e!144166 () Bool)

(assert (=> b!221824 (= e!144156 e!144166)))

(declare-fun res!108863 () Bool)

(assert (=> b!221824 (=> (not res!108863) (not e!144166))))

(declare-datatypes ((SeekEntryResult!830 0))(
  ( (MissingZero!830 (index!5490 (_ BitVec 32))) (Found!830 (index!5491 (_ BitVec 32))) (Intermediate!830 (undefined!1642 Bool) (index!5492 (_ BitVec 32)) (x!23026 (_ BitVec 32))) (Undefined!830) (MissingVacant!830 (index!5493 (_ BitVec 32))) )
))
(declare-fun lt!112502 () SeekEntryResult!830)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!221824 (= res!108863 (or (= lt!112502 (MissingZero!830 index!297)) (= lt!112502 (MissingVacant!830 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7413 0))(
  ( (V!7414 (val!2957 Int)) )
))
(declare-datatypes ((ValueCell!2569 0))(
  ( (ValueCellFull!2569 (v!4977 V!7413)) (EmptyCell!2569) )
))
(declare-datatypes ((array!10893 0))(
  ( (array!10894 (arr!5166 (Array (_ BitVec 32) ValueCell!2569)) (size!5499 (_ BitVec 32))) )
))
(declare-datatypes ((array!10895 0))(
  ( (array!10896 (arr!5167 (Array (_ BitVec 32) (_ BitVec 64))) (size!5500 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3038 0))(
  ( (LongMapFixedSize!3039 (defaultEntry!4178 Int) (mask!9992 (_ BitVec 32)) (extraKeys!3915 (_ BitVec 32)) (zeroValue!4019 V!7413) (minValue!4019 V!7413) (_size!1568 (_ BitVec 32)) (_keys!6232 array!10895) (_values!4161 array!10893) (_vacant!1568 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3038)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10895 (_ BitVec 32)) SeekEntryResult!830)

(assert (=> b!221824 (= lt!112502 (seekEntryOrOpen!0 key!932 (_keys!6232 thiss!1504) (mask!9992 thiss!1504)))))

(declare-fun mapNonEmpty!9907 () Bool)

(declare-fun mapRes!9907 () Bool)

(declare-fun tp!21030 () Bool)

(declare-fun e!144171 () Bool)

(assert (=> mapNonEmpty!9907 (= mapRes!9907 (and tp!21030 e!144171))))

(declare-fun mapRest!9907 () (Array (_ BitVec 32) ValueCell!2569))

(declare-fun mapValue!9907 () ValueCell!2569)

(declare-fun mapKey!9907 () (_ BitVec 32))

(assert (=> mapNonEmpty!9907 (= (arr!5166 (_values!4161 thiss!1504)) (store mapRest!9907 mapKey!9907 mapValue!9907))))

(declare-fun b!221825 () Bool)

(declare-fun e!144173 () Bool)

(declare-fun e!144160 () Bool)

(assert (=> b!221825 (= e!144173 e!144160)))

(declare-fun res!108864 () Bool)

(assert (=> b!221825 (=> (not res!108864) (not e!144160))))

(assert (=> b!221825 (= res!108864 (and (bvslt (size!5500 (_keys!6232 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!5500 (_keys!6232 thiss!1504)))))))

(declare-datatypes ((Unit!6633 0))(
  ( (Unit!6634) )
))
(declare-fun lt!112499 () Unit!6633)

(declare-fun e!144167 () Unit!6633)

(assert (=> b!221825 (= lt!112499 e!144167)))

(declare-fun c!36874 () Bool)

(declare-fun arrayContainsKey!0 (array!10895 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!221825 (= c!36874 (arrayContainsKey!0 (_keys!6232 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!221826 () Bool)

(declare-fun Unit!6635 () Unit!6633)

(assert (=> b!221826 (= e!144167 Unit!6635)))

(declare-fun call!20723 () Bool)

(declare-fun bm!20720 () Bool)

(declare-fun c!36876 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20720 (= call!20723 (inRange!0 (ite c!36876 (index!5490 lt!112502) (index!5493 lt!112502)) (mask!9992 thiss!1504)))))

(declare-fun b!221827 () Bool)

(declare-fun Unit!6636 () Unit!6633)

(assert (=> b!221827 (= e!144167 Unit!6636)))

(declare-fun lt!112505 () Unit!6633)

(declare-fun lemmaArrayContainsKeyThenInListMap!54 (array!10895 array!10893 (_ BitVec 32) (_ BitVec 32) V!7413 V!7413 (_ BitVec 64) (_ BitVec 32) Int) Unit!6633)

(assert (=> b!221827 (= lt!112505 (lemmaArrayContainsKeyThenInListMap!54 (_keys!6232 thiss!1504) (_values!4161 thiss!1504) (mask!9992 thiss!1504) (extraKeys!3915 thiss!1504) (zeroValue!4019 thiss!1504) (minValue!4019 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4178 thiss!1504)))))

(assert (=> b!221827 false))

(declare-fun mapIsEmpty!9907 () Bool)

(assert (=> mapIsEmpty!9907 mapRes!9907))

(declare-fun b!221828 () Bool)

(declare-fun res!108854 () Bool)

(assert (=> b!221828 (=> (not res!108854) (not e!144160))))

(declare-datatypes ((List!3292 0))(
  ( (Nil!3289) (Cons!3288 (h!3936 (_ BitVec 64)) (t!8251 List!3292)) )
))
(declare-fun noDuplicate!65 (List!3292) Bool)

(assert (=> b!221828 (= res!108854 (noDuplicate!65 Nil!3289))))

(declare-fun b!221829 () Bool)

(assert (=> b!221829 (= e!144166 e!144173)))

(declare-fun res!108858 () Bool)

(assert (=> b!221829 (=> (not res!108858) (not e!144173))))

(assert (=> b!221829 (= res!108858 (inRange!0 index!297 (mask!9992 thiss!1504)))))

(declare-fun lt!112503 () Unit!6633)

(declare-fun e!144164 () Unit!6633)

(assert (=> b!221829 (= lt!112503 e!144164)))

(declare-fun c!36875 () Bool)

(declare-datatypes ((tuple2!4390 0))(
  ( (tuple2!4391 (_1!2206 (_ BitVec 64)) (_2!2206 V!7413)) )
))
(declare-datatypes ((List!3293 0))(
  ( (Nil!3290) (Cons!3289 (h!3937 tuple2!4390) (t!8252 List!3293)) )
))
(declare-datatypes ((ListLongMap!3303 0))(
  ( (ListLongMap!3304 (toList!1667 List!3293)) )
))
(declare-fun contains!1512 (ListLongMap!3303 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1195 (array!10895 array!10893 (_ BitVec 32) (_ BitVec 32) V!7413 V!7413 (_ BitVec 32) Int) ListLongMap!3303)

(assert (=> b!221829 (= c!36875 (contains!1512 (getCurrentListMap!1195 (_keys!6232 thiss!1504) (_values!4161 thiss!1504) (mask!9992 thiss!1504) (extraKeys!3915 thiss!1504) (zeroValue!4019 thiss!1504) (minValue!4019 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4178 thiss!1504)) key!932))))

(declare-fun b!221830 () Bool)

(declare-fun e!144168 () Bool)

(declare-fun tp_is_empty!5825 () Bool)

(assert (=> b!221830 (= e!144168 tp_is_empty!5825)))

(declare-fun b!221831 () Bool)

(declare-fun res!108853 () Bool)

(assert (=> b!221831 (= res!108853 (= (select (arr!5167 (_keys!6232 thiss!1504)) (index!5493 lt!112502)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!144170 () Bool)

(assert (=> b!221831 (=> (not res!108853) (not e!144170))))

(declare-fun res!108859 () Bool)

(assert (=> start!21896 (=> (not res!108859) (not e!144156))))

(declare-fun valid!1227 (LongMapFixedSize!3038) Bool)

(assert (=> start!21896 (= res!108859 (valid!1227 thiss!1504))))

(assert (=> start!21896 e!144156))

(declare-fun e!144157 () Bool)

(assert (=> start!21896 e!144157))

(assert (=> start!21896 true))

(declare-fun b!221832 () Bool)

(assert (=> b!221832 (= e!144171 tp_is_empty!5825)))

(declare-fun b!221833 () Bool)

(declare-fun e!144165 () Bool)

(assert (=> b!221833 (= e!144165 e!144170)))

(declare-fun res!108862 () Bool)

(assert (=> b!221833 (= res!108862 call!20723)))

(assert (=> b!221833 (=> (not res!108862) (not e!144170))))

(declare-fun b!221834 () Bool)

(declare-fun e!144163 () Bool)

(declare-fun call!20724 () Bool)

(assert (=> b!221834 (= e!144163 (not call!20724))))

(declare-fun b!221835 () Bool)

(declare-fun e!144162 () Bool)

(declare-fun e!144159 () Bool)

(assert (=> b!221835 (= e!144162 e!144159)))

(declare-fun res!108852 () Bool)

(assert (=> b!221835 (=> (not res!108852) (not e!144159))))

(assert (=> b!221835 (= res!108852 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!221836 () Bool)

(assert (=> b!221836 (= e!144170 (not call!20724))))

(declare-fun b!221837 () Bool)

(declare-fun e!144161 () Bool)

(declare-fun contains!1513 (List!3292 (_ BitVec 64)) Bool)

(assert (=> b!221837 (= e!144161 (contains!1513 Nil!3289 key!932))))

(declare-fun b!221838 () Bool)

(declare-fun res!108860 () Bool)

(assert (=> b!221838 (=> (not res!108860) (not e!144163))))

(assert (=> b!221838 (= res!108860 (= (select (arr!5167 (_keys!6232 thiss!1504)) (index!5490 lt!112502)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!221839 () Bool)

(declare-fun Unit!6637 () Unit!6633)

(assert (=> b!221839 (= e!144164 Unit!6637)))

(declare-fun lt!112501 () Unit!6633)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!219 (array!10895 array!10893 (_ BitVec 32) (_ BitVec 32) V!7413 V!7413 (_ BitVec 64) Int) Unit!6633)

(assert (=> b!221839 (= lt!112501 (lemmaInListMapThenSeekEntryOrOpenFindsIt!219 (_keys!6232 thiss!1504) (_values!4161 thiss!1504) (mask!9992 thiss!1504) (extraKeys!3915 thiss!1504) (zeroValue!4019 thiss!1504) (minValue!4019 thiss!1504) key!932 (defaultEntry!4178 thiss!1504)))))

(assert (=> b!221839 false))

(declare-fun b!221840 () Bool)

(declare-fun e!144169 () Bool)

(assert (=> b!221840 (= e!144169 (and e!144168 mapRes!9907))))

(declare-fun condMapEmpty!9907 () Bool)

(declare-fun mapDefault!9907 () ValueCell!2569)

