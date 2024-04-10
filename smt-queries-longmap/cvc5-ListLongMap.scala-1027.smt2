; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21844 () Bool)

(assert start!21844)

(declare-fun b!220077 () Bool)

(declare-fun b_free!5911 () Bool)

(declare-fun b_next!5911 () Bool)

(assert (=> b!220077 (= b_free!5911 (not b_next!5911))))

(declare-fun tp!20874 () Bool)

(declare-fun b_and!12809 () Bool)

(assert (=> b!220077 (= tp!20874 b_and!12809)))

(declare-fun b!220060 () Bool)

(declare-fun e!143111 () Bool)

(declare-datatypes ((SeekEntryResult!806 0))(
  ( (MissingZero!806 (index!5394 (_ BitVec 32))) (Found!806 (index!5395 (_ BitVec 32))) (Intermediate!806 (undefined!1618 Bool) (index!5396 (_ BitVec 32)) (x!22938 (_ BitVec 32))) (Undefined!806) (MissingVacant!806 (index!5397 (_ BitVec 32))) )
))
(declare-fun lt!112095 () SeekEntryResult!806)

(assert (=> b!220060 (= e!143111 (is-Undefined!806 lt!112095))))

(declare-fun bm!20564 () Bool)

(declare-fun call!20567 () Bool)

(declare-datatypes ((V!7345 0))(
  ( (V!7346 (val!2931 Int)) )
))
(declare-datatypes ((ValueCell!2543 0))(
  ( (ValueCellFull!2543 (v!4951 V!7345)) (EmptyCell!2543) )
))
(declare-datatypes ((array!10789 0))(
  ( (array!10790 (arr!5114 (Array (_ BitVec 32) ValueCell!2543)) (size!5447 (_ BitVec 32))) )
))
(declare-datatypes ((array!10791 0))(
  ( (array!10792 (arr!5115 (Array (_ BitVec 32) (_ BitVec 64))) (size!5448 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2986 0))(
  ( (LongMapFixedSize!2987 (defaultEntry!4152 Int) (mask!9950 (_ BitVec 32)) (extraKeys!3889 (_ BitVec 32)) (zeroValue!3993 V!7345) (minValue!3993 V!7345) (_size!1542 (_ BitVec 32)) (_keys!6206 array!10791) (_values!4135 array!10789) (_vacant!1542 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2986)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!10791 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20564 (= call!20567 (arrayContainsKey!0 (_keys!6206 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!9829 () Bool)

(declare-fun mapRes!9829 () Bool)

(declare-fun tp!20875 () Bool)

(declare-fun e!143108 () Bool)

(assert (=> mapNonEmpty!9829 (= mapRes!9829 (and tp!20875 e!143108))))

(declare-fun mapRest!9829 () (Array (_ BitVec 32) ValueCell!2543))

(declare-fun mapValue!9829 () ValueCell!2543)

(declare-fun mapKey!9829 () (_ BitVec 32))

(assert (=> mapNonEmpty!9829 (= (arr!5114 (_values!4135 thiss!1504)) (store mapRest!9829 mapKey!9829 mapValue!9829))))

(declare-fun b!220061 () Bool)

(declare-fun tp_is_empty!5773 () Bool)

(assert (=> b!220061 (= e!143108 tp_is_empty!5773)))

(declare-fun b!220062 () Bool)

(declare-fun res!107893 () Bool)

(declare-fun e!143103 () Bool)

(assert (=> b!220062 (=> (not res!107893) (not e!143103))))

(assert (=> b!220062 (= res!107893 (= (select (arr!5115 (_keys!6206 thiss!1504)) (index!5394 lt!112095)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!20565 () Bool)

(declare-fun call!20568 () Bool)

(declare-fun c!36632 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20565 (= call!20568 (inRange!0 (ite c!36632 (index!5394 lt!112095) (index!5397 lt!112095)) (mask!9950 thiss!1504)))))

(declare-fun b!220063 () Bool)

(declare-fun e!143110 () Bool)

(assert (=> b!220063 (= e!143111 e!143110)))

(declare-fun res!107891 () Bool)

(assert (=> b!220063 (= res!107891 call!20568)))

(assert (=> b!220063 (=> (not res!107891) (not e!143110))))

(declare-fun b!220064 () Bool)

(declare-fun e!143106 () Bool)

(assert (=> b!220064 (= e!143106 false)))

(declare-fun lt!112096 () Bool)

(declare-datatypes ((List!3255 0))(
  ( (Nil!3252) (Cons!3251 (h!3899 (_ BitVec 64)) (t!8214 List!3255)) )
))
(declare-fun arrayNoDuplicates!0 (array!10791 (_ BitVec 32) List!3255) Bool)

(assert (=> b!220064 (= lt!112096 (arrayNoDuplicates!0 (_keys!6206 thiss!1504) #b00000000000000000000000000000000 Nil!3252))))

(declare-fun b!220065 () Bool)

(declare-fun c!36633 () Bool)

(assert (=> b!220065 (= c!36633 (is-MissingVacant!806 lt!112095))))

(declare-fun e!143112 () Bool)

(assert (=> b!220065 (= e!143112 e!143111)))

(declare-fun b!220066 () Bool)

(declare-fun e!143114 () Bool)

(declare-fun e!143113 () Bool)

(assert (=> b!220066 (= e!143114 e!143113)))

(declare-fun res!107887 () Bool)

(assert (=> b!220066 (=> (not res!107887) (not e!143113))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!220066 (= res!107887 (or (= lt!112095 (MissingZero!806 index!297)) (= lt!112095 (MissingVacant!806 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10791 (_ BitVec 32)) SeekEntryResult!806)

(assert (=> b!220066 (= lt!112095 (seekEntryOrOpen!0 key!932 (_keys!6206 thiss!1504) (mask!9950 thiss!1504)))))

(declare-fun b!220067 () Bool)

(declare-fun res!107889 () Bool)

(assert (=> b!220067 (=> (not res!107889) (not e!143106))))

(assert (=> b!220067 (= res!107889 (and (= (size!5447 (_values!4135 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9950 thiss!1504))) (= (size!5448 (_keys!6206 thiss!1504)) (size!5447 (_values!4135 thiss!1504))) (bvsge (mask!9950 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3889 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3889 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!220068 () Bool)

(assert (=> b!220068 (= e!143110 (not call!20567))))

(declare-fun b!220069 () Bool)

(declare-fun res!107884 () Bool)

(assert (=> b!220069 (=> (not res!107884) (not e!143114))))

(assert (=> b!220069 (= res!107884 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!220070 () Bool)

(declare-fun res!107888 () Bool)

(assert (=> b!220070 (=> (not res!107888) (not e!143106))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!220070 (= res!107888 (validMask!0 (mask!9950 thiss!1504)))))

(declare-fun b!220071 () Bool)

(declare-fun res!107885 () Bool)

(assert (=> b!220071 (=> (not res!107885) (not e!143103))))

(assert (=> b!220071 (= res!107885 call!20568)))

(assert (=> b!220071 (= e!143112 e!143103)))

(declare-fun mapIsEmpty!9829 () Bool)

(assert (=> mapIsEmpty!9829 mapRes!9829))

(declare-fun b!220072 () Bool)

(declare-fun res!107882 () Bool)

(assert (=> b!220072 (=> (not res!107882) (not e!143106))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10791 (_ BitVec 32)) Bool)

(assert (=> b!220072 (= res!107882 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6206 thiss!1504) (mask!9950 thiss!1504)))))

(declare-fun b!220073 () Bool)

(assert (=> b!220073 (= e!143103 (not call!20567))))

(declare-fun b!220074 () Bool)

(declare-fun res!107883 () Bool)

(assert (=> b!220074 (=> (not res!107883) (not e!143106))))

(assert (=> b!220074 (= res!107883 (arrayContainsKey!0 (_keys!6206 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!220075 () Bool)

(assert (=> b!220075 (= e!143113 e!143106)))

(declare-fun res!107890 () Bool)

(assert (=> b!220075 (=> (not res!107890) (not e!143106))))

(assert (=> b!220075 (= res!107890 (inRange!0 index!297 (mask!9950 thiss!1504)))))

(declare-datatypes ((Unit!6563 0))(
  ( (Unit!6564) )
))
(declare-fun lt!112094 () Unit!6563)

(declare-fun e!143107 () Unit!6563)

(assert (=> b!220075 (= lt!112094 e!143107)))

(declare-fun c!36631 () Bool)

(declare-datatypes ((tuple2!4352 0))(
  ( (tuple2!4353 (_1!2187 (_ BitVec 64)) (_2!2187 V!7345)) )
))
(declare-datatypes ((List!3256 0))(
  ( (Nil!3253) (Cons!3252 (h!3900 tuple2!4352) (t!8215 List!3256)) )
))
(declare-datatypes ((ListLongMap!3265 0))(
  ( (ListLongMap!3266 (toList!1648 List!3256)) )
))
(declare-fun contains!1491 (ListLongMap!3265 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1176 (array!10791 array!10789 (_ BitVec 32) (_ BitVec 32) V!7345 V!7345 (_ BitVec 32) Int) ListLongMap!3265)

(assert (=> b!220075 (= c!36631 (contains!1491 (getCurrentListMap!1176 (_keys!6206 thiss!1504) (_values!4135 thiss!1504) (mask!9950 thiss!1504) (extraKeys!3889 thiss!1504) (zeroValue!3993 thiss!1504) (minValue!3993 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4152 thiss!1504)) key!932))))

(declare-fun b!220076 () Bool)

(declare-fun res!107886 () Bool)

(assert (=> b!220076 (= res!107886 (= (select (arr!5115 (_keys!6206 thiss!1504)) (index!5397 lt!112095)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!220076 (=> (not res!107886) (not e!143110))))

(declare-fun e!143105 () Bool)

(declare-fun e!143104 () Bool)

(declare-fun array_inv!3385 (array!10791) Bool)

(declare-fun array_inv!3386 (array!10789) Bool)

(assert (=> b!220077 (= e!143105 (and tp!20874 tp_is_empty!5773 (array_inv!3385 (_keys!6206 thiss!1504)) (array_inv!3386 (_values!4135 thiss!1504)) e!143104))))

(declare-fun b!220078 () Bool)

(declare-fun Unit!6565 () Unit!6563)

(assert (=> b!220078 (= e!143107 Unit!6565)))

(declare-fun lt!112097 () Unit!6563)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!200 (array!10791 array!10789 (_ BitVec 32) (_ BitVec 32) V!7345 V!7345 (_ BitVec 64) Int) Unit!6563)

(assert (=> b!220078 (= lt!112097 (lemmaInListMapThenSeekEntryOrOpenFindsIt!200 (_keys!6206 thiss!1504) (_values!4135 thiss!1504) (mask!9950 thiss!1504) (extraKeys!3889 thiss!1504) (zeroValue!3993 thiss!1504) (minValue!3993 thiss!1504) key!932 (defaultEntry!4152 thiss!1504)))))

(assert (=> b!220078 false))

(declare-fun b!220079 () Bool)

(declare-fun lt!112093 () Unit!6563)

(assert (=> b!220079 (= e!143107 lt!112093)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!212 (array!10791 array!10789 (_ BitVec 32) (_ BitVec 32) V!7345 V!7345 (_ BitVec 64) Int) Unit!6563)

(assert (=> b!220079 (= lt!112093 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!212 (_keys!6206 thiss!1504) (_values!4135 thiss!1504) (mask!9950 thiss!1504) (extraKeys!3889 thiss!1504) (zeroValue!3993 thiss!1504) (minValue!3993 thiss!1504) key!932 (defaultEntry!4152 thiss!1504)))))

(assert (=> b!220079 (= c!36632 (is-MissingZero!806 lt!112095))))

(assert (=> b!220079 e!143112))

(declare-fun b!220080 () Bool)

(declare-fun e!143102 () Bool)

(assert (=> b!220080 (= e!143104 (and e!143102 mapRes!9829))))

(declare-fun condMapEmpty!9829 () Bool)

(declare-fun mapDefault!9829 () ValueCell!2543)

