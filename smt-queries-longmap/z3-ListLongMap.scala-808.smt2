; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19586 () Bool)

(assert start!19586)

(declare-fun b!191950 () Bool)

(declare-fun b_free!4687 () Bool)

(declare-fun b_next!4687 () Bool)

(assert (=> b!191950 (= b_free!4687 (not b_next!4687))))

(declare-fun tp!16914 () Bool)

(declare-fun b_and!11347 () Bool)

(assert (=> b!191950 (= tp!16914 b_and!11347)))

(declare-fun mapNonEmpty!7705 () Bool)

(declare-fun mapRes!7705 () Bool)

(declare-fun tp!16915 () Bool)

(declare-fun e!126298 () Bool)

(assert (=> mapNonEmpty!7705 (= mapRes!7705 (and tp!16915 e!126298))))

(declare-datatypes ((V!5593 0))(
  ( (V!5594 (val!2274 Int)) )
))
(declare-datatypes ((ValueCell!1886 0))(
  ( (ValueCellFull!1886 (v!4213 V!5593)) (EmptyCell!1886) )
))
(declare-fun mapValue!7705 () ValueCell!1886)

(declare-fun mapRest!7705 () (Array (_ BitVec 32) ValueCell!1886))

(declare-datatypes ((array!8139 0))(
  ( (array!8140 (arr!3832 (Array (_ BitVec 32) (_ BitVec 64))) (size!4156 (_ BitVec 32))) )
))
(declare-datatypes ((array!8141 0))(
  ( (array!8142 (arr!3833 (Array (_ BitVec 32) ValueCell!1886)) (size!4157 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2680 0))(
  ( (LongMapFixedSize!2681 (defaultEntry!3920 Int) (mask!9149 (_ BitVec 32)) (extraKeys!3657 (_ BitVec 32)) (zeroValue!3761 V!5593) (minValue!3761 V!5593) (_size!1389 (_ BitVec 32)) (_keys!5901 array!8139) (_values!3903 array!8141) (_vacant!1389 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2680)

(declare-fun mapKey!7705 () (_ BitVec 32))

(assert (=> mapNonEmpty!7705 (= (arr!3833 (_values!3903 thiss!1248)) (store mapRest!7705 mapKey!7705 mapValue!7705))))

(declare-fun e!126304 () Bool)

(declare-fun e!126301 () Bool)

(declare-fun tp_is_empty!4459 () Bool)

(declare-fun array_inv!2487 (array!8139) Bool)

(declare-fun array_inv!2488 (array!8141) Bool)

(assert (=> b!191950 (= e!126304 (and tp!16914 tp_is_empty!4459 (array_inv!2487 (_keys!5901 thiss!1248)) (array_inv!2488 (_values!3903 thiss!1248)) e!126301))))

(declare-fun b!191951 () Bool)

(declare-fun e!126306 () Bool)

(declare-fun e!126299 () Bool)

(assert (=> b!191951 (= e!126306 (not e!126299))))

(declare-fun res!90681 () Bool)

(assert (=> b!191951 (=> res!90681 e!126299)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!191951 (= res!90681 (not (validMask!0 (mask!9149 thiss!1248))))))

(declare-datatypes ((SeekEntryResult!684 0))(
  ( (MissingZero!684 (index!4906 (_ BitVec 32))) (Found!684 (index!4907 (_ BitVec 32))) (Intermediate!684 (undefined!1496 Bool) (index!4908 (_ BitVec 32)) (x!20581 (_ BitVec 32))) (Undefined!684) (MissingVacant!684 (index!4909 (_ BitVec 32))) )
))
(declare-fun lt!95277 () SeekEntryResult!684)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun v!309 () V!5593)

(declare-datatypes ((tuple2!3490 0))(
  ( (tuple2!3491 (_1!1756 (_ BitVec 64)) (_2!1756 V!5593)) )
))
(declare-datatypes ((List!2409 0))(
  ( (Nil!2406) (Cons!2405 (h!3045 tuple2!3490) (t!7316 List!2409)) )
))
(declare-datatypes ((ListLongMap!2399 0))(
  ( (ListLongMap!2400 (toList!1215 List!2409)) )
))
(declare-fun lt!95278 () ListLongMap!2399)

(declare-fun +!307 (ListLongMap!2399 tuple2!3490) ListLongMap!2399)

(declare-fun getCurrentListMap!848 (array!8139 array!8141 (_ BitVec 32) (_ BitVec 32) V!5593 V!5593 (_ BitVec 32) Int) ListLongMap!2399)

(assert (=> b!191951 (= (+!307 lt!95278 (tuple2!3491 key!828 v!309)) (getCurrentListMap!848 (_keys!5901 thiss!1248) (array!8142 (store (arr!3833 (_values!3903 thiss!1248)) (index!4907 lt!95277) (ValueCellFull!1886 v!309)) (size!4157 (_values!3903 thiss!1248))) (mask!9149 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248)))))

(declare-datatypes ((Unit!5763 0))(
  ( (Unit!5764) )
))
(declare-fun lt!95276 () Unit!5763)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!123 (array!8139 array!8141 (_ BitVec 32) (_ BitVec 32) V!5593 V!5593 (_ BitVec 32) (_ BitVec 64) V!5593 Int) Unit!5763)

(assert (=> b!191951 (= lt!95276 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!123 (_keys!5901 thiss!1248) (_values!3903 thiss!1248) (mask!9149 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) (index!4907 lt!95277) key!828 v!309 (defaultEntry!3920 thiss!1248)))))

(declare-fun lt!95275 () Unit!5763)

(declare-fun e!126305 () Unit!5763)

(assert (=> b!191951 (= lt!95275 e!126305)))

(declare-fun c!34590 () Bool)

(declare-fun contains!1337 (ListLongMap!2399 (_ BitVec 64)) Bool)

(assert (=> b!191951 (= c!34590 (contains!1337 lt!95278 key!828))))

(assert (=> b!191951 (= lt!95278 (getCurrentListMap!848 (_keys!5901 thiss!1248) (_values!3903 thiss!1248) (mask!9149 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248)))))

(declare-fun b!191952 () Bool)

(assert (=> b!191952 (= e!126298 tp_is_empty!4459)))

(declare-fun b!191953 () Bool)

(declare-fun e!126303 () Bool)

(assert (=> b!191953 (= e!126303 e!126306)))

(declare-fun res!90680 () Bool)

(assert (=> b!191953 (=> (not res!90680) (not e!126306))))

(get-info :version)

(assert (=> b!191953 (= res!90680 (and (not ((_ is Undefined!684) lt!95277)) (not ((_ is MissingVacant!684) lt!95277)) (not ((_ is MissingZero!684) lt!95277)) ((_ is Found!684) lt!95277)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8139 (_ BitVec 32)) SeekEntryResult!684)

(assert (=> b!191953 (= lt!95277 (seekEntryOrOpen!0 key!828 (_keys!5901 thiss!1248) (mask!9149 thiss!1248)))))

(declare-fun res!90683 () Bool)

(assert (=> start!19586 (=> (not res!90683) (not e!126303))))

(declare-fun valid!1118 (LongMapFixedSize!2680) Bool)

(assert (=> start!19586 (= res!90683 (valid!1118 thiss!1248))))

(assert (=> start!19586 e!126303))

(assert (=> start!19586 e!126304))

(assert (=> start!19586 true))

(assert (=> start!19586 tp_is_empty!4459))

(declare-fun b!191954 () Bool)

(declare-fun lt!95274 () Unit!5763)

(assert (=> b!191954 (= e!126305 lt!95274)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!173 (array!8139 array!8141 (_ BitVec 32) (_ BitVec 32) V!5593 V!5593 (_ BitVec 64) Int) Unit!5763)

(assert (=> b!191954 (= lt!95274 (lemmaInListMapThenSeekEntryOrOpenFindsIt!173 (_keys!5901 thiss!1248) (_values!3903 thiss!1248) (mask!9149 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) key!828 (defaultEntry!3920 thiss!1248)))))

(declare-fun res!90679 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!191954 (= res!90679 (inRange!0 (index!4907 lt!95277) (mask!9149 thiss!1248)))))

(declare-fun e!126302 () Bool)

(assert (=> b!191954 (=> (not res!90679) (not e!126302))))

(assert (=> b!191954 e!126302))

(declare-fun b!191955 () Bool)

(declare-fun res!90682 () Bool)

(assert (=> b!191955 (=> (not res!90682) (not e!126303))))

(assert (=> b!191955 (= res!90682 (not (= key!828 (bvneg key!828))))))

(declare-fun b!191956 () Bool)

(declare-fun e!126300 () Bool)

(assert (=> b!191956 (= e!126300 tp_is_empty!4459)))

(declare-fun b!191957 () Bool)

(declare-fun Unit!5765 () Unit!5763)

(assert (=> b!191957 (= e!126305 Unit!5765)))

(declare-fun lt!95273 () Unit!5763)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!172 (array!8139 array!8141 (_ BitVec 32) (_ BitVec 32) V!5593 V!5593 (_ BitVec 64) Int) Unit!5763)

(assert (=> b!191957 (= lt!95273 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!172 (_keys!5901 thiss!1248) (_values!3903 thiss!1248) (mask!9149 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) key!828 (defaultEntry!3920 thiss!1248)))))

(assert (=> b!191957 false))

(declare-fun b!191958 () Bool)

(assert (=> b!191958 (= e!126299 (or (not (= (size!4157 (_values!3903 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9149 thiss!1248)))) (not (= (size!4156 (_keys!5901 thiss!1248)) (size!4157 (_values!3903 thiss!1248)))) (bvslt (mask!9149 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3657 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3657 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!191959 () Bool)

(assert (=> b!191959 (= e!126301 (and e!126300 mapRes!7705))))

(declare-fun condMapEmpty!7705 () Bool)

(declare-fun mapDefault!7705 () ValueCell!1886)

(assert (=> b!191959 (= condMapEmpty!7705 (= (arr!3833 (_values!3903 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1886)) mapDefault!7705)))))

(declare-fun mapIsEmpty!7705 () Bool)

(assert (=> mapIsEmpty!7705 mapRes!7705))

(declare-fun b!191960 () Bool)

(assert (=> b!191960 (= e!126302 (= (select (arr!3832 (_keys!5901 thiss!1248)) (index!4907 lt!95277)) key!828))))

(assert (= (and start!19586 res!90683) b!191955))

(assert (= (and b!191955 res!90682) b!191953))

(assert (= (and b!191953 res!90680) b!191951))

(assert (= (and b!191951 c!34590) b!191954))

(assert (= (and b!191951 (not c!34590)) b!191957))

(assert (= (and b!191954 res!90679) b!191960))

(assert (= (and b!191951 (not res!90681)) b!191958))

(assert (= (and b!191959 condMapEmpty!7705) mapIsEmpty!7705))

(assert (= (and b!191959 (not condMapEmpty!7705)) mapNonEmpty!7705))

(assert (= (and mapNonEmpty!7705 ((_ is ValueCellFull!1886) mapValue!7705)) b!191952))

(assert (= (and b!191959 ((_ is ValueCellFull!1886) mapDefault!7705)) b!191956))

(assert (= b!191950 b!191959))

(assert (= start!19586 b!191950))

(declare-fun m!218191 () Bool)

(assert (=> mapNonEmpty!7705 m!218191))

(declare-fun m!218193 () Bool)

(assert (=> b!191950 m!218193))

(declare-fun m!218195 () Bool)

(assert (=> b!191950 m!218195))

(declare-fun m!218197 () Bool)

(assert (=> b!191954 m!218197))

(declare-fun m!218199 () Bool)

(assert (=> b!191954 m!218199))

(declare-fun m!218201 () Bool)

(assert (=> b!191953 m!218201))

(declare-fun m!218203 () Bool)

(assert (=> b!191951 m!218203))

(declare-fun m!218205 () Bool)

(assert (=> b!191951 m!218205))

(declare-fun m!218207 () Bool)

(assert (=> b!191951 m!218207))

(declare-fun m!218209 () Bool)

(assert (=> b!191951 m!218209))

(declare-fun m!218211 () Bool)

(assert (=> b!191951 m!218211))

(declare-fun m!218213 () Bool)

(assert (=> b!191951 m!218213))

(declare-fun m!218215 () Bool)

(assert (=> b!191951 m!218215))

(declare-fun m!218217 () Bool)

(assert (=> b!191957 m!218217))

(declare-fun m!218219 () Bool)

(assert (=> start!19586 m!218219))

(declare-fun m!218221 () Bool)

(assert (=> b!191960 m!218221))

(check-sat (not b_next!4687) (not b!191951) (not b!191950) (not b!191954) (not b!191957) (not mapNonEmpty!7705) b_and!11347 (not b!191953) (not start!19586) tp_is_empty!4459)
(check-sat b_and!11347 (not b_next!4687))
(get-model)

(declare-fun lt!95320 () SeekEntryResult!684)

(declare-fun call!19372 () Bool)

(declare-fun c!34602 () Bool)

(declare-fun bm!19368 () Bool)

(assert (=> bm!19368 (= call!19372 (inRange!0 (ite c!34602 (index!4906 lt!95320) (index!4909 lt!95320)) (mask!9149 thiss!1248)))))

(declare-fun b!192043 () Bool)

(declare-fun e!126376 () Bool)

(declare-fun e!126377 () Bool)

(assert (=> b!192043 (= e!126376 e!126377)))

(declare-fun res!90724 () Bool)

(assert (=> b!192043 (= res!90724 call!19372)))

(assert (=> b!192043 (=> (not res!90724) (not e!126377))))

(declare-fun b!192044 () Bool)

(assert (=> b!192044 (and (bvsge (index!4906 lt!95320) #b00000000000000000000000000000000) (bvslt (index!4906 lt!95320) (size!4156 (_keys!5901 thiss!1248))))))

(declare-fun res!90723 () Bool)

(assert (=> b!192044 (= res!90723 (= (select (arr!3832 (_keys!5901 thiss!1248)) (index!4906 lt!95320)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!192044 (=> (not res!90723) (not e!126377))))

(declare-fun b!192045 () Bool)

(declare-fun e!126379 () Bool)

(assert (=> b!192045 (= e!126376 e!126379)))

(declare-fun c!34601 () Bool)

(assert (=> b!192045 (= c!34601 ((_ is MissingVacant!684) lt!95320))))

(declare-fun b!192046 () Bool)

(assert (=> b!192046 (= e!126379 ((_ is Undefined!684) lt!95320))))

(declare-fun b!192047 () Bool)

(declare-fun e!126378 () Bool)

(declare-fun call!19371 () Bool)

(assert (=> b!192047 (= e!126378 (not call!19371))))

(declare-fun d!56185 () Bool)

(assert (=> d!56185 e!126376))

(assert (=> d!56185 (= c!34602 ((_ is MissingZero!684) lt!95320))))

(assert (=> d!56185 (= lt!95320 (seekEntryOrOpen!0 key!828 (_keys!5901 thiss!1248) (mask!9149 thiss!1248)))))

(declare-fun lt!95319 () Unit!5763)

(declare-fun choose!1051 (array!8139 array!8141 (_ BitVec 32) (_ BitVec 32) V!5593 V!5593 (_ BitVec 64) Int) Unit!5763)

(assert (=> d!56185 (= lt!95319 (choose!1051 (_keys!5901 thiss!1248) (_values!3903 thiss!1248) (mask!9149 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) key!828 (defaultEntry!3920 thiss!1248)))))

(assert (=> d!56185 (validMask!0 (mask!9149 thiss!1248))))

(assert (=> d!56185 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!172 (_keys!5901 thiss!1248) (_values!3903 thiss!1248) (mask!9149 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) key!828 (defaultEntry!3920 thiss!1248)) lt!95319)))

(declare-fun b!192048 () Bool)

(declare-fun res!90722 () Bool)

(assert (=> b!192048 (=> (not res!90722) (not e!126378))))

(assert (=> b!192048 (= res!90722 call!19372)))

(assert (=> b!192048 (= e!126379 e!126378)))

(declare-fun b!192049 () Bool)

(declare-fun res!90725 () Bool)

(assert (=> b!192049 (=> (not res!90725) (not e!126378))))

(assert (=> b!192049 (= res!90725 (= (select (arr!3832 (_keys!5901 thiss!1248)) (index!4909 lt!95320)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!192049 (and (bvsge (index!4909 lt!95320) #b00000000000000000000000000000000) (bvslt (index!4909 lt!95320) (size!4156 (_keys!5901 thiss!1248))))))

(declare-fun b!192050 () Bool)

(assert (=> b!192050 (= e!126377 (not call!19371))))

(declare-fun bm!19369 () Bool)

(declare-fun arrayContainsKey!0 (array!8139 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!19369 (= call!19371 (arrayContainsKey!0 (_keys!5901 thiss!1248) key!828 #b00000000000000000000000000000000))))

(assert (= (and d!56185 c!34602) b!192043))

(assert (= (and d!56185 (not c!34602)) b!192045))

(assert (= (and b!192043 res!90724) b!192044))

(assert (= (and b!192044 res!90723) b!192050))

(assert (= (and b!192045 c!34601) b!192048))

(assert (= (and b!192045 (not c!34601)) b!192046))

(assert (= (and b!192048 res!90722) b!192049))

(assert (= (and b!192049 res!90725) b!192047))

(assert (= (or b!192043 b!192048) bm!19368))

(assert (= (or b!192050 b!192047) bm!19369))

(declare-fun m!218287 () Bool)

(assert (=> b!192049 m!218287))

(declare-fun m!218289 () Bool)

(assert (=> b!192044 m!218289))

(declare-fun m!218291 () Bool)

(assert (=> bm!19368 m!218291))

(assert (=> d!56185 m!218201))

(declare-fun m!218293 () Bool)

(assert (=> d!56185 m!218293))

(assert (=> d!56185 m!218215))

(declare-fun m!218295 () Bool)

(assert (=> bm!19369 m!218295))

(assert (=> b!191957 d!56185))

(declare-fun d!56187 () Bool)

(declare-fun res!90732 () Bool)

(declare-fun e!126382 () Bool)

(assert (=> d!56187 (=> (not res!90732) (not e!126382))))

(declare-fun simpleValid!199 (LongMapFixedSize!2680) Bool)

(assert (=> d!56187 (= res!90732 (simpleValid!199 thiss!1248))))

(assert (=> d!56187 (= (valid!1118 thiss!1248) e!126382)))

(declare-fun b!192057 () Bool)

(declare-fun res!90733 () Bool)

(assert (=> b!192057 (=> (not res!90733) (not e!126382))))

(declare-fun arrayCountValidKeys!0 (array!8139 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!192057 (= res!90733 (= (arrayCountValidKeys!0 (_keys!5901 thiss!1248) #b00000000000000000000000000000000 (size!4156 (_keys!5901 thiss!1248))) (_size!1389 thiss!1248)))))

(declare-fun b!192058 () Bool)

(declare-fun res!90734 () Bool)

(assert (=> b!192058 (=> (not res!90734) (not e!126382))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8139 (_ BitVec 32)) Bool)

(assert (=> b!192058 (= res!90734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5901 thiss!1248) (mask!9149 thiss!1248)))))

(declare-fun b!192059 () Bool)

(declare-datatypes ((List!2410 0))(
  ( (Nil!2407) (Cons!2406 (h!3046 (_ BitVec 64)) (t!7319 List!2410)) )
))
(declare-fun arrayNoDuplicates!0 (array!8139 (_ BitVec 32) List!2410) Bool)

(assert (=> b!192059 (= e!126382 (arrayNoDuplicates!0 (_keys!5901 thiss!1248) #b00000000000000000000000000000000 Nil!2407))))

(assert (= (and d!56187 res!90732) b!192057))

(assert (= (and b!192057 res!90733) b!192058))

(assert (= (and b!192058 res!90734) b!192059))

(declare-fun m!218297 () Bool)

(assert (=> d!56187 m!218297))

(declare-fun m!218299 () Bool)

(assert (=> b!192057 m!218299))

(declare-fun m!218301 () Bool)

(assert (=> b!192058 m!218301))

(declare-fun m!218303 () Bool)

(assert (=> b!192059 m!218303))

(assert (=> start!19586 d!56187))

(declare-fun b!192072 () Bool)

(declare-fun e!126389 () SeekEntryResult!684)

(declare-fun e!126391 () SeekEntryResult!684)

(assert (=> b!192072 (= e!126389 e!126391)))

(declare-fun lt!95327 () (_ BitVec 64))

(declare-fun lt!95329 () SeekEntryResult!684)

(assert (=> b!192072 (= lt!95327 (select (arr!3832 (_keys!5901 thiss!1248)) (index!4908 lt!95329)))))

(declare-fun c!34609 () Bool)

(assert (=> b!192072 (= c!34609 (= lt!95327 key!828))))

(declare-fun b!192073 () Bool)

(assert (=> b!192073 (= e!126391 (Found!684 (index!4908 lt!95329)))))

(declare-fun b!192074 () Bool)

(declare-fun e!126390 () SeekEntryResult!684)

(assert (=> b!192074 (= e!126390 (MissingZero!684 (index!4908 lt!95329)))))

(declare-fun b!192075 () Bool)

(declare-fun c!34611 () Bool)

(assert (=> b!192075 (= c!34611 (= lt!95327 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!192075 (= e!126391 e!126390)))

(declare-fun b!192076 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8139 (_ BitVec 32)) SeekEntryResult!684)

(assert (=> b!192076 (= e!126390 (seekKeyOrZeroReturnVacant!0 (x!20581 lt!95329) (index!4908 lt!95329) (index!4908 lt!95329) key!828 (_keys!5901 thiss!1248) (mask!9149 thiss!1248)))))

(declare-fun d!56189 () Bool)

(declare-fun lt!95328 () SeekEntryResult!684)

(assert (=> d!56189 (and (or ((_ is Undefined!684) lt!95328) (not ((_ is Found!684) lt!95328)) (and (bvsge (index!4907 lt!95328) #b00000000000000000000000000000000) (bvslt (index!4907 lt!95328) (size!4156 (_keys!5901 thiss!1248))))) (or ((_ is Undefined!684) lt!95328) ((_ is Found!684) lt!95328) (not ((_ is MissingZero!684) lt!95328)) (and (bvsge (index!4906 lt!95328) #b00000000000000000000000000000000) (bvslt (index!4906 lt!95328) (size!4156 (_keys!5901 thiss!1248))))) (or ((_ is Undefined!684) lt!95328) ((_ is Found!684) lt!95328) ((_ is MissingZero!684) lt!95328) (not ((_ is MissingVacant!684) lt!95328)) (and (bvsge (index!4909 lt!95328) #b00000000000000000000000000000000) (bvslt (index!4909 lt!95328) (size!4156 (_keys!5901 thiss!1248))))) (or ((_ is Undefined!684) lt!95328) (ite ((_ is Found!684) lt!95328) (= (select (arr!3832 (_keys!5901 thiss!1248)) (index!4907 lt!95328)) key!828) (ite ((_ is MissingZero!684) lt!95328) (= (select (arr!3832 (_keys!5901 thiss!1248)) (index!4906 lt!95328)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!684) lt!95328) (= (select (arr!3832 (_keys!5901 thiss!1248)) (index!4909 lt!95328)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!56189 (= lt!95328 e!126389)))

(declare-fun c!34610 () Bool)

(assert (=> d!56189 (= c!34610 (and ((_ is Intermediate!684) lt!95329) (undefined!1496 lt!95329)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8139 (_ BitVec 32)) SeekEntryResult!684)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!56189 (= lt!95329 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9149 thiss!1248)) key!828 (_keys!5901 thiss!1248) (mask!9149 thiss!1248)))))

(assert (=> d!56189 (validMask!0 (mask!9149 thiss!1248))))

(assert (=> d!56189 (= (seekEntryOrOpen!0 key!828 (_keys!5901 thiss!1248) (mask!9149 thiss!1248)) lt!95328)))

(declare-fun b!192077 () Bool)

(assert (=> b!192077 (= e!126389 Undefined!684)))

(assert (= (and d!56189 c!34610) b!192077))

(assert (= (and d!56189 (not c!34610)) b!192072))

(assert (= (and b!192072 c!34609) b!192073))

(assert (= (and b!192072 (not c!34609)) b!192075))

(assert (= (and b!192075 c!34611) b!192074))

(assert (= (and b!192075 (not c!34611)) b!192076))

(declare-fun m!218305 () Bool)

(assert (=> b!192072 m!218305))

(declare-fun m!218307 () Bool)

(assert (=> b!192076 m!218307))

(assert (=> d!56189 m!218215))

(declare-fun m!218309 () Bool)

(assert (=> d!56189 m!218309))

(declare-fun m!218311 () Bool)

(assert (=> d!56189 m!218311))

(declare-fun m!218313 () Bool)

(assert (=> d!56189 m!218313))

(assert (=> d!56189 m!218311))

(declare-fun m!218315 () Bool)

(assert (=> d!56189 m!218315))

(declare-fun m!218317 () Bool)

(assert (=> d!56189 m!218317))

(assert (=> b!191953 d!56189))

(declare-fun d!56191 () Bool)

(declare-fun e!126394 () Bool)

(assert (=> d!56191 e!126394))

(declare-fun res!90739 () Bool)

(assert (=> d!56191 (=> (not res!90739) (not e!126394))))

(declare-fun lt!95334 () SeekEntryResult!684)

(assert (=> d!56191 (= res!90739 ((_ is Found!684) lt!95334))))

(assert (=> d!56191 (= lt!95334 (seekEntryOrOpen!0 key!828 (_keys!5901 thiss!1248) (mask!9149 thiss!1248)))))

(declare-fun lt!95335 () Unit!5763)

(declare-fun choose!1052 (array!8139 array!8141 (_ BitVec 32) (_ BitVec 32) V!5593 V!5593 (_ BitVec 64) Int) Unit!5763)

(assert (=> d!56191 (= lt!95335 (choose!1052 (_keys!5901 thiss!1248) (_values!3903 thiss!1248) (mask!9149 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) key!828 (defaultEntry!3920 thiss!1248)))))

(assert (=> d!56191 (validMask!0 (mask!9149 thiss!1248))))

(assert (=> d!56191 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!173 (_keys!5901 thiss!1248) (_values!3903 thiss!1248) (mask!9149 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) key!828 (defaultEntry!3920 thiss!1248)) lt!95335)))

(declare-fun b!192082 () Bool)

(declare-fun res!90740 () Bool)

(assert (=> b!192082 (=> (not res!90740) (not e!126394))))

(assert (=> b!192082 (= res!90740 (inRange!0 (index!4907 lt!95334) (mask!9149 thiss!1248)))))

(declare-fun b!192083 () Bool)

(assert (=> b!192083 (= e!126394 (= (select (arr!3832 (_keys!5901 thiss!1248)) (index!4907 lt!95334)) key!828))))

(assert (=> b!192083 (and (bvsge (index!4907 lt!95334) #b00000000000000000000000000000000) (bvslt (index!4907 lt!95334) (size!4156 (_keys!5901 thiss!1248))))))

(assert (= (and d!56191 res!90739) b!192082))

(assert (= (and b!192082 res!90740) b!192083))

(assert (=> d!56191 m!218201))

(declare-fun m!218319 () Bool)

(assert (=> d!56191 m!218319))

(assert (=> d!56191 m!218215))

(declare-fun m!218321 () Bool)

(assert (=> b!192082 m!218321))

(declare-fun m!218323 () Bool)

(assert (=> b!192083 m!218323))

(assert (=> b!191954 d!56191))

(declare-fun d!56193 () Bool)

(assert (=> d!56193 (= (inRange!0 (index!4907 lt!95277) (mask!9149 thiss!1248)) (and (bvsge (index!4907 lt!95277) #b00000000000000000000000000000000) (bvslt (index!4907 lt!95277) (bvadd (mask!9149 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!191954 d!56193))

(declare-fun d!56195 () Bool)

(assert (=> d!56195 (= (array_inv!2487 (_keys!5901 thiss!1248)) (bvsge (size!4156 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!191950 d!56195))

(declare-fun d!56197 () Bool)

(assert (=> d!56197 (= (array_inv!2488 (_values!3903 thiss!1248)) (bvsge (size!4157 (_values!3903 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!191950 d!56197))

(declare-fun d!56199 () Bool)

(assert (=> d!56199 (= (validMask!0 (mask!9149 thiss!1248)) (and (or (= (mask!9149 thiss!1248) #b00000000000000000000000000000111) (= (mask!9149 thiss!1248) #b00000000000000000000000000001111) (= (mask!9149 thiss!1248) #b00000000000000000000000000011111) (= (mask!9149 thiss!1248) #b00000000000000000000000000111111) (= (mask!9149 thiss!1248) #b00000000000000000000000001111111) (= (mask!9149 thiss!1248) #b00000000000000000000000011111111) (= (mask!9149 thiss!1248) #b00000000000000000000000111111111) (= (mask!9149 thiss!1248) #b00000000000000000000001111111111) (= (mask!9149 thiss!1248) #b00000000000000000000011111111111) (= (mask!9149 thiss!1248) #b00000000000000000000111111111111) (= (mask!9149 thiss!1248) #b00000000000000000001111111111111) (= (mask!9149 thiss!1248) #b00000000000000000011111111111111) (= (mask!9149 thiss!1248) #b00000000000000000111111111111111) (= (mask!9149 thiss!1248) #b00000000000000001111111111111111) (= (mask!9149 thiss!1248) #b00000000000000011111111111111111) (= (mask!9149 thiss!1248) #b00000000000000111111111111111111) (= (mask!9149 thiss!1248) #b00000000000001111111111111111111) (= (mask!9149 thiss!1248) #b00000000000011111111111111111111) (= (mask!9149 thiss!1248) #b00000000000111111111111111111111) (= (mask!9149 thiss!1248) #b00000000001111111111111111111111) (= (mask!9149 thiss!1248) #b00000000011111111111111111111111) (= (mask!9149 thiss!1248) #b00000000111111111111111111111111) (= (mask!9149 thiss!1248) #b00000001111111111111111111111111) (= (mask!9149 thiss!1248) #b00000011111111111111111111111111) (= (mask!9149 thiss!1248) #b00000111111111111111111111111111) (= (mask!9149 thiss!1248) #b00001111111111111111111111111111) (= (mask!9149 thiss!1248) #b00011111111111111111111111111111) (= (mask!9149 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9149 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!191951 d!56199))

(declare-fun d!56201 () Bool)

(declare-fun e!126397 () Bool)

(assert (=> d!56201 e!126397))

(declare-fun res!90743 () Bool)

(assert (=> d!56201 (=> (not res!90743) (not e!126397))))

(assert (=> d!56201 (= res!90743 (and (bvsge (index!4907 lt!95277) #b00000000000000000000000000000000) (bvslt (index!4907 lt!95277) (size!4157 (_values!3903 thiss!1248)))))))

(declare-fun lt!95338 () Unit!5763)

(declare-fun choose!1053 (array!8139 array!8141 (_ BitVec 32) (_ BitVec 32) V!5593 V!5593 (_ BitVec 32) (_ BitVec 64) V!5593 Int) Unit!5763)

(assert (=> d!56201 (= lt!95338 (choose!1053 (_keys!5901 thiss!1248) (_values!3903 thiss!1248) (mask!9149 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) (index!4907 lt!95277) key!828 v!309 (defaultEntry!3920 thiss!1248)))))

(assert (=> d!56201 (validMask!0 (mask!9149 thiss!1248))))

(assert (=> d!56201 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!123 (_keys!5901 thiss!1248) (_values!3903 thiss!1248) (mask!9149 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) (index!4907 lt!95277) key!828 v!309 (defaultEntry!3920 thiss!1248)) lt!95338)))

(declare-fun b!192086 () Bool)

(assert (=> b!192086 (= e!126397 (= (+!307 (getCurrentListMap!848 (_keys!5901 thiss!1248) (_values!3903 thiss!1248) (mask!9149 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248)) (tuple2!3491 key!828 v!309)) (getCurrentListMap!848 (_keys!5901 thiss!1248) (array!8142 (store (arr!3833 (_values!3903 thiss!1248)) (index!4907 lt!95277) (ValueCellFull!1886 v!309)) (size!4157 (_values!3903 thiss!1248))) (mask!9149 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248))))))

(assert (= (and d!56201 res!90743) b!192086))

(declare-fun m!218325 () Bool)

(assert (=> d!56201 m!218325))

(assert (=> d!56201 m!218215))

(assert (=> b!192086 m!218205))

(assert (=> b!192086 m!218205))

(declare-fun m!218327 () Bool)

(assert (=> b!192086 m!218327))

(assert (=> b!192086 m!218211))

(assert (=> b!192086 m!218207))

(assert (=> b!191951 d!56201))

(declare-fun b!192129 () Bool)

(declare-fun e!126429 () ListLongMap!2399)

(declare-fun call!19393 () ListLongMap!2399)

(assert (=> b!192129 (= e!126429 call!19393)))

(declare-fun b!192130 () Bool)

(declare-fun e!126427 () Bool)

(declare-fun e!126433 () Bool)

(assert (=> b!192130 (= e!126427 e!126433)))

(declare-fun res!90769 () Bool)

(assert (=> b!192130 (=> (not res!90769) (not e!126433))))

(declare-fun lt!95404 () ListLongMap!2399)

(assert (=> b!192130 (= res!90769 (contains!1337 lt!95404 (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!192130 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4156 (_keys!5901 thiss!1248))))))

(declare-fun b!192131 () Bool)

(declare-fun c!34627 () Bool)

(assert (=> b!192131 (= c!34627 (and (not (= (bvand (extraKeys!3657 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3657 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!126426 () ListLongMap!2399)

(assert (=> b!192131 (= e!126426 e!126429)))

(declare-fun bm!19384 () Bool)

(declare-fun call!19388 () ListLongMap!2399)

(declare-fun call!19390 () ListLongMap!2399)

(assert (=> bm!19384 (= call!19388 call!19390)))

(declare-fun b!192132 () Bool)

(declare-fun e!126425 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!192132 (= e!126425 (validKeyInArray!0 (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192133 () Bool)

(declare-fun e!126428 () Bool)

(declare-fun e!126434 () Bool)

(assert (=> b!192133 (= e!126428 e!126434)))

(declare-fun res!90764 () Bool)

(declare-fun call!19391 () Bool)

(assert (=> b!192133 (= res!90764 call!19391)))

(assert (=> b!192133 (=> (not res!90764) (not e!126434))))

(declare-fun b!192134 () Bool)

(declare-fun e!126430 () ListLongMap!2399)

(assert (=> b!192134 (= e!126430 e!126426)))

(declare-fun c!34624 () Bool)

(assert (=> b!192134 (= c!34624 (and (not (= (bvand (extraKeys!3657 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3657 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19385 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!204 (array!8139 array!8141 (_ BitVec 32) (_ BitVec 32) V!5593 V!5593 (_ BitVec 32) Int) ListLongMap!2399)

(assert (=> bm!19385 (= call!19390 (getCurrentListMapNoExtraKeys!204 (_keys!5901 thiss!1248) (_values!3903 thiss!1248) (mask!9149 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248)))))

(declare-fun d!56203 () Bool)

(declare-fun e!126435 () Bool)

(assert (=> d!56203 e!126435))

(declare-fun res!90767 () Bool)

(assert (=> d!56203 (=> (not res!90767) (not e!126435))))

(assert (=> d!56203 (= res!90767 (or (bvsge #b00000000000000000000000000000000 (size!4156 (_keys!5901 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4156 (_keys!5901 thiss!1248))))))))

(declare-fun lt!95398 () ListLongMap!2399)

(assert (=> d!56203 (= lt!95404 lt!95398)))

(declare-fun lt!95392 () Unit!5763)

(declare-fun e!126432 () Unit!5763)

(assert (=> d!56203 (= lt!95392 e!126432)))

(declare-fun c!34625 () Bool)

(assert (=> d!56203 (= c!34625 e!126425)))

(declare-fun res!90765 () Bool)

(assert (=> d!56203 (=> (not res!90765) (not e!126425))))

(assert (=> d!56203 (= res!90765 (bvslt #b00000000000000000000000000000000 (size!4156 (_keys!5901 thiss!1248))))))

(assert (=> d!56203 (= lt!95398 e!126430)))

(declare-fun c!34626 () Bool)

(assert (=> d!56203 (= c!34626 (and (not (= (bvand (extraKeys!3657 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3657 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56203 (validMask!0 (mask!9149 thiss!1248))))

(assert (=> d!56203 (= (getCurrentListMap!848 (_keys!5901 thiss!1248) (_values!3903 thiss!1248) (mask!9149 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248)) lt!95404)))

(declare-fun b!192135 () Bool)

(declare-fun lt!95390 () Unit!5763)

(assert (=> b!192135 (= e!126432 lt!95390)))

(declare-fun lt!95389 () ListLongMap!2399)

(assert (=> b!192135 (= lt!95389 (getCurrentListMapNoExtraKeys!204 (_keys!5901 thiss!1248) (_values!3903 thiss!1248) (mask!9149 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248)))))

(declare-fun lt!95396 () (_ BitVec 64))

(assert (=> b!192135 (= lt!95396 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95400 () (_ BitVec 64))

(assert (=> b!192135 (= lt!95400 (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95403 () Unit!5763)

(declare-fun addStillContains!159 (ListLongMap!2399 (_ BitVec 64) V!5593 (_ BitVec 64)) Unit!5763)

(assert (=> b!192135 (= lt!95403 (addStillContains!159 lt!95389 lt!95396 (zeroValue!3761 thiss!1248) lt!95400))))

(assert (=> b!192135 (contains!1337 (+!307 lt!95389 (tuple2!3491 lt!95396 (zeroValue!3761 thiss!1248))) lt!95400)))

(declare-fun lt!95393 () Unit!5763)

(assert (=> b!192135 (= lt!95393 lt!95403)))

(declare-fun lt!95388 () ListLongMap!2399)

(assert (=> b!192135 (= lt!95388 (getCurrentListMapNoExtraKeys!204 (_keys!5901 thiss!1248) (_values!3903 thiss!1248) (mask!9149 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248)))))

(declare-fun lt!95395 () (_ BitVec 64))

(assert (=> b!192135 (= lt!95395 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95384 () (_ BitVec 64))

(assert (=> b!192135 (= lt!95384 (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95401 () Unit!5763)

(declare-fun addApplyDifferent!159 (ListLongMap!2399 (_ BitVec 64) V!5593 (_ BitVec 64)) Unit!5763)

(assert (=> b!192135 (= lt!95401 (addApplyDifferent!159 lt!95388 lt!95395 (minValue!3761 thiss!1248) lt!95384))))

(declare-fun apply!183 (ListLongMap!2399 (_ BitVec 64)) V!5593)

(assert (=> b!192135 (= (apply!183 (+!307 lt!95388 (tuple2!3491 lt!95395 (minValue!3761 thiss!1248))) lt!95384) (apply!183 lt!95388 lt!95384))))

(declare-fun lt!95397 () Unit!5763)

(assert (=> b!192135 (= lt!95397 lt!95401)))

(declare-fun lt!95402 () ListLongMap!2399)

(assert (=> b!192135 (= lt!95402 (getCurrentListMapNoExtraKeys!204 (_keys!5901 thiss!1248) (_values!3903 thiss!1248) (mask!9149 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248)))))

(declare-fun lt!95394 () (_ BitVec 64))

(assert (=> b!192135 (= lt!95394 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95391 () (_ BitVec 64))

(assert (=> b!192135 (= lt!95391 (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95387 () Unit!5763)

(assert (=> b!192135 (= lt!95387 (addApplyDifferent!159 lt!95402 lt!95394 (zeroValue!3761 thiss!1248) lt!95391))))

(assert (=> b!192135 (= (apply!183 (+!307 lt!95402 (tuple2!3491 lt!95394 (zeroValue!3761 thiss!1248))) lt!95391) (apply!183 lt!95402 lt!95391))))

(declare-fun lt!95383 () Unit!5763)

(assert (=> b!192135 (= lt!95383 lt!95387)))

(declare-fun lt!95399 () ListLongMap!2399)

(assert (=> b!192135 (= lt!95399 (getCurrentListMapNoExtraKeys!204 (_keys!5901 thiss!1248) (_values!3903 thiss!1248) (mask!9149 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248)))))

(declare-fun lt!95386 () (_ BitVec 64))

(assert (=> b!192135 (= lt!95386 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95385 () (_ BitVec 64))

(assert (=> b!192135 (= lt!95385 (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!192135 (= lt!95390 (addApplyDifferent!159 lt!95399 lt!95386 (minValue!3761 thiss!1248) lt!95385))))

(assert (=> b!192135 (= (apply!183 (+!307 lt!95399 (tuple2!3491 lt!95386 (minValue!3761 thiss!1248))) lt!95385) (apply!183 lt!95399 lt!95385))))

(declare-fun b!192136 () Bool)

(declare-fun get!2213 (ValueCell!1886 V!5593) V!5593)

(declare-fun dynLambda!517 (Int (_ BitVec 64)) V!5593)

(assert (=> b!192136 (= e!126433 (= (apply!183 lt!95404 (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000)) (get!2213 (select (arr!3833 (_values!3903 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!517 (defaultEntry!3920 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!192136 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4157 (_values!3903 thiss!1248))))))

(assert (=> b!192136 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4156 (_keys!5901 thiss!1248))))))

(declare-fun bm!19386 () Bool)

(declare-fun call!19389 () ListLongMap!2399)

(assert (=> bm!19386 (= call!19389 (+!307 (ite c!34626 call!19390 (ite c!34624 call!19388 call!19393)) (ite (or c!34626 c!34624) (tuple2!3491 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))))))

(declare-fun bm!19387 () Bool)

(declare-fun call!19387 () Bool)

(assert (=> bm!19387 (= call!19387 (contains!1337 lt!95404 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!192137 () Bool)

(declare-fun e!126424 () Bool)

(declare-fun e!126431 () Bool)

(assert (=> b!192137 (= e!126424 e!126431)))

(declare-fun res!90763 () Bool)

(assert (=> b!192137 (= res!90763 call!19387)))

(assert (=> b!192137 (=> (not res!90763) (not e!126431))))

(declare-fun b!192138 () Bool)

(declare-fun e!126436 () Bool)

(assert (=> b!192138 (= e!126436 (validKeyInArray!0 (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192139 () Bool)

(assert (=> b!192139 (= e!126431 (= (apply!183 lt!95404 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3761 thiss!1248)))))

(declare-fun b!192140 () Bool)

(declare-fun res!90770 () Bool)

(assert (=> b!192140 (=> (not res!90770) (not e!126435))))

(assert (=> b!192140 (= res!90770 e!126427)))

(declare-fun res!90762 () Bool)

(assert (=> b!192140 (=> res!90762 e!126427)))

(assert (=> b!192140 (= res!90762 (not e!126436))))

(declare-fun res!90766 () Bool)

(assert (=> b!192140 (=> (not res!90766) (not e!126436))))

(assert (=> b!192140 (= res!90766 (bvslt #b00000000000000000000000000000000 (size!4156 (_keys!5901 thiss!1248))))))

(declare-fun bm!19388 () Bool)

(assert (=> bm!19388 (= call!19391 (contains!1337 lt!95404 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19389 () Bool)

(assert (=> bm!19389 (= call!19393 call!19388)))

(declare-fun b!192141 () Bool)

(declare-fun res!90768 () Bool)

(assert (=> b!192141 (=> (not res!90768) (not e!126435))))

(assert (=> b!192141 (= res!90768 e!126428)))

(declare-fun c!34628 () Bool)

(assert (=> b!192141 (= c!34628 (not (= (bvand (extraKeys!3657 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!19390 () Bool)

(declare-fun call!19392 () ListLongMap!2399)

(assert (=> bm!19390 (= call!19392 call!19389)))

(declare-fun b!192142 () Bool)

(declare-fun Unit!5766 () Unit!5763)

(assert (=> b!192142 (= e!126432 Unit!5766)))

(declare-fun b!192143 () Bool)

(assert (=> b!192143 (= e!126434 (= (apply!183 lt!95404 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3761 thiss!1248)))))

(declare-fun b!192144 () Bool)

(assert (=> b!192144 (= e!126424 (not call!19387))))

(declare-fun b!192145 () Bool)

(assert (=> b!192145 (= e!126426 call!19392)))

(declare-fun b!192146 () Bool)

(assert (=> b!192146 (= e!126430 (+!307 call!19389 (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))))))

(declare-fun b!192147 () Bool)

(assert (=> b!192147 (= e!126435 e!126424)))

(declare-fun c!34629 () Bool)

(assert (=> b!192147 (= c!34629 (not (= (bvand (extraKeys!3657 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!192148 () Bool)

(assert (=> b!192148 (= e!126429 call!19392)))

(declare-fun b!192149 () Bool)

(assert (=> b!192149 (= e!126428 (not call!19391))))

(assert (= (and d!56203 c!34626) b!192146))

(assert (= (and d!56203 (not c!34626)) b!192134))

(assert (= (and b!192134 c!34624) b!192145))

(assert (= (and b!192134 (not c!34624)) b!192131))

(assert (= (and b!192131 c!34627) b!192148))

(assert (= (and b!192131 (not c!34627)) b!192129))

(assert (= (or b!192148 b!192129) bm!19389))

(assert (= (or b!192145 bm!19389) bm!19384))

(assert (= (or b!192145 b!192148) bm!19390))

(assert (= (or b!192146 bm!19384) bm!19385))

(assert (= (or b!192146 bm!19390) bm!19386))

(assert (= (and d!56203 res!90765) b!192132))

(assert (= (and d!56203 c!34625) b!192135))

(assert (= (and d!56203 (not c!34625)) b!192142))

(assert (= (and d!56203 res!90767) b!192140))

(assert (= (and b!192140 res!90766) b!192138))

(assert (= (and b!192140 (not res!90762)) b!192130))

(assert (= (and b!192130 res!90769) b!192136))

(assert (= (and b!192140 res!90770) b!192141))

(assert (= (and b!192141 c!34628) b!192133))

(assert (= (and b!192141 (not c!34628)) b!192149))

(assert (= (and b!192133 res!90764) b!192143))

(assert (= (or b!192133 b!192149) bm!19388))

(assert (= (and b!192141 res!90768) b!192147))

(assert (= (and b!192147 c!34629) b!192137))

(assert (= (and b!192147 (not c!34629)) b!192144))

(assert (= (and b!192137 res!90763) b!192139))

(assert (= (or b!192137 b!192144) bm!19387))

(declare-fun b_lambda!7405 () Bool)

(assert (=> (not b_lambda!7405) (not b!192136)))

(declare-fun t!7318 () Bool)

(declare-fun tb!2869 () Bool)

(assert (=> (and b!191950 (= (defaultEntry!3920 thiss!1248) (defaultEntry!3920 thiss!1248)) t!7318) tb!2869))

(declare-fun result!4901 () Bool)

(assert (=> tb!2869 (= result!4901 tp_is_empty!4459)))

(assert (=> b!192136 t!7318))

(declare-fun b_and!11353 () Bool)

(assert (= b_and!11347 (and (=> t!7318 result!4901) b_and!11353)))

(assert (=> d!56203 m!218215))

(declare-fun m!218329 () Bool)

(assert (=> bm!19387 m!218329))

(declare-fun m!218331 () Bool)

(assert (=> bm!19386 m!218331))

(declare-fun m!218333 () Bool)

(assert (=> b!192130 m!218333))

(assert (=> b!192130 m!218333))

(declare-fun m!218335 () Bool)

(assert (=> b!192130 m!218335))

(declare-fun m!218337 () Bool)

(assert (=> b!192139 m!218337))

(declare-fun m!218339 () Bool)

(assert (=> b!192146 m!218339))

(declare-fun m!218341 () Bool)

(assert (=> b!192136 m!218341))

(declare-fun m!218343 () Bool)

(assert (=> b!192136 m!218343))

(assert (=> b!192136 m!218341))

(declare-fun m!218345 () Bool)

(assert (=> b!192136 m!218345))

(assert (=> b!192136 m!218333))

(declare-fun m!218347 () Bool)

(assert (=> b!192136 m!218347))

(assert (=> b!192136 m!218343))

(assert (=> b!192136 m!218333))

(assert (=> b!192132 m!218333))

(assert (=> b!192132 m!218333))

(declare-fun m!218349 () Bool)

(assert (=> b!192132 m!218349))

(declare-fun m!218351 () Bool)

(assert (=> b!192135 m!218351))

(declare-fun m!218353 () Bool)

(assert (=> b!192135 m!218353))

(declare-fun m!218355 () Bool)

(assert (=> b!192135 m!218355))

(declare-fun m!218357 () Bool)

(assert (=> b!192135 m!218357))

(declare-fun m!218359 () Bool)

(assert (=> b!192135 m!218359))

(declare-fun m!218361 () Bool)

(assert (=> b!192135 m!218361))

(declare-fun m!218363 () Bool)

(assert (=> b!192135 m!218363))

(declare-fun m!218365 () Bool)

(assert (=> b!192135 m!218365))

(assert (=> b!192135 m!218333))

(assert (=> b!192135 m!218353))

(assert (=> b!192135 m!218359))

(declare-fun m!218367 () Bool)

(assert (=> b!192135 m!218367))

(declare-fun m!218369 () Bool)

(assert (=> b!192135 m!218369))

(declare-fun m!218371 () Bool)

(assert (=> b!192135 m!218371))

(assert (=> b!192135 m!218371))

(declare-fun m!218373 () Bool)

(assert (=> b!192135 m!218373))

(declare-fun m!218375 () Bool)

(assert (=> b!192135 m!218375))

(declare-fun m!218377 () Bool)

(assert (=> b!192135 m!218377))

(assert (=> b!192135 m!218377))

(declare-fun m!218379 () Bool)

(assert (=> b!192135 m!218379))

(declare-fun m!218381 () Bool)

(assert (=> b!192135 m!218381))

(declare-fun m!218383 () Bool)

(assert (=> bm!19388 m!218383))

(assert (=> b!192138 m!218333))

(assert (=> b!192138 m!218333))

(assert (=> b!192138 m!218349))

(assert (=> bm!19385 m!218357))

(declare-fun m!218385 () Bool)

(assert (=> b!192143 m!218385))

(assert (=> b!191951 d!56203))

(declare-fun b!192152 () Bool)

(declare-fun e!126442 () ListLongMap!2399)

(declare-fun call!19400 () ListLongMap!2399)

(assert (=> b!192152 (= e!126442 call!19400)))

(declare-fun b!192153 () Bool)

(declare-fun e!126440 () Bool)

(declare-fun e!126446 () Bool)

(assert (=> b!192153 (= e!126440 e!126446)))

(declare-fun res!90778 () Bool)

(assert (=> b!192153 (=> (not res!90778) (not e!126446))))

(declare-fun lt!95426 () ListLongMap!2399)

(assert (=> b!192153 (= res!90778 (contains!1337 lt!95426 (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!192153 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4156 (_keys!5901 thiss!1248))))))

(declare-fun b!192154 () Bool)

(declare-fun c!34633 () Bool)

(assert (=> b!192154 (= c!34633 (and (not (= (bvand (extraKeys!3657 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3657 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!126439 () ListLongMap!2399)

(assert (=> b!192154 (= e!126439 e!126442)))

(declare-fun bm!19391 () Bool)

(declare-fun call!19395 () ListLongMap!2399)

(declare-fun call!19397 () ListLongMap!2399)

(assert (=> bm!19391 (= call!19395 call!19397)))

(declare-fun b!192155 () Bool)

(declare-fun e!126438 () Bool)

(assert (=> b!192155 (= e!126438 (validKeyInArray!0 (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192156 () Bool)

(declare-fun e!126441 () Bool)

(declare-fun e!126447 () Bool)

(assert (=> b!192156 (= e!126441 e!126447)))

(declare-fun res!90773 () Bool)

(declare-fun call!19398 () Bool)

(assert (=> b!192156 (= res!90773 call!19398)))

(assert (=> b!192156 (=> (not res!90773) (not e!126447))))

(declare-fun b!192157 () Bool)

(declare-fun e!126443 () ListLongMap!2399)

(assert (=> b!192157 (= e!126443 e!126439)))

(declare-fun c!34630 () Bool)

(assert (=> b!192157 (= c!34630 (and (not (= (bvand (extraKeys!3657 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3657 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19392 () Bool)

(assert (=> bm!19392 (= call!19397 (getCurrentListMapNoExtraKeys!204 (_keys!5901 thiss!1248) (array!8142 (store (arr!3833 (_values!3903 thiss!1248)) (index!4907 lt!95277) (ValueCellFull!1886 v!309)) (size!4157 (_values!3903 thiss!1248))) (mask!9149 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248)))))

(declare-fun d!56205 () Bool)

(declare-fun e!126448 () Bool)

(assert (=> d!56205 e!126448))

(declare-fun res!90776 () Bool)

(assert (=> d!56205 (=> (not res!90776) (not e!126448))))

(assert (=> d!56205 (= res!90776 (or (bvsge #b00000000000000000000000000000000 (size!4156 (_keys!5901 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4156 (_keys!5901 thiss!1248))))))))

(declare-fun lt!95420 () ListLongMap!2399)

(assert (=> d!56205 (= lt!95426 lt!95420)))

(declare-fun lt!95414 () Unit!5763)

(declare-fun e!126445 () Unit!5763)

(assert (=> d!56205 (= lt!95414 e!126445)))

(declare-fun c!34631 () Bool)

(assert (=> d!56205 (= c!34631 e!126438)))

(declare-fun res!90774 () Bool)

(assert (=> d!56205 (=> (not res!90774) (not e!126438))))

(assert (=> d!56205 (= res!90774 (bvslt #b00000000000000000000000000000000 (size!4156 (_keys!5901 thiss!1248))))))

(assert (=> d!56205 (= lt!95420 e!126443)))

(declare-fun c!34632 () Bool)

(assert (=> d!56205 (= c!34632 (and (not (= (bvand (extraKeys!3657 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3657 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56205 (validMask!0 (mask!9149 thiss!1248))))

(assert (=> d!56205 (= (getCurrentListMap!848 (_keys!5901 thiss!1248) (array!8142 (store (arr!3833 (_values!3903 thiss!1248)) (index!4907 lt!95277) (ValueCellFull!1886 v!309)) (size!4157 (_values!3903 thiss!1248))) (mask!9149 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248)) lt!95426)))

(declare-fun b!192158 () Bool)

(declare-fun lt!95412 () Unit!5763)

(assert (=> b!192158 (= e!126445 lt!95412)))

(declare-fun lt!95411 () ListLongMap!2399)

(assert (=> b!192158 (= lt!95411 (getCurrentListMapNoExtraKeys!204 (_keys!5901 thiss!1248) (array!8142 (store (arr!3833 (_values!3903 thiss!1248)) (index!4907 lt!95277) (ValueCellFull!1886 v!309)) (size!4157 (_values!3903 thiss!1248))) (mask!9149 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248)))))

(declare-fun lt!95418 () (_ BitVec 64))

(assert (=> b!192158 (= lt!95418 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95422 () (_ BitVec 64))

(assert (=> b!192158 (= lt!95422 (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95425 () Unit!5763)

(assert (=> b!192158 (= lt!95425 (addStillContains!159 lt!95411 lt!95418 (zeroValue!3761 thiss!1248) lt!95422))))

(assert (=> b!192158 (contains!1337 (+!307 lt!95411 (tuple2!3491 lt!95418 (zeroValue!3761 thiss!1248))) lt!95422)))

(declare-fun lt!95415 () Unit!5763)

(assert (=> b!192158 (= lt!95415 lt!95425)))

(declare-fun lt!95410 () ListLongMap!2399)

(assert (=> b!192158 (= lt!95410 (getCurrentListMapNoExtraKeys!204 (_keys!5901 thiss!1248) (array!8142 (store (arr!3833 (_values!3903 thiss!1248)) (index!4907 lt!95277) (ValueCellFull!1886 v!309)) (size!4157 (_values!3903 thiss!1248))) (mask!9149 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248)))))

(declare-fun lt!95417 () (_ BitVec 64))

(assert (=> b!192158 (= lt!95417 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95406 () (_ BitVec 64))

(assert (=> b!192158 (= lt!95406 (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95423 () Unit!5763)

(assert (=> b!192158 (= lt!95423 (addApplyDifferent!159 lt!95410 lt!95417 (minValue!3761 thiss!1248) lt!95406))))

(assert (=> b!192158 (= (apply!183 (+!307 lt!95410 (tuple2!3491 lt!95417 (minValue!3761 thiss!1248))) lt!95406) (apply!183 lt!95410 lt!95406))))

(declare-fun lt!95419 () Unit!5763)

(assert (=> b!192158 (= lt!95419 lt!95423)))

(declare-fun lt!95424 () ListLongMap!2399)

(assert (=> b!192158 (= lt!95424 (getCurrentListMapNoExtraKeys!204 (_keys!5901 thiss!1248) (array!8142 (store (arr!3833 (_values!3903 thiss!1248)) (index!4907 lt!95277) (ValueCellFull!1886 v!309)) (size!4157 (_values!3903 thiss!1248))) (mask!9149 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248)))))

(declare-fun lt!95416 () (_ BitVec 64))

(assert (=> b!192158 (= lt!95416 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95413 () (_ BitVec 64))

(assert (=> b!192158 (= lt!95413 (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95409 () Unit!5763)

(assert (=> b!192158 (= lt!95409 (addApplyDifferent!159 lt!95424 lt!95416 (zeroValue!3761 thiss!1248) lt!95413))))

(assert (=> b!192158 (= (apply!183 (+!307 lt!95424 (tuple2!3491 lt!95416 (zeroValue!3761 thiss!1248))) lt!95413) (apply!183 lt!95424 lt!95413))))

(declare-fun lt!95405 () Unit!5763)

(assert (=> b!192158 (= lt!95405 lt!95409)))

(declare-fun lt!95421 () ListLongMap!2399)

(assert (=> b!192158 (= lt!95421 (getCurrentListMapNoExtraKeys!204 (_keys!5901 thiss!1248) (array!8142 (store (arr!3833 (_values!3903 thiss!1248)) (index!4907 lt!95277) (ValueCellFull!1886 v!309)) (size!4157 (_values!3903 thiss!1248))) (mask!9149 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248)))))

(declare-fun lt!95408 () (_ BitVec 64))

(assert (=> b!192158 (= lt!95408 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95407 () (_ BitVec 64))

(assert (=> b!192158 (= lt!95407 (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!192158 (= lt!95412 (addApplyDifferent!159 lt!95421 lt!95408 (minValue!3761 thiss!1248) lt!95407))))

(assert (=> b!192158 (= (apply!183 (+!307 lt!95421 (tuple2!3491 lt!95408 (minValue!3761 thiss!1248))) lt!95407) (apply!183 lt!95421 lt!95407))))

(declare-fun b!192159 () Bool)

(assert (=> b!192159 (= e!126446 (= (apply!183 lt!95426 (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000)) (get!2213 (select (arr!3833 (array!8142 (store (arr!3833 (_values!3903 thiss!1248)) (index!4907 lt!95277) (ValueCellFull!1886 v!309)) (size!4157 (_values!3903 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!517 (defaultEntry!3920 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!192159 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4157 (array!8142 (store (arr!3833 (_values!3903 thiss!1248)) (index!4907 lt!95277) (ValueCellFull!1886 v!309)) (size!4157 (_values!3903 thiss!1248))))))))

(assert (=> b!192159 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4156 (_keys!5901 thiss!1248))))))

(declare-fun call!19396 () ListLongMap!2399)

(declare-fun bm!19393 () Bool)

(assert (=> bm!19393 (= call!19396 (+!307 (ite c!34632 call!19397 (ite c!34630 call!19395 call!19400)) (ite (or c!34632 c!34630) (tuple2!3491 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))))))

(declare-fun bm!19394 () Bool)

(declare-fun call!19394 () Bool)

(assert (=> bm!19394 (= call!19394 (contains!1337 lt!95426 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!192160 () Bool)

(declare-fun e!126437 () Bool)

(declare-fun e!126444 () Bool)

(assert (=> b!192160 (= e!126437 e!126444)))

(declare-fun res!90772 () Bool)

(assert (=> b!192160 (= res!90772 call!19394)))

(assert (=> b!192160 (=> (not res!90772) (not e!126444))))

(declare-fun b!192161 () Bool)

(declare-fun e!126449 () Bool)

(assert (=> b!192161 (= e!126449 (validKeyInArray!0 (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192162 () Bool)

(assert (=> b!192162 (= e!126444 (= (apply!183 lt!95426 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3761 thiss!1248)))))

(declare-fun b!192163 () Bool)

(declare-fun res!90779 () Bool)

(assert (=> b!192163 (=> (not res!90779) (not e!126448))))

(assert (=> b!192163 (= res!90779 e!126440)))

(declare-fun res!90771 () Bool)

(assert (=> b!192163 (=> res!90771 e!126440)))

(assert (=> b!192163 (= res!90771 (not e!126449))))

(declare-fun res!90775 () Bool)

(assert (=> b!192163 (=> (not res!90775) (not e!126449))))

(assert (=> b!192163 (= res!90775 (bvslt #b00000000000000000000000000000000 (size!4156 (_keys!5901 thiss!1248))))))

(declare-fun bm!19395 () Bool)

(assert (=> bm!19395 (= call!19398 (contains!1337 lt!95426 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19396 () Bool)

(assert (=> bm!19396 (= call!19400 call!19395)))

(declare-fun b!192164 () Bool)

(declare-fun res!90777 () Bool)

(assert (=> b!192164 (=> (not res!90777) (not e!126448))))

(assert (=> b!192164 (= res!90777 e!126441)))

(declare-fun c!34634 () Bool)

(assert (=> b!192164 (= c!34634 (not (= (bvand (extraKeys!3657 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!19397 () Bool)

(declare-fun call!19399 () ListLongMap!2399)

(assert (=> bm!19397 (= call!19399 call!19396)))

(declare-fun b!192165 () Bool)

(declare-fun Unit!5767 () Unit!5763)

(assert (=> b!192165 (= e!126445 Unit!5767)))

(declare-fun b!192166 () Bool)

(assert (=> b!192166 (= e!126447 (= (apply!183 lt!95426 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3761 thiss!1248)))))

(declare-fun b!192167 () Bool)

(assert (=> b!192167 (= e!126437 (not call!19394))))

(declare-fun b!192168 () Bool)

(assert (=> b!192168 (= e!126439 call!19399)))

(declare-fun b!192169 () Bool)

(assert (=> b!192169 (= e!126443 (+!307 call!19396 (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))))))

(declare-fun b!192170 () Bool)

(assert (=> b!192170 (= e!126448 e!126437)))

(declare-fun c!34635 () Bool)

(assert (=> b!192170 (= c!34635 (not (= (bvand (extraKeys!3657 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!192171 () Bool)

(assert (=> b!192171 (= e!126442 call!19399)))

(declare-fun b!192172 () Bool)

(assert (=> b!192172 (= e!126441 (not call!19398))))

(assert (= (and d!56205 c!34632) b!192169))

(assert (= (and d!56205 (not c!34632)) b!192157))

(assert (= (and b!192157 c!34630) b!192168))

(assert (= (and b!192157 (not c!34630)) b!192154))

(assert (= (and b!192154 c!34633) b!192171))

(assert (= (and b!192154 (not c!34633)) b!192152))

(assert (= (or b!192171 b!192152) bm!19396))

(assert (= (or b!192168 bm!19396) bm!19391))

(assert (= (or b!192168 b!192171) bm!19397))

(assert (= (or b!192169 bm!19391) bm!19392))

(assert (= (or b!192169 bm!19397) bm!19393))

(assert (= (and d!56205 res!90774) b!192155))

(assert (= (and d!56205 c!34631) b!192158))

(assert (= (and d!56205 (not c!34631)) b!192165))

(assert (= (and d!56205 res!90776) b!192163))

(assert (= (and b!192163 res!90775) b!192161))

(assert (= (and b!192163 (not res!90771)) b!192153))

(assert (= (and b!192153 res!90778) b!192159))

(assert (= (and b!192163 res!90779) b!192164))

(assert (= (and b!192164 c!34634) b!192156))

(assert (= (and b!192164 (not c!34634)) b!192172))

(assert (= (and b!192156 res!90773) b!192166))

(assert (= (or b!192156 b!192172) bm!19395))

(assert (= (and b!192164 res!90777) b!192170))

(assert (= (and b!192170 c!34635) b!192160))

(assert (= (and b!192170 (not c!34635)) b!192167))

(assert (= (and b!192160 res!90772) b!192162))

(assert (= (or b!192160 b!192167) bm!19394))

(declare-fun b_lambda!7407 () Bool)

(assert (=> (not b_lambda!7407) (not b!192159)))

(assert (=> b!192159 t!7318))

(declare-fun b_and!11355 () Bool)

(assert (= b_and!11353 (and (=> t!7318 result!4901) b_and!11355)))

(assert (=> d!56205 m!218215))

(declare-fun m!218387 () Bool)

(assert (=> bm!19394 m!218387))

(declare-fun m!218389 () Bool)

(assert (=> bm!19393 m!218389))

(assert (=> b!192153 m!218333))

(assert (=> b!192153 m!218333))

(declare-fun m!218391 () Bool)

(assert (=> b!192153 m!218391))

(declare-fun m!218393 () Bool)

(assert (=> b!192162 m!218393))

(declare-fun m!218395 () Bool)

(assert (=> b!192169 m!218395))

(assert (=> b!192159 m!218341))

(declare-fun m!218397 () Bool)

(assert (=> b!192159 m!218397))

(assert (=> b!192159 m!218341))

(declare-fun m!218399 () Bool)

(assert (=> b!192159 m!218399))

(assert (=> b!192159 m!218333))

(declare-fun m!218401 () Bool)

(assert (=> b!192159 m!218401))

(assert (=> b!192159 m!218397))

(assert (=> b!192159 m!218333))

(assert (=> b!192155 m!218333))

(assert (=> b!192155 m!218333))

(assert (=> b!192155 m!218349))

(declare-fun m!218403 () Bool)

(assert (=> b!192158 m!218403))

(declare-fun m!218405 () Bool)

(assert (=> b!192158 m!218405))

(declare-fun m!218407 () Bool)

(assert (=> b!192158 m!218407))

(declare-fun m!218409 () Bool)

(assert (=> b!192158 m!218409))

(declare-fun m!218411 () Bool)

(assert (=> b!192158 m!218411))

(declare-fun m!218413 () Bool)

(assert (=> b!192158 m!218413))

(declare-fun m!218415 () Bool)

(assert (=> b!192158 m!218415))

(declare-fun m!218417 () Bool)

(assert (=> b!192158 m!218417))

(assert (=> b!192158 m!218333))

(assert (=> b!192158 m!218405))

(assert (=> b!192158 m!218411))

(declare-fun m!218419 () Bool)

(assert (=> b!192158 m!218419))

(declare-fun m!218421 () Bool)

(assert (=> b!192158 m!218421))

(declare-fun m!218423 () Bool)

(assert (=> b!192158 m!218423))

(assert (=> b!192158 m!218423))

(declare-fun m!218425 () Bool)

(assert (=> b!192158 m!218425))

(declare-fun m!218427 () Bool)

(assert (=> b!192158 m!218427))

(declare-fun m!218429 () Bool)

(assert (=> b!192158 m!218429))

(assert (=> b!192158 m!218429))

(declare-fun m!218431 () Bool)

(assert (=> b!192158 m!218431))

(declare-fun m!218433 () Bool)

(assert (=> b!192158 m!218433))

(declare-fun m!218435 () Bool)

(assert (=> bm!19395 m!218435))

(assert (=> b!192161 m!218333))

(assert (=> b!192161 m!218333))

(assert (=> b!192161 m!218349))

(assert (=> bm!19392 m!218409))

(declare-fun m!218437 () Bool)

(assert (=> b!192166 m!218437))

(assert (=> b!191951 d!56205))

(declare-fun d!56207 () Bool)

(declare-fun e!126452 () Bool)

(assert (=> d!56207 e!126452))

(declare-fun res!90784 () Bool)

(assert (=> d!56207 (=> (not res!90784) (not e!126452))))

(declare-fun lt!95436 () ListLongMap!2399)

(assert (=> d!56207 (= res!90784 (contains!1337 lt!95436 (_1!1756 (tuple2!3491 key!828 v!309))))))

(declare-fun lt!95438 () List!2409)

(assert (=> d!56207 (= lt!95436 (ListLongMap!2400 lt!95438))))

(declare-fun lt!95437 () Unit!5763)

(declare-fun lt!95435 () Unit!5763)

(assert (=> d!56207 (= lt!95437 lt!95435)))

(declare-datatypes ((Option!244 0))(
  ( (Some!243 (v!4218 V!5593)) (None!242) )
))
(declare-fun getValueByKey!238 (List!2409 (_ BitVec 64)) Option!244)

(assert (=> d!56207 (= (getValueByKey!238 lt!95438 (_1!1756 (tuple2!3491 key!828 v!309))) (Some!243 (_2!1756 (tuple2!3491 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!128 (List!2409 (_ BitVec 64) V!5593) Unit!5763)

(assert (=> d!56207 (= lt!95435 (lemmaContainsTupThenGetReturnValue!128 lt!95438 (_1!1756 (tuple2!3491 key!828 v!309)) (_2!1756 (tuple2!3491 key!828 v!309))))))

(declare-fun insertStrictlySorted!131 (List!2409 (_ BitVec 64) V!5593) List!2409)

(assert (=> d!56207 (= lt!95438 (insertStrictlySorted!131 (toList!1215 lt!95278) (_1!1756 (tuple2!3491 key!828 v!309)) (_2!1756 (tuple2!3491 key!828 v!309))))))

(assert (=> d!56207 (= (+!307 lt!95278 (tuple2!3491 key!828 v!309)) lt!95436)))

(declare-fun b!192177 () Bool)

(declare-fun res!90785 () Bool)

(assert (=> b!192177 (=> (not res!90785) (not e!126452))))

(assert (=> b!192177 (= res!90785 (= (getValueByKey!238 (toList!1215 lt!95436) (_1!1756 (tuple2!3491 key!828 v!309))) (Some!243 (_2!1756 (tuple2!3491 key!828 v!309)))))))

(declare-fun b!192178 () Bool)

(declare-fun contains!1338 (List!2409 tuple2!3490) Bool)

(assert (=> b!192178 (= e!126452 (contains!1338 (toList!1215 lt!95436) (tuple2!3491 key!828 v!309)))))

(assert (= (and d!56207 res!90784) b!192177))

(assert (= (and b!192177 res!90785) b!192178))

(declare-fun m!218439 () Bool)

(assert (=> d!56207 m!218439))

(declare-fun m!218441 () Bool)

(assert (=> d!56207 m!218441))

(declare-fun m!218443 () Bool)

(assert (=> d!56207 m!218443))

(declare-fun m!218445 () Bool)

(assert (=> d!56207 m!218445))

(declare-fun m!218447 () Bool)

(assert (=> b!192177 m!218447))

(declare-fun m!218449 () Bool)

(assert (=> b!192178 m!218449))

(assert (=> b!191951 d!56207))

(declare-fun d!56209 () Bool)

(declare-fun e!126457 () Bool)

(assert (=> d!56209 e!126457))

(declare-fun res!90788 () Bool)

(assert (=> d!56209 (=> res!90788 e!126457)))

(declare-fun lt!95448 () Bool)

(assert (=> d!56209 (= res!90788 (not lt!95448))))

(declare-fun lt!95450 () Bool)

(assert (=> d!56209 (= lt!95448 lt!95450)))

(declare-fun lt!95449 () Unit!5763)

(declare-fun e!126458 () Unit!5763)

(assert (=> d!56209 (= lt!95449 e!126458)))

(declare-fun c!34638 () Bool)

(assert (=> d!56209 (= c!34638 lt!95450)))

(declare-fun containsKey!242 (List!2409 (_ BitVec 64)) Bool)

(assert (=> d!56209 (= lt!95450 (containsKey!242 (toList!1215 lt!95278) key!828))))

(assert (=> d!56209 (= (contains!1337 lt!95278 key!828) lt!95448)))

(declare-fun b!192185 () Bool)

(declare-fun lt!95447 () Unit!5763)

(assert (=> b!192185 (= e!126458 lt!95447)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!191 (List!2409 (_ BitVec 64)) Unit!5763)

(assert (=> b!192185 (= lt!95447 (lemmaContainsKeyImpliesGetValueByKeyDefined!191 (toList!1215 lt!95278) key!828))))

(declare-fun isDefined!192 (Option!244) Bool)

(assert (=> b!192185 (isDefined!192 (getValueByKey!238 (toList!1215 lt!95278) key!828))))

(declare-fun b!192186 () Bool)

(declare-fun Unit!5768 () Unit!5763)

(assert (=> b!192186 (= e!126458 Unit!5768)))

(declare-fun b!192187 () Bool)

(assert (=> b!192187 (= e!126457 (isDefined!192 (getValueByKey!238 (toList!1215 lt!95278) key!828)))))

(assert (= (and d!56209 c!34638) b!192185))

(assert (= (and d!56209 (not c!34638)) b!192186))

(assert (= (and d!56209 (not res!90788)) b!192187))

(declare-fun m!218451 () Bool)

(assert (=> d!56209 m!218451))

(declare-fun m!218453 () Bool)

(assert (=> b!192185 m!218453))

(declare-fun m!218455 () Bool)

(assert (=> b!192185 m!218455))

(assert (=> b!192185 m!218455))

(declare-fun m!218457 () Bool)

(assert (=> b!192185 m!218457))

(assert (=> b!192187 m!218455))

(assert (=> b!192187 m!218455))

(assert (=> b!192187 m!218457))

(assert (=> b!191951 d!56209))

(declare-fun b!192194 () Bool)

(declare-fun e!126463 () Bool)

(assert (=> b!192194 (= e!126463 tp_is_empty!4459)))

(declare-fun mapIsEmpty!7714 () Bool)

(declare-fun mapRes!7714 () Bool)

(assert (=> mapIsEmpty!7714 mapRes!7714))

(declare-fun condMapEmpty!7714 () Bool)

(declare-fun mapDefault!7714 () ValueCell!1886)

(assert (=> mapNonEmpty!7705 (= condMapEmpty!7714 (= mapRest!7705 ((as const (Array (_ BitVec 32) ValueCell!1886)) mapDefault!7714)))))

(declare-fun e!126464 () Bool)

(assert (=> mapNonEmpty!7705 (= tp!16915 (and e!126464 mapRes!7714))))

(declare-fun b!192195 () Bool)

(assert (=> b!192195 (= e!126464 tp_is_empty!4459)))

(declare-fun mapNonEmpty!7714 () Bool)

(declare-fun tp!16930 () Bool)

(assert (=> mapNonEmpty!7714 (= mapRes!7714 (and tp!16930 e!126463))))

(declare-fun mapRest!7714 () (Array (_ BitVec 32) ValueCell!1886))

(declare-fun mapValue!7714 () ValueCell!1886)

(declare-fun mapKey!7714 () (_ BitVec 32))

(assert (=> mapNonEmpty!7714 (= mapRest!7705 (store mapRest!7714 mapKey!7714 mapValue!7714))))

(assert (= (and mapNonEmpty!7705 condMapEmpty!7714) mapIsEmpty!7714))

(assert (= (and mapNonEmpty!7705 (not condMapEmpty!7714)) mapNonEmpty!7714))

(assert (= (and mapNonEmpty!7714 ((_ is ValueCellFull!1886) mapValue!7714)) b!192194))

(assert (= (and mapNonEmpty!7705 ((_ is ValueCellFull!1886) mapDefault!7714)) b!192195))

(declare-fun m!218459 () Bool)

(assert (=> mapNonEmpty!7714 m!218459))

(declare-fun b_lambda!7409 () Bool)

(assert (= b_lambda!7405 (or (and b!191950 b_free!4687) b_lambda!7409)))

(declare-fun b_lambda!7411 () Bool)

(assert (= b_lambda!7407 (or (and b!191950 b_free!4687) b_lambda!7411)))

(check-sat (not b_next!4687) (not d!56203) (not mapNonEmpty!7714) (not b!192146) (not d!56201) (not b!192059) (not b!192153) (not b!192177) (not d!56205) (not bm!19387) (not bm!19395) (not b!192187) (not b!192139) (not b!192136) (not b!192082) (not bm!19388) (not b_lambda!7411) (not d!56207) (not d!56191) (not b!192161) (not bm!19386) (not b!192162) (not b!192143) (not d!56187) (not b!192169) (not bm!19392) (not b!192166) (not b!192185) (not b!192178) (not bm!19369) (not bm!19393) (not b!192086) (not b_lambda!7409) (not bm!19385) (not b!192076) (not bm!19368) (not b!192138) (not b!192058) (not b!192158) (not b!192135) (not bm!19394) tp_is_empty!4459 (not d!56209) (not b!192132) (not d!56185) (not b!192130) b_and!11355 (not b!192057) (not d!56189) (not b!192159) (not b!192155))
(check-sat b_and!11355 (not b_next!4687))
(get-model)

(declare-fun d!56211 () Bool)

(assert (=> d!56211 (= (validKeyInArray!0 (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!192138 d!56211))

(declare-fun d!56213 () Bool)

(declare-fun e!126465 () Bool)

(assert (=> d!56213 e!126465))

(declare-fun res!90789 () Bool)

(assert (=> d!56213 (=> res!90789 e!126465)))

(declare-fun lt!95452 () Bool)

(assert (=> d!56213 (= res!90789 (not lt!95452))))

(declare-fun lt!95454 () Bool)

(assert (=> d!56213 (= lt!95452 lt!95454)))

(declare-fun lt!95453 () Unit!5763)

(declare-fun e!126466 () Unit!5763)

(assert (=> d!56213 (= lt!95453 e!126466)))

(declare-fun c!34639 () Bool)

(assert (=> d!56213 (= c!34639 lt!95454)))

(assert (=> d!56213 (= lt!95454 (containsKey!242 (toList!1215 lt!95426) (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!56213 (= (contains!1337 lt!95426 (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000)) lt!95452)))

(declare-fun b!192196 () Bool)

(declare-fun lt!95451 () Unit!5763)

(assert (=> b!192196 (= e!126466 lt!95451)))

(assert (=> b!192196 (= lt!95451 (lemmaContainsKeyImpliesGetValueByKeyDefined!191 (toList!1215 lt!95426) (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!192196 (isDefined!192 (getValueByKey!238 (toList!1215 lt!95426) (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192197 () Bool)

(declare-fun Unit!5769 () Unit!5763)

(assert (=> b!192197 (= e!126466 Unit!5769)))

(declare-fun b!192198 () Bool)

(assert (=> b!192198 (= e!126465 (isDefined!192 (getValueByKey!238 (toList!1215 lt!95426) (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!56213 c!34639) b!192196))

(assert (= (and d!56213 (not c!34639)) b!192197))

(assert (= (and d!56213 (not res!90789)) b!192198))

(assert (=> d!56213 m!218333))

(declare-fun m!218461 () Bool)

(assert (=> d!56213 m!218461))

(assert (=> b!192196 m!218333))

(declare-fun m!218463 () Bool)

(assert (=> b!192196 m!218463))

(assert (=> b!192196 m!218333))

(declare-fun m!218465 () Bool)

(assert (=> b!192196 m!218465))

(assert (=> b!192196 m!218465))

(declare-fun m!218467 () Bool)

(assert (=> b!192196 m!218467))

(assert (=> b!192198 m!218333))

(assert (=> b!192198 m!218465))

(assert (=> b!192198 m!218465))

(assert (=> b!192198 m!218467))

(assert (=> b!192153 d!56213))

(declare-fun d!56215 () Bool)

(declare-fun get!2214 (Option!244) V!5593)

(assert (=> d!56215 (= (apply!183 lt!95426 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2214 (getValueByKey!238 (toList!1215 lt!95426) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7664 () Bool)

(assert (= bs!7664 d!56215))

(declare-fun m!218469 () Bool)

(assert (=> bs!7664 m!218469))

(assert (=> bs!7664 m!218469))

(declare-fun m!218471 () Bool)

(assert (=> bs!7664 m!218471))

(assert (=> b!192166 d!56215))

(declare-fun d!56217 () Bool)

(declare-fun e!126467 () Bool)

(assert (=> d!56217 e!126467))

(declare-fun res!90790 () Bool)

(assert (=> d!56217 (=> res!90790 e!126467)))

(declare-fun lt!95456 () Bool)

(assert (=> d!56217 (= res!90790 (not lt!95456))))

(declare-fun lt!95458 () Bool)

(assert (=> d!56217 (= lt!95456 lt!95458)))

(declare-fun lt!95457 () Unit!5763)

(declare-fun e!126468 () Unit!5763)

(assert (=> d!56217 (= lt!95457 e!126468)))

(declare-fun c!34640 () Bool)

(assert (=> d!56217 (= c!34640 lt!95458)))

(assert (=> d!56217 (= lt!95458 (containsKey!242 (toList!1215 lt!95436) (_1!1756 (tuple2!3491 key!828 v!309))))))

(assert (=> d!56217 (= (contains!1337 lt!95436 (_1!1756 (tuple2!3491 key!828 v!309))) lt!95456)))

(declare-fun b!192199 () Bool)

(declare-fun lt!95455 () Unit!5763)

(assert (=> b!192199 (= e!126468 lt!95455)))

(assert (=> b!192199 (= lt!95455 (lemmaContainsKeyImpliesGetValueByKeyDefined!191 (toList!1215 lt!95436) (_1!1756 (tuple2!3491 key!828 v!309))))))

(assert (=> b!192199 (isDefined!192 (getValueByKey!238 (toList!1215 lt!95436) (_1!1756 (tuple2!3491 key!828 v!309))))))

(declare-fun b!192200 () Bool)

(declare-fun Unit!5770 () Unit!5763)

(assert (=> b!192200 (= e!126468 Unit!5770)))

(declare-fun b!192201 () Bool)

(assert (=> b!192201 (= e!126467 (isDefined!192 (getValueByKey!238 (toList!1215 lt!95436) (_1!1756 (tuple2!3491 key!828 v!309)))))))

(assert (= (and d!56217 c!34640) b!192199))

(assert (= (and d!56217 (not c!34640)) b!192200))

(assert (= (and d!56217 (not res!90790)) b!192201))

(declare-fun m!218473 () Bool)

(assert (=> d!56217 m!218473))

(declare-fun m!218475 () Bool)

(assert (=> b!192199 m!218475))

(assert (=> b!192199 m!218447))

(assert (=> b!192199 m!218447))

(declare-fun m!218477 () Bool)

(assert (=> b!192199 m!218477))

(assert (=> b!192201 m!218447))

(assert (=> b!192201 m!218447))

(assert (=> b!192201 m!218477))

(assert (=> d!56207 d!56217))

(declare-fun b!192210 () Bool)

(declare-fun e!126473 () Option!244)

(assert (=> b!192210 (= e!126473 (Some!243 (_2!1756 (h!3045 lt!95438))))))

(declare-fun b!192213 () Bool)

(declare-fun e!126474 () Option!244)

(assert (=> b!192213 (= e!126474 None!242)))

(declare-fun d!56219 () Bool)

(declare-fun c!34645 () Bool)

(assert (=> d!56219 (= c!34645 (and ((_ is Cons!2405) lt!95438) (= (_1!1756 (h!3045 lt!95438)) (_1!1756 (tuple2!3491 key!828 v!309)))))))

(assert (=> d!56219 (= (getValueByKey!238 lt!95438 (_1!1756 (tuple2!3491 key!828 v!309))) e!126473)))

(declare-fun b!192211 () Bool)

(assert (=> b!192211 (= e!126473 e!126474)))

(declare-fun c!34646 () Bool)

(assert (=> b!192211 (= c!34646 (and ((_ is Cons!2405) lt!95438) (not (= (_1!1756 (h!3045 lt!95438)) (_1!1756 (tuple2!3491 key!828 v!309))))))))

(declare-fun b!192212 () Bool)

(assert (=> b!192212 (= e!126474 (getValueByKey!238 (t!7316 lt!95438) (_1!1756 (tuple2!3491 key!828 v!309))))))

(assert (= (and d!56219 c!34645) b!192210))

(assert (= (and d!56219 (not c!34645)) b!192211))

(assert (= (and b!192211 c!34646) b!192212))

(assert (= (and b!192211 (not c!34646)) b!192213))

(declare-fun m!218479 () Bool)

(assert (=> b!192212 m!218479))

(assert (=> d!56207 d!56219))

(declare-fun d!56221 () Bool)

(assert (=> d!56221 (= (getValueByKey!238 lt!95438 (_1!1756 (tuple2!3491 key!828 v!309))) (Some!243 (_2!1756 (tuple2!3491 key!828 v!309))))))

(declare-fun lt!95461 () Unit!5763)

(declare-fun choose!1054 (List!2409 (_ BitVec 64) V!5593) Unit!5763)

(assert (=> d!56221 (= lt!95461 (choose!1054 lt!95438 (_1!1756 (tuple2!3491 key!828 v!309)) (_2!1756 (tuple2!3491 key!828 v!309))))))

(declare-fun e!126477 () Bool)

(assert (=> d!56221 e!126477))

(declare-fun res!90795 () Bool)

(assert (=> d!56221 (=> (not res!90795) (not e!126477))))

(declare-fun isStrictlySorted!351 (List!2409) Bool)

(assert (=> d!56221 (= res!90795 (isStrictlySorted!351 lt!95438))))

(assert (=> d!56221 (= (lemmaContainsTupThenGetReturnValue!128 lt!95438 (_1!1756 (tuple2!3491 key!828 v!309)) (_2!1756 (tuple2!3491 key!828 v!309))) lt!95461)))

(declare-fun b!192218 () Bool)

(declare-fun res!90796 () Bool)

(assert (=> b!192218 (=> (not res!90796) (not e!126477))))

(assert (=> b!192218 (= res!90796 (containsKey!242 lt!95438 (_1!1756 (tuple2!3491 key!828 v!309))))))

(declare-fun b!192219 () Bool)

(assert (=> b!192219 (= e!126477 (contains!1338 lt!95438 (tuple2!3491 (_1!1756 (tuple2!3491 key!828 v!309)) (_2!1756 (tuple2!3491 key!828 v!309)))))))

(assert (= (and d!56221 res!90795) b!192218))

(assert (= (and b!192218 res!90796) b!192219))

(assert (=> d!56221 m!218441))

(declare-fun m!218481 () Bool)

(assert (=> d!56221 m!218481))

(declare-fun m!218483 () Bool)

(assert (=> d!56221 m!218483))

(declare-fun m!218485 () Bool)

(assert (=> b!192218 m!218485))

(declare-fun m!218487 () Bool)

(assert (=> b!192219 m!218487))

(assert (=> d!56207 d!56221))

(declare-fun b!192240 () Bool)

(declare-fun e!126490 () List!2409)

(declare-fun call!19409 () List!2409)

(assert (=> b!192240 (= e!126490 call!19409)))

(declare-fun b!192241 () Bool)

(declare-fun e!126489 () List!2409)

(declare-fun call!19408 () List!2409)

(assert (=> b!192241 (= e!126489 call!19408)))

(declare-fun bm!19404 () Bool)

(declare-fun call!19407 () List!2409)

(assert (=> bm!19404 (= call!19408 call!19407)))

(declare-fun b!192242 () Bool)

(declare-fun e!126488 () List!2409)

(assert (=> b!192242 (= e!126490 e!126488)))

(declare-fun c!34656 () Bool)

(assert (=> b!192242 (= c!34656 (and ((_ is Cons!2405) (toList!1215 lt!95278)) (= (_1!1756 (h!3045 (toList!1215 lt!95278))) (_1!1756 (tuple2!3491 key!828 v!309)))))))

(declare-fun b!192243 () Bool)

(declare-fun e!126492 () List!2409)

(assert (=> b!192243 (= e!126492 (insertStrictlySorted!131 (t!7316 (toList!1215 lt!95278)) (_1!1756 (tuple2!3491 key!828 v!309)) (_2!1756 (tuple2!3491 key!828 v!309))))))

(declare-fun c!34657 () Bool)

(declare-fun bm!19405 () Bool)

(declare-fun $colon$colon!101 (List!2409 tuple2!3490) List!2409)

(assert (=> bm!19405 (= call!19409 ($colon$colon!101 e!126492 (ite c!34657 (h!3045 (toList!1215 lt!95278)) (tuple2!3491 (_1!1756 (tuple2!3491 key!828 v!309)) (_2!1756 (tuple2!3491 key!828 v!309))))))))

(declare-fun c!34658 () Bool)

(assert (=> bm!19405 (= c!34658 c!34657)))

(declare-fun bm!19406 () Bool)

(assert (=> bm!19406 (= call!19407 call!19409)))

(declare-fun lt!95464 () List!2409)

(declare-fun e!126491 () Bool)

(declare-fun b!192244 () Bool)

(assert (=> b!192244 (= e!126491 (contains!1338 lt!95464 (tuple2!3491 (_1!1756 (tuple2!3491 key!828 v!309)) (_2!1756 (tuple2!3491 key!828 v!309)))))))

(declare-fun c!34655 () Bool)

(declare-fun b!192246 () Bool)

(assert (=> b!192246 (= c!34655 (and ((_ is Cons!2405) (toList!1215 lt!95278)) (bvsgt (_1!1756 (h!3045 (toList!1215 lt!95278))) (_1!1756 (tuple2!3491 key!828 v!309)))))))

(assert (=> b!192246 (= e!126488 e!126489)))

(declare-fun b!192247 () Bool)

(assert (=> b!192247 (= e!126489 call!19408)))

(declare-fun b!192248 () Bool)

(assert (=> b!192248 (= e!126492 (ite c!34656 (t!7316 (toList!1215 lt!95278)) (ite c!34655 (Cons!2405 (h!3045 (toList!1215 lt!95278)) (t!7316 (toList!1215 lt!95278))) Nil!2406)))))

(declare-fun b!192249 () Bool)

(declare-fun res!90802 () Bool)

(assert (=> b!192249 (=> (not res!90802) (not e!126491))))

(assert (=> b!192249 (= res!90802 (containsKey!242 lt!95464 (_1!1756 (tuple2!3491 key!828 v!309))))))

(declare-fun b!192245 () Bool)

(assert (=> b!192245 (= e!126488 call!19407)))

(declare-fun d!56223 () Bool)

(assert (=> d!56223 e!126491))

(declare-fun res!90801 () Bool)

(assert (=> d!56223 (=> (not res!90801) (not e!126491))))

(assert (=> d!56223 (= res!90801 (isStrictlySorted!351 lt!95464))))

(assert (=> d!56223 (= lt!95464 e!126490)))

(assert (=> d!56223 (= c!34657 (and ((_ is Cons!2405) (toList!1215 lt!95278)) (bvslt (_1!1756 (h!3045 (toList!1215 lt!95278))) (_1!1756 (tuple2!3491 key!828 v!309)))))))

(assert (=> d!56223 (isStrictlySorted!351 (toList!1215 lt!95278))))

(assert (=> d!56223 (= (insertStrictlySorted!131 (toList!1215 lt!95278) (_1!1756 (tuple2!3491 key!828 v!309)) (_2!1756 (tuple2!3491 key!828 v!309))) lt!95464)))

(assert (= (and d!56223 c!34657) b!192240))

(assert (= (and d!56223 (not c!34657)) b!192242))

(assert (= (and b!192242 c!34656) b!192245))

(assert (= (and b!192242 (not c!34656)) b!192246))

(assert (= (and b!192246 c!34655) b!192241))

(assert (= (and b!192246 (not c!34655)) b!192247))

(assert (= (or b!192241 b!192247) bm!19404))

(assert (= (or b!192245 bm!19404) bm!19406))

(assert (= (or b!192240 bm!19406) bm!19405))

(assert (= (and bm!19405 c!34658) b!192243))

(assert (= (and bm!19405 (not c!34658)) b!192248))

(assert (= (and d!56223 res!90801) b!192249))

(assert (= (and b!192249 res!90802) b!192244))

(declare-fun m!218489 () Bool)

(assert (=> bm!19405 m!218489))

(declare-fun m!218491 () Bool)

(assert (=> b!192249 m!218491))

(declare-fun m!218493 () Bool)

(assert (=> d!56223 m!218493))

(declare-fun m!218495 () Bool)

(assert (=> d!56223 m!218495))

(declare-fun m!218497 () Bool)

(assert (=> b!192244 m!218497))

(declare-fun m!218499 () Bool)

(assert (=> b!192243 m!218499))

(assert (=> d!56207 d!56223))

(declare-fun b!192258 () Bool)

(declare-fun res!90813 () Bool)

(declare-fun e!126495 () Bool)

(assert (=> b!192258 (=> (not res!90813) (not e!126495))))

(assert (=> b!192258 (= res!90813 (and (= (size!4157 (_values!3903 thiss!1248)) (bvadd (mask!9149 thiss!1248) #b00000000000000000000000000000001)) (= (size!4156 (_keys!5901 thiss!1248)) (size!4157 (_values!3903 thiss!1248))) (bvsge (_size!1389 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1389 thiss!1248) (bvadd (mask!9149 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!192259 () Bool)

(declare-fun res!90812 () Bool)

(assert (=> b!192259 (=> (not res!90812) (not e!126495))))

(declare-fun size!4162 (LongMapFixedSize!2680) (_ BitVec 32))

(assert (=> b!192259 (= res!90812 (bvsge (size!4162 thiss!1248) (_size!1389 thiss!1248)))))

(declare-fun b!192260 () Bool)

(declare-fun res!90811 () Bool)

(assert (=> b!192260 (=> (not res!90811) (not e!126495))))

(assert (=> b!192260 (= res!90811 (= (size!4162 thiss!1248) (bvadd (_size!1389 thiss!1248) (bvsdiv (bvadd (extraKeys!3657 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!192261 () Bool)

(assert (=> b!192261 (= e!126495 (and (bvsge (extraKeys!3657 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3657 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1389 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun d!56225 () Bool)

(declare-fun res!90814 () Bool)

(assert (=> d!56225 (=> (not res!90814) (not e!126495))))

(assert (=> d!56225 (= res!90814 (validMask!0 (mask!9149 thiss!1248)))))

(assert (=> d!56225 (= (simpleValid!199 thiss!1248) e!126495)))

(assert (= (and d!56225 res!90814) b!192258))

(assert (= (and b!192258 res!90813) b!192259))

(assert (= (and b!192259 res!90812) b!192260))

(assert (= (and b!192260 res!90811) b!192261))

(declare-fun m!218501 () Bool)

(assert (=> b!192259 m!218501))

(assert (=> b!192260 m!218501))

(assert (=> d!56225 m!218215))

(assert (=> d!56187 d!56225))

(declare-fun d!56227 () Bool)

(declare-fun e!126496 () Bool)

(assert (=> d!56227 e!126496))

(declare-fun res!90815 () Bool)

(assert (=> d!56227 (=> res!90815 e!126496)))

(declare-fun lt!95466 () Bool)

(assert (=> d!56227 (= res!90815 (not lt!95466))))

(declare-fun lt!95468 () Bool)

(assert (=> d!56227 (= lt!95466 lt!95468)))

(declare-fun lt!95467 () Unit!5763)

(declare-fun e!126497 () Unit!5763)

(assert (=> d!56227 (= lt!95467 e!126497)))

(declare-fun c!34659 () Bool)

(assert (=> d!56227 (= c!34659 lt!95468)))

(assert (=> d!56227 (= lt!95468 (containsKey!242 (toList!1215 lt!95404) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56227 (= (contains!1337 lt!95404 #b1000000000000000000000000000000000000000000000000000000000000000) lt!95466)))

(declare-fun b!192262 () Bool)

(declare-fun lt!95465 () Unit!5763)

(assert (=> b!192262 (= e!126497 lt!95465)))

(assert (=> b!192262 (= lt!95465 (lemmaContainsKeyImpliesGetValueByKeyDefined!191 (toList!1215 lt!95404) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!192262 (isDefined!192 (getValueByKey!238 (toList!1215 lt!95404) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!192263 () Bool)

(declare-fun Unit!5771 () Unit!5763)

(assert (=> b!192263 (= e!126497 Unit!5771)))

(declare-fun b!192264 () Bool)

(assert (=> b!192264 (= e!126496 (isDefined!192 (getValueByKey!238 (toList!1215 lt!95404) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56227 c!34659) b!192262))

(assert (= (and d!56227 (not c!34659)) b!192263))

(assert (= (and d!56227 (not res!90815)) b!192264))

(declare-fun m!218503 () Bool)

(assert (=> d!56227 m!218503))

(declare-fun m!218505 () Bool)

(assert (=> b!192262 m!218505))

(declare-fun m!218507 () Bool)

(assert (=> b!192262 m!218507))

(assert (=> b!192262 m!218507))

(declare-fun m!218509 () Bool)

(assert (=> b!192262 m!218509))

(assert (=> b!192264 m!218507))

(assert (=> b!192264 m!218507))

(assert (=> b!192264 m!218509))

(assert (=> bm!19387 d!56227))

(declare-fun d!56229 () Bool)

(assert (=> d!56229 (= (inRange!0 (ite c!34602 (index!4906 lt!95320) (index!4909 lt!95320)) (mask!9149 thiss!1248)) (and (bvsge (ite c!34602 (index!4906 lt!95320) (index!4909 lt!95320)) #b00000000000000000000000000000000) (bvslt (ite c!34602 (index!4906 lt!95320) (index!4909 lt!95320)) (bvadd (mask!9149 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> bm!19368 d!56229))

(declare-fun b!192277 () Bool)

(declare-fun e!126506 () SeekEntryResult!684)

(assert (=> b!192277 (= e!126506 (MissingVacant!684 (index!4908 lt!95329)))))

(declare-fun b!192278 () Bool)

(declare-fun c!34667 () Bool)

(declare-fun lt!95473 () (_ BitVec 64))

(assert (=> b!192278 (= c!34667 (= lt!95473 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!126505 () SeekEntryResult!684)

(assert (=> b!192278 (= e!126505 e!126506)))

(declare-fun b!192279 () Bool)

(assert (=> b!192279 (= e!126505 (Found!684 (index!4908 lt!95329)))))

(declare-fun b!192280 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!192280 (= e!126506 (seekKeyOrZeroReturnVacant!0 (bvadd (x!20581 lt!95329) #b00000000000000000000000000000001) (nextIndex!0 (index!4908 lt!95329) (x!20581 lt!95329) (mask!9149 thiss!1248)) (index!4908 lt!95329) key!828 (_keys!5901 thiss!1248) (mask!9149 thiss!1248)))))

(declare-fun b!192281 () Bool)

(declare-fun e!126504 () SeekEntryResult!684)

(assert (=> b!192281 (= e!126504 e!126505)))

(declare-fun c!34666 () Bool)

(assert (=> b!192281 (= c!34666 (= lt!95473 key!828))))

(declare-fun b!192282 () Bool)

(assert (=> b!192282 (= e!126504 Undefined!684)))

(declare-fun d!56231 () Bool)

(declare-fun lt!95474 () SeekEntryResult!684)

(assert (=> d!56231 (and (or ((_ is Undefined!684) lt!95474) (not ((_ is Found!684) lt!95474)) (and (bvsge (index!4907 lt!95474) #b00000000000000000000000000000000) (bvslt (index!4907 lt!95474) (size!4156 (_keys!5901 thiss!1248))))) (or ((_ is Undefined!684) lt!95474) ((_ is Found!684) lt!95474) (not ((_ is MissingVacant!684) lt!95474)) (not (= (index!4909 lt!95474) (index!4908 lt!95329))) (and (bvsge (index!4909 lt!95474) #b00000000000000000000000000000000) (bvslt (index!4909 lt!95474) (size!4156 (_keys!5901 thiss!1248))))) (or ((_ is Undefined!684) lt!95474) (ite ((_ is Found!684) lt!95474) (= (select (arr!3832 (_keys!5901 thiss!1248)) (index!4907 lt!95474)) key!828) (and ((_ is MissingVacant!684) lt!95474) (= (index!4909 lt!95474) (index!4908 lt!95329)) (= (select (arr!3832 (_keys!5901 thiss!1248)) (index!4909 lt!95474)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!56231 (= lt!95474 e!126504)))

(declare-fun c!34668 () Bool)

(assert (=> d!56231 (= c!34668 (bvsge (x!20581 lt!95329) #b01111111111111111111111111111110))))

(assert (=> d!56231 (= lt!95473 (select (arr!3832 (_keys!5901 thiss!1248)) (index!4908 lt!95329)))))

(assert (=> d!56231 (validMask!0 (mask!9149 thiss!1248))))

(assert (=> d!56231 (= (seekKeyOrZeroReturnVacant!0 (x!20581 lt!95329) (index!4908 lt!95329) (index!4908 lt!95329) key!828 (_keys!5901 thiss!1248) (mask!9149 thiss!1248)) lt!95474)))

(assert (= (and d!56231 c!34668) b!192282))

(assert (= (and d!56231 (not c!34668)) b!192281))

(assert (= (and b!192281 c!34666) b!192279))

(assert (= (and b!192281 (not c!34666)) b!192278))

(assert (= (and b!192278 c!34667) b!192277))

(assert (= (and b!192278 (not c!34667)) b!192280))

(declare-fun m!218511 () Bool)

(assert (=> b!192280 m!218511))

(assert (=> b!192280 m!218511))

(declare-fun m!218513 () Bool)

(assert (=> b!192280 m!218513))

(declare-fun m!218515 () Bool)

(assert (=> d!56231 m!218515))

(declare-fun m!218517 () Bool)

(assert (=> d!56231 m!218517))

(assert (=> d!56231 m!218305))

(assert (=> d!56231 m!218215))

(assert (=> b!192076 d!56231))

(declare-fun d!56233 () Bool)

(declare-fun lt!95477 () (_ BitVec 32))

(assert (=> d!56233 (and (bvsge lt!95477 #b00000000000000000000000000000000) (bvsle lt!95477 (bvsub (size!4156 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!126512 () (_ BitVec 32))

(assert (=> d!56233 (= lt!95477 e!126512)))

(declare-fun c!34673 () Bool)

(assert (=> d!56233 (= c!34673 (bvsge #b00000000000000000000000000000000 (size!4156 (_keys!5901 thiss!1248))))))

(assert (=> d!56233 (and (bvsle #b00000000000000000000000000000000 (size!4156 (_keys!5901 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!4156 (_keys!5901 thiss!1248)) (size!4156 (_keys!5901 thiss!1248))))))

(assert (=> d!56233 (= (arrayCountValidKeys!0 (_keys!5901 thiss!1248) #b00000000000000000000000000000000 (size!4156 (_keys!5901 thiss!1248))) lt!95477)))

(declare-fun bm!19409 () Bool)

(declare-fun call!19412 () (_ BitVec 32))

(assert (=> bm!19409 (= call!19412 (arrayCountValidKeys!0 (_keys!5901 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4156 (_keys!5901 thiss!1248))))))

(declare-fun b!192291 () Bool)

(assert (=> b!192291 (= e!126512 #b00000000000000000000000000000000)))

(declare-fun b!192292 () Bool)

(declare-fun e!126511 () (_ BitVec 32))

(assert (=> b!192292 (= e!126512 e!126511)))

(declare-fun c!34674 () Bool)

(assert (=> b!192292 (= c!34674 (validKeyInArray!0 (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192293 () Bool)

(assert (=> b!192293 (= e!126511 (bvadd #b00000000000000000000000000000001 call!19412))))

(declare-fun b!192294 () Bool)

(assert (=> b!192294 (= e!126511 call!19412)))

(assert (= (and d!56233 c!34673) b!192291))

(assert (= (and d!56233 (not c!34673)) b!192292))

(assert (= (and b!192292 c!34674) b!192293))

(assert (= (and b!192292 (not c!34674)) b!192294))

(assert (= (or b!192293 b!192294) bm!19409))

(declare-fun m!218519 () Bool)

(assert (=> bm!19409 m!218519))

(assert (=> b!192292 m!218333))

(assert (=> b!192292 m!218333))

(assert (=> b!192292 m!218349))

(assert (=> b!192057 d!56233))

(declare-fun d!56235 () Bool)

(declare-fun e!126513 () Bool)

(assert (=> d!56235 e!126513))

(declare-fun res!90816 () Bool)

(assert (=> d!56235 (=> (not res!90816) (not e!126513))))

(declare-fun lt!95479 () ListLongMap!2399)

(assert (=> d!56235 (= res!90816 (contains!1337 lt!95479 (_1!1756 (ite (or c!34626 c!34624) (tuple2!3491 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))))))))

(declare-fun lt!95481 () List!2409)

(assert (=> d!56235 (= lt!95479 (ListLongMap!2400 lt!95481))))

(declare-fun lt!95480 () Unit!5763)

(declare-fun lt!95478 () Unit!5763)

(assert (=> d!56235 (= lt!95480 lt!95478)))

(assert (=> d!56235 (= (getValueByKey!238 lt!95481 (_1!1756 (ite (or c!34626 c!34624) (tuple2!3491 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))))) (Some!243 (_2!1756 (ite (or c!34626 c!34624) (tuple2!3491 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))))))))

(assert (=> d!56235 (= lt!95478 (lemmaContainsTupThenGetReturnValue!128 lt!95481 (_1!1756 (ite (or c!34626 c!34624) (tuple2!3491 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))) (_2!1756 (ite (or c!34626 c!34624) (tuple2!3491 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))))))))

(assert (=> d!56235 (= lt!95481 (insertStrictlySorted!131 (toList!1215 (ite c!34626 call!19390 (ite c!34624 call!19388 call!19393))) (_1!1756 (ite (or c!34626 c!34624) (tuple2!3491 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))) (_2!1756 (ite (or c!34626 c!34624) (tuple2!3491 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))))))))

(assert (=> d!56235 (= (+!307 (ite c!34626 call!19390 (ite c!34624 call!19388 call!19393)) (ite (or c!34626 c!34624) (tuple2!3491 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))) lt!95479)))

(declare-fun b!192295 () Bool)

(declare-fun res!90817 () Bool)

(assert (=> b!192295 (=> (not res!90817) (not e!126513))))

(assert (=> b!192295 (= res!90817 (= (getValueByKey!238 (toList!1215 lt!95479) (_1!1756 (ite (or c!34626 c!34624) (tuple2!3491 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))))) (Some!243 (_2!1756 (ite (or c!34626 c!34624) (tuple2!3491 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))))))))

(declare-fun b!192296 () Bool)

(assert (=> b!192296 (= e!126513 (contains!1338 (toList!1215 lt!95479) (ite (or c!34626 c!34624) (tuple2!3491 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))))))

(assert (= (and d!56235 res!90816) b!192295))

(assert (= (and b!192295 res!90817) b!192296))

(declare-fun m!218521 () Bool)

(assert (=> d!56235 m!218521))

(declare-fun m!218523 () Bool)

(assert (=> d!56235 m!218523))

(declare-fun m!218525 () Bool)

(assert (=> d!56235 m!218525))

(declare-fun m!218527 () Bool)

(assert (=> d!56235 m!218527))

(declare-fun m!218529 () Bool)

(assert (=> b!192295 m!218529))

(declare-fun m!218531 () Bool)

(assert (=> b!192296 m!218531))

(assert (=> bm!19386 d!56235))

(declare-fun b!192305 () Bool)

(declare-fun e!126520 () Bool)

(declare-fun e!126522 () Bool)

(assert (=> b!192305 (= e!126520 e!126522)))

(declare-fun c!34677 () Bool)

(assert (=> b!192305 (= c!34677 (validKeyInArray!0 (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192306 () Bool)

(declare-fun e!126521 () Bool)

(assert (=> b!192306 (= e!126522 e!126521)))

(declare-fun lt!95490 () (_ BitVec 64))

(assert (=> b!192306 (= lt!95490 (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95489 () Unit!5763)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8139 (_ BitVec 64) (_ BitVec 32)) Unit!5763)

(assert (=> b!192306 (= lt!95489 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5901 thiss!1248) lt!95490 #b00000000000000000000000000000000))))

(assert (=> b!192306 (arrayContainsKey!0 (_keys!5901 thiss!1248) lt!95490 #b00000000000000000000000000000000)))

(declare-fun lt!95488 () Unit!5763)

(assert (=> b!192306 (= lt!95488 lt!95489)))

(declare-fun res!90822 () Bool)

(assert (=> b!192306 (= res!90822 (= (seekEntryOrOpen!0 (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000) (_keys!5901 thiss!1248) (mask!9149 thiss!1248)) (Found!684 #b00000000000000000000000000000000)))))

(assert (=> b!192306 (=> (not res!90822) (not e!126521))))

(declare-fun b!192307 () Bool)

(declare-fun call!19415 () Bool)

(assert (=> b!192307 (= e!126522 call!19415)))

(declare-fun d!56237 () Bool)

(declare-fun res!90823 () Bool)

(assert (=> d!56237 (=> res!90823 e!126520)))

(assert (=> d!56237 (= res!90823 (bvsge #b00000000000000000000000000000000 (size!4156 (_keys!5901 thiss!1248))))))

(assert (=> d!56237 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5901 thiss!1248) (mask!9149 thiss!1248)) e!126520)))

(declare-fun bm!19412 () Bool)

(assert (=> bm!19412 (= call!19415 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5901 thiss!1248) (mask!9149 thiss!1248)))))

(declare-fun b!192308 () Bool)

(assert (=> b!192308 (= e!126521 call!19415)))

(assert (= (and d!56237 (not res!90823)) b!192305))

(assert (= (and b!192305 c!34677) b!192306))

(assert (= (and b!192305 (not c!34677)) b!192307))

(assert (= (and b!192306 res!90822) b!192308))

(assert (= (or b!192308 b!192307) bm!19412))

(assert (=> b!192305 m!218333))

(assert (=> b!192305 m!218333))

(assert (=> b!192305 m!218349))

(assert (=> b!192306 m!218333))

(declare-fun m!218533 () Bool)

(assert (=> b!192306 m!218533))

(declare-fun m!218535 () Bool)

(assert (=> b!192306 m!218535))

(assert (=> b!192306 m!218333))

(declare-fun m!218537 () Bool)

(assert (=> b!192306 m!218537))

(declare-fun m!218539 () Bool)

(assert (=> bm!19412 m!218539))

(assert (=> b!192058 d!56237))

(assert (=> d!56203 d!56199))

(declare-fun d!56239 () Bool)

(assert (=> d!56239 (= (apply!183 lt!95404 (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000)) (get!2214 (getValueByKey!238 (toList!1215 lt!95404) (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7665 () Bool)

(assert (= bs!7665 d!56239))

(assert (=> bs!7665 m!218333))

(declare-fun m!218541 () Bool)

(assert (=> bs!7665 m!218541))

(assert (=> bs!7665 m!218541))

(declare-fun m!218543 () Bool)

(assert (=> bs!7665 m!218543))

(assert (=> b!192136 d!56239))

(declare-fun d!56241 () Bool)

(declare-fun c!34680 () Bool)

(assert (=> d!56241 (= c!34680 ((_ is ValueCellFull!1886) (select (arr!3833 (_values!3903 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!126525 () V!5593)

(assert (=> d!56241 (= (get!2213 (select (arr!3833 (_values!3903 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!517 (defaultEntry!3920 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!126525)))

(declare-fun b!192313 () Bool)

(declare-fun get!2215 (ValueCell!1886 V!5593) V!5593)

(assert (=> b!192313 (= e!126525 (get!2215 (select (arr!3833 (_values!3903 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!517 (defaultEntry!3920 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!192314 () Bool)

(declare-fun get!2216 (ValueCell!1886 V!5593) V!5593)

(assert (=> b!192314 (= e!126525 (get!2216 (select (arr!3833 (_values!3903 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!517 (defaultEntry!3920 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56241 c!34680) b!192313))

(assert (= (and d!56241 (not c!34680)) b!192314))

(assert (=> b!192313 m!218343))

(assert (=> b!192313 m!218341))

(declare-fun m!218545 () Bool)

(assert (=> b!192313 m!218545))

(assert (=> b!192314 m!218343))

(assert (=> b!192314 m!218341))

(declare-fun m!218547 () Bool)

(assert (=> b!192314 m!218547))

(assert (=> b!192136 d!56241))

(declare-fun b!192325 () Bool)

(declare-fun e!126537 () Bool)

(declare-fun e!126535 () Bool)

(assert (=> b!192325 (= e!126537 e!126535)))

(declare-fun res!90832 () Bool)

(assert (=> b!192325 (=> (not res!90832) (not e!126535))))

(declare-fun e!126536 () Bool)

(assert (=> b!192325 (= res!90832 (not e!126536))))

(declare-fun res!90831 () Bool)

(assert (=> b!192325 (=> (not res!90831) (not e!126536))))

(assert (=> b!192325 (= res!90831 (validKeyInArray!0 (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192326 () Bool)

(declare-fun e!126534 () Bool)

(assert (=> b!192326 (= e!126535 e!126534)))

(declare-fun c!34683 () Bool)

(assert (=> b!192326 (= c!34683 (validKeyInArray!0 (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19415 () Bool)

(declare-fun call!19418 () Bool)

(assert (=> bm!19415 (= call!19418 (arrayNoDuplicates!0 (_keys!5901 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!34683 (Cons!2406 (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000) Nil!2407) Nil!2407)))))

(declare-fun b!192327 () Bool)

(declare-fun contains!1339 (List!2410 (_ BitVec 64)) Bool)

(assert (=> b!192327 (= e!126536 (contains!1339 Nil!2407 (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192328 () Bool)

(assert (=> b!192328 (= e!126534 call!19418)))

(declare-fun b!192329 () Bool)

(assert (=> b!192329 (= e!126534 call!19418)))

(declare-fun d!56243 () Bool)

(declare-fun res!90830 () Bool)

(assert (=> d!56243 (=> res!90830 e!126537)))

(assert (=> d!56243 (= res!90830 (bvsge #b00000000000000000000000000000000 (size!4156 (_keys!5901 thiss!1248))))))

(assert (=> d!56243 (= (arrayNoDuplicates!0 (_keys!5901 thiss!1248) #b00000000000000000000000000000000 Nil!2407) e!126537)))

(assert (= (and d!56243 (not res!90830)) b!192325))

(assert (= (and b!192325 res!90831) b!192327))

(assert (= (and b!192325 res!90832) b!192326))

(assert (= (and b!192326 c!34683) b!192329))

(assert (= (and b!192326 (not c!34683)) b!192328))

(assert (= (or b!192329 b!192328) bm!19415))

(assert (=> b!192325 m!218333))

(assert (=> b!192325 m!218333))

(assert (=> b!192325 m!218349))

(assert (=> b!192326 m!218333))

(assert (=> b!192326 m!218333))

(assert (=> b!192326 m!218349))

(assert (=> bm!19415 m!218333))

(declare-fun m!218549 () Bool)

(assert (=> bm!19415 m!218549))

(assert (=> b!192327 m!218333))

(assert (=> b!192327 m!218333))

(declare-fun m!218551 () Bool)

(assert (=> b!192327 m!218551))

(assert (=> b!192059 d!56243))

(declare-fun d!56245 () Bool)

(assert (=> d!56245 (= (+!307 (getCurrentListMap!848 (_keys!5901 thiss!1248) (_values!3903 thiss!1248) (mask!9149 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248)) (tuple2!3491 key!828 v!309)) (getCurrentListMap!848 (_keys!5901 thiss!1248) (array!8142 (store (arr!3833 (_values!3903 thiss!1248)) (index!4907 lt!95277) (ValueCellFull!1886 v!309)) (size!4157 (_values!3903 thiss!1248))) (mask!9149 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248)))))

(assert (=> d!56245 true))

(declare-fun _$5!155 () Unit!5763)

(assert (=> d!56245 (= (choose!1053 (_keys!5901 thiss!1248) (_values!3903 thiss!1248) (mask!9149 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) (index!4907 lt!95277) key!828 v!309 (defaultEntry!3920 thiss!1248)) _$5!155)))

(declare-fun bs!7666 () Bool)

(assert (= bs!7666 d!56245))

(assert (=> bs!7666 m!218205))

(assert (=> bs!7666 m!218205))

(assert (=> bs!7666 m!218327))

(assert (=> bs!7666 m!218211))

(assert (=> bs!7666 m!218207))

(assert (=> d!56201 d!56245))

(assert (=> d!56201 d!56199))

(declare-fun b!192354 () Bool)

(declare-fun e!126555 () Bool)

(declare-fun e!126554 () Bool)

(assert (=> b!192354 (= e!126555 e!126554)))

(declare-fun c!34692 () Bool)

(assert (=> b!192354 (= c!34692 (bvslt #b00000000000000000000000000000000 (size!4156 (_keys!5901 thiss!1248))))))

(declare-fun b!192355 () Bool)

(declare-fun e!126553 () Bool)

(assert (=> b!192355 (= e!126553 e!126555)))

(declare-fun c!34694 () Bool)

(declare-fun e!126557 () Bool)

(assert (=> b!192355 (= c!34694 e!126557)))

(declare-fun res!90842 () Bool)

(assert (=> b!192355 (=> (not res!90842) (not e!126557))))

(assert (=> b!192355 (= res!90842 (bvslt #b00000000000000000000000000000000 (size!4156 (_keys!5901 thiss!1248))))))

(declare-fun call!19421 () ListLongMap!2399)

(declare-fun bm!19418 () Bool)

(assert (=> bm!19418 (= call!19421 (getCurrentListMapNoExtraKeys!204 (_keys!5901 thiss!1248) (array!8142 (store (arr!3833 (_values!3903 thiss!1248)) (index!4907 lt!95277) (ValueCellFull!1886 v!309)) (size!4157 (_values!3903 thiss!1248))) (mask!9149 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3920 thiss!1248)))))

(declare-fun b!192356 () Bool)

(declare-fun res!90841 () Bool)

(assert (=> b!192356 (=> (not res!90841) (not e!126553))))

(declare-fun lt!95509 () ListLongMap!2399)

(assert (=> b!192356 (= res!90841 (not (contains!1337 lt!95509 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!192357 () Bool)

(assert (=> b!192357 (= e!126554 (= lt!95509 (getCurrentListMapNoExtraKeys!204 (_keys!5901 thiss!1248) (array!8142 (store (arr!3833 (_values!3903 thiss!1248)) (index!4907 lt!95277) (ValueCellFull!1886 v!309)) (size!4157 (_values!3903 thiss!1248))) (mask!9149 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3920 thiss!1248))))))

(declare-fun b!192358 () Bool)

(assert (=> b!192358 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4156 (_keys!5901 thiss!1248))))))

(assert (=> b!192358 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4157 (array!8142 (store (arr!3833 (_values!3903 thiss!1248)) (index!4907 lt!95277) (ValueCellFull!1886 v!309)) (size!4157 (_values!3903 thiss!1248))))))))

(declare-fun e!126558 () Bool)

(assert (=> b!192358 (= e!126558 (= (apply!183 lt!95509 (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000)) (get!2213 (select (arr!3833 (array!8142 (store (arr!3833 (_values!3903 thiss!1248)) (index!4907 lt!95277) (ValueCellFull!1886 v!309)) (size!4157 (_values!3903 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!517 (defaultEntry!3920 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!192359 () Bool)

(declare-fun e!126556 () ListLongMap!2399)

(declare-fun e!126552 () ListLongMap!2399)

(assert (=> b!192359 (= e!126556 e!126552)))

(declare-fun c!34693 () Bool)

(assert (=> b!192359 (= c!34693 (validKeyInArray!0 (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192360 () Bool)

(assert (=> b!192360 (= e!126555 e!126558)))

(assert (=> b!192360 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4156 (_keys!5901 thiss!1248))))))

(declare-fun res!90843 () Bool)

(assert (=> b!192360 (= res!90843 (contains!1337 lt!95509 (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!192360 (=> (not res!90843) (not e!126558))))

(declare-fun d!56247 () Bool)

(assert (=> d!56247 e!126553))

(declare-fun res!90844 () Bool)

(assert (=> d!56247 (=> (not res!90844) (not e!126553))))

(assert (=> d!56247 (= res!90844 (not (contains!1337 lt!95509 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56247 (= lt!95509 e!126556)))

(declare-fun c!34695 () Bool)

(assert (=> d!56247 (= c!34695 (bvsge #b00000000000000000000000000000000 (size!4156 (_keys!5901 thiss!1248))))))

(assert (=> d!56247 (validMask!0 (mask!9149 thiss!1248))))

(assert (=> d!56247 (= (getCurrentListMapNoExtraKeys!204 (_keys!5901 thiss!1248) (array!8142 (store (arr!3833 (_values!3903 thiss!1248)) (index!4907 lt!95277) (ValueCellFull!1886 v!309)) (size!4157 (_values!3903 thiss!1248))) (mask!9149 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248)) lt!95509)))

(declare-fun b!192361 () Bool)

(declare-fun lt!95510 () Unit!5763)

(declare-fun lt!95506 () Unit!5763)

(assert (=> b!192361 (= lt!95510 lt!95506)))

(declare-fun lt!95507 () ListLongMap!2399)

(declare-fun lt!95508 () (_ BitVec 64))

(declare-fun lt!95511 () V!5593)

(declare-fun lt!95505 () (_ BitVec 64))

(assert (=> b!192361 (not (contains!1337 (+!307 lt!95507 (tuple2!3491 lt!95505 lt!95511)) lt!95508))))

(declare-fun addStillNotContains!97 (ListLongMap!2399 (_ BitVec 64) V!5593 (_ BitVec 64)) Unit!5763)

(assert (=> b!192361 (= lt!95506 (addStillNotContains!97 lt!95507 lt!95505 lt!95511 lt!95508))))

(assert (=> b!192361 (= lt!95508 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!192361 (= lt!95511 (get!2213 (select (arr!3833 (array!8142 (store (arr!3833 (_values!3903 thiss!1248)) (index!4907 lt!95277) (ValueCellFull!1886 v!309)) (size!4157 (_values!3903 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!517 (defaultEntry!3920 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!192361 (= lt!95505 (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!192361 (= lt!95507 call!19421)))

(assert (=> b!192361 (= e!126552 (+!307 call!19421 (tuple2!3491 (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000) (get!2213 (select (arr!3833 (array!8142 (store (arr!3833 (_values!3903 thiss!1248)) (index!4907 lt!95277) (ValueCellFull!1886 v!309)) (size!4157 (_values!3903 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!517 (defaultEntry!3920 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!192362 () Bool)

(assert (=> b!192362 (= e!126556 (ListLongMap!2400 Nil!2406))))

(declare-fun b!192363 () Bool)

(assert (=> b!192363 (= e!126557 (validKeyInArray!0 (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!192363 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!192364 () Bool)

(declare-fun isEmpty!489 (ListLongMap!2399) Bool)

(assert (=> b!192364 (= e!126554 (isEmpty!489 lt!95509))))

(declare-fun b!192365 () Bool)

(assert (=> b!192365 (= e!126552 call!19421)))

(assert (= (and d!56247 c!34695) b!192362))

(assert (= (and d!56247 (not c!34695)) b!192359))

(assert (= (and b!192359 c!34693) b!192361))

(assert (= (and b!192359 (not c!34693)) b!192365))

(assert (= (or b!192361 b!192365) bm!19418))

(assert (= (and d!56247 res!90844) b!192356))

(assert (= (and b!192356 res!90841) b!192355))

(assert (= (and b!192355 res!90842) b!192363))

(assert (= (and b!192355 c!34694) b!192360))

(assert (= (and b!192355 (not c!34694)) b!192354))

(assert (= (and b!192360 res!90843) b!192358))

(assert (= (and b!192354 c!34692) b!192357))

(assert (= (and b!192354 (not c!34692)) b!192364))

(declare-fun b_lambda!7413 () Bool)

(assert (=> (not b_lambda!7413) (not b!192358)))

(assert (=> b!192358 t!7318))

(declare-fun b_and!11357 () Bool)

(assert (= b_and!11355 (and (=> t!7318 result!4901) b_and!11357)))

(declare-fun b_lambda!7415 () Bool)

(assert (=> (not b_lambda!7415) (not b!192361)))

(assert (=> b!192361 t!7318))

(declare-fun b_and!11359 () Bool)

(assert (= b_and!11357 (and (=> t!7318 result!4901) b_and!11359)))

(assert (=> b!192360 m!218333))

(assert (=> b!192360 m!218333))

(declare-fun m!218553 () Bool)

(assert (=> b!192360 m!218553))

(declare-fun m!218555 () Bool)

(assert (=> b!192357 m!218555))

(assert (=> b!192359 m!218333))

(assert (=> b!192359 m!218333))

(assert (=> b!192359 m!218349))

(declare-fun m!218557 () Bool)

(assert (=> b!192364 m!218557))

(assert (=> b!192358 m!218333))

(assert (=> b!192358 m!218397))

(assert (=> b!192358 m!218341))

(assert (=> b!192358 m!218399))

(assert (=> b!192358 m!218397))

(assert (=> b!192358 m!218341))

(assert (=> b!192358 m!218333))

(declare-fun m!218559 () Bool)

(assert (=> b!192358 m!218559))

(declare-fun m!218561 () Bool)

(assert (=> b!192356 m!218561))

(declare-fun m!218563 () Bool)

(assert (=> d!56247 m!218563))

(assert (=> d!56247 m!218215))

(assert (=> b!192363 m!218333))

(assert (=> b!192363 m!218333))

(assert (=> b!192363 m!218349))

(assert (=> b!192361 m!218333))

(declare-fun m!218565 () Bool)

(assert (=> b!192361 m!218565))

(declare-fun m!218567 () Bool)

(assert (=> b!192361 m!218567))

(assert (=> b!192361 m!218397))

(assert (=> b!192361 m!218341))

(assert (=> b!192361 m!218399))

(declare-fun m!218569 () Bool)

(assert (=> b!192361 m!218569))

(assert (=> b!192361 m!218397))

(assert (=> b!192361 m!218565))

(declare-fun m!218571 () Bool)

(assert (=> b!192361 m!218571))

(assert (=> b!192361 m!218341))

(assert (=> bm!19418 m!218555))

(assert (=> bm!19392 d!56247))

(assert (=> d!56205 d!56199))

(declare-fun d!56249 () Bool)

(declare-fun e!126559 () Bool)

(assert (=> d!56249 e!126559))

(declare-fun res!90845 () Bool)

(assert (=> d!56249 (=> res!90845 e!126559)))

(declare-fun lt!95513 () Bool)

(assert (=> d!56249 (= res!90845 (not lt!95513))))

(declare-fun lt!95515 () Bool)

(assert (=> d!56249 (= lt!95513 lt!95515)))

(declare-fun lt!95514 () Unit!5763)

(declare-fun e!126560 () Unit!5763)

(assert (=> d!56249 (= lt!95514 e!126560)))

(declare-fun c!34696 () Bool)

(assert (=> d!56249 (= c!34696 lt!95515)))

(assert (=> d!56249 (= lt!95515 (containsKey!242 (toList!1215 lt!95404) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56249 (= (contains!1337 lt!95404 #b0000000000000000000000000000000000000000000000000000000000000000) lt!95513)))

(declare-fun b!192366 () Bool)

(declare-fun lt!95512 () Unit!5763)

(assert (=> b!192366 (= e!126560 lt!95512)))

(assert (=> b!192366 (= lt!95512 (lemmaContainsKeyImpliesGetValueByKeyDefined!191 (toList!1215 lt!95404) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!192366 (isDefined!192 (getValueByKey!238 (toList!1215 lt!95404) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!192367 () Bool)

(declare-fun Unit!5772 () Unit!5763)

(assert (=> b!192367 (= e!126560 Unit!5772)))

(declare-fun b!192368 () Bool)

(assert (=> b!192368 (= e!126559 (isDefined!192 (getValueByKey!238 (toList!1215 lt!95404) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56249 c!34696) b!192366))

(assert (= (and d!56249 (not c!34696)) b!192367))

(assert (= (and d!56249 (not res!90845)) b!192368))

(declare-fun m!218573 () Bool)

(assert (=> d!56249 m!218573))

(declare-fun m!218575 () Bool)

(assert (=> b!192366 m!218575))

(declare-fun m!218577 () Bool)

(assert (=> b!192366 m!218577))

(assert (=> b!192366 m!218577))

(declare-fun m!218579 () Bool)

(assert (=> b!192366 m!218579))

(assert (=> b!192368 m!218577))

(assert (=> b!192368 m!218577))

(assert (=> b!192368 m!218579))

(assert (=> bm!19388 d!56249))

(assert (=> b!192155 d!56211))

(declare-fun d!56251 () Bool)

(declare-fun e!126561 () Bool)

(assert (=> d!56251 e!126561))

(declare-fun res!90846 () Bool)

(assert (=> d!56251 (=> (not res!90846) (not e!126561))))

(declare-fun lt!95517 () ListLongMap!2399)

(assert (=> d!56251 (= res!90846 (contains!1337 lt!95517 (_1!1756 (tuple2!3491 key!828 v!309))))))

(declare-fun lt!95519 () List!2409)

(assert (=> d!56251 (= lt!95517 (ListLongMap!2400 lt!95519))))

(declare-fun lt!95518 () Unit!5763)

(declare-fun lt!95516 () Unit!5763)

(assert (=> d!56251 (= lt!95518 lt!95516)))

(assert (=> d!56251 (= (getValueByKey!238 lt!95519 (_1!1756 (tuple2!3491 key!828 v!309))) (Some!243 (_2!1756 (tuple2!3491 key!828 v!309))))))

(assert (=> d!56251 (= lt!95516 (lemmaContainsTupThenGetReturnValue!128 lt!95519 (_1!1756 (tuple2!3491 key!828 v!309)) (_2!1756 (tuple2!3491 key!828 v!309))))))

(assert (=> d!56251 (= lt!95519 (insertStrictlySorted!131 (toList!1215 (getCurrentListMap!848 (_keys!5901 thiss!1248) (_values!3903 thiss!1248) (mask!9149 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248))) (_1!1756 (tuple2!3491 key!828 v!309)) (_2!1756 (tuple2!3491 key!828 v!309))))))

(assert (=> d!56251 (= (+!307 (getCurrentListMap!848 (_keys!5901 thiss!1248) (_values!3903 thiss!1248) (mask!9149 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248)) (tuple2!3491 key!828 v!309)) lt!95517)))

(declare-fun b!192369 () Bool)

(declare-fun res!90847 () Bool)

(assert (=> b!192369 (=> (not res!90847) (not e!126561))))

(assert (=> b!192369 (= res!90847 (= (getValueByKey!238 (toList!1215 lt!95517) (_1!1756 (tuple2!3491 key!828 v!309))) (Some!243 (_2!1756 (tuple2!3491 key!828 v!309)))))))

(declare-fun b!192370 () Bool)

(assert (=> b!192370 (= e!126561 (contains!1338 (toList!1215 lt!95517) (tuple2!3491 key!828 v!309)))))

(assert (= (and d!56251 res!90846) b!192369))

(assert (= (and b!192369 res!90847) b!192370))

(declare-fun m!218581 () Bool)

(assert (=> d!56251 m!218581))

(declare-fun m!218583 () Bool)

(assert (=> d!56251 m!218583))

(declare-fun m!218585 () Bool)

(assert (=> d!56251 m!218585))

(declare-fun m!218587 () Bool)

(assert (=> d!56251 m!218587))

(declare-fun m!218589 () Bool)

(assert (=> b!192369 m!218589))

(declare-fun m!218591 () Bool)

(assert (=> b!192370 m!218591))

(assert (=> b!192086 d!56251))

(assert (=> b!192086 d!56203))

(assert (=> b!192086 d!56205))

(assert (=> d!56191 d!56189))

(declare-fun d!56253 () Bool)

(declare-fun e!126564 () Bool)

(assert (=> d!56253 e!126564))

(declare-fun res!90852 () Bool)

(assert (=> d!56253 (=> (not res!90852) (not e!126564))))

(declare-fun lt!95522 () SeekEntryResult!684)

(assert (=> d!56253 (= res!90852 ((_ is Found!684) lt!95522))))

(assert (=> d!56253 (= lt!95522 (seekEntryOrOpen!0 key!828 (_keys!5901 thiss!1248) (mask!9149 thiss!1248)))))

(assert (=> d!56253 true))

(declare-fun _$33!147 () Unit!5763)

(assert (=> d!56253 (= (choose!1052 (_keys!5901 thiss!1248) (_values!3903 thiss!1248) (mask!9149 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) key!828 (defaultEntry!3920 thiss!1248)) _$33!147)))

(declare-fun b!192375 () Bool)

(declare-fun res!90853 () Bool)

(assert (=> b!192375 (=> (not res!90853) (not e!126564))))

(assert (=> b!192375 (= res!90853 (inRange!0 (index!4907 lt!95522) (mask!9149 thiss!1248)))))

(declare-fun b!192376 () Bool)

(assert (=> b!192376 (= e!126564 (= (select (arr!3832 (_keys!5901 thiss!1248)) (index!4907 lt!95522)) key!828))))

(assert (= (and d!56253 res!90852) b!192375))

(assert (= (and b!192375 res!90853) b!192376))

(assert (=> d!56253 m!218201))

(declare-fun m!218593 () Bool)

(assert (=> b!192375 m!218593))

(declare-fun m!218595 () Bool)

(assert (=> b!192376 m!218595))

(assert (=> d!56191 d!56253))

(assert (=> d!56191 d!56199))

(declare-fun d!56255 () Bool)

(declare-fun e!126565 () Bool)

(assert (=> d!56255 e!126565))

(declare-fun res!90854 () Bool)

(assert (=> d!56255 (=> (not res!90854) (not e!126565))))

(declare-fun lt!95524 () ListLongMap!2399)

(assert (=> d!56255 (= res!90854 (contains!1337 lt!95524 (_1!1756 (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))))))

(declare-fun lt!95526 () List!2409)

(assert (=> d!56255 (= lt!95524 (ListLongMap!2400 lt!95526))))

(declare-fun lt!95525 () Unit!5763)

(declare-fun lt!95523 () Unit!5763)

(assert (=> d!56255 (= lt!95525 lt!95523)))

(assert (=> d!56255 (= (getValueByKey!238 lt!95526 (_1!1756 (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))) (Some!243 (_2!1756 (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))))))

(assert (=> d!56255 (= lt!95523 (lemmaContainsTupThenGetReturnValue!128 lt!95526 (_1!1756 (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))) (_2!1756 (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))))))

(assert (=> d!56255 (= lt!95526 (insertStrictlySorted!131 (toList!1215 call!19396) (_1!1756 (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))) (_2!1756 (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))))))

(assert (=> d!56255 (= (+!307 call!19396 (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))) lt!95524)))

(declare-fun b!192377 () Bool)

(declare-fun res!90855 () Bool)

(assert (=> b!192377 (=> (not res!90855) (not e!126565))))

(assert (=> b!192377 (= res!90855 (= (getValueByKey!238 (toList!1215 lt!95524) (_1!1756 (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))) (Some!243 (_2!1756 (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))))))))

(declare-fun b!192378 () Bool)

(assert (=> b!192378 (= e!126565 (contains!1338 (toList!1215 lt!95524) (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))))))

(assert (= (and d!56255 res!90854) b!192377))

(assert (= (and b!192377 res!90855) b!192378))

(declare-fun m!218597 () Bool)

(assert (=> d!56255 m!218597))

(declare-fun m!218599 () Bool)

(assert (=> d!56255 m!218599))

(declare-fun m!218601 () Bool)

(assert (=> d!56255 m!218601))

(declare-fun m!218603 () Bool)

(assert (=> d!56255 m!218603))

(declare-fun m!218605 () Bool)

(assert (=> b!192377 m!218605))

(declare-fun m!218607 () Bool)

(assert (=> b!192378 m!218607))

(assert (=> b!192169 d!56255))

(declare-fun d!56257 () Bool)

(assert (=> d!56257 (= (apply!183 lt!95404 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2214 (getValueByKey!238 (toList!1215 lt!95404) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7667 () Bool)

(assert (= bs!7667 d!56257))

(assert (=> bs!7667 m!218507))

(assert (=> bs!7667 m!218507))

(declare-fun m!218609 () Bool)

(assert (=> bs!7667 m!218609))

(assert (=> b!192139 d!56257))

(declare-fun d!56259 () Bool)

(declare-fun res!90860 () Bool)

(declare-fun e!126570 () Bool)

(assert (=> d!56259 (=> res!90860 e!126570)))

(assert (=> d!56259 (= res!90860 (and ((_ is Cons!2405) (toList!1215 lt!95278)) (= (_1!1756 (h!3045 (toList!1215 lt!95278))) key!828)))))

(assert (=> d!56259 (= (containsKey!242 (toList!1215 lt!95278) key!828) e!126570)))

(declare-fun b!192383 () Bool)

(declare-fun e!126571 () Bool)

(assert (=> b!192383 (= e!126570 e!126571)))

(declare-fun res!90861 () Bool)

(assert (=> b!192383 (=> (not res!90861) (not e!126571))))

(assert (=> b!192383 (= res!90861 (and (or (not ((_ is Cons!2405) (toList!1215 lt!95278))) (bvsle (_1!1756 (h!3045 (toList!1215 lt!95278))) key!828)) ((_ is Cons!2405) (toList!1215 lt!95278)) (bvslt (_1!1756 (h!3045 (toList!1215 lt!95278))) key!828)))))

(declare-fun b!192384 () Bool)

(assert (=> b!192384 (= e!126571 (containsKey!242 (t!7316 (toList!1215 lt!95278)) key!828))))

(assert (= (and d!56259 (not res!90860)) b!192383))

(assert (= (and b!192383 res!90861) b!192384))

(declare-fun m!218611 () Bool)

(assert (=> b!192384 m!218611))

(assert (=> d!56209 d!56259))

(declare-fun d!56261 () Bool)

(declare-fun e!126572 () Bool)

(assert (=> d!56261 e!126572))

(declare-fun res!90862 () Bool)

(assert (=> d!56261 (=> (not res!90862) (not e!126572))))

(declare-fun lt!95528 () ListLongMap!2399)

(assert (=> d!56261 (= res!90862 (contains!1337 lt!95528 (_1!1756 (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))))))

(declare-fun lt!95530 () List!2409)

(assert (=> d!56261 (= lt!95528 (ListLongMap!2400 lt!95530))))

(declare-fun lt!95529 () Unit!5763)

(declare-fun lt!95527 () Unit!5763)

(assert (=> d!56261 (= lt!95529 lt!95527)))

(assert (=> d!56261 (= (getValueByKey!238 lt!95530 (_1!1756 (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))) (Some!243 (_2!1756 (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))))))

(assert (=> d!56261 (= lt!95527 (lemmaContainsTupThenGetReturnValue!128 lt!95530 (_1!1756 (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))) (_2!1756 (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))))))

(assert (=> d!56261 (= lt!95530 (insertStrictlySorted!131 (toList!1215 call!19389) (_1!1756 (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))) (_2!1756 (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))))))

(assert (=> d!56261 (= (+!307 call!19389 (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))) lt!95528)))

(declare-fun b!192385 () Bool)

(declare-fun res!90863 () Bool)

(assert (=> b!192385 (=> (not res!90863) (not e!126572))))

(assert (=> b!192385 (= res!90863 (= (getValueByKey!238 (toList!1215 lt!95528) (_1!1756 (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))) (Some!243 (_2!1756 (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))))))))

(declare-fun b!192386 () Bool)

(assert (=> b!192386 (= e!126572 (contains!1338 (toList!1215 lt!95528) (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))))))

(assert (= (and d!56261 res!90862) b!192385))

(assert (= (and b!192385 res!90863) b!192386))

(declare-fun m!218613 () Bool)

(assert (=> d!56261 m!218613))

(declare-fun m!218615 () Bool)

(assert (=> d!56261 m!218615))

(declare-fun m!218617 () Bool)

(assert (=> d!56261 m!218617))

(declare-fun m!218619 () Bool)

(assert (=> d!56261 m!218619))

(declare-fun m!218621 () Bool)

(assert (=> b!192385 m!218621))

(declare-fun m!218623 () Bool)

(assert (=> b!192386 m!218623))

(assert (=> b!192146 d!56261))

(declare-fun d!56263 () Bool)

(declare-fun res!90868 () Bool)

(declare-fun e!126577 () Bool)

(assert (=> d!56263 (=> res!90868 e!126577)))

(assert (=> d!56263 (= res!90868 (= (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000) key!828))))

(assert (=> d!56263 (= (arrayContainsKey!0 (_keys!5901 thiss!1248) key!828 #b00000000000000000000000000000000) e!126577)))

(declare-fun b!192391 () Bool)

(declare-fun e!126578 () Bool)

(assert (=> b!192391 (= e!126577 e!126578)))

(declare-fun res!90869 () Bool)

(assert (=> b!192391 (=> (not res!90869) (not e!126578))))

(assert (=> b!192391 (= res!90869 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4156 (_keys!5901 thiss!1248))))))

(declare-fun b!192392 () Bool)

(assert (=> b!192392 (= e!126578 (arrayContainsKey!0 (_keys!5901 thiss!1248) key!828 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!56263 (not res!90868)) b!192391))

(assert (= (and b!192391 res!90869) b!192392))

(assert (=> d!56263 m!218333))

(declare-fun m!218625 () Bool)

(assert (=> b!192392 m!218625))

(assert (=> bm!19369 d!56263))

(declare-fun d!56265 () Bool)

(declare-fun e!126579 () Bool)

(assert (=> d!56265 e!126579))

(declare-fun res!90870 () Bool)

(assert (=> d!56265 (=> res!90870 e!126579)))

(declare-fun lt!95532 () Bool)

(assert (=> d!56265 (= res!90870 (not lt!95532))))

(declare-fun lt!95534 () Bool)

(assert (=> d!56265 (= lt!95532 lt!95534)))

(declare-fun lt!95533 () Unit!5763)

(declare-fun e!126580 () Unit!5763)

(assert (=> d!56265 (= lt!95533 e!126580)))

(declare-fun c!34697 () Bool)

(assert (=> d!56265 (= c!34697 lt!95534)))

(assert (=> d!56265 (= lt!95534 (containsKey!242 (toList!1215 lt!95426) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56265 (= (contains!1337 lt!95426 #b1000000000000000000000000000000000000000000000000000000000000000) lt!95532)))

(declare-fun b!192393 () Bool)

(declare-fun lt!95531 () Unit!5763)

(assert (=> b!192393 (= e!126580 lt!95531)))

(assert (=> b!192393 (= lt!95531 (lemmaContainsKeyImpliesGetValueByKeyDefined!191 (toList!1215 lt!95426) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!192393 (isDefined!192 (getValueByKey!238 (toList!1215 lt!95426) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!192394 () Bool)

(declare-fun Unit!5773 () Unit!5763)

(assert (=> b!192394 (= e!126580 Unit!5773)))

(declare-fun b!192395 () Bool)

(assert (=> b!192395 (= e!126579 (isDefined!192 (getValueByKey!238 (toList!1215 lt!95426) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56265 c!34697) b!192393))

(assert (= (and d!56265 (not c!34697)) b!192394))

(assert (= (and d!56265 (not res!90870)) b!192395))

(declare-fun m!218627 () Bool)

(assert (=> d!56265 m!218627))

(declare-fun m!218629 () Bool)

(assert (=> b!192393 m!218629))

(declare-fun m!218631 () Bool)

(assert (=> b!192393 m!218631))

(assert (=> b!192393 m!218631))

(declare-fun m!218633 () Bool)

(assert (=> b!192393 m!218633))

(assert (=> b!192395 m!218631))

(assert (=> b!192395 m!218631))

(assert (=> b!192395 m!218633))

(assert (=> bm!19394 d!56265))

(declare-fun d!56267 () Bool)

(declare-fun e!126581 () Bool)

(assert (=> d!56267 e!126581))

(declare-fun res!90871 () Bool)

(assert (=> d!56267 (=> res!90871 e!126581)))

(declare-fun lt!95536 () Bool)

(assert (=> d!56267 (= res!90871 (not lt!95536))))

(declare-fun lt!95538 () Bool)

(assert (=> d!56267 (= lt!95536 lt!95538)))

(declare-fun lt!95537 () Unit!5763)

(declare-fun e!126582 () Unit!5763)

(assert (=> d!56267 (= lt!95537 e!126582)))

(declare-fun c!34698 () Bool)

(assert (=> d!56267 (= c!34698 lt!95538)))

(assert (=> d!56267 (= lt!95538 (containsKey!242 (toList!1215 lt!95404) (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!56267 (= (contains!1337 lt!95404 (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000)) lt!95536)))

(declare-fun b!192396 () Bool)

(declare-fun lt!95535 () Unit!5763)

(assert (=> b!192396 (= e!126582 lt!95535)))

(assert (=> b!192396 (= lt!95535 (lemmaContainsKeyImpliesGetValueByKeyDefined!191 (toList!1215 lt!95404) (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!192396 (isDefined!192 (getValueByKey!238 (toList!1215 lt!95404) (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192397 () Bool)

(declare-fun Unit!5774 () Unit!5763)

(assert (=> b!192397 (= e!126582 Unit!5774)))

(declare-fun b!192398 () Bool)

(assert (=> b!192398 (= e!126581 (isDefined!192 (getValueByKey!238 (toList!1215 lt!95404) (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!56267 c!34698) b!192396))

(assert (= (and d!56267 (not c!34698)) b!192397))

(assert (= (and d!56267 (not res!90871)) b!192398))

(assert (=> d!56267 m!218333))

(declare-fun m!218635 () Bool)

(assert (=> d!56267 m!218635))

(assert (=> b!192396 m!218333))

(declare-fun m!218637 () Bool)

(assert (=> b!192396 m!218637))

(assert (=> b!192396 m!218333))

(assert (=> b!192396 m!218541))

(assert (=> b!192396 m!218541))

(declare-fun m!218639 () Bool)

(assert (=> b!192396 m!218639))

(assert (=> b!192398 m!218333))

(assert (=> b!192398 m!218541))

(assert (=> b!192398 m!218541))

(assert (=> b!192398 m!218639))

(assert (=> b!192130 d!56267))

(declare-fun d!56269 () Bool)

(declare-fun e!126583 () Bool)

(assert (=> d!56269 e!126583))

(declare-fun res!90872 () Bool)

(assert (=> d!56269 (=> (not res!90872) (not e!126583))))

(declare-fun lt!95540 () ListLongMap!2399)

(assert (=> d!56269 (= res!90872 (contains!1337 lt!95540 (_1!1756 (ite (or c!34632 c!34630) (tuple2!3491 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))))))))

(declare-fun lt!95542 () List!2409)

(assert (=> d!56269 (= lt!95540 (ListLongMap!2400 lt!95542))))

(declare-fun lt!95541 () Unit!5763)

(declare-fun lt!95539 () Unit!5763)

(assert (=> d!56269 (= lt!95541 lt!95539)))

(assert (=> d!56269 (= (getValueByKey!238 lt!95542 (_1!1756 (ite (or c!34632 c!34630) (tuple2!3491 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))))) (Some!243 (_2!1756 (ite (or c!34632 c!34630) (tuple2!3491 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))))))))

(assert (=> d!56269 (= lt!95539 (lemmaContainsTupThenGetReturnValue!128 lt!95542 (_1!1756 (ite (or c!34632 c!34630) (tuple2!3491 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))) (_2!1756 (ite (or c!34632 c!34630) (tuple2!3491 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))))))))

(assert (=> d!56269 (= lt!95542 (insertStrictlySorted!131 (toList!1215 (ite c!34632 call!19397 (ite c!34630 call!19395 call!19400))) (_1!1756 (ite (or c!34632 c!34630) (tuple2!3491 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))) (_2!1756 (ite (or c!34632 c!34630) (tuple2!3491 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))))))))

(assert (=> d!56269 (= (+!307 (ite c!34632 call!19397 (ite c!34630 call!19395 call!19400)) (ite (or c!34632 c!34630) (tuple2!3491 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))) lt!95540)))

(declare-fun b!192399 () Bool)

(declare-fun res!90873 () Bool)

(assert (=> b!192399 (=> (not res!90873) (not e!126583))))

(assert (=> b!192399 (= res!90873 (= (getValueByKey!238 (toList!1215 lt!95540) (_1!1756 (ite (or c!34632 c!34630) (tuple2!3491 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248))))) (Some!243 (_2!1756 (ite (or c!34632 c!34630) (tuple2!3491 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))))))))

(declare-fun b!192400 () Bool)

(assert (=> b!192400 (= e!126583 (contains!1338 (toList!1215 lt!95540) (ite (or c!34632 c!34630) (tuple2!3491 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3761 thiss!1248)) (tuple2!3491 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3761 thiss!1248)))))))

(assert (= (and d!56269 res!90872) b!192399))

(assert (= (and b!192399 res!90873) b!192400))

(declare-fun m!218641 () Bool)

(assert (=> d!56269 m!218641))

(declare-fun m!218643 () Bool)

(assert (=> d!56269 m!218643))

(declare-fun m!218645 () Bool)

(assert (=> d!56269 m!218645))

(declare-fun m!218647 () Bool)

(assert (=> d!56269 m!218647))

(declare-fun m!218649 () Bool)

(assert (=> b!192399 m!218649))

(declare-fun m!218651 () Bool)

(assert (=> b!192400 m!218651))

(assert (=> bm!19393 d!56269))

(declare-fun lt!95545 () Bool)

(declare-fun d!56271 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!154 (List!2409) (InoxSet tuple2!3490))

(assert (=> d!56271 (= lt!95545 (select (content!154 (toList!1215 lt!95436)) (tuple2!3491 key!828 v!309)))))

(declare-fun e!126589 () Bool)

(assert (=> d!56271 (= lt!95545 e!126589)))

(declare-fun res!90879 () Bool)

(assert (=> d!56271 (=> (not res!90879) (not e!126589))))

(assert (=> d!56271 (= res!90879 ((_ is Cons!2405) (toList!1215 lt!95436)))))

(assert (=> d!56271 (= (contains!1338 (toList!1215 lt!95436) (tuple2!3491 key!828 v!309)) lt!95545)))

(declare-fun b!192405 () Bool)

(declare-fun e!126588 () Bool)

(assert (=> b!192405 (= e!126589 e!126588)))

(declare-fun res!90878 () Bool)

(assert (=> b!192405 (=> res!90878 e!126588)))

(assert (=> b!192405 (= res!90878 (= (h!3045 (toList!1215 lt!95436)) (tuple2!3491 key!828 v!309)))))

(declare-fun b!192406 () Bool)

(assert (=> b!192406 (= e!126588 (contains!1338 (t!7316 (toList!1215 lt!95436)) (tuple2!3491 key!828 v!309)))))

(assert (= (and d!56271 res!90879) b!192405))

(assert (= (and b!192405 (not res!90878)) b!192406))

(declare-fun m!218653 () Bool)

(assert (=> d!56271 m!218653))

(declare-fun m!218655 () Bool)

(assert (=> d!56271 m!218655))

(declare-fun m!218657 () Bool)

(assert (=> b!192406 m!218657))

(assert (=> b!192178 d!56271))

(declare-fun d!56273 () Bool)

(assert (=> d!56273 (= (apply!183 lt!95404 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2214 (getValueByKey!238 (toList!1215 lt!95404) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7668 () Bool)

(assert (= bs!7668 d!56273))

(assert (=> bs!7668 m!218577))

(assert (=> bs!7668 m!218577))

(declare-fun m!218659 () Bool)

(assert (=> bs!7668 m!218659))

(assert (=> b!192143 d!56273))

(declare-fun d!56275 () Bool)

(assert (=> d!56275 (= (apply!183 lt!95426 (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000)) (get!2214 (getValueByKey!238 (toList!1215 lt!95426) (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7669 () Bool)

(assert (= bs!7669 d!56275))

(assert (=> bs!7669 m!218333))

(assert (=> bs!7669 m!218465))

(assert (=> bs!7669 m!218465))

(declare-fun m!218661 () Bool)

(assert (=> bs!7669 m!218661))

(assert (=> b!192159 d!56275))

(declare-fun d!56277 () Bool)

(declare-fun c!34699 () Bool)

(assert (=> d!56277 (= c!34699 ((_ is ValueCellFull!1886) (select (arr!3833 (array!8142 (store (arr!3833 (_values!3903 thiss!1248)) (index!4907 lt!95277) (ValueCellFull!1886 v!309)) (size!4157 (_values!3903 thiss!1248)))) #b00000000000000000000000000000000)))))

(declare-fun e!126590 () V!5593)

(assert (=> d!56277 (= (get!2213 (select (arr!3833 (array!8142 (store (arr!3833 (_values!3903 thiss!1248)) (index!4907 lt!95277) (ValueCellFull!1886 v!309)) (size!4157 (_values!3903 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!517 (defaultEntry!3920 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!126590)))

(declare-fun b!192407 () Bool)

(assert (=> b!192407 (= e!126590 (get!2215 (select (arr!3833 (array!8142 (store (arr!3833 (_values!3903 thiss!1248)) (index!4907 lt!95277) (ValueCellFull!1886 v!309)) (size!4157 (_values!3903 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!517 (defaultEntry!3920 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!192408 () Bool)

(assert (=> b!192408 (= e!126590 (get!2216 (select (arr!3833 (array!8142 (store (arr!3833 (_values!3903 thiss!1248)) (index!4907 lt!95277) (ValueCellFull!1886 v!309)) (size!4157 (_values!3903 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!517 (defaultEntry!3920 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56277 c!34699) b!192407))

(assert (= (and d!56277 (not c!34699)) b!192408))

(assert (=> b!192407 m!218397))

(assert (=> b!192407 m!218341))

(declare-fun m!218663 () Bool)

(assert (=> b!192407 m!218663))

(assert (=> b!192408 m!218397))

(assert (=> b!192408 m!218341))

(declare-fun m!218665 () Bool)

(assert (=> b!192408 m!218665))

(assert (=> b!192159 d!56277))

(declare-fun b!192409 () Bool)

(declare-fun e!126591 () Option!244)

(assert (=> b!192409 (= e!126591 (Some!243 (_2!1756 (h!3045 (toList!1215 lt!95436)))))))

(declare-fun b!192412 () Bool)

(declare-fun e!126592 () Option!244)

(assert (=> b!192412 (= e!126592 None!242)))

(declare-fun d!56279 () Bool)

(declare-fun c!34700 () Bool)

(assert (=> d!56279 (= c!34700 (and ((_ is Cons!2405) (toList!1215 lt!95436)) (= (_1!1756 (h!3045 (toList!1215 lt!95436))) (_1!1756 (tuple2!3491 key!828 v!309)))))))

(assert (=> d!56279 (= (getValueByKey!238 (toList!1215 lt!95436) (_1!1756 (tuple2!3491 key!828 v!309))) e!126591)))

(declare-fun b!192410 () Bool)

(assert (=> b!192410 (= e!126591 e!126592)))

(declare-fun c!34701 () Bool)

(assert (=> b!192410 (= c!34701 (and ((_ is Cons!2405) (toList!1215 lt!95436)) (not (= (_1!1756 (h!3045 (toList!1215 lt!95436))) (_1!1756 (tuple2!3491 key!828 v!309))))))))

(declare-fun b!192411 () Bool)

(assert (=> b!192411 (= e!126592 (getValueByKey!238 (t!7316 (toList!1215 lt!95436)) (_1!1756 (tuple2!3491 key!828 v!309))))))

(assert (= (and d!56279 c!34700) b!192409))

(assert (= (and d!56279 (not c!34700)) b!192410))

(assert (= (and b!192410 c!34701) b!192411))

(assert (= (and b!192410 (not c!34701)) b!192412))

(declare-fun m!218667 () Bool)

(assert (=> b!192411 m!218667))

(assert (=> b!192177 d!56279))

(declare-fun b!192431 () Bool)

(declare-fun lt!95550 () SeekEntryResult!684)

(assert (=> b!192431 (and (bvsge (index!4908 lt!95550) #b00000000000000000000000000000000) (bvslt (index!4908 lt!95550) (size!4156 (_keys!5901 thiss!1248))))))

(declare-fun res!90887 () Bool)

(assert (=> b!192431 (= res!90887 (= (select (arr!3832 (_keys!5901 thiss!1248)) (index!4908 lt!95550)) key!828))))

(declare-fun e!126605 () Bool)

(assert (=> b!192431 (=> res!90887 e!126605)))

(declare-fun e!126603 () Bool)

(assert (=> b!192431 (= e!126603 e!126605)))

(declare-fun b!192432 () Bool)

(declare-fun e!126606 () Bool)

(assert (=> b!192432 (= e!126606 (bvsge (x!20581 lt!95550) #b01111111111111111111111111111110))))

(declare-fun d!56281 () Bool)

(assert (=> d!56281 e!126606))

(declare-fun c!34710 () Bool)

(assert (=> d!56281 (= c!34710 (and ((_ is Intermediate!684) lt!95550) (undefined!1496 lt!95550)))))

(declare-fun e!126607 () SeekEntryResult!684)

(assert (=> d!56281 (= lt!95550 e!126607)))

(declare-fun c!34709 () Bool)

(assert (=> d!56281 (= c!34709 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!95551 () (_ BitVec 64))

(assert (=> d!56281 (= lt!95551 (select (arr!3832 (_keys!5901 thiss!1248)) (toIndex!0 key!828 (mask!9149 thiss!1248))))))

(assert (=> d!56281 (validMask!0 (mask!9149 thiss!1248))))

(assert (=> d!56281 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9149 thiss!1248)) key!828 (_keys!5901 thiss!1248) (mask!9149 thiss!1248)) lt!95550)))

(declare-fun b!192433 () Bool)

(declare-fun e!126604 () SeekEntryResult!684)

(assert (=> b!192433 (= e!126607 e!126604)))

(declare-fun c!34708 () Bool)

(assert (=> b!192433 (= c!34708 (or (= lt!95551 key!828) (= (bvadd lt!95551 lt!95551) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!192434 () Bool)

(assert (=> b!192434 (= e!126604 (Intermediate!684 false (toIndex!0 key!828 (mask!9149 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!192435 () Bool)

(assert (=> b!192435 (= e!126604 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!9149 thiss!1248)) #b00000000000000000000000000000000 (mask!9149 thiss!1248)) key!828 (_keys!5901 thiss!1248) (mask!9149 thiss!1248)))))

(declare-fun b!192436 () Bool)

(assert (=> b!192436 (= e!126607 (Intermediate!684 true (toIndex!0 key!828 (mask!9149 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!192437 () Bool)

(assert (=> b!192437 (and (bvsge (index!4908 lt!95550) #b00000000000000000000000000000000) (bvslt (index!4908 lt!95550) (size!4156 (_keys!5901 thiss!1248))))))

(assert (=> b!192437 (= e!126605 (= (select (arr!3832 (_keys!5901 thiss!1248)) (index!4908 lt!95550)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!192438 () Bool)

(assert (=> b!192438 (= e!126606 e!126603)))

(declare-fun res!90886 () Bool)

(assert (=> b!192438 (= res!90886 (and ((_ is Intermediate!684) lt!95550) (not (undefined!1496 lt!95550)) (bvslt (x!20581 lt!95550) #b01111111111111111111111111111110) (bvsge (x!20581 lt!95550) #b00000000000000000000000000000000) (bvsge (x!20581 lt!95550) #b00000000000000000000000000000000)))))

(assert (=> b!192438 (=> (not res!90886) (not e!126603))))

(declare-fun b!192439 () Bool)

(assert (=> b!192439 (and (bvsge (index!4908 lt!95550) #b00000000000000000000000000000000) (bvslt (index!4908 lt!95550) (size!4156 (_keys!5901 thiss!1248))))))

(declare-fun res!90888 () Bool)

(assert (=> b!192439 (= res!90888 (= (select (arr!3832 (_keys!5901 thiss!1248)) (index!4908 lt!95550)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!192439 (=> res!90888 e!126605)))

(assert (= (and d!56281 c!34709) b!192436))

(assert (= (and d!56281 (not c!34709)) b!192433))

(assert (= (and b!192433 c!34708) b!192434))

(assert (= (and b!192433 (not c!34708)) b!192435))

(assert (= (and d!56281 c!34710) b!192432))

(assert (= (and d!56281 (not c!34710)) b!192438))

(assert (= (and b!192438 res!90886) b!192431))

(assert (= (and b!192431 (not res!90887)) b!192439))

(assert (= (and b!192439 (not res!90888)) b!192437))

(declare-fun m!218669 () Bool)

(assert (=> b!192431 m!218669))

(assert (=> d!56281 m!218311))

(declare-fun m!218671 () Bool)

(assert (=> d!56281 m!218671))

(assert (=> d!56281 m!218215))

(assert (=> b!192437 m!218669))

(assert (=> b!192439 m!218669))

(assert (=> b!192435 m!218311))

(declare-fun m!218673 () Bool)

(assert (=> b!192435 m!218673))

(assert (=> b!192435 m!218673))

(declare-fun m!218675 () Bool)

(assert (=> b!192435 m!218675))

(assert (=> d!56189 d!56281))

(declare-fun d!56283 () Bool)

(declare-fun lt!95557 () (_ BitVec 32))

(declare-fun lt!95556 () (_ BitVec 32))

(assert (=> d!56283 (= lt!95557 (bvmul (bvxor lt!95556 (bvlshr lt!95556 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!56283 (= lt!95556 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!56283 (and (bvsge (mask!9149 thiss!1248) #b00000000000000000000000000000000) (let ((res!90889 (let ((h!3047 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!20599 (bvmul (bvxor h!3047 (bvlshr h!3047 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!20599 (bvlshr x!20599 #b00000000000000000000000000001101)) (mask!9149 thiss!1248)))))) (and (bvslt res!90889 (bvadd (mask!9149 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!90889 #b00000000000000000000000000000000))))))

(assert (=> d!56283 (= (toIndex!0 key!828 (mask!9149 thiss!1248)) (bvand (bvxor lt!95557 (bvlshr lt!95557 #b00000000000000000000000000001101)) (mask!9149 thiss!1248)))))

(assert (=> d!56189 d!56283))

(assert (=> d!56189 d!56199))

(assert (=> d!56185 d!56189))

(declare-fun b!192456 () Bool)

(declare-fun e!126616 () Bool)

(declare-fun call!19426 () Bool)

(assert (=> b!192456 (= e!126616 (not call!19426))))

(declare-fun b!192457 () Bool)

(declare-fun res!90900 () Bool)

(declare-fun e!126619 () Bool)

(assert (=> b!192457 (=> (not res!90900) (not e!126619))))

(declare-fun lt!95560 () SeekEntryResult!684)

(assert (=> b!192457 (= res!90900 (= (select (arr!3832 (_keys!5901 thiss!1248)) (index!4909 lt!95560)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!192458 () Bool)

(declare-fun e!126617 () Bool)

(declare-fun e!126618 () Bool)

(assert (=> b!192458 (= e!126617 e!126618)))

(declare-fun c!34716 () Bool)

(assert (=> b!192458 (= c!34716 ((_ is MissingVacant!684) lt!95560))))

(declare-fun d!56285 () Bool)

(assert (=> d!56285 e!126617))

(declare-fun c!34715 () Bool)

(assert (=> d!56285 (= c!34715 ((_ is MissingZero!684) lt!95560))))

(assert (=> d!56285 (= lt!95560 (seekEntryOrOpen!0 key!828 (_keys!5901 thiss!1248) (mask!9149 thiss!1248)))))

(assert (=> d!56285 true))

(declare-fun _$34!1084 () Unit!5763)

(assert (=> d!56285 (= (choose!1051 (_keys!5901 thiss!1248) (_values!3903 thiss!1248) (mask!9149 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) key!828 (defaultEntry!3920 thiss!1248)) _$34!1084)))

(declare-fun b!192459 () Bool)

(declare-fun res!90898 () Bool)

(assert (=> b!192459 (= res!90898 (= (select (arr!3832 (_keys!5901 thiss!1248)) (index!4906 lt!95560)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!192459 (=> (not res!90898) (not e!126616))))

(declare-fun b!192460 () Bool)

(assert (=> b!192460 (= e!126618 ((_ is Undefined!684) lt!95560))))

(declare-fun bm!19423 () Bool)

(assert (=> bm!19423 (= call!19426 (arrayContainsKey!0 (_keys!5901 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun call!19427 () Bool)

(declare-fun bm!19424 () Bool)

(assert (=> bm!19424 (= call!19427 (inRange!0 (ite c!34715 (index!4906 lt!95560) (index!4909 lt!95560)) (mask!9149 thiss!1248)))))

(declare-fun b!192461 () Bool)

(declare-fun res!90899 () Bool)

(assert (=> b!192461 (=> (not res!90899) (not e!126619))))

(assert (=> b!192461 (= res!90899 call!19427)))

(assert (=> b!192461 (= e!126618 e!126619)))

(declare-fun b!192462 () Bool)

(assert (=> b!192462 (= e!126619 (not call!19426))))

(declare-fun b!192463 () Bool)

(assert (=> b!192463 (= e!126617 e!126616)))

(declare-fun res!90901 () Bool)

(assert (=> b!192463 (= res!90901 call!19427)))

(assert (=> b!192463 (=> (not res!90901) (not e!126616))))

(assert (= (and d!56285 c!34715) b!192463))

(assert (= (and d!56285 (not c!34715)) b!192458))

(assert (= (and b!192463 res!90901) b!192459))

(assert (= (and b!192459 res!90898) b!192456))

(assert (= (and b!192458 c!34716) b!192461))

(assert (= (and b!192458 (not c!34716)) b!192460))

(assert (= (and b!192461 res!90899) b!192457))

(assert (= (and b!192457 res!90900) b!192462))

(assert (= (or b!192463 b!192461) bm!19424))

(assert (= (or b!192456 b!192462) bm!19423))

(declare-fun m!218677 () Bool)

(assert (=> bm!19424 m!218677))

(declare-fun m!218679 () Bool)

(assert (=> b!192457 m!218679))

(declare-fun m!218681 () Bool)

(assert (=> b!192459 m!218681))

(assert (=> bm!19423 m!218295))

(assert (=> d!56285 m!218201))

(assert (=> d!56185 d!56285))

(assert (=> d!56185 d!56199))

(declare-fun d!56287 () Bool)

(declare-fun e!126620 () Bool)

(assert (=> d!56287 e!126620))

(declare-fun res!90902 () Bool)

(assert (=> d!56287 (=> res!90902 e!126620)))

(declare-fun lt!95562 () Bool)

(assert (=> d!56287 (= res!90902 (not lt!95562))))

(declare-fun lt!95564 () Bool)

(assert (=> d!56287 (= lt!95562 lt!95564)))

(declare-fun lt!95563 () Unit!5763)

(declare-fun e!126621 () Unit!5763)

(assert (=> d!56287 (= lt!95563 e!126621)))

(declare-fun c!34717 () Bool)

(assert (=> d!56287 (= c!34717 lt!95564)))

(assert (=> d!56287 (= lt!95564 (containsKey!242 (toList!1215 (+!307 lt!95411 (tuple2!3491 lt!95418 (zeroValue!3761 thiss!1248)))) lt!95422))))

(assert (=> d!56287 (= (contains!1337 (+!307 lt!95411 (tuple2!3491 lt!95418 (zeroValue!3761 thiss!1248))) lt!95422) lt!95562)))

(declare-fun b!192464 () Bool)

(declare-fun lt!95561 () Unit!5763)

(assert (=> b!192464 (= e!126621 lt!95561)))

(assert (=> b!192464 (= lt!95561 (lemmaContainsKeyImpliesGetValueByKeyDefined!191 (toList!1215 (+!307 lt!95411 (tuple2!3491 lt!95418 (zeroValue!3761 thiss!1248)))) lt!95422))))

(assert (=> b!192464 (isDefined!192 (getValueByKey!238 (toList!1215 (+!307 lt!95411 (tuple2!3491 lt!95418 (zeroValue!3761 thiss!1248)))) lt!95422))))

(declare-fun b!192465 () Bool)

(declare-fun Unit!5775 () Unit!5763)

(assert (=> b!192465 (= e!126621 Unit!5775)))

(declare-fun b!192466 () Bool)

(assert (=> b!192466 (= e!126620 (isDefined!192 (getValueByKey!238 (toList!1215 (+!307 lt!95411 (tuple2!3491 lt!95418 (zeroValue!3761 thiss!1248)))) lt!95422)))))

(assert (= (and d!56287 c!34717) b!192464))

(assert (= (and d!56287 (not c!34717)) b!192465))

(assert (= (and d!56287 (not res!90902)) b!192466))

(declare-fun m!218683 () Bool)

(assert (=> d!56287 m!218683))

(declare-fun m!218685 () Bool)

(assert (=> b!192464 m!218685))

(declare-fun m!218687 () Bool)

(assert (=> b!192464 m!218687))

(assert (=> b!192464 m!218687))

(declare-fun m!218689 () Bool)

(assert (=> b!192464 m!218689))

(assert (=> b!192466 m!218687))

(assert (=> b!192466 m!218687))

(assert (=> b!192466 m!218689))

(assert (=> b!192158 d!56287))

(declare-fun d!56289 () Bool)

(assert (=> d!56289 (= (apply!183 (+!307 lt!95421 (tuple2!3491 lt!95408 (minValue!3761 thiss!1248))) lt!95407) (get!2214 (getValueByKey!238 (toList!1215 (+!307 lt!95421 (tuple2!3491 lt!95408 (minValue!3761 thiss!1248)))) lt!95407)))))

(declare-fun bs!7670 () Bool)

(assert (= bs!7670 d!56289))

(declare-fun m!218691 () Bool)

(assert (=> bs!7670 m!218691))

(assert (=> bs!7670 m!218691))

(declare-fun m!218693 () Bool)

(assert (=> bs!7670 m!218693))

(assert (=> b!192158 d!56289))

(declare-fun d!56291 () Bool)

(assert (=> d!56291 (= (apply!183 (+!307 lt!95410 (tuple2!3491 lt!95417 (minValue!3761 thiss!1248))) lt!95406) (get!2214 (getValueByKey!238 (toList!1215 (+!307 lt!95410 (tuple2!3491 lt!95417 (minValue!3761 thiss!1248)))) lt!95406)))))

(declare-fun bs!7671 () Bool)

(assert (= bs!7671 d!56291))

(declare-fun m!218695 () Bool)

(assert (=> bs!7671 m!218695))

(assert (=> bs!7671 m!218695))

(declare-fun m!218697 () Bool)

(assert (=> bs!7671 m!218697))

(assert (=> b!192158 d!56291))

(declare-fun d!56293 () Bool)

(assert (=> d!56293 (= (apply!183 lt!95424 lt!95413) (get!2214 (getValueByKey!238 (toList!1215 lt!95424) lt!95413)))))

(declare-fun bs!7672 () Bool)

(assert (= bs!7672 d!56293))

(declare-fun m!218699 () Bool)

(assert (=> bs!7672 m!218699))

(assert (=> bs!7672 m!218699))

(declare-fun m!218701 () Bool)

(assert (=> bs!7672 m!218701))

(assert (=> b!192158 d!56293))

(declare-fun d!56295 () Bool)

(assert (=> d!56295 (contains!1337 (+!307 lt!95411 (tuple2!3491 lt!95418 (zeroValue!3761 thiss!1248))) lt!95422)))

(declare-fun lt!95567 () Unit!5763)

(declare-fun choose!1055 (ListLongMap!2399 (_ BitVec 64) V!5593 (_ BitVec 64)) Unit!5763)

(assert (=> d!56295 (= lt!95567 (choose!1055 lt!95411 lt!95418 (zeroValue!3761 thiss!1248) lt!95422))))

(assert (=> d!56295 (contains!1337 lt!95411 lt!95422)))

(assert (=> d!56295 (= (addStillContains!159 lt!95411 lt!95418 (zeroValue!3761 thiss!1248) lt!95422) lt!95567)))

(declare-fun bs!7673 () Bool)

(assert (= bs!7673 d!56295))

(assert (=> bs!7673 m!218405))

(assert (=> bs!7673 m!218405))

(assert (=> bs!7673 m!218407))

(declare-fun m!218703 () Bool)

(assert (=> bs!7673 m!218703))

(declare-fun m!218705 () Bool)

(assert (=> bs!7673 m!218705))

(assert (=> b!192158 d!56295))

(declare-fun d!56297 () Bool)

(declare-fun e!126622 () Bool)

(assert (=> d!56297 e!126622))

(declare-fun res!90903 () Bool)

(assert (=> d!56297 (=> (not res!90903) (not e!126622))))

(declare-fun lt!95569 () ListLongMap!2399)

(assert (=> d!56297 (= res!90903 (contains!1337 lt!95569 (_1!1756 (tuple2!3491 lt!95408 (minValue!3761 thiss!1248)))))))

(declare-fun lt!95571 () List!2409)

(assert (=> d!56297 (= lt!95569 (ListLongMap!2400 lt!95571))))

(declare-fun lt!95570 () Unit!5763)

(declare-fun lt!95568 () Unit!5763)

(assert (=> d!56297 (= lt!95570 lt!95568)))

(assert (=> d!56297 (= (getValueByKey!238 lt!95571 (_1!1756 (tuple2!3491 lt!95408 (minValue!3761 thiss!1248)))) (Some!243 (_2!1756 (tuple2!3491 lt!95408 (minValue!3761 thiss!1248)))))))

(assert (=> d!56297 (= lt!95568 (lemmaContainsTupThenGetReturnValue!128 lt!95571 (_1!1756 (tuple2!3491 lt!95408 (minValue!3761 thiss!1248))) (_2!1756 (tuple2!3491 lt!95408 (minValue!3761 thiss!1248)))))))

(assert (=> d!56297 (= lt!95571 (insertStrictlySorted!131 (toList!1215 lt!95421) (_1!1756 (tuple2!3491 lt!95408 (minValue!3761 thiss!1248))) (_2!1756 (tuple2!3491 lt!95408 (minValue!3761 thiss!1248)))))))

(assert (=> d!56297 (= (+!307 lt!95421 (tuple2!3491 lt!95408 (minValue!3761 thiss!1248))) lt!95569)))

(declare-fun b!192468 () Bool)

(declare-fun res!90904 () Bool)

(assert (=> b!192468 (=> (not res!90904) (not e!126622))))

(assert (=> b!192468 (= res!90904 (= (getValueByKey!238 (toList!1215 lt!95569) (_1!1756 (tuple2!3491 lt!95408 (minValue!3761 thiss!1248)))) (Some!243 (_2!1756 (tuple2!3491 lt!95408 (minValue!3761 thiss!1248))))))))

(declare-fun b!192469 () Bool)

(assert (=> b!192469 (= e!126622 (contains!1338 (toList!1215 lt!95569) (tuple2!3491 lt!95408 (minValue!3761 thiss!1248))))))

(assert (= (and d!56297 res!90903) b!192468))

(assert (= (and b!192468 res!90904) b!192469))

(declare-fun m!218707 () Bool)

(assert (=> d!56297 m!218707))

(declare-fun m!218709 () Bool)

(assert (=> d!56297 m!218709))

(declare-fun m!218711 () Bool)

(assert (=> d!56297 m!218711))

(declare-fun m!218713 () Bool)

(assert (=> d!56297 m!218713))

(declare-fun m!218715 () Bool)

(assert (=> b!192468 m!218715))

(declare-fun m!218717 () Bool)

(assert (=> b!192469 m!218717))

(assert (=> b!192158 d!56297))

(declare-fun d!56299 () Bool)

(assert (=> d!56299 (= (apply!183 lt!95421 lt!95407) (get!2214 (getValueByKey!238 (toList!1215 lt!95421) lt!95407)))))

(declare-fun bs!7674 () Bool)

(assert (= bs!7674 d!56299))

(declare-fun m!218719 () Bool)

(assert (=> bs!7674 m!218719))

(assert (=> bs!7674 m!218719))

(declare-fun m!218721 () Bool)

(assert (=> bs!7674 m!218721))

(assert (=> b!192158 d!56299))

(declare-fun d!56301 () Bool)

(assert (=> d!56301 (= (apply!183 (+!307 lt!95421 (tuple2!3491 lt!95408 (minValue!3761 thiss!1248))) lt!95407) (apply!183 lt!95421 lt!95407))))

(declare-fun lt!95574 () Unit!5763)

(declare-fun choose!1056 (ListLongMap!2399 (_ BitVec 64) V!5593 (_ BitVec 64)) Unit!5763)

(assert (=> d!56301 (= lt!95574 (choose!1056 lt!95421 lt!95408 (minValue!3761 thiss!1248) lt!95407))))

(declare-fun e!126625 () Bool)

(assert (=> d!56301 e!126625))

(declare-fun res!90907 () Bool)

(assert (=> d!56301 (=> (not res!90907) (not e!126625))))

(assert (=> d!56301 (= res!90907 (contains!1337 lt!95421 lt!95407))))

(assert (=> d!56301 (= (addApplyDifferent!159 lt!95421 lt!95408 (minValue!3761 thiss!1248) lt!95407) lt!95574)))

(declare-fun b!192473 () Bool)

(assert (=> b!192473 (= e!126625 (not (= lt!95407 lt!95408)))))

(assert (= (and d!56301 res!90907) b!192473))

(declare-fun m!218723 () Bool)

(assert (=> d!56301 m!218723))

(assert (=> d!56301 m!218411))

(assert (=> d!56301 m!218413))

(assert (=> d!56301 m!218427))

(declare-fun m!218725 () Bool)

(assert (=> d!56301 m!218725))

(assert (=> d!56301 m!218411))

(assert (=> b!192158 d!56301))

(declare-fun d!56303 () Bool)

(declare-fun e!126626 () Bool)

(assert (=> d!56303 e!126626))

(declare-fun res!90908 () Bool)

(assert (=> d!56303 (=> (not res!90908) (not e!126626))))

(declare-fun lt!95576 () ListLongMap!2399)

(assert (=> d!56303 (= res!90908 (contains!1337 lt!95576 (_1!1756 (tuple2!3491 lt!95418 (zeroValue!3761 thiss!1248)))))))

(declare-fun lt!95578 () List!2409)

(assert (=> d!56303 (= lt!95576 (ListLongMap!2400 lt!95578))))

(declare-fun lt!95577 () Unit!5763)

(declare-fun lt!95575 () Unit!5763)

(assert (=> d!56303 (= lt!95577 lt!95575)))

(assert (=> d!56303 (= (getValueByKey!238 lt!95578 (_1!1756 (tuple2!3491 lt!95418 (zeroValue!3761 thiss!1248)))) (Some!243 (_2!1756 (tuple2!3491 lt!95418 (zeroValue!3761 thiss!1248)))))))

(assert (=> d!56303 (= lt!95575 (lemmaContainsTupThenGetReturnValue!128 lt!95578 (_1!1756 (tuple2!3491 lt!95418 (zeroValue!3761 thiss!1248))) (_2!1756 (tuple2!3491 lt!95418 (zeroValue!3761 thiss!1248)))))))

(assert (=> d!56303 (= lt!95578 (insertStrictlySorted!131 (toList!1215 lt!95411) (_1!1756 (tuple2!3491 lt!95418 (zeroValue!3761 thiss!1248))) (_2!1756 (tuple2!3491 lt!95418 (zeroValue!3761 thiss!1248)))))))

(assert (=> d!56303 (= (+!307 lt!95411 (tuple2!3491 lt!95418 (zeroValue!3761 thiss!1248))) lt!95576)))

(declare-fun b!192474 () Bool)

(declare-fun res!90909 () Bool)

(assert (=> b!192474 (=> (not res!90909) (not e!126626))))

(assert (=> b!192474 (= res!90909 (= (getValueByKey!238 (toList!1215 lt!95576) (_1!1756 (tuple2!3491 lt!95418 (zeroValue!3761 thiss!1248)))) (Some!243 (_2!1756 (tuple2!3491 lt!95418 (zeroValue!3761 thiss!1248))))))))

(declare-fun b!192475 () Bool)

(assert (=> b!192475 (= e!126626 (contains!1338 (toList!1215 lt!95576) (tuple2!3491 lt!95418 (zeroValue!3761 thiss!1248))))))

(assert (= (and d!56303 res!90908) b!192474))

(assert (= (and b!192474 res!90909) b!192475))

(declare-fun m!218727 () Bool)

(assert (=> d!56303 m!218727))

(declare-fun m!218729 () Bool)

(assert (=> d!56303 m!218729))

(declare-fun m!218731 () Bool)

(assert (=> d!56303 m!218731))

(declare-fun m!218733 () Bool)

(assert (=> d!56303 m!218733))

(declare-fun m!218735 () Bool)

(assert (=> b!192474 m!218735))

(declare-fun m!218737 () Bool)

(assert (=> b!192475 m!218737))

(assert (=> b!192158 d!56303))

(declare-fun d!56305 () Bool)

(assert (=> d!56305 (= (apply!183 lt!95410 lt!95406) (get!2214 (getValueByKey!238 (toList!1215 lt!95410) lt!95406)))))

(declare-fun bs!7675 () Bool)

(assert (= bs!7675 d!56305))

(declare-fun m!218739 () Bool)

(assert (=> bs!7675 m!218739))

(assert (=> bs!7675 m!218739))

(declare-fun m!218741 () Bool)

(assert (=> bs!7675 m!218741))

(assert (=> b!192158 d!56305))

(declare-fun d!56307 () Bool)

(assert (=> d!56307 (= (apply!183 (+!307 lt!95424 (tuple2!3491 lt!95416 (zeroValue!3761 thiss!1248))) lt!95413) (get!2214 (getValueByKey!238 (toList!1215 (+!307 lt!95424 (tuple2!3491 lt!95416 (zeroValue!3761 thiss!1248)))) lt!95413)))))

(declare-fun bs!7676 () Bool)

(assert (= bs!7676 d!56307))

(declare-fun m!218743 () Bool)

(assert (=> bs!7676 m!218743))

(assert (=> bs!7676 m!218743))

(declare-fun m!218745 () Bool)

(assert (=> bs!7676 m!218745))

(assert (=> b!192158 d!56307))

(declare-fun d!56309 () Bool)

(declare-fun e!126627 () Bool)

(assert (=> d!56309 e!126627))

(declare-fun res!90910 () Bool)

(assert (=> d!56309 (=> (not res!90910) (not e!126627))))

(declare-fun lt!95580 () ListLongMap!2399)

(assert (=> d!56309 (= res!90910 (contains!1337 lt!95580 (_1!1756 (tuple2!3491 lt!95417 (minValue!3761 thiss!1248)))))))

(declare-fun lt!95582 () List!2409)

(assert (=> d!56309 (= lt!95580 (ListLongMap!2400 lt!95582))))

(declare-fun lt!95581 () Unit!5763)

(declare-fun lt!95579 () Unit!5763)

(assert (=> d!56309 (= lt!95581 lt!95579)))

(assert (=> d!56309 (= (getValueByKey!238 lt!95582 (_1!1756 (tuple2!3491 lt!95417 (minValue!3761 thiss!1248)))) (Some!243 (_2!1756 (tuple2!3491 lt!95417 (minValue!3761 thiss!1248)))))))

(assert (=> d!56309 (= lt!95579 (lemmaContainsTupThenGetReturnValue!128 lt!95582 (_1!1756 (tuple2!3491 lt!95417 (minValue!3761 thiss!1248))) (_2!1756 (tuple2!3491 lt!95417 (minValue!3761 thiss!1248)))))))

(assert (=> d!56309 (= lt!95582 (insertStrictlySorted!131 (toList!1215 lt!95410) (_1!1756 (tuple2!3491 lt!95417 (minValue!3761 thiss!1248))) (_2!1756 (tuple2!3491 lt!95417 (minValue!3761 thiss!1248)))))))

(assert (=> d!56309 (= (+!307 lt!95410 (tuple2!3491 lt!95417 (minValue!3761 thiss!1248))) lt!95580)))

(declare-fun b!192476 () Bool)

(declare-fun res!90911 () Bool)

(assert (=> b!192476 (=> (not res!90911) (not e!126627))))

(assert (=> b!192476 (= res!90911 (= (getValueByKey!238 (toList!1215 lt!95580) (_1!1756 (tuple2!3491 lt!95417 (minValue!3761 thiss!1248)))) (Some!243 (_2!1756 (tuple2!3491 lt!95417 (minValue!3761 thiss!1248))))))))

(declare-fun b!192477 () Bool)

(assert (=> b!192477 (= e!126627 (contains!1338 (toList!1215 lt!95580) (tuple2!3491 lt!95417 (minValue!3761 thiss!1248))))))

(assert (= (and d!56309 res!90910) b!192476))

(assert (= (and b!192476 res!90911) b!192477))

(declare-fun m!218747 () Bool)

(assert (=> d!56309 m!218747))

(declare-fun m!218749 () Bool)

(assert (=> d!56309 m!218749))

(declare-fun m!218751 () Bool)

(assert (=> d!56309 m!218751))

(declare-fun m!218753 () Bool)

(assert (=> d!56309 m!218753))

(declare-fun m!218755 () Bool)

(assert (=> b!192476 m!218755))

(declare-fun m!218757 () Bool)

(assert (=> b!192477 m!218757))

(assert (=> b!192158 d!56309))

(declare-fun d!56311 () Bool)

(declare-fun e!126628 () Bool)

(assert (=> d!56311 e!126628))

(declare-fun res!90912 () Bool)

(assert (=> d!56311 (=> (not res!90912) (not e!126628))))

(declare-fun lt!95584 () ListLongMap!2399)

(assert (=> d!56311 (= res!90912 (contains!1337 lt!95584 (_1!1756 (tuple2!3491 lt!95416 (zeroValue!3761 thiss!1248)))))))

(declare-fun lt!95586 () List!2409)

(assert (=> d!56311 (= lt!95584 (ListLongMap!2400 lt!95586))))

(declare-fun lt!95585 () Unit!5763)

(declare-fun lt!95583 () Unit!5763)

(assert (=> d!56311 (= lt!95585 lt!95583)))

(assert (=> d!56311 (= (getValueByKey!238 lt!95586 (_1!1756 (tuple2!3491 lt!95416 (zeroValue!3761 thiss!1248)))) (Some!243 (_2!1756 (tuple2!3491 lt!95416 (zeroValue!3761 thiss!1248)))))))

(assert (=> d!56311 (= lt!95583 (lemmaContainsTupThenGetReturnValue!128 lt!95586 (_1!1756 (tuple2!3491 lt!95416 (zeroValue!3761 thiss!1248))) (_2!1756 (tuple2!3491 lt!95416 (zeroValue!3761 thiss!1248)))))))

(assert (=> d!56311 (= lt!95586 (insertStrictlySorted!131 (toList!1215 lt!95424) (_1!1756 (tuple2!3491 lt!95416 (zeroValue!3761 thiss!1248))) (_2!1756 (tuple2!3491 lt!95416 (zeroValue!3761 thiss!1248)))))))

(assert (=> d!56311 (= (+!307 lt!95424 (tuple2!3491 lt!95416 (zeroValue!3761 thiss!1248))) lt!95584)))

(declare-fun b!192478 () Bool)

(declare-fun res!90913 () Bool)

(assert (=> b!192478 (=> (not res!90913) (not e!126628))))

(assert (=> b!192478 (= res!90913 (= (getValueByKey!238 (toList!1215 lt!95584) (_1!1756 (tuple2!3491 lt!95416 (zeroValue!3761 thiss!1248)))) (Some!243 (_2!1756 (tuple2!3491 lt!95416 (zeroValue!3761 thiss!1248))))))))

(declare-fun b!192479 () Bool)

(assert (=> b!192479 (= e!126628 (contains!1338 (toList!1215 lt!95584) (tuple2!3491 lt!95416 (zeroValue!3761 thiss!1248))))))

(assert (= (and d!56311 res!90912) b!192478))

(assert (= (and b!192478 res!90913) b!192479))

(declare-fun m!218759 () Bool)

(assert (=> d!56311 m!218759))

(declare-fun m!218761 () Bool)

(assert (=> d!56311 m!218761))

(declare-fun m!218763 () Bool)

(assert (=> d!56311 m!218763))

(declare-fun m!218765 () Bool)

(assert (=> d!56311 m!218765))

(declare-fun m!218767 () Bool)

(assert (=> b!192478 m!218767))

(declare-fun m!218769 () Bool)

(assert (=> b!192479 m!218769))

(assert (=> b!192158 d!56311))

(declare-fun d!56313 () Bool)

(assert (=> d!56313 (= (apply!183 (+!307 lt!95410 (tuple2!3491 lt!95417 (minValue!3761 thiss!1248))) lt!95406) (apply!183 lt!95410 lt!95406))))

(declare-fun lt!95587 () Unit!5763)

(assert (=> d!56313 (= lt!95587 (choose!1056 lt!95410 lt!95417 (minValue!3761 thiss!1248) lt!95406))))

(declare-fun e!126629 () Bool)

(assert (=> d!56313 e!126629))

(declare-fun res!90914 () Bool)

(assert (=> d!56313 (=> (not res!90914) (not e!126629))))

(assert (=> d!56313 (= res!90914 (contains!1337 lt!95410 lt!95406))))

(assert (=> d!56313 (= (addApplyDifferent!159 lt!95410 lt!95417 (minValue!3761 thiss!1248) lt!95406) lt!95587)))

(declare-fun b!192480 () Bool)

(assert (=> b!192480 (= e!126629 (not (= lt!95406 lt!95417)))))

(assert (= (and d!56313 res!90914) b!192480))

(declare-fun m!218771 () Bool)

(assert (=> d!56313 m!218771))

(assert (=> d!56313 m!218429))

(assert (=> d!56313 m!218431))

(assert (=> d!56313 m!218417))

(declare-fun m!218773 () Bool)

(assert (=> d!56313 m!218773))

(assert (=> d!56313 m!218429))

(assert (=> b!192158 d!56313))

(declare-fun d!56315 () Bool)

(assert (=> d!56315 (= (apply!183 (+!307 lt!95424 (tuple2!3491 lt!95416 (zeroValue!3761 thiss!1248))) lt!95413) (apply!183 lt!95424 lt!95413))))

(declare-fun lt!95588 () Unit!5763)

(assert (=> d!56315 (= lt!95588 (choose!1056 lt!95424 lt!95416 (zeroValue!3761 thiss!1248) lt!95413))))

(declare-fun e!126630 () Bool)

(assert (=> d!56315 e!126630))

(declare-fun res!90915 () Bool)

(assert (=> d!56315 (=> (not res!90915) (not e!126630))))

(assert (=> d!56315 (= res!90915 (contains!1337 lt!95424 lt!95413))))

(assert (=> d!56315 (= (addApplyDifferent!159 lt!95424 lt!95416 (zeroValue!3761 thiss!1248) lt!95413) lt!95588)))

(declare-fun b!192481 () Bool)

(assert (=> b!192481 (= e!126630 (not (= lt!95413 lt!95416)))))

(assert (= (and d!56315 res!90915) b!192481))

(declare-fun m!218775 () Bool)

(assert (=> d!56315 m!218775))

(assert (=> d!56315 m!218423))

(assert (=> d!56315 m!218425))

(assert (=> d!56315 m!218415))

(declare-fun m!218777 () Bool)

(assert (=> d!56315 m!218777))

(assert (=> d!56315 m!218423))

(assert (=> b!192158 d!56315))

(assert (=> b!192158 d!56247))

(declare-fun d!56317 () Bool)

(declare-fun isEmpty!490 (Option!244) Bool)

(assert (=> d!56317 (= (isDefined!192 (getValueByKey!238 (toList!1215 lt!95278) key!828)) (not (isEmpty!490 (getValueByKey!238 (toList!1215 lt!95278) key!828))))))

(declare-fun bs!7677 () Bool)

(assert (= bs!7677 d!56317))

(assert (=> bs!7677 m!218455))

(declare-fun m!218779 () Bool)

(assert (=> bs!7677 m!218779))

(assert (=> b!192187 d!56317))

(declare-fun b!192482 () Bool)

(declare-fun e!126631 () Option!244)

(assert (=> b!192482 (= e!126631 (Some!243 (_2!1756 (h!3045 (toList!1215 lt!95278)))))))

(declare-fun b!192485 () Bool)

(declare-fun e!126632 () Option!244)

(assert (=> b!192485 (= e!126632 None!242)))

(declare-fun d!56319 () Bool)

(declare-fun c!34718 () Bool)

(assert (=> d!56319 (= c!34718 (and ((_ is Cons!2405) (toList!1215 lt!95278)) (= (_1!1756 (h!3045 (toList!1215 lt!95278))) key!828)))))

(assert (=> d!56319 (= (getValueByKey!238 (toList!1215 lt!95278) key!828) e!126631)))

(declare-fun b!192483 () Bool)

(assert (=> b!192483 (= e!126631 e!126632)))

(declare-fun c!34719 () Bool)

(assert (=> b!192483 (= c!34719 (and ((_ is Cons!2405) (toList!1215 lt!95278)) (not (= (_1!1756 (h!3045 (toList!1215 lt!95278))) key!828))))))

(declare-fun b!192484 () Bool)

(assert (=> b!192484 (= e!126632 (getValueByKey!238 (t!7316 (toList!1215 lt!95278)) key!828))))

(assert (= (and d!56319 c!34718) b!192482))

(assert (= (and d!56319 (not c!34718)) b!192483))

(assert (= (and b!192483 c!34719) b!192484))

(assert (= (and b!192483 (not c!34719)) b!192485))

(declare-fun m!218781 () Bool)

(assert (=> b!192484 m!218781))

(assert (=> b!192187 d!56319))

(declare-fun d!56321 () Bool)

(assert (=> d!56321 (= (apply!183 (+!307 lt!95402 (tuple2!3491 lt!95394 (zeroValue!3761 thiss!1248))) lt!95391) (get!2214 (getValueByKey!238 (toList!1215 (+!307 lt!95402 (tuple2!3491 lt!95394 (zeroValue!3761 thiss!1248)))) lt!95391)))))

(declare-fun bs!7678 () Bool)

(assert (= bs!7678 d!56321))

(declare-fun m!218783 () Bool)

(assert (=> bs!7678 m!218783))

(assert (=> bs!7678 m!218783))

(declare-fun m!218785 () Bool)

(assert (=> bs!7678 m!218785))

(assert (=> b!192135 d!56321))

(declare-fun b!192486 () Bool)

(declare-fun e!126636 () Bool)

(declare-fun e!126635 () Bool)

(assert (=> b!192486 (= e!126636 e!126635)))

(declare-fun c!34720 () Bool)

(assert (=> b!192486 (= c!34720 (bvslt #b00000000000000000000000000000000 (size!4156 (_keys!5901 thiss!1248))))))

(declare-fun b!192487 () Bool)

(declare-fun e!126634 () Bool)

(assert (=> b!192487 (= e!126634 e!126636)))

(declare-fun c!34722 () Bool)

(declare-fun e!126638 () Bool)

(assert (=> b!192487 (= c!34722 e!126638)))

(declare-fun res!90917 () Bool)

(assert (=> b!192487 (=> (not res!90917) (not e!126638))))

(assert (=> b!192487 (= res!90917 (bvslt #b00000000000000000000000000000000 (size!4156 (_keys!5901 thiss!1248))))))

(declare-fun bm!19425 () Bool)

(declare-fun call!19428 () ListLongMap!2399)

(assert (=> bm!19425 (= call!19428 (getCurrentListMapNoExtraKeys!204 (_keys!5901 thiss!1248) (_values!3903 thiss!1248) (mask!9149 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3920 thiss!1248)))))

(declare-fun b!192488 () Bool)

(declare-fun res!90916 () Bool)

(assert (=> b!192488 (=> (not res!90916) (not e!126634))))

(declare-fun lt!95593 () ListLongMap!2399)

(assert (=> b!192488 (= res!90916 (not (contains!1337 lt!95593 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!192489 () Bool)

(assert (=> b!192489 (= e!126635 (= lt!95593 (getCurrentListMapNoExtraKeys!204 (_keys!5901 thiss!1248) (_values!3903 thiss!1248) (mask!9149 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3920 thiss!1248))))))

(declare-fun b!192490 () Bool)

(assert (=> b!192490 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4156 (_keys!5901 thiss!1248))))))

(assert (=> b!192490 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4157 (_values!3903 thiss!1248))))))

(declare-fun e!126639 () Bool)

(assert (=> b!192490 (= e!126639 (= (apply!183 lt!95593 (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000)) (get!2213 (select (arr!3833 (_values!3903 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!517 (defaultEntry!3920 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!192491 () Bool)

(declare-fun e!126637 () ListLongMap!2399)

(declare-fun e!126633 () ListLongMap!2399)

(assert (=> b!192491 (= e!126637 e!126633)))

(declare-fun c!34721 () Bool)

(assert (=> b!192491 (= c!34721 (validKeyInArray!0 (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192492 () Bool)

(assert (=> b!192492 (= e!126636 e!126639)))

(assert (=> b!192492 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4156 (_keys!5901 thiss!1248))))))

(declare-fun res!90918 () Bool)

(assert (=> b!192492 (= res!90918 (contains!1337 lt!95593 (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!192492 (=> (not res!90918) (not e!126639))))

(declare-fun d!56323 () Bool)

(assert (=> d!56323 e!126634))

(declare-fun res!90919 () Bool)

(assert (=> d!56323 (=> (not res!90919) (not e!126634))))

(assert (=> d!56323 (= res!90919 (not (contains!1337 lt!95593 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56323 (= lt!95593 e!126637)))

(declare-fun c!34723 () Bool)

(assert (=> d!56323 (= c!34723 (bvsge #b00000000000000000000000000000000 (size!4156 (_keys!5901 thiss!1248))))))

(assert (=> d!56323 (validMask!0 (mask!9149 thiss!1248))))

(assert (=> d!56323 (= (getCurrentListMapNoExtraKeys!204 (_keys!5901 thiss!1248) (_values!3903 thiss!1248) (mask!9149 thiss!1248) (extraKeys!3657 thiss!1248) (zeroValue!3761 thiss!1248) (minValue!3761 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3920 thiss!1248)) lt!95593)))

(declare-fun b!192493 () Bool)

(declare-fun lt!95594 () Unit!5763)

(declare-fun lt!95590 () Unit!5763)

(assert (=> b!192493 (= lt!95594 lt!95590)))

(declare-fun lt!95592 () (_ BitVec 64))

(declare-fun lt!95595 () V!5593)

(declare-fun lt!95589 () (_ BitVec 64))

(declare-fun lt!95591 () ListLongMap!2399)

(assert (=> b!192493 (not (contains!1337 (+!307 lt!95591 (tuple2!3491 lt!95589 lt!95595)) lt!95592))))

(assert (=> b!192493 (= lt!95590 (addStillNotContains!97 lt!95591 lt!95589 lt!95595 lt!95592))))

(assert (=> b!192493 (= lt!95592 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!192493 (= lt!95595 (get!2213 (select (arr!3833 (_values!3903 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!517 (defaultEntry!3920 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!192493 (= lt!95589 (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!192493 (= lt!95591 call!19428)))

(assert (=> b!192493 (= e!126633 (+!307 call!19428 (tuple2!3491 (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000) (get!2213 (select (arr!3833 (_values!3903 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!517 (defaultEntry!3920 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!192494 () Bool)

(assert (=> b!192494 (= e!126637 (ListLongMap!2400 Nil!2406))))

(declare-fun b!192495 () Bool)

(assert (=> b!192495 (= e!126638 (validKeyInArray!0 (select (arr!3832 (_keys!5901 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!192495 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!192496 () Bool)

(assert (=> b!192496 (= e!126635 (isEmpty!489 lt!95593))))

(declare-fun b!192497 () Bool)

(assert (=> b!192497 (= e!126633 call!19428)))

(assert (= (and d!56323 c!34723) b!192494))

(assert (= (and d!56323 (not c!34723)) b!192491))

(assert (= (and b!192491 c!34721) b!192493))

(assert (= (and b!192491 (not c!34721)) b!192497))

(assert (= (or b!192493 b!192497) bm!19425))

(assert (= (and d!56323 res!90919) b!192488))

(assert (= (and b!192488 res!90916) b!192487))

(assert (= (and b!192487 res!90917) b!192495))

(assert (= (and b!192487 c!34722) b!192492))

(assert (= (and b!192487 (not c!34722)) b!192486))

(assert (= (and b!192492 res!90918) b!192490))

(assert (= (and b!192486 c!34720) b!192489))

(assert (= (and b!192486 (not c!34720)) b!192496))

(declare-fun b_lambda!7417 () Bool)

(assert (=> (not b_lambda!7417) (not b!192490)))

(assert (=> b!192490 t!7318))

(declare-fun b_and!11361 () Bool)

(assert (= b_and!11359 (and (=> t!7318 result!4901) b_and!11361)))

(declare-fun b_lambda!7419 () Bool)

(assert (=> (not b_lambda!7419) (not b!192493)))

(assert (=> b!192493 t!7318))

(declare-fun b_and!11363 () Bool)

(assert (= b_and!11361 (and (=> t!7318 result!4901) b_and!11363)))

(assert (=> b!192492 m!218333))

(assert (=> b!192492 m!218333))

(declare-fun m!218787 () Bool)

(assert (=> b!192492 m!218787))

(declare-fun m!218789 () Bool)

(assert (=> b!192489 m!218789))

(assert (=> b!192491 m!218333))

(assert (=> b!192491 m!218333))

(assert (=> b!192491 m!218349))

(declare-fun m!218791 () Bool)

(assert (=> b!192496 m!218791))

(assert (=> b!192490 m!218333))

(assert (=> b!192490 m!218343))

(assert (=> b!192490 m!218341))

(assert (=> b!192490 m!218345))

(assert (=> b!192490 m!218343))

(assert (=> b!192490 m!218341))

(assert (=> b!192490 m!218333))

(declare-fun m!218793 () Bool)

(assert (=> b!192490 m!218793))

(declare-fun m!218795 () Bool)

(assert (=> b!192488 m!218795))

(declare-fun m!218797 () Bool)

(assert (=> d!56323 m!218797))

(assert (=> d!56323 m!218215))

(assert (=> b!192495 m!218333))

(assert (=> b!192495 m!218333))

(assert (=> b!192495 m!218349))

(assert (=> b!192493 m!218333))

(declare-fun m!218799 () Bool)

(assert (=> b!192493 m!218799))

(declare-fun m!218801 () Bool)

(assert (=> b!192493 m!218801))

(assert (=> b!192493 m!218343))

(assert (=> b!192493 m!218341))

(assert (=> b!192493 m!218345))

(declare-fun m!218803 () Bool)

(assert (=> b!192493 m!218803))

(assert (=> b!192493 m!218343))

(assert (=> b!192493 m!218799))

(declare-fun m!218805 () Bool)

(assert (=> b!192493 m!218805))

(assert (=> b!192493 m!218341))

(assert (=> bm!19425 m!218789))

(assert (=> b!192135 d!56323))

(declare-fun d!56325 () Bool)

(declare-fun e!126640 () Bool)

(assert (=> d!56325 e!126640))

(declare-fun res!90920 () Bool)

(assert (=> d!56325 (=> (not res!90920) (not e!126640))))

(declare-fun lt!95597 () ListLongMap!2399)

(assert (=> d!56325 (= res!90920 (contains!1337 lt!95597 (_1!1756 (tuple2!3491 lt!95396 (zeroValue!3761 thiss!1248)))))))

(declare-fun lt!95599 () List!2409)

(assert (=> d!56325 (= lt!95597 (ListLongMap!2400 lt!95599))))

(declare-fun lt!95598 () Unit!5763)

(declare-fun lt!95596 () Unit!5763)

(assert (=> d!56325 (= lt!95598 lt!95596)))

(assert (=> d!56325 (= (getValueByKey!238 lt!95599 (_1!1756 (tuple2!3491 lt!95396 (zeroValue!3761 thiss!1248)))) (Some!243 (_2!1756 (tuple2!3491 lt!95396 (zeroValue!3761 thiss!1248)))))))

(assert (=> d!56325 (= lt!95596 (lemmaContainsTupThenGetReturnValue!128 lt!95599 (_1!1756 (tuple2!3491 lt!95396 (zeroValue!3761 thiss!1248))) (_2!1756 (tuple2!3491 lt!95396 (zeroValue!3761 thiss!1248)))))))

(assert (=> d!56325 (= lt!95599 (insertStrictlySorted!131 (toList!1215 lt!95389) (_1!1756 (tuple2!3491 lt!95396 (zeroValue!3761 thiss!1248))) (_2!1756 (tuple2!3491 lt!95396 (zeroValue!3761 thiss!1248)))))))

(assert (=> d!56325 (= (+!307 lt!95389 (tuple2!3491 lt!95396 (zeroValue!3761 thiss!1248))) lt!95597)))

(declare-fun b!192498 () Bool)

(declare-fun res!90921 () Bool)

(assert (=> b!192498 (=> (not res!90921) (not e!126640))))

(assert (=> b!192498 (= res!90921 (= (getValueByKey!238 (toList!1215 lt!95597) (_1!1756 (tuple2!3491 lt!95396 (zeroValue!3761 thiss!1248)))) (Some!243 (_2!1756 (tuple2!3491 lt!95396 (zeroValue!3761 thiss!1248))))))))

(declare-fun b!192499 () Bool)

(assert (=> b!192499 (= e!126640 (contains!1338 (toList!1215 lt!95597) (tuple2!3491 lt!95396 (zeroValue!3761 thiss!1248))))))

(assert (= (and d!56325 res!90920) b!192498))

(assert (= (and b!192498 res!90921) b!192499))

(declare-fun m!218807 () Bool)

(assert (=> d!56325 m!218807))

(declare-fun m!218809 () Bool)

(assert (=> d!56325 m!218809))

(declare-fun m!218811 () Bool)

(assert (=> d!56325 m!218811))

(declare-fun m!218813 () Bool)

(assert (=> d!56325 m!218813))

(declare-fun m!218815 () Bool)

(assert (=> b!192498 m!218815))

(declare-fun m!218817 () Bool)

(assert (=> b!192499 m!218817))

(assert (=> b!192135 d!56325))

(declare-fun d!56327 () Bool)

(assert (=> d!56327 (= (apply!183 lt!95388 lt!95384) (get!2214 (getValueByKey!238 (toList!1215 lt!95388) lt!95384)))))

(declare-fun bs!7679 () Bool)

(assert (= bs!7679 d!56327))

(declare-fun m!218819 () Bool)

(assert (=> bs!7679 m!218819))

(assert (=> bs!7679 m!218819))

(declare-fun m!218821 () Bool)

(assert (=> bs!7679 m!218821))

(assert (=> b!192135 d!56327))

(declare-fun d!56329 () Bool)

(assert (=> d!56329 (= (apply!183 (+!307 lt!95399 (tuple2!3491 lt!95386 (minValue!3761 thiss!1248))) lt!95385) (get!2214 (getValueByKey!238 (toList!1215 (+!307 lt!95399 (tuple2!3491 lt!95386 (minValue!3761 thiss!1248)))) lt!95385)))))

(declare-fun bs!7680 () Bool)

(assert (= bs!7680 d!56329))

(declare-fun m!218823 () Bool)

(assert (=> bs!7680 m!218823))

(assert (=> bs!7680 m!218823))

(declare-fun m!218825 () Bool)

(assert (=> bs!7680 m!218825))

(assert (=> b!192135 d!56329))

(declare-fun d!56331 () Bool)

(assert (=> d!56331 (= (apply!183 (+!307 lt!95388 (tuple2!3491 lt!95395 (minValue!3761 thiss!1248))) lt!95384) (get!2214 (getValueByKey!238 (toList!1215 (+!307 lt!95388 (tuple2!3491 lt!95395 (minValue!3761 thiss!1248)))) lt!95384)))))

(declare-fun bs!7681 () Bool)

(assert (= bs!7681 d!56331))

(declare-fun m!218827 () Bool)

(assert (=> bs!7681 m!218827))

(assert (=> bs!7681 m!218827))

(declare-fun m!218829 () Bool)

(assert (=> bs!7681 m!218829))

(assert (=> b!192135 d!56331))

(declare-fun d!56333 () Bool)

(assert (=> d!56333 (= (apply!183 (+!307 lt!95388 (tuple2!3491 lt!95395 (minValue!3761 thiss!1248))) lt!95384) (apply!183 lt!95388 lt!95384))))

(declare-fun lt!95600 () Unit!5763)

(assert (=> d!56333 (= lt!95600 (choose!1056 lt!95388 lt!95395 (minValue!3761 thiss!1248) lt!95384))))

(declare-fun e!126641 () Bool)

(assert (=> d!56333 e!126641))

(declare-fun res!90922 () Bool)

(assert (=> d!56333 (=> (not res!90922) (not e!126641))))

(assert (=> d!56333 (= res!90922 (contains!1337 lt!95388 lt!95384))))

(assert (=> d!56333 (= (addApplyDifferent!159 lt!95388 lt!95395 (minValue!3761 thiss!1248) lt!95384) lt!95600)))

(declare-fun b!192500 () Bool)

(assert (=> b!192500 (= e!126641 (not (= lt!95384 lt!95395)))))

(assert (= (and d!56333 res!90922) b!192500))

(declare-fun m!218831 () Bool)

(assert (=> d!56333 m!218831))

(assert (=> d!56333 m!218377))

(assert (=> d!56333 m!218379))

(assert (=> d!56333 m!218365))

(declare-fun m!218833 () Bool)

(assert (=> d!56333 m!218833))

(assert (=> d!56333 m!218377))

(assert (=> b!192135 d!56333))

(declare-fun d!56335 () Bool)

(declare-fun e!126642 () Bool)

(assert (=> d!56335 e!126642))

(declare-fun res!90923 () Bool)

(assert (=> d!56335 (=> (not res!90923) (not e!126642))))

(declare-fun lt!95602 () ListLongMap!2399)

(assert (=> d!56335 (= res!90923 (contains!1337 lt!95602 (_1!1756 (tuple2!3491 lt!95386 (minValue!3761 thiss!1248)))))))

(declare-fun lt!95604 () List!2409)

(assert (=> d!56335 (= lt!95602 (ListLongMap!2400 lt!95604))))

(declare-fun lt!95603 () Unit!5763)

(declare-fun lt!95601 () Unit!5763)

(assert (=> d!56335 (= lt!95603 lt!95601)))

(assert (=> d!56335 (= (getValueByKey!238 lt!95604 (_1!1756 (tuple2!3491 lt!95386 (minValue!3761 thiss!1248)))) (Some!243 (_2!1756 (tuple2!3491 lt!95386 (minValue!3761 thiss!1248)))))))

(assert (=> d!56335 (= lt!95601 (lemmaContainsTupThenGetReturnValue!128 lt!95604 (_1!1756 (tuple2!3491 lt!95386 (minValue!3761 thiss!1248))) (_2!1756 (tuple2!3491 lt!95386 (minValue!3761 thiss!1248)))))))

(assert (=> d!56335 (= lt!95604 (insertStrictlySorted!131 (toList!1215 lt!95399) (_1!1756 (tuple2!3491 lt!95386 (minValue!3761 thiss!1248))) (_2!1756 (tuple2!3491 lt!95386 (minValue!3761 thiss!1248)))))))

(assert (=> d!56335 (= (+!307 lt!95399 (tuple2!3491 lt!95386 (minValue!3761 thiss!1248))) lt!95602)))

(declare-fun b!192501 () Bool)

(declare-fun res!90924 () Bool)

(assert (=> b!192501 (=> (not res!90924) (not e!126642))))

(assert (=> b!192501 (= res!90924 (= (getValueByKey!238 (toList!1215 lt!95602) (_1!1756 (tuple2!3491 lt!95386 (minValue!3761 thiss!1248)))) (Some!243 (_2!1756 (tuple2!3491 lt!95386 (minValue!3761 thiss!1248))))))))

(declare-fun b!192502 () Bool)

(assert (=> b!192502 (= e!126642 (contains!1338 (toList!1215 lt!95602) (tuple2!3491 lt!95386 (minValue!3761 thiss!1248))))))

(assert (= (and d!56335 res!90923) b!192501))

(assert (= (and b!192501 res!90924) b!192502))

(declare-fun m!218835 () Bool)

(assert (=> d!56335 m!218835))

(declare-fun m!218837 () Bool)

(assert (=> d!56335 m!218837))

(declare-fun m!218839 () Bool)

(assert (=> d!56335 m!218839))

(declare-fun m!218841 () Bool)

(assert (=> d!56335 m!218841))

(declare-fun m!218843 () Bool)

(assert (=> b!192501 m!218843))

(declare-fun m!218845 () Bool)

(assert (=> b!192502 m!218845))

(assert (=> b!192135 d!56335))

(declare-fun d!56337 () Bool)

(declare-fun e!126643 () Bool)

(assert (=> d!56337 e!126643))

(declare-fun res!90925 () Bool)

(assert (=> d!56337 (=> res!90925 e!126643)))

(declare-fun lt!95606 () Bool)

(assert (=> d!56337 (= res!90925 (not lt!95606))))

(declare-fun lt!95608 () Bool)

(assert (=> d!56337 (= lt!95606 lt!95608)))

(declare-fun lt!95607 () Unit!5763)

(declare-fun e!126644 () Unit!5763)

(assert (=> d!56337 (= lt!95607 e!126644)))

(declare-fun c!34724 () Bool)

(assert (=> d!56337 (= c!34724 lt!95608)))

(assert (=> d!56337 (= lt!95608 (containsKey!242 (toList!1215 (+!307 lt!95389 (tuple2!3491 lt!95396 (zeroValue!3761 thiss!1248)))) lt!95400))))

(assert (=> d!56337 (= (contains!1337 (+!307 lt!95389 (tuple2!3491 lt!95396 (zeroValue!3761 thiss!1248))) lt!95400) lt!95606)))

(declare-fun b!192503 () Bool)

(declare-fun lt!95605 () Unit!5763)

(assert (=> b!192503 (= e!126644 lt!95605)))

(assert (=> b!192503 (= lt!95605 (lemmaContainsKeyImpliesGetValueByKeyDefined!191 (toList!1215 (+!307 lt!95389 (tuple2!3491 lt!95396 (zeroValue!3761 thiss!1248)))) lt!95400))))

(assert (=> b!192503 (isDefined!192 (getValueByKey!238 (toList!1215 (+!307 lt!95389 (tuple2!3491 lt!95396 (zeroValue!3761 thiss!1248)))) lt!95400))))

(declare-fun b!192504 () Bool)

(declare-fun Unit!5776 () Unit!5763)

(assert (=> b!192504 (= e!126644 Unit!5776)))

(declare-fun b!192505 () Bool)

(assert (=> b!192505 (= e!126643 (isDefined!192 (getValueByKey!238 (toList!1215 (+!307 lt!95389 (tuple2!3491 lt!95396 (zeroValue!3761 thiss!1248)))) lt!95400)))))

(assert (= (and d!56337 c!34724) b!192503))

(assert (= (and d!56337 (not c!34724)) b!192504))

(assert (= (and d!56337 (not res!90925)) b!192505))

(declare-fun m!218847 () Bool)

(assert (=> d!56337 m!218847))

(declare-fun m!218849 () Bool)

(assert (=> b!192503 m!218849))

(declare-fun m!218851 () Bool)

(assert (=> b!192503 m!218851))

(assert (=> b!192503 m!218851))

(declare-fun m!218853 () Bool)

(assert (=> b!192503 m!218853))

(assert (=> b!192505 m!218851))

(assert (=> b!192505 m!218851))

(assert (=> b!192505 m!218853))

(assert (=> b!192135 d!56337))

(declare-fun d!56339 () Bool)

(assert (=> d!56339 (contains!1337 (+!307 lt!95389 (tuple2!3491 lt!95396 (zeroValue!3761 thiss!1248))) lt!95400)))

(declare-fun lt!95609 () Unit!5763)

(assert (=> d!56339 (= lt!95609 (choose!1055 lt!95389 lt!95396 (zeroValue!3761 thiss!1248) lt!95400))))

(assert (=> d!56339 (contains!1337 lt!95389 lt!95400)))

(assert (=> d!56339 (= (addStillContains!159 lt!95389 lt!95396 (zeroValue!3761 thiss!1248) lt!95400) lt!95609)))

(declare-fun bs!7682 () Bool)

(assert (= bs!7682 d!56339))

(assert (=> bs!7682 m!218353))

(assert (=> bs!7682 m!218353))

(assert (=> bs!7682 m!218355))

(declare-fun m!218855 () Bool)

(assert (=> bs!7682 m!218855))

(declare-fun m!218857 () Bool)

(assert (=> bs!7682 m!218857))

(assert (=> b!192135 d!56339))

(declare-fun d!56341 () Bool)

(declare-fun e!126645 () Bool)

(assert (=> d!56341 e!126645))

(declare-fun res!90926 () Bool)

(assert (=> d!56341 (=> (not res!90926) (not e!126645))))

(declare-fun lt!95611 () ListLongMap!2399)

(assert (=> d!56341 (= res!90926 (contains!1337 lt!95611 (_1!1756 (tuple2!3491 lt!95394 (zeroValue!3761 thiss!1248)))))))

(declare-fun lt!95613 () List!2409)

(assert (=> d!56341 (= lt!95611 (ListLongMap!2400 lt!95613))))

(declare-fun lt!95612 () Unit!5763)

(declare-fun lt!95610 () Unit!5763)

(assert (=> d!56341 (= lt!95612 lt!95610)))

(assert (=> d!56341 (= (getValueByKey!238 lt!95613 (_1!1756 (tuple2!3491 lt!95394 (zeroValue!3761 thiss!1248)))) (Some!243 (_2!1756 (tuple2!3491 lt!95394 (zeroValue!3761 thiss!1248)))))))

(assert (=> d!56341 (= lt!95610 (lemmaContainsTupThenGetReturnValue!128 lt!95613 (_1!1756 (tuple2!3491 lt!95394 (zeroValue!3761 thiss!1248))) (_2!1756 (tuple2!3491 lt!95394 (zeroValue!3761 thiss!1248)))))))

(assert (=> d!56341 (= lt!95613 (insertStrictlySorted!131 (toList!1215 lt!95402) (_1!1756 (tuple2!3491 lt!95394 (zeroValue!3761 thiss!1248))) (_2!1756 (tuple2!3491 lt!95394 (zeroValue!3761 thiss!1248)))))))

(assert (=> d!56341 (= (+!307 lt!95402 (tuple2!3491 lt!95394 (zeroValue!3761 thiss!1248))) lt!95611)))

(declare-fun b!192506 () Bool)

(declare-fun res!90927 () Bool)

(assert (=> b!192506 (=> (not res!90927) (not e!126645))))

(assert (=> b!192506 (= res!90927 (= (getValueByKey!238 (toList!1215 lt!95611) (_1!1756 (tuple2!3491 lt!95394 (zeroValue!3761 thiss!1248)))) (Some!243 (_2!1756 (tuple2!3491 lt!95394 (zeroValue!3761 thiss!1248))))))))

(declare-fun b!192507 () Bool)

(assert (=> b!192507 (= e!126645 (contains!1338 (toList!1215 lt!95611) (tuple2!3491 lt!95394 (zeroValue!3761 thiss!1248))))))

(assert (= (and d!56341 res!90926) b!192506))

(assert (= (and b!192506 res!90927) b!192507))

(declare-fun m!218859 () Bool)

(assert (=> d!56341 m!218859))

(declare-fun m!218861 () Bool)

(assert (=> d!56341 m!218861))

(declare-fun m!218863 () Bool)

(assert (=> d!56341 m!218863))

(declare-fun m!218865 () Bool)

(assert (=> d!56341 m!218865))

(declare-fun m!218867 () Bool)

(assert (=> b!192506 m!218867))

(declare-fun m!218869 () Bool)

(assert (=> b!192507 m!218869))

(assert (=> b!192135 d!56341))

(declare-fun d!56343 () Bool)

(assert (=> d!56343 (= (apply!183 lt!95399 lt!95385) (get!2214 (getValueByKey!238 (toList!1215 lt!95399) lt!95385)))))

(declare-fun bs!7683 () Bool)

(assert (= bs!7683 d!56343))

(declare-fun m!218871 () Bool)

(assert (=> bs!7683 m!218871))

(assert (=> bs!7683 m!218871))

(declare-fun m!218873 () Bool)

(assert (=> bs!7683 m!218873))

(assert (=> b!192135 d!56343))

(declare-fun d!56345 () Bool)

(declare-fun e!126646 () Bool)

(assert (=> d!56345 e!126646))

(declare-fun res!90928 () Bool)

(assert (=> d!56345 (=> (not res!90928) (not e!126646))))

(declare-fun lt!95615 () ListLongMap!2399)

(assert (=> d!56345 (= res!90928 (contains!1337 lt!95615 (_1!1756 (tuple2!3491 lt!95395 (minValue!3761 thiss!1248)))))))

(declare-fun lt!95617 () List!2409)

(assert (=> d!56345 (= lt!95615 (ListLongMap!2400 lt!95617))))

(declare-fun lt!95616 () Unit!5763)

(declare-fun lt!95614 () Unit!5763)

(assert (=> d!56345 (= lt!95616 lt!95614)))

(assert (=> d!56345 (= (getValueByKey!238 lt!95617 (_1!1756 (tuple2!3491 lt!95395 (minValue!3761 thiss!1248)))) (Some!243 (_2!1756 (tuple2!3491 lt!95395 (minValue!3761 thiss!1248)))))))

(assert (=> d!56345 (= lt!95614 (lemmaContainsTupThenGetReturnValue!128 lt!95617 (_1!1756 (tuple2!3491 lt!95395 (minValue!3761 thiss!1248))) (_2!1756 (tuple2!3491 lt!95395 (minValue!3761 thiss!1248)))))))

(assert (=> d!56345 (= lt!95617 (insertStrictlySorted!131 (toList!1215 lt!95388) (_1!1756 (tuple2!3491 lt!95395 (minValue!3761 thiss!1248))) (_2!1756 (tuple2!3491 lt!95395 (minValue!3761 thiss!1248)))))))

(assert (=> d!56345 (= (+!307 lt!95388 (tuple2!3491 lt!95395 (minValue!3761 thiss!1248))) lt!95615)))

(declare-fun b!192508 () Bool)

(declare-fun res!90929 () Bool)

(assert (=> b!192508 (=> (not res!90929) (not e!126646))))

(assert (=> b!192508 (= res!90929 (= (getValueByKey!238 (toList!1215 lt!95615) (_1!1756 (tuple2!3491 lt!95395 (minValue!3761 thiss!1248)))) (Some!243 (_2!1756 (tuple2!3491 lt!95395 (minValue!3761 thiss!1248))))))))

(declare-fun b!192509 () Bool)

(assert (=> b!192509 (= e!126646 (contains!1338 (toList!1215 lt!95615) (tuple2!3491 lt!95395 (minValue!3761 thiss!1248))))))

(assert (= (and d!56345 res!90928) b!192508))

(assert (= (and b!192508 res!90929) b!192509))

(declare-fun m!218875 () Bool)

(assert (=> d!56345 m!218875))

(declare-fun m!218877 () Bool)

(assert (=> d!56345 m!218877))

(declare-fun m!218879 () Bool)

(assert (=> d!56345 m!218879))

(declare-fun m!218881 () Bool)

(assert (=> d!56345 m!218881))

(declare-fun m!218883 () Bool)

(assert (=> b!192508 m!218883))

(declare-fun m!218885 () Bool)

(assert (=> b!192509 m!218885))

(assert (=> b!192135 d!56345))

(declare-fun d!56347 () Bool)

(assert (=> d!56347 (= (apply!183 (+!307 lt!95402 (tuple2!3491 lt!95394 (zeroValue!3761 thiss!1248))) lt!95391) (apply!183 lt!95402 lt!95391))))

(declare-fun lt!95618 () Unit!5763)

(assert (=> d!56347 (= lt!95618 (choose!1056 lt!95402 lt!95394 (zeroValue!3761 thiss!1248) lt!95391))))

(declare-fun e!126647 () Bool)

(assert (=> d!56347 e!126647))

(declare-fun res!90930 () Bool)

(assert (=> d!56347 (=> (not res!90930) (not e!126647))))

(assert (=> d!56347 (= res!90930 (contains!1337 lt!95402 lt!95391))))

(assert (=> d!56347 (= (addApplyDifferent!159 lt!95402 lt!95394 (zeroValue!3761 thiss!1248) lt!95391) lt!95618)))

(declare-fun b!192510 () Bool)

(assert (=> b!192510 (= e!126647 (not (= lt!95391 lt!95394)))))

(assert (= (and d!56347 res!90930) b!192510))

(declare-fun m!218887 () Bool)

(assert (=> d!56347 m!218887))

(assert (=> d!56347 m!218371))

(assert (=> d!56347 m!218373))

(assert (=> d!56347 m!218363))

(declare-fun m!218889 () Bool)

(assert (=> d!56347 m!218889))

(assert (=> d!56347 m!218371))

(assert (=> b!192135 d!56347))

(declare-fun d!56349 () Bool)

(assert (=> d!56349 (= (apply!183 lt!95402 lt!95391) (get!2214 (getValueByKey!238 (toList!1215 lt!95402) lt!95391)))))

(declare-fun bs!7684 () Bool)

(assert (= bs!7684 d!56349))

(declare-fun m!218891 () Bool)

(assert (=> bs!7684 m!218891))

(assert (=> bs!7684 m!218891))

(declare-fun m!218893 () Bool)

(assert (=> bs!7684 m!218893))

(assert (=> b!192135 d!56349))

(declare-fun d!56351 () Bool)

(assert (=> d!56351 (= (apply!183 (+!307 lt!95399 (tuple2!3491 lt!95386 (minValue!3761 thiss!1248))) lt!95385) (apply!183 lt!95399 lt!95385))))

(declare-fun lt!95619 () Unit!5763)

(assert (=> d!56351 (= lt!95619 (choose!1056 lt!95399 lt!95386 (minValue!3761 thiss!1248) lt!95385))))

(declare-fun e!126648 () Bool)

(assert (=> d!56351 e!126648))

(declare-fun res!90931 () Bool)

(assert (=> d!56351 (=> (not res!90931) (not e!126648))))

(assert (=> d!56351 (= res!90931 (contains!1337 lt!95399 lt!95385))))

(assert (=> d!56351 (= (addApplyDifferent!159 lt!95399 lt!95386 (minValue!3761 thiss!1248) lt!95385) lt!95619)))

(declare-fun b!192511 () Bool)

(assert (=> b!192511 (= e!126648 (not (= lt!95385 lt!95386)))))

(assert (= (and d!56351 res!90931) b!192511))

(declare-fun m!218895 () Bool)

(assert (=> d!56351 m!218895))

(assert (=> d!56351 m!218359))

(assert (=> d!56351 m!218361))

(assert (=> d!56351 m!218375))

(declare-fun m!218897 () Bool)

(assert (=> d!56351 m!218897))

(assert (=> d!56351 m!218359))

(assert (=> b!192135 d!56351))

(assert (=> bm!19385 d!56323))

(declare-fun d!56353 () Bool)

(declare-fun e!126649 () Bool)

(assert (=> d!56353 e!126649))

(declare-fun res!90932 () Bool)

(assert (=> d!56353 (=> res!90932 e!126649)))

(declare-fun lt!95621 () Bool)

(assert (=> d!56353 (= res!90932 (not lt!95621))))

(declare-fun lt!95623 () Bool)

(assert (=> d!56353 (= lt!95621 lt!95623)))

(declare-fun lt!95622 () Unit!5763)

(declare-fun e!126650 () Unit!5763)

(assert (=> d!56353 (= lt!95622 e!126650)))

(declare-fun c!34725 () Bool)

(assert (=> d!56353 (= c!34725 lt!95623)))

(assert (=> d!56353 (= lt!95623 (containsKey!242 (toList!1215 lt!95426) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56353 (= (contains!1337 lt!95426 #b0000000000000000000000000000000000000000000000000000000000000000) lt!95621)))

(declare-fun b!192512 () Bool)

(declare-fun lt!95620 () Unit!5763)

(assert (=> b!192512 (= e!126650 lt!95620)))

(assert (=> b!192512 (= lt!95620 (lemmaContainsKeyImpliesGetValueByKeyDefined!191 (toList!1215 lt!95426) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!192512 (isDefined!192 (getValueByKey!238 (toList!1215 lt!95426) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!192513 () Bool)

(declare-fun Unit!5777 () Unit!5763)

(assert (=> b!192513 (= e!126650 Unit!5777)))

(declare-fun b!192514 () Bool)

(assert (=> b!192514 (= e!126649 (isDefined!192 (getValueByKey!238 (toList!1215 lt!95426) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56353 c!34725) b!192512))

(assert (= (and d!56353 (not c!34725)) b!192513))

(assert (= (and d!56353 (not res!90932)) b!192514))

(declare-fun m!218899 () Bool)

(assert (=> d!56353 m!218899))

(declare-fun m!218901 () Bool)

(assert (=> b!192512 m!218901))

(assert (=> b!192512 m!218469))

(assert (=> b!192512 m!218469))

(declare-fun m!218903 () Bool)

(assert (=> b!192512 m!218903))

(assert (=> b!192514 m!218469))

(assert (=> b!192514 m!218469))

(assert (=> b!192514 m!218903))

(assert (=> bm!19395 d!56353))

(declare-fun d!56355 () Bool)

(assert (=> d!56355 (= (inRange!0 (index!4907 lt!95334) (mask!9149 thiss!1248)) (and (bvsge (index!4907 lt!95334) #b00000000000000000000000000000000) (bvslt (index!4907 lt!95334) (bvadd (mask!9149 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!192082 d!56355))

(declare-fun d!56357 () Bool)

(assert (=> d!56357 (isDefined!192 (getValueByKey!238 (toList!1215 lt!95278) key!828))))

(declare-fun lt!95626 () Unit!5763)

(declare-fun choose!1057 (List!2409 (_ BitVec 64)) Unit!5763)

(assert (=> d!56357 (= lt!95626 (choose!1057 (toList!1215 lt!95278) key!828))))

(declare-fun e!126653 () Bool)

(assert (=> d!56357 e!126653))

(declare-fun res!90935 () Bool)

(assert (=> d!56357 (=> (not res!90935) (not e!126653))))

(assert (=> d!56357 (= res!90935 (isStrictlySorted!351 (toList!1215 lt!95278)))))

(assert (=> d!56357 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!191 (toList!1215 lt!95278) key!828) lt!95626)))

(declare-fun b!192517 () Bool)

(assert (=> b!192517 (= e!126653 (containsKey!242 (toList!1215 lt!95278) key!828))))

(assert (= (and d!56357 res!90935) b!192517))

(assert (=> d!56357 m!218455))

(assert (=> d!56357 m!218455))

(assert (=> d!56357 m!218457))

(declare-fun m!218905 () Bool)

(assert (=> d!56357 m!218905))

(assert (=> d!56357 m!218495))

(assert (=> b!192517 m!218451))

(assert (=> b!192185 d!56357))

(assert (=> b!192185 d!56317))

(assert (=> b!192185 d!56319))

(declare-fun d!56359 () Bool)

(assert (=> d!56359 (= (apply!183 lt!95426 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2214 (getValueByKey!238 (toList!1215 lt!95426) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7685 () Bool)

(assert (= bs!7685 d!56359))

(assert (=> bs!7685 m!218631))

(assert (=> bs!7685 m!218631))

(declare-fun m!218907 () Bool)

(assert (=> bs!7685 m!218907))

(assert (=> b!192162 d!56359))

(assert (=> b!192132 d!56211))

(assert (=> b!192161 d!56211))

(declare-fun b!192518 () Bool)

(declare-fun e!126654 () Bool)

(assert (=> b!192518 (= e!126654 tp_is_empty!4459)))

(declare-fun mapIsEmpty!7715 () Bool)

(declare-fun mapRes!7715 () Bool)

(assert (=> mapIsEmpty!7715 mapRes!7715))

(declare-fun condMapEmpty!7715 () Bool)

(declare-fun mapDefault!7715 () ValueCell!1886)

(assert (=> mapNonEmpty!7714 (= condMapEmpty!7715 (= mapRest!7714 ((as const (Array (_ BitVec 32) ValueCell!1886)) mapDefault!7715)))))

(declare-fun e!126655 () Bool)

(assert (=> mapNonEmpty!7714 (= tp!16930 (and e!126655 mapRes!7715))))

(declare-fun b!192519 () Bool)

(assert (=> b!192519 (= e!126655 tp_is_empty!4459)))

(declare-fun mapNonEmpty!7715 () Bool)

(declare-fun tp!16931 () Bool)

(assert (=> mapNonEmpty!7715 (= mapRes!7715 (and tp!16931 e!126654))))

(declare-fun mapRest!7715 () (Array (_ BitVec 32) ValueCell!1886))

(declare-fun mapKey!7715 () (_ BitVec 32))

(declare-fun mapValue!7715 () ValueCell!1886)

(assert (=> mapNonEmpty!7715 (= mapRest!7714 (store mapRest!7715 mapKey!7715 mapValue!7715))))

(assert (= (and mapNonEmpty!7714 condMapEmpty!7715) mapIsEmpty!7715))

(assert (= (and mapNonEmpty!7714 (not condMapEmpty!7715)) mapNonEmpty!7715))

(assert (= (and mapNonEmpty!7715 ((_ is ValueCellFull!1886) mapValue!7715)) b!192518))

(assert (= (and mapNonEmpty!7714 ((_ is ValueCellFull!1886) mapDefault!7715)) b!192519))

(declare-fun m!218909 () Bool)

(assert (=> mapNonEmpty!7715 m!218909))

(declare-fun b_lambda!7421 () Bool)

(assert (= b_lambda!7419 (or (and b!191950 b_free!4687) b_lambda!7421)))

(declare-fun b_lambda!7423 () Bool)

(assert (= b_lambda!7415 (or (and b!191950 b_free!4687) b_lambda!7423)))

(declare-fun b_lambda!7425 () Bool)

(assert (= b_lambda!7417 (or (and b!191950 b_free!4687) b_lambda!7425)))

(declare-fun b_lambda!7427 () Bool)

(assert (= b_lambda!7413 (or (and b!191950 b_free!4687) b_lambda!7427)))

(check-sat (not b!192503) (not b!192356) (not b_next!4687) (not b!192496) (not d!56345) (not b!192295) (not b!192249) (not d!56239) (not d!56291) (not b!192369) (not b!192359) (not d!56251) (not b!192400) (not b_lambda!7411) (not d!56253) (not b!192475) (not d!56311) (not d!56213) (not d!56221) (not b!192411) (not bm!19412) (not d!56323) (not d!56351) (not d!56289) (not b!192327) (not b!192505) (not bm!19418) (not b!192262) (not bm!19409) (not b!192469) (not d!56299) (not b!192370) (not bm!19425) (not b!192199) (not b!192260) (not bm!19423) (not b!192484) (not b!192466) (not b!192474) (not d!56337) (not b!192264) (not b!192493) (not d!56275) (not d!56313) (not b_lambda!7421) (not b!192326) (not d!56333) (not b!192201) (not b!192392) (not b!192325) (not d!56261) (not b!192396) (not b!192218) (not d!56347) (not d!56223) (not b!192196) (not bm!19424) (not d!56335) (not b!192407) (not d!56327) (not b!192296) (not b!192464) (not b!192243) (not b!192477) (not b!192395) (not b!192398) (not d!56359) (not b_lambda!7425) (not b!192517) (not b!192198) (not d!56217) (not b_lambda!7423) (not d!56297) (not b!192366) (not d!56295) (not d!56247) (not d!56301) (not d!56245) (not b!192495) (not mapNonEmpty!7715) (not b!192506) (not d!56273) (not b_lambda!7409) (not b!192507) (not d!56357) (not d!56285) (not b!192435) (not bm!19415) (not d!56215) (not d!56231) (not b!192385) (not b!192360) (not d!56271) (not d!56265) (not b!192508) (not d!56331) (not d!56293) b_and!11363 (not b!192358) (not b!192259) (not b!192406) (not b!192357) (not d!56315) (not b!192476) (not b!192280) (not b!192408) (not b!192368) (not b!192468) (not b!192489) (not b!192479) (not b!192498) (not b!192399) (not d!56339) (not d!56225) (not b!192492) (not b!192478) (not b!192386) (not d!56269) (not b!192509) (not b!192488) (not d!56281) (not b!192378) (not d!56349) tp_is_empty!4459 (not b!192364) (not d!56307) (not d!56287) (not b!192314) (not b!192361) (not b!192393) (not d!56305) (not d!56255) (not d!56317) (not d!56353) (not b!192244) (not d!56321) (not b!192292) (not d!56329) (not d!56267) (not bm!19405) (not d!56227) (not d!56309) (not b!192377) (not b!192305) (not b!192512) (not b!192501) (not b!192384) (not b!192502) (not b!192219) (not d!56325) (not b!192514) (not b!192491) (not b!192313) (not d!56341) (not d!56343) (not b!192375) (not b!192490) (not d!56249) (not b!192212) (not d!56257) (not d!56235) (not b!192363) (not b!192499) (not b_lambda!7427) (not d!56303) (not b!192306))
(check-sat b_and!11363 (not b_next!4687))
