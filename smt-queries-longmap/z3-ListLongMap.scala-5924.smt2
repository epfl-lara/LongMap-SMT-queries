; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77290 () Bool)

(assert start!77290)

(declare-fun b!901156 () Bool)

(declare-fun b_free!16045 () Bool)

(declare-fun b_next!16045 () Bool)

(assert (=> b!901156 (= b_free!16045 (not b_next!16045))))

(declare-fun tp!56224 () Bool)

(declare-fun b_and!26375 () Bool)

(assert (=> b!901156 (= tp!56224 b_and!26375)))

(declare-fun mapIsEmpty!29233 () Bool)

(declare-fun mapRes!29233 () Bool)

(assert (=> mapIsEmpty!29233 mapRes!29233))

(declare-fun res!608327 () Bool)

(declare-fun e!504414 () Bool)

(assert (=> start!77290 (=> (not res!608327) (not e!504414))))

(declare-datatypes ((array!52833 0))(
  ( (array!52834 (arr!25384 (Array (_ BitVec 32) (_ BitVec 64))) (size!25844 (_ BitVec 32))) )
))
(declare-datatypes ((V!29463 0))(
  ( (V!29464 (val!9237 Int)) )
))
(declare-datatypes ((ValueCell!8705 0))(
  ( (ValueCellFull!8705 (v!11730 V!29463)) (EmptyCell!8705) )
))
(declare-datatypes ((array!52835 0))(
  ( (array!52836 (arr!25385 (Array (_ BitVec 32) ValueCell!8705)) (size!25845 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4426 0))(
  ( (LongMapFixedSize!4427 (defaultEntry!5445 Int) (mask!26268 (_ BitVec 32)) (extraKeys!5170 (_ BitVec 32)) (zeroValue!5274 V!29463) (minValue!5274 V!29463) (_size!2268 (_ BitVec 32)) (_keys!10274 array!52833) (_values!5461 array!52835) (_vacant!2268 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4426)

(declare-fun valid!1712 (LongMapFixedSize!4426) Bool)

(assert (=> start!77290 (= res!608327 (valid!1712 thiss!1181))))

(assert (=> start!77290 e!504414))

(declare-fun e!504413 () Bool)

(assert (=> start!77290 e!504413))

(assert (=> start!77290 true))

(declare-fun b!901151 () Bool)

(declare-fun e!504415 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52833 (_ BitVec 32)) Bool)

(assert (=> b!901151 (= e!504415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10274 thiss!1181) (mask!26268 thiss!1181)))))

(declare-fun b!901152 () Bool)

(declare-fun e!504417 () Bool)

(declare-datatypes ((SeekEntryResult!8892 0))(
  ( (MissingZero!8892 (index!37939 (_ BitVec 32))) (Found!8892 (index!37940 (_ BitVec 32))) (Intermediate!8892 (undefined!9704 Bool) (index!37941 (_ BitVec 32)) (x!76675 (_ BitVec 32))) (Undefined!8892) (MissingVacant!8892 (index!37942 (_ BitVec 32))) )
))
(declare-fun lt!407096 () SeekEntryResult!8892)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!901152 (= e!504417 (inRange!0 (index!37940 lt!407096) (mask!26268 thiss!1181)))))

(declare-fun b!901153 () Bool)

(declare-fun e!504419 () Bool)

(declare-fun tp_is_empty!18373 () Bool)

(assert (=> b!901153 (= e!504419 tp_is_empty!18373)))

(declare-fun b!901154 () Bool)

(declare-fun res!608330 () Bool)

(assert (=> b!901154 (=> res!608330 e!504415)))

(assert (=> b!901154 (= res!608330 (or (not (= (size!25845 (_values!5461 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26268 thiss!1181)))) (not (= (size!25844 (_keys!10274 thiss!1181)) (size!25845 (_values!5461 thiss!1181)))) (bvslt (mask!26268 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5170 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!5170 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!901155 () Bool)

(declare-fun e!504416 () Bool)

(assert (=> b!901155 (= e!504416 e!504415)))

(declare-fun res!608329 () Bool)

(assert (=> b!901155 (=> res!608329 e!504415)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!901155 (= res!608329 (not (validMask!0 (mask!26268 thiss!1181))))))

(declare-datatypes ((tuple2!11974 0))(
  ( (tuple2!11975 (_1!5998 (_ BitVec 64)) (_2!5998 V!29463)) )
))
(declare-datatypes ((List!17807 0))(
  ( (Nil!17804) (Cons!17803 (h!18955 tuple2!11974) (t!25150 List!17807)) )
))
(declare-datatypes ((ListLongMap!10673 0))(
  ( (ListLongMap!10674 (toList!5352 List!17807)) )
))
(declare-fun contains!4401 (ListLongMap!10673 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2624 (array!52833 array!52835 (_ BitVec 32) (_ BitVec 32) V!29463 V!29463 (_ BitVec 32) Int) ListLongMap!10673)

(assert (=> b!901155 (contains!4401 (getCurrentListMap!2624 (_keys!10274 thiss!1181) (_values!5461 thiss!1181) (mask!26268 thiss!1181) (extraKeys!5170 thiss!1181) (zeroValue!5274 thiss!1181) (minValue!5274 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5445 thiss!1181)) (select (arr!25384 (_keys!10274 thiss!1181)) (index!37940 lt!407096)))))

(declare-datatypes ((Unit!30580 0))(
  ( (Unit!30581) )
))
(declare-fun lt!407095 () Unit!30580)

(declare-fun lemmaValidKeyInArrayIsInListMap!254 (array!52833 array!52835 (_ BitVec 32) (_ BitVec 32) V!29463 V!29463 (_ BitVec 32) Int) Unit!30580)

(assert (=> b!901155 (= lt!407095 (lemmaValidKeyInArrayIsInListMap!254 (_keys!10274 thiss!1181) (_values!5461 thiss!1181) (mask!26268 thiss!1181) (extraKeys!5170 thiss!1181) (zeroValue!5274 thiss!1181) (minValue!5274 thiss!1181) (index!37940 lt!407096) (defaultEntry!5445 thiss!1181)))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52833 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!901155 (arrayContainsKey!0 (_keys!10274 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!407097 () Unit!30580)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52833 (_ BitVec 64) (_ BitVec 32)) Unit!30580)

(assert (=> b!901155 (= lt!407097 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10274 thiss!1181) key!785 (index!37940 lt!407096)))))

(declare-fun e!504418 () Bool)

(declare-fun array_inv!19970 (array!52833) Bool)

(declare-fun array_inv!19971 (array!52835) Bool)

(assert (=> b!901156 (= e!504413 (and tp!56224 tp_is_empty!18373 (array_inv!19970 (_keys!10274 thiss!1181)) (array_inv!19971 (_values!5461 thiss!1181)) e!504418))))

(declare-fun mapNonEmpty!29233 () Bool)

(declare-fun tp!56223 () Bool)

(assert (=> mapNonEmpty!29233 (= mapRes!29233 (and tp!56223 e!504419))))

(declare-fun mapValue!29233 () ValueCell!8705)

(declare-fun mapRest!29233 () (Array (_ BitVec 32) ValueCell!8705))

(declare-fun mapKey!29233 () (_ BitVec 32))

(assert (=> mapNonEmpty!29233 (= (arr!25385 (_values!5461 thiss!1181)) (store mapRest!29233 mapKey!29233 mapValue!29233))))

(declare-fun b!901157 () Bool)

(assert (=> b!901157 (= e!504414 (not e!504416))))

(declare-fun res!608331 () Bool)

(assert (=> b!901157 (=> res!608331 e!504416)))

(get-info :version)

(assert (=> b!901157 (= res!608331 (not ((_ is Found!8892) lt!407096)))))

(assert (=> b!901157 e!504417))

(declare-fun res!608328 () Bool)

(assert (=> b!901157 (=> res!608328 e!504417)))

(assert (=> b!901157 (= res!608328 (not ((_ is Found!8892) lt!407096)))))

(declare-fun lt!407098 () Unit!30580)

(declare-fun lemmaSeekEntryGivesInRangeIndex!111 (array!52833 array!52835 (_ BitVec 32) (_ BitVec 32) V!29463 V!29463 (_ BitVec 64)) Unit!30580)

(assert (=> b!901157 (= lt!407098 (lemmaSeekEntryGivesInRangeIndex!111 (_keys!10274 thiss!1181) (_values!5461 thiss!1181) (mask!26268 thiss!1181) (extraKeys!5170 thiss!1181) (zeroValue!5274 thiss!1181) (minValue!5274 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52833 (_ BitVec 32)) SeekEntryResult!8892)

(assert (=> b!901157 (= lt!407096 (seekEntry!0 key!785 (_keys!10274 thiss!1181) (mask!26268 thiss!1181)))))

(declare-fun b!901158 () Bool)

(declare-fun res!608326 () Bool)

(assert (=> b!901158 (=> (not res!608326) (not e!504414))))

(assert (=> b!901158 (= res!608326 (not (= key!785 (bvneg key!785))))))

(declare-fun b!901159 () Bool)

(declare-fun e!504412 () Bool)

(assert (=> b!901159 (= e!504412 tp_is_empty!18373)))

(declare-fun b!901160 () Bool)

(assert (=> b!901160 (= e!504418 (and e!504412 mapRes!29233))))

(declare-fun condMapEmpty!29233 () Bool)

(declare-fun mapDefault!29233 () ValueCell!8705)

(assert (=> b!901160 (= condMapEmpty!29233 (= (arr!25385 (_values!5461 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8705)) mapDefault!29233)))))

(assert (= (and start!77290 res!608327) b!901158))

(assert (= (and b!901158 res!608326) b!901157))

(assert (= (and b!901157 (not res!608328)) b!901152))

(assert (= (and b!901157 (not res!608331)) b!901155))

(assert (= (and b!901155 (not res!608329)) b!901154))

(assert (= (and b!901154 (not res!608330)) b!901151))

(assert (= (and b!901160 condMapEmpty!29233) mapIsEmpty!29233))

(assert (= (and b!901160 (not condMapEmpty!29233)) mapNonEmpty!29233))

(assert (= (and mapNonEmpty!29233 ((_ is ValueCellFull!8705) mapValue!29233)) b!901153))

(assert (= (and b!901160 ((_ is ValueCellFull!8705) mapDefault!29233)) b!901159))

(assert (= b!901156 b!901160))

(assert (= start!77290 b!901156))

(declare-fun m!838019 () Bool)

(assert (=> b!901157 m!838019))

(declare-fun m!838021 () Bool)

(assert (=> b!901157 m!838021))

(declare-fun m!838023 () Bool)

(assert (=> b!901151 m!838023))

(declare-fun m!838025 () Bool)

(assert (=> start!77290 m!838025))

(declare-fun m!838027 () Bool)

(assert (=> b!901155 m!838027))

(declare-fun m!838029 () Bool)

(assert (=> b!901155 m!838029))

(declare-fun m!838031 () Bool)

(assert (=> b!901155 m!838031))

(declare-fun m!838033 () Bool)

(assert (=> b!901155 m!838033))

(declare-fun m!838035 () Bool)

(assert (=> b!901155 m!838035))

(declare-fun m!838037 () Bool)

(assert (=> b!901155 m!838037))

(assert (=> b!901155 m!838027))

(assert (=> b!901155 m!838029))

(declare-fun m!838039 () Bool)

(assert (=> b!901155 m!838039))

(declare-fun m!838041 () Bool)

(assert (=> b!901156 m!838041))

(declare-fun m!838043 () Bool)

(assert (=> b!901156 m!838043))

(declare-fun m!838045 () Bool)

(assert (=> b!901152 m!838045))

(declare-fun m!838047 () Bool)

(assert (=> mapNonEmpty!29233 m!838047))

(check-sat (not mapNonEmpty!29233) (not b!901152) b_and!26375 (not b!901151) (not start!77290) tp_is_empty!18373 (not b!901155) (not b!901156) (not b_next!16045) (not b!901157))
(check-sat b_and!26375 (not b_next!16045))
(get-model)

(declare-fun b!901229 () Bool)

(declare-fun e!504481 () Bool)

(declare-fun e!504483 () Bool)

(assert (=> b!901229 (= e!504481 e!504483)))

(declare-fun c!95598 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!901229 (= c!95598 (validKeyInArray!0 (select (arr!25384 (_keys!10274 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!112027 () Bool)

(declare-fun res!608372 () Bool)

(assert (=> d!112027 (=> res!608372 e!504481)))

(assert (=> d!112027 (= res!608372 (bvsge #b00000000000000000000000000000000 (size!25844 (_keys!10274 thiss!1181))))))

(assert (=> d!112027 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10274 thiss!1181) (mask!26268 thiss!1181)) e!504481)))

(declare-fun b!901230 () Bool)

(declare-fun e!504482 () Bool)

(assert (=> b!901230 (= e!504483 e!504482)))

(declare-fun lt!407130 () (_ BitVec 64))

(assert (=> b!901230 (= lt!407130 (select (arr!25384 (_keys!10274 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407129 () Unit!30580)

(assert (=> b!901230 (= lt!407129 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10274 thiss!1181) lt!407130 #b00000000000000000000000000000000))))

(assert (=> b!901230 (arrayContainsKey!0 (_keys!10274 thiss!1181) lt!407130 #b00000000000000000000000000000000)))

(declare-fun lt!407131 () Unit!30580)

(assert (=> b!901230 (= lt!407131 lt!407129)))

(declare-fun res!608373 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52833 (_ BitVec 32)) SeekEntryResult!8892)

(assert (=> b!901230 (= res!608373 (= (seekEntryOrOpen!0 (select (arr!25384 (_keys!10274 thiss!1181)) #b00000000000000000000000000000000) (_keys!10274 thiss!1181) (mask!26268 thiss!1181)) (Found!8892 #b00000000000000000000000000000000)))))

(assert (=> b!901230 (=> (not res!608373) (not e!504482))))

(declare-fun bm!40054 () Bool)

(declare-fun call!40057 () Bool)

(assert (=> bm!40054 (= call!40057 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10274 thiss!1181) (mask!26268 thiss!1181)))))

(declare-fun b!901231 () Bool)

(assert (=> b!901231 (= e!504483 call!40057)))

(declare-fun b!901232 () Bool)

(assert (=> b!901232 (= e!504482 call!40057)))

(assert (= (and d!112027 (not res!608372)) b!901229))

(assert (= (and b!901229 c!95598) b!901230))

(assert (= (and b!901229 (not c!95598)) b!901231))

(assert (= (and b!901230 res!608373) b!901232))

(assert (= (or b!901232 b!901231) bm!40054))

(declare-fun m!838109 () Bool)

(assert (=> b!901229 m!838109))

(assert (=> b!901229 m!838109))

(declare-fun m!838111 () Bool)

(assert (=> b!901229 m!838111))

(assert (=> b!901230 m!838109))

(declare-fun m!838113 () Bool)

(assert (=> b!901230 m!838113))

(declare-fun m!838115 () Bool)

(assert (=> b!901230 m!838115))

(assert (=> b!901230 m!838109))

(declare-fun m!838117 () Bool)

(assert (=> b!901230 m!838117))

(declare-fun m!838119 () Bool)

(assert (=> bm!40054 m!838119))

(assert (=> b!901151 d!112027))

(declare-fun d!112029 () Bool)

(assert (=> d!112029 (= (array_inv!19970 (_keys!10274 thiss!1181)) (bvsge (size!25844 (_keys!10274 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!901156 d!112029))

(declare-fun d!112031 () Bool)

(assert (=> d!112031 (= (array_inv!19971 (_values!5461 thiss!1181)) (bvsge (size!25845 (_values!5461 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!901156 d!112031))

(declare-fun d!112033 () Bool)

(declare-fun e!504486 () Bool)

(assert (=> d!112033 e!504486))

(declare-fun res!608376 () Bool)

(assert (=> d!112033 (=> res!608376 e!504486)))

(declare-fun lt!407137 () SeekEntryResult!8892)

(assert (=> d!112033 (= res!608376 (not ((_ is Found!8892) lt!407137)))))

(assert (=> d!112033 (= lt!407137 (seekEntry!0 key!785 (_keys!10274 thiss!1181) (mask!26268 thiss!1181)))))

(declare-fun lt!407136 () Unit!30580)

(declare-fun choose!1518 (array!52833 array!52835 (_ BitVec 32) (_ BitVec 32) V!29463 V!29463 (_ BitVec 64)) Unit!30580)

(assert (=> d!112033 (= lt!407136 (choose!1518 (_keys!10274 thiss!1181) (_values!5461 thiss!1181) (mask!26268 thiss!1181) (extraKeys!5170 thiss!1181) (zeroValue!5274 thiss!1181) (minValue!5274 thiss!1181) key!785))))

(assert (=> d!112033 (validMask!0 (mask!26268 thiss!1181))))

(assert (=> d!112033 (= (lemmaSeekEntryGivesInRangeIndex!111 (_keys!10274 thiss!1181) (_values!5461 thiss!1181) (mask!26268 thiss!1181) (extraKeys!5170 thiss!1181) (zeroValue!5274 thiss!1181) (minValue!5274 thiss!1181) key!785) lt!407136)))

(declare-fun b!901235 () Bool)

(assert (=> b!901235 (= e!504486 (inRange!0 (index!37940 lt!407137) (mask!26268 thiss!1181)))))

(assert (= (and d!112033 (not res!608376)) b!901235))

(assert (=> d!112033 m!838021))

(declare-fun m!838121 () Bool)

(assert (=> d!112033 m!838121))

(assert (=> d!112033 m!838037))

(declare-fun m!838123 () Bool)

(assert (=> b!901235 m!838123))

(assert (=> b!901157 d!112033))

(declare-fun d!112035 () Bool)

(declare-fun lt!407146 () SeekEntryResult!8892)

(assert (=> d!112035 (and (or ((_ is MissingVacant!8892) lt!407146) (not ((_ is Found!8892) lt!407146)) (and (bvsge (index!37940 lt!407146) #b00000000000000000000000000000000) (bvslt (index!37940 lt!407146) (size!25844 (_keys!10274 thiss!1181))))) (not ((_ is MissingVacant!8892) lt!407146)) (or (not ((_ is Found!8892) lt!407146)) (= (select (arr!25384 (_keys!10274 thiss!1181)) (index!37940 lt!407146)) key!785)))))

(declare-fun e!504494 () SeekEntryResult!8892)

(assert (=> d!112035 (= lt!407146 e!504494)))

(declare-fun c!95607 () Bool)

(declare-fun lt!407149 () SeekEntryResult!8892)

(assert (=> d!112035 (= c!95607 (and ((_ is Intermediate!8892) lt!407149) (undefined!9704 lt!407149)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52833 (_ BitVec 32)) SeekEntryResult!8892)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!112035 (= lt!407149 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26268 thiss!1181)) key!785 (_keys!10274 thiss!1181) (mask!26268 thiss!1181)))))

(assert (=> d!112035 (validMask!0 (mask!26268 thiss!1181))))

(assert (=> d!112035 (= (seekEntry!0 key!785 (_keys!10274 thiss!1181) (mask!26268 thiss!1181)) lt!407146)))

(declare-fun b!901248 () Bool)

(declare-fun e!504495 () SeekEntryResult!8892)

(assert (=> b!901248 (= e!504494 e!504495)))

(declare-fun lt!407147 () (_ BitVec 64))

(assert (=> b!901248 (= lt!407147 (select (arr!25384 (_keys!10274 thiss!1181)) (index!37941 lt!407149)))))

(declare-fun c!95606 () Bool)

(assert (=> b!901248 (= c!95606 (= lt!407147 key!785))))

(declare-fun b!901249 () Bool)

(assert (=> b!901249 (= e!504494 Undefined!8892)))

(declare-fun b!901250 () Bool)

(assert (=> b!901250 (= e!504495 (Found!8892 (index!37941 lt!407149)))))

(declare-fun b!901251 () Bool)

(declare-fun c!95605 () Bool)

(assert (=> b!901251 (= c!95605 (= lt!407147 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!504493 () SeekEntryResult!8892)

(assert (=> b!901251 (= e!504495 e!504493)))

(declare-fun b!901252 () Bool)

(declare-fun lt!407148 () SeekEntryResult!8892)

(assert (=> b!901252 (= e!504493 (ite ((_ is MissingVacant!8892) lt!407148) (MissingZero!8892 (index!37942 lt!407148)) lt!407148))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52833 (_ BitVec 32)) SeekEntryResult!8892)

(assert (=> b!901252 (= lt!407148 (seekKeyOrZeroReturnVacant!0 (x!76675 lt!407149) (index!37941 lt!407149) (index!37941 lt!407149) key!785 (_keys!10274 thiss!1181) (mask!26268 thiss!1181)))))

(declare-fun b!901253 () Bool)

(assert (=> b!901253 (= e!504493 (MissingZero!8892 (index!37941 lt!407149)))))

(assert (= (and d!112035 c!95607) b!901249))

(assert (= (and d!112035 (not c!95607)) b!901248))

(assert (= (and b!901248 c!95606) b!901250))

(assert (= (and b!901248 (not c!95606)) b!901251))

(assert (= (and b!901251 c!95605) b!901253))

(assert (= (and b!901251 (not c!95605)) b!901252))

(declare-fun m!838125 () Bool)

(assert (=> d!112035 m!838125))

(declare-fun m!838127 () Bool)

(assert (=> d!112035 m!838127))

(assert (=> d!112035 m!838127))

(declare-fun m!838129 () Bool)

(assert (=> d!112035 m!838129))

(assert (=> d!112035 m!838037))

(declare-fun m!838131 () Bool)

(assert (=> b!901248 m!838131))

(declare-fun m!838133 () Bool)

(assert (=> b!901252 m!838133))

(assert (=> b!901157 d!112035))

(declare-fun d!112037 () Bool)

(assert (=> d!112037 (= (inRange!0 (index!37940 lt!407096) (mask!26268 thiss!1181)) (and (bvsge (index!37940 lt!407096) #b00000000000000000000000000000000) (bvslt (index!37940 lt!407096) (bvadd (mask!26268 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!901152 d!112037))

(declare-fun d!112039 () Bool)

(declare-fun e!504498 () Bool)

(assert (=> d!112039 e!504498))

(declare-fun res!608379 () Bool)

(assert (=> d!112039 (=> (not res!608379) (not e!504498))))

(assert (=> d!112039 (= res!608379 (and (bvsge (index!37940 lt!407096) #b00000000000000000000000000000000) (bvslt (index!37940 lt!407096) (size!25844 (_keys!10274 thiss!1181)))))))

(declare-fun lt!407152 () Unit!30580)

(declare-fun choose!1519 (array!52833 array!52835 (_ BitVec 32) (_ BitVec 32) V!29463 V!29463 (_ BitVec 32) Int) Unit!30580)

(assert (=> d!112039 (= lt!407152 (choose!1519 (_keys!10274 thiss!1181) (_values!5461 thiss!1181) (mask!26268 thiss!1181) (extraKeys!5170 thiss!1181) (zeroValue!5274 thiss!1181) (minValue!5274 thiss!1181) (index!37940 lt!407096) (defaultEntry!5445 thiss!1181)))))

(assert (=> d!112039 (validMask!0 (mask!26268 thiss!1181))))

(assert (=> d!112039 (= (lemmaValidKeyInArrayIsInListMap!254 (_keys!10274 thiss!1181) (_values!5461 thiss!1181) (mask!26268 thiss!1181) (extraKeys!5170 thiss!1181) (zeroValue!5274 thiss!1181) (minValue!5274 thiss!1181) (index!37940 lt!407096) (defaultEntry!5445 thiss!1181)) lt!407152)))

(declare-fun b!901256 () Bool)

(assert (=> b!901256 (= e!504498 (contains!4401 (getCurrentListMap!2624 (_keys!10274 thiss!1181) (_values!5461 thiss!1181) (mask!26268 thiss!1181) (extraKeys!5170 thiss!1181) (zeroValue!5274 thiss!1181) (minValue!5274 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5445 thiss!1181)) (select (arr!25384 (_keys!10274 thiss!1181)) (index!37940 lt!407096))))))

(assert (= (and d!112039 res!608379) b!901256))

(declare-fun m!838135 () Bool)

(assert (=> d!112039 m!838135))

(assert (=> d!112039 m!838037))

(assert (=> b!901256 m!838027))

(assert (=> b!901256 m!838029))

(assert (=> b!901256 m!838027))

(assert (=> b!901256 m!838029))

(assert (=> b!901256 m!838031))

(assert (=> b!901155 d!112039))

(declare-fun d!112041 () Bool)

(assert (=> d!112041 (arrayContainsKey!0 (_keys!10274 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!407155 () Unit!30580)

(declare-fun choose!13 (array!52833 (_ BitVec 64) (_ BitVec 32)) Unit!30580)

(assert (=> d!112041 (= lt!407155 (choose!13 (_keys!10274 thiss!1181) key!785 (index!37940 lt!407096)))))

(assert (=> d!112041 (bvsge (index!37940 lt!407096) #b00000000000000000000000000000000)))

(assert (=> d!112041 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10274 thiss!1181) key!785 (index!37940 lt!407096)) lt!407155)))

(declare-fun bs!25299 () Bool)

(assert (= bs!25299 d!112041))

(assert (=> bs!25299 m!838035))

(declare-fun m!838137 () Bool)

(assert (=> bs!25299 m!838137))

(assert (=> b!901155 d!112041))

(declare-fun d!112043 () Bool)

(declare-fun e!504503 () Bool)

(assert (=> d!112043 e!504503))

(declare-fun res!608382 () Bool)

(assert (=> d!112043 (=> res!608382 e!504503)))

(declare-fun lt!407165 () Bool)

(assert (=> d!112043 (= res!608382 (not lt!407165))))

(declare-fun lt!407164 () Bool)

(assert (=> d!112043 (= lt!407165 lt!407164)))

(declare-fun lt!407166 () Unit!30580)

(declare-fun e!504504 () Unit!30580)

(assert (=> d!112043 (= lt!407166 e!504504)))

(declare-fun c!95610 () Bool)

(assert (=> d!112043 (= c!95610 lt!407164)))

(declare-fun containsKey!432 (List!17807 (_ BitVec 64)) Bool)

(assert (=> d!112043 (= lt!407164 (containsKey!432 (toList!5352 (getCurrentListMap!2624 (_keys!10274 thiss!1181) (_values!5461 thiss!1181) (mask!26268 thiss!1181) (extraKeys!5170 thiss!1181) (zeroValue!5274 thiss!1181) (minValue!5274 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5445 thiss!1181))) (select (arr!25384 (_keys!10274 thiss!1181)) (index!37940 lt!407096))))))

(assert (=> d!112043 (= (contains!4401 (getCurrentListMap!2624 (_keys!10274 thiss!1181) (_values!5461 thiss!1181) (mask!26268 thiss!1181) (extraKeys!5170 thiss!1181) (zeroValue!5274 thiss!1181) (minValue!5274 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5445 thiss!1181)) (select (arr!25384 (_keys!10274 thiss!1181)) (index!37940 lt!407096))) lt!407165)))

(declare-fun b!901263 () Bool)

(declare-fun lt!407167 () Unit!30580)

(assert (=> b!901263 (= e!504504 lt!407167)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!326 (List!17807 (_ BitVec 64)) Unit!30580)

(assert (=> b!901263 (= lt!407167 (lemmaContainsKeyImpliesGetValueByKeyDefined!326 (toList!5352 (getCurrentListMap!2624 (_keys!10274 thiss!1181) (_values!5461 thiss!1181) (mask!26268 thiss!1181) (extraKeys!5170 thiss!1181) (zeroValue!5274 thiss!1181) (minValue!5274 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5445 thiss!1181))) (select (arr!25384 (_keys!10274 thiss!1181)) (index!37940 lt!407096))))))

(declare-datatypes ((Option!465 0))(
  ( (Some!464 (v!11733 V!29463)) (None!463) )
))
(declare-fun isDefined!334 (Option!465) Bool)

(declare-fun getValueByKey!459 (List!17807 (_ BitVec 64)) Option!465)

(assert (=> b!901263 (isDefined!334 (getValueByKey!459 (toList!5352 (getCurrentListMap!2624 (_keys!10274 thiss!1181) (_values!5461 thiss!1181) (mask!26268 thiss!1181) (extraKeys!5170 thiss!1181) (zeroValue!5274 thiss!1181) (minValue!5274 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5445 thiss!1181))) (select (arr!25384 (_keys!10274 thiss!1181)) (index!37940 lt!407096))))))

(declare-fun b!901264 () Bool)

(declare-fun Unit!30584 () Unit!30580)

(assert (=> b!901264 (= e!504504 Unit!30584)))

(declare-fun b!901265 () Bool)

(assert (=> b!901265 (= e!504503 (isDefined!334 (getValueByKey!459 (toList!5352 (getCurrentListMap!2624 (_keys!10274 thiss!1181) (_values!5461 thiss!1181) (mask!26268 thiss!1181) (extraKeys!5170 thiss!1181) (zeroValue!5274 thiss!1181) (minValue!5274 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5445 thiss!1181))) (select (arr!25384 (_keys!10274 thiss!1181)) (index!37940 lt!407096)))))))

(assert (= (and d!112043 c!95610) b!901263))

(assert (= (and d!112043 (not c!95610)) b!901264))

(assert (= (and d!112043 (not res!608382)) b!901265))

(assert (=> d!112043 m!838029))

(declare-fun m!838139 () Bool)

(assert (=> d!112043 m!838139))

(assert (=> b!901263 m!838029))

(declare-fun m!838141 () Bool)

(assert (=> b!901263 m!838141))

(assert (=> b!901263 m!838029))

(declare-fun m!838143 () Bool)

(assert (=> b!901263 m!838143))

(assert (=> b!901263 m!838143))

(declare-fun m!838145 () Bool)

(assert (=> b!901263 m!838145))

(assert (=> b!901265 m!838029))

(assert (=> b!901265 m!838143))

(assert (=> b!901265 m!838143))

(assert (=> b!901265 m!838145))

(assert (=> b!901155 d!112043))

(declare-fun d!112045 () Bool)

(assert (=> d!112045 (= (validMask!0 (mask!26268 thiss!1181)) (and (or (= (mask!26268 thiss!1181) #b00000000000000000000000000000111) (= (mask!26268 thiss!1181) #b00000000000000000000000000001111) (= (mask!26268 thiss!1181) #b00000000000000000000000000011111) (= (mask!26268 thiss!1181) #b00000000000000000000000000111111) (= (mask!26268 thiss!1181) #b00000000000000000000000001111111) (= (mask!26268 thiss!1181) #b00000000000000000000000011111111) (= (mask!26268 thiss!1181) #b00000000000000000000000111111111) (= (mask!26268 thiss!1181) #b00000000000000000000001111111111) (= (mask!26268 thiss!1181) #b00000000000000000000011111111111) (= (mask!26268 thiss!1181) #b00000000000000000000111111111111) (= (mask!26268 thiss!1181) #b00000000000000000001111111111111) (= (mask!26268 thiss!1181) #b00000000000000000011111111111111) (= (mask!26268 thiss!1181) #b00000000000000000111111111111111) (= (mask!26268 thiss!1181) #b00000000000000001111111111111111) (= (mask!26268 thiss!1181) #b00000000000000011111111111111111) (= (mask!26268 thiss!1181) #b00000000000000111111111111111111) (= (mask!26268 thiss!1181) #b00000000000001111111111111111111) (= (mask!26268 thiss!1181) #b00000000000011111111111111111111) (= (mask!26268 thiss!1181) #b00000000000111111111111111111111) (= (mask!26268 thiss!1181) #b00000000001111111111111111111111) (= (mask!26268 thiss!1181) #b00000000011111111111111111111111) (= (mask!26268 thiss!1181) #b00000000111111111111111111111111) (= (mask!26268 thiss!1181) #b00000001111111111111111111111111) (= (mask!26268 thiss!1181) #b00000011111111111111111111111111) (= (mask!26268 thiss!1181) #b00000111111111111111111111111111) (= (mask!26268 thiss!1181) #b00001111111111111111111111111111) (= (mask!26268 thiss!1181) #b00011111111111111111111111111111) (= (mask!26268 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26268 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!901155 d!112045))

(declare-fun d!112047 () Bool)

(declare-fun res!608387 () Bool)

(declare-fun e!504509 () Bool)

(assert (=> d!112047 (=> res!608387 e!504509)))

(assert (=> d!112047 (= res!608387 (= (select (arr!25384 (_keys!10274 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!112047 (= (arrayContainsKey!0 (_keys!10274 thiss!1181) key!785 #b00000000000000000000000000000000) e!504509)))

(declare-fun b!901270 () Bool)

(declare-fun e!504510 () Bool)

(assert (=> b!901270 (= e!504509 e!504510)))

(declare-fun res!608388 () Bool)

(assert (=> b!901270 (=> (not res!608388) (not e!504510))))

(assert (=> b!901270 (= res!608388 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25844 (_keys!10274 thiss!1181))))))

(declare-fun b!901271 () Bool)

(assert (=> b!901271 (= e!504510 (arrayContainsKey!0 (_keys!10274 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!112047 (not res!608387)) b!901270))

(assert (= (and b!901270 res!608388) b!901271))

(assert (=> d!112047 m!838109))

(declare-fun m!838147 () Bool)

(assert (=> b!901271 m!838147))

(assert (=> b!901155 d!112047))

(declare-fun b!901314 () Bool)

(declare-fun e!504547 () ListLongMap!10673)

(declare-fun call!40076 () ListLongMap!10673)

(assert (=> b!901314 (= e!504547 call!40076)))

(declare-fun b!901315 () Bool)

(declare-fun res!608412 () Bool)

(declare-fun e!504546 () Bool)

(assert (=> b!901315 (=> (not res!608412) (not e!504546))))

(declare-fun e!504543 () Bool)

(assert (=> b!901315 (= res!608412 e!504543)))

(declare-fun res!608408 () Bool)

(assert (=> b!901315 (=> res!608408 e!504543)))

(declare-fun e!504549 () Bool)

(assert (=> b!901315 (= res!608408 (not e!504549))))

(declare-fun res!608415 () Bool)

(assert (=> b!901315 (=> (not res!608415) (not e!504549))))

(assert (=> b!901315 (= res!608415 (bvslt #b00000000000000000000000000000000 (size!25844 (_keys!10274 thiss!1181))))))

(declare-fun b!901316 () Bool)

(declare-fun e!504538 () Bool)

(declare-fun lt!407229 () ListLongMap!10673)

(declare-fun apply!411 (ListLongMap!10673 (_ BitVec 64)) V!29463)

(assert (=> b!901316 (= e!504538 (= (apply!411 lt!407229 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5274 thiss!1181)))))

(declare-fun b!901317 () Bool)

(declare-fun e!504542 () Bool)

(assert (=> b!901317 (= e!504543 e!504542)))

(declare-fun res!608414 () Bool)

(assert (=> b!901317 (=> (not res!608414) (not e!504542))))

(assert (=> b!901317 (= res!608414 (contains!4401 lt!407229 (select (arr!25384 (_keys!10274 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!901317 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25844 (_keys!10274 thiss!1181))))))

(declare-fun b!901318 () Bool)

(declare-fun e!504548 () Bool)

(assert (=> b!901318 (= e!504548 (validKeyInArray!0 (select (arr!25384 (_keys!10274 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!901319 () Bool)

(declare-fun e!504541 () ListLongMap!10673)

(assert (=> b!901319 (= e!504541 call!40076)))

(declare-fun bm!40070 () Bool)

(declare-fun call!40078 () Bool)

(assert (=> bm!40070 (= call!40078 (contains!4401 lt!407229 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40071 () Bool)

(declare-fun call!40074 () ListLongMap!10673)

(assert (=> bm!40071 (= call!40076 call!40074)))

(declare-fun b!901320 () Bool)

(declare-fun e!504537 () Bool)

(assert (=> b!901320 (= e!504537 (= (apply!411 lt!407229 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5274 thiss!1181)))))

(declare-fun b!901321 () Bool)

(declare-fun get!13370 (ValueCell!8705 V!29463) V!29463)

(declare-fun dynLambda!1326 (Int (_ BitVec 64)) V!29463)

(assert (=> b!901321 (= e!504542 (= (apply!411 lt!407229 (select (arr!25384 (_keys!10274 thiss!1181)) #b00000000000000000000000000000000)) (get!13370 (select (arr!25385 (_values!5461 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1326 (defaultEntry!5445 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!901321 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25845 (_values!5461 thiss!1181))))))

(assert (=> b!901321 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25844 (_keys!10274 thiss!1181))))))

(declare-fun bm!40072 () Bool)

(declare-fun call!40077 () ListLongMap!10673)

(declare-fun getCurrentListMapNoExtraKeys!3327 (array!52833 array!52835 (_ BitVec 32) (_ BitVec 32) V!29463 V!29463 (_ BitVec 32) Int) ListLongMap!10673)

(assert (=> bm!40072 (= call!40077 (getCurrentListMapNoExtraKeys!3327 (_keys!10274 thiss!1181) (_values!5461 thiss!1181) (mask!26268 thiss!1181) (extraKeys!5170 thiss!1181) (zeroValue!5274 thiss!1181) (minValue!5274 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5445 thiss!1181)))))

(declare-fun b!901322 () Bool)

(declare-fun e!504545 () ListLongMap!10673)

(declare-fun +!2606 (ListLongMap!10673 tuple2!11974) ListLongMap!10673)

(assert (=> b!901322 (= e!504545 (+!2606 call!40074 (tuple2!11975 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5274 thiss!1181))))))

(declare-fun b!901323 () Bool)

(declare-fun e!504540 () Bool)

(declare-fun call!40075 () Bool)

(assert (=> b!901323 (= e!504540 (not call!40075))))

(declare-fun bm!40073 () Bool)

(declare-fun call!40072 () ListLongMap!10673)

(assert (=> bm!40073 (= call!40072 call!40077)))

(declare-fun c!95626 () Bool)

(declare-fun bm!40074 () Bool)

(declare-fun c!95624 () Bool)

(declare-fun call!40073 () ListLongMap!10673)

(assert (=> bm!40074 (= call!40074 (+!2606 (ite c!95626 call!40077 (ite c!95624 call!40072 call!40073)) (ite (or c!95626 c!95624) (tuple2!11975 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5274 thiss!1181)) (tuple2!11975 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5274 thiss!1181)))))))

(declare-fun bm!40075 () Bool)

(assert (=> bm!40075 (= call!40075 (contains!4401 lt!407229 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!901324 () Bool)

(declare-fun e!504544 () Unit!30580)

(declare-fun Unit!30585 () Unit!30580)

(assert (=> b!901324 (= e!504544 Unit!30585)))

(declare-fun d!112049 () Bool)

(assert (=> d!112049 e!504546))

(declare-fun res!608411 () Bool)

(assert (=> d!112049 (=> (not res!608411) (not e!504546))))

(assert (=> d!112049 (= res!608411 (or (bvsge #b00000000000000000000000000000000 (size!25844 (_keys!10274 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25844 (_keys!10274 thiss!1181))))))))

(declare-fun lt!407215 () ListLongMap!10673)

(assert (=> d!112049 (= lt!407229 lt!407215)))

(declare-fun lt!407232 () Unit!30580)

(assert (=> d!112049 (= lt!407232 e!504544)))

(declare-fun c!95628 () Bool)

(assert (=> d!112049 (= c!95628 e!504548)))

(declare-fun res!608413 () Bool)

(assert (=> d!112049 (=> (not res!608413) (not e!504548))))

(assert (=> d!112049 (= res!608413 (bvslt #b00000000000000000000000000000000 (size!25844 (_keys!10274 thiss!1181))))))

(assert (=> d!112049 (= lt!407215 e!504545)))

(assert (=> d!112049 (= c!95626 (and (not (= (bvand (extraKeys!5170 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5170 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112049 (validMask!0 (mask!26268 thiss!1181))))

(assert (=> d!112049 (= (getCurrentListMap!2624 (_keys!10274 thiss!1181) (_values!5461 thiss!1181) (mask!26268 thiss!1181) (extraKeys!5170 thiss!1181) (zeroValue!5274 thiss!1181) (minValue!5274 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5445 thiss!1181)) lt!407229)))

(declare-fun bm!40069 () Bool)

(assert (=> bm!40069 (= call!40073 call!40072)))

(declare-fun b!901325 () Bool)

(declare-fun res!608410 () Bool)

(assert (=> b!901325 (=> (not res!608410) (not e!504546))))

(declare-fun e!504539 () Bool)

(assert (=> b!901325 (= res!608410 e!504539)))

(declare-fun c!95627 () Bool)

(assert (=> b!901325 (= c!95627 (not (= (bvand (extraKeys!5170 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!901326 () Bool)

(declare-fun c!95623 () Bool)

(assert (=> b!901326 (= c!95623 (and (not (= (bvand (extraKeys!5170 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5170 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!901326 (= e!504547 e!504541)))

(declare-fun b!901327 () Bool)

(assert (=> b!901327 (= e!504541 call!40073)))

(declare-fun b!901328 () Bool)

(assert (=> b!901328 (= e!504546 e!504540)))

(declare-fun c!95625 () Bool)

(assert (=> b!901328 (= c!95625 (not (= (bvand (extraKeys!5170 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!901329 () Bool)

(assert (=> b!901329 (= e!504539 e!504538)))

(declare-fun res!608407 () Bool)

(assert (=> b!901329 (= res!608407 call!40078)))

(assert (=> b!901329 (=> (not res!608407) (not e!504538))))

(declare-fun b!901330 () Bool)

(assert (=> b!901330 (= e!504539 (not call!40078))))

(declare-fun b!901331 () Bool)

(declare-fun lt!407222 () Unit!30580)

(assert (=> b!901331 (= e!504544 lt!407222)))

(declare-fun lt!407226 () ListLongMap!10673)

(assert (=> b!901331 (= lt!407226 (getCurrentListMapNoExtraKeys!3327 (_keys!10274 thiss!1181) (_values!5461 thiss!1181) (mask!26268 thiss!1181) (extraKeys!5170 thiss!1181) (zeroValue!5274 thiss!1181) (minValue!5274 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5445 thiss!1181)))))

(declare-fun lt!407228 () (_ BitVec 64))

(assert (=> b!901331 (= lt!407228 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407214 () (_ BitVec 64))

(assert (=> b!901331 (= lt!407214 (select (arr!25384 (_keys!10274 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407213 () Unit!30580)

(declare-fun addStillContains!337 (ListLongMap!10673 (_ BitVec 64) V!29463 (_ BitVec 64)) Unit!30580)

(assert (=> b!901331 (= lt!407213 (addStillContains!337 lt!407226 lt!407228 (zeroValue!5274 thiss!1181) lt!407214))))

(assert (=> b!901331 (contains!4401 (+!2606 lt!407226 (tuple2!11975 lt!407228 (zeroValue!5274 thiss!1181))) lt!407214)))

(declare-fun lt!407220 () Unit!30580)

(assert (=> b!901331 (= lt!407220 lt!407213)))

(declare-fun lt!407219 () ListLongMap!10673)

(assert (=> b!901331 (= lt!407219 (getCurrentListMapNoExtraKeys!3327 (_keys!10274 thiss!1181) (_values!5461 thiss!1181) (mask!26268 thiss!1181) (extraKeys!5170 thiss!1181) (zeroValue!5274 thiss!1181) (minValue!5274 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5445 thiss!1181)))))

(declare-fun lt!407230 () (_ BitVec 64))

(assert (=> b!901331 (= lt!407230 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407227 () (_ BitVec 64))

(assert (=> b!901331 (= lt!407227 (select (arr!25384 (_keys!10274 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407233 () Unit!30580)

(declare-fun addApplyDifferent!337 (ListLongMap!10673 (_ BitVec 64) V!29463 (_ BitVec 64)) Unit!30580)

(assert (=> b!901331 (= lt!407233 (addApplyDifferent!337 lt!407219 lt!407230 (minValue!5274 thiss!1181) lt!407227))))

(assert (=> b!901331 (= (apply!411 (+!2606 lt!407219 (tuple2!11975 lt!407230 (minValue!5274 thiss!1181))) lt!407227) (apply!411 lt!407219 lt!407227))))

(declare-fun lt!407221 () Unit!30580)

(assert (=> b!901331 (= lt!407221 lt!407233)))

(declare-fun lt!407224 () ListLongMap!10673)

(assert (=> b!901331 (= lt!407224 (getCurrentListMapNoExtraKeys!3327 (_keys!10274 thiss!1181) (_values!5461 thiss!1181) (mask!26268 thiss!1181) (extraKeys!5170 thiss!1181) (zeroValue!5274 thiss!1181) (minValue!5274 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5445 thiss!1181)))))

(declare-fun lt!407217 () (_ BitVec 64))

(assert (=> b!901331 (= lt!407217 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407212 () (_ BitVec 64))

(assert (=> b!901331 (= lt!407212 (select (arr!25384 (_keys!10274 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407218 () Unit!30580)

(assert (=> b!901331 (= lt!407218 (addApplyDifferent!337 lt!407224 lt!407217 (zeroValue!5274 thiss!1181) lt!407212))))

(assert (=> b!901331 (= (apply!411 (+!2606 lt!407224 (tuple2!11975 lt!407217 (zeroValue!5274 thiss!1181))) lt!407212) (apply!411 lt!407224 lt!407212))))

(declare-fun lt!407225 () Unit!30580)

(assert (=> b!901331 (= lt!407225 lt!407218)))

(declare-fun lt!407223 () ListLongMap!10673)

(assert (=> b!901331 (= lt!407223 (getCurrentListMapNoExtraKeys!3327 (_keys!10274 thiss!1181) (_values!5461 thiss!1181) (mask!26268 thiss!1181) (extraKeys!5170 thiss!1181) (zeroValue!5274 thiss!1181) (minValue!5274 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5445 thiss!1181)))))

(declare-fun lt!407231 () (_ BitVec 64))

(assert (=> b!901331 (= lt!407231 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407216 () (_ BitVec 64))

(assert (=> b!901331 (= lt!407216 (select (arr!25384 (_keys!10274 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!901331 (= lt!407222 (addApplyDifferent!337 lt!407223 lt!407231 (minValue!5274 thiss!1181) lt!407216))))

(assert (=> b!901331 (= (apply!411 (+!2606 lt!407223 (tuple2!11975 lt!407231 (minValue!5274 thiss!1181))) lt!407216) (apply!411 lt!407223 lt!407216))))

(declare-fun b!901332 () Bool)

(assert (=> b!901332 (= e!504549 (validKeyInArray!0 (select (arr!25384 (_keys!10274 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!901333 () Bool)

(assert (=> b!901333 (= e!504545 e!504547)))

(assert (=> b!901333 (= c!95624 (and (not (= (bvand (extraKeys!5170 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5170 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!901334 () Bool)

(assert (=> b!901334 (= e!504540 e!504537)))

(declare-fun res!608409 () Bool)

(assert (=> b!901334 (= res!608409 call!40075)))

(assert (=> b!901334 (=> (not res!608409) (not e!504537))))

(assert (= (and d!112049 c!95626) b!901322))

(assert (= (and d!112049 (not c!95626)) b!901333))

(assert (= (and b!901333 c!95624) b!901314))

(assert (= (and b!901333 (not c!95624)) b!901326))

(assert (= (and b!901326 c!95623) b!901319))

(assert (= (and b!901326 (not c!95623)) b!901327))

(assert (= (or b!901319 b!901327) bm!40069))

(assert (= (or b!901314 bm!40069) bm!40073))

(assert (= (or b!901314 b!901319) bm!40071))

(assert (= (or b!901322 bm!40073) bm!40072))

(assert (= (or b!901322 bm!40071) bm!40074))

(assert (= (and d!112049 res!608413) b!901318))

(assert (= (and d!112049 c!95628) b!901331))

(assert (= (and d!112049 (not c!95628)) b!901324))

(assert (= (and d!112049 res!608411) b!901315))

(assert (= (and b!901315 res!608415) b!901332))

(assert (= (and b!901315 (not res!608408)) b!901317))

(assert (= (and b!901317 res!608414) b!901321))

(assert (= (and b!901315 res!608412) b!901325))

(assert (= (and b!901325 c!95627) b!901329))

(assert (= (and b!901325 (not c!95627)) b!901330))

(assert (= (and b!901329 res!608407) b!901316))

(assert (= (or b!901329 b!901330) bm!40070))

(assert (= (and b!901325 res!608410) b!901328))

(assert (= (and b!901328 c!95625) b!901334))

(assert (= (and b!901328 (not c!95625)) b!901323))

(assert (= (and b!901334 res!608409) b!901320))

(assert (= (or b!901334 b!901323) bm!40075))

(declare-fun b_lambda!13029 () Bool)

(assert (=> (not b_lambda!13029) (not b!901321)))

(declare-fun t!25152 () Bool)

(declare-fun tb!5195 () Bool)

(assert (=> (and b!901156 (= (defaultEntry!5445 thiss!1181) (defaultEntry!5445 thiss!1181)) t!25152) tb!5195))

(declare-fun result!10173 () Bool)

(assert (=> tb!5195 (= result!10173 tp_is_empty!18373)))

(assert (=> b!901321 t!25152))

(declare-fun b_and!26381 () Bool)

(assert (= b_and!26375 (and (=> t!25152 result!10173) b_and!26381)))

(assert (=> d!112049 m!838037))

(declare-fun m!838149 () Bool)

(assert (=> bm!40070 m!838149))

(assert (=> b!901318 m!838109))

(assert (=> b!901318 m!838109))

(assert (=> b!901318 m!838111))

(assert (=> b!901317 m!838109))

(assert (=> b!901317 m!838109))

(declare-fun m!838151 () Bool)

(assert (=> b!901317 m!838151))

(declare-fun m!838153 () Bool)

(assert (=> b!901316 m!838153))

(declare-fun m!838155 () Bool)

(assert (=> b!901321 m!838155))

(assert (=> b!901321 m!838109))

(declare-fun m!838157 () Bool)

(assert (=> b!901321 m!838157))

(declare-fun m!838159 () Bool)

(assert (=> b!901321 m!838159))

(assert (=> b!901321 m!838109))

(assert (=> b!901321 m!838155))

(assert (=> b!901321 m!838159))

(declare-fun m!838161 () Bool)

(assert (=> b!901321 m!838161))

(declare-fun m!838163 () Bool)

(assert (=> bm!40075 m!838163))

(declare-fun m!838165 () Bool)

(assert (=> b!901320 m!838165))

(declare-fun m!838167 () Bool)

(assert (=> bm!40074 m!838167))

(declare-fun m!838169 () Bool)

(assert (=> bm!40072 m!838169))

(declare-fun m!838171 () Bool)

(assert (=> b!901331 m!838171))

(declare-fun m!838173 () Bool)

(assert (=> b!901331 m!838173))

(declare-fun m!838175 () Bool)

(assert (=> b!901331 m!838175))

(declare-fun m!838177 () Bool)

(assert (=> b!901331 m!838177))

(declare-fun m!838179 () Bool)

(assert (=> b!901331 m!838179))

(declare-fun m!838181 () Bool)

(assert (=> b!901331 m!838181))

(assert (=> b!901331 m!838179))

(declare-fun m!838183 () Bool)

(assert (=> b!901331 m!838183))

(declare-fun m!838185 () Bool)

(assert (=> b!901331 m!838185))

(assert (=> b!901331 m!838171))

(declare-fun m!838187 () Bool)

(assert (=> b!901331 m!838187))

(assert (=> b!901331 m!838169))

(declare-fun m!838189 () Bool)

(assert (=> b!901331 m!838189))

(assert (=> b!901331 m!838175))

(declare-fun m!838191 () Bool)

(assert (=> b!901331 m!838191))

(assert (=> b!901331 m!838109))

(assert (=> b!901331 m!838177))

(declare-fun m!838193 () Bool)

(assert (=> b!901331 m!838193))

(declare-fun m!838195 () Bool)

(assert (=> b!901331 m!838195))

(declare-fun m!838197 () Bool)

(assert (=> b!901331 m!838197))

(declare-fun m!838199 () Bool)

(assert (=> b!901331 m!838199))

(declare-fun m!838201 () Bool)

(assert (=> b!901322 m!838201))

(assert (=> b!901332 m!838109))

(assert (=> b!901332 m!838109))

(assert (=> b!901332 m!838111))

(assert (=> b!901155 d!112049))

(declare-fun d!112051 () Bool)

(declare-fun res!608422 () Bool)

(declare-fun e!504552 () Bool)

(assert (=> d!112051 (=> (not res!608422) (not e!504552))))

(declare-fun simpleValid!329 (LongMapFixedSize!4426) Bool)

(assert (=> d!112051 (= res!608422 (simpleValid!329 thiss!1181))))

(assert (=> d!112051 (= (valid!1712 thiss!1181) e!504552)))

(declare-fun b!901343 () Bool)

(declare-fun res!608423 () Bool)

(assert (=> b!901343 (=> (not res!608423) (not e!504552))))

(declare-fun arrayCountValidKeys!0 (array!52833 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!901343 (= res!608423 (= (arrayCountValidKeys!0 (_keys!10274 thiss!1181) #b00000000000000000000000000000000 (size!25844 (_keys!10274 thiss!1181))) (_size!2268 thiss!1181)))))

(declare-fun b!901344 () Bool)

(declare-fun res!608424 () Bool)

(assert (=> b!901344 (=> (not res!608424) (not e!504552))))

(assert (=> b!901344 (= res!608424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10274 thiss!1181) (mask!26268 thiss!1181)))))

(declare-fun b!901345 () Bool)

(declare-datatypes ((List!17808 0))(
  ( (Nil!17805) (Cons!17804 (h!18956 (_ BitVec 64)) (t!25153 List!17808)) )
))
(declare-fun arrayNoDuplicates!0 (array!52833 (_ BitVec 32) List!17808) Bool)

(assert (=> b!901345 (= e!504552 (arrayNoDuplicates!0 (_keys!10274 thiss!1181) #b00000000000000000000000000000000 Nil!17805))))

(assert (= (and d!112051 res!608422) b!901343))

(assert (= (and b!901343 res!608423) b!901344))

(assert (= (and b!901344 res!608424) b!901345))

(declare-fun m!838203 () Bool)

(assert (=> d!112051 m!838203))

(declare-fun m!838205 () Bool)

(assert (=> b!901343 m!838205))

(assert (=> b!901344 m!838023))

(declare-fun m!838207 () Bool)

(assert (=> b!901345 m!838207))

(assert (=> start!77290 d!112051))

(declare-fun condMapEmpty!29242 () Bool)

(declare-fun mapDefault!29242 () ValueCell!8705)

(assert (=> mapNonEmpty!29233 (= condMapEmpty!29242 (= mapRest!29233 ((as const (Array (_ BitVec 32) ValueCell!8705)) mapDefault!29242)))))

(declare-fun e!504557 () Bool)

(declare-fun mapRes!29242 () Bool)

(assert (=> mapNonEmpty!29233 (= tp!56223 (and e!504557 mapRes!29242))))

(declare-fun b!901352 () Bool)

(declare-fun e!504558 () Bool)

(assert (=> b!901352 (= e!504558 tp_is_empty!18373)))

(declare-fun b!901353 () Bool)

(assert (=> b!901353 (= e!504557 tp_is_empty!18373)))

(declare-fun mapIsEmpty!29242 () Bool)

(assert (=> mapIsEmpty!29242 mapRes!29242))

(declare-fun mapNonEmpty!29242 () Bool)

(declare-fun tp!56239 () Bool)

(assert (=> mapNonEmpty!29242 (= mapRes!29242 (and tp!56239 e!504558))))

(declare-fun mapRest!29242 () (Array (_ BitVec 32) ValueCell!8705))

(declare-fun mapValue!29242 () ValueCell!8705)

(declare-fun mapKey!29242 () (_ BitVec 32))

(assert (=> mapNonEmpty!29242 (= mapRest!29233 (store mapRest!29242 mapKey!29242 mapValue!29242))))

(assert (= (and mapNonEmpty!29233 condMapEmpty!29242) mapIsEmpty!29242))

(assert (= (and mapNonEmpty!29233 (not condMapEmpty!29242)) mapNonEmpty!29242))

(assert (= (and mapNonEmpty!29242 ((_ is ValueCellFull!8705) mapValue!29242)) b!901352))

(assert (= (and mapNonEmpty!29233 ((_ is ValueCellFull!8705) mapDefault!29242)) b!901353))

(declare-fun m!838209 () Bool)

(assert (=> mapNonEmpty!29242 m!838209))

(declare-fun b_lambda!13031 () Bool)

(assert (= b_lambda!13029 (or (and b!901156 b_free!16045) b_lambda!13031)))

(check-sat (not mapNonEmpty!29242) (not b_next!16045) (not b_lambda!13031) (not b!901229) (not b!901318) (not d!112049) (not b!901263) (not b!901343) (not d!112051) tp_is_empty!18373 (not b!901265) (not b!901316) (not b!901345) (not d!112033) (not d!112035) (not bm!40074) (not bm!40075) (not b!901235) (not b!901320) (not b!901332) (not b!901344) (not b!901230) (not bm!40072) (not d!112043) (not bm!40054) (not d!112039) (not bm!40070) (not d!112041) (not b!901317) (not b!901256) (not b!901321) (not b!901331) (not b!901322) (not b!901252) b_and!26381 (not b!901271))
(check-sat b_and!26381 (not b_next!16045))
