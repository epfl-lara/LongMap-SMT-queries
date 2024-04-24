; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19138 () Bool)

(assert start!19138)

(declare-fun b!188315 () Bool)

(declare-fun b_free!4621 () Bool)

(declare-fun b_next!4621 () Bool)

(assert (=> b!188315 (= b_free!4621 (not b_next!4621))))

(declare-fun tp!16684 () Bool)

(declare-fun b_and!11265 () Bool)

(assert (=> b!188315 (= tp!16684 b_and!11265)))

(declare-fun b!188305 () Bool)

(declare-datatypes ((Unit!5677 0))(
  ( (Unit!5678) )
))
(declare-fun e!123919 () Unit!5677)

(declare-fun Unit!5679 () Unit!5677)

(assert (=> b!188305 (= e!123919 Unit!5679)))

(declare-fun lt!93232 () Unit!5677)

(declare-datatypes ((V!5505 0))(
  ( (V!5506 (val!2241 Int)) )
))
(declare-datatypes ((ValueCell!1853 0))(
  ( (ValueCellFull!1853 (v!4159 V!5505)) (EmptyCell!1853) )
))
(declare-datatypes ((array!7993 0))(
  ( (array!7994 (arr!3770 (Array (_ BitVec 32) (_ BitVec 64))) (size!4090 (_ BitVec 32))) )
))
(declare-datatypes ((array!7995 0))(
  ( (array!7996 (arr!3771 (Array (_ BitVec 32) ValueCell!1853)) (size!4091 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2614 0))(
  ( (LongMapFixedSize!2615 (defaultEntry!3839 Int) (mask!9002 (_ BitVec 32)) (extraKeys!3576 (_ BitVec 32)) (zeroValue!3680 V!5505) (minValue!3680 V!5505) (_size!1356 (_ BitVec 32)) (_keys!5798 array!7993) (_values!3822 array!7995) (_vacant!1356 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2614)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!152 (array!7993 array!7995 (_ BitVec 32) (_ BitVec 32) V!5505 V!5505 (_ BitVec 64) Int) Unit!5677)

(assert (=> b!188305 (= lt!93232 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!152 (_keys!5798 thiss!1248) (_values!3822 thiss!1248) (mask!9002 thiss!1248) (extraKeys!3576 thiss!1248) (zeroValue!3680 thiss!1248) (minValue!3680 thiss!1248) key!828 (defaultEntry!3839 thiss!1248)))))

(assert (=> b!188305 false))

(declare-fun b!188306 () Bool)

(declare-fun e!123918 () Bool)

(declare-fun e!123921 () Bool)

(assert (=> b!188306 (= e!123918 e!123921)))

(declare-fun res!89018 () Bool)

(assert (=> b!188306 (=> (not res!89018) (not e!123921))))

(declare-datatypes ((SeekEntryResult!645 0))(
  ( (MissingZero!645 (index!4750 (_ BitVec 32))) (Found!645 (index!4751 (_ BitVec 32))) (Intermediate!645 (undefined!1457 Bool) (index!4752 (_ BitVec 32)) (x!20331 (_ BitVec 32))) (Undefined!645) (MissingVacant!645 (index!4753 (_ BitVec 32))) )
))
(declare-fun lt!93231 () SeekEntryResult!645)

(get-info :version)

(assert (=> b!188306 (= res!89018 (and (not ((_ is Undefined!645) lt!93231)) (not ((_ is MissingVacant!645) lt!93231)) (not ((_ is MissingZero!645) lt!93231)) ((_ is Found!645) lt!93231)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7993 (_ BitVec 32)) SeekEntryResult!645)

(assert (=> b!188306 (= lt!93231 (seekEntryOrOpen!0 key!828 (_keys!5798 thiss!1248) (mask!9002 thiss!1248)))))

(declare-fun b!188307 () Bool)

(declare-fun e!123917 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7993 (_ BitVec 32)) Bool)

(assert (=> b!188307 (= e!123917 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5798 thiss!1248) (mask!9002 thiss!1248))))))

(declare-fun res!89017 () Bool)

(assert (=> start!19138 (=> (not res!89017) (not e!123918))))

(declare-fun valid!1102 (LongMapFixedSize!2614) Bool)

(assert (=> start!19138 (= res!89017 (valid!1102 thiss!1248))))

(assert (=> start!19138 e!123918))

(declare-fun e!123916 () Bool)

(assert (=> start!19138 e!123916))

(assert (=> start!19138 true))

(declare-fun b!188308 () Bool)

(declare-fun e!123915 () Bool)

(declare-fun tp_is_empty!4393 () Bool)

(assert (=> b!188308 (= e!123915 tp_is_empty!4393)))

(declare-fun b!188309 () Bool)

(declare-fun e!123913 () Bool)

(assert (=> b!188309 (= e!123913 tp_is_empty!4393)))

(declare-fun b!188310 () Bool)

(declare-fun res!89020 () Bool)

(assert (=> b!188310 (=> (not res!89020) (not e!123917))))

(assert (=> b!188310 (= res!89020 (and (= (size!4091 (_values!3822 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9002 thiss!1248))) (= (size!4090 (_keys!5798 thiss!1248)) (size!4091 (_values!3822 thiss!1248))) (bvsge (mask!9002 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3576 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3576 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!7573 () Bool)

(declare-fun mapRes!7573 () Bool)

(assert (=> mapIsEmpty!7573 mapRes!7573))

(declare-fun b!188311 () Bool)

(declare-fun lt!93229 () Unit!5677)

(assert (=> b!188311 (= e!123919 lt!93229)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!158 (array!7993 array!7995 (_ BitVec 32) (_ BitVec 32) V!5505 V!5505 (_ BitVec 64) Int) Unit!5677)

(assert (=> b!188311 (= lt!93229 (lemmaInListMapThenSeekEntryOrOpenFindsIt!158 (_keys!5798 thiss!1248) (_values!3822 thiss!1248) (mask!9002 thiss!1248) (extraKeys!3576 thiss!1248) (zeroValue!3680 thiss!1248) (minValue!3680 thiss!1248) key!828 (defaultEntry!3839 thiss!1248)))))

(declare-fun res!89019 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!188311 (= res!89019 (inRange!0 (index!4751 lt!93231) (mask!9002 thiss!1248)))))

(declare-fun e!123912 () Bool)

(assert (=> b!188311 (=> (not res!89019) (not e!123912))))

(assert (=> b!188311 e!123912))

(declare-fun b!188312 () Bool)

(declare-fun res!89016 () Bool)

(assert (=> b!188312 (=> (not res!89016) (not e!123918))))

(assert (=> b!188312 (= res!89016 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!7573 () Bool)

(declare-fun tp!16683 () Bool)

(assert (=> mapNonEmpty!7573 (= mapRes!7573 (and tp!16683 e!123913))))

(declare-fun mapKey!7573 () (_ BitVec 32))

(declare-fun mapRest!7573 () (Array (_ BitVec 32) ValueCell!1853))

(declare-fun mapValue!7573 () ValueCell!1853)

(assert (=> mapNonEmpty!7573 (= (arr!3771 (_values!3822 thiss!1248)) (store mapRest!7573 mapKey!7573 mapValue!7573))))

(declare-fun b!188313 () Bool)

(assert (=> b!188313 (= e!123912 (= (select (arr!3770 (_keys!5798 thiss!1248)) (index!4751 lt!93231)) key!828))))

(declare-fun b!188314 () Bool)

(declare-fun e!123914 () Bool)

(assert (=> b!188314 (= e!123914 (and e!123915 mapRes!7573))))

(declare-fun condMapEmpty!7573 () Bool)

(declare-fun mapDefault!7573 () ValueCell!1853)

(assert (=> b!188314 (= condMapEmpty!7573 (= (arr!3771 (_values!3822 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1853)) mapDefault!7573)))))

(declare-fun array_inv!2433 (array!7993) Bool)

(declare-fun array_inv!2434 (array!7995) Bool)

(assert (=> b!188315 (= e!123916 (and tp!16684 tp_is_empty!4393 (array_inv!2433 (_keys!5798 thiss!1248)) (array_inv!2434 (_values!3822 thiss!1248)) e!123914))))

(declare-fun b!188316 () Bool)

(assert (=> b!188316 (= e!123921 e!123917)))

(declare-fun res!89015 () Bool)

(assert (=> b!188316 (=> (not res!89015) (not e!123917))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!188316 (= res!89015 (validMask!0 (mask!9002 thiss!1248)))))

(declare-fun lt!93230 () Unit!5677)

(assert (=> b!188316 (= lt!93230 e!123919)))

(declare-fun c!33852 () Bool)

(declare-datatypes ((tuple2!3436 0))(
  ( (tuple2!3437 (_1!1729 (_ BitVec 64)) (_2!1729 V!5505)) )
))
(declare-datatypes ((List!2356 0))(
  ( (Nil!2353) (Cons!2352 (h!2989 tuple2!3436) (t!7244 List!2356)) )
))
(declare-datatypes ((ListLongMap!2357 0))(
  ( (ListLongMap!2358 (toList!1194 List!2356)) )
))
(declare-fun contains!1310 (ListLongMap!2357 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!846 (array!7993 array!7995 (_ BitVec 32) (_ BitVec 32) V!5505 V!5505 (_ BitVec 32) Int) ListLongMap!2357)

(assert (=> b!188316 (= c!33852 (contains!1310 (getCurrentListMap!846 (_keys!5798 thiss!1248) (_values!3822 thiss!1248) (mask!9002 thiss!1248) (extraKeys!3576 thiss!1248) (zeroValue!3680 thiss!1248) (minValue!3680 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3839 thiss!1248)) key!828))))

(assert (= (and start!19138 res!89017) b!188312))

(assert (= (and b!188312 res!89016) b!188306))

(assert (= (and b!188306 res!89018) b!188316))

(assert (= (and b!188316 c!33852) b!188311))

(assert (= (and b!188316 (not c!33852)) b!188305))

(assert (= (and b!188311 res!89019) b!188313))

(assert (= (and b!188316 res!89015) b!188310))

(assert (= (and b!188310 res!89020) b!188307))

(assert (= (and b!188314 condMapEmpty!7573) mapIsEmpty!7573))

(assert (= (and b!188314 (not condMapEmpty!7573)) mapNonEmpty!7573))

(assert (= (and mapNonEmpty!7573 ((_ is ValueCellFull!1853) mapValue!7573)) b!188309))

(assert (= (and b!188314 ((_ is ValueCellFull!1853) mapDefault!7573)) b!188308))

(assert (= b!188315 b!188314))

(assert (= start!19138 b!188315))

(declare-fun m!215143 () Bool)

(assert (=> b!188311 m!215143))

(declare-fun m!215145 () Bool)

(assert (=> b!188311 m!215145))

(declare-fun m!215147 () Bool)

(assert (=> mapNonEmpty!7573 m!215147))

(declare-fun m!215149 () Bool)

(assert (=> start!19138 m!215149))

(declare-fun m!215151 () Bool)

(assert (=> b!188306 m!215151))

(declare-fun m!215153 () Bool)

(assert (=> b!188313 m!215153))

(declare-fun m!215155 () Bool)

(assert (=> b!188305 m!215155))

(declare-fun m!215157 () Bool)

(assert (=> b!188307 m!215157))

(declare-fun m!215159 () Bool)

(assert (=> b!188315 m!215159))

(declare-fun m!215161 () Bool)

(assert (=> b!188315 m!215161))

(declare-fun m!215163 () Bool)

(assert (=> b!188316 m!215163))

(declare-fun m!215165 () Bool)

(assert (=> b!188316 m!215165))

(assert (=> b!188316 m!215165))

(declare-fun m!215167 () Bool)

(assert (=> b!188316 m!215167))

(check-sat (not b!188311) (not b_next!4621) tp_is_empty!4393 (not start!19138) (not mapNonEmpty!7573) (not b!188307) (not b!188315) (not b!188316) (not b!188306) b_and!11265 (not b!188305))
(check-sat b_and!11265 (not b_next!4621))
(get-model)

(declare-fun b!188397 () Bool)

(declare-fun e!123988 () Bool)

(declare-fun e!123989 () Bool)

(assert (=> b!188397 (= e!123988 e!123989)))

(declare-fun c!33861 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!188397 (= c!33861 (validKeyInArray!0 (select (arr!3770 (_keys!5798 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18961 () Bool)

(declare-fun call!18964 () Bool)

(assert (=> bm!18961 (= call!18964 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5798 thiss!1248) (mask!9002 thiss!1248)))))

(declare-fun d!55685 () Bool)

(declare-fun res!89061 () Bool)

(assert (=> d!55685 (=> res!89061 e!123988)))

(assert (=> d!55685 (= res!89061 (bvsge #b00000000000000000000000000000000 (size!4090 (_keys!5798 thiss!1248))))))

(assert (=> d!55685 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5798 thiss!1248) (mask!9002 thiss!1248)) e!123988)))

(declare-fun b!188398 () Bool)

(declare-fun e!123990 () Bool)

(assert (=> b!188398 (= e!123989 e!123990)))

(declare-fun lt!93265 () (_ BitVec 64))

(assert (=> b!188398 (= lt!93265 (select (arr!3770 (_keys!5798 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93264 () Unit!5677)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7993 (_ BitVec 64) (_ BitVec 32)) Unit!5677)

(assert (=> b!188398 (= lt!93264 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5798 thiss!1248) lt!93265 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7993 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!188398 (arrayContainsKey!0 (_keys!5798 thiss!1248) lt!93265 #b00000000000000000000000000000000)))

(declare-fun lt!93263 () Unit!5677)

(assert (=> b!188398 (= lt!93263 lt!93264)))

(declare-fun res!89062 () Bool)

(assert (=> b!188398 (= res!89062 (= (seekEntryOrOpen!0 (select (arr!3770 (_keys!5798 thiss!1248)) #b00000000000000000000000000000000) (_keys!5798 thiss!1248) (mask!9002 thiss!1248)) (Found!645 #b00000000000000000000000000000000)))))

(assert (=> b!188398 (=> (not res!89062) (not e!123990))))

(declare-fun b!188399 () Bool)

(assert (=> b!188399 (= e!123989 call!18964)))

(declare-fun b!188400 () Bool)

(assert (=> b!188400 (= e!123990 call!18964)))

(assert (= (and d!55685 (not res!89061)) b!188397))

(assert (= (and b!188397 c!33861) b!188398))

(assert (= (and b!188397 (not c!33861)) b!188399))

(assert (= (and b!188398 res!89062) b!188400))

(assert (= (or b!188400 b!188399) bm!18961))

(declare-fun m!215221 () Bool)

(assert (=> b!188397 m!215221))

(assert (=> b!188397 m!215221))

(declare-fun m!215223 () Bool)

(assert (=> b!188397 m!215223))

(declare-fun m!215225 () Bool)

(assert (=> bm!18961 m!215225))

(assert (=> b!188398 m!215221))

(declare-fun m!215227 () Bool)

(assert (=> b!188398 m!215227))

(declare-fun m!215229 () Bool)

(assert (=> b!188398 m!215229))

(assert (=> b!188398 m!215221))

(declare-fun m!215231 () Bool)

(assert (=> b!188398 m!215231))

(assert (=> b!188307 d!55685))

(declare-fun d!55687 () Bool)

(declare-fun e!123993 () Bool)

(assert (=> d!55687 e!123993))

(declare-fun res!89068 () Bool)

(assert (=> d!55687 (=> (not res!89068) (not e!123993))))

(declare-fun lt!93270 () SeekEntryResult!645)

(assert (=> d!55687 (= res!89068 ((_ is Found!645) lt!93270))))

(assert (=> d!55687 (= lt!93270 (seekEntryOrOpen!0 key!828 (_keys!5798 thiss!1248) (mask!9002 thiss!1248)))))

(declare-fun lt!93271 () Unit!5677)

(declare-fun choose!1013 (array!7993 array!7995 (_ BitVec 32) (_ BitVec 32) V!5505 V!5505 (_ BitVec 64) Int) Unit!5677)

(assert (=> d!55687 (= lt!93271 (choose!1013 (_keys!5798 thiss!1248) (_values!3822 thiss!1248) (mask!9002 thiss!1248) (extraKeys!3576 thiss!1248) (zeroValue!3680 thiss!1248) (minValue!3680 thiss!1248) key!828 (defaultEntry!3839 thiss!1248)))))

(assert (=> d!55687 (validMask!0 (mask!9002 thiss!1248))))

(assert (=> d!55687 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!158 (_keys!5798 thiss!1248) (_values!3822 thiss!1248) (mask!9002 thiss!1248) (extraKeys!3576 thiss!1248) (zeroValue!3680 thiss!1248) (minValue!3680 thiss!1248) key!828 (defaultEntry!3839 thiss!1248)) lt!93271)))

(declare-fun b!188405 () Bool)

(declare-fun res!89067 () Bool)

(assert (=> b!188405 (=> (not res!89067) (not e!123993))))

(assert (=> b!188405 (= res!89067 (inRange!0 (index!4751 lt!93270) (mask!9002 thiss!1248)))))

(declare-fun b!188406 () Bool)

(assert (=> b!188406 (= e!123993 (= (select (arr!3770 (_keys!5798 thiss!1248)) (index!4751 lt!93270)) key!828))))

(assert (=> b!188406 (and (bvsge (index!4751 lt!93270) #b00000000000000000000000000000000) (bvslt (index!4751 lt!93270) (size!4090 (_keys!5798 thiss!1248))))))

(assert (= (and d!55687 res!89068) b!188405))

(assert (= (and b!188405 res!89067) b!188406))

(assert (=> d!55687 m!215151))

(declare-fun m!215233 () Bool)

(assert (=> d!55687 m!215233))

(assert (=> d!55687 m!215163))

(declare-fun m!215235 () Bool)

(assert (=> b!188405 m!215235))

(declare-fun m!215237 () Bool)

(assert (=> b!188406 m!215237))

(assert (=> b!188311 d!55687))

(declare-fun d!55689 () Bool)

(assert (=> d!55689 (= (inRange!0 (index!4751 lt!93231) (mask!9002 thiss!1248)) (and (bvsge (index!4751 lt!93231) #b00000000000000000000000000000000) (bvslt (index!4751 lt!93231) (bvadd (mask!9002 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!188311 d!55689))

(declare-fun d!55691 () Bool)

(assert (=> d!55691 (= (validMask!0 (mask!9002 thiss!1248)) (and (or (= (mask!9002 thiss!1248) #b00000000000000000000000000000111) (= (mask!9002 thiss!1248) #b00000000000000000000000000001111) (= (mask!9002 thiss!1248) #b00000000000000000000000000011111) (= (mask!9002 thiss!1248) #b00000000000000000000000000111111) (= (mask!9002 thiss!1248) #b00000000000000000000000001111111) (= (mask!9002 thiss!1248) #b00000000000000000000000011111111) (= (mask!9002 thiss!1248) #b00000000000000000000000111111111) (= (mask!9002 thiss!1248) #b00000000000000000000001111111111) (= (mask!9002 thiss!1248) #b00000000000000000000011111111111) (= (mask!9002 thiss!1248) #b00000000000000000000111111111111) (= (mask!9002 thiss!1248) #b00000000000000000001111111111111) (= (mask!9002 thiss!1248) #b00000000000000000011111111111111) (= (mask!9002 thiss!1248) #b00000000000000000111111111111111) (= (mask!9002 thiss!1248) #b00000000000000001111111111111111) (= (mask!9002 thiss!1248) #b00000000000000011111111111111111) (= (mask!9002 thiss!1248) #b00000000000000111111111111111111) (= (mask!9002 thiss!1248) #b00000000000001111111111111111111) (= (mask!9002 thiss!1248) #b00000000000011111111111111111111) (= (mask!9002 thiss!1248) #b00000000000111111111111111111111) (= (mask!9002 thiss!1248) #b00000000001111111111111111111111) (= (mask!9002 thiss!1248) #b00000000011111111111111111111111) (= (mask!9002 thiss!1248) #b00000000111111111111111111111111) (= (mask!9002 thiss!1248) #b00000001111111111111111111111111) (= (mask!9002 thiss!1248) #b00000011111111111111111111111111) (= (mask!9002 thiss!1248) #b00000111111111111111111111111111) (= (mask!9002 thiss!1248) #b00001111111111111111111111111111) (= (mask!9002 thiss!1248) #b00011111111111111111111111111111) (= (mask!9002 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9002 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!188316 d!55691))

(declare-fun d!55693 () Bool)

(declare-fun e!123999 () Bool)

(assert (=> d!55693 e!123999))

(declare-fun res!89071 () Bool)

(assert (=> d!55693 (=> res!89071 e!123999)))

(declare-fun lt!93280 () Bool)

(assert (=> d!55693 (= res!89071 (not lt!93280))))

(declare-fun lt!93281 () Bool)

(assert (=> d!55693 (= lt!93280 lt!93281)))

(declare-fun lt!93283 () Unit!5677)

(declare-fun e!123998 () Unit!5677)

(assert (=> d!55693 (= lt!93283 e!123998)))

(declare-fun c!33864 () Bool)

(assert (=> d!55693 (= c!33864 lt!93281)))

(declare-fun containsKey!234 (List!2356 (_ BitVec 64)) Bool)

(assert (=> d!55693 (= lt!93281 (containsKey!234 (toList!1194 (getCurrentListMap!846 (_keys!5798 thiss!1248) (_values!3822 thiss!1248) (mask!9002 thiss!1248) (extraKeys!3576 thiss!1248) (zeroValue!3680 thiss!1248) (minValue!3680 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3839 thiss!1248))) key!828))))

(assert (=> d!55693 (= (contains!1310 (getCurrentListMap!846 (_keys!5798 thiss!1248) (_values!3822 thiss!1248) (mask!9002 thiss!1248) (extraKeys!3576 thiss!1248) (zeroValue!3680 thiss!1248) (minValue!3680 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3839 thiss!1248)) key!828) lt!93280)))

(declare-fun b!188413 () Bool)

(declare-fun lt!93282 () Unit!5677)

(assert (=> b!188413 (= e!123998 lt!93282)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!182 (List!2356 (_ BitVec 64)) Unit!5677)

(assert (=> b!188413 (= lt!93282 (lemmaContainsKeyImpliesGetValueByKeyDefined!182 (toList!1194 (getCurrentListMap!846 (_keys!5798 thiss!1248) (_values!3822 thiss!1248) (mask!9002 thiss!1248) (extraKeys!3576 thiss!1248) (zeroValue!3680 thiss!1248) (minValue!3680 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3839 thiss!1248))) key!828))))

(declare-datatypes ((Option!237 0))(
  ( (Some!236 (v!4162 V!5505)) (None!235) )
))
(declare-fun isDefined!183 (Option!237) Bool)

(declare-fun getValueByKey!231 (List!2356 (_ BitVec 64)) Option!237)

(assert (=> b!188413 (isDefined!183 (getValueByKey!231 (toList!1194 (getCurrentListMap!846 (_keys!5798 thiss!1248) (_values!3822 thiss!1248) (mask!9002 thiss!1248) (extraKeys!3576 thiss!1248) (zeroValue!3680 thiss!1248) (minValue!3680 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3839 thiss!1248))) key!828))))

(declare-fun b!188414 () Bool)

(declare-fun Unit!5683 () Unit!5677)

(assert (=> b!188414 (= e!123998 Unit!5683)))

(declare-fun b!188415 () Bool)

(assert (=> b!188415 (= e!123999 (isDefined!183 (getValueByKey!231 (toList!1194 (getCurrentListMap!846 (_keys!5798 thiss!1248) (_values!3822 thiss!1248) (mask!9002 thiss!1248) (extraKeys!3576 thiss!1248) (zeroValue!3680 thiss!1248) (minValue!3680 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3839 thiss!1248))) key!828)))))

(assert (= (and d!55693 c!33864) b!188413))

(assert (= (and d!55693 (not c!33864)) b!188414))

(assert (= (and d!55693 (not res!89071)) b!188415))

(declare-fun m!215239 () Bool)

(assert (=> d!55693 m!215239))

(declare-fun m!215241 () Bool)

(assert (=> b!188413 m!215241))

(declare-fun m!215243 () Bool)

(assert (=> b!188413 m!215243))

(assert (=> b!188413 m!215243))

(declare-fun m!215245 () Bool)

(assert (=> b!188413 m!215245))

(assert (=> b!188415 m!215243))

(assert (=> b!188415 m!215243))

(assert (=> b!188415 m!215245))

(assert (=> b!188316 d!55693))

(declare-fun d!55695 () Bool)

(declare-fun e!124035 () Bool)

(assert (=> d!55695 e!124035))

(declare-fun res!89098 () Bool)

(assert (=> d!55695 (=> (not res!89098) (not e!124035))))

(assert (=> d!55695 (= res!89098 (or (bvsge #b00000000000000000000000000000000 (size!4090 (_keys!5798 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4090 (_keys!5798 thiss!1248))))))))

(declare-fun lt!93339 () ListLongMap!2357)

(declare-fun lt!93335 () ListLongMap!2357)

(assert (=> d!55695 (= lt!93339 lt!93335)))

(declare-fun lt!93340 () Unit!5677)

(declare-fun e!124033 () Unit!5677)

(assert (=> d!55695 (= lt!93340 e!124033)))

(declare-fun c!33882 () Bool)

(declare-fun e!124026 () Bool)

(assert (=> d!55695 (= c!33882 e!124026)))

(declare-fun res!89090 () Bool)

(assert (=> d!55695 (=> (not res!89090) (not e!124026))))

(assert (=> d!55695 (= res!89090 (bvslt #b00000000000000000000000000000000 (size!4090 (_keys!5798 thiss!1248))))))

(declare-fun e!124034 () ListLongMap!2357)

(assert (=> d!55695 (= lt!93335 e!124034)))

(declare-fun c!33880 () Bool)

(assert (=> d!55695 (= c!33880 (and (not (= (bvand (extraKeys!3576 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3576 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55695 (validMask!0 (mask!9002 thiss!1248))))

(assert (=> d!55695 (= (getCurrentListMap!846 (_keys!5798 thiss!1248) (_values!3822 thiss!1248) (mask!9002 thiss!1248) (extraKeys!3576 thiss!1248) (zeroValue!3680 thiss!1248) (minValue!3680 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3839 thiss!1248)) lt!93339)))

(declare-fun b!188458 () Bool)

(declare-fun e!124027 () Bool)

(assert (=> b!188458 (= e!124035 e!124027)))

(declare-fun c!33877 () Bool)

(assert (=> b!188458 (= c!33877 (not (= (bvand (extraKeys!3576 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18976 () Bool)

(declare-fun call!18979 () ListLongMap!2357)

(declare-fun call!18982 () ListLongMap!2357)

(assert (=> bm!18976 (= call!18979 call!18982)))

(declare-fun b!188459 () Bool)

(declare-fun e!124036 () Bool)

(declare-fun apply!173 (ListLongMap!2357 (_ BitVec 64)) V!5505)

(assert (=> b!188459 (= e!124036 (= (apply!173 lt!93339 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3680 thiss!1248)))))

(declare-fun b!188460 () Bool)

(declare-fun e!124029 () Bool)

(declare-fun get!2184 (ValueCell!1853 V!5505) V!5505)

(declare-fun dynLambda!516 (Int (_ BitVec 64)) V!5505)

(assert (=> b!188460 (= e!124029 (= (apply!173 lt!93339 (select (arr!3770 (_keys!5798 thiss!1248)) #b00000000000000000000000000000000)) (get!2184 (select (arr!3771 (_values!3822 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!516 (defaultEntry!3839 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!188460 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4091 (_values!3822 thiss!1248))))))

(assert (=> b!188460 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4090 (_keys!5798 thiss!1248))))))

(declare-fun b!188461 () Bool)

(declare-fun lt!93347 () Unit!5677)

(assert (=> b!188461 (= e!124033 lt!93347)))

(declare-fun lt!93342 () ListLongMap!2357)

(declare-fun getCurrentListMapNoExtraKeys!204 (array!7993 array!7995 (_ BitVec 32) (_ BitVec 32) V!5505 V!5505 (_ BitVec 32) Int) ListLongMap!2357)

(assert (=> b!188461 (= lt!93342 (getCurrentListMapNoExtraKeys!204 (_keys!5798 thiss!1248) (_values!3822 thiss!1248) (mask!9002 thiss!1248) (extraKeys!3576 thiss!1248) (zeroValue!3680 thiss!1248) (minValue!3680 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3839 thiss!1248)))))

(declare-fun lt!93343 () (_ BitVec 64))

(assert (=> b!188461 (= lt!93343 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93345 () (_ BitVec 64))

(assert (=> b!188461 (= lt!93345 (select (arr!3770 (_keys!5798 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93344 () Unit!5677)

(declare-fun addStillContains!149 (ListLongMap!2357 (_ BitVec 64) V!5505 (_ BitVec 64)) Unit!5677)

(assert (=> b!188461 (= lt!93344 (addStillContains!149 lt!93342 lt!93343 (zeroValue!3680 thiss!1248) lt!93345))))

(declare-fun +!293 (ListLongMap!2357 tuple2!3436) ListLongMap!2357)

(assert (=> b!188461 (contains!1310 (+!293 lt!93342 (tuple2!3437 lt!93343 (zeroValue!3680 thiss!1248))) lt!93345)))

(declare-fun lt!93338 () Unit!5677)

(assert (=> b!188461 (= lt!93338 lt!93344)))

(declare-fun lt!93328 () ListLongMap!2357)

(assert (=> b!188461 (= lt!93328 (getCurrentListMapNoExtraKeys!204 (_keys!5798 thiss!1248) (_values!3822 thiss!1248) (mask!9002 thiss!1248) (extraKeys!3576 thiss!1248) (zeroValue!3680 thiss!1248) (minValue!3680 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3839 thiss!1248)))))

(declare-fun lt!93337 () (_ BitVec 64))

(assert (=> b!188461 (= lt!93337 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93336 () (_ BitVec 64))

(assert (=> b!188461 (= lt!93336 (select (arr!3770 (_keys!5798 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93330 () Unit!5677)

(declare-fun addApplyDifferent!149 (ListLongMap!2357 (_ BitVec 64) V!5505 (_ BitVec 64)) Unit!5677)

(assert (=> b!188461 (= lt!93330 (addApplyDifferent!149 lt!93328 lt!93337 (minValue!3680 thiss!1248) lt!93336))))

(assert (=> b!188461 (= (apply!173 (+!293 lt!93328 (tuple2!3437 lt!93337 (minValue!3680 thiss!1248))) lt!93336) (apply!173 lt!93328 lt!93336))))

(declare-fun lt!93331 () Unit!5677)

(assert (=> b!188461 (= lt!93331 lt!93330)))

(declare-fun lt!93346 () ListLongMap!2357)

(assert (=> b!188461 (= lt!93346 (getCurrentListMapNoExtraKeys!204 (_keys!5798 thiss!1248) (_values!3822 thiss!1248) (mask!9002 thiss!1248) (extraKeys!3576 thiss!1248) (zeroValue!3680 thiss!1248) (minValue!3680 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3839 thiss!1248)))))

(declare-fun lt!93349 () (_ BitVec 64))

(assert (=> b!188461 (= lt!93349 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93333 () (_ BitVec 64))

(assert (=> b!188461 (= lt!93333 (select (arr!3770 (_keys!5798 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93334 () Unit!5677)

(assert (=> b!188461 (= lt!93334 (addApplyDifferent!149 lt!93346 lt!93349 (zeroValue!3680 thiss!1248) lt!93333))))

(assert (=> b!188461 (= (apply!173 (+!293 lt!93346 (tuple2!3437 lt!93349 (zeroValue!3680 thiss!1248))) lt!93333) (apply!173 lt!93346 lt!93333))))

(declare-fun lt!93348 () Unit!5677)

(assert (=> b!188461 (= lt!93348 lt!93334)))

(declare-fun lt!93341 () ListLongMap!2357)

(assert (=> b!188461 (= lt!93341 (getCurrentListMapNoExtraKeys!204 (_keys!5798 thiss!1248) (_values!3822 thiss!1248) (mask!9002 thiss!1248) (extraKeys!3576 thiss!1248) (zeroValue!3680 thiss!1248) (minValue!3680 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3839 thiss!1248)))))

(declare-fun lt!93332 () (_ BitVec 64))

(assert (=> b!188461 (= lt!93332 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93329 () (_ BitVec 64))

(assert (=> b!188461 (= lt!93329 (select (arr!3770 (_keys!5798 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!188461 (= lt!93347 (addApplyDifferent!149 lt!93341 lt!93332 (minValue!3680 thiss!1248) lt!93329))))

(assert (=> b!188461 (= (apply!173 (+!293 lt!93341 (tuple2!3437 lt!93332 (minValue!3680 thiss!1248))) lt!93329) (apply!173 lt!93341 lt!93329))))

(declare-fun b!188462 () Bool)

(declare-fun e!124031 () ListLongMap!2357)

(declare-fun call!18983 () ListLongMap!2357)

(assert (=> b!188462 (= e!124031 call!18983)))

(declare-fun b!188463 () Bool)

(declare-fun e!124037 () Bool)

(assert (=> b!188463 (= e!124037 (validKeyInArray!0 (select (arr!3770 (_keys!5798 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!188464 () Bool)

(declare-fun e!124032 () Bool)

(declare-fun call!18981 () Bool)

(assert (=> b!188464 (= e!124032 (not call!18981))))

(declare-fun bm!18977 () Bool)

(assert (=> bm!18977 (= call!18982 (getCurrentListMapNoExtraKeys!204 (_keys!5798 thiss!1248) (_values!3822 thiss!1248) (mask!9002 thiss!1248) (extraKeys!3576 thiss!1248) (zeroValue!3680 thiss!1248) (minValue!3680 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3839 thiss!1248)))))

(declare-fun b!188465 () Bool)

(declare-fun call!18980 () ListLongMap!2357)

(assert (=> b!188465 (= e!124031 call!18980)))

(declare-fun b!188466 () Bool)

(declare-fun call!18984 () Bool)

(assert (=> b!188466 (= e!124027 (not call!18984))))

(declare-fun bm!18978 () Bool)

(assert (=> bm!18978 (= call!18980 call!18979)))

(declare-fun b!188467 () Bool)

(assert (=> b!188467 (= e!124026 (validKeyInArray!0 (select (arr!3770 (_keys!5798 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!188468 () Bool)

(declare-fun e!124030 () ListLongMap!2357)

(assert (=> b!188468 (= e!124034 e!124030)))

(declare-fun c!33879 () Bool)

(assert (=> b!188468 (= c!33879 (and (not (= (bvand (extraKeys!3576 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3576 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!188469 () Bool)

(assert (=> b!188469 (= e!124030 call!18983)))

(declare-fun bm!18979 () Bool)

(declare-fun call!18985 () ListLongMap!2357)

(assert (=> bm!18979 (= call!18983 call!18985)))

(declare-fun b!188470 () Bool)

(assert (=> b!188470 (= e!124027 e!124036)))

(declare-fun res!89091 () Bool)

(assert (=> b!188470 (= res!89091 call!18984)))

(assert (=> b!188470 (=> (not res!89091) (not e!124036))))

(declare-fun bm!18980 () Bool)

(assert (=> bm!18980 (= call!18984 (contains!1310 lt!93339 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!188471 () Bool)

(declare-fun res!89094 () Bool)

(assert (=> b!188471 (=> (not res!89094) (not e!124035))))

(assert (=> b!188471 (= res!89094 e!124032)))

(declare-fun c!33878 () Bool)

(assert (=> b!188471 (= c!33878 (not (= (bvand (extraKeys!3576 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!188472 () Bool)

(assert (=> b!188472 (= e!124034 (+!293 call!18985 (tuple2!3437 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3680 thiss!1248))))))

(declare-fun bm!18981 () Bool)

(assert (=> bm!18981 (= call!18981 (contains!1310 lt!93339 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!188473 () Bool)

(declare-fun Unit!5684 () Unit!5677)

(assert (=> b!188473 (= e!124033 Unit!5684)))

(declare-fun b!188474 () Bool)

(declare-fun res!89095 () Bool)

(assert (=> b!188474 (=> (not res!89095) (not e!124035))))

(declare-fun e!124038 () Bool)

(assert (=> b!188474 (= res!89095 e!124038)))

(declare-fun res!89096 () Bool)

(assert (=> b!188474 (=> res!89096 e!124038)))

(assert (=> b!188474 (= res!89096 (not e!124037))))

(declare-fun res!89092 () Bool)

(assert (=> b!188474 (=> (not res!89092) (not e!124037))))

(assert (=> b!188474 (= res!89092 (bvslt #b00000000000000000000000000000000 (size!4090 (_keys!5798 thiss!1248))))))

(declare-fun b!188475 () Bool)

(declare-fun e!124028 () Bool)

(assert (=> b!188475 (= e!124032 e!124028)))

(declare-fun res!89097 () Bool)

(assert (=> b!188475 (= res!89097 call!18981)))

(assert (=> b!188475 (=> (not res!89097) (not e!124028))))

(declare-fun bm!18982 () Bool)

(assert (=> bm!18982 (= call!18985 (+!293 (ite c!33880 call!18982 (ite c!33879 call!18979 call!18980)) (ite (or c!33880 c!33879) (tuple2!3437 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3680 thiss!1248)) (tuple2!3437 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3680 thiss!1248)))))))

(declare-fun b!188476 () Bool)

(assert (=> b!188476 (= e!124038 e!124029)))

(declare-fun res!89093 () Bool)

(assert (=> b!188476 (=> (not res!89093) (not e!124029))))

(assert (=> b!188476 (= res!89093 (contains!1310 lt!93339 (select (arr!3770 (_keys!5798 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!188476 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4090 (_keys!5798 thiss!1248))))))

(declare-fun b!188477 () Bool)

(declare-fun c!33881 () Bool)

(assert (=> b!188477 (= c!33881 (and (not (= (bvand (extraKeys!3576 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3576 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!188477 (= e!124030 e!124031)))

(declare-fun b!188478 () Bool)

(assert (=> b!188478 (= e!124028 (= (apply!173 lt!93339 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3680 thiss!1248)))))

(assert (= (and d!55695 c!33880) b!188472))

(assert (= (and d!55695 (not c!33880)) b!188468))

(assert (= (and b!188468 c!33879) b!188469))

(assert (= (and b!188468 (not c!33879)) b!188477))

(assert (= (and b!188477 c!33881) b!188462))

(assert (= (and b!188477 (not c!33881)) b!188465))

(assert (= (or b!188462 b!188465) bm!18978))

(assert (= (or b!188469 bm!18978) bm!18976))

(assert (= (or b!188469 b!188462) bm!18979))

(assert (= (or b!188472 bm!18976) bm!18977))

(assert (= (or b!188472 bm!18979) bm!18982))

(assert (= (and d!55695 res!89090) b!188467))

(assert (= (and d!55695 c!33882) b!188461))

(assert (= (and d!55695 (not c!33882)) b!188473))

(assert (= (and d!55695 res!89098) b!188474))

(assert (= (and b!188474 res!89092) b!188463))

(assert (= (and b!188474 (not res!89096)) b!188476))

(assert (= (and b!188476 res!89093) b!188460))

(assert (= (and b!188474 res!89095) b!188471))

(assert (= (and b!188471 c!33878) b!188475))

(assert (= (and b!188471 (not c!33878)) b!188464))

(assert (= (and b!188475 res!89097) b!188478))

(assert (= (or b!188475 b!188464) bm!18981))

(assert (= (and b!188471 res!89094) b!188458))

(assert (= (and b!188458 c!33877) b!188470))

(assert (= (and b!188458 (not c!33877)) b!188466))

(assert (= (and b!188470 res!89091) b!188459))

(assert (= (or b!188470 b!188466) bm!18980))

(declare-fun b_lambda!7333 () Bool)

(assert (=> (not b_lambda!7333) (not b!188460)))

(declare-fun t!7247 () Bool)

(declare-fun tb!2849 () Bool)

(assert (=> (and b!188315 (= (defaultEntry!3839 thiss!1248) (defaultEntry!3839 thiss!1248)) t!7247) tb!2849))

(declare-fun result!4841 () Bool)

(assert (=> tb!2849 (= result!4841 tp_is_empty!4393)))

(assert (=> b!188460 t!7247))

(declare-fun b_and!11271 () Bool)

(assert (= b_and!11265 (and (=> t!7247 result!4841) b_and!11271)))

(assert (=> b!188460 m!215221))

(declare-fun m!215247 () Bool)

(assert (=> b!188460 m!215247))

(declare-fun m!215249 () Bool)

(assert (=> b!188460 m!215249))

(declare-fun m!215251 () Bool)

(assert (=> b!188460 m!215251))

(declare-fun m!215253 () Bool)

(assert (=> b!188460 m!215253))

(assert (=> b!188460 m!215251))

(assert (=> b!188460 m!215249))

(assert (=> b!188460 m!215221))

(declare-fun m!215255 () Bool)

(assert (=> b!188472 m!215255))

(declare-fun m!215257 () Bool)

(assert (=> bm!18981 m!215257))

(declare-fun m!215259 () Bool)

(assert (=> b!188478 m!215259))

(declare-fun m!215261 () Bool)

(assert (=> b!188459 m!215261))

(declare-fun m!215263 () Bool)

(assert (=> bm!18977 m!215263))

(assert (=> b!188467 m!215221))

(assert (=> b!188467 m!215221))

(assert (=> b!188467 m!215223))

(declare-fun m!215265 () Bool)

(assert (=> bm!18980 m!215265))

(assert (=> b!188476 m!215221))

(assert (=> b!188476 m!215221))

(declare-fun m!215267 () Bool)

(assert (=> b!188476 m!215267))

(declare-fun m!215269 () Bool)

(assert (=> bm!18982 m!215269))

(assert (=> b!188463 m!215221))

(assert (=> b!188463 m!215221))

(assert (=> b!188463 m!215223))

(assert (=> d!55695 m!215163))

(declare-fun m!215271 () Bool)

(assert (=> b!188461 m!215271))

(declare-fun m!215273 () Bool)

(assert (=> b!188461 m!215273))

(declare-fun m!215275 () Bool)

(assert (=> b!188461 m!215275))

(declare-fun m!215277 () Bool)

(assert (=> b!188461 m!215277))

(declare-fun m!215279 () Bool)

(assert (=> b!188461 m!215279))

(assert (=> b!188461 m!215263))

(declare-fun m!215281 () Bool)

(assert (=> b!188461 m!215281))

(declare-fun m!215283 () Bool)

(assert (=> b!188461 m!215283))

(assert (=> b!188461 m!215273))

(declare-fun m!215285 () Bool)

(assert (=> b!188461 m!215285))

(declare-fun m!215287 () Bool)

(assert (=> b!188461 m!215287))

(assert (=> b!188461 m!215277))

(declare-fun m!215289 () Bool)

(assert (=> b!188461 m!215289))

(declare-fun m!215291 () Bool)

(assert (=> b!188461 m!215291))

(declare-fun m!215293 () Bool)

(assert (=> b!188461 m!215293))

(declare-fun m!215295 () Bool)

(assert (=> b!188461 m!215295))

(assert (=> b!188461 m!215289))

(declare-fun m!215297 () Bool)

(assert (=> b!188461 m!215297))

(assert (=> b!188461 m!215281))

(declare-fun m!215299 () Bool)

(assert (=> b!188461 m!215299))

(assert (=> b!188461 m!215221))

(assert (=> b!188316 d!55695))

(declare-fun d!55697 () Bool)

(assert (=> d!55697 (= (array_inv!2433 (_keys!5798 thiss!1248)) (bvsge (size!4090 (_keys!5798 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!188315 d!55697))

(declare-fun d!55699 () Bool)

(assert (=> d!55699 (= (array_inv!2434 (_values!3822 thiss!1248)) (bvsge (size!4091 (_values!3822 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!188315 d!55699))

(declare-fun b!188493 () Bool)

(declare-fun e!124047 () SeekEntryResult!645)

(assert (=> b!188493 (= e!124047 Undefined!645)))

(declare-fun b!188494 () Bool)

(declare-fun e!124046 () SeekEntryResult!645)

(assert (=> b!188494 (= e!124047 e!124046)))

(declare-fun lt!93357 () (_ BitVec 64))

(declare-fun lt!93358 () SeekEntryResult!645)

(assert (=> b!188494 (= lt!93357 (select (arr!3770 (_keys!5798 thiss!1248)) (index!4752 lt!93358)))))

(declare-fun c!33889 () Bool)

(assert (=> b!188494 (= c!33889 (= lt!93357 key!828))))

(declare-fun b!188495 () Bool)

(declare-fun e!124045 () SeekEntryResult!645)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7993 (_ BitVec 32)) SeekEntryResult!645)

(assert (=> b!188495 (= e!124045 (seekKeyOrZeroReturnVacant!0 (x!20331 lt!93358) (index!4752 lt!93358) (index!4752 lt!93358) key!828 (_keys!5798 thiss!1248) (mask!9002 thiss!1248)))))

(declare-fun b!188496 () Bool)

(assert (=> b!188496 (= e!124046 (Found!645 (index!4752 lt!93358)))))

(declare-fun d!55701 () Bool)

(declare-fun lt!93356 () SeekEntryResult!645)

(assert (=> d!55701 (and (or ((_ is Undefined!645) lt!93356) (not ((_ is Found!645) lt!93356)) (and (bvsge (index!4751 lt!93356) #b00000000000000000000000000000000) (bvslt (index!4751 lt!93356) (size!4090 (_keys!5798 thiss!1248))))) (or ((_ is Undefined!645) lt!93356) ((_ is Found!645) lt!93356) (not ((_ is MissingZero!645) lt!93356)) (and (bvsge (index!4750 lt!93356) #b00000000000000000000000000000000) (bvslt (index!4750 lt!93356) (size!4090 (_keys!5798 thiss!1248))))) (or ((_ is Undefined!645) lt!93356) ((_ is Found!645) lt!93356) ((_ is MissingZero!645) lt!93356) (not ((_ is MissingVacant!645) lt!93356)) (and (bvsge (index!4753 lt!93356) #b00000000000000000000000000000000) (bvslt (index!4753 lt!93356) (size!4090 (_keys!5798 thiss!1248))))) (or ((_ is Undefined!645) lt!93356) (ite ((_ is Found!645) lt!93356) (= (select (arr!3770 (_keys!5798 thiss!1248)) (index!4751 lt!93356)) key!828) (ite ((_ is MissingZero!645) lt!93356) (= (select (arr!3770 (_keys!5798 thiss!1248)) (index!4750 lt!93356)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!645) lt!93356) (= (select (arr!3770 (_keys!5798 thiss!1248)) (index!4753 lt!93356)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!55701 (= lt!93356 e!124047)))

(declare-fun c!33891 () Bool)

(assert (=> d!55701 (= c!33891 (and ((_ is Intermediate!645) lt!93358) (undefined!1457 lt!93358)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7993 (_ BitVec 32)) SeekEntryResult!645)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55701 (= lt!93358 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9002 thiss!1248)) key!828 (_keys!5798 thiss!1248) (mask!9002 thiss!1248)))))

(assert (=> d!55701 (validMask!0 (mask!9002 thiss!1248))))

(assert (=> d!55701 (= (seekEntryOrOpen!0 key!828 (_keys!5798 thiss!1248) (mask!9002 thiss!1248)) lt!93356)))

(declare-fun b!188497 () Bool)

(assert (=> b!188497 (= e!124045 (MissingZero!645 (index!4752 lt!93358)))))

(declare-fun b!188498 () Bool)

(declare-fun c!33890 () Bool)

(assert (=> b!188498 (= c!33890 (= lt!93357 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!188498 (= e!124046 e!124045)))

(assert (= (and d!55701 c!33891) b!188493))

(assert (= (and d!55701 (not c!33891)) b!188494))

(assert (= (and b!188494 c!33889) b!188496))

(assert (= (and b!188494 (not c!33889)) b!188498))

(assert (= (and b!188498 c!33890) b!188497))

(assert (= (and b!188498 (not c!33890)) b!188495))

(declare-fun m!215301 () Bool)

(assert (=> b!188494 m!215301))

(declare-fun m!215303 () Bool)

(assert (=> b!188495 m!215303))

(assert (=> d!55701 m!215163))

(declare-fun m!215305 () Bool)

(assert (=> d!55701 m!215305))

(assert (=> d!55701 m!215305))

(declare-fun m!215307 () Bool)

(assert (=> d!55701 m!215307))

(declare-fun m!215309 () Bool)

(assert (=> d!55701 m!215309))

(declare-fun m!215311 () Bool)

(assert (=> d!55701 m!215311))

(declare-fun m!215313 () Bool)

(assert (=> d!55701 m!215313))

(assert (=> b!188306 d!55701))

(declare-fun d!55703 () Bool)

(declare-fun res!89105 () Bool)

(declare-fun e!124050 () Bool)

(assert (=> d!55703 (=> (not res!89105) (not e!124050))))

(declare-fun simpleValid!189 (LongMapFixedSize!2614) Bool)

(assert (=> d!55703 (= res!89105 (simpleValid!189 thiss!1248))))

(assert (=> d!55703 (= (valid!1102 thiss!1248) e!124050)))

(declare-fun b!188505 () Bool)

(declare-fun res!89106 () Bool)

(assert (=> b!188505 (=> (not res!89106) (not e!124050))))

(declare-fun arrayCountValidKeys!0 (array!7993 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!188505 (= res!89106 (= (arrayCountValidKeys!0 (_keys!5798 thiss!1248) #b00000000000000000000000000000000 (size!4090 (_keys!5798 thiss!1248))) (_size!1356 thiss!1248)))))

(declare-fun b!188506 () Bool)

(declare-fun res!89107 () Bool)

(assert (=> b!188506 (=> (not res!89107) (not e!124050))))

(assert (=> b!188506 (= res!89107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5798 thiss!1248) (mask!9002 thiss!1248)))))

(declare-fun b!188507 () Bool)

(declare-datatypes ((List!2358 0))(
  ( (Nil!2355) (Cons!2354 (h!2991 (_ BitVec 64)) (t!7248 List!2358)) )
))
(declare-fun arrayNoDuplicates!0 (array!7993 (_ BitVec 32) List!2358) Bool)

(assert (=> b!188507 (= e!124050 (arrayNoDuplicates!0 (_keys!5798 thiss!1248) #b00000000000000000000000000000000 Nil!2355))))

(assert (= (and d!55703 res!89105) b!188505))

(assert (= (and b!188505 res!89106) b!188506))

(assert (= (and b!188506 res!89107) b!188507))

(declare-fun m!215315 () Bool)

(assert (=> d!55703 m!215315))

(declare-fun m!215317 () Bool)

(assert (=> b!188505 m!215317))

(assert (=> b!188506 m!215157))

(declare-fun m!215319 () Bool)

(assert (=> b!188507 m!215319))

(assert (=> start!19138 d!55703))

(declare-fun b!188524 () Bool)

(declare-fun lt!93364 () SeekEntryResult!645)

(assert (=> b!188524 (and (bvsge (index!4750 lt!93364) #b00000000000000000000000000000000) (bvslt (index!4750 lt!93364) (size!4090 (_keys!5798 thiss!1248))))))

(declare-fun res!89117 () Bool)

(assert (=> b!188524 (= res!89117 (= (select (arr!3770 (_keys!5798 thiss!1248)) (index!4750 lt!93364)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!124062 () Bool)

(assert (=> b!188524 (=> (not res!89117) (not e!124062))))

(declare-fun d!55705 () Bool)

(declare-fun e!124061 () Bool)

(assert (=> d!55705 e!124061))

(declare-fun c!33896 () Bool)

(assert (=> d!55705 (= c!33896 ((_ is MissingZero!645) lt!93364))))

(assert (=> d!55705 (= lt!93364 (seekEntryOrOpen!0 key!828 (_keys!5798 thiss!1248) (mask!9002 thiss!1248)))))

(declare-fun lt!93363 () Unit!5677)

(declare-fun choose!1014 (array!7993 array!7995 (_ BitVec 32) (_ BitVec 32) V!5505 V!5505 (_ BitVec 64) Int) Unit!5677)

(assert (=> d!55705 (= lt!93363 (choose!1014 (_keys!5798 thiss!1248) (_values!3822 thiss!1248) (mask!9002 thiss!1248) (extraKeys!3576 thiss!1248) (zeroValue!3680 thiss!1248) (minValue!3680 thiss!1248) key!828 (defaultEntry!3839 thiss!1248)))))

(assert (=> d!55705 (validMask!0 (mask!9002 thiss!1248))))

(assert (=> d!55705 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!152 (_keys!5798 thiss!1248) (_values!3822 thiss!1248) (mask!9002 thiss!1248) (extraKeys!3576 thiss!1248) (zeroValue!3680 thiss!1248) (minValue!3680 thiss!1248) key!828 (defaultEntry!3839 thiss!1248)) lt!93363)))

(declare-fun bm!18987 () Bool)

(declare-fun call!18991 () Bool)

(assert (=> bm!18987 (= call!18991 (arrayContainsKey!0 (_keys!5798 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!188525 () Bool)

(declare-fun e!124059 () Bool)

(assert (=> b!188525 (= e!124059 (not call!18991))))

(declare-fun b!188526 () Bool)

(declare-fun res!89116 () Bool)

(assert (=> b!188526 (=> (not res!89116) (not e!124059))))

(declare-fun call!18990 () Bool)

(assert (=> b!188526 (= res!89116 call!18990)))

(declare-fun e!124060 () Bool)

(assert (=> b!188526 (= e!124060 e!124059)))

(declare-fun b!188527 () Bool)

(assert (=> b!188527 (= e!124062 (not call!18991))))

(declare-fun b!188528 () Bool)

(declare-fun res!89119 () Bool)

(assert (=> b!188528 (=> (not res!89119) (not e!124059))))

(assert (=> b!188528 (= res!89119 (= (select (arr!3770 (_keys!5798 thiss!1248)) (index!4753 lt!93364)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!188528 (and (bvsge (index!4753 lt!93364) #b00000000000000000000000000000000) (bvslt (index!4753 lt!93364) (size!4090 (_keys!5798 thiss!1248))))))

(declare-fun bm!18988 () Bool)

(assert (=> bm!18988 (= call!18990 (inRange!0 (ite c!33896 (index!4750 lt!93364) (index!4753 lt!93364)) (mask!9002 thiss!1248)))))

(declare-fun b!188529 () Bool)

(assert (=> b!188529 (= e!124061 e!124060)))

(declare-fun c!33897 () Bool)

(assert (=> b!188529 (= c!33897 ((_ is MissingVacant!645) lt!93364))))

(declare-fun b!188530 () Bool)

(assert (=> b!188530 (= e!124060 ((_ is Undefined!645) lt!93364))))

(declare-fun b!188531 () Bool)

(assert (=> b!188531 (= e!124061 e!124062)))

(declare-fun res!89118 () Bool)

(assert (=> b!188531 (= res!89118 call!18990)))

(assert (=> b!188531 (=> (not res!89118) (not e!124062))))

(assert (= (and d!55705 c!33896) b!188531))

(assert (= (and d!55705 (not c!33896)) b!188529))

(assert (= (and b!188531 res!89118) b!188524))

(assert (= (and b!188524 res!89117) b!188527))

(assert (= (and b!188529 c!33897) b!188526))

(assert (= (and b!188529 (not c!33897)) b!188530))

(assert (= (and b!188526 res!89116) b!188528))

(assert (= (and b!188528 res!89119) b!188525))

(assert (= (or b!188531 b!188526) bm!18988))

(assert (= (or b!188527 b!188525) bm!18987))

(assert (=> d!55705 m!215151))

(declare-fun m!215321 () Bool)

(assert (=> d!55705 m!215321))

(assert (=> d!55705 m!215163))

(declare-fun m!215323 () Bool)

(assert (=> b!188524 m!215323))

(declare-fun m!215325 () Bool)

(assert (=> bm!18988 m!215325))

(declare-fun m!215327 () Bool)

(assert (=> bm!18987 m!215327))

(declare-fun m!215329 () Bool)

(assert (=> b!188528 m!215329))

(assert (=> b!188305 d!55705))

(declare-fun mapIsEmpty!7582 () Bool)

(declare-fun mapRes!7582 () Bool)

(assert (=> mapIsEmpty!7582 mapRes!7582))

(declare-fun b!188539 () Bool)

(declare-fun e!124068 () Bool)

(assert (=> b!188539 (= e!124068 tp_is_empty!4393)))

(declare-fun mapNonEmpty!7582 () Bool)

(declare-fun tp!16699 () Bool)

(declare-fun e!124067 () Bool)

(assert (=> mapNonEmpty!7582 (= mapRes!7582 (and tp!16699 e!124067))))

(declare-fun mapRest!7582 () (Array (_ BitVec 32) ValueCell!1853))

(declare-fun mapKey!7582 () (_ BitVec 32))

(declare-fun mapValue!7582 () ValueCell!1853)

(assert (=> mapNonEmpty!7582 (= mapRest!7573 (store mapRest!7582 mapKey!7582 mapValue!7582))))

(declare-fun b!188538 () Bool)

(assert (=> b!188538 (= e!124067 tp_is_empty!4393)))

(declare-fun condMapEmpty!7582 () Bool)

(declare-fun mapDefault!7582 () ValueCell!1853)

(assert (=> mapNonEmpty!7573 (= condMapEmpty!7582 (= mapRest!7573 ((as const (Array (_ BitVec 32) ValueCell!1853)) mapDefault!7582)))))

(assert (=> mapNonEmpty!7573 (= tp!16683 (and e!124068 mapRes!7582))))

(assert (= (and mapNonEmpty!7573 condMapEmpty!7582) mapIsEmpty!7582))

(assert (= (and mapNonEmpty!7573 (not condMapEmpty!7582)) mapNonEmpty!7582))

(assert (= (and mapNonEmpty!7582 ((_ is ValueCellFull!1853) mapValue!7582)) b!188538))

(assert (= (and mapNonEmpty!7573 ((_ is ValueCellFull!1853) mapDefault!7582)) b!188539))

(declare-fun m!215331 () Bool)

(assert (=> mapNonEmpty!7582 m!215331))

(declare-fun b_lambda!7335 () Bool)

(assert (= b_lambda!7333 (or (and b!188315 b_free!4621) b_lambda!7335)))

(check-sat (not mapNonEmpty!7582) (not b!188478) tp_is_empty!4393 (not d!55705) (not b!188460) (not b!188461) b_and!11271 (not bm!18980) (not b!188398) (not b!188415) (not b!188413) (not d!55693) (not b!188397) (not b!188495) (not bm!18982) (not b_next!4621) (not bm!18988) (not b!188505) (not b!188463) (not d!55701) (not b!188472) (not bm!18987) (not b_lambda!7335) (not b!188467) (not bm!18977) (not bm!18961) (not d!55703) (not b!188476) (not bm!18981) (not b!188405) (not d!55695) (not b!188459) (not b!188507) (not b!188506) (not d!55687))
(check-sat b_and!11271 (not b_next!4621))
