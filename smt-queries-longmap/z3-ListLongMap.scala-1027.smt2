; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21848 () Bool)

(assert start!21848)

(declare-fun b!220122 () Bool)

(declare-fun b_free!5911 () Bool)

(declare-fun b_next!5911 () Bool)

(assert (=> b!220122 (= b_free!5911 (not b_next!5911))))

(declare-fun tp!20875 () Bool)

(declare-fun b_and!12823 () Bool)

(assert (=> b!220122 (= tp!20875 b_and!12823)))

(declare-fun b!220107 () Bool)

(declare-fun e!143130 () Bool)

(declare-fun tp_is_empty!5773 () Bool)

(assert (=> b!220107 (= e!143130 tp_is_empty!5773)))

(declare-fun b!220108 () Bool)

(declare-fun c!36645 () Bool)

(declare-datatypes ((SeekEntryResult!781 0))(
  ( (MissingZero!781 (index!5294 (_ BitVec 32))) (Found!781 (index!5295 (_ BitVec 32))) (Intermediate!781 (undefined!1593 Bool) (index!5296 (_ BitVec 32)) (x!22913 (_ BitVec 32))) (Undefined!781) (MissingVacant!781 (index!5297 (_ BitVec 32))) )
))
(declare-fun lt!112152 () SeekEntryResult!781)

(get-info :version)

(assert (=> b!220108 (= c!36645 ((_ is MissingVacant!781) lt!112152))))

(declare-fun e!143131 () Bool)

(declare-fun e!143136 () Bool)

(assert (=> b!220108 (= e!143131 e!143136)))

(declare-fun b!220109 () Bool)

(assert (=> b!220109 (= e!143136 ((_ is Undefined!781) lt!112152))))

(declare-fun b!220110 () Bool)

(declare-fun res!107909 () Bool)

(declare-fun e!143135 () Bool)

(assert (=> b!220110 (=> (not res!107909) (not e!143135))))

(declare-datatypes ((V!7345 0))(
  ( (V!7346 (val!2931 Int)) )
))
(declare-datatypes ((ValueCell!2543 0))(
  ( (ValueCellFull!2543 (v!4952 V!7345)) (EmptyCell!2543) )
))
(declare-datatypes ((array!10787 0))(
  ( (array!10788 (arr!5113 (Array (_ BitVec 32) ValueCell!2543)) (size!5446 (_ BitVec 32))) )
))
(declare-datatypes ((array!10789 0))(
  ( (array!10790 (arr!5114 (Array (_ BitVec 32) (_ BitVec 64))) (size!5447 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2986 0))(
  ( (LongMapFixedSize!2987 (defaultEntry!4152 Int) (mask!9950 (_ BitVec 32)) (extraKeys!3889 (_ BitVec 32)) (zeroValue!3993 V!7345) (minValue!3993 V!7345) (_size!1542 (_ BitVec 32)) (_keys!6206 array!10789) (_values!4135 array!10787) (_vacant!1542 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2986)

(assert (=> b!220110 (= res!107909 (and (= (size!5446 (_values!4135 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9950 thiss!1504))) (= (size!5447 (_keys!6206 thiss!1504)) (size!5446 (_values!4135 thiss!1504))) (bvsge (mask!9950 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3889 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3889 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!9829 () Bool)

(declare-fun mapRes!9829 () Bool)

(assert (=> mapIsEmpty!9829 mapRes!9829))

(declare-fun b!220111 () Bool)

(declare-fun res!107912 () Bool)

(assert (=> b!220111 (=> (not res!107912) (not e!143135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!220111 (= res!107912 (validMask!0 (mask!9950 thiss!1504)))))

(declare-fun b!220112 () Bool)

(declare-datatypes ((Unit!6543 0))(
  ( (Unit!6544) )
))
(declare-fun e!143127 () Unit!6543)

(declare-fun Unit!6545 () Unit!6543)

(assert (=> b!220112 (= e!143127 Unit!6545)))

(declare-fun lt!112154 () Unit!6543)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!197 (array!10789 array!10787 (_ BitVec 32) (_ BitVec 32) V!7345 V!7345 (_ BitVec 64) Int) Unit!6543)

(assert (=> b!220112 (= lt!112154 (lemmaInListMapThenSeekEntryOrOpenFindsIt!197 (_keys!6206 thiss!1504) (_values!4135 thiss!1504) (mask!9950 thiss!1504) (extraKeys!3889 thiss!1504) (zeroValue!3993 thiss!1504) (minValue!3993 thiss!1504) key!932 (defaultEntry!4152 thiss!1504)))))

(assert (=> b!220112 false))

(declare-fun res!107913 () Bool)

(declare-fun e!143128 () Bool)

(assert (=> start!21848 (=> (not res!107913) (not e!143128))))

(declare-fun valid!1219 (LongMapFixedSize!2986) Bool)

(assert (=> start!21848 (= res!107913 (valid!1219 thiss!1504))))

(assert (=> start!21848 e!143128))

(declare-fun e!143129 () Bool)

(assert (=> start!21848 e!143129))

(assert (=> start!21848 true))

(declare-fun b!220113 () Bool)

(assert (=> b!220113 (= e!143135 false)))

(declare-fun lt!112156 () Bool)

(declare-datatypes ((List!3170 0))(
  ( (Nil!3167) (Cons!3166 (h!3814 (_ BitVec 64)) (t!8121 List!3170)) )
))
(declare-fun arrayNoDuplicates!0 (array!10789 (_ BitVec 32) List!3170) Bool)

(assert (=> b!220113 (= lt!112156 (arrayNoDuplicates!0 (_keys!6206 thiss!1504) #b00000000000000000000000000000000 Nil!3167))))

(declare-fun b!220114 () Bool)

(declare-fun res!107907 () Bool)

(assert (=> b!220114 (=> (not res!107907) (not e!143135))))

(declare-fun arrayContainsKey!0 (array!10789 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!220114 (= res!107907 (arrayContainsKey!0 (_keys!6206 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!220115 () Bool)

(declare-fun e!143138 () Bool)

(declare-fun e!143134 () Bool)

(assert (=> b!220115 (= e!143138 (and e!143134 mapRes!9829))))

(declare-fun condMapEmpty!9829 () Bool)

(declare-fun mapDefault!9829 () ValueCell!2543)

(assert (=> b!220115 (= condMapEmpty!9829 (= (arr!5113 (_values!4135 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2543)) mapDefault!9829)))))

(declare-fun b!220116 () Bool)

(declare-fun res!107908 () Bool)

(declare-fun e!143126 () Bool)

(assert (=> b!220116 (=> (not res!107908) (not e!143126))))

(declare-fun call!20555 () Bool)

(assert (=> b!220116 (= res!107908 call!20555)))

(assert (=> b!220116 (= e!143131 e!143126)))

(declare-fun b!220117 () Bool)

(declare-fun e!143133 () Bool)

(assert (=> b!220117 (= e!143136 e!143133)))

(declare-fun res!107904 () Bool)

(assert (=> b!220117 (= res!107904 call!20555)))

(assert (=> b!220117 (=> (not res!107904) (not e!143133))))

(declare-fun b!220118 () Bool)

(declare-fun e!143132 () Bool)

(assert (=> b!220118 (= e!143132 e!143135)))

(declare-fun res!107914 () Bool)

(assert (=> b!220118 (=> (not res!107914) (not e!143135))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!220118 (= res!107914 (inRange!0 index!297 (mask!9950 thiss!1504)))))

(declare-fun lt!112153 () Unit!6543)

(assert (=> b!220118 (= lt!112153 e!143127)))

(declare-fun c!36646 () Bool)

(declare-datatypes ((tuple2!4274 0))(
  ( (tuple2!4275 (_1!2148 (_ BitVec 64)) (_2!2148 V!7345)) )
))
(declare-datatypes ((List!3171 0))(
  ( (Nil!3168) (Cons!3167 (h!3815 tuple2!4274) (t!8122 List!3171)) )
))
(declare-datatypes ((ListLongMap!3189 0))(
  ( (ListLongMap!3190 (toList!1610 List!3171)) )
))
(declare-fun contains!1467 (ListLongMap!3189 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1142 (array!10789 array!10787 (_ BitVec 32) (_ BitVec 32) V!7345 V!7345 (_ BitVec 32) Int) ListLongMap!3189)

(assert (=> b!220118 (= c!36646 (contains!1467 (getCurrentListMap!1142 (_keys!6206 thiss!1504) (_values!4135 thiss!1504) (mask!9950 thiss!1504) (extraKeys!3889 thiss!1504) (zeroValue!3993 thiss!1504) (minValue!3993 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4152 thiss!1504)) key!932))))

(declare-fun b!220119 () Bool)

(declare-fun lt!112155 () Unit!6543)

(assert (=> b!220119 (= e!143127 lt!112155)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!194 (array!10789 array!10787 (_ BitVec 32) (_ BitVec 32) V!7345 V!7345 (_ BitVec 64) Int) Unit!6543)

(assert (=> b!220119 (= lt!112155 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!194 (_keys!6206 thiss!1504) (_values!4135 thiss!1504) (mask!9950 thiss!1504) (extraKeys!3889 thiss!1504) (zeroValue!3993 thiss!1504) (minValue!3993 thiss!1504) key!932 (defaultEntry!4152 thiss!1504)))))

(declare-fun c!36644 () Bool)

(assert (=> b!220119 (= c!36644 ((_ is MissingZero!781) lt!112152))))

(assert (=> b!220119 e!143131))

(declare-fun b!220120 () Bool)

(declare-fun call!20556 () Bool)

(assert (=> b!220120 (= e!143126 (not call!20556))))

(declare-fun bm!20552 () Bool)

(assert (=> bm!20552 (= call!20555 (inRange!0 (ite c!36644 (index!5294 lt!112152) (index!5297 lt!112152)) (mask!9950 thiss!1504)))))

(declare-fun bm!20553 () Bool)

(assert (=> bm!20553 (= call!20556 (arrayContainsKey!0 (_keys!6206 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!220121 () Bool)

(assert (=> b!220121 (= e!143134 tp_is_empty!5773)))

(declare-fun array_inv!3361 (array!10789) Bool)

(declare-fun array_inv!3362 (array!10787) Bool)

(assert (=> b!220122 (= e!143129 (and tp!20875 tp_is_empty!5773 (array_inv!3361 (_keys!6206 thiss!1504)) (array_inv!3362 (_values!4135 thiss!1504)) e!143138))))

(declare-fun mapNonEmpty!9829 () Bool)

(declare-fun tp!20874 () Bool)

(assert (=> mapNonEmpty!9829 (= mapRes!9829 (and tp!20874 e!143130))))

(declare-fun mapRest!9829 () (Array (_ BitVec 32) ValueCell!2543))

(declare-fun mapKey!9829 () (_ BitVec 32))

(declare-fun mapValue!9829 () ValueCell!2543)

(assert (=> mapNonEmpty!9829 (= (arr!5113 (_values!4135 thiss!1504)) (store mapRest!9829 mapKey!9829 mapValue!9829))))

(declare-fun b!220123 () Bool)

(assert (=> b!220123 (= e!143133 (not call!20556))))

(declare-fun b!220124 () Bool)

(declare-fun res!107905 () Bool)

(assert (=> b!220124 (=> (not res!107905) (not e!143128))))

(assert (=> b!220124 (= res!107905 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!220125 () Bool)

(assert (=> b!220125 (= e!143128 e!143132)))

(declare-fun res!107910 () Bool)

(assert (=> b!220125 (=> (not res!107910) (not e!143132))))

(assert (=> b!220125 (= res!107910 (or (= lt!112152 (MissingZero!781 index!297)) (= lt!112152 (MissingVacant!781 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10789 (_ BitVec 32)) SeekEntryResult!781)

(assert (=> b!220125 (= lt!112152 (seekEntryOrOpen!0 key!932 (_keys!6206 thiss!1504) (mask!9950 thiss!1504)))))

(declare-fun b!220126 () Bool)

(declare-fun res!107906 () Bool)

(assert (=> b!220126 (=> (not res!107906) (not e!143126))))

(assert (=> b!220126 (= res!107906 (= (select (arr!5114 (_keys!6206 thiss!1504)) (index!5294 lt!112152)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220127 () Bool)

(declare-fun res!107903 () Bool)

(assert (=> b!220127 (= res!107903 (= (select (arr!5114 (_keys!6206 thiss!1504)) (index!5297 lt!112152)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!220127 (=> (not res!107903) (not e!143133))))

(declare-fun b!220128 () Bool)

(declare-fun res!107911 () Bool)

(assert (=> b!220128 (=> (not res!107911) (not e!143135))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10789 (_ BitVec 32)) Bool)

(assert (=> b!220128 (= res!107911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6206 thiss!1504) (mask!9950 thiss!1504)))))

(assert (= (and start!21848 res!107913) b!220124))

(assert (= (and b!220124 res!107905) b!220125))

(assert (= (and b!220125 res!107910) b!220118))

(assert (= (and b!220118 c!36646) b!220112))

(assert (= (and b!220118 (not c!36646)) b!220119))

(assert (= (and b!220119 c!36644) b!220116))

(assert (= (and b!220119 (not c!36644)) b!220108))

(assert (= (and b!220116 res!107908) b!220126))

(assert (= (and b!220126 res!107906) b!220120))

(assert (= (and b!220108 c!36645) b!220117))

(assert (= (and b!220108 (not c!36645)) b!220109))

(assert (= (and b!220117 res!107904) b!220127))

(assert (= (and b!220127 res!107903) b!220123))

(assert (= (or b!220116 b!220117) bm!20552))

(assert (= (or b!220120 b!220123) bm!20553))

(assert (= (and b!220118 res!107914) b!220114))

(assert (= (and b!220114 res!107907) b!220111))

(assert (= (and b!220111 res!107912) b!220110))

(assert (= (and b!220110 res!107909) b!220128))

(assert (= (and b!220128 res!107911) b!220113))

(assert (= (and b!220115 condMapEmpty!9829) mapIsEmpty!9829))

(assert (= (and b!220115 (not condMapEmpty!9829)) mapNonEmpty!9829))

(assert (= (and mapNonEmpty!9829 ((_ is ValueCellFull!2543) mapValue!9829)) b!220107))

(assert (= (and b!220115 ((_ is ValueCellFull!2543) mapDefault!9829)) b!220121))

(assert (= b!220122 b!220115))

(assert (= start!21848 b!220122))

(declare-fun m!245551 () Bool)

(assert (=> b!220111 m!245551))

(declare-fun m!245553 () Bool)

(assert (=> mapNonEmpty!9829 m!245553))

(declare-fun m!245555 () Bool)

(assert (=> b!220125 m!245555))

(declare-fun m!245557 () Bool)

(assert (=> b!220127 m!245557))

(declare-fun m!245559 () Bool)

(assert (=> b!220114 m!245559))

(declare-fun m!245561 () Bool)

(assert (=> b!220128 m!245561))

(declare-fun m!245563 () Bool)

(assert (=> b!220113 m!245563))

(assert (=> bm!20553 m!245559))

(declare-fun m!245565 () Bool)

(assert (=> bm!20552 m!245565))

(declare-fun m!245567 () Bool)

(assert (=> b!220112 m!245567))

(declare-fun m!245569 () Bool)

(assert (=> b!220126 m!245569))

(declare-fun m!245571 () Bool)

(assert (=> b!220118 m!245571))

(declare-fun m!245573 () Bool)

(assert (=> b!220118 m!245573))

(assert (=> b!220118 m!245573))

(declare-fun m!245575 () Bool)

(assert (=> b!220118 m!245575))

(declare-fun m!245577 () Bool)

(assert (=> b!220122 m!245577))

(declare-fun m!245579 () Bool)

(assert (=> b!220122 m!245579))

(declare-fun m!245581 () Bool)

(assert (=> b!220119 m!245581))

(declare-fun m!245583 () Bool)

(assert (=> start!21848 m!245583))

(check-sat (not b!220113) (not mapNonEmpty!9829) (not b!220128) (not start!21848) (not b!220112) (not b!220118) tp_is_empty!5773 (not b!220122) (not bm!20552) (not b!220125) (not b!220111) b_and!12823 (not bm!20553) (not b!220114) (not b_next!5911) (not b!220119))
(check-sat b_and!12823 (not b_next!5911))
