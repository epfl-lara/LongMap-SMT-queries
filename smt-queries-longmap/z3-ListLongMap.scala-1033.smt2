; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21884 () Bool)

(assert start!21884)

(declare-fun b!221122 () Bool)

(declare-fun b_free!5947 () Bool)

(declare-fun b_next!5947 () Bool)

(assert (=> b!221122 (= b_free!5947 (not b_next!5947))))

(declare-fun tp!20982 () Bool)

(declare-fun b_and!12819 () Bool)

(assert (=> b!221122 (= tp!20982 b_and!12819)))

(declare-fun b!221101 () Bool)

(declare-fun e!143715 () Bool)

(assert (=> b!221101 (= e!143715 false)))

(declare-fun lt!112183 () Bool)

(declare-datatypes ((V!7393 0))(
  ( (V!7394 (val!2949 Int)) )
))
(declare-datatypes ((ValueCell!2561 0))(
  ( (ValueCellFull!2561 (v!4963 V!7393)) (EmptyCell!2561) )
))
(declare-datatypes ((array!10853 0))(
  ( (array!10854 (arr!5145 (Array (_ BitVec 32) ValueCell!2561)) (size!5479 (_ BitVec 32))) )
))
(declare-datatypes ((array!10855 0))(
  ( (array!10856 (arr!5146 (Array (_ BitVec 32) (_ BitVec 64))) (size!5480 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3022 0))(
  ( (LongMapFixedSize!3023 (defaultEntry!4170 Int) (mask!9979 (_ BitVec 32)) (extraKeys!3907 (_ BitVec 32)) (zeroValue!4011 V!7393) (minValue!4011 V!7393) (_size!1560 (_ BitVec 32)) (_keys!6223 array!10855) (_values!4153 array!10853) (_vacant!1560 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3022)

(declare-datatypes ((List!3259 0))(
  ( (Nil!3256) (Cons!3255 (h!3903 (_ BitVec 64)) (t!8209 List!3259)) )
))
(declare-fun arrayNoDuplicates!0 (array!10855 (_ BitVec 32) List!3259) Bool)

(assert (=> b!221101 (= lt!112183 (arrayNoDuplicates!0 (_keys!6223 thiss!1504) #b00000000000000000000000000000000 Nil!3256))))

(declare-fun b!221102 () Bool)

(declare-fun e!143708 () Bool)

(declare-fun tp_is_empty!5809 () Bool)

(assert (=> b!221102 (= e!143708 tp_is_empty!5809)))

(declare-fun b!221103 () Bool)

(declare-fun res!108438 () Bool)

(declare-fun e!143707 () Bool)

(assert (=> b!221103 (=> (not res!108438) (not e!143707))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!221103 (= res!108438 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!221104 () Bool)

(declare-fun e!143705 () Bool)

(assert (=> b!221104 (= e!143705 tp_is_empty!5809)))

(declare-fun b!221105 () Bool)

(declare-fun res!108441 () Bool)

(assert (=> b!221105 (=> (not res!108441) (not e!143715))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10855 (_ BitVec 32)) Bool)

(assert (=> b!221105 (= res!108441 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6223 thiss!1504) (mask!9979 thiss!1504)))))

(declare-fun res!108436 () Bool)

(assert (=> start!21884 (=> (not res!108436) (not e!143707))))

(declare-fun valid!1232 (LongMapFixedSize!3022) Bool)

(assert (=> start!21884 (= res!108436 (valid!1232 thiss!1504))))

(assert (=> start!21884 e!143707))

(declare-fun e!143703 () Bool)

(assert (=> start!21884 e!143703))

(assert (=> start!21884 true))

(declare-fun b!221106 () Bool)

(declare-fun c!36767 () Bool)

(declare-datatypes ((SeekEntryResult!817 0))(
  ( (MissingZero!817 (index!5438 (_ BitVec 32))) (Found!817 (index!5439 (_ BitVec 32))) (Intermediate!817 (undefined!1629 Bool) (index!5440 (_ BitVec 32)) (x!22996 (_ BitVec 32))) (Undefined!817) (MissingVacant!817 (index!5441 (_ BitVec 32))) )
))
(declare-fun lt!112182 () SeekEntryResult!817)

(get-info :version)

(assert (=> b!221106 (= c!36767 ((_ is MissingVacant!817) lt!112182))))

(declare-fun e!143709 () Bool)

(declare-fun e!143714 () Bool)

(assert (=> b!221106 (= e!143709 e!143714)))

(declare-fun b!221107 () Bool)

(declare-fun e!143710 () Bool)

(assert (=> b!221107 (= e!143707 e!143710)))

(declare-fun res!108442 () Bool)

(assert (=> b!221107 (=> (not res!108442) (not e!143710))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!221107 (= res!108442 (or (= lt!112182 (MissingZero!817 index!297)) (= lt!112182 (MissingVacant!817 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10855 (_ BitVec 32)) SeekEntryResult!817)

(assert (=> b!221107 (= lt!112182 (seekEntryOrOpen!0 key!932 (_keys!6223 thiss!1504) (mask!9979 thiss!1504)))))

(declare-fun b!221108 () Bool)

(declare-fun e!143712 () Bool)

(declare-fun mapRes!9883 () Bool)

(assert (=> b!221108 (= e!143712 (and e!143705 mapRes!9883))))

(declare-fun condMapEmpty!9883 () Bool)

(declare-fun mapDefault!9883 () ValueCell!2561)

(assert (=> b!221108 (= condMapEmpty!9883 (= (arr!5145 (_values!4153 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2561)) mapDefault!9883)))))

(declare-fun b!221109 () Bool)

(declare-fun res!108446 () Bool)

(declare-fun e!143713 () Bool)

(assert (=> b!221109 (=> (not res!108446) (not e!143713))))

(declare-fun call!20651 () Bool)

(assert (=> b!221109 (= res!108446 call!20651)))

(assert (=> b!221109 (= e!143709 e!143713)))

(declare-fun b!221110 () Bool)

(declare-fun res!108439 () Bool)

(assert (=> b!221110 (=> (not res!108439) (not e!143715))))

(assert (=> b!221110 (= res!108439 (and (= (size!5479 (_values!4153 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9979 thiss!1504))) (= (size!5480 (_keys!6223 thiss!1504)) (size!5479 (_values!4153 thiss!1504))) (bvsge (mask!9979 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3907 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3907 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!221111 () Bool)

(assert (=> b!221111 (= e!143710 e!143715)))

(declare-fun res!108445 () Bool)

(assert (=> b!221111 (=> (not res!108445) (not e!143715))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!221111 (= res!108445 (inRange!0 index!297 (mask!9979 thiss!1504)))))

(declare-datatypes ((Unit!6557 0))(
  ( (Unit!6558) )
))
(declare-fun lt!112186 () Unit!6557)

(declare-fun e!143706 () Unit!6557)

(assert (=> b!221111 (= lt!112186 e!143706)))

(declare-fun c!36769 () Bool)

(declare-datatypes ((tuple2!4338 0))(
  ( (tuple2!4339 (_1!2180 (_ BitVec 64)) (_2!2180 V!7393)) )
))
(declare-datatypes ((List!3260 0))(
  ( (Nil!3257) (Cons!3256 (h!3904 tuple2!4338) (t!8210 List!3260)) )
))
(declare-datatypes ((ListLongMap!3241 0))(
  ( (ListLongMap!3242 (toList!1636 List!3260)) )
))
(declare-fun contains!1479 (ListLongMap!3241 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1145 (array!10855 array!10853 (_ BitVec 32) (_ BitVec 32) V!7393 V!7393 (_ BitVec 32) Int) ListLongMap!3241)

(assert (=> b!221111 (= c!36769 (contains!1479 (getCurrentListMap!1145 (_keys!6223 thiss!1504) (_values!4153 thiss!1504) (mask!9979 thiss!1504) (extraKeys!3907 thiss!1504) (zeroValue!4011 thiss!1504) (minValue!4011 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4170 thiss!1504)) key!932))))

(declare-fun bm!20648 () Bool)

(declare-fun call!20652 () Bool)

(declare-fun arrayContainsKey!0 (array!10855 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20648 (= call!20652 (arrayContainsKey!0 (_keys!6223 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!221112 () Bool)

(declare-fun res!108443 () Bool)

(assert (=> b!221112 (=> (not res!108443) (not e!143715))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!221112 (= res!108443 (validMask!0 (mask!9979 thiss!1504)))))

(declare-fun mapNonEmpty!9883 () Bool)

(declare-fun tp!20983 () Bool)

(assert (=> mapNonEmpty!9883 (= mapRes!9883 (and tp!20983 e!143708))))

(declare-fun mapRest!9883 () (Array (_ BitVec 32) ValueCell!2561))

(declare-fun mapValue!9883 () ValueCell!2561)

(declare-fun mapKey!9883 () (_ BitVec 32))

(assert (=> mapNonEmpty!9883 (= (arr!5145 (_values!4153 thiss!1504)) (store mapRest!9883 mapKey!9883 mapValue!9883))))

(declare-fun b!221113 () Bool)

(declare-fun res!108435 () Bool)

(assert (=> b!221113 (=> (not res!108435) (not e!143713))))

(assert (=> b!221113 (= res!108435 (= (select (arr!5146 (_keys!6223 thiss!1504)) (index!5438 lt!112182)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!9883 () Bool)

(assert (=> mapIsEmpty!9883 mapRes!9883))

(declare-fun b!221114 () Bool)

(declare-fun res!108437 () Bool)

(assert (=> b!221114 (= res!108437 (= (select (arr!5146 (_keys!6223 thiss!1504)) (index!5441 lt!112182)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!143711 () Bool)

(assert (=> b!221114 (=> (not res!108437) (not e!143711))))

(declare-fun b!221115 () Bool)

(assert (=> b!221115 (= e!143713 (not call!20652))))

(declare-fun b!221116 () Bool)

(declare-fun lt!112184 () Unit!6557)

(assert (=> b!221116 (= e!143706 lt!112184)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!207 (array!10855 array!10853 (_ BitVec 32) (_ BitVec 32) V!7393 V!7393 (_ BitVec 64) Int) Unit!6557)

(assert (=> b!221116 (= lt!112184 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!207 (_keys!6223 thiss!1504) (_values!4153 thiss!1504) (mask!9979 thiss!1504) (extraKeys!3907 thiss!1504) (zeroValue!4011 thiss!1504) (minValue!4011 thiss!1504) key!932 (defaultEntry!4170 thiss!1504)))))

(declare-fun c!36768 () Bool)

(assert (=> b!221116 (= c!36768 ((_ is MissingZero!817) lt!112182))))

(assert (=> b!221116 e!143709))

(declare-fun b!221117 () Bool)

(declare-fun res!108444 () Bool)

(assert (=> b!221117 (=> (not res!108444) (not e!143715))))

(assert (=> b!221117 (= res!108444 (arrayContainsKey!0 (_keys!6223 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!221118 () Bool)

(assert (=> b!221118 (= e!143714 ((_ is Undefined!817) lt!112182))))

(declare-fun b!221119 () Bool)

(assert (=> b!221119 (= e!143714 e!143711)))

(declare-fun res!108440 () Bool)

(assert (=> b!221119 (= res!108440 call!20651)))

(assert (=> b!221119 (=> (not res!108440) (not e!143711))))

(declare-fun b!221120 () Bool)

(declare-fun Unit!6559 () Unit!6557)

(assert (=> b!221120 (= e!143706 Unit!6559)))

(declare-fun lt!112185 () Unit!6557)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!207 (array!10855 array!10853 (_ BitVec 32) (_ BitVec 32) V!7393 V!7393 (_ BitVec 64) Int) Unit!6557)

(assert (=> b!221120 (= lt!112185 (lemmaInListMapThenSeekEntryOrOpenFindsIt!207 (_keys!6223 thiss!1504) (_values!4153 thiss!1504) (mask!9979 thiss!1504) (extraKeys!3907 thiss!1504) (zeroValue!4011 thiss!1504) (minValue!4011 thiss!1504) key!932 (defaultEntry!4170 thiss!1504)))))

(assert (=> b!221120 false))

(declare-fun bm!20649 () Bool)

(assert (=> bm!20649 (= call!20651 (inRange!0 (ite c!36768 (index!5438 lt!112182) (index!5441 lt!112182)) (mask!9979 thiss!1504)))))

(declare-fun b!221121 () Bool)

(assert (=> b!221121 (= e!143711 (not call!20652))))

(declare-fun array_inv!3389 (array!10855) Bool)

(declare-fun array_inv!3390 (array!10853) Bool)

(assert (=> b!221122 (= e!143703 (and tp!20982 tp_is_empty!5809 (array_inv!3389 (_keys!6223 thiss!1504)) (array_inv!3390 (_values!4153 thiss!1504)) e!143712))))

(assert (= (and start!21884 res!108436) b!221103))

(assert (= (and b!221103 res!108438) b!221107))

(assert (= (and b!221107 res!108442) b!221111))

(assert (= (and b!221111 c!36769) b!221120))

(assert (= (and b!221111 (not c!36769)) b!221116))

(assert (= (and b!221116 c!36768) b!221109))

(assert (= (and b!221116 (not c!36768)) b!221106))

(assert (= (and b!221109 res!108446) b!221113))

(assert (= (and b!221113 res!108435) b!221115))

(assert (= (and b!221106 c!36767) b!221119))

(assert (= (and b!221106 (not c!36767)) b!221118))

(assert (= (and b!221119 res!108440) b!221114))

(assert (= (and b!221114 res!108437) b!221121))

(assert (= (or b!221109 b!221119) bm!20649))

(assert (= (or b!221115 b!221121) bm!20648))

(assert (= (and b!221111 res!108445) b!221117))

(assert (= (and b!221117 res!108444) b!221112))

(assert (= (and b!221112 res!108443) b!221110))

(assert (= (and b!221110 res!108439) b!221105))

(assert (= (and b!221105 res!108441) b!221101))

(assert (= (and b!221108 condMapEmpty!9883) mapIsEmpty!9883))

(assert (= (and b!221108 (not condMapEmpty!9883)) mapNonEmpty!9883))

(assert (= (and mapNonEmpty!9883 ((_ is ValueCellFull!2561) mapValue!9883)) b!221102))

(assert (= (and b!221108 ((_ is ValueCellFull!2561) mapDefault!9883)) b!221104))

(assert (= b!221122 b!221108))

(assert (= start!21884 b!221122))

(declare-fun m!245365 () Bool)

(assert (=> b!221113 m!245365))

(declare-fun m!245367 () Bool)

(assert (=> b!221105 m!245367))

(declare-fun m!245369 () Bool)

(assert (=> b!221122 m!245369))

(declare-fun m!245371 () Bool)

(assert (=> b!221122 m!245371))

(declare-fun m!245373 () Bool)

(assert (=> b!221107 m!245373))

(declare-fun m!245375 () Bool)

(assert (=> mapNonEmpty!9883 m!245375))

(declare-fun m!245377 () Bool)

(assert (=> b!221112 m!245377))

(declare-fun m!245379 () Bool)

(assert (=> bm!20648 m!245379))

(declare-fun m!245381 () Bool)

(assert (=> b!221114 m!245381))

(declare-fun m!245383 () Bool)

(assert (=> bm!20649 m!245383))

(declare-fun m!245385 () Bool)

(assert (=> b!221111 m!245385))

(declare-fun m!245387 () Bool)

(assert (=> b!221111 m!245387))

(assert (=> b!221111 m!245387))

(declare-fun m!245389 () Bool)

(assert (=> b!221111 m!245389))

(assert (=> b!221117 m!245379))

(declare-fun m!245391 () Bool)

(assert (=> b!221101 m!245391))

(declare-fun m!245393 () Bool)

(assert (=> b!221116 m!245393))

(declare-fun m!245395 () Bool)

(assert (=> start!21884 m!245395))

(declare-fun m!245397 () Bool)

(assert (=> b!221120 m!245397))

(check-sat (not b!221120) (not bm!20648) (not start!21884) (not b!221107) (not b!221112) tp_is_empty!5809 (not b!221122) (not mapNonEmpty!9883) (not b!221105) (not b!221101) (not bm!20649) (not b!221117) b_and!12819 (not b!221116) (not b!221111) (not b_next!5947))
(check-sat b_and!12819 (not b_next!5947))
