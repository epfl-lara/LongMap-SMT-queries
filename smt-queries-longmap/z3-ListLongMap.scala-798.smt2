; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19166 () Bool)

(assert start!19166)

(declare-fun b!188578 () Bool)

(declare-fun b_free!4627 () Bool)

(declare-fun b_next!4627 () Bool)

(assert (=> b!188578 (= b_free!4627 (not b_next!4627))))

(declare-fun tp!16704 () Bool)

(declare-fun b_and!11273 () Bool)

(assert (=> b!188578 (= tp!16704 b_and!11273)))

(declare-fun res!89139 () Bool)

(declare-fun e!124094 () Bool)

(assert (=> start!19166 (=> (not res!89139) (not e!124094))))

(declare-datatypes ((V!5513 0))(
  ( (V!5514 (val!2244 Int)) )
))
(declare-datatypes ((ValueCell!1856 0))(
  ( (ValueCellFull!1856 (v!4163 V!5513)) (EmptyCell!1856) )
))
(declare-datatypes ((array!8007 0))(
  ( (array!8008 (arr!3776 (Array (_ BitVec 32) (_ BitVec 64))) (size!4096 (_ BitVec 32))) )
))
(declare-datatypes ((array!8009 0))(
  ( (array!8010 (arr!3777 (Array (_ BitVec 32) ValueCell!1856)) (size!4097 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2620 0))(
  ( (LongMapFixedSize!2621 (defaultEntry!3845 Int) (mask!9014 (_ BitVec 32)) (extraKeys!3582 (_ BitVec 32)) (zeroValue!3686 V!5513) (minValue!3686 V!5513) (_size!1359 (_ BitVec 32)) (_keys!5806 array!8007) (_values!3828 array!8009) (_vacant!1359 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2620)

(declare-fun valid!1104 (LongMapFixedSize!2620) Bool)

(assert (=> start!19166 (= res!89139 (valid!1104 thiss!1248))))

(assert (=> start!19166 e!124094))

(declare-fun e!124091 () Bool)

(assert (=> start!19166 e!124091))

(assert (=> start!19166 true))

(declare-datatypes ((SeekEntryResult!647 0))(
  ( (MissingZero!647 (index!4758 (_ BitVec 32))) (Found!647 (index!4759 (_ BitVec 32))) (Intermediate!647 (undefined!1459 Bool) (index!4760 (_ BitVec 32)) (x!20351 (_ BitVec 32))) (Undefined!647) (MissingVacant!647 (index!4761 (_ BitVec 32))) )
))
(declare-fun lt!93376 () SeekEntryResult!647)

(declare-fun b!188566 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun e!124098 () Bool)

(assert (=> b!188566 (= e!124098 (= (select (arr!3776 (_keys!5806 thiss!1248)) (index!4759 lt!93376)) key!828))))

(declare-fun mapIsEmpty!7585 () Bool)

(declare-fun mapRes!7585 () Bool)

(assert (=> mapIsEmpty!7585 mapRes!7585))

(declare-fun b!188567 () Bool)

(declare-fun res!89135 () Bool)

(assert (=> b!188567 (=> (not res!89135) (not e!124094))))

(assert (=> b!188567 (= res!89135 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!7585 () Bool)

(declare-fun tp!16705 () Bool)

(declare-fun e!124093 () Bool)

(assert (=> mapNonEmpty!7585 (= mapRes!7585 (and tp!16705 e!124093))))

(declare-fun mapValue!7585 () ValueCell!1856)

(declare-fun mapRest!7585 () (Array (_ BitVec 32) ValueCell!1856))

(declare-fun mapKey!7585 () (_ BitVec 32))

(assert (=> mapNonEmpty!7585 (= (arr!3777 (_values!3828 thiss!1248)) (store mapRest!7585 mapKey!7585 mapValue!7585))))

(declare-fun b!188568 () Bool)

(declare-fun e!124090 () Bool)

(declare-fun e!124097 () Bool)

(assert (=> b!188568 (= e!124090 (and e!124097 mapRes!7585))))

(declare-fun condMapEmpty!7585 () Bool)

(declare-fun mapDefault!7585 () ValueCell!1856)

(assert (=> b!188568 (= condMapEmpty!7585 (= (arr!3777 (_values!3828 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1856)) mapDefault!7585)))))

(declare-fun b!188569 () Bool)

(declare-fun e!124096 () Bool)

(declare-datatypes ((List!2359 0))(
  ( (Nil!2356) (Cons!2355 (h!2992 (_ BitVec 64)) (t!7249 List!2359)) )
))
(declare-fun arrayNoDuplicates!0 (array!8007 (_ BitVec 32) List!2359) Bool)

(assert (=> b!188569 (= e!124096 (not (arrayNoDuplicates!0 (_keys!5806 thiss!1248) #b00000000000000000000000000000000 Nil!2356)))))

(declare-fun b!188570 () Bool)

(declare-fun res!89134 () Bool)

(assert (=> b!188570 (=> (not res!89134) (not e!124096))))

(assert (=> b!188570 (= res!89134 (and (= (size!4097 (_values!3828 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9014 thiss!1248))) (= (size!4096 (_keys!5806 thiss!1248)) (size!4097 (_values!3828 thiss!1248))) (bvsge (mask!9014 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3582 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3582 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!188571 () Bool)

(declare-fun e!124089 () Bool)

(assert (=> b!188571 (= e!124089 e!124096)))

(declare-fun res!89138 () Bool)

(assert (=> b!188571 (=> (not res!89138) (not e!124096))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!188571 (= res!89138 (validMask!0 (mask!9014 thiss!1248)))))

(declare-datatypes ((Unit!5685 0))(
  ( (Unit!5686) )
))
(declare-fun lt!93374 () Unit!5685)

(declare-fun e!124095 () Unit!5685)

(assert (=> b!188571 (= lt!93374 e!124095)))

(declare-fun c!33900 () Bool)

(declare-datatypes ((tuple2!3440 0))(
  ( (tuple2!3441 (_1!1731 (_ BitVec 64)) (_2!1731 V!5513)) )
))
(declare-datatypes ((List!2360 0))(
  ( (Nil!2357) (Cons!2356 (h!2993 tuple2!3440) (t!7250 List!2360)) )
))
(declare-datatypes ((ListLongMap!2361 0))(
  ( (ListLongMap!2362 (toList!1196 List!2360)) )
))
(declare-fun contains!1312 (ListLongMap!2361 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!848 (array!8007 array!8009 (_ BitVec 32) (_ BitVec 32) V!5513 V!5513 (_ BitVec 32) Int) ListLongMap!2361)

(assert (=> b!188571 (= c!33900 (contains!1312 (getCurrentListMap!848 (_keys!5806 thiss!1248) (_values!3828 thiss!1248) (mask!9014 thiss!1248) (extraKeys!3582 thiss!1248) (zeroValue!3686 thiss!1248) (minValue!3686 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3845 thiss!1248)) key!828))))

(declare-fun b!188572 () Bool)

(declare-fun res!89137 () Bool)

(assert (=> b!188572 (=> (not res!89137) (not e!124096))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8007 (_ BitVec 32)) Bool)

(assert (=> b!188572 (= res!89137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5806 thiss!1248) (mask!9014 thiss!1248)))))

(declare-fun b!188573 () Bool)

(declare-fun tp_is_empty!4399 () Bool)

(assert (=> b!188573 (= e!124093 tp_is_empty!4399)))

(declare-fun b!188574 () Bool)

(declare-fun lt!93373 () Unit!5685)

(assert (=> b!188574 (= e!124095 lt!93373)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!159 (array!8007 array!8009 (_ BitVec 32) (_ BitVec 32) V!5513 V!5513 (_ BitVec 64) Int) Unit!5685)

(assert (=> b!188574 (= lt!93373 (lemmaInListMapThenSeekEntryOrOpenFindsIt!159 (_keys!5806 thiss!1248) (_values!3828 thiss!1248) (mask!9014 thiss!1248) (extraKeys!3582 thiss!1248) (zeroValue!3686 thiss!1248) (minValue!3686 thiss!1248) key!828 (defaultEntry!3845 thiss!1248)))))

(declare-fun res!89140 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!188574 (= res!89140 (inRange!0 (index!4759 lt!93376) (mask!9014 thiss!1248)))))

(assert (=> b!188574 (=> (not res!89140) (not e!124098))))

(assert (=> b!188574 e!124098))

(declare-fun b!188575 () Bool)

(declare-fun Unit!5687 () Unit!5685)

(assert (=> b!188575 (= e!124095 Unit!5687)))

(declare-fun lt!93375 () Unit!5685)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!154 (array!8007 array!8009 (_ BitVec 32) (_ BitVec 32) V!5513 V!5513 (_ BitVec 64) Int) Unit!5685)

(assert (=> b!188575 (= lt!93375 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!154 (_keys!5806 thiss!1248) (_values!3828 thiss!1248) (mask!9014 thiss!1248) (extraKeys!3582 thiss!1248) (zeroValue!3686 thiss!1248) (minValue!3686 thiss!1248) key!828 (defaultEntry!3845 thiss!1248)))))

(assert (=> b!188575 false))

(declare-fun b!188576 () Bool)

(assert (=> b!188576 (= e!124097 tp_is_empty!4399)))

(declare-fun b!188577 () Bool)

(assert (=> b!188577 (= e!124094 e!124089)))

(declare-fun res!89136 () Bool)

(assert (=> b!188577 (=> (not res!89136) (not e!124089))))

(get-info :version)

(assert (=> b!188577 (= res!89136 (and (not ((_ is Undefined!647) lt!93376)) (not ((_ is MissingVacant!647) lt!93376)) (not ((_ is MissingZero!647) lt!93376)) ((_ is Found!647) lt!93376)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8007 (_ BitVec 32)) SeekEntryResult!647)

(assert (=> b!188577 (= lt!93376 (seekEntryOrOpen!0 key!828 (_keys!5806 thiss!1248) (mask!9014 thiss!1248)))))

(declare-fun array_inv!2435 (array!8007) Bool)

(declare-fun array_inv!2436 (array!8009) Bool)

(assert (=> b!188578 (= e!124091 (and tp!16704 tp_is_empty!4399 (array_inv!2435 (_keys!5806 thiss!1248)) (array_inv!2436 (_values!3828 thiss!1248)) e!124090))))

(assert (= (and start!19166 res!89139) b!188567))

(assert (= (and b!188567 res!89135) b!188577))

(assert (= (and b!188577 res!89136) b!188571))

(assert (= (and b!188571 c!33900) b!188574))

(assert (= (and b!188571 (not c!33900)) b!188575))

(assert (= (and b!188574 res!89140) b!188566))

(assert (= (and b!188571 res!89138) b!188570))

(assert (= (and b!188570 res!89134) b!188572))

(assert (= (and b!188572 res!89137) b!188569))

(assert (= (and b!188568 condMapEmpty!7585) mapIsEmpty!7585))

(assert (= (and b!188568 (not condMapEmpty!7585)) mapNonEmpty!7585))

(assert (= (and mapNonEmpty!7585 ((_ is ValueCellFull!1856) mapValue!7585)) b!188573))

(assert (= (and b!188568 ((_ is ValueCellFull!1856) mapDefault!7585)) b!188576))

(assert (= b!188578 b!188568))

(assert (= start!19166 b!188578))

(declare-fun m!215333 () Bool)

(assert (=> b!188572 m!215333))

(declare-fun m!215335 () Bool)

(assert (=> b!188574 m!215335))

(declare-fun m!215337 () Bool)

(assert (=> b!188574 m!215337))

(declare-fun m!215339 () Bool)

(assert (=> b!188575 m!215339))

(declare-fun m!215341 () Bool)

(assert (=> b!188577 m!215341))

(declare-fun m!215343 () Bool)

(assert (=> b!188569 m!215343))

(declare-fun m!215345 () Bool)

(assert (=> mapNonEmpty!7585 m!215345))

(declare-fun m!215347 () Bool)

(assert (=> b!188566 m!215347))

(declare-fun m!215349 () Bool)

(assert (=> b!188578 m!215349))

(declare-fun m!215351 () Bool)

(assert (=> b!188578 m!215351))

(declare-fun m!215353 () Bool)

(assert (=> start!19166 m!215353))

(declare-fun m!215355 () Bool)

(assert (=> b!188571 m!215355))

(declare-fun m!215357 () Bool)

(assert (=> b!188571 m!215357))

(assert (=> b!188571 m!215357))

(declare-fun m!215359 () Bool)

(assert (=> b!188571 m!215359))

(check-sat (not start!19166) (not b!188578) (not b!188575) (not b!188577) b_and!11273 (not mapNonEmpty!7585) (not b!188571) (not b!188574) tp_is_empty!4399 (not b!188569) (not b!188572) (not b_next!4627))
(check-sat b_and!11273 (not b_next!4627))
(get-model)

(declare-fun bm!18993 () Bool)

(declare-fun call!18996 () Bool)

(declare-fun lt!93405 () SeekEntryResult!647)

(declare-fun c!33912 () Bool)

(assert (=> bm!18993 (= call!18996 (inRange!0 (ite c!33912 (index!4758 lt!93405) (index!4761 lt!93405)) (mask!9014 thiss!1248)))))

(declare-fun b!188673 () Bool)

(declare-fun res!89192 () Bool)

(declare-fun e!124168 () Bool)

(assert (=> b!188673 (=> (not res!89192) (not e!124168))))

(assert (=> b!188673 (= res!89192 (= (select (arr!3776 (_keys!5806 thiss!1248)) (index!4761 lt!93405)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!188673 (and (bvsge (index!4761 lt!93405) #b00000000000000000000000000000000) (bvslt (index!4761 lt!93405) (size!4096 (_keys!5806 thiss!1248))))))

(declare-fun b!188674 () Bool)

(declare-fun call!18997 () Bool)

(assert (=> b!188674 (= e!124168 (not call!18997))))

(declare-fun b!188675 () Bool)

(declare-fun res!89193 () Bool)

(assert (=> b!188675 (=> (not res!89193) (not e!124168))))

(assert (=> b!188675 (= res!89193 call!18996)))

(declare-fun e!124167 () Bool)

(assert (=> b!188675 (= e!124167 e!124168)))

(declare-fun bm!18994 () Bool)

(declare-fun arrayContainsKey!0 (array!8007 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!18994 (= call!18997 (arrayContainsKey!0 (_keys!5806 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!188676 () Bool)

(declare-fun e!124169 () Bool)

(assert (=> b!188676 (= e!124169 (not call!18997))))

(declare-fun b!188677 () Bool)

(declare-fun e!124170 () Bool)

(assert (=> b!188677 (= e!124170 e!124167)))

(declare-fun c!33911 () Bool)

(assert (=> b!188677 (= c!33911 ((_ is MissingVacant!647) lt!93405))))

(declare-fun b!188678 () Bool)

(assert (=> b!188678 (and (bvsge (index!4758 lt!93405) #b00000000000000000000000000000000) (bvslt (index!4758 lt!93405) (size!4096 (_keys!5806 thiss!1248))))))

(declare-fun res!89194 () Bool)

(assert (=> b!188678 (= res!89194 (= (select (arr!3776 (_keys!5806 thiss!1248)) (index!4758 lt!93405)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!188678 (=> (not res!89194) (not e!124169))))

(declare-fun d!55709 () Bool)

(assert (=> d!55709 e!124170))

(assert (=> d!55709 (= c!33912 ((_ is MissingZero!647) lt!93405))))

(assert (=> d!55709 (= lt!93405 (seekEntryOrOpen!0 key!828 (_keys!5806 thiss!1248) (mask!9014 thiss!1248)))))

(declare-fun lt!93406 () Unit!5685)

(declare-fun choose!1015 (array!8007 array!8009 (_ BitVec 32) (_ BitVec 32) V!5513 V!5513 (_ BitVec 64) Int) Unit!5685)

(assert (=> d!55709 (= lt!93406 (choose!1015 (_keys!5806 thiss!1248) (_values!3828 thiss!1248) (mask!9014 thiss!1248) (extraKeys!3582 thiss!1248) (zeroValue!3686 thiss!1248) (minValue!3686 thiss!1248) key!828 (defaultEntry!3845 thiss!1248)))))

(assert (=> d!55709 (validMask!0 (mask!9014 thiss!1248))))

(assert (=> d!55709 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!154 (_keys!5806 thiss!1248) (_values!3828 thiss!1248) (mask!9014 thiss!1248) (extraKeys!3582 thiss!1248) (zeroValue!3686 thiss!1248) (minValue!3686 thiss!1248) key!828 (defaultEntry!3845 thiss!1248)) lt!93406)))

(declare-fun b!188679 () Bool)

(assert (=> b!188679 (= e!124170 e!124169)))

(declare-fun res!89191 () Bool)

(assert (=> b!188679 (= res!89191 call!18996)))

(assert (=> b!188679 (=> (not res!89191) (not e!124169))))

(declare-fun b!188680 () Bool)

(assert (=> b!188680 (= e!124167 ((_ is Undefined!647) lt!93405))))

(assert (= (and d!55709 c!33912) b!188679))

(assert (= (and d!55709 (not c!33912)) b!188677))

(assert (= (and b!188679 res!89191) b!188678))

(assert (= (and b!188678 res!89194) b!188676))

(assert (= (and b!188677 c!33911) b!188675))

(assert (= (and b!188677 (not c!33911)) b!188680))

(assert (= (and b!188675 res!89193) b!188673))

(assert (= (and b!188673 res!89192) b!188674))

(assert (= (or b!188679 b!188675) bm!18993))

(assert (= (or b!188676 b!188674) bm!18994))

(declare-fun m!215417 () Bool)

(assert (=> b!188673 m!215417))

(declare-fun m!215419 () Bool)

(assert (=> b!188678 m!215419))

(assert (=> d!55709 m!215341))

(declare-fun m!215421 () Bool)

(assert (=> d!55709 m!215421))

(assert (=> d!55709 m!215355))

(declare-fun m!215423 () Bool)

(assert (=> bm!18993 m!215423))

(declare-fun m!215425 () Bool)

(assert (=> bm!18994 m!215425))

(assert (=> b!188575 d!55709))

(declare-fun b!188691 () Bool)

(declare-fun e!124182 () Bool)

(declare-fun call!19000 () Bool)

(assert (=> b!188691 (= e!124182 call!19000)))

(declare-fun bm!18997 () Bool)

(declare-fun c!33915 () Bool)

(assert (=> bm!18997 (= call!19000 (arrayNoDuplicates!0 (_keys!5806 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!33915 (Cons!2355 (select (arr!3776 (_keys!5806 thiss!1248)) #b00000000000000000000000000000000) Nil!2356) Nil!2356)))))

(declare-fun b!188692 () Bool)

(declare-fun e!124181 () Bool)

(declare-fun contains!1315 (List!2359 (_ BitVec 64)) Bool)

(assert (=> b!188692 (= e!124181 (contains!1315 Nil!2356 (select (arr!3776 (_keys!5806 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!188693 () Bool)

(assert (=> b!188693 (= e!124182 call!19000)))

(declare-fun b!188694 () Bool)

(declare-fun e!124180 () Bool)

(declare-fun e!124179 () Bool)

(assert (=> b!188694 (= e!124180 e!124179)))

(declare-fun res!89202 () Bool)

(assert (=> b!188694 (=> (not res!89202) (not e!124179))))

(assert (=> b!188694 (= res!89202 (not e!124181))))

(declare-fun res!89203 () Bool)

(assert (=> b!188694 (=> (not res!89203) (not e!124181))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!188694 (= res!89203 (validKeyInArray!0 (select (arr!3776 (_keys!5806 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!55711 () Bool)

(declare-fun res!89201 () Bool)

(assert (=> d!55711 (=> res!89201 e!124180)))

(assert (=> d!55711 (= res!89201 (bvsge #b00000000000000000000000000000000 (size!4096 (_keys!5806 thiss!1248))))))

(assert (=> d!55711 (= (arrayNoDuplicates!0 (_keys!5806 thiss!1248) #b00000000000000000000000000000000 Nil!2356) e!124180)))

(declare-fun b!188695 () Bool)

(assert (=> b!188695 (= e!124179 e!124182)))

(assert (=> b!188695 (= c!33915 (validKeyInArray!0 (select (arr!3776 (_keys!5806 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!55711 (not res!89201)) b!188694))

(assert (= (and b!188694 res!89203) b!188692))

(assert (= (and b!188694 res!89202) b!188695))

(assert (= (and b!188695 c!33915) b!188693))

(assert (= (and b!188695 (not c!33915)) b!188691))

(assert (= (or b!188693 b!188691) bm!18997))

(declare-fun m!215427 () Bool)

(assert (=> bm!18997 m!215427))

(declare-fun m!215429 () Bool)

(assert (=> bm!18997 m!215429))

(assert (=> b!188692 m!215427))

(assert (=> b!188692 m!215427))

(declare-fun m!215431 () Bool)

(assert (=> b!188692 m!215431))

(assert (=> b!188694 m!215427))

(assert (=> b!188694 m!215427))

(declare-fun m!215433 () Bool)

(assert (=> b!188694 m!215433))

(assert (=> b!188695 m!215427))

(assert (=> b!188695 m!215427))

(assert (=> b!188695 m!215433))

(assert (=> b!188569 d!55711))

(declare-fun d!55713 () Bool)

(declare-fun res!89210 () Bool)

(declare-fun e!124185 () Bool)

(assert (=> d!55713 (=> (not res!89210) (not e!124185))))

(declare-fun simpleValid!190 (LongMapFixedSize!2620) Bool)

(assert (=> d!55713 (= res!89210 (simpleValid!190 thiss!1248))))

(assert (=> d!55713 (= (valid!1104 thiss!1248) e!124185)))

(declare-fun b!188702 () Bool)

(declare-fun res!89211 () Bool)

(assert (=> b!188702 (=> (not res!89211) (not e!124185))))

(declare-fun arrayCountValidKeys!0 (array!8007 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!188702 (= res!89211 (= (arrayCountValidKeys!0 (_keys!5806 thiss!1248) #b00000000000000000000000000000000 (size!4096 (_keys!5806 thiss!1248))) (_size!1359 thiss!1248)))))

(declare-fun b!188703 () Bool)

(declare-fun res!89212 () Bool)

(assert (=> b!188703 (=> (not res!89212) (not e!124185))))

(assert (=> b!188703 (= res!89212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5806 thiss!1248) (mask!9014 thiss!1248)))))

(declare-fun b!188704 () Bool)

(assert (=> b!188704 (= e!124185 (arrayNoDuplicates!0 (_keys!5806 thiss!1248) #b00000000000000000000000000000000 Nil!2356))))

(assert (= (and d!55713 res!89210) b!188702))

(assert (= (and b!188702 res!89211) b!188703))

(assert (= (and b!188703 res!89212) b!188704))

(declare-fun m!215435 () Bool)

(assert (=> d!55713 m!215435))

(declare-fun m!215437 () Bool)

(assert (=> b!188702 m!215437))

(assert (=> b!188703 m!215333))

(assert (=> b!188704 m!215343))

(assert (=> start!19166 d!55713))

(declare-fun d!55715 () Bool)

(assert (=> d!55715 (= (validMask!0 (mask!9014 thiss!1248)) (and (or (= (mask!9014 thiss!1248) #b00000000000000000000000000000111) (= (mask!9014 thiss!1248) #b00000000000000000000000000001111) (= (mask!9014 thiss!1248) #b00000000000000000000000000011111) (= (mask!9014 thiss!1248) #b00000000000000000000000000111111) (= (mask!9014 thiss!1248) #b00000000000000000000000001111111) (= (mask!9014 thiss!1248) #b00000000000000000000000011111111) (= (mask!9014 thiss!1248) #b00000000000000000000000111111111) (= (mask!9014 thiss!1248) #b00000000000000000000001111111111) (= (mask!9014 thiss!1248) #b00000000000000000000011111111111) (= (mask!9014 thiss!1248) #b00000000000000000000111111111111) (= (mask!9014 thiss!1248) #b00000000000000000001111111111111) (= (mask!9014 thiss!1248) #b00000000000000000011111111111111) (= (mask!9014 thiss!1248) #b00000000000000000111111111111111) (= (mask!9014 thiss!1248) #b00000000000000001111111111111111) (= (mask!9014 thiss!1248) #b00000000000000011111111111111111) (= (mask!9014 thiss!1248) #b00000000000000111111111111111111) (= (mask!9014 thiss!1248) #b00000000000001111111111111111111) (= (mask!9014 thiss!1248) #b00000000000011111111111111111111) (= (mask!9014 thiss!1248) #b00000000000111111111111111111111) (= (mask!9014 thiss!1248) #b00000000001111111111111111111111) (= (mask!9014 thiss!1248) #b00000000011111111111111111111111) (= (mask!9014 thiss!1248) #b00000000111111111111111111111111) (= (mask!9014 thiss!1248) #b00000001111111111111111111111111) (= (mask!9014 thiss!1248) #b00000011111111111111111111111111) (= (mask!9014 thiss!1248) #b00000111111111111111111111111111) (= (mask!9014 thiss!1248) #b00001111111111111111111111111111) (= (mask!9014 thiss!1248) #b00011111111111111111111111111111) (= (mask!9014 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9014 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!188571 d!55715))

(declare-fun d!55717 () Bool)

(declare-fun e!124191 () Bool)

(assert (=> d!55717 e!124191))

(declare-fun res!89215 () Bool)

(assert (=> d!55717 (=> res!89215 e!124191)))

(declare-fun lt!93417 () Bool)

(assert (=> d!55717 (= res!89215 (not lt!93417))))

(declare-fun lt!93418 () Bool)

(assert (=> d!55717 (= lt!93417 lt!93418)))

(declare-fun lt!93416 () Unit!5685)

(declare-fun e!124190 () Unit!5685)

(assert (=> d!55717 (= lt!93416 e!124190)))

(declare-fun c!33918 () Bool)

(assert (=> d!55717 (= c!33918 lt!93418)))

(declare-fun containsKey!235 (List!2360 (_ BitVec 64)) Bool)

(assert (=> d!55717 (= lt!93418 (containsKey!235 (toList!1196 (getCurrentListMap!848 (_keys!5806 thiss!1248) (_values!3828 thiss!1248) (mask!9014 thiss!1248) (extraKeys!3582 thiss!1248) (zeroValue!3686 thiss!1248) (minValue!3686 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3845 thiss!1248))) key!828))))

(assert (=> d!55717 (= (contains!1312 (getCurrentListMap!848 (_keys!5806 thiss!1248) (_values!3828 thiss!1248) (mask!9014 thiss!1248) (extraKeys!3582 thiss!1248) (zeroValue!3686 thiss!1248) (minValue!3686 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3845 thiss!1248)) key!828) lt!93417)))

(declare-fun b!188711 () Bool)

(declare-fun lt!93415 () Unit!5685)

(assert (=> b!188711 (= e!124190 lt!93415)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!183 (List!2360 (_ BitVec 64)) Unit!5685)

(assert (=> b!188711 (= lt!93415 (lemmaContainsKeyImpliesGetValueByKeyDefined!183 (toList!1196 (getCurrentListMap!848 (_keys!5806 thiss!1248) (_values!3828 thiss!1248) (mask!9014 thiss!1248) (extraKeys!3582 thiss!1248) (zeroValue!3686 thiss!1248) (minValue!3686 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3845 thiss!1248))) key!828))))

(declare-datatypes ((Option!238 0))(
  ( (Some!237 (v!4166 V!5513)) (None!236) )
))
(declare-fun isDefined!184 (Option!238) Bool)

(declare-fun getValueByKey!232 (List!2360 (_ BitVec 64)) Option!238)

(assert (=> b!188711 (isDefined!184 (getValueByKey!232 (toList!1196 (getCurrentListMap!848 (_keys!5806 thiss!1248) (_values!3828 thiss!1248) (mask!9014 thiss!1248) (extraKeys!3582 thiss!1248) (zeroValue!3686 thiss!1248) (minValue!3686 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3845 thiss!1248))) key!828))))

(declare-fun b!188712 () Bool)

(declare-fun Unit!5693 () Unit!5685)

(assert (=> b!188712 (= e!124190 Unit!5693)))

(declare-fun b!188713 () Bool)

(assert (=> b!188713 (= e!124191 (isDefined!184 (getValueByKey!232 (toList!1196 (getCurrentListMap!848 (_keys!5806 thiss!1248) (_values!3828 thiss!1248) (mask!9014 thiss!1248) (extraKeys!3582 thiss!1248) (zeroValue!3686 thiss!1248) (minValue!3686 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3845 thiss!1248))) key!828)))))

(assert (= (and d!55717 c!33918) b!188711))

(assert (= (and d!55717 (not c!33918)) b!188712))

(assert (= (and d!55717 (not res!89215)) b!188713))

(declare-fun m!215439 () Bool)

(assert (=> d!55717 m!215439))

(declare-fun m!215441 () Bool)

(assert (=> b!188711 m!215441))

(declare-fun m!215443 () Bool)

(assert (=> b!188711 m!215443))

(assert (=> b!188711 m!215443))

(declare-fun m!215445 () Bool)

(assert (=> b!188711 m!215445))

(assert (=> b!188713 m!215443))

(assert (=> b!188713 m!215443))

(assert (=> b!188713 m!215445))

(assert (=> b!188571 d!55717))

(declare-fun bm!19012 () Bool)

(declare-fun call!19017 () Bool)

(declare-fun lt!93469 () ListLongMap!2361)

(assert (=> bm!19012 (= call!19017 (contains!1312 lt!93469 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19013 () Bool)

(declare-fun call!19020 () Bool)

(assert (=> bm!19013 (= call!19020 (contains!1312 lt!93469 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!33934 () Bool)

(declare-fun call!19021 () ListLongMap!2361)

(declare-fun c!33931 () Bool)

(declare-fun bm!19014 () Bool)

(declare-fun call!19018 () ListLongMap!2361)

(declare-fun call!19015 () ListLongMap!2361)

(declare-fun call!19016 () ListLongMap!2361)

(declare-fun +!294 (ListLongMap!2361 tuple2!3440) ListLongMap!2361)

(assert (=> bm!19014 (= call!19016 (+!294 (ite c!33934 call!19021 (ite c!33931 call!19015 call!19018)) (ite (or c!33934 c!33931) (tuple2!3441 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3686 thiss!1248)) (tuple2!3441 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3686 thiss!1248)))))))

(declare-fun b!188756 () Bool)

(declare-fun c!33933 () Bool)

(assert (=> b!188756 (= c!33933 (and (not (= (bvand (extraKeys!3582 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3582 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!124229 () ListLongMap!2361)

(declare-fun e!124220 () ListLongMap!2361)

(assert (=> b!188756 (= e!124229 e!124220)))

(declare-fun b!188757 () Bool)

(declare-fun call!19019 () ListLongMap!2361)

(assert (=> b!188757 (= e!124220 call!19019)))

(declare-fun b!188758 () Bool)

(assert (=> b!188758 (= e!124229 call!19019)))

(declare-fun d!55719 () Bool)

(declare-fun e!124222 () Bool)

(assert (=> d!55719 e!124222))

(declare-fun res!89237 () Bool)

(assert (=> d!55719 (=> (not res!89237) (not e!124222))))

(assert (=> d!55719 (= res!89237 (or (bvsge #b00000000000000000000000000000000 (size!4096 (_keys!5806 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4096 (_keys!5806 thiss!1248))))))))

(declare-fun lt!93481 () ListLongMap!2361)

(assert (=> d!55719 (= lt!93469 lt!93481)))

(declare-fun lt!93479 () Unit!5685)

(declare-fun e!124230 () Unit!5685)

(assert (=> d!55719 (= lt!93479 e!124230)))

(declare-fun c!33936 () Bool)

(declare-fun e!124224 () Bool)

(assert (=> d!55719 (= c!33936 e!124224)))

(declare-fun res!89242 () Bool)

(assert (=> d!55719 (=> (not res!89242) (not e!124224))))

(assert (=> d!55719 (= res!89242 (bvslt #b00000000000000000000000000000000 (size!4096 (_keys!5806 thiss!1248))))))

(declare-fun e!124218 () ListLongMap!2361)

(assert (=> d!55719 (= lt!93481 e!124218)))

(assert (=> d!55719 (= c!33934 (and (not (= (bvand (extraKeys!3582 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3582 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55719 (validMask!0 (mask!9014 thiss!1248))))

(assert (=> d!55719 (= (getCurrentListMap!848 (_keys!5806 thiss!1248) (_values!3828 thiss!1248) (mask!9014 thiss!1248) (extraKeys!3582 thiss!1248) (zeroValue!3686 thiss!1248) (minValue!3686 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3845 thiss!1248)) lt!93469)))

(declare-fun b!188759 () Bool)

(declare-fun e!124226 () Bool)

(declare-fun apply!174 (ListLongMap!2361 (_ BitVec 64)) V!5513)

(declare-fun get!2187 (ValueCell!1856 V!5513) V!5513)

(declare-fun dynLambda!517 (Int (_ BitVec 64)) V!5513)

(assert (=> b!188759 (= e!124226 (= (apply!174 lt!93469 (select (arr!3776 (_keys!5806 thiss!1248)) #b00000000000000000000000000000000)) (get!2187 (select (arr!3777 (_values!3828 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!517 (defaultEntry!3845 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!188759 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4097 (_values!3828 thiss!1248))))))

(assert (=> b!188759 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4096 (_keys!5806 thiss!1248))))))

(declare-fun b!188760 () Bool)

(declare-fun e!124227 () Bool)

(assert (=> b!188760 (= e!124227 (= (apply!174 lt!93469 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3686 thiss!1248)))))

(declare-fun b!188761 () Bool)

(assert (=> b!188761 (= e!124218 (+!294 call!19016 (tuple2!3441 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3686 thiss!1248))))))

(declare-fun bm!19015 () Bool)

(assert (=> bm!19015 (= call!19018 call!19015)))

(declare-fun b!188762 () Bool)

(declare-fun e!124221 () Bool)

(assert (=> b!188762 (= e!124221 (not call!19017))))

(declare-fun b!188763 () Bool)

(assert (=> b!188763 (= e!124218 e!124229)))

(assert (=> b!188763 (= c!33931 (and (not (= (bvand (extraKeys!3582 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3582 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!188764 () Bool)

(assert (=> b!188764 (= e!124224 (validKeyInArray!0 (select (arr!3776 (_keys!5806 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!188765 () Bool)

(declare-fun e!124219 () Bool)

(assert (=> b!188765 (= e!124222 e!124219)))

(declare-fun c!33932 () Bool)

(assert (=> b!188765 (= c!33932 (not (= (bvand (extraKeys!3582 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19016 () Bool)

(assert (=> bm!19016 (= call!19019 call!19016)))

(declare-fun b!188766 () Bool)

(assert (=> b!188766 (= e!124219 (not call!19020))))

(declare-fun b!188767 () Bool)

(assert (=> b!188767 (= e!124219 e!124227)))

(declare-fun res!89235 () Bool)

(assert (=> b!188767 (= res!89235 call!19020)))

(assert (=> b!188767 (=> (not res!89235) (not e!124227))))

(declare-fun b!188768 () Bool)

(declare-fun lt!93475 () Unit!5685)

(assert (=> b!188768 (= e!124230 lt!93475)))

(declare-fun lt!93484 () ListLongMap!2361)

(declare-fun getCurrentListMapNoExtraKeys!205 (array!8007 array!8009 (_ BitVec 32) (_ BitVec 32) V!5513 V!5513 (_ BitVec 32) Int) ListLongMap!2361)

(assert (=> b!188768 (= lt!93484 (getCurrentListMapNoExtraKeys!205 (_keys!5806 thiss!1248) (_values!3828 thiss!1248) (mask!9014 thiss!1248) (extraKeys!3582 thiss!1248) (zeroValue!3686 thiss!1248) (minValue!3686 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3845 thiss!1248)))))

(declare-fun lt!93470 () (_ BitVec 64))

(assert (=> b!188768 (= lt!93470 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93482 () (_ BitVec 64))

(assert (=> b!188768 (= lt!93482 (select (arr!3776 (_keys!5806 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93464 () Unit!5685)

(declare-fun addStillContains!150 (ListLongMap!2361 (_ BitVec 64) V!5513 (_ BitVec 64)) Unit!5685)

(assert (=> b!188768 (= lt!93464 (addStillContains!150 lt!93484 lt!93470 (zeroValue!3686 thiss!1248) lt!93482))))

(assert (=> b!188768 (contains!1312 (+!294 lt!93484 (tuple2!3441 lt!93470 (zeroValue!3686 thiss!1248))) lt!93482)))

(declare-fun lt!93478 () Unit!5685)

(assert (=> b!188768 (= lt!93478 lt!93464)))

(declare-fun lt!93480 () ListLongMap!2361)

(assert (=> b!188768 (= lt!93480 (getCurrentListMapNoExtraKeys!205 (_keys!5806 thiss!1248) (_values!3828 thiss!1248) (mask!9014 thiss!1248) (extraKeys!3582 thiss!1248) (zeroValue!3686 thiss!1248) (minValue!3686 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3845 thiss!1248)))))

(declare-fun lt!93468 () (_ BitVec 64))

(assert (=> b!188768 (= lt!93468 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93476 () (_ BitVec 64))

(assert (=> b!188768 (= lt!93476 (select (arr!3776 (_keys!5806 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93466 () Unit!5685)

(declare-fun addApplyDifferent!150 (ListLongMap!2361 (_ BitVec 64) V!5513 (_ BitVec 64)) Unit!5685)

(assert (=> b!188768 (= lt!93466 (addApplyDifferent!150 lt!93480 lt!93468 (minValue!3686 thiss!1248) lt!93476))))

(assert (=> b!188768 (= (apply!174 (+!294 lt!93480 (tuple2!3441 lt!93468 (minValue!3686 thiss!1248))) lt!93476) (apply!174 lt!93480 lt!93476))))

(declare-fun lt!93465 () Unit!5685)

(assert (=> b!188768 (= lt!93465 lt!93466)))

(declare-fun lt!93483 () ListLongMap!2361)

(assert (=> b!188768 (= lt!93483 (getCurrentListMapNoExtraKeys!205 (_keys!5806 thiss!1248) (_values!3828 thiss!1248) (mask!9014 thiss!1248) (extraKeys!3582 thiss!1248) (zeroValue!3686 thiss!1248) (minValue!3686 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3845 thiss!1248)))))

(declare-fun lt!93473 () (_ BitVec 64))

(assert (=> b!188768 (= lt!93473 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93463 () (_ BitVec 64))

(assert (=> b!188768 (= lt!93463 (select (arr!3776 (_keys!5806 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93474 () Unit!5685)

(assert (=> b!188768 (= lt!93474 (addApplyDifferent!150 lt!93483 lt!93473 (zeroValue!3686 thiss!1248) lt!93463))))

(assert (=> b!188768 (= (apply!174 (+!294 lt!93483 (tuple2!3441 lt!93473 (zeroValue!3686 thiss!1248))) lt!93463) (apply!174 lt!93483 lt!93463))))

(declare-fun lt!93472 () Unit!5685)

(assert (=> b!188768 (= lt!93472 lt!93474)))

(declare-fun lt!93471 () ListLongMap!2361)

(assert (=> b!188768 (= lt!93471 (getCurrentListMapNoExtraKeys!205 (_keys!5806 thiss!1248) (_values!3828 thiss!1248) (mask!9014 thiss!1248) (extraKeys!3582 thiss!1248) (zeroValue!3686 thiss!1248) (minValue!3686 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3845 thiss!1248)))))

(declare-fun lt!93467 () (_ BitVec 64))

(assert (=> b!188768 (= lt!93467 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93477 () (_ BitVec 64))

(assert (=> b!188768 (= lt!93477 (select (arr!3776 (_keys!5806 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!188768 (= lt!93475 (addApplyDifferent!150 lt!93471 lt!93467 (minValue!3686 thiss!1248) lt!93477))))

(assert (=> b!188768 (= (apply!174 (+!294 lt!93471 (tuple2!3441 lt!93467 (minValue!3686 thiss!1248))) lt!93477) (apply!174 lt!93471 lt!93477))))

(declare-fun b!188769 () Bool)

(declare-fun e!124228 () Bool)

(assert (=> b!188769 (= e!124228 (validKeyInArray!0 (select (arr!3776 (_keys!5806 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!188770 () Bool)

(declare-fun res!89236 () Bool)

(assert (=> b!188770 (=> (not res!89236) (not e!124222))))

(assert (=> b!188770 (= res!89236 e!124221)))

(declare-fun c!33935 () Bool)

(assert (=> b!188770 (= c!33935 (not (= (bvand (extraKeys!3582 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!188771 () Bool)

(declare-fun res!89239 () Bool)

(assert (=> b!188771 (=> (not res!89239) (not e!124222))))

(declare-fun e!124223 () Bool)

(assert (=> b!188771 (= res!89239 e!124223)))

(declare-fun res!89234 () Bool)

(assert (=> b!188771 (=> res!89234 e!124223)))

(assert (=> b!188771 (= res!89234 (not e!124228))))

(declare-fun res!89240 () Bool)

(assert (=> b!188771 (=> (not res!89240) (not e!124228))))

(assert (=> b!188771 (= res!89240 (bvslt #b00000000000000000000000000000000 (size!4096 (_keys!5806 thiss!1248))))))

(declare-fun b!188772 () Bool)

(assert (=> b!188772 (= e!124220 call!19018)))

(declare-fun b!188773 () Bool)

(declare-fun Unit!5694 () Unit!5685)

(assert (=> b!188773 (= e!124230 Unit!5694)))

(declare-fun b!188774 () Bool)

(declare-fun e!124225 () Bool)

(assert (=> b!188774 (= e!124221 e!124225)))

(declare-fun res!89238 () Bool)

(assert (=> b!188774 (= res!89238 call!19017)))

(assert (=> b!188774 (=> (not res!89238) (not e!124225))))

(declare-fun b!188775 () Bool)

(assert (=> b!188775 (= e!124223 e!124226)))

(declare-fun res!89241 () Bool)

(assert (=> b!188775 (=> (not res!89241) (not e!124226))))

(assert (=> b!188775 (= res!89241 (contains!1312 lt!93469 (select (arr!3776 (_keys!5806 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!188775 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4096 (_keys!5806 thiss!1248))))))

(declare-fun bm!19017 () Bool)

(assert (=> bm!19017 (= call!19021 (getCurrentListMapNoExtraKeys!205 (_keys!5806 thiss!1248) (_values!3828 thiss!1248) (mask!9014 thiss!1248) (extraKeys!3582 thiss!1248) (zeroValue!3686 thiss!1248) (minValue!3686 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3845 thiss!1248)))))

(declare-fun b!188776 () Bool)

(assert (=> b!188776 (= e!124225 (= (apply!174 lt!93469 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3686 thiss!1248)))))

(declare-fun bm!19018 () Bool)

(assert (=> bm!19018 (= call!19015 call!19021)))

(assert (= (and d!55719 c!33934) b!188761))

(assert (= (and d!55719 (not c!33934)) b!188763))

(assert (= (and b!188763 c!33931) b!188758))

(assert (= (and b!188763 (not c!33931)) b!188756))

(assert (= (and b!188756 c!33933) b!188757))

(assert (= (and b!188756 (not c!33933)) b!188772))

(assert (= (or b!188757 b!188772) bm!19015))

(assert (= (or b!188758 bm!19015) bm!19018))

(assert (= (or b!188758 b!188757) bm!19016))

(assert (= (or b!188761 bm!19018) bm!19017))

(assert (= (or b!188761 bm!19016) bm!19014))

(assert (= (and d!55719 res!89242) b!188764))

(assert (= (and d!55719 c!33936) b!188768))

(assert (= (and d!55719 (not c!33936)) b!188773))

(assert (= (and d!55719 res!89237) b!188771))

(assert (= (and b!188771 res!89240) b!188769))

(assert (= (and b!188771 (not res!89234)) b!188775))

(assert (= (and b!188775 res!89241) b!188759))

(assert (= (and b!188771 res!89239) b!188770))

(assert (= (and b!188770 c!33935) b!188774))

(assert (= (and b!188770 (not c!33935)) b!188762))

(assert (= (and b!188774 res!89238) b!188776))

(assert (= (or b!188774 b!188762) bm!19012))

(assert (= (and b!188770 res!89236) b!188765))

(assert (= (and b!188765 c!33932) b!188767))

(assert (= (and b!188765 (not c!33932)) b!188766))

(assert (= (and b!188767 res!89235) b!188760))

(assert (= (or b!188767 b!188766) bm!19013))

(declare-fun b_lambda!7337 () Bool)

(assert (=> (not b_lambda!7337) (not b!188759)))

(declare-fun t!7255 () Bool)

(declare-fun tb!2851 () Bool)

(assert (=> (and b!188578 (= (defaultEntry!3845 thiss!1248) (defaultEntry!3845 thiss!1248)) t!7255) tb!2851))

(declare-fun result!4847 () Bool)

(assert (=> tb!2851 (= result!4847 tp_is_empty!4399)))

(assert (=> b!188759 t!7255))

(declare-fun b_and!11279 () Bool)

(assert (= b_and!11273 (and (=> t!7255 result!4847) b_and!11279)))

(declare-fun m!215447 () Bool)

(assert (=> b!188761 m!215447))

(declare-fun m!215449 () Bool)

(assert (=> bm!19014 m!215449))

(assert (=> b!188764 m!215427))

(assert (=> b!188764 m!215427))

(assert (=> b!188764 m!215433))

(assert (=> b!188769 m!215427))

(assert (=> b!188769 m!215427))

(assert (=> b!188769 m!215433))

(declare-fun m!215451 () Bool)

(assert (=> b!188759 m!215451))

(declare-fun m!215453 () Bool)

(assert (=> b!188759 m!215453))

(declare-fun m!215455 () Bool)

(assert (=> b!188759 m!215455))

(assert (=> b!188759 m!215451))

(assert (=> b!188759 m!215427))

(declare-fun m!215457 () Bool)

(assert (=> b!188759 m!215457))

(assert (=> b!188759 m!215453))

(assert (=> b!188759 m!215427))

(assert (=> b!188775 m!215427))

(assert (=> b!188775 m!215427))

(declare-fun m!215459 () Bool)

(assert (=> b!188775 m!215459))

(assert (=> d!55719 m!215355))

(declare-fun m!215461 () Bool)

(assert (=> bm!19012 m!215461))

(declare-fun m!215463 () Bool)

(assert (=> bm!19013 m!215463))

(declare-fun m!215465 () Bool)

(assert (=> bm!19017 m!215465))

(declare-fun m!215467 () Bool)

(assert (=> b!188776 m!215467))

(declare-fun m!215469 () Bool)

(assert (=> b!188768 m!215469))

(declare-fun m!215471 () Bool)

(assert (=> b!188768 m!215471))

(declare-fun m!215473 () Bool)

(assert (=> b!188768 m!215473))

(declare-fun m!215475 () Bool)

(assert (=> b!188768 m!215475))

(declare-fun m!215477 () Bool)

(assert (=> b!188768 m!215477))

(declare-fun m!215479 () Bool)

(assert (=> b!188768 m!215479))

(declare-fun m!215481 () Bool)

(assert (=> b!188768 m!215481))

(assert (=> b!188768 m!215427))

(declare-fun m!215483 () Bool)

(assert (=> b!188768 m!215483))

(assert (=> b!188768 m!215471))

(declare-fun m!215485 () Bool)

(assert (=> b!188768 m!215485))

(assert (=> b!188768 m!215475))

(declare-fun m!215487 () Bool)

(assert (=> b!188768 m!215487))

(declare-fun m!215489 () Bool)

(assert (=> b!188768 m!215489))

(declare-fun m!215491 () Bool)

(assert (=> b!188768 m!215491))

(declare-fun m!215493 () Bool)

(assert (=> b!188768 m!215493))

(declare-fun m!215495 () Bool)

(assert (=> b!188768 m!215495))

(assert (=> b!188768 m!215491))

(declare-fun m!215497 () Bool)

(assert (=> b!188768 m!215497))

(assert (=> b!188768 m!215487))

(assert (=> b!188768 m!215465))

(declare-fun m!215499 () Bool)

(assert (=> b!188760 m!215499))

(assert (=> b!188571 d!55719))

(declare-fun d!55721 () Bool)

(assert (=> d!55721 (= (array_inv!2435 (_keys!5806 thiss!1248)) (bvsge (size!4096 (_keys!5806 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!188578 d!55721))

(declare-fun d!55723 () Bool)

(assert (=> d!55723 (= (array_inv!2436 (_values!3828 thiss!1248)) (bvsge (size!4097 (_values!3828 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!188578 d!55723))

(declare-fun d!55725 () Bool)

(declare-fun res!89247 () Bool)

(declare-fun e!124239 () Bool)

(assert (=> d!55725 (=> res!89247 e!124239)))

(assert (=> d!55725 (= res!89247 (bvsge #b00000000000000000000000000000000 (size!4096 (_keys!5806 thiss!1248))))))

(assert (=> d!55725 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5806 thiss!1248) (mask!9014 thiss!1248)) e!124239)))

(declare-fun bm!19021 () Bool)

(declare-fun call!19024 () Bool)

(assert (=> bm!19021 (= call!19024 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5806 thiss!1248) (mask!9014 thiss!1248)))))

(declare-fun b!188787 () Bool)

(declare-fun e!124237 () Bool)

(assert (=> b!188787 (= e!124239 e!124237)))

(declare-fun c!33939 () Bool)

(assert (=> b!188787 (= c!33939 (validKeyInArray!0 (select (arr!3776 (_keys!5806 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!188788 () Bool)

(declare-fun e!124238 () Bool)

(assert (=> b!188788 (= e!124237 e!124238)))

(declare-fun lt!93492 () (_ BitVec 64))

(assert (=> b!188788 (= lt!93492 (select (arr!3776 (_keys!5806 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93493 () Unit!5685)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8007 (_ BitVec 64) (_ BitVec 32)) Unit!5685)

(assert (=> b!188788 (= lt!93493 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5806 thiss!1248) lt!93492 #b00000000000000000000000000000000))))

(assert (=> b!188788 (arrayContainsKey!0 (_keys!5806 thiss!1248) lt!93492 #b00000000000000000000000000000000)))

(declare-fun lt!93491 () Unit!5685)

(assert (=> b!188788 (= lt!93491 lt!93493)))

(declare-fun res!89248 () Bool)

(assert (=> b!188788 (= res!89248 (= (seekEntryOrOpen!0 (select (arr!3776 (_keys!5806 thiss!1248)) #b00000000000000000000000000000000) (_keys!5806 thiss!1248) (mask!9014 thiss!1248)) (Found!647 #b00000000000000000000000000000000)))))

(assert (=> b!188788 (=> (not res!89248) (not e!124238))))

(declare-fun b!188789 () Bool)

(assert (=> b!188789 (= e!124237 call!19024)))

(declare-fun b!188790 () Bool)

(assert (=> b!188790 (= e!124238 call!19024)))

(assert (= (and d!55725 (not res!89247)) b!188787))

(assert (= (and b!188787 c!33939) b!188788))

(assert (= (and b!188787 (not c!33939)) b!188789))

(assert (= (and b!188788 res!89248) b!188790))

(assert (= (or b!188790 b!188789) bm!19021))

(declare-fun m!215501 () Bool)

(assert (=> bm!19021 m!215501))

(assert (=> b!188787 m!215427))

(assert (=> b!188787 m!215427))

(assert (=> b!188787 m!215433))

(assert (=> b!188788 m!215427))

(declare-fun m!215503 () Bool)

(assert (=> b!188788 m!215503))

(declare-fun m!215505 () Bool)

(assert (=> b!188788 m!215505))

(assert (=> b!188788 m!215427))

(declare-fun m!215507 () Bool)

(assert (=> b!188788 m!215507))

(assert (=> b!188572 d!55725))

(declare-fun b!188803 () Bool)

(declare-fun c!33946 () Bool)

(declare-fun lt!93502 () (_ BitVec 64))

(assert (=> b!188803 (= c!33946 (= lt!93502 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!124246 () SeekEntryResult!647)

(declare-fun e!124247 () SeekEntryResult!647)

(assert (=> b!188803 (= e!124246 e!124247)))

(declare-fun b!188804 () Bool)

(declare-fun lt!93500 () SeekEntryResult!647)

(assert (=> b!188804 (= e!124246 (Found!647 (index!4760 lt!93500)))))

(declare-fun b!188805 () Bool)

(declare-fun e!124248 () SeekEntryResult!647)

(assert (=> b!188805 (= e!124248 e!124246)))

(assert (=> b!188805 (= lt!93502 (select (arr!3776 (_keys!5806 thiss!1248)) (index!4760 lt!93500)))))

(declare-fun c!33948 () Bool)

(assert (=> b!188805 (= c!33948 (= lt!93502 key!828))))

(declare-fun b!188806 () Bool)

(assert (=> b!188806 (= e!124247 (MissingZero!647 (index!4760 lt!93500)))))

(declare-fun b!188807 () Bool)

(assert (=> b!188807 (= e!124248 Undefined!647)))

(declare-fun d!55727 () Bool)

(declare-fun lt!93501 () SeekEntryResult!647)

(assert (=> d!55727 (and (or ((_ is Undefined!647) lt!93501) (not ((_ is Found!647) lt!93501)) (and (bvsge (index!4759 lt!93501) #b00000000000000000000000000000000) (bvslt (index!4759 lt!93501) (size!4096 (_keys!5806 thiss!1248))))) (or ((_ is Undefined!647) lt!93501) ((_ is Found!647) lt!93501) (not ((_ is MissingZero!647) lt!93501)) (and (bvsge (index!4758 lt!93501) #b00000000000000000000000000000000) (bvslt (index!4758 lt!93501) (size!4096 (_keys!5806 thiss!1248))))) (or ((_ is Undefined!647) lt!93501) ((_ is Found!647) lt!93501) ((_ is MissingZero!647) lt!93501) (not ((_ is MissingVacant!647) lt!93501)) (and (bvsge (index!4761 lt!93501) #b00000000000000000000000000000000) (bvslt (index!4761 lt!93501) (size!4096 (_keys!5806 thiss!1248))))) (or ((_ is Undefined!647) lt!93501) (ite ((_ is Found!647) lt!93501) (= (select (arr!3776 (_keys!5806 thiss!1248)) (index!4759 lt!93501)) key!828) (ite ((_ is MissingZero!647) lt!93501) (= (select (arr!3776 (_keys!5806 thiss!1248)) (index!4758 lt!93501)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!647) lt!93501) (= (select (arr!3776 (_keys!5806 thiss!1248)) (index!4761 lt!93501)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!55727 (= lt!93501 e!124248)))

(declare-fun c!33947 () Bool)

(assert (=> d!55727 (= c!33947 (and ((_ is Intermediate!647) lt!93500) (undefined!1459 lt!93500)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8007 (_ BitVec 32)) SeekEntryResult!647)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55727 (= lt!93500 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9014 thiss!1248)) key!828 (_keys!5806 thiss!1248) (mask!9014 thiss!1248)))))

(assert (=> d!55727 (validMask!0 (mask!9014 thiss!1248))))

(assert (=> d!55727 (= (seekEntryOrOpen!0 key!828 (_keys!5806 thiss!1248) (mask!9014 thiss!1248)) lt!93501)))

(declare-fun b!188808 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8007 (_ BitVec 32)) SeekEntryResult!647)

(assert (=> b!188808 (= e!124247 (seekKeyOrZeroReturnVacant!0 (x!20351 lt!93500) (index!4760 lt!93500) (index!4760 lt!93500) key!828 (_keys!5806 thiss!1248) (mask!9014 thiss!1248)))))

(assert (= (and d!55727 c!33947) b!188807))

(assert (= (and d!55727 (not c!33947)) b!188805))

(assert (= (and b!188805 c!33948) b!188804))

(assert (= (and b!188805 (not c!33948)) b!188803))

(assert (= (and b!188803 c!33946) b!188806))

(assert (= (and b!188803 (not c!33946)) b!188808))

(declare-fun m!215509 () Bool)

(assert (=> b!188805 m!215509))

(declare-fun m!215511 () Bool)

(assert (=> d!55727 m!215511))

(declare-fun m!215513 () Bool)

(assert (=> d!55727 m!215513))

(declare-fun m!215515 () Bool)

(assert (=> d!55727 m!215515))

(assert (=> d!55727 m!215355))

(declare-fun m!215517 () Bool)

(assert (=> d!55727 m!215517))

(declare-fun m!215519 () Bool)

(assert (=> d!55727 m!215519))

(assert (=> d!55727 m!215511))

(declare-fun m!215521 () Bool)

(assert (=> b!188808 m!215521))

(assert (=> b!188577 d!55727))

(declare-fun d!55729 () Bool)

(declare-fun e!124251 () Bool)

(assert (=> d!55729 e!124251))

(declare-fun res!89254 () Bool)

(assert (=> d!55729 (=> (not res!89254) (not e!124251))))

(declare-fun lt!93508 () SeekEntryResult!647)

(assert (=> d!55729 (= res!89254 ((_ is Found!647) lt!93508))))

(assert (=> d!55729 (= lt!93508 (seekEntryOrOpen!0 key!828 (_keys!5806 thiss!1248) (mask!9014 thiss!1248)))))

(declare-fun lt!93507 () Unit!5685)

(declare-fun choose!1016 (array!8007 array!8009 (_ BitVec 32) (_ BitVec 32) V!5513 V!5513 (_ BitVec 64) Int) Unit!5685)

(assert (=> d!55729 (= lt!93507 (choose!1016 (_keys!5806 thiss!1248) (_values!3828 thiss!1248) (mask!9014 thiss!1248) (extraKeys!3582 thiss!1248) (zeroValue!3686 thiss!1248) (minValue!3686 thiss!1248) key!828 (defaultEntry!3845 thiss!1248)))))

(assert (=> d!55729 (validMask!0 (mask!9014 thiss!1248))))

(assert (=> d!55729 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!159 (_keys!5806 thiss!1248) (_values!3828 thiss!1248) (mask!9014 thiss!1248) (extraKeys!3582 thiss!1248) (zeroValue!3686 thiss!1248) (minValue!3686 thiss!1248) key!828 (defaultEntry!3845 thiss!1248)) lt!93507)))

(declare-fun b!188813 () Bool)

(declare-fun res!89253 () Bool)

(assert (=> b!188813 (=> (not res!89253) (not e!124251))))

(assert (=> b!188813 (= res!89253 (inRange!0 (index!4759 lt!93508) (mask!9014 thiss!1248)))))

(declare-fun b!188814 () Bool)

(assert (=> b!188814 (= e!124251 (= (select (arr!3776 (_keys!5806 thiss!1248)) (index!4759 lt!93508)) key!828))))

(assert (=> b!188814 (and (bvsge (index!4759 lt!93508) #b00000000000000000000000000000000) (bvslt (index!4759 lt!93508) (size!4096 (_keys!5806 thiss!1248))))))

(assert (= (and d!55729 res!89254) b!188813))

(assert (= (and b!188813 res!89253) b!188814))

(assert (=> d!55729 m!215341))

(declare-fun m!215523 () Bool)

(assert (=> d!55729 m!215523))

(assert (=> d!55729 m!215355))

(declare-fun m!215525 () Bool)

(assert (=> b!188813 m!215525))

(declare-fun m!215527 () Bool)

(assert (=> b!188814 m!215527))

(assert (=> b!188574 d!55729))

(declare-fun d!55731 () Bool)

(assert (=> d!55731 (= (inRange!0 (index!4759 lt!93376) (mask!9014 thiss!1248)) (and (bvsge (index!4759 lt!93376) #b00000000000000000000000000000000) (bvslt (index!4759 lt!93376) (bvadd (mask!9014 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!188574 d!55731))

(declare-fun mapNonEmpty!7594 () Bool)

(declare-fun mapRes!7594 () Bool)

(declare-fun tp!16720 () Bool)

(declare-fun e!124256 () Bool)

(assert (=> mapNonEmpty!7594 (= mapRes!7594 (and tp!16720 e!124256))))

(declare-fun mapRest!7594 () (Array (_ BitVec 32) ValueCell!1856))

(declare-fun mapKey!7594 () (_ BitVec 32))

(declare-fun mapValue!7594 () ValueCell!1856)

(assert (=> mapNonEmpty!7594 (= mapRest!7585 (store mapRest!7594 mapKey!7594 mapValue!7594))))

(declare-fun mapIsEmpty!7594 () Bool)

(assert (=> mapIsEmpty!7594 mapRes!7594))

(declare-fun b!188822 () Bool)

(declare-fun e!124257 () Bool)

(assert (=> b!188822 (= e!124257 tp_is_empty!4399)))

(declare-fun b!188821 () Bool)

(assert (=> b!188821 (= e!124256 tp_is_empty!4399)))

(declare-fun condMapEmpty!7594 () Bool)

(declare-fun mapDefault!7594 () ValueCell!1856)

(assert (=> mapNonEmpty!7585 (= condMapEmpty!7594 (= mapRest!7585 ((as const (Array (_ BitVec 32) ValueCell!1856)) mapDefault!7594)))))

(assert (=> mapNonEmpty!7585 (= tp!16705 (and e!124257 mapRes!7594))))

(assert (= (and mapNonEmpty!7585 condMapEmpty!7594) mapIsEmpty!7594))

(assert (= (and mapNonEmpty!7585 (not condMapEmpty!7594)) mapNonEmpty!7594))

(assert (= (and mapNonEmpty!7594 ((_ is ValueCellFull!1856) mapValue!7594)) b!188821))

(assert (= (and mapNonEmpty!7585 ((_ is ValueCellFull!1856) mapDefault!7594)) b!188822))

(declare-fun m!215529 () Bool)

(assert (=> mapNonEmpty!7594 m!215529))

(declare-fun b_lambda!7339 () Bool)

(assert (= b_lambda!7337 (or (and b!188578 b_free!4627) b_lambda!7339)))

(check-sat (not b!188711) (not d!55709) (not b!188764) (not bm!19017) (not b!188776) (not bm!19014) (not b_lambda!7339) (not b!188694) b_and!11279 (not b!188713) (not b!188788) (not d!55727) (not mapNonEmpty!7594) (not b!188760) (not d!55713) (not bm!18994) (not b!188761) (not bm!19021) (not d!55729) (not b!188695) (not b!188769) (not b!188704) (not b!188702) (not b!188813) (not b!188692) (not b!188808) tp_is_empty!4399 (not bm!18997) (not b!188775) (not b!188703) (not b_next!4627) (not bm!19013) (not d!55717) (not bm!19012) (not b!188759) (not bm!18993) (not b!188787) (not b!188768) (not d!55719))
(check-sat b_and!11279 (not b_next!4627))
