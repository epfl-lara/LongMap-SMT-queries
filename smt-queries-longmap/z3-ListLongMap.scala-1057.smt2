; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22026 () Bool)

(assert start!22026)

(declare-fun b!227136 () Bool)

(declare-fun b_free!6093 () Bool)

(declare-fun b_next!6093 () Bool)

(assert (=> b!227136 (= b_free!6093 (not b_next!6093))))

(declare-fun tp!21421 () Bool)

(declare-fun b_and!12991 () Bool)

(assert (=> b!227136 (= tp!21421 b_and!12991)))

(declare-fun b!227124 () Bool)

(declare-fun e!147345 () Bool)

(declare-fun call!21114 () Bool)

(assert (=> b!227124 (= e!147345 (not call!21114))))

(declare-fun b!227125 () Bool)

(declare-fun e!147346 () Bool)

(assert (=> b!227125 (= e!147346 (not call!21114))))

(declare-fun b!227126 () Bool)

(declare-fun res!111817 () Bool)

(assert (=> b!227126 (=> (not res!111817) (not e!147346))))

(declare-fun call!21113 () Bool)

(assert (=> b!227126 (= res!111817 call!21113)))

(declare-fun e!147349 () Bool)

(assert (=> b!227126 (= e!147349 e!147346)))

(declare-fun b!227127 () Bool)

(declare-fun e!147359 () Bool)

(assert (=> b!227127 (= e!147359 true)))

(declare-fun lt!114305 () Bool)

(declare-datatypes ((V!7587 0))(
  ( (V!7588 (val!3022 Int)) )
))
(declare-datatypes ((ValueCell!2634 0))(
  ( (ValueCellFull!2634 (v!5042 V!7587)) (EmptyCell!2634) )
))
(declare-datatypes ((array!11153 0))(
  ( (array!11154 (arr!5296 (Array (_ BitVec 32) ValueCell!2634)) (size!5629 (_ BitVec 32))) )
))
(declare-datatypes ((array!11155 0))(
  ( (array!11156 (arr!5297 (Array (_ BitVec 32) (_ BitVec 64))) (size!5630 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3168 0))(
  ( (LongMapFixedSize!3169 (defaultEntry!4243 Int) (mask!10101 (_ BitVec 32)) (extraKeys!3980 (_ BitVec 32)) (zeroValue!4084 V!7587) (minValue!4084 V!7587) (_size!1633 (_ BitVec 32)) (_keys!6297 array!11155) (_values!4226 array!11153) (_vacant!1633 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3168)

(declare-datatypes ((List!3385 0))(
  ( (Nil!3382) (Cons!3381 (h!4029 (_ BitVec 64)) (t!8344 List!3385)) )
))
(declare-fun arrayNoDuplicates!0 (array!11155 (_ BitVec 32) List!3385) Bool)

(assert (=> b!227127 (= lt!114305 (arrayNoDuplicates!0 (_keys!6297 thiss!1504) #b00000000000000000000000000000000 Nil!3382))))

(declare-fun res!111811 () Bool)

(declare-fun e!147350 () Bool)

(assert (=> start!22026 (=> (not res!111811) (not e!147350))))

(declare-fun valid!1272 (LongMapFixedSize!3168) Bool)

(assert (=> start!22026 (= res!111811 (valid!1272 thiss!1504))))

(assert (=> start!22026 e!147350))

(declare-fun e!147352 () Bool)

(assert (=> start!22026 e!147352))

(assert (=> start!22026 true))

(declare-fun b!227128 () Bool)

(declare-fun res!111818 () Bool)

(declare-datatypes ((SeekEntryResult!891 0))(
  ( (MissingZero!891 (index!5734 (_ BitVec 32))) (Found!891 (index!5735 (_ BitVec 32))) (Intermediate!891 (undefined!1703 Bool) (index!5736 (_ BitVec 32)) (x!23263 (_ BitVec 32))) (Undefined!891) (MissingVacant!891 (index!5737 (_ BitVec 32))) )
))
(declare-fun lt!114298 () SeekEntryResult!891)

(assert (=> b!227128 (= res!111818 (= (select (arr!5297 (_keys!6297 thiss!1504)) (index!5737 lt!114298)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!227128 (=> (not res!111818) (not e!147345))))

(declare-fun bm!21110 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11155 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21110 (= call!21114 (arrayContainsKey!0 (_keys!6297 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!21111 () Bool)

(declare-fun c!37656 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21111 (= call!21113 (inRange!0 (ite c!37656 (index!5734 lt!114298) (index!5737 lt!114298)) (mask!10101 thiss!1504)))))

(declare-fun mapIsEmpty!10102 () Bool)

(declare-fun mapRes!10102 () Bool)

(assert (=> mapIsEmpty!10102 mapRes!10102))

(declare-fun b!227129 () Bool)

(declare-fun res!111813 () Bool)

(assert (=> b!227129 (=> (not res!111813) (not e!147346))))

(assert (=> b!227129 (= res!111813 (= (select (arr!5297 (_keys!6297 thiss!1504)) (index!5734 lt!114298)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!227130 () Bool)

(declare-fun e!147347 () Bool)

(assert (=> b!227130 (= e!147347 (not e!147359))))

(declare-fun res!111814 () Bool)

(assert (=> b!227130 (=> res!111814 e!147359)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!227130 (= res!111814 (not (validMask!0 (mask!10101 thiss!1504))))))

(declare-fun lt!114301 () array!11155)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11155 (_ BitVec 32)) Bool)

(assert (=> b!227130 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!114301 (mask!10101 thiss!1504))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((Unit!6880 0))(
  ( (Unit!6881) )
))
(declare-fun lt!114300 () Unit!6880)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11155 (_ BitVec 32) (_ BitVec 32)) Unit!6880)

(assert (=> b!227130 (= lt!114300 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6297 thiss!1504) index!297 (mask!10101 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11155 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!227130 (= (arrayCountValidKeys!0 lt!114301 #b00000000000000000000000000000000 (size!5630 (_keys!6297 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6297 thiss!1504) #b00000000000000000000000000000000 (size!5630 (_keys!6297 thiss!1504)))))))

(declare-fun lt!114299 () Unit!6880)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11155 (_ BitVec 32) (_ BitVec 64)) Unit!6880)

(assert (=> b!227130 (= lt!114299 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6297 thiss!1504) index!297 key!932))))

(assert (=> b!227130 (arrayNoDuplicates!0 lt!114301 #b00000000000000000000000000000000 Nil!3382)))

(assert (=> b!227130 (= lt!114301 (array!11156 (store (arr!5297 (_keys!6297 thiss!1504)) index!297 key!932) (size!5630 (_keys!6297 thiss!1504))))))

(declare-fun lt!114302 () Unit!6880)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11155 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3385) Unit!6880)

(assert (=> b!227130 (= lt!114302 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6297 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3382))))

(declare-fun lt!114304 () Unit!6880)

(declare-fun e!147355 () Unit!6880)

(assert (=> b!227130 (= lt!114304 e!147355)))

(declare-fun c!37653 () Bool)

(assert (=> b!227130 (= c!37653 (arrayContainsKey!0 (_keys!6297 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!227131 () Bool)

(declare-fun Unit!6882 () Unit!6880)

(assert (=> b!227131 (= e!147355 Unit!6882)))

(declare-fun lt!114307 () Unit!6880)

(declare-fun lemmaArrayContainsKeyThenInListMap!100 (array!11155 array!11153 (_ BitVec 32) (_ BitVec 32) V!7587 V!7587 (_ BitVec 64) (_ BitVec 32) Int) Unit!6880)

(assert (=> b!227131 (= lt!114307 (lemmaArrayContainsKeyThenInListMap!100 (_keys!6297 thiss!1504) (_values!4226 thiss!1504) (mask!10101 thiss!1504) (extraKeys!3980 thiss!1504) (zeroValue!4084 thiss!1504) (minValue!4084 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4243 thiss!1504)))))

(assert (=> b!227131 false))

(declare-fun b!227132 () Bool)

(declare-fun res!111819 () Bool)

(assert (=> b!227132 (=> res!111819 e!147359)))

(assert (=> b!227132 (= res!111819 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6297 thiss!1504) (mask!10101 thiss!1504))))))

(declare-fun b!227133 () Bool)

(declare-fun e!147356 () Bool)

(declare-fun tp_is_empty!5955 () Bool)

(assert (=> b!227133 (= e!147356 tp_is_empty!5955)))

(declare-fun b!227134 () Bool)

(declare-fun Unit!6883 () Unit!6880)

(assert (=> b!227134 (= e!147355 Unit!6883)))

(declare-fun b!227135 () Bool)

(declare-fun e!147348 () Bool)

(get-info :version)

(assert (=> b!227135 (= e!147348 ((_ is Undefined!891) lt!114298))))

(declare-fun e!147358 () Bool)

(declare-fun array_inv!3501 (array!11155) Bool)

(declare-fun array_inv!3502 (array!11153) Bool)

(assert (=> b!227136 (= e!147352 (and tp!21421 tp_is_empty!5955 (array_inv!3501 (_keys!6297 thiss!1504)) (array_inv!3502 (_values!4226 thiss!1504)) e!147358))))

(declare-fun b!227137 () Bool)

(assert (=> b!227137 (= e!147348 e!147345)))

(declare-fun res!111812 () Bool)

(assert (=> b!227137 (= res!111812 call!21113)))

(assert (=> b!227137 (=> (not res!111812) (not e!147345))))

(declare-fun b!227138 () Bool)

(declare-fun e!147357 () Bool)

(assert (=> b!227138 (= e!147357 tp_is_empty!5955)))

(declare-fun b!227139 () Bool)

(assert (=> b!227139 (= e!147358 (and e!147356 mapRes!10102))))

(declare-fun condMapEmpty!10102 () Bool)

(declare-fun mapDefault!10102 () ValueCell!2634)

(assert (=> b!227139 (= condMapEmpty!10102 (= (arr!5296 (_values!4226 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2634)) mapDefault!10102)))))

(declare-fun b!227140 () Bool)

(declare-fun e!147351 () Unit!6880)

(declare-fun lt!114306 () Unit!6880)

(assert (=> b!227140 (= e!147351 lt!114306)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!275 (array!11155 array!11153 (_ BitVec 32) (_ BitVec 32) V!7587 V!7587 (_ BitVec 64) Int) Unit!6880)

(assert (=> b!227140 (= lt!114306 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!275 (_keys!6297 thiss!1504) (_values!4226 thiss!1504) (mask!10101 thiss!1504) (extraKeys!3980 thiss!1504) (zeroValue!4084 thiss!1504) (minValue!4084 thiss!1504) key!932 (defaultEntry!4243 thiss!1504)))))

(assert (=> b!227140 (= c!37656 ((_ is MissingZero!891) lt!114298))))

(assert (=> b!227140 e!147349))

(declare-fun b!227141 () Bool)

(declare-fun res!111810 () Bool)

(assert (=> b!227141 (=> (not res!111810) (not e!147350))))

(assert (=> b!227141 (= res!111810 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!227142 () Bool)

(declare-fun e!147354 () Bool)

(assert (=> b!227142 (= e!147354 e!147347)))

(declare-fun res!111815 () Bool)

(assert (=> b!227142 (=> (not res!111815) (not e!147347))))

(assert (=> b!227142 (= res!111815 (inRange!0 index!297 (mask!10101 thiss!1504)))))

(declare-fun lt!114308 () Unit!6880)

(assert (=> b!227142 (= lt!114308 e!147351)))

(declare-fun c!37655 () Bool)

(declare-datatypes ((tuple2!4466 0))(
  ( (tuple2!4467 (_1!2244 (_ BitVec 64)) (_2!2244 V!7587)) )
))
(declare-datatypes ((List!3386 0))(
  ( (Nil!3383) (Cons!3382 (h!4030 tuple2!4466) (t!8345 List!3386)) )
))
(declare-datatypes ((ListLongMap!3379 0))(
  ( (ListLongMap!3380 (toList!1705 List!3386)) )
))
(declare-fun contains!1579 (ListLongMap!3379 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1233 (array!11155 array!11153 (_ BitVec 32) (_ BitVec 32) V!7587 V!7587 (_ BitVec 32) Int) ListLongMap!3379)

(assert (=> b!227142 (= c!37655 (contains!1579 (getCurrentListMap!1233 (_keys!6297 thiss!1504) (_values!4226 thiss!1504) (mask!10101 thiss!1504) (extraKeys!3980 thiss!1504) (zeroValue!4084 thiss!1504) (minValue!4084 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4243 thiss!1504)) key!932))))

(declare-fun b!227143 () Bool)

(declare-fun res!111820 () Bool)

(assert (=> b!227143 (=> res!111820 e!147359)))

(assert (=> b!227143 (= res!111820 (or (not (= (size!5629 (_values!4226 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10101 thiss!1504)))) (not (= (size!5630 (_keys!6297 thiss!1504)) (size!5629 (_values!4226 thiss!1504)))) (bvslt (mask!10101 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!3980 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!3980 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!227144 () Bool)

(assert (=> b!227144 (= e!147350 e!147354)))

(declare-fun res!111816 () Bool)

(assert (=> b!227144 (=> (not res!111816) (not e!147354))))

(assert (=> b!227144 (= res!111816 (or (= lt!114298 (MissingZero!891 index!297)) (= lt!114298 (MissingVacant!891 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11155 (_ BitVec 32)) SeekEntryResult!891)

(assert (=> b!227144 (= lt!114298 (seekEntryOrOpen!0 key!932 (_keys!6297 thiss!1504) (mask!10101 thiss!1504)))))

(declare-fun b!227145 () Bool)

(declare-fun c!37654 () Bool)

(assert (=> b!227145 (= c!37654 ((_ is MissingVacant!891) lt!114298))))

(assert (=> b!227145 (= e!147349 e!147348)))

(declare-fun b!227146 () Bool)

(declare-fun Unit!6884 () Unit!6880)

(assert (=> b!227146 (= e!147351 Unit!6884)))

(declare-fun lt!114303 () Unit!6880)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!261 (array!11155 array!11153 (_ BitVec 32) (_ BitVec 32) V!7587 V!7587 (_ BitVec 64) Int) Unit!6880)

(assert (=> b!227146 (= lt!114303 (lemmaInListMapThenSeekEntryOrOpenFindsIt!261 (_keys!6297 thiss!1504) (_values!4226 thiss!1504) (mask!10101 thiss!1504) (extraKeys!3980 thiss!1504) (zeroValue!4084 thiss!1504) (minValue!4084 thiss!1504) key!932 (defaultEntry!4243 thiss!1504)))))

(assert (=> b!227146 false))

(declare-fun mapNonEmpty!10102 () Bool)

(declare-fun tp!21420 () Bool)

(assert (=> mapNonEmpty!10102 (= mapRes!10102 (and tp!21420 e!147357))))

(declare-fun mapRest!10102 () (Array (_ BitVec 32) ValueCell!2634))

(declare-fun mapKey!10102 () (_ BitVec 32))

(declare-fun mapValue!10102 () ValueCell!2634)

(assert (=> mapNonEmpty!10102 (= (arr!5296 (_values!4226 thiss!1504)) (store mapRest!10102 mapKey!10102 mapValue!10102))))

(assert (= (and start!22026 res!111811) b!227141))

(assert (= (and b!227141 res!111810) b!227144))

(assert (= (and b!227144 res!111816) b!227142))

(assert (= (and b!227142 c!37655) b!227146))

(assert (= (and b!227142 (not c!37655)) b!227140))

(assert (= (and b!227140 c!37656) b!227126))

(assert (= (and b!227140 (not c!37656)) b!227145))

(assert (= (and b!227126 res!111817) b!227129))

(assert (= (and b!227129 res!111813) b!227125))

(assert (= (and b!227145 c!37654) b!227137))

(assert (= (and b!227145 (not c!37654)) b!227135))

(assert (= (and b!227137 res!111812) b!227128))

(assert (= (and b!227128 res!111818) b!227124))

(assert (= (or b!227126 b!227137) bm!21111))

(assert (= (or b!227125 b!227124) bm!21110))

(assert (= (and b!227142 res!111815) b!227130))

(assert (= (and b!227130 c!37653) b!227131))

(assert (= (and b!227130 (not c!37653)) b!227134))

(assert (= (and b!227130 (not res!111814)) b!227143))

(assert (= (and b!227143 (not res!111820)) b!227132))

(assert (= (and b!227132 (not res!111819)) b!227127))

(assert (= (and b!227139 condMapEmpty!10102) mapIsEmpty!10102))

(assert (= (and b!227139 (not condMapEmpty!10102)) mapNonEmpty!10102))

(assert (= (and mapNonEmpty!10102 ((_ is ValueCellFull!2634) mapValue!10102)) b!227138))

(assert (= (and b!227139 ((_ is ValueCellFull!2634) mapDefault!10102)) b!227133))

(assert (= b!227136 b!227139))

(assert (= start!22026 b!227136))

(declare-fun m!249207 () Bool)

(assert (=> b!227142 m!249207))

(declare-fun m!249209 () Bool)

(assert (=> b!227142 m!249209))

(assert (=> b!227142 m!249209))

(declare-fun m!249211 () Bool)

(assert (=> b!227142 m!249211))

(declare-fun m!249213 () Bool)

(assert (=> bm!21111 m!249213))

(declare-fun m!249215 () Bool)

(assert (=> b!227132 m!249215))

(declare-fun m!249217 () Bool)

(assert (=> b!227130 m!249217))

(declare-fun m!249219 () Bool)

(assert (=> b!227130 m!249219))

(declare-fun m!249221 () Bool)

(assert (=> b!227130 m!249221))

(declare-fun m!249223 () Bool)

(assert (=> b!227130 m!249223))

(declare-fun m!249225 () Bool)

(assert (=> b!227130 m!249225))

(declare-fun m!249227 () Bool)

(assert (=> b!227130 m!249227))

(declare-fun m!249229 () Bool)

(assert (=> b!227130 m!249229))

(declare-fun m!249231 () Bool)

(assert (=> b!227130 m!249231))

(declare-fun m!249233 () Bool)

(assert (=> b!227130 m!249233))

(declare-fun m!249235 () Bool)

(assert (=> b!227130 m!249235))

(declare-fun m!249237 () Bool)

(assert (=> start!22026 m!249237))

(declare-fun m!249239 () Bool)

(assert (=> b!227136 m!249239))

(declare-fun m!249241 () Bool)

(assert (=> b!227136 m!249241))

(declare-fun m!249243 () Bool)

(assert (=> b!227140 m!249243))

(declare-fun m!249245 () Bool)

(assert (=> b!227131 m!249245))

(declare-fun m!249247 () Bool)

(assert (=> b!227127 m!249247))

(declare-fun m!249249 () Bool)

(assert (=> b!227146 m!249249))

(declare-fun m!249251 () Bool)

(assert (=> b!227144 m!249251))

(declare-fun m!249253 () Bool)

(assert (=> b!227128 m!249253))

(declare-fun m!249255 () Bool)

(assert (=> b!227129 m!249255))

(declare-fun m!249257 () Bool)

(assert (=> mapNonEmpty!10102 m!249257))

(assert (=> bm!21110 m!249219))

(check-sat (not b!227146) (not b!227132) (not b_next!6093) (not b!227130) (not b!227136) (not bm!21110) (not b!227131) (not bm!21111) (not b!227127) (not mapNonEmpty!10102) (not b!227140) (not b!227144) (not start!22026) b_and!12991 tp_is_empty!5955 (not b!227142))
(check-sat b_and!12991 (not b_next!6093))
