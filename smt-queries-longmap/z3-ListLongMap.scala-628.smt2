; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16118 () Bool)

(assert start!16118)

(declare-fun b!160361 () Bool)

(declare-fun b_free!3579 () Bool)

(declare-fun b_next!3579 () Bool)

(assert (=> b!160361 (= b_free!3579 (not b_next!3579))))

(declare-fun tp!13307 () Bool)

(declare-fun b_and!9993 () Bool)

(assert (=> b!160361 (= tp!13307 b_and!9993)))

(declare-fun b!160353 () Bool)

(declare-fun res!75914 () Bool)

(declare-fun e!104858 () Bool)

(assert (=> b!160353 (=> (not res!75914) (not e!104858))))

(declare-datatypes ((V!4155 0))(
  ( (V!4156 (val!1735 Int)) )
))
(declare-datatypes ((ValueCell!1347 0))(
  ( (ValueCellFull!1347 (v!3600 V!4155)) (EmptyCell!1347) )
))
(declare-datatypes ((array!5841 0))(
  ( (array!5842 (arr!2765 (Array (_ BitVec 32) (_ BitVec 64))) (size!3049 (_ BitVec 32))) )
))
(declare-datatypes ((array!5843 0))(
  ( (array!5844 (arr!2766 (Array (_ BitVec 32) ValueCell!1347)) (size!3050 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1602 0))(
  ( (LongMapFixedSize!1603 (defaultEntry!3243 Int) (mask!7811 (_ BitVec 32)) (extraKeys!2984 (_ BitVec 32)) (zeroValue!3086 V!4155) (minValue!3086 V!4155) (_size!850 (_ BitVec 32)) (_keys!5044 array!5841) (_values!3226 array!5843) (_vacant!850 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1602)

(assert (=> b!160353 (= res!75914 (and (= (size!3050 (_values!3226 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7811 thiss!1248))) (= (size!3049 (_keys!5044 thiss!1248)) (size!3050 (_values!3226 thiss!1248))) (bvsge (mask!7811 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2984 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2984 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!160354 () Bool)

(declare-fun e!104861 () Bool)

(declare-fun tp_is_empty!3381 () Bool)

(assert (=> b!160354 (= e!104861 tp_is_empty!3381)))

(declare-fun b!160355 () Bool)

(assert (=> b!160355 (= e!104858 false)))

(declare-fun lt!82081 () Bool)

(declare-datatypes ((List!1938 0))(
  ( (Nil!1935) (Cons!1934 (h!2547 (_ BitVec 64)) (t!6740 List!1938)) )
))
(declare-fun arrayNoDuplicates!0 (array!5841 (_ BitVec 32) List!1938) Bool)

(assert (=> b!160355 (= lt!82081 (arrayNoDuplicates!0 (_keys!5044 thiss!1248) #b00000000000000000000000000000000 Nil!1935))))

(declare-fun b!160356 () Bool)

(declare-fun res!75917 () Bool)

(assert (=> b!160356 (=> (not res!75917) (not e!104858))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!160356 (= res!75917 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!5759 () Bool)

(declare-fun mapRes!5759 () Bool)

(declare-fun tp!13306 () Bool)

(declare-fun e!104860 () Bool)

(assert (=> mapNonEmpty!5759 (= mapRes!5759 (and tp!13306 e!104860))))

(declare-fun mapKey!5759 () (_ BitVec 32))

(declare-fun mapRest!5759 () (Array (_ BitVec 32) ValueCell!1347))

(declare-fun mapValue!5759 () ValueCell!1347)

(assert (=> mapNonEmpty!5759 (= (arr!2766 (_values!3226 thiss!1248)) (store mapRest!5759 mapKey!5759 mapValue!5759))))

(declare-fun mapIsEmpty!5759 () Bool)

(assert (=> mapIsEmpty!5759 mapRes!5759))

(declare-fun b!160358 () Bool)

(declare-fun res!75911 () Bool)

(assert (=> b!160358 (=> (not res!75911) (not e!104858))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!160358 (= res!75911 (validMask!0 (mask!7811 thiss!1248)))))

(declare-fun b!160359 () Bool)

(declare-fun e!104862 () Bool)

(assert (=> b!160359 (= e!104862 (and e!104861 mapRes!5759))))

(declare-fun condMapEmpty!5759 () Bool)

(declare-fun mapDefault!5759 () ValueCell!1347)

(assert (=> b!160359 (= condMapEmpty!5759 (= (arr!2766 (_values!3226 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1347)) mapDefault!5759)))))

(declare-fun b!160360 () Bool)

(declare-fun res!75912 () Bool)

(assert (=> b!160360 (=> (not res!75912) (not e!104858))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5841 (_ BitVec 32)) Bool)

(assert (=> b!160360 (= res!75912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5044 thiss!1248) (mask!7811 thiss!1248)))))

(declare-fun e!104857 () Bool)

(declare-fun array_inv!1761 (array!5841) Bool)

(declare-fun array_inv!1762 (array!5843) Bool)

(assert (=> b!160361 (= e!104857 (and tp!13307 tp_is_empty!3381 (array_inv!1761 (_keys!5044 thiss!1248)) (array_inv!1762 (_values!3226 thiss!1248)) e!104862))))

(declare-fun res!75915 () Bool)

(assert (=> start!16118 (=> (not res!75915) (not e!104858))))

(declare-fun valid!742 (LongMapFixedSize!1602) Bool)

(assert (=> start!16118 (= res!75915 (valid!742 thiss!1248))))

(assert (=> start!16118 e!104858))

(assert (=> start!16118 e!104857))

(assert (=> start!16118 true))

(declare-fun b!160357 () Bool)

(declare-fun res!75916 () Bool)

(assert (=> b!160357 (=> (not res!75916) (not e!104858))))

(declare-datatypes ((tuple2!2914 0))(
  ( (tuple2!2915 (_1!1468 (_ BitVec 64)) (_2!1468 V!4155)) )
))
(declare-datatypes ((List!1939 0))(
  ( (Nil!1936) (Cons!1935 (h!2548 tuple2!2914) (t!6741 List!1939)) )
))
(declare-datatypes ((ListLongMap!1901 0))(
  ( (ListLongMap!1902 (toList!966 List!1939)) )
))
(declare-fun contains!1002 (ListLongMap!1901 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!630 (array!5841 array!5843 (_ BitVec 32) (_ BitVec 32) V!4155 V!4155 (_ BitVec 32) Int) ListLongMap!1901)

(assert (=> b!160357 (= res!75916 (not (contains!1002 (getCurrentListMap!630 (_keys!5044 thiss!1248) (_values!3226 thiss!1248) (mask!7811 thiss!1248) (extraKeys!2984 thiss!1248) (zeroValue!3086 thiss!1248) (minValue!3086 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3243 thiss!1248)) key!828)))))

(declare-fun b!160362 () Bool)

(assert (=> b!160362 (= e!104860 tp_is_empty!3381)))

(declare-fun b!160363 () Bool)

(declare-fun res!75913 () Bool)

(assert (=> b!160363 (=> (not res!75913) (not e!104858))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!329 0))(
  ( (MissingZero!329 (index!3484 (_ BitVec 32))) (Found!329 (index!3485 (_ BitVec 32))) (Intermediate!329 (undefined!1141 Bool) (index!3486 (_ BitVec 32)) (x!17697 (_ BitVec 32))) (Undefined!329) (MissingVacant!329 (index!3487 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5841 (_ BitVec 32)) SeekEntryResult!329)

(assert (=> b!160363 (= res!75913 ((_ is Undefined!329) (seekEntryOrOpen!0 key!828 (_keys!5044 thiss!1248) (mask!7811 thiss!1248))))))

(assert (= (and start!16118 res!75915) b!160356))

(assert (= (and b!160356 res!75917) b!160363))

(assert (= (and b!160363 res!75913) b!160357))

(assert (= (and b!160357 res!75916) b!160358))

(assert (= (and b!160358 res!75911) b!160353))

(assert (= (and b!160353 res!75914) b!160360))

(assert (= (and b!160360 res!75912) b!160355))

(assert (= (and b!160359 condMapEmpty!5759) mapIsEmpty!5759))

(assert (= (and b!160359 (not condMapEmpty!5759)) mapNonEmpty!5759))

(assert (= (and mapNonEmpty!5759 ((_ is ValueCellFull!1347) mapValue!5759)) b!160362))

(assert (= (and b!160359 ((_ is ValueCellFull!1347) mapDefault!5759)) b!160354))

(assert (= b!160361 b!160359))

(assert (= start!16118 b!160361))

(declare-fun m!192257 () Bool)

(assert (=> b!160355 m!192257))

(declare-fun m!192259 () Bool)

(assert (=> b!160358 m!192259))

(declare-fun m!192261 () Bool)

(assert (=> mapNonEmpty!5759 m!192261))

(declare-fun m!192263 () Bool)

(assert (=> start!16118 m!192263))

(declare-fun m!192265 () Bool)

(assert (=> b!160360 m!192265))

(declare-fun m!192267 () Bool)

(assert (=> b!160363 m!192267))

(declare-fun m!192269 () Bool)

(assert (=> b!160361 m!192269))

(declare-fun m!192271 () Bool)

(assert (=> b!160361 m!192271))

(declare-fun m!192273 () Bool)

(assert (=> b!160357 m!192273))

(assert (=> b!160357 m!192273))

(declare-fun m!192275 () Bool)

(assert (=> b!160357 m!192275))

(check-sat (not b!160361) (not b!160363) (not b!160358) tp_is_empty!3381 (not b_next!3579) (not mapNonEmpty!5759) (not start!16118) (not b!160357) (not b!160360) b_and!9993 (not b!160355))
(check-sat b_and!9993 (not b_next!3579))
