; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107694 () Bool)

(assert start!107694)

(declare-fun b!1274213 () Bool)

(declare-fun b_free!27691 () Bool)

(declare-fun b_next!27691 () Bool)

(assert (=> b!1274213 (= b_free!27691 (not b_next!27691))))

(declare-fun tp!97603 () Bool)

(declare-fun b_and!45749 () Bool)

(assert (=> b!1274213 (= tp!97603 b_and!45749)))

(declare-fun mapNonEmpty!51197 () Bool)

(declare-fun mapRes!51197 () Bool)

(declare-fun tp!97604 () Bool)

(declare-fun e!726981 () Bool)

(assert (=> mapNonEmpty!51197 (= mapRes!51197 (and tp!97604 e!726981))))

(declare-datatypes ((V!49275 0))(
  ( (V!49276 (val!16605 Int)) )
))
(declare-datatypes ((ValueCell!15677 0))(
  ( (ValueCellFull!15677 (v!19237 V!49275)) (EmptyCell!15677) )
))
(declare-fun mapRest!51197 () (Array (_ BitVec 32) ValueCell!15677))

(declare-fun mapValue!51197 () ValueCell!15677)

(declare-datatypes ((array!83401 0))(
  ( (array!83402 (arr!40226 (Array (_ BitVec 32) ValueCell!15677)) (size!40767 (_ BitVec 32))) )
))
(declare-datatypes ((array!83403 0))(
  ( (array!83404 (arr!40227 (Array (_ BitVec 32) (_ BitVec 64))) (size!40768 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6118 0))(
  ( (LongMapFixedSize!6119 (defaultEntry!6705 Int) (mask!34528 (_ BitVec 32)) (extraKeys!6384 (_ BitVec 32)) (zeroValue!6490 V!49275) (minValue!6490 V!49275) (_size!3114 (_ BitVec 32)) (_keys!12153 array!83403) (_values!6728 array!83401) (_vacant!3114 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6118)

(declare-fun mapKey!51197 () (_ BitVec 32))

(assert (=> mapNonEmpty!51197 (= (arr!40226 (_values!6728 thiss!1559)) (store mapRest!51197 mapKey!51197 mapValue!51197))))

(declare-fun mapIsEmpty!51197 () Bool)

(assert (=> mapIsEmpty!51197 mapRes!51197))

(declare-fun b!1274212 () Bool)

(declare-fun tp_is_empty!33061 () Bool)

(assert (=> b!1274212 (= e!726981 tp_is_empty!33061)))

(declare-fun res!847120 () Bool)

(declare-fun e!726980 () Bool)

(assert (=> start!107694 (=> (not res!847120) (not e!726980))))

(declare-fun valid!2297 (LongMapFixedSize!6118) Bool)

(assert (=> start!107694 (= res!847120 (valid!2297 thiss!1559))))

(assert (=> start!107694 e!726980))

(declare-fun e!726984 () Bool)

(assert (=> start!107694 e!726984))

(declare-fun e!726985 () Bool)

(declare-fun array_inv!30763 (array!83403) Bool)

(declare-fun array_inv!30764 (array!83401) Bool)

(assert (=> b!1274213 (= e!726984 (and tp!97603 tp_is_empty!33061 (array_inv!30763 (_keys!12153 thiss!1559)) (array_inv!30764 (_values!6728 thiss!1559)) e!726985))))

(declare-fun b!1274214 () Bool)

(declare-fun e!726983 () Bool)

(assert (=> b!1274214 (= e!726983 tp_is_empty!33061)))

(declare-fun b!1274215 () Bool)

(assert (=> b!1274215 (= e!726980 (and (= (size!40767 (_values!6728 thiss!1559)) (bvadd #b00000000000000000000000000000001 (mask!34528 thiss!1559))) (= (size!40768 (_keys!12153 thiss!1559)) (size!40767 (_values!6728 thiss!1559))) (bvsge (mask!34528 thiss!1559) #b00000000000000000000000000000000) (bvsge (extraKeys!6384 thiss!1559) #b00000000000000000000000000000000) (bvsgt (extraKeys!6384 thiss!1559) #b00000000000000000000000000000011)))))

(declare-fun b!1274216 () Bool)

(assert (=> b!1274216 (= e!726985 (and e!726983 mapRes!51197))))

(declare-fun condMapEmpty!51197 () Bool)

(declare-fun mapDefault!51197 () ValueCell!15677)

(assert (=> b!1274216 (= condMapEmpty!51197 (= (arr!40226 (_values!6728 thiss!1559)) ((as const (Array (_ BitVec 32) ValueCell!15677)) mapDefault!51197)))))

(declare-fun b!1274217 () Bool)

(declare-fun res!847119 () Bool)

(assert (=> b!1274217 (=> (not res!847119) (not e!726980))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1274217 (= res!847119 (validMask!0 (mask!34528 thiss!1559)))))

(assert (= (and start!107694 res!847120) b!1274217))

(assert (= (and b!1274217 res!847119) b!1274215))

(assert (= (and b!1274216 condMapEmpty!51197) mapIsEmpty!51197))

(assert (= (and b!1274216 (not condMapEmpty!51197)) mapNonEmpty!51197))

(get-info :version)

(assert (= (and mapNonEmpty!51197 ((_ is ValueCellFull!15677) mapValue!51197)) b!1274212))

(assert (= (and b!1274216 ((_ is ValueCellFull!15677) mapDefault!51197)) b!1274214))

(assert (= b!1274213 b!1274216))

(assert (= start!107694 b!1274213))

(declare-fun m!1171959 () Bool)

(assert (=> mapNonEmpty!51197 m!1171959))

(declare-fun m!1171961 () Bool)

(assert (=> start!107694 m!1171961))

(declare-fun m!1171963 () Bool)

(assert (=> b!1274213 m!1171963))

(declare-fun m!1171965 () Bool)

(assert (=> b!1274213 m!1171965))

(declare-fun m!1171967 () Bool)

(assert (=> b!1274217 m!1171967))

(check-sat (not start!107694) (not b!1274213) b_and!45749 (not b_next!27691) (not b!1274217) (not mapNonEmpty!51197) tp_is_empty!33061)
(check-sat b_and!45749 (not b_next!27691))
(get-model)

(declare-fun d!140375 () Bool)

(assert (=> d!140375 (= (validMask!0 (mask!34528 thiss!1559)) (and (or (= (mask!34528 thiss!1559) #b00000000000000000000000000000111) (= (mask!34528 thiss!1559) #b00000000000000000000000000001111) (= (mask!34528 thiss!1559) #b00000000000000000000000000011111) (= (mask!34528 thiss!1559) #b00000000000000000000000000111111) (= (mask!34528 thiss!1559) #b00000000000000000000000001111111) (= (mask!34528 thiss!1559) #b00000000000000000000000011111111) (= (mask!34528 thiss!1559) #b00000000000000000000000111111111) (= (mask!34528 thiss!1559) #b00000000000000000000001111111111) (= (mask!34528 thiss!1559) #b00000000000000000000011111111111) (= (mask!34528 thiss!1559) #b00000000000000000000111111111111) (= (mask!34528 thiss!1559) #b00000000000000000001111111111111) (= (mask!34528 thiss!1559) #b00000000000000000011111111111111) (= (mask!34528 thiss!1559) #b00000000000000000111111111111111) (= (mask!34528 thiss!1559) #b00000000000000001111111111111111) (= (mask!34528 thiss!1559) #b00000000000000011111111111111111) (= (mask!34528 thiss!1559) #b00000000000000111111111111111111) (= (mask!34528 thiss!1559) #b00000000000001111111111111111111) (= (mask!34528 thiss!1559) #b00000000000011111111111111111111) (= (mask!34528 thiss!1559) #b00000000000111111111111111111111) (= (mask!34528 thiss!1559) #b00000000001111111111111111111111) (= (mask!34528 thiss!1559) #b00000000011111111111111111111111) (= (mask!34528 thiss!1559) #b00000000111111111111111111111111) (= (mask!34528 thiss!1559) #b00000001111111111111111111111111) (= (mask!34528 thiss!1559) #b00000011111111111111111111111111) (= (mask!34528 thiss!1559) #b00000111111111111111111111111111) (= (mask!34528 thiss!1559) #b00001111111111111111111111111111) (= (mask!34528 thiss!1559) #b00011111111111111111111111111111) (= (mask!34528 thiss!1559) #b00111111111111111111111111111111)) (bvsle (mask!34528 thiss!1559) #b00111111111111111111111111111111)))))

(assert (=> b!1274217 d!140375))

(declare-fun d!140377 () Bool)

(assert (=> d!140377 (= (array_inv!30763 (_keys!12153 thiss!1559)) (bvsge (size!40768 (_keys!12153 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1274213 d!140377))

(declare-fun d!140379 () Bool)

(assert (=> d!140379 (= (array_inv!30764 (_values!6728 thiss!1559)) (bvsge (size!40767 (_values!6728 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1274213 d!140379))

(declare-fun d!140381 () Bool)

(declare-fun res!847139 () Bool)

(declare-fun e!727024 () Bool)

(assert (=> d!140381 (=> (not res!847139) (not e!727024))))

(declare-fun simpleValid!460 (LongMapFixedSize!6118) Bool)

(assert (=> d!140381 (= res!847139 (simpleValid!460 thiss!1559))))

(assert (=> d!140381 (= (valid!2297 thiss!1559) e!727024)))

(declare-fun b!1274260 () Bool)

(declare-fun res!847140 () Bool)

(assert (=> b!1274260 (=> (not res!847140) (not e!727024))))

(declare-fun arrayCountValidKeys!0 (array!83403 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1274260 (= res!847140 (= (arrayCountValidKeys!0 (_keys!12153 thiss!1559) #b00000000000000000000000000000000 (size!40768 (_keys!12153 thiss!1559))) (_size!3114 thiss!1559)))))

(declare-fun b!1274261 () Bool)

(declare-fun res!847141 () Bool)

(assert (=> b!1274261 (=> (not res!847141) (not e!727024))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83403 (_ BitVec 32)) Bool)

(assert (=> b!1274261 (= res!847141 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12153 thiss!1559) (mask!34528 thiss!1559)))))

(declare-fun b!1274262 () Bool)

(declare-datatypes ((List!28589 0))(
  ( (Nil!28586) (Cons!28585 (h!29803 (_ BitVec 64)) (t!42114 List!28589)) )
))
(declare-fun arrayNoDuplicates!0 (array!83403 (_ BitVec 32) List!28589) Bool)

(assert (=> b!1274262 (= e!727024 (arrayNoDuplicates!0 (_keys!12153 thiss!1559) #b00000000000000000000000000000000 Nil!28586))))

(assert (= (and d!140381 res!847139) b!1274260))

(assert (= (and b!1274260 res!847140) b!1274261))

(assert (= (and b!1274261 res!847141) b!1274262))

(declare-fun m!1171989 () Bool)

(assert (=> d!140381 m!1171989))

(declare-fun m!1171991 () Bool)

(assert (=> b!1274260 m!1171991))

(declare-fun m!1171993 () Bool)

(assert (=> b!1274261 m!1171993))

(declare-fun m!1171995 () Bool)

(assert (=> b!1274262 m!1171995))

(assert (=> start!107694 d!140381))

(declare-fun mapIsEmpty!51206 () Bool)

(declare-fun mapRes!51206 () Bool)

(assert (=> mapIsEmpty!51206 mapRes!51206))

(declare-fun mapNonEmpty!51206 () Bool)

(declare-fun tp!97619 () Bool)

(declare-fun e!727029 () Bool)

(assert (=> mapNonEmpty!51206 (= mapRes!51206 (and tp!97619 e!727029))))

(declare-fun mapKey!51206 () (_ BitVec 32))

(declare-fun mapValue!51206 () ValueCell!15677)

(declare-fun mapRest!51206 () (Array (_ BitVec 32) ValueCell!15677))

(assert (=> mapNonEmpty!51206 (= mapRest!51197 (store mapRest!51206 mapKey!51206 mapValue!51206))))

(declare-fun condMapEmpty!51206 () Bool)

(declare-fun mapDefault!51206 () ValueCell!15677)

(assert (=> mapNonEmpty!51197 (= condMapEmpty!51206 (= mapRest!51197 ((as const (Array (_ BitVec 32) ValueCell!15677)) mapDefault!51206)))))

(declare-fun e!727030 () Bool)

(assert (=> mapNonEmpty!51197 (= tp!97604 (and e!727030 mapRes!51206))))

(declare-fun b!1274270 () Bool)

(assert (=> b!1274270 (= e!727030 tp_is_empty!33061)))

(declare-fun b!1274269 () Bool)

(assert (=> b!1274269 (= e!727029 tp_is_empty!33061)))

(assert (= (and mapNonEmpty!51197 condMapEmpty!51206) mapIsEmpty!51206))

(assert (= (and mapNonEmpty!51197 (not condMapEmpty!51206)) mapNonEmpty!51206))

(assert (= (and mapNonEmpty!51206 ((_ is ValueCellFull!15677) mapValue!51206)) b!1274269))

(assert (= (and mapNonEmpty!51197 ((_ is ValueCellFull!15677) mapDefault!51206)) b!1274270))

(declare-fun m!1171997 () Bool)

(assert (=> mapNonEmpty!51206 m!1171997))

(check-sat (not mapNonEmpty!51206) (not b!1274261) tp_is_empty!33061 b_and!45749 (not b_next!27691) (not b!1274260) (not b!1274262) (not d!140381))
(check-sat b_and!45749 (not b_next!27691))
(get-model)

(declare-fun b!1274281 () Bool)

(declare-fun e!727040 () Bool)

(declare-fun call!62641 () Bool)

(assert (=> b!1274281 (= e!727040 call!62641)))

(declare-fun b!1274283 () Bool)

(declare-fun e!727041 () Bool)

(assert (=> b!1274283 (= e!727041 e!727040)))

(declare-fun c!124135 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1274283 (= c!124135 (validKeyInArray!0 (select (arr!40227 (_keys!12153 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1274284 () Bool)

(assert (=> b!1274284 (= e!727040 call!62641)))

(declare-fun b!1274285 () Bool)

(declare-fun e!727039 () Bool)

(assert (=> b!1274285 (= e!727039 e!727041)))

(declare-fun res!847150 () Bool)

(assert (=> b!1274285 (=> (not res!847150) (not e!727041))))

(declare-fun e!727042 () Bool)

(assert (=> b!1274285 (= res!847150 (not e!727042))))

(declare-fun res!847148 () Bool)

(assert (=> b!1274285 (=> (not res!847148) (not e!727042))))

(assert (=> b!1274285 (= res!847148 (validKeyInArray!0 (select (arr!40227 (_keys!12153 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun bm!62638 () Bool)

(assert (=> bm!62638 (= call!62641 (arrayNoDuplicates!0 (_keys!12153 thiss!1559) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124135 (Cons!28585 (select (arr!40227 (_keys!12153 thiss!1559)) #b00000000000000000000000000000000) Nil!28586) Nil!28586)))))

(declare-fun b!1274282 () Bool)

(declare-fun contains!7696 (List!28589 (_ BitVec 64)) Bool)

(assert (=> b!1274282 (= e!727042 (contains!7696 Nil!28586 (select (arr!40227 (_keys!12153 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun d!140383 () Bool)

(declare-fun res!847149 () Bool)

(assert (=> d!140383 (=> res!847149 e!727039)))

(assert (=> d!140383 (= res!847149 (bvsge #b00000000000000000000000000000000 (size!40768 (_keys!12153 thiss!1559))))))

(assert (=> d!140383 (= (arrayNoDuplicates!0 (_keys!12153 thiss!1559) #b00000000000000000000000000000000 Nil!28586) e!727039)))

(assert (= (and d!140383 (not res!847149)) b!1274285))

(assert (= (and b!1274285 res!847148) b!1274282))

(assert (= (and b!1274285 res!847150) b!1274283))

(assert (= (and b!1274283 c!124135) b!1274281))

(assert (= (and b!1274283 (not c!124135)) b!1274284))

(assert (= (or b!1274281 b!1274284) bm!62638))

(declare-fun m!1171999 () Bool)

(assert (=> b!1274283 m!1171999))

(assert (=> b!1274283 m!1171999))

(declare-fun m!1172001 () Bool)

(assert (=> b!1274283 m!1172001))

(assert (=> b!1274285 m!1171999))

(assert (=> b!1274285 m!1171999))

(assert (=> b!1274285 m!1172001))

(assert (=> bm!62638 m!1171999))

(declare-fun m!1172003 () Bool)

(assert (=> bm!62638 m!1172003))

(assert (=> b!1274282 m!1171999))

(assert (=> b!1274282 m!1171999))

(declare-fun m!1172005 () Bool)

(assert (=> b!1274282 m!1172005))

(assert (=> b!1274262 d!140383))

(declare-fun b!1274294 () Bool)

(declare-fun res!847161 () Bool)

(declare-fun e!727045 () Bool)

(assert (=> b!1274294 (=> (not res!847161) (not e!727045))))

(assert (=> b!1274294 (= res!847161 (and (= (size!40767 (_values!6728 thiss!1559)) (bvadd (mask!34528 thiss!1559) #b00000000000000000000000000000001)) (= (size!40768 (_keys!12153 thiss!1559)) (size!40767 (_values!6728 thiss!1559))) (bvsge (_size!3114 thiss!1559) #b00000000000000000000000000000000) (bvsle (_size!3114 thiss!1559) (bvadd (mask!34528 thiss!1559) #b00000000000000000000000000000001))))))

(declare-fun b!1274295 () Bool)

(declare-fun res!847162 () Bool)

(assert (=> b!1274295 (=> (not res!847162) (not e!727045))))

(declare-fun size!40773 (LongMapFixedSize!6118) (_ BitVec 32))

(assert (=> b!1274295 (= res!847162 (bvsge (size!40773 thiss!1559) (_size!3114 thiss!1559)))))

(declare-fun b!1274297 () Bool)

(assert (=> b!1274297 (= e!727045 (and (bvsge (extraKeys!6384 thiss!1559) #b00000000000000000000000000000000) (bvsle (extraKeys!6384 thiss!1559) #b00000000000000000000000000000011) (bvsge (_vacant!3114 thiss!1559) #b00000000000000000000000000000000)))))

(declare-fun d!140385 () Bool)

(declare-fun res!847159 () Bool)

(assert (=> d!140385 (=> (not res!847159) (not e!727045))))

(assert (=> d!140385 (= res!847159 (validMask!0 (mask!34528 thiss!1559)))))

(assert (=> d!140385 (= (simpleValid!460 thiss!1559) e!727045)))

(declare-fun b!1274296 () Bool)

(declare-fun res!847160 () Bool)

(assert (=> b!1274296 (=> (not res!847160) (not e!727045))))

(assert (=> b!1274296 (= res!847160 (= (size!40773 thiss!1559) (bvadd (_size!3114 thiss!1559) (bvsdiv (bvadd (extraKeys!6384 thiss!1559) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!140385 res!847159) b!1274294))

(assert (= (and b!1274294 res!847161) b!1274295))

(assert (= (and b!1274295 res!847162) b!1274296))

(assert (= (and b!1274296 res!847160) b!1274297))

(declare-fun m!1172007 () Bool)

(assert (=> b!1274295 m!1172007))

(assert (=> d!140385 m!1171967))

(assert (=> b!1274296 m!1172007))

(assert (=> d!140381 d!140385))

(declare-fun b!1274306 () Bool)

(declare-fun e!727052 () Bool)

(declare-fun call!62644 () Bool)

(assert (=> b!1274306 (= e!727052 call!62644)))

(declare-fun b!1274307 () Bool)

(declare-fun e!727053 () Bool)

(declare-fun e!727054 () Bool)

(assert (=> b!1274307 (= e!727053 e!727054)))

(declare-fun c!124138 () Bool)

(assert (=> b!1274307 (= c!124138 (validKeyInArray!0 (select (arr!40227 (_keys!12153 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1274308 () Bool)

(assert (=> b!1274308 (= e!727054 call!62644)))

(declare-fun b!1274309 () Bool)

(assert (=> b!1274309 (= e!727054 e!727052)))

(declare-fun lt!575585 () (_ BitVec 64))

(assert (=> b!1274309 (= lt!575585 (select (arr!40227 (_keys!12153 thiss!1559)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42297 0))(
  ( (Unit!42298) )
))
(declare-fun lt!575584 () Unit!42297)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83403 (_ BitVec 64) (_ BitVec 32)) Unit!42297)

(assert (=> b!1274309 (= lt!575584 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!12153 thiss!1559) lt!575585 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83403 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1274309 (arrayContainsKey!0 (_keys!12153 thiss!1559) lt!575585 #b00000000000000000000000000000000)))

(declare-fun lt!575583 () Unit!42297)

(assert (=> b!1274309 (= lt!575583 lt!575584)))

(declare-fun res!847168 () Bool)

(declare-datatypes ((SeekEntryResult!9949 0))(
  ( (MissingZero!9949 (index!42167 (_ BitVec 32))) (Found!9949 (index!42168 (_ BitVec 32))) (Intermediate!9949 (undefined!10761 Bool) (index!42169 (_ BitVec 32)) (x!112496 (_ BitVec 32))) (Undefined!9949) (MissingVacant!9949 (index!42170 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83403 (_ BitVec 32)) SeekEntryResult!9949)

(assert (=> b!1274309 (= res!847168 (= (seekEntryOrOpen!0 (select (arr!40227 (_keys!12153 thiss!1559)) #b00000000000000000000000000000000) (_keys!12153 thiss!1559) (mask!34528 thiss!1559)) (Found!9949 #b00000000000000000000000000000000)))))

(assert (=> b!1274309 (=> (not res!847168) (not e!727052))))

(declare-fun bm!62641 () Bool)

(assert (=> bm!62641 (= call!62644 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!12153 thiss!1559) (mask!34528 thiss!1559)))))

(declare-fun d!140387 () Bool)

(declare-fun res!847167 () Bool)

(assert (=> d!140387 (=> res!847167 e!727053)))

(assert (=> d!140387 (= res!847167 (bvsge #b00000000000000000000000000000000 (size!40768 (_keys!12153 thiss!1559))))))

(assert (=> d!140387 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12153 thiss!1559) (mask!34528 thiss!1559)) e!727053)))

(assert (= (and d!140387 (not res!847167)) b!1274307))

(assert (= (and b!1274307 c!124138) b!1274309))

(assert (= (and b!1274307 (not c!124138)) b!1274308))

(assert (= (and b!1274309 res!847168) b!1274306))

(assert (= (or b!1274306 b!1274308) bm!62641))

(assert (=> b!1274307 m!1171999))

(assert (=> b!1274307 m!1171999))

(assert (=> b!1274307 m!1172001))

(assert (=> b!1274309 m!1171999))

(declare-fun m!1172009 () Bool)

(assert (=> b!1274309 m!1172009))

(declare-fun m!1172011 () Bool)

(assert (=> b!1274309 m!1172011))

(assert (=> b!1274309 m!1171999))

(declare-fun m!1172013 () Bool)

(assert (=> b!1274309 m!1172013))

(declare-fun m!1172015 () Bool)

(assert (=> bm!62641 m!1172015))

(assert (=> b!1274261 d!140387))

(declare-fun b!1274318 () Bool)

(declare-fun e!727059 () (_ BitVec 32))

(declare-fun e!727060 () (_ BitVec 32))

(assert (=> b!1274318 (= e!727059 e!727060)))

(declare-fun c!124143 () Bool)

(assert (=> b!1274318 (= c!124143 (validKeyInArray!0 (select (arr!40227 (_keys!12153 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1274320 () Bool)

(declare-fun call!62647 () (_ BitVec 32))

(assert (=> b!1274320 (= e!727060 call!62647)))

(declare-fun bm!62644 () Bool)

(assert (=> bm!62644 (= call!62647 (arrayCountValidKeys!0 (_keys!12153 thiss!1559) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40768 (_keys!12153 thiss!1559))))))

(declare-fun b!1274321 () Bool)

(assert (=> b!1274321 (= e!727059 #b00000000000000000000000000000000)))

(declare-fun b!1274319 () Bool)

(assert (=> b!1274319 (= e!727060 (bvadd #b00000000000000000000000000000001 call!62647))))

(declare-fun d!140389 () Bool)

(declare-fun lt!575588 () (_ BitVec 32))

(assert (=> d!140389 (and (bvsge lt!575588 #b00000000000000000000000000000000) (bvsle lt!575588 (bvsub (size!40768 (_keys!12153 thiss!1559)) #b00000000000000000000000000000000)))))

(assert (=> d!140389 (= lt!575588 e!727059)))

(declare-fun c!124144 () Bool)

(assert (=> d!140389 (= c!124144 (bvsge #b00000000000000000000000000000000 (size!40768 (_keys!12153 thiss!1559))))))

(assert (=> d!140389 (and (bvsle #b00000000000000000000000000000000 (size!40768 (_keys!12153 thiss!1559))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!40768 (_keys!12153 thiss!1559)) (size!40768 (_keys!12153 thiss!1559))))))

(assert (=> d!140389 (= (arrayCountValidKeys!0 (_keys!12153 thiss!1559) #b00000000000000000000000000000000 (size!40768 (_keys!12153 thiss!1559))) lt!575588)))

(assert (= (and d!140389 c!124144) b!1274321))

(assert (= (and d!140389 (not c!124144)) b!1274318))

(assert (= (and b!1274318 c!124143) b!1274319))

(assert (= (and b!1274318 (not c!124143)) b!1274320))

(assert (= (or b!1274319 b!1274320) bm!62644))

(assert (=> b!1274318 m!1171999))

(assert (=> b!1274318 m!1171999))

(assert (=> b!1274318 m!1172001))

(declare-fun m!1172017 () Bool)

(assert (=> bm!62644 m!1172017))

(assert (=> b!1274260 d!140389))

(declare-fun mapIsEmpty!51207 () Bool)

(declare-fun mapRes!51207 () Bool)

(assert (=> mapIsEmpty!51207 mapRes!51207))

(declare-fun mapNonEmpty!51207 () Bool)

(declare-fun tp!97620 () Bool)

(declare-fun e!727061 () Bool)

(assert (=> mapNonEmpty!51207 (= mapRes!51207 (and tp!97620 e!727061))))

(declare-fun mapValue!51207 () ValueCell!15677)

(declare-fun mapRest!51207 () (Array (_ BitVec 32) ValueCell!15677))

(declare-fun mapKey!51207 () (_ BitVec 32))

(assert (=> mapNonEmpty!51207 (= mapRest!51206 (store mapRest!51207 mapKey!51207 mapValue!51207))))

(declare-fun condMapEmpty!51207 () Bool)

(declare-fun mapDefault!51207 () ValueCell!15677)

(assert (=> mapNonEmpty!51206 (= condMapEmpty!51207 (= mapRest!51206 ((as const (Array (_ BitVec 32) ValueCell!15677)) mapDefault!51207)))))

(declare-fun e!727062 () Bool)

(assert (=> mapNonEmpty!51206 (= tp!97619 (and e!727062 mapRes!51207))))

(declare-fun b!1274323 () Bool)

(assert (=> b!1274323 (= e!727062 tp_is_empty!33061)))

(declare-fun b!1274322 () Bool)

(assert (=> b!1274322 (= e!727061 tp_is_empty!33061)))

(assert (= (and mapNonEmpty!51206 condMapEmpty!51207) mapIsEmpty!51207))

(assert (= (and mapNonEmpty!51206 (not condMapEmpty!51207)) mapNonEmpty!51207))

(assert (= (and mapNonEmpty!51207 ((_ is ValueCellFull!15677) mapValue!51207)) b!1274322))

(assert (= (and mapNonEmpty!51206 ((_ is ValueCellFull!15677) mapDefault!51207)) b!1274323))

(declare-fun m!1172019 () Bool)

(assert (=> mapNonEmpty!51207 m!1172019))

(check-sat (not bm!62641) (not bm!62644) (not mapNonEmpty!51207) (not b!1274309) tp_is_empty!33061 (not b_next!27691) (not bm!62638) (not b!1274283) (not b!1274295) (not d!140385) (not b!1274318) (not b!1274285) (not b!1274282) (not b!1274296) b_and!45749 (not b!1274307))
(check-sat b_and!45749 (not b_next!27691))
