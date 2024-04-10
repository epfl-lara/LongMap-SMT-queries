; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77224 () Bool)

(assert start!77224)

(declare-fun b!901026 () Bool)

(declare-fun b_free!16065 () Bool)

(declare-fun b_next!16065 () Bool)

(assert (=> b!901026 (= b_free!16065 (not b_next!16065))))

(declare-fun tp!56291 () Bool)

(declare-fun b_and!26391 () Bool)

(assert (=> b!901026 (= tp!56291 b_and!26391)))

(declare-fun b!901022 () Bool)

(declare-fun e!504386 () Bool)

(declare-datatypes ((SeekEntryResult!8946 0))(
  ( (MissingZero!8946 (index!38155 (_ BitVec 32))) (Found!8946 (index!38156 (_ BitVec 32))) (Intermediate!8946 (undefined!9758 Bool) (index!38157 (_ BitVec 32)) (x!76769 (_ BitVec 32))) (Undefined!8946) (MissingVacant!8946 (index!38158 (_ BitVec 32))) )
))
(declare-fun lt!407209 () SeekEntryResult!8946)

(declare-datatypes ((array!52840 0))(
  ( (array!52841 (arr!25389 (Array (_ BitVec 32) (_ BitVec 64))) (size!25848 (_ BitVec 32))) )
))
(declare-datatypes ((V!29489 0))(
  ( (V!29490 (val!9247 Int)) )
))
(declare-datatypes ((ValueCell!8715 0))(
  ( (ValueCellFull!8715 (v!11746 V!29489)) (EmptyCell!8715) )
))
(declare-datatypes ((array!52842 0))(
  ( (array!52843 (arr!25390 (Array (_ BitVec 32) ValueCell!8715)) (size!25849 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4446 0))(
  ( (LongMapFixedSize!4447 (defaultEntry!5461 Int) (mask!26262 (_ BitVec 32)) (extraKeys!5189 (_ BitVec 32)) (zeroValue!5293 V!29489) (minValue!5293 V!29489) (_size!2278 (_ BitVec 32)) (_keys!10271 array!52840) (_values!5480 array!52842) (_vacant!2278 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4446)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!901022 (= e!504386 (inRange!0 (index!38156 lt!407209) (mask!26262 thiss!1181)))))

(declare-fun res!608399 () Bool)

(declare-fun e!504380 () Bool)

(assert (=> start!77224 (=> (not res!608399) (not e!504380))))

(declare-fun valid!1706 (LongMapFixedSize!4446) Bool)

(assert (=> start!77224 (= res!608399 (valid!1706 thiss!1181))))

(assert (=> start!77224 e!504380))

(declare-fun e!504378 () Bool)

(assert (=> start!77224 e!504378))

(assert (=> start!77224 true))

(declare-fun b!901023 () Bool)

(declare-fun e!504379 () Bool)

(declare-fun e!504383 () Bool)

(declare-fun mapRes!29272 () Bool)

(assert (=> b!901023 (= e!504379 (and e!504383 mapRes!29272))))

(declare-fun condMapEmpty!29272 () Bool)

(declare-fun mapDefault!29272 () ValueCell!8715)

(assert (=> b!901023 (= condMapEmpty!29272 (= (arr!25390 (_values!5480 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8715)) mapDefault!29272)))))

(declare-fun mapNonEmpty!29272 () Bool)

(declare-fun tp!56292 () Bool)

(declare-fun e!504381 () Bool)

(assert (=> mapNonEmpty!29272 (= mapRes!29272 (and tp!56292 e!504381))))

(declare-fun mapValue!29272 () ValueCell!8715)

(declare-fun mapRest!29272 () (Array (_ BitVec 32) ValueCell!8715))

(declare-fun mapKey!29272 () (_ BitVec 32))

(assert (=> mapNonEmpty!29272 (= (arr!25390 (_values!5480 thiss!1181)) (store mapRest!29272 mapKey!29272 mapValue!29272))))

(declare-fun b!901024 () Bool)

(declare-fun e!504384 () Bool)

(assert (=> b!901024 (= e!504380 (not e!504384))))

(declare-fun res!608396 () Bool)

(assert (=> b!901024 (=> res!608396 e!504384)))

(get-info :version)

(assert (=> b!901024 (= res!608396 (not ((_ is Found!8946) lt!407209)))))

(assert (=> b!901024 e!504386))

(declare-fun res!608397 () Bool)

(assert (=> b!901024 (=> res!608397 e!504386)))

(assert (=> b!901024 (= res!608397 (not ((_ is Found!8946) lt!407209)))))

(declare-datatypes ((Unit!30605 0))(
  ( (Unit!30606) )
))
(declare-fun lt!407206 () Unit!30605)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!107 (array!52840 array!52842 (_ BitVec 32) (_ BitVec 32) V!29489 V!29489 (_ BitVec 64)) Unit!30605)

(assert (=> b!901024 (= lt!407206 (lemmaSeekEntryGivesInRangeIndex!107 (_keys!10271 thiss!1181) (_values!5480 thiss!1181) (mask!26262 thiss!1181) (extraKeys!5189 thiss!1181) (zeroValue!5293 thiss!1181) (minValue!5293 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52840 (_ BitVec 32)) SeekEntryResult!8946)

(assert (=> b!901024 (= lt!407209 (seekEntry!0 key!785 (_keys!10271 thiss!1181) (mask!26262 thiss!1181)))))

(declare-fun b!901025 () Bool)

(declare-fun tp_is_empty!18393 () Bool)

(assert (=> b!901025 (= e!504383 tp_is_empty!18393)))

(declare-fun mapIsEmpty!29272 () Bool)

(assert (=> mapIsEmpty!29272 mapRes!29272))

(declare-fun array_inv!19916 (array!52840) Bool)

(declare-fun array_inv!19917 (array!52842) Bool)

(assert (=> b!901026 (= e!504378 (and tp!56291 tp_is_empty!18393 (array_inv!19916 (_keys!10271 thiss!1181)) (array_inv!19917 (_values!5480 thiss!1181)) e!504379))))

(declare-fun b!901027 () Bool)

(declare-fun res!608398 () Bool)

(declare-fun e!504382 () Bool)

(assert (=> b!901027 (=> res!608398 e!504382)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52840 (_ BitVec 32)) Bool)

(assert (=> b!901027 (= res!608398 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10271 thiss!1181) (mask!26262 thiss!1181))))))

(declare-fun b!901028 () Bool)

(assert (=> b!901028 (= e!504384 e!504382)))

(declare-fun res!608395 () Bool)

(assert (=> b!901028 (=> res!608395 e!504382)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!901028 (= res!608395 (not (validMask!0 (mask!26262 thiss!1181))))))

(declare-datatypes ((tuple2!12060 0))(
  ( (tuple2!12061 (_1!6041 (_ BitVec 64)) (_2!6041 V!29489)) )
))
(declare-datatypes ((List!17865 0))(
  ( (Nil!17862) (Cons!17861 (h!19007 tuple2!12060) (t!25222 List!17865)) )
))
(declare-datatypes ((ListLongMap!10757 0))(
  ( (ListLongMap!10758 (toList!5394 List!17865)) )
))
(declare-fun lt!407208 () ListLongMap!10757)

(declare-fun contains!4433 (ListLongMap!10757 (_ BitVec 64)) Bool)

(assert (=> b!901028 (contains!4433 lt!407208 (select (arr!25389 (_keys!10271 thiss!1181)) (index!38156 lt!407209)))))

(declare-fun getCurrentListMap!2667 (array!52840 array!52842 (_ BitVec 32) (_ BitVec 32) V!29489 V!29489 (_ BitVec 32) Int) ListLongMap!10757)

(assert (=> b!901028 (= lt!407208 (getCurrentListMap!2667 (_keys!10271 thiss!1181) (_values!5480 thiss!1181) (mask!26262 thiss!1181) (extraKeys!5189 thiss!1181) (zeroValue!5293 thiss!1181) (minValue!5293 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5461 thiss!1181)))))

(declare-fun lt!407205 () Unit!30605)

(declare-fun lemmaValidKeyInArrayIsInListMap!256 (array!52840 array!52842 (_ BitVec 32) (_ BitVec 32) V!29489 V!29489 (_ BitVec 32) Int) Unit!30605)

(assert (=> b!901028 (= lt!407205 (lemmaValidKeyInArrayIsInListMap!256 (_keys!10271 thiss!1181) (_values!5480 thiss!1181) (mask!26262 thiss!1181) (extraKeys!5189 thiss!1181) (zeroValue!5293 thiss!1181) (minValue!5293 thiss!1181) (index!38156 lt!407209) (defaultEntry!5461 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52840 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!901028 (arrayContainsKey!0 (_keys!10271 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!407207 () Unit!30605)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52840 (_ BitVec 64) (_ BitVec 32)) Unit!30605)

(assert (=> b!901028 (= lt!407207 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10271 thiss!1181) key!785 (index!38156 lt!407209)))))

(declare-fun b!901029 () Bool)

(declare-fun res!608402 () Bool)

(assert (=> b!901029 (=> res!608402 e!504382)))

(assert (=> b!901029 (= res!608402 (not (contains!4433 lt!407208 key!785)))))

(declare-fun b!901030 () Bool)

(assert (=> b!901030 (= e!504382 (inRange!0 (index!38156 lt!407209) (mask!26262 thiss!1181)))))

(declare-fun b!901031 () Bool)

(declare-fun res!608400 () Bool)

(assert (=> b!901031 (=> (not res!608400) (not e!504380))))

(assert (=> b!901031 (= res!608400 (not (= key!785 (bvneg key!785))))))

(declare-fun b!901032 () Bool)

(declare-fun res!608401 () Bool)

(assert (=> b!901032 (=> res!608401 e!504382)))

(declare-datatypes ((List!17866 0))(
  ( (Nil!17863) (Cons!17862 (h!19008 (_ BitVec 64)) (t!25223 List!17866)) )
))
(declare-fun arrayNoDuplicates!0 (array!52840 (_ BitVec 32) List!17866) Bool)

(assert (=> b!901032 (= res!608401 (not (arrayNoDuplicates!0 (_keys!10271 thiss!1181) #b00000000000000000000000000000000 Nil!17863)))))

(declare-fun b!901033 () Bool)

(declare-fun res!608394 () Bool)

(assert (=> b!901033 (=> res!608394 e!504382)))

(assert (=> b!901033 (= res!608394 (or (not (= (size!25849 (_values!5480 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26262 thiss!1181)))) (not (= (size!25848 (_keys!10271 thiss!1181)) (size!25849 (_values!5480 thiss!1181)))) (bvslt (mask!26262 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5189 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!5189 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!901034 () Bool)

(assert (=> b!901034 (= e!504381 tp_is_empty!18393)))

(assert (= (and start!77224 res!608399) b!901031))

(assert (= (and b!901031 res!608400) b!901024))

(assert (= (and b!901024 (not res!608397)) b!901022))

(assert (= (and b!901024 (not res!608396)) b!901028))

(assert (= (and b!901028 (not res!608395)) b!901033))

(assert (= (and b!901033 (not res!608394)) b!901027))

(assert (= (and b!901027 (not res!608398)) b!901032))

(assert (= (and b!901032 (not res!608401)) b!901029))

(assert (= (and b!901029 (not res!608402)) b!901030))

(assert (= (and b!901023 condMapEmpty!29272) mapIsEmpty!29272))

(assert (= (and b!901023 (not condMapEmpty!29272)) mapNonEmpty!29272))

(assert (= (and mapNonEmpty!29272 ((_ is ValueCellFull!8715) mapValue!29272)) b!901034))

(assert (= (and b!901023 ((_ is ValueCellFull!8715) mapDefault!29272)) b!901025))

(assert (= b!901026 b!901023))

(assert (= start!77224 b!901026))

(declare-fun m!837367 () Bool)

(assert (=> b!901026 m!837367))

(declare-fun m!837369 () Bool)

(assert (=> b!901026 m!837369))

(declare-fun m!837371 () Bool)

(assert (=> b!901030 m!837371))

(declare-fun m!837373 () Bool)

(assert (=> b!901027 m!837373))

(assert (=> b!901022 m!837371))

(declare-fun m!837375 () Bool)

(assert (=> start!77224 m!837375))

(declare-fun m!837377 () Bool)

(assert (=> b!901024 m!837377))

(declare-fun m!837379 () Bool)

(assert (=> b!901024 m!837379))

(declare-fun m!837381 () Bool)

(assert (=> b!901028 m!837381))

(declare-fun m!837383 () Bool)

(assert (=> b!901028 m!837383))

(declare-fun m!837385 () Bool)

(assert (=> b!901028 m!837385))

(declare-fun m!837387 () Bool)

(assert (=> b!901028 m!837387))

(declare-fun m!837389 () Bool)

(assert (=> b!901028 m!837389))

(declare-fun m!837391 () Bool)

(assert (=> b!901028 m!837391))

(assert (=> b!901028 m!837385))

(declare-fun m!837393 () Bool)

(assert (=> b!901028 m!837393))

(declare-fun m!837395 () Bool)

(assert (=> b!901032 m!837395))

(declare-fun m!837397 () Bool)

(assert (=> mapNonEmpty!29272 m!837397))

(declare-fun m!837399 () Bool)

(assert (=> b!901029 m!837399))

(check-sat (not b!901029) (not mapNonEmpty!29272) (not b!901024) (not b!901028) (not b!901032) (not start!77224) (not b!901022) (not b!901026) (not b!901030) tp_is_empty!18393 (not b_next!16065) (not b!901027) b_and!26391)
(check-sat b_and!26391 (not b_next!16065))
