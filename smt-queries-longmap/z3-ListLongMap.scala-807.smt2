; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19508 () Bool)

(assert start!19508)

(declare-fun b!191360 () Bool)

(declare-fun b_free!4681 () Bool)

(declare-fun b_next!4681 () Bool)

(assert (=> b!191360 (= b_free!4681 (not b_next!4681))))

(declare-fun tp!16892 () Bool)

(declare-fun b_and!11329 () Bool)

(assert (=> b!191360 (= tp!16892 b_and!11329)))

(declare-fun b!191358 () Bool)

(declare-fun res!90412 () Bool)

(declare-fun e!125925 () Bool)

(assert (=> b!191358 (=> (not res!90412) (not e!125925))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!191358 (= res!90412 (not (= key!828 (bvneg key!828))))))

(declare-fun b!191359 () Bool)

(declare-fun e!125920 () Bool)

(declare-fun e!125926 () Bool)

(assert (=> b!191359 (= e!125920 (not e!125926))))

(declare-fun res!90415 () Bool)

(assert (=> b!191359 (=> res!90415 e!125926)))

(declare-datatypes ((V!5585 0))(
  ( (V!5586 (val!2271 Int)) )
))
(declare-datatypes ((ValueCell!1883 0))(
  ( (ValueCellFull!1883 (v!4205 V!5585)) (EmptyCell!1883) )
))
(declare-datatypes ((array!8125 0))(
  ( (array!8126 (arr!3826 (Array (_ BitVec 32) (_ BitVec 64))) (size!4149 (_ BitVec 32))) )
))
(declare-datatypes ((array!8127 0))(
  ( (array!8128 (arr!3827 (Array (_ BitVec 32) ValueCell!1883)) (size!4150 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2674 0))(
  ( (LongMapFixedSize!2675 (defaultEntry!3909 Int) (mask!9129 (_ BitVec 32)) (extraKeys!3646 (_ BitVec 32)) (zeroValue!3750 V!5585) (minValue!3750 V!5585) (_size!1386 (_ BitVec 32)) (_keys!5886 array!8125) (_values!3892 array!8127) (_vacant!1386 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2674)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!191359 (= res!90415 (not (validMask!0 (mask!9129 thiss!1248))))))

(declare-datatypes ((SeekEntryResult!681 0))(
  ( (MissingZero!681 (index!4894 (_ BitVec 32))) (Found!681 (index!4895 (_ BitVec 32))) (Intermediate!681 (undefined!1493 Bool) (index!4896 (_ BitVec 32)) (x!20552 (_ BitVec 32))) (Undefined!681) (MissingVacant!681 (index!4897 (_ BitVec 32))) )
))
(declare-fun lt!94908 () SeekEntryResult!681)

(declare-fun v!309 () V!5585)

(declare-datatypes ((tuple2!3484 0))(
  ( (tuple2!3485 (_1!1753 (_ BitVec 64)) (_2!1753 V!5585)) )
))
(declare-datatypes ((List!2405 0))(
  ( (Nil!2402) (Cons!2401 (h!3040 tuple2!3484) (t!7310 List!2405)) )
))
(declare-datatypes ((ListLongMap!2393 0))(
  ( (ListLongMap!2394 (toList!1212 List!2405)) )
))
(declare-fun lt!94909 () ListLongMap!2393)

(declare-fun +!304 (ListLongMap!2393 tuple2!3484) ListLongMap!2393)

(declare-fun getCurrentListMap!845 (array!8125 array!8127 (_ BitVec 32) (_ BitVec 32) V!5585 V!5585 (_ BitVec 32) Int) ListLongMap!2393)

(assert (=> b!191359 (= (+!304 lt!94909 (tuple2!3485 key!828 v!309)) (getCurrentListMap!845 (_keys!5886 thiss!1248) (array!8128 (store (arr!3827 (_values!3892 thiss!1248)) (index!4895 lt!94908) (ValueCellFull!1883 v!309)) (size!4150 (_values!3892 thiss!1248))) (mask!9129 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248)))))

(declare-datatypes ((Unit!5743 0))(
  ( (Unit!5744) )
))
(declare-fun lt!94907 () Unit!5743)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!120 (array!8125 array!8127 (_ BitVec 32) (_ BitVec 32) V!5585 V!5585 (_ BitVec 32) (_ BitVec 64) V!5585 Int) Unit!5743)

(assert (=> b!191359 (= lt!94907 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!120 (_keys!5886 thiss!1248) (_values!3892 thiss!1248) (mask!9129 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) (index!4895 lt!94908) key!828 v!309 (defaultEntry!3909 thiss!1248)))))

(declare-fun lt!94910 () Unit!5743)

(declare-fun e!125922 () Unit!5743)

(assert (=> b!191359 (= lt!94910 e!125922)))

(declare-fun c!34452 () Bool)

(declare-fun contains!1332 (ListLongMap!2393 (_ BitVec 64)) Bool)

(assert (=> b!191359 (= c!34452 (contains!1332 lt!94909 key!828))))

(assert (=> b!191359 (= lt!94909 (getCurrentListMap!845 (_keys!5886 thiss!1248) (_values!3892 thiss!1248) (mask!9129 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248)))))

(declare-fun e!125927 () Bool)

(declare-fun tp_is_empty!4453 () Bool)

(declare-fun e!125921 () Bool)

(declare-fun array_inv!2483 (array!8125) Bool)

(declare-fun array_inv!2484 (array!8127) Bool)

(assert (=> b!191360 (= e!125927 (and tp!16892 tp_is_empty!4453 (array_inv!2483 (_keys!5886 thiss!1248)) (array_inv!2484 (_values!3892 thiss!1248)) e!125921))))

(declare-fun b!191361 () Bool)

(declare-fun e!125924 () Bool)

(declare-fun mapRes!7692 () Bool)

(assert (=> b!191361 (= e!125921 (and e!125924 mapRes!7692))))

(declare-fun condMapEmpty!7692 () Bool)

(declare-fun mapDefault!7692 () ValueCell!1883)

(assert (=> b!191361 (= condMapEmpty!7692 (= (arr!3827 (_values!3892 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1883)) mapDefault!7692)))))

(declare-fun mapNonEmpty!7692 () Bool)

(declare-fun tp!16893 () Bool)

(declare-fun e!125928 () Bool)

(assert (=> mapNonEmpty!7692 (= mapRes!7692 (and tp!16893 e!125928))))

(declare-fun mapRest!7692 () (Array (_ BitVec 32) ValueCell!1883))

(declare-fun mapValue!7692 () ValueCell!1883)

(declare-fun mapKey!7692 () (_ BitVec 32))

(assert (=> mapNonEmpty!7692 (= (arr!3827 (_values!3892 thiss!1248)) (store mapRest!7692 mapKey!7692 mapValue!7692))))

(declare-fun b!191362 () Bool)

(declare-fun lt!94911 () Unit!5743)

(assert (=> b!191362 (= e!125922 lt!94911)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!171 (array!8125 array!8127 (_ BitVec 32) (_ BitVec 32) V!5585 V!5585 (_ BitVec 64) Int) Unit!5743)

(assert (=> b!191362 (= lt!94911 (lemmaInListMapThenSeekEntryOrOpenFindsIt!171 (_keys!5886 thiss!1248) (_values!3892 thiss!1248) (mask!9129 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) key!828 (defaultEntry!3909 thiss!1248)))))

(declare-fun res!90414 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!191362 (= res!90414 (inRange!0 (index!4895 lt!94908) (mask!9129 thiss!1248)))))

(declare-fun e!125929 () Bool)

(assert (=> b!191362 (=> (not res!90414) (not e!125929))))

(assert (=> b!191362 e!125929))

(declare-fun b!191363 () Bool)

(declare-fun Unit!5745 () Unit!5743)

(assert (=> b!191363 (= e!125922 Unit!5745)))

(declare-fun lt!94912 () Unit!5743)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!170 (array!8125 array!8127 (_ BitVec 32) (_ BitVec 32) V!5585 V!5585 (_ BitVec 64) Int) Unit!5743)

(assert (=> b!191363 (= lt!94912 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!170 (_keys!5886 thiss!1248) (_values!3892 thiss!1248) (mask!9129 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) key!828 (defaultEntry!3909 thiss!1248)))))

(assert (=> b!191363 false))

(declare-fun mapIsEmpty!7692 () Bool)

(assert (=> mapIsEmpty!7692 mapRes!7692))

(declare-fun b!191364 () Bool)

(assert (=> b!191364 (= e!125924 tp_is_empty!4453)))

(declare-fun b!191365 () Bool)

(assert (=> b!191365 (= e!125926 (or (not (= (size!4150 (_values!3892 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9129 thiss!1248)))) (not (= (size!4149 (_keys!5886 thiss!1248)) (size!4150 (_values!3892 thiss!1248)))) (bvslt (mask!9129 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3646 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!191367 () Bool)

(assert (=> b!191367 (= e!125929 (= (select (arr!3826 (_keys!5886 thiss!1248)) (index!4895 lt!94908)) key!828))))

(declare-fun b!191368 () Bool)

(assert (=> b!191368 (= e!125928 tp_is_empty!4453)))

(declare-fun b!191366 () Bool)

(assert (=> b!191366 (= e!125925 e!125920)))

(declare-fun res!90413 () Bool)

(assert (=> b!191366 (=> (not res!90413) (not e!125920))))

(get-info :version)

(assert (=> b!191366 (= res!90413 (and (not ((_ is Undefined!681) lt!94908)) (not ((_ is MissingVacant!681) lt!94908)) (not ((_ is MissingZero!681) lt!94908)) ((_ is Found!681) lt!94908)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8125 (_ BitVec 32)) SeekEntryResult!681)

(assert (=> b!191366 (= lt!94908 (seekEntryOrOpen!0 key!828 (_keys!5886 thiss!1248) (mask!9129 thiss!1248)))))

(declare-fun res!90416 () Bool)

(assert (=> start!19508 (=> (not res!90416) (not e!125925))))

(declare-fun valid!1115 (LongMapFixedSize!2674) Bool)

(assert (=> start!19508 (= res!90416 (valid!1115 thiss!1248))))

(assert (=> start!19508 e!125925))

(assert (=> start!19508 e!125927))

(assert (=> start!19508 true))

(assert (=> start!19508 tp_is_empty!4453))

(assert (= (and start!19508 res!90416) b!191358))

(assert (= (and b!191358 res!90412) b!191366))

(assert (= (and b!191366 res!90413) b!191359))

(assert (= (and b!191359 c!34452) b!191362))

(assert (= (and b!191359 (not c!34452)) b!191363))

(assert (= (and b!191362 res!90414) b!191367))

(assert (= (and b!191359 (not res!90415)) b!191365))

(assert (= (and b!191361 condMapEmpty!7692) mapIsEmpty!7692))

(assert (= (and b!191361 (not condMapEmpty!7692)) mapNonEmpty!7692))

(assert (= (and mapNonEmpty!7692 ((_ is ValueCellFull!1883) mapValue!7692)) b!191368))

(assert (= (and b!191361 ((_ is ValueCellFull!1883) mapDefault!7692)) b!191364))

(assert (= b!191360 b!191361))

(assert (= start!19508 b!191360))

(declare-fun m!217471 () Bool)

(assert (=> b!191359 m!217471))

(declare-fun m!217473 () Bool)

(assert (=> b!191359 m!217473))

(declare-fun m!217475 () Bool)

(assert (=> b!191359 m!217475))

(declare-fun m!217477 () Bool)

(assert (=> b!191359 m!217477))

(declare-fun m!217479 () Bool)

(assert (=> b!191359 m!217479))

(declare-fun m!217481 () Bool)

(assert (=> b!191359 m!217481))

(declare-fun m!217483 () Bool)

(assert (=> b!191359 m!217483))

(declare-fun m!217485 () Bool)

(assert (=> mapNonEmpty!7692 m!217485))

(declare-fun m!217487 () Bool)

(assert (=> b!191367 m!217487))

(declare-fun m!217489 () Bool)

(assert (=> b!191363 m!217489))

(declare-fun m!217491 () Bool)

(assert (=> b!191362 m!217491))

(declare-fun m!217493 () Bool)

(assert (=> b!191362 m!217493))

(declare-fun m!217495 () Bool)

(assert (=> start!19508 m!217495))

(declare-fun m!217497 () Bool)

(assert (=> b!191366 m!217497))

(declare-fun m!217499 () Bool)

(assert (=> b!191360 m!217499))

(declare-fun m!217501 () Bool)

(assert (=> b!191360 m!217501))

(check-sat b_and!11329 (not start!19508) tp_is_empty!4453 (not b!191360) (not b!191362) (not b!191359) (not b!191363) (not b_next!4681) (not b!191366) (not mapNonEmpty!7692))
(check-sat b_and!11329 (not b_next!4681))
(get-model)

(declare-fun bm!19306 () Bool)

(declare-fun call!19309 () Bool)

(declare-fun arrayContainsKey!0 (array!8125 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!19306 (= call!19309 (arrayContainsKey!0 (_keys!5886 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!191451 () Bool)

(declare-fun e!126001 () Bool)

(declare-fun lt!94954 () SeekEntryResult!681)

(assert (=> b!191451 (= e!126001 ((_ is Undefined!681) lt!94954))))

(declare-fun b!191452 () Bool)

(declare-fun e!125998 () Bool)

(declare-fun e!125999 () Bool)

(assert (=> b!191452 (= e!125998 e!125999)))

(declare-fun res!90458 () Bool)

(declare-fun call!19310 () Bool)

(assert (=> b!191452 (= res!90458 call!19310)))

(assert (=> b!191452 (=> (not res!90458) (not e!125999))))

(declare-fun b!191453 () Bool)

(declare-fun res!90455 () Bool)

(declare-fun e!126000 () Bool)

(assert (=> b!191453 (=> (not res!90455) (not e!126000))))

(assert (=> b!191453 (= res!90455 (= (select (arr!3826 (_keys!5886 thiss!1248)) (index!4897 lt!94954)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!191453 (and (bvsge (index!4897 lt!94954) #b00000000000000000000000000000000) (bvslt (index!4897 lt!94954) (size!4149 (_keys!5886 thiss!1248))))))

(declare-fun d!56007 () Bool)

(assert (=> d!56007 e!125998))

(declare-fun c!34463 () Bool)

(assert (=> d!56007 (= c!34463 ((_ is MissingZero!681) lt!94954))))

(assert (=> d!56007 (= lt!94954 (seekEntryOrOpen!0 key!828 (_keys!5886 thiss!1248) (mask!9129 thiss!1248)))))

(declare-fun lt!94953 () Unit!5743)

(declare-fun choose!1044 (array!8125 array!8127 (_ BitVec 32) (_ BitVec 32) V!5585 V!5585 (_ BitVec 64) Int) Unit!5743)

(assert (=> d!56007 (= lt!94953 (choose!1044 (_keys!5886 thiss!1248) (_values!3892 thiss!1248) (mask!9129 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) key!828 (defaultEntry!3909 thiss!1248)))))

(assert (=> d!56007 (validMask!0 (mask!9129 thiss!1248))))

(assert (=> d!56007 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!170 (_keys!5886 thiss!1248) (_values!3892 thiss!1248) (mask!9129 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) key!828 (defaultEntry!3909 thiss!1248)) lt!94953)))

(declare-fun b!191454 () Bool)

(assert (=> b!191454 (= e!126000 (not call!19309))))

(declare-fun b!191455 () Bool)

(declare-fun res!90456 () Bool)

(assert (=> b!191455 (=> (not res!90456) (not e!126000))))

(assert (=> b!191455 (= res!90456 call!19310)))

(assert (=> b!191455 (= e!126001 e!126000)))

(declare-fun bm!19307 () Bool)

(assert (=> bm!19307 (= call!19310 (inRange!0 (ite c!34463 (index!4894 lt!94954) (index!4897 lt!94954)) (mask!9129 thiss!1248)))))

(declare-fun b!191456 () Bool)

(assert (=> b!191456 (and (bvsge (index!4894 lt!94954) #b00000000000000000000000000000000) (bvslt (index!4894 lt!94954) (size!4149 (_keys!5886 thiss!1248))))))

(declare-fun res!90457 () Bool)

(assert (=> b!191456 (= res!90457 (= (select (arr!3826 (_keys!5886 thiss!1248)) (index!4894 lt!94954)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!191456 (=> (not res!90457) (not e!125999))))

(declare-fun b!191457 () Bool)

(assert (=> b!191457 (= e!125999 (not call!19309))))

(declare-fun b!191458 () Bool)

(assert (=> b!191458 (= e!125998 e!126001)))

(declare-fun c!34464 () Bool)

(assert (=> b!191458 (= c!34464 ((_ is MissingVacant!681) lt!94954))))

(assert (= (and d!56007 c!34463) b!191452))

(assert (= (and d!56007 (not c!34463)) b!191458))

(assert (= (and b!191452 res!90458) b!191456))

(assert (= (and b!191456 res!90457) b!191457))

(assert (= (and b!191458 c!34464) b!191455))

(assert (= (and b!191458 (not c!34464)) b!191451))

(assert (= (and b!191455 res!90456) b!191453))

(assert (= (and b!191453 res!90455) b!191454))

(assert (= (or b!191452 b!191455) bm!19307))

(assert (= (or b!191457 b!191454) bm!19306))

(declare-fun m!217567 () Bool)

(assert (=> b!191453 m!217567))

(declare-fun m!217569 () Bool)

(assert (=> bm!19307 m!217569))

(declare-fun m!217571 () Bool)

(assert (=> bm!19306 m!217571))

(declare-fun m!217573 () Bool)

(assert (=> b!191456 m!217573))

(assert (=> d!56007 m!217497))

(declare-fun m!217575 () Bool)

(assert (=> d!56007 m!217575))

(assert (=> d!56007 m!217479))

(assert (=> b!191363 d!56007))

(declare-fun b!191501 () Bool)

(declare-fun res!90477 () Bool)

(declare-fun e!126035 () Bool)

(assert (=> b!191501 (=> (not res!90477) (not e!126035))))

(declare-fun e!126030 () Bool)

(assert (=> b!191501 (= res!90477 e!126030)))

(declare-fun c!34478 () Bool)

(assert (=> b!191501 (= c!34478 (not (= (bvand (extraKeys!3646 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!191502 () Bool)

(declare-fun e!126038 () ListLongMap!2393)

(declare-fun call!19331 () ListLongMap!2393)

(assert (=> b!191502 (= e!126038 (+!304 call!19331 (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))))))

(declare-fun bm!19322 () Bool)

(declare-fun call!19330 () ListLongMap!2393)

(declare-fun call!19329 () ListLongMap!2393)

(assert (=> bm!19322 (= call!19330 call!19329)))

(declare-fun b!191503 () Bool)

(declare-fun res!90484 () Bool)

(assert (=> b!191503 (=> (not res!90484) (not e!126035))))

(declare-fun e!126039 () Bool)

(assert (=> b!191503 (= res!90484 e!126039)))

(declare-fun res!90485 () Bool)

(assert (=> b!191503 (=> res!90485 e!126039)))

(declare-fun e!126040 () Bool)

(assert (=> b!191503 (= res!90485 (not e!126040))))

(declare-fun res!90480 () Bool)

(assert (=> b!191503 (=> (not res!90480) (not e!126040))))

(assert (=> b!191503 (= res!90480 (bvslt #b00000000000000000000000000000000 (size!4149 (_keys!5886 thiss!1248))))))

(declare-fun bm!19323 () Bool)

(declare-fun call!19326 () ListLongMap!2393)

(declare-fun getCurrentListMapNoExtraKeys!203 (array!8125 array!8127 (_ BitVec 32) (_ BitVec 32) V!5585 V!5585 (_ BitVec 32) Int) ListLongMap!2393)

(assert (=> bm!19323 (= call!19326 (getCurrentListMapNoExtraKeys!203 (_keys!5886 thiss!1248) (array!8128 (store (arr!3827 (_values!3892 thiss!1248)) (index!4895 lt!94908) (ValueCellFull!1883 v!309)) (size!4150 (_values!3892 thiss!1248))) (mask!9129 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248)))))

(declare-fun b!191504 () Bool)

(declare-fun e!126037 () Bool)

(declare-fun lt!95012 () ListLongMap!2393)

(declare-fun apply!182 (ListLongMap!2393 (_ BitVec 64)) V!5585)

(assert (=> b!191504 (= e!126037 (= (apply!182 lt!95012 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3750 thiss!1248)))))

(declare-fun b!191505 () Bool)

(declare-fun e!126029 () Bool)

(declare-fun call!19325 () Bool)

(assert (=> b!191505 (= e!126029 (not call!19325))))

(declare-fun b!191506 () Bool)

(declare-fun e!126032 () Bool)

(assert (=> b!191506 (= e!126029 e!126032)))

(declare-fun res!90479 () Bool)

(assert (=> b!191506 (= res!90479 call!19325)))

(assert (=> b!191506 (=> (not res!90479) (not e!126032))))

(declare-fun b!191507 () Bool)

(declare-fun e!126031 () Unit!5743)

(declare-fun lt!95015 () Unit!5743)

(assert (=> b!191507 (= e!126031 lt!95015)))

(declare-fun lt!95005 () ListLongMap!2393)

(assert (=> b!191507 (= lt!95005 (getCurrentListMapNoExtraKeys!203 (_keys!5886 thiss!1248) (array!8128 (store (arr!3827 (_values!3892 thiss!1248)) (index!4895 lt!94908) (ValueCellFull!1883 v!309)) (size!4150 (_values!3892 thiss!1248))) (mask!9129 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248)))))

(declare-fun lt!95014 () (_ BitVec 64))

(assert (=> b!191507 (= lt!95014 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95003 () (_ BitVec 64))

(assert (=> b!191507 (= lt!95003 (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95013 () Unit!5743)

(declare-fun addStillContains!158 (ListLongMap!2393 (_ BitVec 64) V!5585 (_ BitVec 64)) Unit!5743)

(assert (=> b!191507 (= lt!95013 (addStillContains!158 lt!95005 lt!95014 (zeroValue!3750 thiss!1248) lt!95003))))

(assert (=> b!191507 (contains!1332 (+!304 lt!95005 (tuple2!3485 lt!95014 (zeroValue!3750 thiss!1248))) lt!95003)))

(declare-fun lt!95016 () Unit!5743)

(assert (=> b!191507 (= lt!95016 lt!95013)))

(declare-fun lt!95000 () ListLongMap!2393)

(assert (=> b!191507 (= lt!95000 (getCurrentListMapNoExtraKeys!203 (_keys!5886 thiss!1248) (array!8128 (store (arr!3827 (_values!3892 thiss!1248)) (index!4895 lt!94908) (ValueCellFull!1883 v!309)) (size!4150 (_values!3892 thiss!1248))) (mask!9129 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248)))))

(declare-fun lt!95002 () (_ BitVec 64))

(assert (=> b!191507 (= lt!95002 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95004 () (_ BitVec 64))

(assert (=> b!191507 (= lt!95004 (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95011 () Unit!5743)

(declare-fun addApplyDifferent!158 (ListLongMap!2393 (_ BitVec 64) V!5585 (_ BitVec 64)) Unit!5743)

(assert (=> b!191507 (= lt!95011 (addApplyDifferent!158 lt!95000 lt!95002 (minValue!3750 thiss!1248) lt!95004))))

(assert (=> b!191507 (= (apply!182 (+!304 lt!95000 (tuple2!3485 lt!95002 (minValue!3750 thiss!1248))) lt!95004) (apply!182 lt!95000 lt!95004))))

(declare-fun lt!95020 () Unit!5743)

(assert (=> b!191507 (= lt!95020 lt!95011)))

(declare-fun lt!95010 () ListLongMap!2393)

(assert (=> b!191507 (= lt!95010 (getCurrentListMapNoExtraKeys!203 (_keys!5886 thiss!1248) (array!8128 (store (arr!3827 (_values!3892 thiss!1248)) (index!4895 lt!94908) (ValueCellFull!1883 v!309)) (size!4150 (_values!3892 thiss!1248))) (mask!9129 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248)))))

(declare-fun lt!95006 () (_ BitVec 64))

(assert (=> b!191507 (= lt!95006 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95008 () (_ BitVec 64))

(assert (=> b!191507 (= lt!95008 (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!94999 () Unit!5743)

(assert (=> b!191507 (= lt!94999 (addApplyDifferent!158 lt!95010 lt!95006 (zeroValue!3750 thiss!1248) lt!95008))))

(assert (=> b!191507 (= (apply!182 (+!304 lt!95010 (tuple2!3485 lt!95006 (zeroValue!3750 thiss!1248))) lt!95008) (apply!182 lt!95010 lt!95008))))

(declare-fun lt!95009 () Unit!5743)

(assert (=> b!191507 (= lt!95009 lt!94999)))

(declare-fun lt!95007 () ListLongMap!2393)

(assert (=> b!191507 (= lt!95007 (getCurrentListMapNoExtraKeys!203 (_keys!5886 thiss!1248) (array!8128 (store (arr!3827 (_values!3892 thiss!1248)) (index!4895 lt!94908) (ValueCellFull!1883 v!309)) (size!4150 (_values!3892 thiss!1248))) (mask!9129 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248)))))

(declare-fun lt!95019 () (_ BitVec 64))

(assert (=> b!191507 (= lt!95019 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95017 () (_ BitVec 64))

(assert (=> b!191507 (= lt!95017 (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!191507 (= lt!95015 (addApplyDifferent!158 lt!95007 lt!95019 (minValue!3750 thiss!1248) lt!95017))))

(assert (=> b!191507 (= (apply!182 (+!304 lt!95007 (tuple2!3485 lt!95019 (minValue!3750 thiss!1248))) lt!95017) (apply!182 lt!95007 lt!95017))))

(declare-fun b!191508 () Bool)

(assert (=> b!191508 (= e!126030 e!126037)))

(declare-fun res!90481 () Bool)

(declare-fun call!19328 () Bool)

(assert (=> b!191508 (= res!90481 call!19328)))

(assert (=> b!191508 (=> (not res!90481) (not e!126037))))

(declare-fun bm!19324 () Bool)

(declare-fun c!34477 () Bool)

(declare-fun c!34480 () Bool)

(assert (=> bm!19324 (= call!19331 (+!304 (ite c!34477 call!19326 (ite c!34480 call!19329 call!19330)) (ite (or c!34477 c!34480) (tuple2!3485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))))))

(declare-fun b!191509 () Bool)

(declare-fun c!34481 () Bool)

(assert (=> b!191509 (= c!34481 (and (not (= (bvand (extraKeys!3646 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3646 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!126034 () ListLongMap!2393)

(declare-fun e!126033 () ListLongMap!2393)

(assert (=> b!191509 (= e!126034 e!126033)))

(declare-fun b!191510 () Bool)

(assert (=> b!191510 (= e!126033 call!19330)))

(declare-fun b!191511 () Bool)

(assert (=> b!191511 (= e!126038 e!126034)))

(assert (=> b!191511 (= c!34480 (and (not (= (bvand (extraKeys!3646 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3646 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19325 () Bool)

(assert (=> bm!19325 (= call!19325 (contains!1332 lt!95012 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!191512 () Bool)

(declare-fun e!126028 () Bool)

(assert (=> b!191512 (= e!126039 e!126028)))

(declare-fun res!90478 () Bool)

(assert (=> b!191512 (=> (not res!90478) (not e!126028))))

(assert (=> b!191512 (= res!90478 (contains!1332 lt!95012 (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!191512 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4149 (_keys!5886 thiss!1248))))))

(declare-fun b!191513 () Bool)

(declare-fun get!2207 (ValueCell!1883 V!5585) V!5585)

(declare-fun dynLambda!516 (Int (_ BitVec 64)) V!5585)

(assert (=> b!191513 (= e!126028 (= (apply!182 lt!95012 (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000)) (get!2207 (select (arr!3827 (array!8128 (store (arr!3827 (_values!3892 thiss!1248)) (index!4895 lt!94908) (ValueCellFull!1883 v!309)) (size!4150 (_values!3892 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!516 (defaultEntry!3909 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!191513 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4150 (array!8128 (store (arr!3827 (_values!3892 thiss!1248)) (index!4895 lt!94908) (ValueCellFull!1883 v!309)) (size!4150 (_values!3892 thiss!1248))))))))

(assert (=> b!191513 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4149 (_keys!5886 thiss!1248))))))

(declare-fun b!191514 () Bool)

(assert (=> b!191514 (= e!126030 (not call!19328))))

(declare-fun b!191515 () Bool)

(assert (=> b!191515 (= e!126035 e!126029)))

(declare-fun c!34482 () Bool)

(assert (=> b!191515 (= c!34482 (not (= (bvand (extraKeys!3646 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!56009 () Bool)

(assert (=> d!56009 e!126035))

(declare-fun res!90483 () Bool)

(assert (=> d!56009 (=> (not res!90483) (not e!126035))))

(assert (=> d!56009 (= res!90483 (or (bvsge #b00000000000000000000000000000000 (size!4149 (_keys!5886 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4149 (_keys!5886 thiss!1248))))))))

(declare-fun lt!95018 () ListLongMap!2393)

(assert (=> d!56009 (= lt!95012 lt!95018)))

(declare-fun lt!95001 () Unit!5743)

(assert (=> d!56009 (= lt!95001 e!126031)))

(declare-fun c!34479 () Bool)

(declare-fun e!126036 () Bool)

(assert (=> d!56009 (= c!34479 e!126036)))

(declare-fun res!90482 () Bool)

(assert (=> d!56009 (=> (not res!90482) (not e!126036))))

(assert (=> d!56009 (= res!90482 (bvslt #b00000000000000000000000000000000 (size!4149 (_keys!5886 thiss!1248))))))

(assert (=> d!56009 (= lt!95018 e!126038)))

(assert (=> d!56009 (= c!34477 (and (not (= (bvand (extraKeys!3646 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3646 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56009 (validMask!0 (mask!9129 thiss!1248))))

(assert (=> d!56009 (= (getCurrentListMap!845 (_keys!5886 thiss!1248) (array!8128 (store (arr!3827 (_values!3892 thiss!1248)) (index!4895 lt!94908) (ValueCellFull!1883 v!309)) (size!4150 (_values!3892 thiss!1248))) (mask!9129 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248)) lt!95012)))

(declare-fun b!191516 () Bool)

(declare-fun Unit!5751 () Unit!5743)

(assert (=> b!191516 (= e!126031 Unit!5751)))

(declare-fun b!191517 () Bool)

(declare-fun call!19327 () ListLongMap!2393)

(assert (=> b!191517 (= e!126034 call!19327)))

(declare-fun bm!19326 () Bool)

(assert (=> bm!19326 (= call!19327 call!19331)))

(declare-fun b!191518 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!191518 (= e!126040 (validKeyInArray!0 (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191519 () Bool)

(assert (=> b!191519 (= e!126033 call!19327)))

(declare-fun bm!19327 () Bool)

(assert (=> bm!19327 (= call!19329 call!19326)))

(declare-fun b!191520 () Bool)

(assert (=> b!191520 (= e!126036 (validKeyInArray!0 (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19328 () Bool)

(assert (=> bm!19328 (= call!19328 (contains!1332 lt!95012 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!191521 () Bool)

(assert (=> b!191521 (= e!126032 (= (apply!182 lt!95012 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3750 thiss!1248)))))

(assert (= (and d!56009 c!34477) b!191502))

(assert (= (and d!56009 (not c!34477)) b!191511))

(assert (= (and b!191511 c!34480) b!191517))

(assert (= (and b!191511 (not c!34480)) b!191509))

(assert (= (and b!191509 c!34481) b!191519))

(assert (= (and b!191509 (not c!34481)) b!191510))

(assert (= (or b!191519 b!191510) bm!19322))

(assert (= (or b!191517 bm!19322) bm!19327))

(assert (= (or b!191517 b!191519) bm!19326))

(assert (= (or b!191502 bm!19327) bm!19323))

(assert (= (or b!191502 bm!19326) bm!19324))

(assert (= (and d!56009 res!90482) b!191520))

(assert (= (and d!56009 c!34479) b!191507))

(assert (= (and d!56009 (not c!34479)) b!191516))

(assert (= (and d!56009 res!90483) b!191503))

(assert (= (and b!191503 res!90480) b!191518))

(assert (= (and b!191503 (not res!90485)) b!191512))

(assert (= (and b!191512 res!90478) b!191513))

(assert (= (and b!191503 res!90484) b!191501))

(assert (= (and b!191501 c!34478) b!191508))

(assert (= (and b!191501 (not c!34478)) b!191514))

(assert (= (and b!191508 res!90481) b!191504))

(assert (= (or b!191508 b!191514) bm!19328))

(assert (= (and b!191501 res!90477) b!191515))

(assert (= (and b!191515 c!34482) b!191506))

(assert (= (and b!191515 (not c!34482)) b!191505))

(assert (= (and b!191506 res!90479) b!191521))

(assert (= (or b!191506 b!191505) bm!19325))

(declare-fun b_lambda!7381 () Bool)

(assert (=> (not b_lambda!7381) (not b!191513)))

(declare-fun t!7314 () Bool)

(declare-fun tb!2867 () Bool)

(assert (=> (and b!191360 (= (defaultEntry!3909 thiss!1248) (defaultEntry!3909 thiss!1248)) t!7314) tb!2867))

(declare-fun result!4895 () Bool)

(assert (=> tb!2867 (= result!4895 tp_is_empty!4453)))

(assert (=> b!191513 t!7314))

(declare-fun b_and!11335 () Bool)

(assert (= b_and!11329 (and (=> t!7314 result!4895) b_and!11335)))

(declare-fun m!217577 () Bool)

(assert (=> b!191520 m!217577))

(assert (=> b!191520 m!217577))

(declare-fun m!217579 () Bool)

(assert (=> b!191520 m!217579))

(assert (=> b!191513 m!217577))

(declare-fun m!217581 () Bool)

(assert (=> b!191513 m!217581))

(declare-fun m!217583 () Bool)

(assert (=> b!191513 m!217583))

(declare-fun m!217585 () Bool)

(assert (=> b!191513 m!217585))

(declare-fun m!217587 () Bool)

(assert (=> b!191513 m!217587))

(assert (=> b!191513 m!217577))

(assert (=> b!191513 m!217585))

(assert (=> b!191513 m!217583))

(declare-fun m!217589 () Bool)

(assert (=> b!191521 m!217589))

(assert (=> d!56009 m!217479))

(declare-fun m!217591 () Bool)

(assert (=> bm!19323 m!217591))

(assert (=> b!191512 m!217577))

(assert (=> b!191512 m!217577))

(declare-fun m!217593 () Bool)

(assert (=> b!191512 m!217593))

(declare-fun m!217595 () Bool)

(assert (=> b!191502 m!217595))

(declare-fun m!217597 () Bool)

(assert (=> b!191507 m!217597))

(declare-fun m!217599 () Bool)

(assert (=> b!191507 m!217599))

(declare-fun m!217601 () Bool)

(assert (=> b!191507 m!217601))

(declare-fun m!217603 () Bool)

(assert (=> b!191507 m!217603))

(assert (=> b!191507 m!217601))

(declare-fun m!217605 () Bool)

(assert (=> b!191507 m!217605))

(declare-fun m!217607 () Bool)

(assert (=> b!191507 m!217607))

(declare-fun m!217609 () Bool)

(assert (=> b!191507 m!217609))

(declare-fun m!217611 () Bool)

(assert (=> b!191507 m!217611))

(declare-fun m!217613 () Bool)

(assert (=> b!191507 m!217613))

(declare-fun m!217615 () Bool)

(assert (=> b!191507 m!217615))

(declare-fun m!217617 () Bool)

(assert (=> b!191507 m!217617))

(declare-fun m!217619 () Bool)

(assert (=> b!191507 m!217619))

(assert (=> b!191507 m!217607))

(declare-fun m!217621 () Bool)

(assert (=> b!191507 m!217621))

(declare-fun m!217623 () Bool)

(assert (=> b!191507 m!217623))

(declare-fun m!217625 () Bool)

(assert (=> b!191507 m!217625))

(assert (=> b!191507 m!217597))

(assert (=> b!191507 m!217591))

(assert (=> b!191507 m!217577))

(assert (=> b!191507 m!217613))

(declare-fun m!217627 () Bool)

(assert (=> b!191504 m!217627))

(declare-fun m!217629 () Bool)

(assert (=> bm!19328 m!217629))

(declare-fun m!217631 () Bool)

(assert (=> bm!19325 m!217631))

(assert (=> b!191518 m!217577))

(assert (=> b!191518 m!217577))

(assert (=> b!191518 m!217579))

(declare-fun m!217633 () Bool)

(assert (=> bm!19324 m!217633))

(assert (=> b!191359 d!56009))

(declare-fun d!56011 () Bool)

(assert (=> d!56011 (= (validMask!0 (mask!9129 thiss!1248)) (and (or (= (mask!9129 thiss!1248) #b00000000000000000000000000000111) (= (mask!9129 thiss!1248) #b00000000000000000000000000001111) (= (mask!9129 thiss!1248) #b00000000000000000000000000011111) (= (mask!9129 thiss!1248) #b00000000000000000000000000111111) (= (mask!9129 thiss!1248) #b00000000000000000000000001111111) (= (mask!9129 thiss!1248) #b00000000000000000000000011111111) (= (mask!9129 thiss!1248) #b00000000000000000000000111111111) (= (mask!9129 thiss!1248) #b00000000000000000000001111111111) (= (mask!9129 thiss!1248) #b00000000000000000000011111111111) (= (mask!9129 thiss!1248) #b00000000000000000000111111111111) (= (mask!9129 thiss!1248) #b00000000000000000001111111111111) (= (mask!9129 thiss!1248) #b00000000000000000011111111111111) (= (mask!9129 thiss!1248) #b00000000000000000111111111111111) (= (mask!9129 thiss!1248) #b00000000000000001111111111111111) (= (mask!9129 thiss!1248) #b00000000000000011111111111111111) (= (mask!9129 thiss!1248) #b00000000000000111111111111111111) (= (mask!9129 thiss!1248) #b00000000000001111111111111111111) (= (mask!9129 thiss!1248) #b00000000000011111111111111111111) (= (mask!9129 thiss!1248) #b00000000000111111111111111111111) (= (mask!9129 thiss!1248) #b00000000001111111111111111111111) (= (mask!9129 thiss!1248) #b00000000011111111111111111111111) (= (mask!9129 thiss!1248) #b00000000111111111111111111111111) (= (mask!9129 thiss!1248) #b00000001111111111111111111111111) (= (mask!9129 thiss!1248) #b00000011111111111111111111111111) (= (mask!9129 thiss!1248) #b00000111111111111111111111111111) (= (mask!9129 thiss!1248) #b00001111111111111111111111111111) (= (mask!9129 thiss!1248) #b00011111111111111111111111111111) (= (mask!9129 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9129 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!191359 d!56011))

(declare-fun d!56013 () Bool)

(declare-fun e!126046 () Bool)

(assert (=> d!56013 e!126046))

(declare-fun res!90488 () Bool)

(assert (=> d!56013 (=> res!90488 e!126046)))

(declare-fun lt!95030 () Bool)

(assert (=> d!56013 (= res!90488 (not lt!95030))))

(declare-fun lt!95032 () Bool)

(assert (=> d!56013 (= lt!95030 lt!95032)))

(declare-fun lt!95029 () Unit!5743)

(declare-fun e!126045 () Unit!5743)

(assert (=> d!56013 (= lt!95029 e!126045)))

(declare-fun c!34485 () Bool)

(assert (=> d!56013 (= c!34485 lt!95032)))

(declare-fun containsKey!241 (List!2405 (_ BitVec 64)) Bool)

(assert (=> d!56013 (= lt!95032 (containsKey!241 (toList!1212 lt!94909) key!828))))

(assert (=> d!56013 (= (contains!1332 lt!94909 key!828) lt!95030)))

(declare-fun b!191530 () Bool)

(declare-fun lt!95031 () Unit!5743)

(assert (=> b!191530 (= e!126045 lt!95031)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!190 (List!2405 (_ BitVec 64)) Unit!5743)

(assert (=> b!191530 (= lt!95031 (lemmaContainsKeyImpliesGetValueByKeyDefined!190 (toList!1212 lt!94909) key!828))))

(declare-datatypes ((Option!243 0))(
  ( (Some!242 (v!4210 V!5585)) (None!241) )
))
(declare-fun isDefined!191 (Option!243) Bool)

(declare-fun getValueByKey!237 (List!2405 (_ BitVec 64)) Option!243)

(assert (=> b!191530 (isDefined!191 (getValueByKey!237 (toList!1212 lt!94909) key!828))))

(declare-fun b!191531 () Bool)

(declare-fun Unit!5752 () Unit!5743)

(assert (=> b!191531 (= e!126045 Unit!5752)))

(declare-fun b!191532 () Bool)

(assert (=> b!191532 (= e!126046 (isDefined!191 (getValueByKey!237 (toList!1212 lt!94909) key!828)))))

(assert (= (and d!56013 c!34485) b!191530))

(assert (= (and d!56013 (not c!34485)) b!191531))

(assert (= (and d!56013 (not res!90488)) b!191532))

(declare-fun m!217635 () Bool)

(assert (=> d!56013 m!217635))

(declare-fun m!217637 () Bool)

(assert (=> b!191530 m!217637))

(declare-fun m!217639 () Bool)

(assert (=> b!191530 m!217639))

(assert (=> b!191530 m!217639))

(declare-fun m!217641 () Bool)

(assert (=> b!191530 m!217641))

(assert (=> b!191532 m!217639))

(assert (=> b!191532 m!217639))

(assert (=> b!191532 m!217641))

(assert (=> b!191359 d!56013))

(declare-fun b!191533 () Bool)

(declare-fun res!90489 () Bool)

(declare-fun e!126054 () Bool)

(assert (=> b!191533 (=> (not res!90489) (not e!126054))))

(declare-fun e!126049 () Bool)

(assert (=> b!191533 (= res!90489 e!126049)))

(declare-fun c!34487 () Bool)

(assert (=> b!191533 (= c!34487 (not (= (bvand (extraKeys!3646 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!191534 () Bool)

(declare-fun e!126057 () ListLongMap!2393)

(declare-fun call!19338 () ListLongMap!2393)

(assert (=> b!191534 (= e!126057 (+!304 call!19338 (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))))))

(declare-fun bm!19329 () Bool)

(declare-fun call!19337 () ListLongMap!2393)

(declare-fun call!19336 () ListLongMap!2393)

(assert (=> bm!19329 (= call!19337 call!19336)))

(declare-fun b!191535 () Bool)

(declare-fun res!90496 () Bool)

(assert (=> b!191535 (=> (not res!90496) (not e!126054))))

(declare-fun e!126058 () Bool)

(assert (=> b!191535 (= res!90496 e!126058)))

(declare-fun res!90497 () Bool)

(assert (=> b!191535 (=> res!90497 e!126058)))

(declare-fun e!126059 () Bool)

(assert (=> b!191535 (= res!90497 (not e!126059))))

(declare-fun res!90492 () Bool)

(assert (=> b!191535 (=> (not res!90492) (not e!126059))))

(assert (=> b!191535 (= res!90492 (bvslt #b00000000000000000000000000000000 (size!4149 (_keys!5886 thiss!1248))))))

(declare-fun bm!19330 () Bool)

(declare-fun call!19333 () ListLongMap!2393)

(assert (=> bm!19330 (= call!19333 (getCurrentListMapNoExtraKeys!203 (_keys!5886 thiss!1248) (_values!3892 thiss!1248) (mask!9129 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248)))))

(declare-fun b!191536 () Bool)

(declare-fun e!126056 () Bool)

(declare-fun lt!95046 () ListLongMap!2393)

(assert (=> b!191536 (= e!126056 (= (apply!182 lt!95046 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3750 thiss!1248)))))

(declare-fun b!191537 () Bool)

(declare-fun e!126048 () Bool)

(declare-fun call!19332 () Bool)

(assert (=> b!191537 (= e!126048 (not call!19332))))

(declare-fun b!191538 () Bool)

(declare-fun e!126051 () Bool)

(assert (=> b!191538 (= e!126048 e!126051)))

(declare-fun res!90491 () Bool)

(assert (=> b!191538 (= res!90491 call!19332)))

(assert (=> b!191538 (=> (not res!90491) (not e!126051))))

(declare-fun b!191539 () Bool)

(declare-fun e!126050 () Unit!5743)

(declare-fun lt!95049 () Unit!5743)

(assert (=> b!191539 (= e!126050 lt!95049)))

(declare-fun lt!95039 () ListLongMap!2393)

(assert (=> b!191539 (= lt!95039 (getCurrentListMapNoExtraKeys!203 (_keys!5886 thiss!1248) (_values!3892 thiss!1248) (mask!9129 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248)))))

(declare-fun lt!95048 () (_ BitVec 64))

(assert (=> b!191539 (= lt!95048 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95037 () (_ BitVec 64))

(assert (=> b!191539 (= lt!95037 (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95047 () Unit!5743)

(assert (=> b!191539 (= lt!95047 (addStillContains!158 lt!95039 lt!95048 (zeroValue!3750 thiss!1248) lt!95037))))

(assert (=> b!191539 (contains!1332 (+!304 lt!95039 (tuple2!3485 lt!95048 (zeroValue!3750 thiss!1248))) lt!95037)))

(declare-fun lt!95050 () Unit!5743)

(assert (=> b!191539 (= lt!95050 lt!95047)))

(declare-fun lt!95034 () ListLongMap!2393)

(assert (=> b!191539 (= lt!95034 (getCurrentListMapNoExtraKeys!203 (_keys!5886 thiss!1248) (_values!3892 thiss!1248) (mask!9129 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248)))))

(declare-fun lt!95036 () (_ BitVec 64))

(assert (=> b!191539 (= lt!95036 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95038 () (_ BitVec 64))

(assert (=> b!191539 (= lt!95038 (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95045 () Unit!5743)

(assert (=> b!191539 (= lt!95045 (addApplyDifferent!158 lt!95034 lt!95036 (minValue!3750 thiss!1248) lt!95038))))

(assert (=> b!191539 (= (apply!182 (+!304 lt!95034 (tuple2!3485 lt!95036 (minValue!3750 thiss!1248))) lt!95038) (apply!182 lt!95034 lt!95038))))

(declare-fun lt!95054 () Unit!5743)

(assert (=> b!191539 (= lt!95054 lt!95045)))

(declare-fun lt!95044 () ListLongMap!2393)

(assert (=> b!191539 (= lt!95044 (getCurrentListMapNoExtraKeys!203 (_keys!5886 thiss!1248) (_values!3892 thiss!1248) (mask!9129 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248)))))

(declare-fun lt!95040 () (_ BitVec 64))

(assert (=> b!191539 (= lt!95040 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95042 () (_ BitVec 64))

(assert (=> b!191539 (= lt!95042 (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95033 () Unit!5743)

(assert (=> b!191539 (= lt!95033 (addApplyDifferent!158 lt!95044 lt!95040 (zeroValue!3750 thiss!1248) lt!95042))))

(assert (=> b!191539 (= (apply!182 (+!304 lt!95044 (tuple2!3485 lt!95040 (zeroValue!3750 thiss!1248))) lt!95042) (apply!182 lt!95044 lt!95042))))

(declare-fun lt!95043 () Unit!5743)

(assert (=> b!191539 (= lt!95043 lt!95033)))

(declare-fun lt!95041 () ListLongMap!2393)

(assert (=> b!191539 (= lt!95041 (getCurrentListMapNoExtraKeys!203 (_keys!5886 thiss!1248) (_values!3892 thiss!1248) (mask!9129 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248)))))

(declare-fun lt!95053 () (_ BitVec 64))

(assert (=> b!191539 (= lt!95053 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95051 () (_ BitVec 64))

(assert (=> b!191539 (= lt!95051 (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!191539 (= lt!95049 (addApplyDifferent!158 lt!95041 lt!95053 (minValue!3750 thiss!1248) lt!95051))))

(assert (=> b!191539 (= (apply!182 (+!304 lt!95041 (tuple2!3485 lt!95053 (minValue!3750 thiss!1248))) lt!95051) (apply!182 lt!95041 lt!95051))))

(declare-fun b!191540 () Bool)

(assert (=> b!191540 (= e!126049 e!126056)))

(declare-fun res!90493 () Bool)

(declare-fun call!19335 () Bool)

(assert (=> b!191540 (= res!90493 call!19335)))

(assert (=> b!191540 (=> (not res!90493) (not e!126056))))

(declare-fun c!34489 () Bool)

(declare-fun bm!19331 () Bool)

(declare-fun c!34486 () Bool)

(assert (=> bm!19331 (= call!19338 (+!304 (ite c!34486 call!19333 (ite c!34489 call!19336 call!19337)) (ite (or c!34486 c!34489) (tuple2!3485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))))))

(declare-fun b!191541 () Bool)

(declare-fun c!34490 () Bool)

(assert (=> b!191541 (= c!34490 (and (not (= (bvand (extraKeys!3646 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3646 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!126053 () ListLongMap!2393)

(declare-fun e!126052 () ListLongMap!2393)

(assert (=> b!191541 (= e!126053 e!126052)))

(declare-fun b!191542 () Bool)

(assert (=> b!191542 (= e!126052 call!19337)))

(declare-fun b!191543 () Bool)

(assert (=> b!191543 (= e!126057 e!126053)))

(assert (=> b!191543 (= c!34489 (and (not (= (bvand (extraKeys!3646 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3646 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19332 () Bool)

(assert (=> bm!19332 (= call!19332 (contains!1332 lt!95046 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!191544 () Bool)

(declare-fun e!126047 () Bool)

(assert (=> b!191544 (= e!126058 e!126047)))

(declare-fun res!90490 () Bool)

(assert (=> b!191544 (=> (not res!90490) (not e!126047))))

(assert (=> b!191544 (= res!90490 (contains!1332 lt!95046 (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!191544 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4149 (_keys!5886 thiss!1248))))))

(declare-fun b!191545 () Bool)

(assert (=> b!191545 (= e!126047 (= (apply!182 lt!95046 (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000)) (get!2207 (select (arr!3827 (_values!3892 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!516 (defaultEntry!3909 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!191545 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4150 (_values!3892 thiss!1248))))))

(assert (=> b!191545 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4149 (_keys!5886 thiss!1248))))))

(declare-fun b!191546 () Bool)

(assert (=> b!191546 (= e!126049 (not call!19335))))

(declare-fun b!191547 () Bool)

(assert (=> b!191547 (= e!126054 e!126048)))

(declare-fun c!34491 () Bool)

(assert (=> b!191547 (= c!34491 (not (= (bvand (extraKeys!3646 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!56015 () Bool)

(assert (=> d!56015 e!126054))

(declare-fun res!90495 () Bool)

(assert (=> d!56015 (=> (not res!90495) (not e!126054))))

(assert (=> d!56015 (= res!90495 (or (bvsge #b00000000000000000000000000000000 (size!4149 (_keys!5886 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4149 (_keys!5886 thiss!1248))))))))

(declare-fun lt!95052 () ListLongMap!2393)

(assert (=> d!56015 (= lt!95046 lt!95052)))

(declare-fun lt!95035 () Unit!5743)

(assert (=> d!56015 (= lt!95035 e!126050)))

(declare-fun c!34488 () Bool)

(declare-fun e!126055 () Bool)

(assert (=> d!56015 (= c!34488 e!126055)))

(declare-fun res!90494 () Bool)

(assert (=> d!56015 (=> (not res!90494) (not e!126055))))

(assert (=> d!56015 (= res!90494 (bvslt #b00000000000000000000000000000000 (size!4149 (_keys!5886 thiss!1248))))))

(assert (=> d!56015 (= lt!95052 e!126057)))

(assert (=> d!56015 (= c!34486 (and (not (= (bvand (extraKeys!3646 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3646 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56015 (validMask!0 (mask!9129 thiss!1248))))

(assert (=> d!56015 (= (getCurrentListMap!845 (_keys!5886 thiss!1248) (_values!3892 thiss!1248) (mask!9129 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248)) lt!95046)))

(declare-fun b!191548 () Bool)

(declare-fun Unit!5753 () Unit!5743)

(assert (=> b!191548 (= e!126050 Unit!5753)))

(declare-fun b!191549 () Bool)

(declare-fun call!19334 () ListLongMap!2393)

(assert (=> b!191549 (= e!126053 call!19334)))

(declare-fun bm!19333 () Bool)

(assert (=> bm!19333 (= call!19334 call!19338)))

(declare-fun b!191550 () Bool)

(assert (=> b!191550 (= e!126059 (validKeyInArray!0 (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191551 () Bool)

(assert (=> b!191551 (= e!126052 call!19334)))

(declare-fun bm!19334 () Bool)

(assert (=> bm!19334 (= call!19336 call!19333)))

(declare-fun b!191552 () Bool)

(assert (=> b!191552 (= e!126055 (validKeyInArray!0 (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19335 () Bool)

(assert (=> bm!19335 (= call!19335 (contains!1332 lt!95046 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!191553 () Bool)

(assert (=> b!191553 (= e!126051 (= (apply!182 lt!95046 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3750 thiss!1248)))))

(assert (= (and d!56015 c!34486) b!191534))

(assert (= (and d!56015 (not c!34486)) b!191543))

(assert (= (and b!191543 c!34489) b!191549))

(assert (= (and b!191543 (not c!34489)) b!191541))

(assert (= (and b!191541 c!34490) b!191551))

(assert (= (and b!191541 (not c!34490)) b!191542))

(assert (= (or b!191551 b!191542) bm!19329))

(assert (= (or b!191549 bm!19329) bm!19334))

(assert (= (or b!191549 b!191551) bm!19333))

(assert (= (or b!191534 bm!19334) bm!19330))

(assert (= (or b!191534 bm!19333) bm!19331))

(assert (= (and d!56015 res!90494) b!191552))

(assert (= (and d!56015 c!34488) b!191539))

(assert (= (and d!56015 (not c!34488)) b!191548))

(assert (= (and d!56015 res!90495) b!191535))

(assert (= (and b!191535 res!90492) b!191550))

(assert (= (and b!191535 (not res!90497)) b!191544))

(assert (= (and b!191544 res!90490) b!191545))

(assert (= (and b!191535 res!90496) b!191533))

(assert (= (and b!191533 c!34487) b!191540))

(assert (= (and b!191533 (not c!34487)) b!191546))

(assert (= (and b!191540 res!90493) b!191536))

(assert (= (or b!191540 b!191546) bm!19335))

(assert (= (and b!191533 res!90489) b!191547))

(assert (= (and b!191547 c!34491) b!191538))

(assert (= (and b!191547 (not c!34491)) b!191537))

(assert (= (and b!191538 res!90491) b!191553))

(assert (= (or b!191538 b!191537) bm!19332))

(declare-fun b_lambda!7383 () Bool)

(assert (=> (not b_lambda!7383) (not b!191545)))

(assert (=> b!191545 t!7314))

(declare-fun b_and!11337 () Bool)

(assert (= b_and!11335 (and (=> t!7314 result!4895) b_and!11337)))

(assert (=> b!191552 m!217577))

(assert (=> b!191552 m!217577))

(assert (=> b!191552 m!217579))

(assert (=> b!191545 m!217577))

(declare-fun m!217643 () Bool)

(assert (=> b!191545 m!217643))

(declare-fun m!217645 () Bool)

(assert (=> b!191545 m!217645))

(assert (=> b!191545 m!217585))

(declare-fun m!217647 () Bool)

(assert (=> b!191545 m!217647))

(assert (=> b!191545 m!217577))

(assert (=> b!191545 m!217585))

(assert (=> b!191545 m!217645))

(declare-fun m!217649 () Bool)

(assert (=> b!191553 m!217649))

(assert (=> d!56015 m!217479))

(declare-fun m!217651 () Bool)

(assert (=> bm!19330 m!217651))

(assert (=> b!191544 m!217577))

(assert (=> b!191544 m!217577))

(declare-fun m!217653 () Bool)

(assert (=> b!191544 m!217653))

(declare-fun m!217655 () Bool)

(assert (=> b!191534 m!217655))

(declare-fun m!217657 () Bool)

(assert (=> b!191539 m!217657))

(declare-fun m!217659 () Bool)

(assert (=> b!191539 m!217659))

(declare-fun m!217661 () Bool)

(assert (=> b!191539 m!217661))

(declare-fun m!217663 () Bool)

(assert (=> b!191539 m!217663))

(assert (=> b!191539 m!217661))

(declare-fun m!217665 () Bool)

(assert (=> b!191539 m!217665))

(declare-fun m!217667 () Bool)

(assert (=> b!191539 m!217667))

(declare-fun m!217669 () Bool)

(assert (=> b!191539 m!217669))

(declare-fun m!217671 () Bool)

(assert (=> b!191539 m!217671))

(declare-fun m!217673 () Bool)

(assert (=> b!191539 m!217673))

(declare-fun m!217675 () Bool)

(assert (=> b!191539 m!217675))

(declare-fun m!217677 () Bool)

(assert (=> b!191539 m!217677))

(declare-fun m!217679 () Bool)

(assert (=> b!191539 m!217679))

(assert (=> b!191539 m!217667))

(declare-fun m!217681 () Bool)

(assert (=> b!191539 m!217681))

(declare-fun m!217683 () Bool)

(assert (=> b!191539 m!217683))

(declare-fun m!217685 () Bool)

(assert (=> b!191539 m!217685))

(assert (=> b!191539 m!217657))

(assert (=> b!191539 m!217651))

(assert (=> b!191539 m!217577))

(assert (=> b!191539 m!217673))

(declare-fun m!217687 () Bool)

(assert (=> b!191536 m!217687))

(declare-fun m!217689 () Bool)

(assert (=> bm!19335 m!217689))

(declare-fun m!217691 () Bool)

(assert (=> bm!19332 m!217691))

(assert (=> b!191550 m!217577))

(assert (=> b!191550 m!217577))

(assert (=> b!191550 m!217579))

(declare-fun m!217693 () Bool)

(assert (=> bm!19331 m!217693))

(assert (=> b!191359 d!56015))

(declare-fun d!56017 () Bool)

(declare-fun e!126062 () Bool)

(assert (=> d!56017 e!126062))

(declare-fun res!90500 () Bool)

(assert (=> d!56017 (=> (not res!90500) (not e!126062))))

(assert (=> d!56017 (= res!90500 (and (bvsge (index!4895 lt!94908) #b00000000000000000000000000000000) (bvslt (index!4895 lt!94908) (size!4150 (_values!3892 thiss!1248)))))))

(declare-fun lt!95057 () Unit!5743)

(declare-fun choose!1045 (array!8125 array!8127 (_ BitVec 32) (_ BitVec 32) V!5585 V!5585 (_ BitVec 32) (_ BitVec 64) V!5585 Int) Unit!5743)

(assert (=> d!56017 (= lt!95057 (choose!1045 (_keys!5886 thiss!1248) (_values!3892 thiss!1248) (mask!9129 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) (index!4895 lt!94908) key!828 v!309 (defaultEntry!3909 thiss!1248)))))

(assert (=> d!56017 (validMask!0 (mask!9129 thiss!1248))))

(assert (=> d!56017 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!120 (_keys!5886 thiss!1248) (_values!3892 thiss!1248) (mask!9129 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) (index!4895 lt!94908) key!828 v!309 (defaultEntry!3909 thiss!1248)) lt!95057)))

(declare-fun b!191556 () Bool)

(assert (=> b!191556 (= e!126062 (= (+!304 (getCurrentListMap!845 (_keys!5886 thiss!1248) (_values!3892 thiss!1248) (mask!9129 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248)) (tuple2!3485 key!828 v!309)) (getCurrentListMap!845 (_keys!5886 thiss!1248) (array!8128 (store (arr!3827 (_values!3892 thiss!1248)) (index!4895 lt!94908) (ValueCellFull!1883 v!309)) (size!4150 (_values!3892 thiss!1248))) (mask!9129 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248))))))

(assert (= (and d!56017 res!90500) b!191556))

(declare-fun m!217695 () Bool)

(assert (=> d!56017 m!217695))

(assert (=> d!56017 m!217479))

(assert (=> b!191556 m!217473))

(assert (=> b!191556 m!217473))

(declare-fun m!217697 () Bool)

(assert (=> b!191556 m!217697))

(assert (=> b!191556 m!217481))

(assert (=> b!191556 m!217477))

(assert (=> b!191359 d!56017))

(declare-fun d!56019 () Bool)

(declare-fun e!126065 () Bool)

(assert (=> d!56019 e!126065))

(declare-fun res!90506 () Bool)

(assert (=> d!56019 (=> (not res!90506) (not e!126065))))

(declare-fun lt!95068 () ListLongMap!2393)

(assert (=> d!56019 (= res!90506 (contains!1332 lt!95068 (_1!1753 (tuple2!3485 key!828 v!309))))))

(declare-fun lt!95067 () List!2405)

(assert (=> d!56019 (= lt!95068 (ListLongMap!2394 lt!95067))))

(declare-fun lt!95066 () Unit!5743)

(declare-fun lt!95069 () Unit!5743)

(assert (=> d!56019 (= lt!95066 lt!95069)))

(assert (=> d!56019 (= (getValueByKey!237 lt!95067 (_1!1753 (tuple2!3485 key!828 v!309))) (Some!242 (_2!1753 (tuple2!3485 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!127 (List!2405 (_ BitVec 64) V!5585) Unit!5743)

(assert (=> d!56019 (= lt!95069 (lemmaContainsTupThenGetReturnValue!127 lt!95067 (_1!1753 (tuple2!3485 key!828 v!309)) (_2!1753 (tuple2!3485 key!828 v!309))))))

(declare-fun insertStrictlySorted!130 (List!2405 (_ BitVec 64) V!5585) List!2405)

(assert (=> d!56019 (= lt!95067 (insertStrictlySorted!130 (toList!1212 lt!94909) (_1!1753 (tuple2!3485 key!828 v!309)) (_2!1753 (tuple2!3485 key!828 v!309))))))

(assert (=> d!56019 (= (+!304 lt!94909 (tuple2!3485 key!828 v!309)) lt!95068)))

(declare-fun b!191561 () Bool)

(declare-fun res!90505 () Bool)

(assert (=> b!191561 (=> (not res!90505) (not e!126065))))

(assert (=> b!191561 (= res!90505 (= (getValueByKey!237 (toList!1212 lt!95068) (_1!1753 (tuple2!3485 key!828 v!309))) (Some!242 (_2!1753 (tuple2!3485 key!828 v!309)))))))

(declare-fun b!191562 () Bool)

(declare-fun contains!1335 (List!2405 tuple2!3484) Bool)

(assert (=> b!191562 (= e!126065 (contains!1335 (toList!1212 lt!95068) (tuple2!3485 key!828 v!309)))))

(assert (= (and d!56019 res!90506) b!191561))

(assert (= (and b!191561 res!90505) b!191562))

(declare-fun m!217699 () Bool)

(assert (=> d!56019 m!217699))

(declare-fun m!217701 () Bool)

(assert (=> d!56019 m!217701))

(declare-fun m!217703 () Bool)

(assert (=> d!56019 m!217703))

(declare-fun m!217705 () Bool)

(assert (=> d!56019 m!217705))

(declare-fun m!217707 () Bool)

(assert (=> b!191561 m!217707))

(declare-fun m!217709 () Bool)

(assert (=> b!191562 m!217709))

(assert (=> b!191359 d!56019))

(declare-fun b!191576 () Bool)

(declare-fun e!126072 () SeekEntryResult!681)

(declare-fun lt!95076 () SeekEntryResult!681)

(assert (=> b!191576 (= e!126072 (Found!681 (index!4896 lt!95076)))))

(declare-fun b!191577 () Bool)

(declare-fun c!34499 () Bool)

(declare-fun lt!95077 () (_ BitVec 64))

(assert (=> b!191577 (= c!34499 (= lt!95077 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!126074 () SeekEntryResult!681)

(assert (=> b!191577 (= e!126072 e!126074)))

(declare-fun b!191578 () Bool)

(assert (=> b!191578 (= e!126074 (MissingZero!681 (index!4896 lt!95076)))))

(declare-fun b!191579 () Bool)

(declare-fun e!126073 () SeekEntryResult!681)

(assert (=> b!191579 (= e!126073 e!126072)))

(assert (=> b!191579 (= lt!95077 (select (arr!3826 (_keys!5886 thiss!1248)) (index!4896 lt!95076)))))

(declare-fun c!34500 () Bool)

(assert (=> b!191579 (= c!34500 (= lt!95077 key!828))))

(declare-fun b!191580 () Bool)

(assert (=> b!191580 (= e!126073 Undefined!681)))

(declare-fun b!191575 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8125 (_ BitVec 32)) SeekEntryResult!681)

(assert (=> b!191575 (= e!126074 (seekKeyOrZeroReturnVacant!0 (x!20552 lt!95076) (index!4896 lt!95076) (index!4896 lt!95076) key!828 (_keys!5886 thiss!1248) (mask!9129 thiss!1248)))))

(declare-fun d!56021 () Bool)

(declare-fun lt!95078 () SeekEntryResult!681)

(assert (=> d!56021 (and (or ((_ is Undefined!681) lt!95078) (not ((_ is Found!681) lt!95078)) (and (bvsge (index!4895 lt!95078) #b00000000000000000000000000000000) (bvslt (index!4895 lt!95078) (size!4149 (_keys!5886 thiss!1248))))) (or ((_ is Undefined!681) lt!95078) ((_ is Found!681) lt!95078) (not ((_ is MissingZero!681) lt!95078)) (and (bvsge (index!4894 lt!95078) #b00000000000000000000000000000000) (bvslt (index!4894 lt!95078) (size!4149 (_keys!5886 thiss!1248))))) (or ((_ is Undefined!681) lt!95078) ((_ is Found!681) lt!95078) ((_ is MissingZero!681) lt!95078) (not ((_ is MissingVacant!681) lt!95078)) (and (bvsge (index!4897 lt!95078) #b00000000000000000000000000000000) (bvslt (index!4897 lt!95078) (size!4149 (_keys!5886 thiss!1248))))) (or ((_ is Undefined!681) lt!95078) (ite ((_ is Found!681) lt!95078) (= (select (arr!3826 (_keys!5886 thiss!1248)) (index!4895 lt!95078)) key!828) (ite ((_ is MissingZero!681) lt!95078) (= (select (arr!3826 (_keys!5886 thiss!1248)) (index!4894 lt!95078)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!681) lt!95078) (= (select (arr!3826 (_keys!5886 thiss!1248)) (index!4897 lt!95078)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!56021 (= lt!95078 e!126073)))

(declare-fun c!34498 () Bool)

(assert (=> d!56021 (= c!34498 (and ((_ is Intermediate!681) lt!95076) (undefined!1493 lt!95076)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8125 (_ BitVec 32)) SeekEntryResult!681)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!56021 (= lt!95076 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9129 thiss!1248)) key!828 (_keys!5886 thiss!1248) (mask!9129 thiss!1248)))))

(assert (=> d!56021 (validMask!0 (mask!9129 thiss!1248))))

(assert (=> d!56021 (= (seekEntryOrOpen!0 key!828 (_keys!5886 thiss!1248) (mask!9129 thiss!1248)) lt!95078)))

(assert (= (and d!56021 c!34498) b!191580))

(assert (= (and d!56021 (not c!34498)) b!191579))

(assert (= (and b!191579 c!34500) b!191576))

(assert (= (and b!191579 (not c!34500)) b!191577))

(assert (= (and b!191577 c!34499) b!191578))

(assert (= (and b!191577 (not c!34499)) b!191575))

(declare-fun m!217711 () Bool)

(assert (=> b!191579 m!217711))

(declare-fun m!217713 () Bool)

(assert (=> b!191575 m!217713))

(assert (=> d!56021 m!217479))

(declare-fun m!217715 () Bool)

(assert (=> d!56021 m!217715))

(declare-fun m!217717 () Bool)

(assert (=> d!56021 m!217717))

(declare-fun m!217719 () Bool)

(assert (=> d!56021 m!217719))

(assert (=> d!56021 m!217715))

(declare-fun m!217721 () Bool)

(assert (=> d!56021 m!217721))

(declare-fun m!217723 () Bool)

(assert (=> d!56021 m!217723))

(assert (=> b!191366 d!56021))

(declare-fun d!56023 () Bool)

(declare-fun e!126077 () Bool)

(assert (=> d!56023 e!126077))

(declare-fun res!90511 () Bool)

(assert (=> d!56023 (=> (not res!90511) (not e!126077))))

(declare-fun lt!95084 () SeekEntryResult!681)

(assert (=> d!56023 (= res!90511 ((_ is Found!681) lt!95084))))

(assert (=> d!56023 (= lt!95084 (seekEntryOrOpen!0 key!828 (_keys!5886 thiss!1248) (mask!9129 thiss!1248)))))

(declare-fun lt!95083 () Unit!5743)

(declare-fun choose!1046 (array!8125 array!8127 (_ BitVec 32) (_ BitVec 32) V!5585 V!5585 (_ BitVec 64) Int) Unit!5743)

(assert (=> d!56023 (= lt!95083 (choose!1046 (_keys!5886 thiss!1248) (_values!3892 thiss!1248) (mask!9129 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) key!828 (defaultEntry!3909 thiss!1248)))))

(assert (=> d!56023 (validMask!0 (mask!9129 thiss!1248))))

(assert (=> d!56023 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!171 (_keys!5886 thiss!1248) (_values!3892 thiss!1248) (mask!9129 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) key!828 (defaultEntry!3909 thiss!1248)) lt!95083)))

(declare-fun b!191585 () Bool)

(declare-fun res!90512 () Bool)

(assert (=> b!191585 (=> (not res!90512) (not e!126077))))

(assert (=> b!191585 (= res!90512 (inRange!0 (index!4895 lt!95084) (mask!9129 thiss!1248)))))

(declare-fun b!191586 () Bool)

(assert (=> b!191586 (= e!126077 (= (select (arr!3826 (_keys!5886 thiss!1248)) (index!4895 lt!95084)) key!828))))

(assert (=> b!191586 (and (bvsge (index!4895 lt!95084) #b00000000000000000000000000000000) (bvslt (index!4895 lt!95084) (size!4149 (_keys!5886 thiss!1248))))))

(assert (= (and d!56023 res!90511) b!191585))

(assert (= (and b!191585 res!90512) b!191586))

(assert (=> d!56023 m!217497))

(declare-fun m!217725 () Bool)

(assert (=> d!56023 m!217725))

(assert (=> d!56023 m!217479))

(declare-fun m!217727 () Bool)

(assert (=> b!191585 m!217727))

(declare-fun m!217729 () Bool)

(assert (=> b!191586 m!217729))

(assert (=> b!191362 d!56023))

(declare-fun d!56025 () Bool)

(assert (=> d!56025 (= (inRange!0 (index!4895 lt!94908) (mask!9129 thiss!1248)) (and (bvsge (index!4895 lt!94908) #b00000000000000000000000000000000) (bvslt (index!4895 lt!94908) (bvadd (mask!9129 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!191362 d!56025))

(declare-fun d!56027 () Bool)

(declare-fun res!90519 () Bool)

(declare-fun e!126080 () Bool)

(assert (=> d!56027 (=> (not res!90519) (not e!126080))))

(declare-fun simpleValid!198 (LongMapFixedSize!2674) Bool)

(assert (=> d!56027 (= res!90519 (simpleValid!198 thiss!1248))))

(assert (=> d!56027 (= (valid!1115 thiss!1248) e!126080)))

(declare-fun b!191593 () Bool)

(declare-fun res!90520 () Bool)

(assert (=> b!191593 (=> (not res!90520) (not e!126080))))

(declare-fun arrayCountValidKeys!0 (array!8125 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!191593 (= res!90520 (= (arrayCountValidKeys!0 (_keys!5886 thiss!1248) #b00000000000000000000000000000000 (size!4149 (_keys!5886 thiss!1248))) (_size!1386 thiss!1248)))))

(declare-fun b!191594 () Bool)

(declare-fun res!90521 () Bool)

(assert (=> b!191594 (=> (not res!90521) (not e!126080))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8125 (_ BitVec 32)) Bool)

(assert (=> b!191594 (= res!90521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5886 thiss!1248) (mask!9129 thiss!1248)))))

(declare-fun b!191595 () Bool)

(declare-datatypes ((List!2408 0))(
  ( (Nil!2405) (Cons!2404 (h!3043 (_ BitVec 64)) (t!7315 List!2408)) )
))
(declare-fun arrayNoDuplicates!0 (array!8125 (_ BitVec 32) List!2408) Bool)

(assert (=> b!191595 (= e!126080 (arrayNoDuplicates!0 (_keys!5886 thiss!1248) #b00000000000000000000000000000000 Nil!2405))))

(assert (= (and d!56027 res!90519) b!191593))

(assert (= (and b!191593 res!90520) b!191594))

(assert (= (and b!191594 res!90521) b!191595))

(declare-fun m!217731 () Bool)

(assert (=> d!56027 m!217731))

(declare-fun m!217733 () Bool)

(assert (=> b!191593 m!217733))

(declare-fun m!217735 () Bool)

(assert (=> b!191594 m!217735))

(declare-fun m!217737 () Bool)

(assert (=> b!191595 m!217737))

(assert (=> start!19508 d!56027))

(declare-fun d!56029 () Bool)

(assert (=> d!56029 (= (array_inv!2483 (_keys!5886 thiss!1248)) (bvsge (size!4149 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!191360 d!56029))

(declare-fun d!56031 () Bool)

(assert (=> d!56031 (= (array_inv!2484 (_values!3892 thiss!1248)) (bvsge (size!4150 (_values!3892 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!191360 d!56031))

(declare-fun b!191602 () Bool)

(declare-fun e!126086 () Bool)

(assert (=> b!191602 (= e!126086 tp_is_empty!4453)))

(declare-fun mapNonEmpty!7701 () Bool)

(declare-fun mapRes!7701 () Bool)

(declare-fun tp!16908 () Bool)

(assert (=> mapNonEmpty!7701 (= mapRes!7701 (and tp!16908 e!126086))))

(declare-fun mapValue!7701 () ValueCell!1883)

(declare-fun mapRest!7701 () (Array (_ BitVec 32) ValueCell!1883))

(declare-fun mapKey!7701 () (_ BitVec 32))

(assert (=> mapNonEmpty!7701 (= mapRest!7692 (store mapRest!7701 mapKey!7701 mapValue!7701))))

(declare-fun b!191603 () Bool)

(declare-fun e!126085 () Bool)

(assert (=> b!191603 (= e!126085 tp_is_empty!4453)))

(declare-fun condMapEmpty!7701 () Bool)

(declare-fun mapDefault!7701 () ValueCell!1883)

(assert (=> mapNonEmpty!7692 (= condMapEmpty!7701 (= mapRest!7692 ((as const (Array (_ BitVec 32) ValueCell!1883)) mapDefault!7701)))))

(assert (=> mapNonEmpty!7692 (= tp!16893 (and e!126085 mapRes!7701))))

(declare-fun mapIsEmpty!7701 () Bool)

(assert (=> mapIsEmpty!7701 mapRes!7701))

(assert (= (and mapNonEmpty!7692 condMapEmpty!7701) mapIsEmpty!7701))

(assert (= (and mapNonEmpty!7692 (not condMapEmpty!7701)) mapNonEmpty!7701))

(assert (= (and mapNonEmpty!7701 ((_ is ValueCellFull!1883) mapValue!7701)) b!191602))

(assert (= (and mapNonEmpty!7692 ((_ is ValueCellFull!1883) mapDefault!7701)) b!191603))

(declare-fun m!217739 () Bool)

(assert (=> mapNonEmpty!7701 m!217739))

(declare-fun b_lambda!7385 () Bool)

(assert (= b_lambda!7383 (or (and b!191360 b_free!4681) b_lambda!7385)))

(declare-fun b_lambda!7387 () Bool)

(assert (= b_lambda!7381 (or (and b!191360 b_free!4681) b_lambda!7387)))

(check-sat (not b!191594) (not b!191553) (not b!191585) (not bm!19306) (not b!191502) (not b!191575) (not d!56009) (not d!56017) (not b!191593) (not mapNonEmpty!7701) (not bm!19330) (not d!56027) (not b!191562) (not b!191520) (not b!191534) b_and!11337 (not b!191545) (not b!191530) (not d!56007) (not bm!19332) (not bm!19335) (not d!56023) (not b!191561) (not b!191521) (not bm!19331) (not b!191544) (not bm!19307) (not d!56021) (not b!191532) tp_is_empty!4453 (not b_lambda!7385) (not b!191539) (not b!191552) (not b!191513) (not d!56015) (not bm!19323) (not d!56019) (not bm!19328) (not b!191504) (not bm!19324) (not bm!19325) (not b!191595) (not d!56013) (not b_lambda!7387) (not b!191550) (not b!191512) (not b!191536) (not b!191507) (not b!191518) (not b_next!4681) (not b!191556))
(check-sat b_and!11337 (not b_next!4681))
(get-model)

(declare-fun d!56033 () Bool)

(declare-fun res!90526 () Bool)

(declare-fun e!126091 () Bool)

(assert (=> d!56033 (=> res!90526 e!126091)))

(assert (=> d!56033 (= res!90526 (= (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000) key!828))))

(assert (=> d!56033 (= (arrayContainsKey!0 (_keys!5886 thiss!1248) key!828 #b00000000000000000000000000000000) e!126091)))

(declare-fun b!191608 () Bool)

(declare-fun e!126092 () Bool)

(assert (=> b!191608 (= e!126091 e!126092)))

(declare-fun res!90527 () Bool)

(assert (=> b!191608 (=> (not res!90527) (not e!126092))))

(assert (=> b!191608 (= res!90527 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4149 (_keys!5886 thiss!1248))))))

(declare-fun b!191609 () Bool)

(assert (=> b!191609 (= e!126092 (arrayContainsKey!0 (_keys!5886 thiss!1248) key!828 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!56033 (not res!90526)) b!191608))

(assert (= (and b!191608 res!90527) b!191609))

(assert (=> d!56033 m!217577))

(declare-fun m!217741 () Bool)

(assert (=> b!191609 m!217741))

(assert (=> bm!19306 d!56033))

(assert (=> d!56009 d!56011))

(declare-fun b!191618 () Bool)

(declare-fun e!126097 () Option!243)

(assert (=> b!191618 (= e!126097 (Some!242 (_2!1753 (h!3040 (toList!1212 lt!95068)))))))

(declare-fun b!191619 () Bool)

(declare-fun e!126098 () Option!243)

(assert (=> b!191619 (= e!126097 e!126098)))

(declare-fun c!34506 () Bool)

(assert (=> b!191619 (= c!34506 (and ((_ is Cons!2401) (toList!1212 lt!95068)) (not (= (_1!1753 (h!3040 (toList!1212 lt!95068))) (_1!1753 (tuple2!3485 key!828 v!309))))))))

(declare-fun d!56035 () Bool)

(declare-fun c!34505 () Bool)

(assert (=> d!56035 (= c!34505 (and ((_ is Cons!2401) (toList!1212 lt!95068)) (= (_1!1753 (h!3040 (toList!1212 lt!95068))) (_1!1753 (tuple2!3485 key!828 v!309)))))))

(assert (=> d!56035 (= (getValueByKey!237 (toList!1212 lt!95068) (_1!1753 (tuple2!3485 key!828 v!309))) e!126097)))

(declare-fun b!191621 () Bool)

(assert (=> b!191621 (= e!126098 None!241)))

(declare-fun b!191620 () Bool)

(assert (=> b!191620 (= e!126098 (getValueByKey!237 (t!7310 (toList!1212 lt!95068)) (_1!1753 (tuple2!3485 key!828 v!309))))))

(assert (= (and d!56035 c!34505) b!191618))

(assert (= (and d!56035 (not c!34505)) b!191619))

(assert (= (and b!191619 c!34506) b!191620))

(assert (= (and b!191619 (not c!34506)) b!191621))

(declare-fun m!217743 () Bool)

(assert (=> b!191620 m!217743))

(assert (=> b!191561 d!56035))

(declare-fun d!56037 () Bool)

(declare-fun lt!95087 () (_ BitVec 32))

(assert (=> d!56037 (and (bvsge lt!95087 #b00000000000000000000000000000000) (bvsle lt!95087 (bvsub (size!4149 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!126103 () (_ BitVec 32))

(assert (=> d!56037 (= lt!95087 e!126103)))

(declare-fun c!34511 () Bool)

(assert (=> d!56037 (= c!34511 (bvsge #b00000000000000000000000000000000 (size!4149 (_keys!5886 thiss!1248))))))

(assert (=> d!56037 (and (bvsle #b00000000000000000000000000000000 (size!4149 (_keys!5886 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!4149 (_keys!5886 thiss!1248)) (size!4149 (_keys!5886 thiss!1248))))))

(assert (=> d!56037 (= (arrayCountValidKeys!0 (_keys!5886 thiss!1248) #b00000000000000000000000000000000 (size!4149 (_keys!5886 thiss!1248))) lt!95087)))

(declare-fun b!191630 () Bool)

(declare-fun e!126104 () (_ BitVec 32))

(declare-fun call!19341 () (_ BitVec 32))

(assert (=> b!191630 (= e!126104 call!19341)))

(declare-fun b!191631 () Bool)

(assert (=> b!191631 (= e!126103 e!126104)))

(declare-fun c!34512 () Bool)

(assert (=> b!191631 (= c!34512 (validKeyInArray!0 (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191632 () Bool)

(assert (=> b!191632 (= e!126104 (bvadd #b00000000000000000000000000000001 call!19341))))

(declare-fun bm!19338 () Bool)

(assert (=> bm!19338 (= call!19341 (arrayCountValidKeys!0 (_keys!5886 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4149 (_keys!5886 thiss!1248))))))

(declare-fun b!191633 () Bool)

(assert (=> b!191633 (= e!126103 #b00000000000000000000000000000000)))

(assert (= (and d!56037 c!34511) b!191633))

(assert (= (and d!56037 (not c!34511)) b!191631))

(assert (= (and b!191631 c!34512) b!191632))

(assert (= (and b!191631 (not c!34512)) b!191630))

(assert (= (or b!191632 b!191630) bm!19338))

(assert (=> b!191631 m!217577))

(assert (=> b!191631 m!217577))

(assert (=> b!191631 m!217579))

(declare-fun m!217745 () Bool)

(assert (=> bm!19338 m!217745))

(assert (=> b!191593 d!56037))

(declare-fun b!191643 () Bool)

(declare-fun res!90537 () Bool)

(declare-fun e!126107 () Bool)

(assert (=> b!191643 (=> (not res!90537) (not e!126107))))

(declare-fun size!4155 (LongMapFixedSize!2674) (_ BitVec 32))

(assert (=> b!191643 (= res!90537 (bvsge (size!4155 thiss!1248) (_size!1386 thiss!1248)))))

(declare-fun b!191644 () Bool)

(declare-fun res!90539 () Bool)

(assert (=> b!191644 (=> (not res!90539) (not e!126107))))

(assert (=> b!191644 (= res!90539 (= (size!4155 thiss!1248) (bvadd (_size!1386 thiss!1248) (bvsdiv (bvadd (extraKeys!3646 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!191645 () Bool)

(assert (=> b!191645 (= e!126107 (and (bvsge (extraKeys!3646 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3646 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1386 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun d!56039 () Bool)

(declare-fun res!90536 () Bool)

(assert (=> d!56039 (=> (not res!90536) (not e!126107))))

(assert (=> d!56039 (= res!90536 (validMask!0 (mask!9129 thiss!1248)))))

(assert (=> d!56039 (= (simpleValid!198 thiss!1248) e!126107)))

(declare-fun b!191642 () Bool)

(declare-fun res!90538 () Bool)

(assert (=> b!191642 (=> (not res!90538) (not e!126107))))

(assert (=> b!191642 (= res!90538 (and (= (size!4150 (_values!3892 thiss!1248)) (bvadd (mask!9129 thiss!1248) #b00000000000000000000000000000001)) (= (size!4149 (_keys!5886 thiss!1248)) (size!4150 (_values!3892 thiss!1248))) (bvsge (_size!1386 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1386 thiss!1248) (bvadd (mask!9129 thiss!1248) #b00000000000000000000000000000001))))))

(assert (= (and d!56039 res!90536) b!191642))

(assert (= (and b!191642 res!90538) b!191643))

(assert (= (and b!191643 res!90537) b!191644))

(assert (= (and b!191644 res!90539) b!191645))

(declare-fun m!217747 () Bool)

(assert (=> b!191643 m!217747))

(assert (=> b!191644 m!217747))

(assert (=> d!56039 m!217479))

(assert (=> d!56027 d!56039))

(declare-fun lt!95090 () Bool)

(declare-fun d!56041 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!153 (List!2405) (InoxSet tuple2!3484))

(assert (=> d!56041 (= lt!95090 (select (content!153 (toList!1212 lt!95068)) (tuple2!3485 key!828 v!309)))))

(declare-fun e!126112 () Bool)

(assert (=> d!56041 (= lt!95090 e!126112)))

(declare-fun res!90544 () Bool)

(assert (=> d!56041 (=> (not res!90544) (not e!126112))))

(assert (=> d!56041 (= res!90544 ((_ is Cons!2401) (toList!1212 lt!95068)))))

(assert (=> d!56041 (= (contains!1335 (toList!1212 lt!95068) (tuple2!3485 key!828 v!309)) lt!95090)))

(declare-fun b!191650 () Bool)

(declare-fun e!126113 () Bool)

(assert (=> b!191650 (= e!126112 e!126113)))

(declare-fun res!90545 () Bool)

(assert (=> b!191650 (=> res!90545 e!126113)))

(assert (=> b!191650 (= res!90545 (= (h!3040 (toList!1212 lt!95068)) (tuple2!3485 key!828 v!309)))))

(declare-fun b!191651 () Bool)

(assert (=> b!191651 (= e!126113 (contains!1335 (t!7310 (toList!1212 lt!95068)) (tuple2!3485 key!828 v!309)))))

(assert (= (and d!56041 res!90544) b!191650))

(assert (= (and b!191650 (not res!90545)) b!191651))

(declare-fun m!217749 () Bool)

(assert (=> d!56041 m!217749))

(declare-fun m!217751 () Bool)

(assert (=> d!56041 m!217751))

(declare-fun m!217753 () Bool)

(assert (=> b!191651 m!217753))

(assert (=> b!191562 d!56041))

(declare-fun d!56043 () Bool)

(assert (=> d!56043 (= (+!304 (getCurrentListMap!845 (_keys!5886 thiss!1248) (_values!3892 thiss!1248) (mask!9129 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248)) (tuple2!3485 key!828 v!309)) (getCurrentListMap!845 (_keys!5886 thiss!1248) (array!8128 (store (arr!3827 (_values!3892 thiss!1248)) (index!4895 lt!94908) (ValueCellFull!1883 v!309)) (size!4150 (_values!3892 thiss!1248))) (mask!9129 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248)))))

(assert (=> d!56043 true))

(declare-fun _$5!152 () Unit!5743)

(assert (=> d!56043 (= (choose!1045 (_keys!5886 thiss!1248) (_values!3892 thiss!1248) (mask!9129 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) (index!4895 lt!94908) key!828 v!309 (defaultEntry!3909 thiss!1248)) _$5!152)))

(declare-fun bs!7639 () Bool)

(assert (= bs!7639 d!56043))

(assert (=> bs!7639 m!217473))

(assert (=> bs!7639 m!217473))

(assert (=> bs!7639 m!217697))

(assert (=> bs!7639 m!217481))

(assert (=> bs!7639 m!217477))

(assert (=> d!56017 d!56043))

(assert (=> d!56017 d!56011))

(declare-fun b!191660 () Bool)

(declare-fun e!126120 () Bool)

(declare-fun call!19344 () Bool)

(assert (=> b!191660 (= e!126120 call!19344)))

(declare-fun b!191661 () Bool)

(declare-fun e!126121 () Bool)

(declare-fun e!126122 () Bool)

(assert (=> b!191661 (= e!126121 e!126122)))

(declare-fun c!34515 () Bool)

(assert (=> b!191661 (= c!34515 (validKeyInArray!0 (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!56045 () Bool)

(declare-fun res!90550 () Bool)

(assert (=> d!56045 (=> res!90550 e!126121)))

(assert (=> d!56045 (= res!90550 (bvsge #b00000000000000000000000000000000 (size!4149 (_keys!5886 thiss!1248))))))

(assert (=> d!56045 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5886 thiss!1248) (mask!9129 thiss!1248)) e!126121)))

(declare-fun b!191662 () Bool)

(assert (=> b!191662 (= e!126122 e!126120)))

(declare-fun lt!95098 () (_ BitVec 64))

(assert (=> b!191662 (= lt!95098 (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95099 () Unit!5743)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8125 (_ BitVec 64) (_ BitVec 32)) Unit!5743)

(assert (=> b!191662 (= lt!95099 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5886 thiss!1248) lt!95098 #b00000000000000000000000000000000))))

(assert (=> b!191662 (arrayContainsKey!0 (_keys!5886 thiss!1248) lt!95098 #b00000000000000000000000000000000)))

(declare-fun lt!95097 () Unit!5743)

(assert (=> b!191662 (= lt!95097 lt!95099)))

(declare-fun res!90551 () Bool)

(assert (=> b!191662 (= res!90551 (= (seekEntryOrOpen!0 (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000) (_keys!5886 thiss!1248) (mask!9129 thiss!1248)) (Found!681 #b00000000000000000000000000000000)))))

(assert (=> b!191662 (=> (not res!90551) (not e!126120))))

(declare-fun b!191663 () Bool)

(assert (=> b!191663 (= e!126122 call!19344)))

(declare-fun bm!19341 () Bool)

(assert (=> bm!19341 (= call!19344 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5886 thiss!1248) (mask!9129 thiss!1248)))))

(assert (= (and d!56045 (not res!90550)) b!191661))

(assert (= (and b!191661 c!34515) b!191662))

(assert (= (and b!191661 (not c!34515)) b!191663))

(assert (= (and b!191662 res!90551) b!191660))

(assert (= (or b!191660 b!191663) bm!19341))

(assert (=> b!191661 m!217577))

(assert (=> b!191661 m!217577))

(assert (=> b!191661 m!217579))

(assert (=> b!191662 m!217577))

(declare-fun m!217755 () Bool)

(assert (=> b!191662 m!217755))

(declare-fun m!217757 () Bool)

(assert (=> b!191662 m!217757))

(assert (=> b!191662 m!217577))

(declare-fun m!217759 () Bool)

(assert (=> b!191662 m!217759))

(declare-fun m!217761 () Bool)

(assert (=> bm!19341 m!217761))

(assert (=> b!191594 d!56045))

(declare-fun d!56047 () Bool)

(declare-fun e!126123 () Bool)

(assert (=> d!56047 e!126123))

(declare-fun res!90553 () Bool)

(assert (=> d!56047 (=> (not res!90553) (not e!126123))))

(declare-fun lt!95102 () ListLongMap!2393)

(assert (=> d!56047 (= res!90553 (contains!1332 lt!95102 (_1!1753 (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))))))

(declare-fun lt!95101 () List!2405)

(assert (=> d!56047 (= lt!95102 (ListLongMap!2394 lt!95101))))

(declare-fun lt!95100 () Unit!5743)

(declare-fun lt!95103 () Unit!5743)

(assert (=> d!56047 (= lt!95100 lt!95103)))

(assert (=> d!56047 (= (getValueByKey!237 lt!95101 (_1!1753 (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))) (Some!242 (_2!1753 (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))))))

(assert (=> d!56047 (= lt!95103 (lemmaContainsTupThenGetReturnValue!127 lt!95101 (_1!1753 (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))) (_2!1753 (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))))))

(assert (=> d!56047 (= lt!95101 (insertStrictlySorted!130 (toList!1212 call!19331) (_1!1753 (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))) (_2!1753 (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))))))

(assert (=> d!56047 (= (+!304 call!19331 (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))) lt!95102)))

(declare-fun b!191664 () Bool)

(declare-fun res!90552 () Bool)

(assert (=> b!191664 (=> (not res!90552) (not e!126123))))

(assert (=> b!191664 (= res!90552 (= (getValueByKey!237 (toList!1212 lt!95102) (_1!1753 (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))) (Some!242 (_2!1753 (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))))))))

(declare-fun b!191665 () Bool)

(assert (=> b!191665 (= e!126123 (contains!1335 (toList!1212 lt!95102) (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))))))

(assert (= (and d!56047 res!90553) b!191664))

(assert (= (and b!191664 res!90552) b!191665))

(declare-fun m!217763 () Bool)

(assert (=> d!56047 m!217763))

(declare-fun m!217765 () Bool)

(assert (=> d!56047 m!217765))

(declare-fun m!217767 () Bool)

(assert (=> d!56047 m!217767))

(declare-fun m!217769 () Bool)

(assert (=> d!56047 m!217769))

(declare-fun m!217771 () Bool)

(assert (=> b!191664 m!217771))

(declare-fun m!217773 () Bool)

(assert (=> b!191665 m!217773))

(assert (=> b!191502 d!56047))

(declare-fun d!56049 () Bool)

(declare-fun e!126124 () Bool)

(assert (=> d!56049 e!126124))

(declare-fun res!90555 () Bool)

(assert (=> d!56049 (=> (not res!90555) (not e!126124))))

(declare-fun lt!95106 () ListLongMap!2393)

(assert (=> d!56049 (= res!90555 (contains!1332 lt!95106 (_1!1753 (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))))))

(declare-fun lt!95105 () List!2405)

(assert (=> d!56049 (= lt!95106 (ListLongMap!2394 lt!95105))))

(declare-fun lt!95104 () Unit!5743)

(declare-fun lt!95107 () Unit!5743)

(assert (=> d!56049 (= lt!95104 lt!95107)))

(assert (=> d!56049 (= (getValueByKey!237 lt!95105 (_1!1753 (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))) (Some!242 (_2!1753 (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))))))

(assert (=> d!56049 (= lt!95107 (lemmaContainsTupThenGetReturnValue!127 lt!95105 (_1!1753 (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))) (_2!1753 (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))))))

(assert (=> d!56049 (= lt!95105 (insertStrictlySorted!130 (toList!1212 call!19338) (_1!1753 (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))) (_2!1753 (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))))))

(assert (=> d!56049 (= (+!304 call!19338 (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))) lt!95106)))

(declare-fun b!191666 () Bool)

(declare-fun res!90554 () Bool)

(assert (=> b!191666 (=> (not res!90554) (not e!126124))))

(assert (=> b!191666 (= res!90554 (= (getValueByKey!237 (toList!1212 lt!95106) (_1!1753 (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))) (Some!242 (_2!1753 (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))))))))

(declare-fun b!191667 () Bool)

(assert (=> b!191667 (= e!126124 (contains!1335 (toList!1212 lt!95106) (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))))))

(assert (= (and d!56049 res!90555) b!191666))

(assert (= (and b!191666 res!90554) b!191667))

(declare-fun m!217775 () Bool)

(assert (=> d!56049 m!217775))

(declare-fun m!217777 () Bool)

(assert (=> d!56049 m!217777))

(declare-fun m!217779 () Bool)

(assert (=> d!56049 m!217779))

(declare-fun m!217781 () Bool)

(assert (=> d!56049 m!217781))

(declare-fun m!217783 () Bool)

(assert (=> b!191666 m!217783))

(declare-fun m!217785 () Bool)

(assert (=> b!191667 m!217785))

(assert (=> b!191534 d!56049))

(declare-fun d!56051 () Bool)

(assert (=> d!56051 (= (validKeyInArray!0 (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!191518 d!56051))

(assert (=> b!191550 d!56051))

(declare-fun b!191678 () Bool)

(declare-fun e!126133 () Bool)

(declare-fun call!19347 () Bool)

(assert (=> b!191678 (= e!126133 call!19347)))

(declare-fun d!56053 () Bool)

(declare-fun res!90562 () Bool)

(declare-fun e!126136 () Bool)

(assert (=> d!56053 (=> res!90562 e!126136)))

(assert (=> d!56053 (= res!90562 (bvsge #b00000000000000000000000000000000 (size!4149 (_keys!5886 thiss!1248))))))

(assert (=> d!56053 (= (arrayNoDuplicates!0 (_keys!5886 thiss!1248) #b00000000000000000000000000000000 Nil!2405) e!126136)))

(declare-fun b!191679 () Bool)

(declare-fun e!126135 () Bool)

(declare-fun contains!1336 (List!2408 (_ BitVec 64)) Bool)

(assert (=> b!191679 (= e!126135 (contains!1336 Nil!2405 (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191680 () Bool)

(declare-fun e!126134 () Bool)

(assert (=> b!191680 (= e!126134 e!126133)))

(declare-fun c!34518 () Bool)

(assert (=> b!191680 (= c!34518 (validKeyInArray!0 (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191681 () Bool)

(assert (=> b!191681 (= e!126133 call!19347)))

(declare-fun b!191682 () Bool)

(assert (=> b!191682 (= e!126136 e!126134)))

(declare-fun res!90564 () Bool)

(assert (=> b!191682 (=> (not res!90564) (not e!126134))))

(assert (=> b!191682 (= res!90564 (not e!126135))))

(declare-fun res!90563 () Bool)

(assert (=> b!191682 (=> (not res!90563) (not e!126135))))

(assert (=> b!191682 (= res!90563 (validKeyInArray!0 (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19344 () Bool)

(assert (=> bm!19344 (= call!19347 (arrayNoDuplicates!0 (_keys!5886 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!34518 (Cons!2404 (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000) Nil!2405) Nil!2405)))))

(assert (= (and d!56053 (not res!90562)) b!191682))

(assert (= (and b!191682 res!90563) b!191679))

(assert (= (and b!191682 res!90564) b!191680))

(assert (= (and b!191680 c!34518) b!191678))

(assert (= (and b!191680 (not c!34518)) b!191681))

(assert (= (or b!191678 b!191681) bm!19344))

(assert (=> b!191679 m!217577))

(assert (=> b!191679 m!217577))

(declare-fun m!217787 () Bool)

(assert (=> b!191679 m!217787))

(assert (=> b!191680 m!217577))

(assert (=> b!191680 m!217577))

(assert (=> b!191680 m!217579))

(assert (=> b!191682 m!217577))

(assert (=> b!191682 m!217577))

(assert (=> b!191682 m!217579))

(assert (=> bm!19344 m!217577))

(declare-fun m!217789 () Bool)

(assert (=> bm!19344 m!217789))

(assert (=> b!191595 d!56053))

(declare-fun d!56055 () Bool)

(declare-fun e!126138 () Bool)

(assert (=> d!56055 e!126138))

(declare-fun res!90565 () Bool)

(assert (=> d!56055 (=> res!90565 e!126138)))

(declare-fun lt!95109 () Bool)

(assert (=> d!56055 (= res!90565 (not lt!95109))))

(declare-fun lt!95111 () Bool)

(assert (=> d!56055 (= lt!95109 lt!95111)))

(declare-fun lt!95108 () Unit!5743)

(declare-fun e!126137 () Unit!5743)

(assert (=> d!56055 (= lt!95108 e!126137)))

(declare-fun c!34519 () Bool)

(assert (=> d!56055 (= c!34519 lt!95111)))

(assert (=> d!56055 (= lt!95111 (containsKey!241 (toList!1212 lt!95012) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56055 (= (contains!1332 lt!95012 #b1000000000000000000000000000000000000000000000000000000000000000) lt!95109)))

(declare-fun b!191683 () Bool)

(declare-fun lt!95110 () Unit!5743)

(assert (=> b!191683 (= e!126137 lt!95110)))

(assert (=> b!191683 (= lt!95110 (lemmaContainsKeyImpliesGetValueByKeyDefined!190 (toList!1212 lt!95012) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!191683 (isDefined!191 (getValueByKey!237 (toList!1212 lt!95012) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!191684 () Bool)

(declare-fun Unit!5754 () Unit!5743)

(assert (=> b!191684 (= e!126137 Unit!5754)))

(declare-fun b!191685 () Bool)

(assert (=> b!191685 (= e!126138 (isDefined!191 (getValueByKey!237 (toList!1212 lt!95012) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56055 c!34519) b!191683))

(assert (= (and d!56055 (not c!34519)) b!191684))

(assert (= (and d!56055 (not res!90565)) b!191685))

(declare-fun m!217791 () Bool)

(assert (=> d!56055 m!217791))

(declare-fun m!217793 () Bool)

(assert (=> b!191683 m!217793))

(declare-fun m!217795 () Bool)

(assert (=> b!191683 m!217795))

(assert (=> b!191683 m!217795))

(declare-fun m!217797 () Bool)

(assert (=> b!191683 m!217797))

(assert (=> b!191685 m!217795))

(assert (=> b!191685 m!217795))

(assert (=> b!191685 m!217797))

(assert (=> bm!19325 d!56055))

(declare-fun d!56057 () Bool)

(declare-fun e!126140 () Bool)

(assert (=> d!56057 e!126140))

(declare-fun res!90566 () Bool)

(assert (=> d!56057 (=> res!90566 e!126140)))

(declare-fun lt!95113 () Bool)

(assert (=> d!56057 (= res!90566 (not lt!95113))))

(declare-fun lt!95115 () Bool)

(assert (=> d!56057 (= lt!95113 lt!95115)))

(declare-fun lt!95112 () Unit!5743)

(declare-fun e!126139 () Unit!5743)

(assert (=> d!56057 (= lt!95112 e!126139)))

(declare-fun c!34520 () Bool)

(assert (=> d!56057 (= c!34520 lt!95115)))

(assert (=> d!56057 (= lt!95115 (containsKey!241 (toList!1212 lt!95046) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56057 (= (contains!1332 lt!95046 #b1000000000000000000000000000000000000000000000000000000000000000) lt!95113)))

(declare-fun b!191686 () Bool)

(declare-fun lt!95114 () Unit!5743)

(assert (=> b!191686 (= e!126139 lt!95114)))

(assert (=> b!191686 (= lt!95114 (lemmaContainsKeyImpliesGetValueByKeyDefined!190 (toList!1212 lt!95046) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!191686 (isDefined!191 (getValueByKey!237 (toList!1212 lt!95046) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!191687 () Bool)

(declare-fun Unit!5755 () Unit!5743)

(assert (=> b!191687 (= e!126139 Unit!5755)))

(declare-fun b!191688 () Bool)

(assert (=> b!191688 (= e!126140 (isDefined!191 (getValueByKey!237 (toList!1212 lt!95046) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56057 c!34520) b!191686))

(assert (= (and d!56057 (not c!34520)) b!191687))

(assert (= (and d!56057 (not res!90566)) b!191688))

(declare-fun m!217799 () Bool)

(assert (=> d!56057 m!217799))

(declare-fun m!217801 () Bool)

(assert (=> b!191686 m!217801))

(declare-fun m!217803 () Bool)

(assert (=> b!191686 m!217803))

(assert (=> b!191686 m!217803))

(declare-fun m!217805 () Bool)

(assert (=> b!191686 m!217805))

(assert (=> b!191688 m!217803))

(assert (=> b!191688 m!217803))

(assert (=> b!191688 m!217805))

(assert (=> bm!19332 d!56057))

(declare-fun d!56059 () Bool)

(declare-fun get!2208 (Option!243) V!5585)

(assert (=> d!56059 (= (apply!182 lt!95046 (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000)) (get!2208 (getValueByKey!237 (toList!1212 lt!95046) (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7640 () Bool)

(assert (= bs!7640 d!56059))

(assert (=> bs!7640 m!217577))

(declare-fun m!217807 () Bool)

(assert (=> bs!7640 m!217807))

(assert (=> bs!7640 m!217807))

(declare-fun m!217809 () Bool)

(assert (=> bs!7640 m!217809))

(assert (=> b!191545 d!56059))

(declare-fun d!56061 () Bool)

(declare-fun c!34523 () Bool)

(assert (=> d!56061 (= c!34523 ((_ is ValueCellFull!1883) (select (arr!3827 (_values!3892 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!126143 () V!5585)

(assert (=> d!56061 (= (get!2207 (select (arr!3827 (_values!3892 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!516 (defaultEntry!3909 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!126143)))

(declare-fun b!191693 () Bool)

(declare-fun get!2209 (ValueCell!1883 V!5585) V!5585)

(assert (=> b!191693 (= e!126143 (get!2209 (select (arr!3827 (_values!3892 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!516 (defaultEntry!3909 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!191694 () Bool)

(declare-fun get!2210 (ValueCell!1883 V!5585) V!5585)

(assert (=> b!191694 (= e!126143 (get!2210 (select (arr!3827 (_values!3892 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!516 (defaultEntry!3909 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56061 c!34523) b!191693))

(assert (= (and d!56061 (not c!34523)) b!191694))

(assert (=> b!191693 m!217645))

(assert (=> b!191693 m!217585))

(declare-fun m!217811 () Bool)

(assert (=> b!191693 m!217811))

(assert (=> b!191694 m!217645))

(assert (=> b!191694 m!217585))

(declare-fun m!217813 () Bool)

(assert (=> b!191694 m!217813))

(assert (=> b!191545 d!56061))

(declare-fun d!56063 () Bool)

(assert (=> d!56063 (isDefined!191 (getValueByKey!237 (toList!1212 lt!94909) key!828))))

(declare-fun lt!95118 () Unit!5743)

(declare-fun choose!1047 (List!2405 (_ BitVec 64)) Unit!5743)

(assert (=> d!56063 (= lt!95118 (choose!1047 (toList!1212 lt!94909) key!828))))

(declare-fun e!126146 () Bool)

(assert (=> d!56063 e!126146))

(declare-fun res!90569 () Bool)

(assert (=> d!56063 (=> (not res!90569) (not e!126146))))

(declare-fun isStrictlySorted!350 (List!2405) Bool)

(assert (=> d!56063 (= res!90569 (isStrictlySorted!350 (toList!1212 lt!94909)))))

(assert (=> d!56063 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!190 (toList!1212 lt!94909) key!828) lt!95118)))

(declare-fun b!191697 () Bool)

(assert (=> b!191697 (= e!126146 (containsKey!241 (toList!1212 lt!94909) key!828))))

(assert (= (and d!56063 res!90569) b!191697))

(assert (=> d!56063 m!217639))

(assert (=> d!56063 m!217639))

(assert (=> d!56063 m!217641))

(declare-fun m!217815 () Bool)

(assert (=> d!56063 m!217815))

(declare-fun m!217817 () Bool)

(assert (=> d!56063 m!217817))

(assert (=> b!191697 m!217635))

(assert (=> b!191530 d!56063))

(declare-fun d!56065 () Bool)

(declare-fun isEmpty!487 (Option!243) Bool)

(assert (=> d!56065 (= (isDefined!191 (getValueByKey!237 (toList!1212 lt!94909) key!828)) (not (isEmpty!487 (getValueByKey!237 (toList!1212 lt!94909) key!828))))))

(declare-fun bs!7641 () Bool)

(assert (= bs!7641 d!56065))

(assert (=> bs!7641 m!217639))

(declare-fun m!217819 () Bool)

(assert (=> bs!7641 m!217819))

(assert (=> b!191530 d!56065))

(declare-fun b!191698 () Bool)

(declare-fun e!126147 () Option!243)

(assert (=> b!191698 (= e!126147 (Some!242 (_2!1753 (h!3040 (toList!1212 lt!94909)))))))

(declare-fun b!191699 () Bool)

(declare-fun e!126148 () Option!243)

(assert (=> b!191699 (= e!126147 e!126148)))

(declare-fun c!34525 () Bool)

(assert (=> b!191699 (= c!34525 (and ((_ is Cons!2401) (toList!1212 lt!94909)) (not (= (_1!1753 (h!3040 (toList!1212 lt!94909))) key!828))))))

(declare-fun d!56067 () Bool)

(declare-fun c!34524 () Bool)

(assert (=> d!56067 (= c!34524 (and ((_ is Cons!2401) (toList!1212 lt!94909)) (= (_1!1753 (h!3040 (toList!1212 lt!94909))) key!828)))))

(assert (=> d!56067 (= (getValueByKey!237 (toList!1212 lt!94909) key!828) e!126147)))

(declare-fun b!191701 () Bool)

(assert (=> b!191701 (= e!126148 None!241)))

(declare-fun b!191700 () Bool)

(assert (=> b!191700 (= e!126148 (getValueByKey!237 (t!7310 (toList!1212 lt!94909)) key!828))))

(assert (= (and d!56067 c!34524) b!191698))

(assert (= (and d!56067 (not c!34524)) b!191699))

(assert (= (and b!191699 c!34525) b!191700))

(assert (= (and b!191699 (not c!34525)) b!191701))

(declare-fun m!217821 () Bool)

(assert (=> b!191700 m!217821))

(assert (=> b!191530 d!56067))

(declare-fun d!56069 () Bool)

(declare-fun e!126150 () Bool)

(assert (=> d!56069 e!126150))

(declare-fun res!90570 () Bool)

(assert (=> d!56069 (=> res!90570 e!126150)))

(declare-fun lt!95120 () Bool)

(assert (=> d!56069 (= res!90570 (not lt!95120))))

(declare-fun lt!95122 () Bool)

(assert (=> d!56069 (= lt!95120 lt!95122)))

(declare-fun lt!95119 () Unit!5743)

(declare-fun e!126149 () Unit!5743)

(assert (=> d!56069 (= lt!95119 e!126149)))

(declare-fun c!34526 () Bool)

(assert (=> d!56069 (= c!34526 lt!95122)))

(assert (=> d!56069 (= lt!95122 (containsKey!241 (toList!1212 lt!95012) (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!56069 (= (contains!1332 lt!95012 (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000)) lt!95120)))

(declare-fun b!191702 () Bool)

(declare-fun lt!95121 () Unit!5743)

(assert (=> b!191702 (= e!126149 lt!95121)))

(assert (=> b!191702 (= lt!95121 (lemmaContainsKeyImpliesGetValueByKeyDefined!190 (toList!1212 lt!95012) (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!191702 (isDefined!191 (getValueByKey!237 (toList!1212 lt!95012) (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191703 () Bool)

(declare-fun Unit!5756 () Unit!5743)

(assert (=> b!191703 (= e!126149 Unit!5756)))

(declare-fun b!191704 () Bool)

(assert (=> b!191704 (= e!126150 (isDefined!191 (getValueByKey!237 (toList!1212 lt!95012) (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!56069 c!34526) b!191702))

(assert (= (and d!56069 (not c!34526)) b!191703))

(assert (= (and d!56069 (not res!90570)) b!191704))

(assert (=> d!56069 m!217577))

(declare-fun m!217823 () Bool)

(assert (=> d!56069 m!217823))

(assert (=> b!191702 m!217577))

(declare-fun m!217825 () Bool)

(assert (=> b!191702 m!217825))

(assert (=> b!191702 m!217577))

(declare-fun m!217827 () Bool)

(assert (=> b!191702 m!217827))

(assert (=> b!191702 m!217827))

(declare-fun m!217829 () Bool)

(assert (=> b!191702 m!217829))

(assert (=> b!191704 m!217577))

(assert (=> b!191704 m!217827))

(assert (=> b!191704 m!217827))

(assert (=> b!191704 m!217829))

(assert (=> b!191512 d!56069))

(declare-fun d!56071 () Bool)

(declare-fun e!126152 () Bool)

(assert (=> d!56071 e!126152))

(declare-fun res!90571 () Bool)

(assert (=> d!56071 (=> res!90571 e!126152)))

(declare-fun lt!95124 () Bool)

(assert (=> d!56071 (= res!90571 (not lt!95124))))

(declare-fun lt!95126 () Bool)

(assert (=> d!56071 (= lt!95124 lt!95126)))

(declare-fun lt!95123 () Unit!5743)

(declare-fun e!126151 () Unit!5743)

(assert (=> d!56071 (= lt!95123 e!126151)))

(declare-fun c!34527 () Bool)

(assert (=> d!56071 (= c!34527 lt!95126)))

(assert (=> d!56071 (= lt!95126 (containsKey!241 (toList!1212 lt!95046) (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!56071 (= (contains!1332 lt!95046 (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000)) lt!95124)))

(declare-fun b!191705 () Bool)

(declare-fun lt!95125 () Unit!5743)

(assert (=> b!191705 (= e!126151 lt!95125)))

(assert (=> b!191705 (= lt!95125 (lemmaContainsKeyImpliesGetValueByKeyDefined!190 (toList!1212 lt!95046) (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!191705 (isDefined!191 (getValueByKey!237 (toList!1212 lt!95046) (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191706 () Bool)

(declare-fun Unit!5757 () Unit!5743)

(assert (=> b!191706 (= e!126151 Unit!5757)))

(declare-fun b!191707 () Bool)

(assert (=> b!191707 (= e!126152 (isDefined!191 (getValueByKey!237 (toList!1212 lt!95046) (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!56071 c!34527) b!191705))

(assert (= (and d!56071 (not c!34527)) b!191706))

(assert (= (and d!56071 (not res!90571)) b!191707))

(assert (=> d!56071 m!217577))

(declare-fun m!217831 () Bool)

(assert (=> d!56071 m!217831))

(assert (=> b!191705 m!217577))

(declare-fun m!217833 () Bool)

(assert (=> b!191705 m!217833))

(assert (=> b!191705 m!217577))

(assert (=> b!191705 m!217807))

(assert (=> b!191705 m!217807))

(declare-fun m!217835 () Bool)

(assert (=> b!191705 m!217835))

(assert (=> b!191707 m!217577))

(assert (=> b!191707 m!217807))

(assert (=> b!191707 m!217807))

(assert (=> b!191707 m!217835))

(assert (=> b!191544 d!56071))

(assert (=> b!191532 d!56065))

(assert (=> b!191532 d!56067))

(declare-fun b!191720 () Bool)

(declare-fun e!126161 () SeekEntryResult!681)

(declare-fun e!126159 () SeekEntryResult!681)

(assert (=> b!191720 (= e!126161 e!126159)))

(declare-fun c!34535 () Bool)

(declare-fun lt!95131 () (_ BitVec 64))

(assert (=> b!191720 (= c!34535 (= lt!95131 key!828))))

(declare-fun b!191721 () Bool)

(declare-fun e!126160 () SeekEntryResult!681)

(assert (=> b!191721 (= e!126160 (MissingVacant!681 (index!4896 lt!95076)))))

(declare-fun b!191722 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!191722 (= e!126160 (seekKeyOrZeroReturnVacant!0 (bvadd (x!20552 lt!95076) #b00000000000000000000000000000001) (nextIndex!0 (index!4896 lt!95076) (x!20552 lt!95076) (mask!9129 thiss!1248)) (index!4896 lt!95076) key!828 (_keys!5886 thiss!1248) (mask!9129 thiss!1248)))))

(declare-fun b!191723 () Bool)

(assert (=> b!191723 (= e!126159 (Found!681 (index!4896 lt!95076)))))

(declare-fun b!191724 () Bool)

(declare-fun c!34536 () Bool)

(assert (=> b!191724 (= c!34536 (= lt!95131 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!191724 (= e!126159 e!126160)))

(declare-fun b!191725 () Bool)

(assert (=> b!191725 (= e!126161 Undefined!681)))

(declare-fun lt!95132 () SeekEntryResult!681)

(declare-fun d!56073 () Bool)

(assert (=> d!56073 (and (or ((_ is Undefined!681) lt!95132) (not ((_ is Found!681) lt!95132)) (and (bvsge (index!4895 lt!95132) #b00000000000000000000000000000000) (bvslt (index!4895 lt!95132) (size!4149 (_keys!5886 thiss!1248))))) (or ((_ is Undefined!681) lt!95132) ((_ is Found!681) lt!95132) (not ((_ is MissingVacant!681) lt!95132)) (not (= (index!4897 lt!95132) (index!4896 lt!95076))) (and (bvsge (index!4897 lt!95132) #b00000000000000000000000000000000) (bvslt (index!4897 lt!95132) (size!4149 (_keys!5886 thiss!1248))))) (or ((_ is Undefined!681) lt!95132) (ite ((_ is Found!681) lt!95132) (= (select (arr!3826 (_keys!5886 thiss!1248)) (index!4895 lt!95132)) key!828) (and ((_ is MissingVacant!681) lt!95132) (= (index!4897 lt!95132) (index!4896 lt!95076)) (= (select (arr!3826 (_keys!5886 thiss!1248)) (index!4897 lt!95132)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!56073 (= lt!95132 e!126161)))

(declare-fun c!34534 () Bool)

(assert (=> d!56073 (= c!34534 (bvsge (x!20552 lt!95076) #b01111111111111111111111111111110))))

(assert (=> d!56073 (= lt!95131 (select (arr!3826 (_keys!5886 thiss!1248)) (index!4896 lt!95076)))))

(assert (=> d!56073 (validMask!0 (mask!9129 thiss!1248))))

(assert (=> d!56073 (= (seekKeyOrZeroReturnVacant!0 (x!20552 lt!95076) (index!4896 lt!95076) (index!4896 lt!95076) key!828 (_keys!5886 thiss!1248) (mask!9129 thiss!1248)) lt!95132)))

(assert (= (and d!56073 c!34534) b!191725))

(assert (= (and d!56073 (not c!34534)) b!191720))

(assert (= (and b!191720 c!34535) b!191723))

(assert (= (and b!191720 (not c!34535)) b!191724))

(assert (= (and b!191724 c!34536) b!191721))

(assert (= (and b!191724 (not c!34536)) b!191722))

(declare-fun m!217837 () Bool)

(assert (=> b!191722 m!217837))

(assert (=> b!191722 m!217837))

(declare-fun m!217839 () Bool)

(assert (=> b!191722 m!217839))

(declare-fun m!217841 () Bool)

(assert (=> d!56073 m!217841))

(declare-fun m!217843 () Bool)

(assert (=> d!56073 m!217843))

(assert (=> d!56073 m!217711))

(assert (=> d!56073 m!217479))

(assert (=> b!191575 d!56073))

(declare-fun d!56075 () Bool)

(assert (=> d!56075 (= (apply!182 lt!95012 (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000)) (get!2208 (getValueByKey!237 (toList!1212 lt!95012) (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7642 () Bool)

(assert (= bs!7642 d!56075))

(assert (=> bs!7642 m!217577))

(assert (=> bs!7642 m!217827))

(assert (=> bs!7642 m!217827))

(declare-fun m!217845 () Bool)

(assert (=> bs!7642 m!217845))

(assert (=> b!191513 d!56075))

(declare-fun c!34537 () Bool)

(declare-fun d!56077 () Bool)

(assert (=> d!56077 (= c!34537 ((_ is ValueCellFull!1883) (select (arr!3827 (array!8128 (store (arr!3827 (_values!3892 thiss!1248)) (index!4895 lt!94908) (ValueCellFull!1883 v!309)) (size!4150 (_values!3892 thiss!1248)))) #b00000000000000000000000000000000)))))

(declare-fun e!126162 () V!5585)

(assert (=> d!56077 (= (get!2207 (select (arr!3827 (array!8128 (store (arr!3827 (_values!3892 thiss!1248)) (index!4895 lt!94908) (ValueCellFull!1883 v!309)) (size!4150 (_values!3892 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!516 (defaultEntry!3909 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!126162)))

(declare-fun b!191726 () Bool)

(assert (=> b!191726 (= e!126162 (get!2209 (select (arr!3827 (array!8128 (store (arr!3827 (_values!3892 thiss!1248)) (index!4895 lt!94908) (ValueCellFull!1883 v!309)) (size!4150 (_values!3892 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!516 (defaultEntry!3909 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!191727 () Bool)

(assert (=> b!191727 (= e!126162 (get!2210 (select (arr!3827 (array!8128 (store (arr!3827 (_values!3892 thiss!1248)) (index!4895 lt!94908) (ValueCellFull!1883 v!309)) (size!4150 (_values!3892 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!516 (defaultEntry!3909 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56077 c!34537) b!191726))

(assert (= (and d!56077 (not c!34537)) b!191727))

(assert (=> b!191726 m!217583))

(assert (=> b!191726 m!217585))

(declare-fun m!217847 () Bool)

(assert (=> b!191726 m!217847))

(assert (=> b!191727 m!217583))

(assert (=> b!191727 m!217585))

(declare-fun m!217849 () Bool)

(assert (=> b!191727 m!217849))

(assert (=> b!191513 d!56077))

(assert (=> d!56023 d!56021))

(declare-fun d!56079 () Bool)

(declare-fun e!126165 () Bool)

(assert (=> d!56079 e!126165))

(declare-fun res!90577 () Bool)

(assert (=> d!56079 (=> (not res!90577) (not e!126165))))

(declare-fun lt!95135 () SeekEntryResult!681)

(assert (=> d!56079 (= res!90577 ((_ is Found!681) lt!95135))))

(assert (=> d!56079 (= lt!95135 (seekEntryOrOpen!0 key!828 (_keys!5886 thiss!1248) (mask!9129 thiss!1248)))))

(assert (=> d!56079 true))

(declare-fun _$33!144 () Unit!5743)

(assert (=> d!56079 (= (choose!1046 (_keys!5886 thiss!1248) (_values!3892 thiss!1248) (mask!9129 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) key!828 (defaultEntry!3909 thiss!1248)) _$33!144)))

(declare-fun b!191732 () Bool)

(declare-fun res!90576 () Bool)

(assert (=> b!191732 (=> (not res!90576) (not e!126165))))

(assert (=> b!191732 (= res!90576 (inRange!0 (index!4895 lt!95135) (mask!9129 thiss!1248)))))

(declare-fun b!191733 () Bool)

(assert (=> b!191733 (= e!126165 (= (select (arr!3826 (_keys!5886 thiss!1248)) (index!4895 lt!95135)) key!828))))

(assert (= (and d!56079 res!90577) b!191732))

(assert (= (and b!191732 res!90576) b!191733))

(assert (=> d!56079 m!217497))

(declare-fun m!217851 () Bool)

(assert (=> b!191732 m!217851))

(declare-fun m!217853 () Bool)

(assert (=> b!191733 m!217853))

(assert (=> d!56023 d!56079))

(assert (=> d!56023 d!56011))

(declare-fun d!56081 () Bool)

(assert (=> d!56081 (= (apply!182 (+!304 lt!95041 (tuple2!3485 lt!95053 (minValue!3750 thiss!1248))) lt!95051) (get!2208 (getValueByKey!237 (toList!1212 (+!304 lt!95041 (tuple2!3485 lt!95053 (minValue!3750 thiss!1248)))) lt!95051)))))

(declare-fun bs!7643 () Bool)

(assert (= bs!7643 d!56081))

(declare-fun m!217855 () Bool)

(assert (=> bs!7643 m!217855))

(assert (=> bs!7643 m!217855))

(declare-fun m!217857 () Bool)

(assert (=> bs!7643 m!217857))

(assert (=> b!191539 d!56081))

(declare-fun d!56083 () Bool)

(assert (=> d!56083 (= (apply!182 (+!304 lt!95034 (tuple2!3485 lt!95036 (minValue!3750 thiss!1248))) lt!95038) (apply!182 lt!95034 lt!95038))))

(declare-fun lt!95138 () Unit!5743)

(declare-fun choose!1048 (ListLongMap!2393 (_ BitVec 64) V!5585 (_ BitVec 64)) Unit!5743)

(assert (=> d!56083 (= lt!95138 (choose!1048 lt!95034 lt!95036 (minValue!3750 thiss!1248) lt!95038))))

(declare-fun e!126168 () Bool)

(assert (=> d!56083 e!126168))

(declare-fun res!90580 () Bool)

(assert (=> d!56083 (=> (not res!90580) (not e!126168))))

(assert (=> d!56083 (= res!90580 (contains!1332 lt!95034 lt!95038))))

(assert (=> d!56083 (= (addApplyDifferent!158 lt!95034 lt!95036 (minValue!3750 thiss!1248) lt!95038) lt!95138)))

(declare-fun b!191737 () Bool)

(assert (=> b!191737 (= e!126168 (not (= lt!95038 lt!95036)))))

(assert (= (and d!56083 res!90580) b!191737))

(declare-fun m!217859 () Bool)

(assert (=> d!56083 m!217859))

(assert (=> d!56083 m!217667))

(assert (=> d!56083 m!217681))

(assert (=> d!56083 m!217667))

(assert (=> d!56083 m!217677))

(declare-fun m!217861 () Bool)

(assert (=> d!56083 m!217861))

(assert (=> b!191539 d!56083))

(declare-fun b!191762 () Bool)

(declare-fun e!126186 () Bool)

(declare-fun e!126188 () Bool)

(assert (=> b!191762 (= e!126186 e!126188)))

(assert (=> b!191762 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4149 (_keys!5886 thiss!1248))))))

(declare-fun res!90590 () Bool)

(declare-fun lt!95155 () ListLongMap!2393)

(assert (=> b!191762 (= res!90590 (contains!1332 lt!95155 (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!191762 (=> (not res!90590) (not e!126188))))

(declare-fun bm!19347 () Bool)

(declare-fun call!19350 () ListLongMap!2393)

(assert (=> bm!19347 (= call!19350 (getCurrentListMapNoExtraKeys!203 (_keys!5886 thiss!1248) (_values!3892 thiss!1248) (mask!9129 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3909 thiss!1248)))))

(declare-fun b!191763 () Bool)

(assert (=> b!191763 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4149 (_keys!5886 thiss!1248))))))

(assert (=> b!191763 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4150 (_values!3892 thiss!1248))))))

(assert (=> b!191763 (= e!126188 (= (apply!182 lt!95155 (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000)) (get!2207 (select (arr!3827 (_values!3892 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!516 (defaultEntry!3909 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!191764 () Bool)

(declare-fun res!90592 () Bool)

(declare-fun e!126185 () Bool)

(assert (=> b!191764 (=> (not res!90592) (not e!126185))))

(assert (=> b!191764 (= res!90592 (not (contains!1332 lt!95155 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!191766 () Bool)

(assert (=> b!191766 (= e!126185 e!126186)))

(declare-fun c!34548 () Bool)

(declare-fun e!126187 () Bool)

(assert (=> b!191766 (= c!34548 e!126187)))

(declare-fun res!90589 () Bool)

(assert (=> b!191766 (=> (not res!90589) (not e!126187))))

(assert (=> b!191766 (= res!90589 (bvslt #b00000000000000000000000000000000 (size!4149 (_keys!5886 thiss!1248))))))

(declare-fun b!191767 () Bool)

(declare-fun e!126183 () ListLongMap!2393)

(assert (=> b!191767 (= e!126183 (ListLongMap!2394 Nil!2402))))

(declare-fun b!191768 () Bool)

(declare-fun e!126184 () Bool)

(declare-fun isEmpty!488 (ListLongMap!2393) Bool)

(assert (=> b!191768 (= e!126184 (isEmpty!488 lt!95155))))

(declare-fun b!191769 () Bool)

(assert (=> b!191769 (= e!126187 (validKeyInArray!0 (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!191769 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!191770 () Bool)

(assert (=> b!191770 (= e!126184 (= lt!95155 (getCurrentListMapNoExtraKeys!203 (_keys!5886 thiss!1248) (_values!3892 thiss!1248) (mask!9129 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3909 thiss!1248))))))

(declare-fun b!191771 () Bool)

(declare-fun e!126189 () ListLongMap!2393)

(assert (=> b!191771 (= e!126189 call!19350)))

(declare-fun d!56085 () Bool)

(assert (=> d!56085 e!126185))

(declare-fun res!90591 () Bool)

(assert (=> d!56085 (=> (not res!90591) (not e!126185))))

(assert (=> d!56085 (= res!90591 (not (contains!1332 lt!95155 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56085 (= lt!95155 e!126183)))

(declare-fun c!34549 () Bool)

(assert (=> d!56085 (= c!34549 (bvsge #b00000000000000000000000000000000 (size!4149 (_keys!5886 thiss!1248))))))

(assert (=> d!56085 (validMask!0 (mask!9129 thiss!1248))))

(assert (=> d!56085 (= (getCurrentListMapNoExtraKeys!203 (_keys!5886 thiss!1248) (_values!3892 thiss!1248) (mask!9129 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248)) lt!95155)))

(declare-fun b!191765 () Bool)

(assert (=> b!191765 (= e!126186 e!126184)))

(declare-fun c!34547 () Bool)

(assert (=> b!191765 (= c!34547 (bvslt #b00000000000000000000000000000000 (size!4149 (_keys!5886 thiss!1248))))))

(declare-fun b!191772 () Bool)

(assert (=> b!191772 (= e!126183 e!126189)))

(declare-fun c!34546 () Bool)

(assert (=> b!191772 (= c!34546 (validKeyInArray!0 (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191773 () Bool)

(declare-fun lt!95159 () Unit!5743)

(declare-fun lt!95153 () Unit!5743)

(assert (=> b!191773 (= lt!95159 lt!95153)))

(declare-fun lt!95154 () ListLongMap!2393)

(declare-fun lt!95158 () (_ BitVec 64))

(declare-fun lt!95156 () V!5585)

(declare-fun lt!95157 () (_ BitVec 64))

(assert (=> b!191773 (not (contains!1332 (+!304 lt!95154 (tuple2!3485 lt!95157 lt!95156)) lt!95158))))

(declare-fun addStillNotContains!96 (ListLongMap!2393 (_ BitVec 64) V!5585 (_ BitVec 64)) Unit!5743)

(assert (=> b!191773 (= lt!95153 (addStillNotContains!96 lt!95154 lt!95157 lt!95156 lt!95158))))

(assert (=> b!191773 (= lt!95158 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!191773 (= lt!95156 (get!2207 (select (arr!3827 (_values!3892 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!516 (defaultEntry!3909 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!191773 (= lt!95157 (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!191773 (= lt!95154 call!19350)))

(assert (=> b!191773 (= e!126189 (+!304 call!19350 (tuple2!3485 (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000) (get!2207 (select (arr!3827 (_values!3892 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!516 (defaultEntry!3909 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!56085 c!34549) b!191767))

(assert (= (and d!56085 (not c!34549)) b!191772))

(assert (= (and b!191772 c!34546) b!191773))

(assert (= (and b!191772 (not c!34546)) b!191771))

(assert (= (or b!191773 b!191771) bm!19347))

(assert (= (and d!56085 res!90591) b!191764))

(assert (= (and b!191764 res!90592) b!191766))

(assert (= (and b!191766 res!90589) b!191769))

(assert (= (and b!191766 c!34548) b!191762))

(assert (= (and b!191766 (not c!34548)) b!191765))

(assert (= (and b!191762 res!90590) b!191763))

(assert (= (and b!191765 c!34547) b!191770))

(assert (= (and b!191765 (not c!34547)) b!191768))

(declare-fun b_lambda!7389 () Bool)

(assert (=> (not b_lambda!7389) (not b!191763)))

(assert (=> b!191763 t!7314))

(declare-fun b_and!11339 () Bool)

(assert (= b_and!11337 (and (=> t!7314 result!4895) b_and!11339)))

(declare-fun b_lambda!7391 () Bool)

(assert (=> (not b_lambda!7391) (not b!191773)))

(assert (=> b!191773 t!7314))

(declare-fun b_and!11341 () Bool)

(assert (= b_and!11339 (and (=> t!7314 result!4895) b_and!11341)))

(assert (=> b!191772 m!217577))

(assert (=> b!191772 m!217577))

(assert (=> b!191772 m!217579))

(assert (=> b!191769 m!217577))

(assert (=> b!191769 m!217577))

(assert (=> b!191769 m!217579))

(declare-fun m!217863 () Bool)

(assert (=> bm!19347 m!217863))

(declare-fun m!217865 () Bool)

(assert (=> b!191773 m!217865))

(declare-fun m!217867 () Bool)

(assert (=> b!191773 m!217867))

(declare-fun m!217869 () Bool)

(assert (=> b!191773 m!217869))

(assert (=> b!191773 m!217585))

(assert (=> b!191773 m!217645))

(assert (=> b!191773 m!217585))

(assert (=> b!191773 m!217647))

(declare-fun m!217871 () Bool)

(assert (=> b!191773 m!217871))

(assert (=> b!191773 m!217577))

(assert (=> b!191773 m!217645))

(assert (=> b!191773 m!217865))

(assert (=> b!191762 m!217577))

(assert (=> b!191762 m!217577))

(declare-fun m!217873 () Bool)

(assert (=> b!191762 m!217873))

(declare-fun m!217875 () Bool)

(assert (=> b!191764 m!217875))

(assert (=> b!191763 m!217645))

(assert (=> b!191763 m!217585))

(assert (=> b!191763 m!217647))

(assert (=> b!191763 m!217577))

(assert (=> b!191763 m!217645))

(assert (=> b!191763 m!217585))

(assert (=> b!191763 m!217577))

(declare-fun m!217877 () Bool)

(assert (=> b!191763 m!217877))

(declare-fun m!217879 () Bool)

(assert (=> d!56085 m!217879))

(assert (=> d!56085 m!217479))

(assert (=> b!191770 m!217863))

(declare-fun m!217881 () Bool)

(assert (=> b!191768 m!217881))

(assert (=> b!191539 d!56085))

(declare-fun d!56087 () Bool)

(declare-fun e!126190 () Bool)

(assert (=> d!56087 e!126190))

(declare-fun res!90594 () Bool)

(assert (=> d!56087 (=> (not res!90594) (not e!126190))))

(declare-fun lt!95162 () ListLongMap!2393)

(assert (=> d!56087 (= res!90594 (contains!1332 lt!95162 (_1!1753 (tuple2!3485 lt!95036 (minValue!3750 thiss!1248)))))))

(declare-fun lt!95161 () List!2405)

(assert (=> d!56087 (= lt!95162 (ListLongMap!2394 lt!95161))))

(declare-fun lt!95160 () Unit!5743)

(declare-fun lt!95163 () Unit!5743)

(assert (=> d!56087 (= lt!95160 lt!95163)))

(assert (=> d!56087 (= (getValueByKey!237 lt!95161 (_1!1753 (tuple2!3485 lt!95036 (minValue!3750 thiss!1248)))) (Some!242 (_2!1753 (tuple2!3485 lt!95036 (minValue!3750 thiss!1248)))))))

(assert (=> d!56087 (= lt!95163 (lemmaContainsTupThenGetReturnValue!127 lt!95161 (_1!1753 (tuple2!3485 lt!95036 (minValue!3750 thiss!1248))) (_2!1753 (tuple2!3485 lt!95036 (minValue!3750 thiss!1248)))))))

(assert (=> d!56087 (= lt!95161 (insertStrictlySorted!130 (toList!1212 lt!95034) (_1!1753 (tuple2!3485 lt!95036 (minValue!3750 thiss!1248))) (_2!1753 (tuple2!3485 lt!95036 (minValue!3750 thiss!1248)))))))

(assert (=> d!56087 (= (+!304 lt!95034 (tuple2!3485 lt!95036 (minValue!3750 thiss!1248))) lt!95162)))

(declare-fun b!191774 () Bool)

(declare-fun res!90593 () Bool)

(assert (=> b!191774 (=> (not res!90593) (not e!126190))))

(assert (=> b!191774 (= res!90593 (= (getValueByKey!237 (toList!1212 lt!95162) (_1!1753 (tuple2!3485 lt!95036 (minValue!3750 thiss!1248)))) (Some!242 (_2!1753 (tuple2!3485 lt!95036 (minValue!3750 thiss!1248))))))))

(declare-fun b!191775 () Bool)

(assert (=> b!191775 (= e!126190 (contains!1335 (toList!1212 lt!95162) (tuple2!3485 lt!95036 (minValue!3750 thiss!1248))))))

(assert (= (and d!56087 res!90594) b!191774))

(assert (= (and b!191774 res!90593) b!191775))

(declare-fun m!217883 () Bool)

(assert (=> d!56087 m!217883))

(declare-fun m!217885 () Bool)

(assert (=> d!56087 m!217885))

(declare-fun m!217887 () Bool)

(assert (=> d!56087 m!217887))

(declare-fun m!217889 () Bool)

(assert (=> d!56087 m!217889))

(declare-fun m!217891 () Bool)

(assert (=> b!191774 m!217891))

(declare-fun m!217893 () Bool)

(assert (=> b!191775 m!217893))

(assert (=> b!191539 d!56087))

(declare-fun d!56089 () Bool)

(assert (=> d!56089 (= (apply!182 (+!304 lt!95044 (tuple2!3485 lt!95040 (zeroValue!3750 thiss!1248))) lt!95042) (get!2208 (getValueByKey!237 (toList!1212 (+!304 lt!95044 (tuple2!3485 lt!95040 (zeroValue!3750 thiss!1248)))) lt!95042)))))

(declare-fun bs!7644 () Bool)

(assert (= bs!7644 d!56089))

(declare-fun m!217895 () Bool)

(assert (=> bs!7644 m!217895))

(assert (=> bs!7644 m!217895))

(declare-fun m!217897 () Bool)

(assert (=> bs!7644 m!217897))

(assert (=> b!191539 d!56089))

(declare-fun d!56091 () Bool)

(declare-fun e!126192 () Bool)

(assert (=> d!56091 e!126192))

(declare-fun res!90595 () Bool)

(assert (=> d!56091 (=> res!90595 e!126192)))

(declare-fun lt!95165 () Bool)

(assert (=> d!56091 (= res!90595 (not lt!95165))))

(declare-fun lt!95167 () Bool)

(assert (=> d!56091 (= lt!95165 lt!95167)))

(declare-fun lt!95164 () Unit!5743)

(declare-fun e!126191 () Unit!5743)

(assert (=> d!56091 (= lt!95164 e!126191)))

(declare-fun c!34550 () Bool)

(assert (=> d!56091 (= c!34550 lt!95167)))

(assert (=> d!56091 (= lt!95167 (containsKey!241 (toList!1212 (+!304 lt!95039 (tuple2!3485 lt!95048 (zeroValue!3750 thiss!1248)))) lt!95037))))

(assert (=> d!56091 (= (contains!1332 (+!304 lt!95039 (tuple2!3485 lt!95048 (zeroValue!3750 thiss!1248))) lt!95037) lt!95165)))

(declare-fun b!191776 () Bool)

(declare-fun lt!95166 () Unit!5743)

(assert (=> b!191776 (= e!126191 lt!95166)))

(assert (=> b!191776 (= lt!95166 (lemmaContainsKeyImpliesGetValueByKeyDefined!190 (toList!1212 (+!304 lt!95039 (tuple2!3485 lt!95048 (zeroValue!3750 thiss!1248)))) lt!95037))))

(assert (=> b!191776 (isDefined!191 (getValueByKey!237 (toList!1212 (+!304 lt!95039 (tuple2!3485 lt!95048 (zeroValue!3750 thiss!1248)))) lt!95037))))

(declare-fun b!191777 () Bool)

(declare-fun Unit!5758 () Unit!5743)

(assert (=> b!191777 (= e!126191 Unit!5758)))

(declare-fun b!191778 () Bool)

(assert (=> b!191778 (= e!126192 (isDefined!191 (getValueByKey!237 (toList!1212 (+!304 lt!95039 (tuple2!3485 lt!95048 (zeroValue!3750 thiss!1248)))) lt!95037)))))

(assert (= (and d!56091 c!34550) b!191776))

(assert (= (and d!56091 (not c!34550)) b!191777))

(assert (= (and d!56091 (not res!90595)) b!191778))

(declare-fun m!217899 () Bool)

(assert (=> d!56091 m!217899))

(declare-fun m!217901 () Bool)

(assert (=> b!191776 m!217901))

(declare-fun m!217903 () Bool)

(assert (=> b!191776 m!217903))

(assert (=> b!191776 m!217903))

(declare-fun m!217905 () Bool)

(assert (=> b!191776 m!217905))

(assert (=> b!191778 m!217903))

(assert (=> b!191778 m!217903))

(assert (=> b!191778 m!217905))

(assert (=> b!191539 d!56091))

(declare-fun d!56093 () Bool)

(assert (=> d!56093 (= (apply!182 lt!95041 lt!95051) (get!2208 (getValueByKey!237 (toList!1212 lt!95041) lt!95051)))))

(declare-fun bs!7645 () Bool)

(assert (= bs!7645 d!56093))

(declare-fun m!217907 () Bool)

(assert (=> bs!7645 m!217907))

(assert (=> bs!7645 m!217907))

(declare-fun m!217909 () Bool)

(assert (=> bs!7645 m!217909))

(assert (=> b!191539 d!56093))

(declare-fun d!56095 () Bool)

(declare-fun e!126193 () Bool)

(assert (=> d!56095 e!126193))

(declare-fun res!90597 () Bool)

(assert (=> d!56095 (=> (not res!90597) (not e!126193))))

(declare-fun lt!95170 () ListLongMap!2393)

(assert (=> d!56095 (= res!90597 (contains!1332 lt!95170 (_1!1753 (tuple2!3485 lt!95048 (zeroValue!3750 thiss!1248)))))))

(declare-fun lt!95169 () List!2405)

(assert (=> d!56095 (= lt!95170 (ListLongMap!2394 lt!95169))))

(declare-fun lt!95168 () Unit!5743)

(declare-fun lt!95171 () Unit!5743)

(assert (=> d!56095 (= lt!95168 lt!95171)))

(assert (=> d!56095 (= (getValueByKey!237 lt!95169 (_1!1753 (tuple2!3485 lt!95048 (zeroValue!3750 thiss!1248)))) (Some!242 (_2!1753 (tuple2!3485 lt!95048 (zeroValue!3750 thiss!1248)))))))

(assert (=> d!56095 (= lt!95171 (lemmaContainsTupThenGetReturnValue!127 lt!95169 (_1!1753 (tuple2!3485 lt!95048 (zeroValue!3750 thiss!1248))) (_2!1753 (tuple2!3485 lt!95048 (zeroValue!3750 thiss!1248)))))))

(assert (=> d!56095 (= lt!95169 (insertStrictlySorted!130 (toList!1212 lt!95039) (_1!1753 (tuple2!3485 lt!95048 (zeroValue!3750 thiss!1248))) (_2!1753 (tuple2!3485 lt!95048 (zeroValue!3750 thiss!1248)))))))

(assert (=> d!56095 (= (+!304 lt!95039 (tuple2!3485 lt!95048 (zeroValue!3750 thiss!1248))) lt!95170)))

(declare-fun b!191779 () Bool)

(declare-fun res!90596 () Bool)

(assert (=> b!191779 (=> (not res!90596) (not e!126193))))

(assert (=> b!191779 (= res!90596 (= (getValueByKey!237 (toList!1212 lt!95170) (_1!1753 (tuple2!3485 lt!95048 (zeroValue!3750 thiss!1248)))) (Some!242 (_2!1753 (tuple2!3485 lt!95048 (zeroValue!3750 thiss!1248))))))))

(declare-fun b!191780 () Bool)

(assert (=> b!191780 (= e!126193 (contains!1335 (toList!1212 lt!95170) (tuple2!3485 lt!95048 (zeroValue!3750 thiss!1248))))))

(assert (= (and d!56095 res!90597) b!191779))

(assert (= (and b!191779 res!90596) b!191780))

(declare-fun m!217911 () Bool)

(assert (=> d!56095 m!217911))

(declare-fun m!217913 () Bool)

(assert (=> d!56095 m!217913))

(declare-fun m!217915 () Bool)

(assert (=> d!56095 m!217915))

(declare-fun m!217917 () Bool)

(assert (=> d!56095 m!217917))

(declare-fun m!217919 () Bool)

(assert (=> b!191779 m!217919))

(declare-fun m!217921 () Bool)

(assert (=> b!191780 m!217921))

(assert (=> b!191539 d!56095))

(declare-fun d!56097 () Bool)

(assert (=> d!56097 (contains!1332 (+!304 lt!95039 (tuple2!3485 lt!95048 (zeroValue!3750 thiss!1248))) lt!95037)))

(declare-fun lt!95174 () Unit!5743)

(declare-fun choose!1049 (ListLongMap!2393 (_ BitVec 64) V!5585 (_ BitVec 64)) Unit!5743)

(assert (=> d!56097 (= lt!95174 (choose!1049 lt!95039 lt!95048 (zeroValue!3750 thiss!1248) lt!95037))))

(assert (=> d!56097 (contains!1332 lt!95039 lt!95037)))

(assert (=> d!56097 (= (addStillContains!158 lt!95039 lt!95048 (zeroValue!3750 thiss!1248) lt!95037) lt!95174)))

(declare-fun bs!7646 () Bool)

(assert (= bs!7646 d!56097))

(assert (=> bs!7646 m!217673))

(assert (=> bs!7646 m!217673))

(assert (=> bs!7646 m!217675))

(declare-fun m!217923 () Bool)

(assert (=> bs!7646 m!217923))

(declare-fun m!217925 () Bool)

(assert (=> bs!7646 m!217925))

(assert (=> b!191539 d!56097))

(declare-fun d!56099 () Bool)

(assert (=> d!56099 (= (apply!182 (+!304 lt!95034 (tuple2!3485 lt!95036 (minValue!3750 thiss!1248))) lt!95038) (get!2208 (getValueByKey!237 (toList!1212 (+!304 lt!95034 (tuple2!3485 lt!95036 (minValue!3750 thiss!1248)))) lt!95038)))))

(declare-fun bs!7647 () Bool)

(assert (= bs!7647 d!56099))

(declare-fun m!217927 () Bool)

(assert (=> bs!7647 m!217927))

(assert (=> bs!7647 m!217927))

(declare-fun m!217929 () Bool)

(assert (=> bs!7647 m!217929))

(assert (=> b!191539 d!56099))

(declare-fun d!56101 () Bool)

(assert (=> d!56101 (= (apply!182 lt!95034 lt!95038) (get!2208 (getValueByKey!237 (toList!1212 lt!95034) lt!95038)))))

(declare-fun bs!7648 () Bool)

(assert (= bs!7648 d!56101))

(declare-fun m!217931 () Bool)

(assert (=> bs!7648 m!217931))

(assert (=> bs!7648 m!217931))

(declare-fun m!217933 () Bool)

(assert (=> bs!7648 m!217933))

(assert (=> b!191539 d!56101))

(declare-fun d!56103 () Bool)

(assert (=> d!56103 (= (apply!182 (+!304 lt!95041 (tuple2!3485 lt!95053 (minValue!3750 thiss!1248))) lt!95051) (apply!182 lt!95041 lt!95051))))

(declare-fun lt!95175 () Unit!5743)

(assert (=> d!56103 (= lt!95175 (choose!1048 lt!95041 lt!95053 (minValue!3750 thiss!1248) lt!95051))))

(declare-fun e!126194 () Bool)

(assert (=> d!56103 e!126194))

(declare-fun res!90598 () Bool)

(assert (=> d!56103 (=> (not res!90598) (not e!126194))))

(assert (=> d!56103 (= res!90598 (contains!1332 lt!95041 lt!95051))))

(assert (=> d!56103 (= (addApplyDifferent!158 lt!95041 lt!95053 (minValue!3750 thiss!1248) lt!95051) lt!95175)))

(declare-fun b!191782 () Bool)

(assert (=> b!191782 (= e!126194 (not (= lt!95051 lt!95053)))))

(assert (= (and d!56103 res!90598) b!191782))

(declare-fun m!217935 () Bool)

(assert (=> d!56103 m!217935))

(assert (=> d!56103 m!217657))

(assert (=> d!56103 m!217659))

(assert (=> d!56103 m!217657))

(assert (=> d!56103 m!217683))

(declare-fun m!217937 () Bool)

(assert (=> d!56103 m!217937))

(assert (=> b!191539 d!56103))

(declare-fun d!56105 () Bool)

(declare-fun e!126195 () Bool)

(assert (=> d!56105 e!126195))

(declare-fun res!90600 () Bool)

(assert (=> d!56105 (=> (not res!90600) (not e!126195))))

(declare-fun lt!95178 () ListLongMap!2393)

(assert (=> d!56105 (= res!90600 (contains!1332 lt!95178 (_1!1753 (tuple2!3485 lt!95053 (minValue!3750 thiss!1248)))))))

(declare-fun lt!95177 () List!2405)

(assert (=> d!56105 (= lt!95178 (ListLongMap!2394 lt!95177))))

(declare-fun lt!95176 () Unit!5743)

(declare-fun lt!95179 () Unit!5743)

(assert (=> d!56105 (= lt!95176 lt!95179)))

(assert (=> d!56105 (= (getValueByKey!237 lt!95177 (_1!1753 (tuple2!3485 lt!95053 (minValue!3750 thiss!1248)))) (Some!242 (_2!1753 (tuple2!3485 lt!95053 (minValue!3750 thiss!1248)))))))

(assert (=> d!56105 (= lt!95179 (lemmaContainsTupThenGetReturnValue!127 lt!95177 (_1!1753 (tuple2!3485 lt!95053 (minValue!3750 thiss!1248))) (_2!1753 (tuple2!3485 lt!95053 (minValue!3750 thiss!1248)))))))

(assert (=> d!56105 (= lt!95177 (insertStrictlySorted!130 (toList!1212 lt!95041) (_1!1753 (tuple2!3485 lt!95053 (minValue!3750 thiss!1248))) (_2!1753 (tuple2!3485 lt!95053 (minValue!3750 thiss!1248)))))))

(assert (=> d!56105 (= (+!304 lt!95041 (tuple2!3485 lt!95053 (minValue!3750 thiss!1248))) lt!95178)))

(declare-fun b!191783 () Bool)

(declare-fun res!90599 () Bool)

(assert (=> b!191783 (=> (not res!90599) (not e!126195))))

(assert (=> b!191783 (= res!90599 (= (getValueByKey!237 (toList!1212 lt!95178) (_1!1753 (tuple2!3485 lt!95053 (minValue!3750 thiss!1248)))) (Some!242 (_2!1753 (tuple2!3485 lt!95053 (minValue!3750 thiss!1248))))))))

(declare-fun b!191784 () Bool)

(assert (=> b!191784 (= e!126195 (contains!1335 (toList!1212 lt!95178) (tuple2!3485 lt!95053 (minValue!3750 thiss!1248))))))

(assert (= (and d!56105 res!90600) b!191783))

(assert (= (and b!191783 res!90599) b!191784))

(declare-fun m!217939 () Bool)

(assert (=> d!56105 m!217939))

(declare-fun m!217941 () Bool)

(assert (=> d!56105 m!217941))

(declare-fun m!217943 () Bool)

(assert (=> d!56105 m!217943))

(declare-fun m!217945 () Bool)

(assert (=> d!56105 m!217945))

(declare-fun m!217947 () Bool)

(assert (=> b!191783 m!217947))

(declare-fun m!217949 () Bool)

(assert (=> b!191784 m!217949))

(assert (=> b!191539 d!56105))

(declare-fun d!56107 () Bool)

(assert (=> d!56107 (= (apply!182 (+!304 lt!95044 (tuple2!3485 lt!95040 (zeroValue!3750 thiss!1248))) lt!95042) (apply!182 lt!95044 lt!95042))))

(declare-fun lt!95180 () Unit!5743)

(assert (=> d!56107 (= lt!95180 (choose!1048 lt!95044 lt!95040 (zeroValue!3750 thiss!1248) lt!95042))))

(declare-fun e!126196 () Bool)

(assert (=> d!56107 e!126196))

(declare-fun res!90601 () Bool)

(assert (=> d!56107 (=> (not res!90601) (not e!126196))))

(assert (=> d!56107 (= res!90601 (contains!1332 lt!95044 lt!95042))))

(assert (=> d!56107 (= (addApplyDifferent!158 lt!95044 lt!95040 (zeroValue!3750 thiss!1248) lt!95042) lt!95180)))

(declare-fun b!191785 () Bool)

(assert (=> b!191785 (= e!126196 (not (= lt!95042 lt!95040)))))

(assert (= (and d!56107 res!90601) b!191785))

(declare-fun m!217951 () Bool)

(assert (=> d!56107 m!217951))

(assert (=> d!56107 m!217661))

(assert (=> d!56107 m!217663))

(assert (=> d!56107 m!217661))

(assert (=> d!56107 m!217665))

(declare-fun m!217953 () Bool)

(assert (=> d!56107 m!217953))

(assert (=> b!191539 d!56107))

(declare-fun d!56109 () Bool)

(assert (=> d!56109 (= (apply!182 lt!95044 lt!95042) (get!2208 (getValueByKey!237 (toList!1212 lt!95044) lt!95042)))))

(declare-fun bs!7649 () Bool)

(assert (= bs!7649 d!56109))

(declare-fun m!217955 () Bool)

(assert (=> bs!7649 m!217955))

(assert (=> bs!7649 m!217955))

(declare-fun m!217957 () Bool)

(assert (=> bs!7649 m!217957))

(assert (=> b!191539 d!56109))

(declare-fun d!56111 () Bool)

(declare-fun e!126197 () Bool)

(assert (=> d!56111 e!126197))

(declare-fun res!90603 () Bool)

(assert (=> d!56111 (=> (not res!90603) (not e!126197))))

(declare-fun lt!95183 () ListLongMap!2393)

(assert (=> d!56111 (= res!90603 (contains!1332 lt!95183 (_1!1753 (tuple2!3485 lt!95040 (zeroValue!3750 thiss!1248)))))))

(declare-fun lt!95182 () List!2405)

(assert (=> d!56111 (= lt!95183 (ListLongMap!2394 lt!95182))))

(declare-fun lt!95181 () Unit!5743)

(declare-fun lt!95184 () Unit!5743)

(assert (=> d!56111 (= lt!95181 lt!95184)))

(assert (=> d!56111 (= (getValueByKey!237 lt!95182 (_1!1753 (tuple2!3485 lt!95040 (zeroValue!3750 thiss!1248)))) (Some!242 (_2!1753 (tuple2!3485 lt!95040 (zeroValue!3750 thiss!1248)))))))

(assert (=> d!56111 (= lt!95184 (lemmaContainsTupThenGetReturnValue!127 lt!95182 (_1!1753 (tuple2!3485 lt!95040 (zeroValue!3750 thiss!1248))) (_2!1753 (tuple2!3485 lt!95040 (zeroValue!3750 thiss!1248)))))))

(assert (=> d!56111 (= lt!95182 (insertStrictlySorted!130 (toList!1212 lt!95044) (_1!1753 (tuple2!3485 lt!95040 (zeroValue!3750 thiss!1248))) (_2!1753 (tuple2!3485 lt!95040 (zeroValue!3750 thiss!1248)))))))

(assert (=> d!56111 (= (+!304 lt!95044 (tuple2!3485 lt!95040 (zeroValue!3750 thiss!1248))) lt!95183)))

(declare-fun b!191786 () Bool)

(declare-fun res!90602 () Bool)

(assert (=> b!191786 (=> (not res!90602) (not e!126197))))

(assert (=> b!191786 (= res!90602 (= (getValueByKey!237 (toList!1212 lt!95183) (_1!1753 (tuple2!3485 lt!95040 (zeroValue!3750 thiss!1248)))) (Some!242 (_2!1753 (tuple2!3485 lt!95040 (zeroValue!3750 thiss!1248))))))))

(declare-fun b!191787 () Bool)

(assert (=> b!191787 (= e!126197 (contains!1335 (toList!1212 lt!95183) (tuple2!3485 lt!95040 (zeroValue!3750 thiss!1248))))))

(assert (= (and d!56111 res!90603) b!191786))

(assert (= (and b!191786 res!90602) b!191787))

(declare-fun m!217959 () Bool)

(assert (=> d!56111 m!217959))

(declare-fun m!217961 () Bool)

(assert (=> d!56111 m!217961))

(declare-fun m!217963 () Bool)

(assert (=> d!56111 m!217963))

(declare-fun m!217965 () Bool)

(assert (=> d!56111 m!217965))

(declare-fun m!217967 () Bool)

(assert (=> b!191786 m!217967))

(declare-fun m!217969 () Bool)

(assert (=> b!191787 m!217969))

(assert (=> b!191539 d!56111))

(declare-fun d!56113 () Bool)

(declare-fun e!126199 () Bool)

(assert (=> d!56113 e!126199))

(declare-fun res!90604 () Bool)

(assert (=> d!56113 (=> res!90604 e!126199)))

(declare-fun lt!95186 () Bool)

(assert (=> d!56113 (= res!90604 (not lt!95186))))

(declare-fun lt!95188 () Bool)

(assert (=> d!56113 (= lt!95186 lt!95188)))

(declare-fun lt!95185 () Unit!5743)

(declare-fun e!126198 () Unit!5743)

(assert (=> d!56113 (= lt!95185 e!126198)))

(declare-fun c!34551 () Bool)

(assert (=> d!56113 (= c!34551 lt!95188)))

(assert (=> d!56113 (= lt!95188 (containsKey!241 (toList!1212 lt!95068) (_1!1753 (tuple2!3485 key!828 v!309))))))

(assert (=> d!56113 (= (contains!1332 lt!95068 (_1!1753 (tuple2!3485 key!828 v!309))) lt!95186)))

(declare-fun b!191788 () Bool)

(declare-fun lt!95187 () Unit!5743)

(assert (=> b!191788 (= e!126198 lt!95187)))

(assert (=> b!191788 (= lt!95187 (lemmaContainsKeyImpliesGetValueByKeyDefined!190 (toList!1212 lt!95068) (_1!1753 (tuple2!3485 key!828 v!309))))))

(assert (=> b!191788 (isDefined!191 (getValueByKey!237 (toList!1212 lt!95068) (_1!1753 (tuple2!3485 key!828 v!309))))))

(declare-fun b!191789 () Bool)

(declare-fun Unit!5759 () Unit!5743)

(assert (=> b!191789 (= e!126198 Unit!5759)))

(declare-fun b!191790 () Bool)

(assert (=> b!191790 (= e!126199 (isDefined!191 (getValueByKey!237 (toList!1212 lt!95068) (_1!1753 (tuple2!3485 key!828 v!309)))))))

(assert (= (and d!56113 c!34551) b!191788))

(assert (= (and d!56113 (not c!34551)) b!191789))

(assert (= (and d!56113 (not res!90604)) b!191790))

(declare-fun m!217971 () Bool)

(assert (=> d!56113 m!217971))

(declare-fun m!217973 () Bool)

(assert (=> b!191788 m!217973))

(assert (=> b!191788 m!217707))

(assert (=> b!191788 m!217707))

(declare-fun m!217975 () Bool)

(assert (=> b!191788 m!217975))

(assert (=> b!191790 m!217707))

(assert (=> b!191790 m!217707))

(assert (=> b!191790 m!217975))

(assert (=> d!56019 d!56113))

(declare-fun b!191791 () Bool)

(declare-fun e!126200 () Option!243)

(assert (=> b!191791 (= e!126200 (Some!242 (_2!1753 (h!3040 lt!95067))))))

(declare-fun b!191792 () Bool)

(declare-fun e!126201 () Option!243)

(assert (=> b!191792 (= e!126200 e!126201)))

(declare-fun c!34553 () Bool)

(assert (=> b!191792 (= c!34553 (and ((_ is Cons!2401) lt!95067) (not (= (_1!1753 (h!3040 lt!95067)) (_1!1753 (tuple2!3485 key!828 v!309))))))))

(declare-fun d!56115 () Bool)

(declare-fun c!34552 () Bool)

(assert (=> d!56115 (= c!34552 (and ((_ is Cons!2401) lt!95067) (= (_1!1753 (h!3040 lt!95067)) (_1!1753 (tuple2!3485 key!828 v!309)))))))

(assert (=> d!56115 (= (getValueByKey!237 lt!95067 (_1!1753 (tuple2!3485 key!828 v!309))) e!126200)))

(declare-fun b!191794 () Bool)

(assert (=> b!191794 (= e!126201 None!241)))

(declare-fun b!191793 () Bool)

(assert (=> b!191793 (= e!126201 (getValueByKey!237 (t!7310 lt!95067) (_1!1753 (tuple2!3485 key!828 v!309))))))

(assert (= (and d!56115 c!34552) b!191791))

(assert (= (and d!56115 (not c!34552)) b!191792))

(assert (= (and b!191792 c!34553) b!191793))

(assert (= (and b!191792 (not c!34553)) b!191794))

(declare-fun m!217977 () Bool)

(assert (=> b!191793 m!217977))

(assert (=> d!56019 d!56115))

(declare-fun d!56117 () Bool)

(assert (=> d!56117 (= (getValueByKey!237 lt!95067 (_1!1753 (tuple2!3485 key!828 v!309))) (Some!242 (_2!1753 (tuple2!3485 key!828 v!309))))))

(declare-fun lt!95191 () Unit!5743)

(declare-fun choose!1050 (List!2405 (_ BitVec 64) V!5585) Unit!5743)

(assert (=> d!56117 (= lt!95191 (choose!1050 lt!95067 (_1!1753 (tuple2!3485 key!828 v!309)) (_2!1753 (tuple2!3485 key!828 v!309))))))

(declare-fun e!126204 () Bool)

(assert (=> d!56117 e!126204))

(declare-fun res!90609 () Bool)

(assert (=> d!56117 (=> (not res!90609) (not e!126204))))

(assert (=> d!56117 (= res!90609 (isStrictlySorted!350 lt!95067))))

(assert (=> d!56117 (= (lemmaContainsTupThenGetReturnValue!127 lt!95067 (_1!1753 (tuple2!3485 key!828 v!309)) (_2!1753 (tuple2!3485 key!828 v!309))) lt!95191)))

(declare-fun b!191799 () Bool)

(declare-fun res!90610 () Bool)

(assert (=> b!191799 (=> (not res!90610) (not e!126204))))

(assert (=> b!191799 (= res!90610 (containsKey!241 lt!95067 (_1!1753 (tuple2!3485 key!828 v!309))))))

(declare-fun b!191800 () Bool)

(assert (=> b!191800 (= e!126204 (contains!1335 lt!95067 (tuple2!3485 (_1!1753 (tuple2!3485 key!828 v!309)) (_2!1753 (tuple2!3485 key!828 v!309)))))))

(assert (= (and d!56117 res!90609) b!191799))

(assert (= (and b!191799 res!90610) b!191800))

(assert (=> d!56117 m!217701))

(declare-fun m!217979 () Bool)

(assert (=> d!56117 m!217979))

(declare-fun m!217981 () Bool)

(assert (=> d!56117 m!217981))

(declare-fun m!217983 () Bool)

(assert (=> b!191799 m!217983))

(declare-fun m!217985 () Bool)

(assert (=> b!191800 m!217985))

(assert (=> d!56019 d!56117))

(declare-fun c!34562 () Bool)

(declare-fun b!191821 () Bool)

(assert (=> b!191821 (= c!34562 (and ((_ is Cons!2401) (toList!1212 lt!94909)) (bvsgt (_1!1753 (h!3040 (toList!1212 lt!94909))) (_1!1753 (tuple2!3485 key!828 v!309)))))))

(declare-fun e!126215 () List!2405)

(declare-fun e!126218 () List!2405)

(assert (=> b!191821 (= e!126215 e!126218)))

(declare-fun b!191822 () Bool)

(declare-fun call!19358 () List!2405)

(assert (=> b!191822 (= e!126215 call!19358)))

(declare-fun e!126217 () List!2405)

(declare-fun b!191823 () Bool)

(declare-fun c!34565 () Bool)

(assert (=> b!191823 (= e!126217 (ite c!34565 (t!7310 (toList!1212 lt!94909)) (ite c!34562 (Cons!2401 (h!3040 (toList!1212 lt!94909)) (t!7310 (toList!1212 lt!94909))) Nil!2402)))))

(declare-fun c!34564 () Bool)

(declare-fun call!19359 () List!2405)

(declare-fun bm!19354 () Bool)

(declare-fun $colon$colon!100 (List!2405 tuple2!3484) List!2405)

(assert (=> bm!19354 (= call!19359 ($colon$colon!100 e!126217 (ite c!34564 (h!3040 (toList!1212 lt!94909)) (tuple2!3485 (_1!1753 (tuple2!3485 key!828 v!309)) (_2!1753 (tuple2!3485 key!828 v!309))))))))

(declare-fun c!34563 () Bool)

(assert (=> bm!19354 (= c!34563 c!34564)))

(declare-fun b!191825 () Bool)

(declare-fun res!90615 () Bool)

(declare-fun e!126219 () Bool)

(assert (=> b!191825 (=> (not res!90615) (not e!126219))))

(declare-fun lt!95194 () List!2405)

(assert (=> b!191825 (= res!90615 (containsKey!241 lt!95194 (_1!1753 (tuple2!3485 key!828 v!309))))))

(declare-fun bm!19355 () Bool)

(declare-fun call!19357 () List!2405)

(assert (=> bm!19355 (= call!19357 call!19358)))

(declare-fun b!191826 () Bool)

(assert (=> b!191826 (= e!126217 (insertStrictlySorted!130 (t!7310 (toList!1212 lt!94909)) (_1!1753 (tuple2!3485 key!828 v!309)) (_2!1753 (tuple2!3485 key!828 v!309))))))

(declare-fun b!191824 () Bool)

(assert (=> b!191824 (= e!126218 call!19357)))

(declare-fun d!56119 () Bool)

(assert (=> d!56119 e!126219))

(declare-fun res!90616 () Bool)

(assert (=> d!56119 (=> (not res!90616) (not e!126219))))

(assert (=> d!56119 (= res!90616 (isStrictlySorted!350 lt!95194))))

(declare-fun e!126216 () List!2405)

(assert (=> d!56119 (= lt!95194 e!126216)))

(assert (=> d!56119 (= c!34564 (and ((_ is Cons!2401) (toList!1212 lt!94909)) (bvslt (_1!1753 (h!3040 (toList!1212 lt!94909))) (_1!1753 (tuple2!3485 key!828 v!309)))))))

(assert (=> d!56119 (isStrictlySorted!350 (toList!1212 lt!94909))))

(assert (=> d!56119 (= (insertStrictlySorted!130 (toList!1212 lt!94909) (_1!1753 (tuple2!3485 key!828 v!309)) (_2!1753 (tuple2!3485 key!828 v!309))) lt!95194)))

(declare-fun b!191827 () Bool)

(assert (=> b!191827 (= e!126218 call!19357)))

(declare-fun bm!19356 () Bool)

(assert (=> bm!19356 (= call!19358 call!19359)))

(declare-fun b!191828 () Bool)

(assert (=> b!191828 (= e!126216 e!126215)))

(assert (=> b!191828 (= c!34565 (and ((_ is Cons!2401) (toList!1212 lt!94909)) (= (_1!1753 (h!3040 (toList!1212 lt!94909))) (_1!1753 (tuple2!3485 key!828 v!309)))))))

(declare-fun b!191829 () Bool)

(assert (=> b!191829 (= e!126216 call!19359)))

(declare-fun b!191830 () Bool)

(assert (=> b!191830 (= e!126219 (contains!1335 lt!95194 (tuple2!3485 (_1!1753 (tuple2!3485 key!828 v!309)) (_2!1753 (tuple2!3485 key!828 v!309)))))))

(assert (= (and d!56119 c!34564) b!191829))

(assert (= (and d!56119 (not c!34564)) b!191828))

(assert (= (and b!191828 c!34565) b!191822))

(assert (= (and b!191828 (not c!34565)) b!191821))

(assert (= (and b!191821 c!34562) b!191824))

(assert (= (and b!191821 (not c!34562)) b!191827))

(assert (= (or b!191824 b!191827) bm!19355))

(assert (= (or b!191822 bm!19355) bm!19356))

(assert (= (or b!191829 bm!19356) bm!19354))

(assert (= (and bm!19354 c!34563) b!191826))

(assert (= (and bm!19354 (not c!34563)) b!191823))

(assert (= (and d!56119 res!90616) b!191825))

(assert (= (and b!191825 res!90615) b!191830))

(declare-fun m!217987 () Bool)

(assert (=> b!191825 m!217987))

(declare-fun m!217989 () Bool)

(assert (=> bm!19354 m!217989))

(declare-fun m!217991 () Bool)

(assert (=> b!191830 m!217991))

(declare-fun m!217993 () Bool)

(assert (=> b!191826 m!217993))

(declare-fun m!217995 () Bool)

(assert (=> d!56119 m!217995))

(assert (=> d!56119 m!217817))

(assert (=> d!56019 d!56119))

(declare-fun d!56121 () Bool)

(assert (=> d!56121 (contains!1332 (+!304 lt!95005 (tuple2!3485 lt!95014 (zeroValue!3750 thiss!1248))) lt!95003)))

(declare-fun lt!95195 () Unit!5743)

(assert (=> d!56121 (= lt!95195 (choose!1049 lt!95005 lt!95014 (zeroValue!3750 thiss!1248) lt!95003))))

(assert (=> d!56121 (contains!1332 lt!95005 lt!95003)))

(assert (=> d!56121 (= (addStillContains!158 lt!95005 lt!95014 (zeroValue!3750 thiss!1248) lt!95003) lt!95195)))

(declare-fun bs!7650 () Bool)

(assert (= bs!7650 d!56121))

(assert (=> bs!7650 m!217613))

(assert (=> bs!7650 m!217613))

(assert (=> bs!7650 m!217615))

(declare-fun m!217997 () Bool)

(assert (=> bs!7650 m!217997))

(declare-fun m!217999 () Bool)

(assert (=> bs!7650 m!217999))

(assert (=> b!191507 d!56121))

(declare-fun d!56123 () Bool)

(assert (=> d!56123 (= (apply!182 lt!95007 lt!95017) (get!2208 (getValueByKey!237 (toList!1212 lt!95007) lt!95017)))))

(declare-fun bs!7651 () Bool)

(assert (= bs!7651 d!56123))

(declare-fun m!218001 () Bool)

(assert (=> bs!7651 m!218001))

(assert (=> bs!7651 m!218001))

(declare-fun m!218003 () Bool)

(assert (=> bs!7651 m!218003))

(assert (=> b!191507 d!56123))

(declare-fun d!56125 () Bool)

(assert (=> d!56125 (= (apply!182 (+!304 lt!95010 (tuple2!3485 lt!95006 (zeroValue!3750 thiss!1248))) lt!95008) (apply!182 lt!95010 lt!95008))))

(declare-fun lt!95196 () Unit!5743)

(assert (=> d!56125 (= lt!95196 (choose!1048 lt!95010 lt!95006 (zeroValue!3750 thiss!1248) lt!95008))))

(declare-fun e!126220 () Bool)

(assert (=> d!56125 e!126220))

(declare-fun res!90617 () Bool)

(assert (=> d!56125 (=> (not res!90617) (not e!126220))))

(assert (=> d!56125 (= res!90617 (contains!1332 lt!95010 lt!95008))))

(assert (=> d!56125 (= (addApplyDifferent!158 lt!95010 lt!95006 (zeroValue!3750 thiss!1248) lt!95008) lt!95196)))

(declare-fun b!191831 () Bool)

(assert (=> b!191831 (= e!126220 (not (= lt!95008 lt!95006)))))

(assert (= (and d!56125 res!90617) b!191831))

(declare-fun m!218005 () Bool)

(assert (=> d!56125 m!218005))

(assert (=> d!56125 m!217601))

(assert (=> d!56125 m!217603))

(assert (=> d!56125 m!217601))

(assert (=> d!56125 m!217605))

(declare-fun m!218007 () Bool)

(assert (=> d!56125 m!218007))

(assert (=> b!191507 d!56125))

(declare-fun d!56127 () Bool)

(assert (=> d!56127 (= (apply!182 (+!304 lt!95000 (tuple2!3485 lt!95002 (minValue!3750 thiss!1248))) lt!95004) (apply!182 lt!95000 lt!95004))))

(declare-fun lt!95197 () Unit!5743)

(assert (=> d!56127 (= lt!95197 (choose!1048 lt!95000 lt!95002 (minValue!3750 thiss!1248) lt!95004))))

(declare-fun e!126221 () Bool)

(assert (=> d!56127 e!126221))

(declare-fun res!90618 () Bool)

(assert (=> d!56127 (=> (not res!90618) (not e!126221))))

(assert (=> d!56127 (= res!90618 (contains!1332 lt!95000 lt!95004))))

(assert (=> d!56127 (= (addApplyDifferent!158 lt!95000 lt!95002 (minValue!3750 thiss!1248) lt!95004) lt!95197)))

(declare-fun b!191832 () Bool)

(assert (=> b!191832 (= e!126221 (not (= lt!95004 lt!95002)))))

(assert (= (and d!56127 res!90618) b!191832))

(declare-fun m!218009 () Bool)

(assert (=> d!56127 m!218009))

(assert (=> d!56127 m!217607))

(assert (=> d!56127 m!217621))

(assert (=> d!56127 m!217607))

(assert (=> d!56127 m!217617))

(declare-fun m!218011 () Bool)

(assert (=> d!56127 m!218011))

(assert (=> b!191507 d!56127))

(declare-fun d!56129 () Bool)

(declare-fun e!126223 () Bool)

(assert (=> d!56129 e!126223))

(declare-fun res!90619 () Bool)

(assert (=> d!56129 (=> res!90619 e!126223)))

(declare-fun lt!95199 () Bool)

(assert (=> d!56129 (= res!90619 (not lt!95199))))

(declare-fun lt!95201 () Bool)

(assert (=> d!56129 (= lt!95199 lt!95201)))

(declare-fun lt!95198 () Unit!5743)

(declare-fun e!126222 () Unit!5743)

(assert (=> d!56129 (= lt!95198 e!126222)))

(declare-fun c!34566 () Bool)

(assert (=> d!56129 (= c!34566 lt!95201)))

(assert (=> d!56129 (= lt!95201 (containsKey!241 (toList!1212 (+!304 lt!95005 (tuple2!3485 lt!95014 (zeroValue!3750 thiss!1248)))) lt!95003))))

(assert (=> d!56129 (= (contains!1332 (+!304 lt!95005 (tuple2!3485 lt!95014 (zeroValue!3750 thiss!1248))) lt!95003) lt!95199)))

(declare-fun b!191833 () Bool)

(declare-fun lt!95200 () Unit!5743)

(assert (=> b!191833 (= e!126222 lt!95200)))

(assert (=> b!191833 (= lt!95200 (lemmaContainsKeyImpliesGetValueByKeyDefined!190 (toList!1212 (+!304 lt!95005 (tuple2!3485 lt!95014 (zeroValue!3750 thiss!1248)))) lt!95003))))

(assert (=> b!191833 (isDefined!191 (getValueByKey!237 (toList!1212 (+!304 lt!95005 (tuple2!3485 lt!95014 (zeroValue!3750 thiss!1248)))) lt!95003))))

(declare-fun b!191834 () Bool)

(declare-fun Unit!5760 () Unit!5743)

(assert (=> b!191834 (= e!126222 Unit!5760)))

(declare-fun b!191835 () Bool)

(assert (=> b!191835 (= e!126223 (isDefined!191 (getValueByKey!237 (toList!1212 (+!304 lt!95005 (tuple2!3485 lt!95014 (zeroValue!3750 thiss!1248)))) lt!95003)))))

(assert (= (and d!56129 c!34566) b!191833))

(assert (= (and d!56129 (not c!34566)) b!191834))

(assert (= (and d!56129 (not res!90619)) b!191835))

(declare-fun m!218013 () Bool)

(assert (=> d!56129 m!218013))

(declare-fun m!218015 () Bool)

(assert (=> b!191833 m!218015))

(declare-fun m!218017 () Bool)

(assert (=> b!191833 m!218017))

(assert (=> b!191833 m!218017))

(declare-fun m!218019 () Bool)

(assert (=> b!191833 m!218019))

(assert (=> b!191835 m!218017))

(assert (=> b!191835 m!218017))

(assert (=> b!191835 m!218019))

(assert (=> b!191507 d!56129))

(declare-fun d!56131 () Bool)

(declare-fun e!126224 () Bool)

(assert (=> d!56131 e!126224))

(declare-fun res!90621 () Bool)

(assert (=> d!56131 (=> (not res!90621) (not e!126224))))

(declare-fun lt!95204 () ListLongMap!2393)

(assert (=> d!56131 (= res!90621 (contains!1332 lt!95204 (_1!1753 (tuple2!3485 lt!95019 (minValue!3750 thiss!1248)))))))

(declare-fun lt!95203 () List!2405)

(assert (=> d!56131 (= lt!95204 (ListLongMap!2394 lt!95203))))

(declare-fun lt!95202 () Unit!5743)

(declare-fun lt!95205 () Unit!5743)

(assert (=> d!56131 (= lt!95202 lt!95205)))

(assert (=> d!56131 (= (getValueByKey!237 lt!95203 (_1!1753 (tuple2!3485 lt!95019 (minValue!3750 thiss!1248)))) (Some!242 (_2!1753 (tuple2!3485 lt!95019 (minValue!3750 thiss!1248)))))))

(assert (=> d!56131 (= lt!95205 (lemmaContainsTupThenGetReturnValue!127 lt!95203 (_1!1753 (tuple2!3485 lt!95019 (minValue!3750 thiss!1248))) (_2!1753 (tuple2!3485 lt!95019 (minValue!3750 thiss!1248)))))))

(assert (=> d!56131 (= lt!95203 (insertStrictlySorted!130 (toList!1212 lt!95007) (_1!1753 (tuple2!3485 lt!95019 (minValue!3750 thiss!1248))) (_2!1753 (tuple2!3485 lt!95019 (minValue!3750 thiss!1248)))))))

(assert (=> d!56131 (= (+!304 lt!95007 (tuple2!3485 lt!95019 (minValue!3750 thiss!1248))) lt!95204)))

(declare-fun b!191836 () Bool)

(declare-fun res!90620 () Bool)

(assert (=> b!191836 (=> (not res!90620) (not e!126224))))

(assert (=> b!191836 (= res!90620 (= (getValueByKey!237 (toList!1212 lt!95204) (_1!1753 (tuple2!3485 lt!95019 (minValue!3750 thiss!1248)))) (Some!242 (_2!1753 (tuple2!3485 lt!95019 (minValue!3750 thiss!1248))))))))

(declare-fun b!191837 () Bool)

(assert (=> b!191837 (= e!126224 (contains!1335 (toList!1212 lt!95204) (tuple2!3485 lt!95019 (minValue!3750 thiss!1248))))))

(assert (= (and d!56131 res!90621) b!191836))

(assert (= (and b!191836 res!90620) b!191837))

(declare-fun m!218021 () Bool)

(assert (=> d!56131 m!218021))

(declare-fun m!218023 () Bool)

(assert (=> d!56131 m!218023))

(declare-fun m!218025 () Bool)

(assert (=> d!56131 m!218025))

(declare-fun m!218027 () Bool)

(assert (=> d!56131 m!218027))

(declare-fun m!218029 () Bool)

(assert (=> b!191836 m!218029))

(declare-fun m!218031 () Bool)

(assert (=> b!191837 m!218031))

(assert (=> b!191507 d!56131))

(declare-fun b!191838 () Bool)

(declare-fun e!126228 () Bool)

(declare-fun e!126230 () Bool)

(assert (=> b!191838 (= e!126228 e!126230)))

(assert (=> b!191838 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4149 (_keys!5886 thiss!1248))))))

(declare-fun res!90623 () Bool)

(declare-fun lt!95208 () ListLongMap!2393)

(assert (=> b!191838 (= res!90623 (contains!1332 lt!95208 (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!191838 (=> (not res!90623) (not e!126230))))

(declare-fun bm!19357 () Bool)

(declare-fun call!19360 () ListLongMap!2393)

(assert (=> bm!19357 (= call!19360 (getCurrentListMapNoExtraKeys!203 (_keys!5886 thiss!1248) (array!8128 (store (arr!3827 (_values!3892 thiss!1248)) (index!4895 lt!94908) (ValueCellFull!1883 v!309)) (size!4150 (_values!3892 thiss!1248))) (mask!9129 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3909 thiss!1248)))))

(declare-fun b!191839 () Bool)

(assert (=> b!191839 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4149 (_keys!5886 thiss!1248))))))

(assert (=> b!191839 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4150 (array!8128 (store (arr!3827 (_values!3892 thiss!1248)) (index!4895 lt!94908) (ValueCellFull!1883 v!309)) (size!4150 (_values!3892 thiss!1248))))))))

(assert (=> b!191839 (= e!126230 (= (apply!182 lt!95208 (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000)) (get!2207 (select (arr!3827 (array!8128 (store (arr!3827 (_values!3892 thiss!1248)) (index!4895 lt!94908) (ValueCellFull!1883 v!309)) (size!4150 (_values!3892 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!516 (defaultEntry!3909 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!191840 () Bool)

(declare-fun res!90625 () Bool)

(declare-fun e!126227 () Bool)

(assert (=> b!191840 (=> (not res!90625) (not e!126227))))

(assert (=> b!191840 (= res!90625 (not (contains!1332 lt!95208 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!191842 () Bool)

(assert (=> b!191842 (= e!126227 e!126228)))

(declare-fun c!34569 () Bool)

(declare-fun e!126229 () Bool)

(assert (=> b!191842 (= c!34569 e!126229)))

(declare-fun res!90622 () Bool)

(assert (=> b!191842 (=> (not res!90622) (not e!126229))))

(assert (=> b!191842 (= res!90622 (bvslt #b00000000000000000000000000000000 (size!4149 (_keys!5886 thiss!1248))))))

(declare-fun b!191843 () Bool)

(declare-fun e!126225 () ListLongMap!2393)

(assert (=> b!191843 (= e!126225 (ListLongMap!2394 Nil!2402))))

(declare-fun b!191844 () Bool)

(declare-fun e!126226 () Bool)

(assert (=> b!191844 (= e!126226 (isEmpty!488 lt!95208))))

(declare-fun b!191845 () Bool)

(assert (=> b!191845 (= e!126229 (validKeyInArray!0 (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!191845 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!191846 () Bool)

(assert (=> b!191846 (= e!126226 (= lt!95208 (getCurrentListMapNoExtraKeys!203 (_keys!5886 thiss!1248) (array!8128 (store (arr!3827 (_values!3892 thiss!1248)) (index!4895 lt!94908) (ValueCellFull!1883 v!309)) (size!4150 (_values!3892 thiss!1248))) (mask!9129 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3909 thiss!1248))))))

(declare-fun b!191847 () Bool)

(declare-fun e!126231 () ListLongMap!2393)

(assert (=> b!191847 (= e!126231 call!19360)))

(declare-fun d!56133 () Bool)

(assert (=> d!56133 e!126227))

(declare-fun res!90624 () Bool)

(assert (=> d!56133 (=> (not res!90624) (not e!126227))))

(assert (=> d!56133 (= res!90624 (not (contains!1332 lt!95208 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56133 (= lt!95208 e!126225)))

(declare-fun c!34570 () Bool)

(assert (=> d!56133 (= c!34570 (bvsge #b00000000000000000000000000000000 (size!4149 (_keys!5886 thiss!1248))))))

(assert (=> d!56133 (validMask!0 (mask!9129 thiss!1248))))

(assert (=> d!56133 (= (getCurrentListMapNoExtraKeys!203 (_keys!5886 thiss!1248) (array!8128 (store (arr!3827 (_values!3892 thiss!1248)) (index!4895 lt!94908) (ValueCellFull!1883 v!309)) (size!4150 (_values!3892 thiss!1248))) (mask!9129 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248)) lt!95208)))

(declare-fun b!191841 () Bool)

(assert (=> b!191841 (= e!126228 e!126226)))

(declare-fun c!34568 () Bool)

(assert (=> b!191841 (= c!34568 (bvslt #b00000000000000000000000000000000 (size!4149 (_keys!5886 thiss!1248))))))

(declare-fun b!191848 () Bool)

(assert (=> b!191848 (= e!126225 e!126231)))

(declare-fun c!34567 () Bool)

(assert (=> b!191848 (= c!34567 (validKeyInArray!0 (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191849 () Bool)

(declare-fun lt!95212 () Unit!5743)

(declare-fun lt!95206 () Unit!5743)

(assert (=> b!191849 (= lt!95212 lt!95206)))

(declare-fun lt!95209 () V!5585)

(declare-fun lt!95210 () (_ BitVec 64))

(declare-fun lt!95207 () ListLongMap!2393)

(declare-fun lt!95211 () (_ BitVec 64))

(assert (=> b!191849 (not (contains!1332 (+!304 lt!95207 (tuple2!3485 lt!95210 lt!95209)) lt!95211))))

(assert (=> b!191849 (= lt!95206 (addStillNotContains!96 lt!95207 lt!95210 lt!95209 lt!95211))))

(assert (=> b!191849 (= lt!95211 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!191849 (= lt!95209 (get!2207 (select (arr!3827 (array!8128 (store (arr!3827 (_values!3892 thiss!1248)) (index!4895 lt!94908) (ValueCellFull!1883 v!309)) (size!4150 (_values!3892 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!516 (defaultEntry!3909 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!191849 (= lt!95210 (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!191849 (= lt!95207 call!19360)))

(assert (=> b!191849 (= e!126231 (+!304 call!19360 (tuple2!3485 (select (arr!3826 (_keys!5886 thiss!1248)) #b00000000000000000000000000000000) (get!2207 (select (arr!3827 (array!8128 (store (arr!3827 (_values!3892 thiss!1248)) (index!4895 lt!94908) (ValueCellFull!1883 v!309)) (size!4150 (_values!3892 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!516 (defaultEntry!3909 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!56133 c!34570) b!191843))

(assert (= (and d!56133 (not c!34570)) b!191848))

(assert (= (and b!191848 c!34567) b!191849))

(assert (= (and b!191848 (not c!34567)) b!191847))

(assert (= (or b!191849 b!191847) bm!19357))

(assert (= (and d!56133 res!90624) b!191840))

(assert (= (and b!191840 res!90625) b!191842))

(assert (= (and b!191842 res!90622) b!191845))

(assert (= (and b!191842 c!34569) b!191838))

(assert (= (and b!191842 (not c!34569)) b!191841))

(assert (= (and b!191838 res!90623) b!191839))

(assert (= (and b!191841 c!34568) b!191846))

(assert (= (and b!191841 (not c!34568)) b!191844))

(declare-fun b_lambda!7393 () Bool)

(assert (=> (not b_lambda!7393) (not b!191839)))

(assert (=> b!191839 t!7314))

(declare-fun b_and!11343 () Bool)

(assert (= b_and!11341 (and (=> t!7314 result!4895) b_and!11343)))

(declare-fun b_lambda!7395 () Bool)

(assert (=> (not b_lambda!7395) (not b!191849)))

(assert (=> b!191849 t!7314))

(declare-fun b_and!11345 () Bool)

(assert (= b_and!11343 (and (=> t!7314 result!4895) b_and!11345)))

(assert (=> b!191848 m!217577))

(assert (=> b!191848 m!217577))

(assert (=> b!191848 m!217579))

(assert (=> b!191845 m!217577))

(assert (=> b!191845 m!217577))

(assert (=> b!191845 m!217579))

(declare-fun m!218033 () Bool)

(assert (=> bm!19357 m!218033))

(declare-fun m!218035 () Bool)

(assert (=> b!191849 m!218035))

(declare-fun m!218037 () Bool)

(assert (=> b!191849 m!218037))

(declare-fun m!218039 () Bool)

(assert (=> b!191849 m!218039))

(assert (=> b!191849 m!217585))

(assert (=> b!191849 m!217583))

(assert (=> b!191849 m!217585))

(assert (=> b!191849 m!217587))

(declare-fun m!218041 () Bool)

(assert (=> b!191849 m!218041))

(assert (=> b!191849 m!217577))

(assert (=> b!191849 m!217583))

(assert (=> b!191849 m!218035))

(assert (=> b!191838 m!217577))

(assert (=> b!191838 m!217577))

(declare-fun m!218043 () Bool)

(assert (=> b!191838 m!218043))

(declare-fun m!218045 () Bool)

(assert (=> b!191840 m!218045))

(assert (=> b!191839 m!217583))

(assert (=> b!191839 m!217585))

(assert (=> b!191839 m!217587))

(assert (=> b!191839 m!217577))

(assert (=> b!191839 m!217583))

(assert (=> b!191839 m!217585))

(assert (=> b!191839 m!217577))

(declare-fun m!218047 () Bool)

(assert (=> b!191839 m!218047))

(declare-fun m!218049 () Bool)

(assert (=> d!56133 m!218049))

(assert (=> d!56133 m!217479))

(assert (=> b!191846 m!218033))

(declare-fun m!218051 () Bool)

(assert (=> b!191844 m!218051))

(assert (=> b!191507 d!56133))

(declare-fun d!56135 () Bool)

(assert (=> d!56135 (= (apply!182 (+!304 lt!95010 (tuple2!3485 lt!95006 (zeroValue!3750 thiss!1248))) lt!95008) (get!2208 (getValueByKey!237 (toList!1212 (+!304 lt!95010 (tuple2!3485 lt!95006 (zeroValue!3750 thiss!1248)))) lt!95008)))))

(declare-fun bs!7652 () Bool)

(assert (= bs!7652 d!56135))

(declare-fun m!218053 () Bool)

(assert (=> bs!7652 m!218053))

(assert (=> bs!7652 m!218053))

(declare-fun m!218055 () Bool)

(assert (=> bs!7652 m!218055))

(assert (=> b!191507 d!56135))

(declare-fun d!56137 () Bool)

(assert (=> d!56137 (= (apply!182 (+!304 lt!95000 (tuple2!3485 lt!95002 (minValue!3750 thiss!1248))) lt!95004) (get!2208 (getValueByKey!237 (toList!1212 (+!304 lt!95000 (tuple2!3485 lt!95002 (minValue!3750 thiss!1248)))) lt!95004)))))

(declare-fun bs!7653 () Bool)

(assert (= bs!7653 d!56137))

(declare-fun m!218057 () Bool)

(assert (=> bs!7653 m!218057))

(assert (=> bs!7653 m!218057))

(declare-fun m!218059 () Bool)

(assert (=> bs!7653 m!218059))

(assert (=> b!191507 d!56137))

(declare-fun d!56139 () Bool)

(assert (=> d!56139 (= (apply!182 lt!95010 lt!95008) (get!2208 (getValueByKey!237 (toList!1212 lt!95010) lt!95008)))))

(declare-fun bs!7654 () Bool)

(assert (= bs!7654 d!56139))

(declare-fun m!218061 () Bool)

(assert (=> bs!7654 m!218061))

(assert (=> bs!7654 m!218061))

(declare-fun m!218063 () Bool)

(assert (=> bs!7654 m!218063))

(assert (=> b!191507 d!56139))

(declare-fun d!56141 () Bool)

(assert (=> d!56141 (= (apply!182 lt!95000 lt!95004) (get!2208 (getValueByKey!237 (toList!1212 lt!95000) lt!95004)))))

(declare-fun bs!7655 () Bool)

(assert (= bs!7655 d!56141))

(declare-fun m!218065 () Bool)

(assert (=> bs!7655 m!218065))

(assert (=> bs!7655 m!218065))

(declare-fun m!218067 () Bool)

(assert (=> bs!7655 m!218067))

(assert (=> b!191507 d!56141))

(declare-fun d!56143 () Bool)

(declare-fun e!126232 () Bool)

(assert (=> d!56143 e!126232))

(declare-fun res!90627 () Bool)

(assert (=> d!56143 (=> (not res!90627) (not e!126232))))

(declare-fun lt!95215 () ListLongMap!2393)

(assert (=> d!56143 (= res!90627 (contains!1332 lt!95215 (_1!1753 (tuple2!3485 lt!95014 (zeroValue!3750 thiss!1248)))))))

(declare-fun lt!95214 () List!2405)

(assert (=> d!56143 (= lt!95215 (ListLongMap!2394 lt!95214))))

(declare-fun lt!95213 () Unit!5743)

(declare-fun lt!95216 () Unit!5743)

(assert (=> d!56143 (= lt!95213 lt!95216)))

(assert (=> d!56143 (= (getValueByKey!237 lt!95214 (_1!1753 (tuple2!3485 lt!95014 (zeroValue!3750 thiss!1248)))) (Some!242 (_2!1753 (tuple2!3485 lt!95014 (zeroValue!3750 thiss!1248)))))))

(assert (=> d!56143 (= lt!95216 (lemmaContainsTupThenGetReturnValue!127 lt!95214 (_1!1753 (tuple2!3485 lt!95014 (zeroValue!3750 thiss!1248))) (_2!1753 (tuple2!3485 lt!95014 (zeroValue!3750 thiss!1248)))))))

(assert (=> d!56143 (= lt!95214 (insertStrictlySorted!130 (toList!1212 lt!95005) (_1!1753 (tuple2!3485 lt!95014 (zeroValue!3750 thiss!1248))) (_2!1753 (tuple2!3485 lt!95014 (zeroValue!3750 thiss!1248)))))))

(assert (=> d!56143 (= (+!304 lt!95005 (tuple2!3485 lt!95014 (zeroValue!3750 thiss!1248))) lt!95215)))

(declare-fun b!191850 () Bool)

(declare-fun res!90626 () Bool)

(assert (=> b!191850 (=> (not res!90626) (not e!126232))))

(assert (=> b!191850 (= res!90626 (= (getValueByKey!237 (toList!1212 lt!95215) (_1!1753 (tuple2!3485 lt!95014 (zeroValue!3750 thiss!1248)))) (Some!242 (_2!1753 (tuple2!3485 lt!95014 (zeroValue!3750 thiss!1248))))))))

(declare-fun b!191851 () Bool)

(assert (=> b!191851 (= e!126232 (contains!1335 (toList!1212 lt!95215) (tuple2!3485 lt!95014 (zeroValue!3750 thiss!1248))))))

(assert (= (and d!56143 res!90627) b!191850))

(assert (= (and b!191850 res!90626) b!191851))

(declare-fun m!218069 () Bool)

(assert (=> d!56143 m!218069))

(declare-fun m!218071 () Bool)

(assert (=> d!56143 m!218071))

(declare-fun m!218073 () Bool)

(assert (=> d!56143 m!218073))

(declare-fun m!218075 () Bool)

(assert (=> d!56143 m!218075))

(declare-fun m!218077 () Bool)

(assert (=> b!191850 m!218077))

(declare-fun m!218079 () Bool)

(assert (=> b!191851 m!218079))

(assert (=> b!191507 d!56143))

(declare-fun d!56145 () Bool)

(declare-fun e!126233 () Bool)

(assert (=> d!56145 e!126233))

(declare-fun res!90629 () Bool)

(assert (=> d!56145 (=> (not res!90629) (not e!126233))))

(declare-fun lt!95219 () ListLongMap!2393)

(assert (=> d!56145 (= res!90629 (contains!1332 lt!95219 (_1!1753 (tuple2!3485 lt!95006 (zeroValue!3750 thiss!1248)))))))

(declare-fun lt!95218 () List!2405)

(assert (=> d!56145 (= lt!95219 (ListLongMap!2394 lt!95218))))

(declare-fun lt!95217 () Unit!5743)

(declare-fun lt!95220 () Unit!5743)

(assert (=> d!56145 (= lt!95217 lt!95220)))

(assert (=> d!56145 (= (getValueByKey!237 lt!95218 (_1!1753 (tuple2!3485 lt!95006 (zeroValue!3750 thiss!1248)))) (Some!242 (_2!1753 (tuple2!3485 lt!95006 (zeroValue!3750 thiss!1248)))))))

(assert (=> d!56145 (= lt!95220 (lemmaContainsTupThenGetReturnValue!127 lt!95218 (_1!1753 (tuple2!3485 lt!95006 (zeroValue!3750 thiss!1248))) (_2!1753 (tuple2!3485 lt!95006 (zeroValue!3750 thiss!1248)))))))

(assert (=> d!56145 (= lt!95218 (insertStrictlySorted!130 (toList!1212 lt!95010) (_1!1753 (tuple2!3485 lt!95006 (zeroValue!3750 thiss!1248))) (_2!1753 (tuple2!3485 lt!95006 (zeroValue!3750 thiss!1248)))))))

(assert (=> d!56145 (= (+!304 lt!95010 (tuple2!3485 lt!95006 (zeroValue!3750 thiss!1248))) lt!95219)))

(declare-fun b!191852 () Bool)

(declare-fun res!90628 () Bool)

(assert (=> b!191852 (=> (not res!90628) (not e!126233))))

(assert (=> b!191852 (= res!90628 (= (getValueByKey!237 (toList!1212 lt!95219) (_1!1753 (tuple2!3485 lt!95006 (zeroValue!3750 thiss!1248)))) (Some!242 (_2!1753 (tuple2!3485 lt!95006 (zeroValue!3750 thiss!1248))))))))

(declare-fun b!191853 () Bool)

(assert (=> b!191853 (= e!126233 (contains!1335 (toList!1212 lt!95219) (tuple2!3485 lt!95006 (zeroValue!3750 thiss!1248))))))

(assert (= (and d!56145 res!90629) b!191852))

(assert (= (and b!191852 res!90628) b!191853))

(declare-fun m!218081 () Bool)

(assert (=> d!56145 m!218081))

(declare-fun m!218083 () Bool)

(assert (=> d!56145 m!218083))

(declare-fun m!218085 () Bool)

(assert (=> d!56145 m!218085))

(declare-fun m!218087 () Bool)

(assert (=> d!56145 m!218087))

(declare-fun m!218089 () Bool)

(assert (=> b!191852 m!218089))

(declare-fun m!218091 () Bool)

(assert (=> b!191853 m!218091))

(assert (=> b!191507 d!56145))

(declare-fun d!56147 () Bool)

(assert (=> d!56147 (= (apply!182 (+!304 lt!95007 (tuple2!3485 lt!95019 (minValue!3750 thiss!1248))) lt!95017) (apply!182 lt!95007 lt!95017))))

(declare-fun lt!95221 () Unit!5743)

(assert (=> d!56147 (= lt!95221 (choose!1048 lt!95007 lt!95019 (minValue!3750 thiss!1248) lt!95017))))

(declare-fun e!126234 () Bool)

(assert (=> d!56147 e!126234))

(declare-fun res!90630 () Bool)

(assert (=> d!56147 (=> (not res!90630) (not e!126234))))

(assert (=> d!56147 (= res!90630 (contains!1332 lt!95007 lt!95017))))

(assert (=> d!56147 (= (addApplyDifferent!158 lt!95007 lt!95019 (minValue!3750 thiss!1248) lt!95017) lt!95221)))

(declare-fun b!191854 () Bool)

(assert (=> b!191854 (= e!126234 (not (= lt!95017 lt!95019)))))

(assert (= (and d!56147 res!90630) b!191854))

(declare-fun m!218093 () Bool)

(assert (=> d!56147 m!218093))

(assert (=> d!56147 m!217597))

(assert (=> d!56147 m!217599))

(assert (=> d!56147 m!217597))

(assert (=> d!56147 m!217623))

(declare-fun m!218095 () Bool)

(assert (=> d!56147 m!218095))

(assert (=> b!191507 d!56147))

(declare-fun d!56149 () Bool)

(assert (=> d!56149 (= (apply!182 (+!304 lt!95007 (tuple2!3485 lt!95019 (minValue!3750 thiss!1248))) lt!95017) (get!2208 (getValueByKey!237 (toList!1212 (+!304 lt!95007 (tuple2!3485 lt!95019 (minValue!3750 thiss!1248)))) lt!95017)))))

(declare-fun bs!7656 () Bool)

(assert (= bs!7656 d!56149))

(declare-fun m!218097 () Bool)

(assert (=> bs!7656 m!218097))

(assert (=> bs!7656 m!218097))

(declare-fun m!218099 () Bool)

(assert (=> bs!7656 m!218099))

(assert (=> b!191507 d!56149))

(declare-fun d!56151 () Bool)

(declare-fun e!126235 () Bool)

(assert (=> d!56151 e!126235))

(declare-fun res!90632 () Bool)

(assert (=> d!56151 (=> (not res!90632) (not e!126235))))

(declare-fun lt!95224 () ListLongMap!2393)

(assert (=> d!56151 (= res!90632 (contains!1332 lt!95224 (_1!1753 (tuple2!3485 lt!95002 (minValue!3750 thiss!1248)))))))

(declare-fun lt!95223 () List!2405)

(assert (=> d!56151 (= lt!95224 (ListLongMap!2394 lt!95223))))

(declare-fun lt!95222 () Unit!5743)

(declare-fun lt!95225 () Unit!5743)

(assert (=> d!56151 (= lt!95222 lt!95225)))

(assert (=> d!56151 (= (getValueByKey!237 lt!95223 (_1!1753 (tuple2!3485 lt!95002 (minValue!3750 thiss!1248)))) (Some!242 (_2!1753 (tuple2!3485 lt!95002 (minValue!3750 thiss!1248)))))))

(assert (=> d!56151 (= lt!95225 (lemmaContainsTupThenGetReturnValue!127 lt!95223 (_1!1753 (tuple2!3485 lt!95002 (minValue!3750 thiss!1248))) (_2!1753 (tuple2!3485 lt!95002 (minValue!3750 thiss!1248)))))))

(assert (=> d!56151 (= lt!95223 (insertStrictlySorted!130 (toList!1212 lt!95000) (_1!1753 (tuple2!3485 lt!95002 (minValue!3750 thiss!1248))) (_2!1753 (tuple2!3485 lt!95002 (minValue!3750 thiss!1248)))))))

(assert (=> d!56151 (= (+!304 lt!95000 (tuple2!3485 lt!95002 (minValue!3750 thiss!1248))) lt!95224)))

(declare-fun b!191855 () Bool)

(declare-fun res!90631 () Bool)

(assert (=> b!191855 (=> (not res!90631) (not e!126235))))

(assert (=> b!191855 (= res!90631 (= (getValueByKey!237 (toList!1212 lt!95224) (_1!1753 (tuple2!3485 lt!95002 (minValue!3750 thiss!1248)))) (Some!242 (_2!1753 (tuple2!3485 lt!95002 (minValue!3750 thiss!1248))))))))

(declare-fun b!191856 () Bool)

(assert (=> b!191856 (= e!126235 (contains!1335 (toList!1212 lt!95224) (tuple2!3485 lt!95002 (minValue!3750 thiss!1248))))))

(assert (= (and d!56151 res!90632) b!191855))

(assert (= (and b!191855 res!90631) b!191856))

(declare-fun m!218101 () Bool)

(assert (=> d!56151 m!218101))

(declare-fun m!218103 () Bool)

(assert (=> d!56151 m!218103))

(declare-fun m!218105 () Bool)

(assert (=> d!56151 m!218105))

(declare-fun m!218107 () Bool)

(assert (=> d!56151 m!218107))

(declare-fun m!218109 () Bool)

(assert (=> b!191855 m!218109))

(declare-fun m!218111 () Bool)

(assert (=> b!191856 m!218111))

(assert (=> b!191507 d!56151))

(declare-fun d!56153 () Bool)

(declare-fun e!126236 () Bool)

(assert (=> d!56153 e!126236))

(declare-fun res!90634 () Bool)

(assert (=> d!56153 (=> (not res!90634) (not e!126236))))

(declare-fun lt!95228 () ListLongMap!2393)

(assert (=> d!56153 (= res!90634 (contains!1332 lt!95228 (_1!1753 (ite (or c!34477 c!34480) (tuple2!3485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))))))))

(declare-fun lt!95227 () List!2405)

(assert (=> d!56153 (= lt!95228 (ListLongMap!2394 lt!95227))))

(declare-fun lt!95226 () Unit!5743)

(declare-fun lt!95229 () Unit!5743)

(assert (=> d!56153 (= lt!95226 lt!95229)))

(assert (=> d!56153 (= (getValueByKey!237 lt!95227 (_1!1753 (ite (or c!34477 c!34480) (tuple2!3485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))))) (Some!242 (_2!1753 (ite (or c!34477 c!34480) (tuple2!3485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))))))))

(assert (=> d!56153 (= lt!95229 (lemmaContainsTupThenGetReturnValue!127 lt!95227 (_1!1753 (ite (or c!34477 c!34480) (tuple2!3485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))) (_2!1753 (ite (or c!34477 c!34480) (tuple2!3485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))))))))

(assert (=> d!56153 (= lt!95227 (insertStrictlySorted!130 (toList!1212 (ite c!34477 call!19326 (ite c!34480 call!19329 call!19330))) (_1!1753 (ite (or c!34477 c!34480) (tuple2!3485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))) (_2!1753 (ite (or c!34477 c!34480) (tuple2!3485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))))))))

(assert (=> d!56153 (= (+!304 (ite c!34477 call!19326 (ite c!34480 call!19329 call!19330)) (ite (or c!34477 c!34480) (tuple2!3485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))) lt!95228)))

(declare-fun b!191857 () Bool)

(declare-fun res!90633 () Bool)

(assert (=> b!191857 (=> (not res!90633) (not e!126236))))

(assert (=> b!191857 (= res!90633 (= (getValueByKey!237 (toList!1212 lt!95228) (_1!1753 (ite (or c!34477 c!34480) (tuple2!3485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))))) (Some!242 (_2!1753 (ite (or c!34477 c!34480) (tuple2!3485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))))))))

(declare-fun b!191858 () Bool)

(assert (=> b!191858 (= e!126236 (contains!1335 (toList!1212 lt!95228) (ite (or c!34477 c!34480) (tuple2!3485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))))))

(assert (= (and d!56153 res!90634) b!191857))

(assert (= (and b!191857 res!90633) b!191858))

(declare-fun m!218113 () Bool)

(assert (=> d!56153 m!218113))

(declare-fun m!218115 () Bool)

(assert (=> d!56153 m!218115))

(declare-fun m!218117 () Bool)

(assert (=> d!56153 m!218117))

(declare-fun m!218119 () Bool)

(assert (=> d!56153 m!218119))

(declare-fun m!218121 () Bool)

(assert (=> b!191857 m!218121))

(declare-fun m!218123 () Bool)

(assert (=> b!191858 m!218123))

(assert (=> bm!19324 d!56153))

(declare-fun d!56155 () Bool)

(declare-fun e!126237 () Bool)

(assert (=> d!56155 e!126237))

(declare-fun res!90636 () Bool)

(assert (=> d!56155 (=> (not res!90636) (not e!126237))))

(declare-fun lt!95232 () ListLongMap!2393)

(assert (=> d!56155 (= res!90636 (contains!1332 lt!95232 (_1!1753 (ite (or c!34486 c!34489) (tuple2!3485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))))))))

(declare-fun lt!95231 () List!2405)

(assert (=> d!56155 (= lt!95232 (ListLongMap!2394 lt!95231))))

(declare-fun lt!95230 () Unit!5743)

(declare-fun lt!95233 () Unit!5743)

(assert (=> d!56155 (= lt!95230 lt!95233)))

(assert (=> d!56155 (= (getValueByKey!237 lt!95231 (_1!1753 (ite (or c!34486 c!34489) (tuple2!3485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))))) (Some!242 (_2!1753 (ite (or c!34486 c!34489) (tuple2!3485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))))))))

(assert (=> d!56155 (= lt!95233 (lemmaContainsTupThenGetReturnValue!127 lt!95231 (_1!1753 (ite (or c!34486 c!34489) (tuple2!3485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))) (_2!1753 (ite (or c!34486 c!34489) (tuple2!3485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))))))))

(assert (=> d!56155 (= lt!95231 (insertStrictlySorted!130 (toList!1212 (ite c!34486 call!19333 (ite c!34489 call!19336 call!19337))) (_1!1753 (ite (or c!34486 c!34489) (tuple2!3485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))) (_2!1753 (ite (or c!34486 c!34489) (tuple2!3485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))))))))

(assert (=> d!56155 (= (+!304 (ite c!34486 call!19333 (ite c!34489 call!19336 call!19337)) (ite (or c!34486 c!34489) (tuple2!3485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))) lt!95232)))

(declare-fun b!191859 () Bool)

(declare-fun res!90635 () Bool)

(assert (=> b!191859 (=> (not res!90635) (not e!126237))))

(assert (=> b!191859 (= res!90635 (= (getValueByKey!237 (toList!1212 lt!95232) (_1!1753 (ite (or c!34486 c!34489) (tuple2!3485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))))) (Some!242 (_2!1753 (ite (or c!34486 c!34489) (tuple2!3485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))))))))

(declare-fun b!191860 () Bool)

(assert (=> b!191860 (= e!126237 (contains!1335 (toList!1212 lt!95232) (ite (or c!34486 c!34489) (tuple2!3485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))))))

(assert (= (and d!56155 res!90636) b!191859))

(assert (= (and b!191859 res!90635) b!191860))

(declare-fun m!218125 () Bool)

(assert (=> d!56155 m!218125))

(declare-fun m!218127 () Bool)

(assert (=> d!56155 m!218127))

(declare-fun m!218129 () Bool)

(assert (=> d!56155 m!218129))

(declare-fun m!218131 () Bool)

(assert (=> d!56155 m!218131))

(declare-fun m!218133 () Bool)

(assert (=> b!191859 m!218133))

(declare-fun m!218135 () Bool)

(assert (=> b!191860 m!218135))

(assert (=> bm!19331 d!56155))

(assert (=> d!56007 d!56021))

(declare-fun b!191877 () Bool)

(declare-fun res!90645 () Bool)

(declare-fun e!126249 () Bool)

(assert (=> b!191877 (=> (not res!90645) (not e!126249))))

(declare-fun call!19365 () Bool)

(assert (=> b!191877 (= res!90645 call!19365)))

(declare-fun e!126246 () Bool)

(assert (=> b!191877 (= e!126246 e!126249)))

(declare-fun b!191878 () Bool)

(declare-fun e!126247 () Bool)

(assert (=> b!191878 (= e!126247 e!126246)))

(declare-fun c!34575 () Bool)

(declare-fun lt!95236 () SeekEntryResult!681)

(assert (=> b!191878 (= c!34575 ((_ is MissingVacant!681) lt!95236))))

(declare-fun d!56157 () Bool)

(assert (=> d!56157 e!126247))

(declare-fun c!34576 () Bool)

(assert (=> d!56157 (= c!34576 ((_ is MissingZero!681) lt!95236))))

(assert (=> d!56157 (= lt!95236 (seekEntryOrOpen!0 key!828 (_keys!5886 thiss!1248) (mask!9129 thiss!1248)))))

(assert (=> d!56157 true))

(declare-fun _$34!1081 () Unit!5743)

(assert (=> d!56157 (= (choose!1044 (_keys!5886 thiss!1248) (_values!3892 thiss!1248) (mask!9129 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) key!828 (defaultEntry!3909 thiss!1248)) _$34!1081)))

(declare-fun b!191879 () Bool)

(declare-fun res!90646 () Bool)

(assert (=> b!191879 (= res!90646 (= (select (arr!3826 (_keys!5886 thiss!1248)) (index!4894 lt!95236)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!126248 () Bool)

(assert (=> b!191879 (=> (not res!90646) (not e!126248))))

(declare-fun bm!19362 () Bool)

(assert (=> bm!19362 (= call!19365 (inRange!0 (ite c!34576 (index!4894 lt!95236) (index!4897 lt!95236)) (mask!9129 thiss!1248)))))

(declare-fun b!191880 () Bool)

(declare-fun call!19366 () Bool)

(assert (=> b!191880 (= e!126249 (not call!19366))))

(declare-fun bm!19363 () Bool)

(assert (=> bm!19363 (= call!19366 (arrayContainsKey!0 (_keys!5886 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!191881 () Bool)

(assert (=> b!191881 (= e!126247 e!126248)))

(declare-fun res!90648 () Bool)

(assert (=> b!191881 (= res!90648 call!19365)))

(assert (=> b!191881 (=> (not res!90648) (not e!126248))))

(declare-fun b!191882 () Bool)

(declare-fun res!90647 () Bool)

(assert (=> b!191882 (=> (not res!90647) (not e!126249))))

(assert (=> b!191882 (= res!90647 (= (select (arr!3826 (_keys!5886 thiss!1248)) (index!4897 lt!95236)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!191883 () Bool)

(assert (=> b!191883 (= e!126246 ((_ is Undefined!681) lt!95236))))

(declare-fun b!191884 () Bool)

(assert (=> b!191884 (= e!126248 (not call!19366))))

(assert (= (and d!56157 c!34576) b!191881))

(assert (= (and d!56157 (not c!34576)) b!191878))

(assert (= (and b!191881 res!90648) b!191879))

(assert (= (and b!191879 res!90646) b!191884))

(assert (= (and b!191878 c!34575) b!191877))

(assert (= (and b!191878 (not c!34575)) b!191883))

(assert (= (and b!191877 res!90645) b!191882))

(assert (= (and b!191882 res!90647) b!191880))

(assert (= (or b!191881 b!191877) bm!19362))

(assert (= (or b!191884 b!191880) bm!19363))

(declare-fun m!218137 () Bool)

(assert (=> b!191882 m!218137))

(assert (=> d!56157 m!217497))

(declare-fun m!218139 () Bool)

(assert (=> b!191879 m!218139))

(assert (=> bm!19363 m!217571))

(declare-fun m!218141 () Bool)

(assert (=> bm!19362 m!218141))

(assert (=> d!56007 d!56157))

(assert (=> d!56007 d!56011))

(declare-fun b!191903 () Bool)

(declare-fun lt!95242 () SeekEntryResult!681)

(assert (=> b!191903 (and (bvsge (index!4896 lt!95242) #b00000000000000000000000000000000) (bvslt (index!4896 lt!95242) (size!4149 (_keys!5886 thiss!1248))))))

(declare-fun res!90655 () Bool)

(assert (=> b!191903 (= res!90655 (= (select (arr!3826 (_keys!5886 thiss!1248)) (index!4896 lt!95242)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!126264 () Bool)

(assert (=> b!191903 (=> res!90655 e!126264)))

(declare-fun b!191904 () Bool)

(declare-fun e!126260 () SeekEntryResult!681)

(declare-fun e!126262 () SeekEntryResult!681)

(assert (=> b!191904 (= e!126260 e!126262)))

(declare-fun c!34583 () Bool)

(declare-fun lt!95241 () (_ BitVec 64))

(assert (=> b!191904 (= c!34583 (or (= lt!95241 key!828) (= (bvadd lt!95241 lt!95241) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!191905 () Bool)

(declare-fun e!126263 () Bool)

(assert (=> b!191905 (= e!126263 (bvsge (x!20552 lt!95242) #b01111111111111111111111111111110))))

(declare-fun b!191906 () Bool)

(assert (=> b!191906 (and (bvsge (index!4896 lt!95242) #b00000000000000000000000000000000) (bvslt (index!4896 lt!95242) (size!4149 (_keys!5886 thiss!1248))))))

(assert (=> b!191906 (= e!126264 (= (select (arr!3826 (_keys!5886 thiss!1248)) (index!4896 lt!95242)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!191907 () Bool)

(declare-fun e!126261 () Bool)

(assert (=> b!191907 (= e!126263 e!126261)))

(declare-fun res!90656 () Bool)

(assert (=> b!191907 (= res!90656 (and ((_ is Intermediate!681) lt!95242) (not (undefined!1493 lt!95242)) (bvslt (x!20552 lt!95242) #b01111111111111111111111111111110) (bvsge (x!20552 lt!95242) #b00000000000000000000000000000000) (bvsge (x!20552 lt!95242) #b00000000000000000000000000000000)))))

(assert (=> b!191907 (=> (not res!90656) (not e!126261))))

(declare-fun b!191908 () Bool)

(assert (=> b!191908 (= e!126260 (Intermediate!681 true (toIndex!0 key!828 (mask!9129 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!191909 () Bool)

(assert (=> b!191909 (= e!126262 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!9129 thiss!1248)) #b00000000000000000000000000000000 (mask!9129 thiss!1248)) key!828 (_keys!5886 thiss!1248) (mask!9129 thiss!1248)))))

(declare-fun b!191910 () Bool)

(assert (=> b!191910 (= e!126262 (Intermediate!681 false (toIndex!0 key!828 (mask!9129 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!191911 () Bool)

(assert (=> b!191911 (and (bvsge (index!4896 lt!95242) #b00000000000000000000000000000000) (bvslt (index!4896 lt!95242) (size!4149 (_keys!5886 thiss!1248))))))

(declare-fun res!90657 () Bool)

(assert (=> b!191911 (= res!90657 (= (select (arr!3826 (_keys!5886 thiss!1248)) (index!4896 lt!95242)) key!828))))

(assert (=> b!191911 (=> res!90657 e!126264)))

(assert (=> b!191911 (= e!126261 e!126264)))

(declare-fun d!56159 () Bool)

(assert (=> d!56159 e!126263))

(declare-fun c!34585 () Bool)

(assert (=> d!56159 (= c!34585 (and ((_ is Intermediate!681) lt!95242) (undefined!1493 lt!95242)))))

(assert (=> d!56159 (= lt!95242 e!126260)))

(declare-fun c!34584 () Bool)

(assert (=> d!56159 (= c!34584 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!56159 (= lt!95241 (select (arr!3826 (_keys!5886 thiss!1248)) (toIndex!0 key!828 (mask!9129 thiss!1248))))))

(assert (=> d!56159 (validMask!0 (mask!9129 thiss!1248))))

(assert (=> d!56159 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9129 thiss!1248)) key!828 (_keys!5886 thiss!1248) (mask!9129 thiss!1248)) lt!95242)))

(assert (= (and d!56159 c!34584) b!191908))

(assert (= (and d!56159 (not c!34584)) b!191904))

(assert (= (and b!191904 c!34583) b!191910))

(assert (= (and b!191904 (not c!34583)) b!191909))

(assert (= (and d!56159 c!34585) b!191905))

(assert (= (and d!56159 (not c!34585)) b!191907))

(assert (= (and b!191907 res!90656) b!191911))

(assert (= (and b!191911 (not res!90657)) b!191903))

(assert (= (and b!191903 (not res!90655)) b!191906))

(declare-fun m!218143 () Bool)

(assert (=> b!191906 m!218143))

(assert (=> b!191903 m!218143))

(assert (=> d!56159 m!217715))

(declare-fun m!218145 () Bool)

(assert (=> d!56159 m!218145))

(assert (=> d!56159 m!217479))

(assert (=> b!191909 m!217715))

(declare-fun m!218147 () Bool)

(assert (=> b!191909 m!218147))

(assert (=> b!191909 m!218147))

(declare-fun m!218149 () Bool)

(assert (=> b!191909 m!218149))

(assert (=> b!191911 m!218143))

(assert (=> d!56021 d!56159))

(declare-fun d!56161 () Bool)

(declare-fun lt!95248 () (_ BitVec 32))

(declare-fun lt!95247 () (_ BitVec 32))

(assert (=> d!56161 (= lt!95248 (bvmul (bvxor lt!95247 (bvlshr lt!95247 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!56161 (= lt!95247 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!56161 (and (bvsge (mask!9129 thiss!1248) #b00000000000000000000000000000000) (let ((res!90658 (let ((h!3044 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!20572 (bvmul (bvxor h!3044 (bvlshr h!3044 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!20572 (bvlshr x!20572 #b00000000000000000000000000001101)) (mask!9129 thiss!1248)))))) (and (bvslt res!90658 (bvadd (mask!9129 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!90658 #b00000000000000000000000000000000))))))

(assert (=> d!56161 (= (toIndex!0 key!828 (mask!9129 thiss!1248)) (bvand (bvxor lt!95248 (bvlshr lt!95248 #b00000000000000000000000000001101)) (mask!9129 thiss!1248)))))

(assert (=> d!56021 d!56161))

(assert (=> d!56021 d!56011))

(declare-fun d!56163 () Bool)

(declare-fun res!90663 () Bool)

(declare-fun e!126269 () Bool)

(assert (=> d!56163 (=> res!90663 e!126269)))

(assert (=> d!56163 (= res!90663 (and ((_ is Cons!2401) (toList!1212 lt!94909)) (= (_1!1753 (h!3040 (toList!1212 lt!94909))) key!828)))))

(assert (=> d!56163 (= (containsKey!241 (toList!1212 lt!94909) key!828) e!126269)))

(declare-fun b!191916 () Bool)

(declare-fun e!126270 () Bool)

(assert (=> b!191916 (= e!126269 e!126270)))

(declare-fun res!90664 () Bool)

(assert (=> b!191916 (=> (not res!90664) (not e!126270))))

(assert (=> b!191916 (= res!90664 (and (or (not ((_ is Cons!2401) (toList!1212 lt!94909))) (bvsle (_1!1753 (h!3040 (toList!1212 lt!94909))) key!828)) ((_ is Cons!2401) (toList!1212 lt!94909)) (bvslt (_1!1753 (h!3040 (toList!1212 lt!94909))) key!828)))))

(declare-fun b!191917 () Bool)

(assert (=> b!191917 (= e!126270 (containsKey!241 (t!7310 (toList!1212 lt!94909)) key!828))))

(assert (= (and d!56163 (not res!90663)) b!191916))

(assert (= (and b!191916 res!90664) b!191917))

(declare-fun m!218151 () Bool)

(assert (=> b!191917 m!218151))

(assert (=> d!56013 d!56163))

(assert (=> bm!19330 d!56085))

(assert (=> b!191520 d!56051))

(assert (=> b!191552 d!56051))

(declare-fun d!56165 () Bool)

(assert (=> d!56165 (= (inRange!0 (index!4895 lt!95084) (mask!9129 thiss!1248)) (and (bvsge (index!4895 lt!95084) #b00000000000000000000000000000000) (bvslt (index!4895 lt!95084) (bvadd (mask!9129 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!191585 d!56165))

(declare-fun d!56167 () Bool)

(declare-fun e!126271 () Bool)

(assert (=> d!56167 e!126271))

(declare-fun res!90666 () Bool)

(assert (=> d!56167 (=> (not res!90666) (not e!126271))))

(declare-fun lt!95251 () ListLongMap!2393)

(assert (=> d!56167 (= res!90666 (contains!1332 lt!95251 (_1!1753 (tuple2!3485 key!828 v!309))))))

(declare-fun lt!95250 () List!2405)

(assert (=> d!56167 (= lt!95251 (ListLongMap!2394 lt!95250))))

(declare-fun lt!95249 () Unit!5743)

(declare-fun lt!95252 () Unit!5743)

(assert (=> d!56167 (= lt!95249 lt!95252)))

(assert (=> d!56167 (= (getValueByKey!237 lt!95250 (_1!1753 (tuple2!3485 key!828 v!309))) (Some!242 (_2!1753 (tuple2!3485 key!828 v!309))))))

(assert (=> d!56167 (= lt!95252 (lemmaContainsTupThenGetReturnValue!127 lt!95250 (_1!1753 (tuple2!3485 key!828 v!309)) (_2!1753 (tuple2!3485 key!828 v!309))))))

(assert (=> d!56167 (= lt!95250 (insertStrictlySorted!130 (toList!1212 (getCurrentListMap!845 (_keys!5886 thiss!1248) (_values!3892 thiss!1248) (mask!9129 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248))) (_1!1753 (tuple2!3485 key!828 v!309)) (_2!1753 (tuple2!3485 key!828 v!309))))))

(assert (=> d!56167 (= (+!304 (getCurrentListMap!845 (_keys!5886 thiss!1248) (_values!3892 thiss!1248) (mask!9129 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248)) (tuple2!3485 key!828 v!309)) lt!95251)))

(declare-fun b!191918 () Bool)

(declare-fun res!90665 () Bool)

(assert (=> b!191918 (=> (not res!90665) (not e!126271))))

(assert (=> b!191918 (= res!90665 (= (getValueByKey!237 (toList!1212 lt!95251) (_1!1753 (tuple2!3485 key!828 v!309))) (Some!242 (_2!1753 (tuple2!3485 key!828 v!309)))))))

(declare-fun b!191919 () Bool)

(assert (=> b!191919 (= e!126271 (contains!1335 (toList!1212 lt!95251) (tuple2!3485 key!828 v!309)))))

(assert (= (and d!56167 res!90666) b!191918))

(assert (= (and b!191918 res!90665) b!191919))

(declare-fun m!218153 () Bool)

(assert (=> d!56167 m!218153))

(declare-fun m!218155 () Bool)

(assert (=> d!56167 m!218155))

(declare-fun m!218157 () Bool)

(assert (=> d!56167 m!218157))

(declare-fun m!218159 () Bool)

(assert (=> d!56167 m!218159))

(declare-fun m!218161 () Bool)

(assert (=> b!191918 m!218161))

(declare-fun m!218163 () Bool)

(assert (=> b!191919 m!218163))

(assert (=> b!191556 d!56167))

(assert (=> b!191556 d!56015))

(assert (=> b!191556 d!56009))

(declare-fun d!56169 () Bool)

(assert (=> d!56169 (= (inRange!0 (ite c!34463 (index!4894 lt!94954) (index!4897 lt!94954)) (mask!9129 thiss!1248)) (and (bvsge (ite c!34463 (index!4894 lt!94954) (index!4897 lt!94954)) #b00000000000000000000000000000000) (bvslt (ite c!34463 (index!4894 lt!94954) (index!4897 lt!94954)) (bvadd (mask!9129 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> bm!19307 d!56169))

(declare-fun d!56171 () Bool)

(assert (=> d!56171 (= (apply!182 lt!95012 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2208 (getValueByKey!237 (toList!1212 lt!95012) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7657 () Bool)

(assert (= bs!7657 d!56171))

(declare-fun m!218165 () Bool)

(assert (=> bs!7657 m!218165))

(assert (=> bs!7657 m!218165))

(declare-fun m!218167 () Bool)

(assert (=> bs!7657 m!218167))

(assert (=> b!191504 d!56171))

(declare-fun d!56173 () Bool)

(assert (=> d!56173 (= (apply!182 lt!95046 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2208 (getValueByKey!237 (toList!1212 lt!95046) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7658 () Bool)

(assert (= bs!7658 d!56173))

(declare-fun m!218169 () Bool)

(assert (=> bs!7658 m!218169))

(assert (=> bs!7658 m!218169))

(declare-fun m!218171 () Bool)

(assert (=> bs!7658 m!218171))

(assert (=> b!191536 d!56173))

(declare-fun d!56175 () Bool)

(declare-fun e!126273 () Bool)

(assert (=> d!56175 e!126273))

(declare-fun res!90667 () Bool)

(assert (=> d!56175 (=> res!90667 e!126273)))

(declare-fun lt!95254 () Bool)

(assert (=> d!56175 (= res!90667 (not lt!95254))))

(declare-fun lt!95256 () Bool)

(assert (=> d!56175 (= lt!95254 lt!95256)))

(declare-fun lt!95253 () Unit!5743)

(declare-fun e!126272 () Unit!5743)

(assert (=> d!56175 (= lt!95253 e!126272)))

(declare-fun c!34586 () Bool)

(assert (=> d!56175 (= c!34586 lt!95256)))

(assert (=> d!56175 (= lt!95256 (containsKey!241 (toList!1212 lt!95012) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56175 (= (contains!1332 lt!95012 #b0000000000000000000000000000000000000000000000000000000000000000) lt!95254)))

(declare-fun b!191920 () Bool)

(declare-fun lt!95255 () Unit!5743)

(assert (=> b!191920 (= e!126272 lt!95255)))

(assert (=> b!191920 (= lt!95255 (lemmaContainsKeyImpliesGetValueByKeyDefined!190 (toList!1212 lt!95012) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!191920 (isDefined!191 (getValueByKey!237 (toList!1212 lt!95012) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!191921 () Bool)

(declare-fun Unit!5761 () Unit!5743)

(assert (=> b!191921 (= e!126272 Unit!5761)))

(declare-fun b!191922 () Bool)

(assert (=> b!191922 (= e!126273 (isDefined!191 (getValueByKey!237 (toList!1212 lt!95012) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56175 c!34586) b!191920))

(assert (= (and d!56175 (not c!34586)) b!191921))

(assert (= (and d!56175 (not res!90667)) b!191922))

(declare-fun m!218173 () Bool)

(assert (=> d!56175 m!218173))

(declare-fun m!218175 () Bool)

(assert (=> b!191920 m!218175))

(assert (=> b!191920 m!218165))

(assert (=> b!191920 m!218165))

(declare-fun m!218177 () Bool)

(assert (=> b!191920 m!218177))

(assert (=> b!191922 m!218165))

(assert (=> b!191922 m!218165))

(assert (=> b!191922 m!218177))

(assert (=> bm!19328 d!56175))

(declare-fun d!56177 () Bool)

(declare-fun e!126275 () Bool)

(assert (=> d!56177 e!126275))

(declare-fun res!90668 () Bool)

(assert (=> d!56177 (=> res!90668 e!126275)))

(declare-fun lt!95258 () Bool)

(assert (=> d!56177 (= res!90668 (not lt!95258))))

(declare-fun lt!95260 () Bool)

(assert (=> d!56177 (= lt!95258 lt!95260)))

(declare-fun lt!95257 () Unit!5743)

(declare-fun e!126274 () Unit!5743)

(assert (=> d!56177 (= lt!95257 e!126274)))

(declare-fun c!34587 () Bool)

(assert (=> d!56177 (= c!34587 lt!95260)))

(assert (=> d!56177 (= lt!95260 (containsKey!241 (toList!1212 lt!95046) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56177 (= (contains!1332 lt!95046 #b0000000000000000000000000000000000000000000000000000000000000000) lt!95258)))

(declare-fun b!191923 () Bool)

(declare-fun lt!95259 () Unit!5743)

(assert (=> b!191923 (= e!126274 lt!95259)))

(assert (=> b!191923 (= lt!95259 (lemmaContainsKeyImpliesGetValueByKeyDefined!190 (toList!1212 lt!95046) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!191923 (isDefined!191 (getValueByKey!237 (toList!1212 lt!95046) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!191924 () Bool)

(declare-fun Unit!5762 () Unit!5743)

(assert (=> b!191924 (= e!126274 Unit!5762)))

(declare-fun b!191925 () Bool)

(assert (=> b!191925 (= e!126275 (isDefined!191 (getValueByKey!237 (toList!1212 lt!95046) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56177 c!34587) b!191923))

(assert (= (and d!56177 (not c!34587)) b!191924))

(assert (= (and d!56177 (not res!90668)) b!191925))

(declare-fun m!218179 () Bool)

(assert (=> d!56177 m!218179))

(declare-fun m!218181 () Bool)

(assert (=> b!191923 m!218181))

(assert (=> b!191923 m!218169))

(assert (=> b!191923 m!218169))

(declare-fun m!218183 () Bool)

(assert (=> b!191923 m!218183))

(assert (=> b!191925 m!218169))

(assert (=> b!191925 m!218169))

(assert (=> b!191925 m!218183))

(assert (=> bm!19335 d!56177))

(assert (=> bm!19323 d!56133))

(assert (=> d!56015 d!56011))

(declare-fun d!56179 () Bool)

(assert (=> d!56179 (= (apply!182 lt!95012 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2208 (getValueByKey!237 (toList!1212 lt!95012) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7659 () Bool)

(assert (= bs!7659 d!56179))

(assert (=> bs!7659 m!217795))

(assert (=> bs!7659 m!217795))

(declare-fun m!218185 () Bool)

(assert (=> bs!7659 m!218185))

(assert (=> b!191521 d!56179))

(declare-fun d!56181 () Bool)

(assert (=> d!56181 (= (apply!182 lt!95046 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2208 (getValueByKey!237 (toList!1212 lt!95046) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7660 () Bool)

(assert (= bs!7660 d!56181))

(assert (=> bs!7660 m!217803))

(assert (=> bs!7660 m!217803))

(declare-fun m!218187 () Bool)

(assert (=> bs!7660 m!218187))

(assert (=> b!191553 d!56181))

(declare-fun b!191926 () Bool)

(declare-fun e!126277 () Bool)

(assert (=> b!191926 (= e!126277 tp_is_empty!4453)))

(declare-fun mapNonEmpty!7702 () Bool)

(declare-fun mapRes!7702 () Bool)

(declare-fun tp!16909 () Bool)

(assert (=> mapNonEmpty!7702 (= mapRes!7702 (and tp!16909 e!126277))))

(declare-fun mapValue!7702 () ValueCell!1883)

(declare-fun mapRest!7702 () (Array (_ BitVec 32) ValueCell!1883))

(declare-fun mapKey!7702 () (_ BitVec 32))

(assert (=> mapNonEmpty!7702 (= mapRest!7701 (store mapRest!7702 mapKey!7702 mapValue!7702))))

(declare-fun b!191927 () Bool)

(declare-fun e!126276 () Bool)

(assert (=> b!191927 (= e!126276 tp_is_empty!4453)))

(declare-fun condMapEmpty!7702 () Bool)

(declare-fun mapDefault!7702 () ValueCell!1883)

(assert (=> mapNonEmpty!7701 (= condMapEmpty!7702 (= mapRest!7701 ((as const (Array (_ BitVec 32) ValueCell!1883)) mapDefault!7702)))))

(assert (=> mapNonEmpty!7701 (= tp!16908 (and e!126276 mapRes!7702))))

(declare-fun mapIsEmpty!7702 () Bool)

(assert (=> mapIsEmpty!7702 mapRes!7702))

(assert (= (and mapNonEmpty!7701 condMapEmpty!7702) mapIsEmpty!7702))

(assert (= (and mapNonEmpty!7701 (not condMapEmpty!7702)) mapNonEmpty!7702))

(assert (= (and mapNonEmpty!7702 ((_ is ValueCellFull!1883) mapValue!7702)) b!191926))

(assert (= (and mapNonEmpty!7701 ((_ is ValueCellFull!1883) mapDefault!7702)) b!191927))

(declare-fun m!218189 () Bool)

(assert (=> mapNonEmpty!7702 m!218189))

(declare-fun b_lambda!7397 () Bool)

(assert (= b_lambda!7389 (or (and b!191360 b_free!4681) b_lambda!7397)))

(declare-fun b_lambda!7399 () Bool)

(assert (= b_lambda!7391 (or (and b!191360 b_free!4681) b_lambda!7399)))

(declare-fun b_lambda!7401 () Bool)

(assert (= b_lambda!7395 (or (and b!191360 b_free!4681) b_lambda!7401)))

(declare-fun b_lambda!7403 () Bool)

(assert (= b_lambda!7393 (or (and b!191360 b_free!4681) b_lambda!7403)))

(check-sat (not b!191732) (not d!56145) (not d!56155) (not b!191688) (not b!191919) (not b!191643) (not d!56091) (not b!191665) (not d!56151) (not b!191651) (not b!191707) (not b!191702) (not d!56149) (not b!191837) (not d!56081) (not d!56083) (not b!191787) (not d!56143) (not d!56123) (not b!191830) (not d!56131) (not d!56141) (not d!56107) (not b!191786) (not b!191850) (not d!56089) (not b!191680) (not b!191793) (not d!56177) (not d!56159) (not d!56117) (not d!56181) (not d!56113) (not d!56079) (not b!191770) (not b!191764) (not d!56047) (not d!56097) (not d!56043) (not bm!19363) (not d!56125) (not d!56059) (not bm!19344) (not b!191664) (not bm!19354) (not b!191840) (not d!56129) (not mapNonEmpty!7702) (not b!191722) (not b!191685) (not bm!19347) (not b!191667) (not b!191835) (not b!191661) (not b!191859) (not d!56103) (not bm!19341) (not b!191839) (not b!191825) (not d!56157) (not b!191773) (not d!56121) (not d!56049) (not b_lambda!7397) (not d!56065) (not b!191849) (not b!191920) (not bm!19338) (not b!191853) (not d!56111) (not b!191631) (not b!191705) (not d!56093) (not b!191694) (not d!56137) (not b!191774) (not b!191762) (not b!191763) (not d!56071) (not d!56073) (not d!56135) (not d!56133) (not b!191855) (not b!191922) (not d!56167) (not b!191704) (not d!56119) (not b!191909) (not d!56085) b_and!11345 (not b!191852) (not b!191857) (not b!191917) (not b_lambda!7385) (not b!191799) (not d!56075) (not b!191925) (not b!191784) tp_is_empty!4453 (not b!191693) (not b!191860) (not b!191769) (not b!191683) (not d!56057) (not d!56069) (not b!191644) (not d!56147) (not b!191620) (not b!191851) (not d!56171) (not d!56109) (not b!191609) (not b!191780) (not b!191776) (not d!56095) (not b!191682) (not b_lambda!7399) (not d!56099) (not b!191788) (not d!56173) (not b!191848) (not b_lambda!7387) (not b!191679) (not d!56039) (not b!191779) (not b!191918) (not d!56179) (not d!56087) (not d!56101) (not b!191826) (not d!56055) (not d!56127) (not bm!19362) (not b_lambda!7403) (not b!191858) (not b!191697) (not b!191856) (not b!191778) (not d!56175) (not d!56041) (not d!56153) (not d!56139) (not b!191700) (not b!191923) (not b!191838) (not d!56105) (not b!191800) (not b!191845) (not b!191662) (not b!191833) (not b!191727) (not b!191666) (not b!191844) (not b!191768) (not b!191772) (not b!191686) (not b!191846) (not b!191726) (not bm!19357) (not d!56063) (not b!191775) (not b!191790) (not b_next!4681) (not b!191836) (not b_lambda!7401) (not b!191783))
(check-sat b_and!11345 (not b_next!4681))
