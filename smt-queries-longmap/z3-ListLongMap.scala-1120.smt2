; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22970 () Bool)

(assert start!22970)

(declare-fun b!240402 () Bool)

(declare-fun b_free!6469 () Bool)

(declare-fun b_next!6469 () Bool)

(assert (=> b!240402 (= b_free!6469 (not b_next!6469))))

(declare-fun tp!22611 () Bool)

(declare-fun b_and!13409 () Bool)

(assert (=> b!240402 (= tp!22611 b_and!13409)))

(declare-fun b!240387 () Bool)

(declare-fun res!117847 () Bool)

(declare-datatypes ((V!8089 0))(
  ( (V!8090 (val!3210 Int)) )
))
(declare-datatypes ((ValueCell!2822 0))(
  ( (ValueCellFull!2822 (v!5242 V!8089)) (EmptyCell!2822) )
))
(declare-datatypes ((array!11933 0))(
  ( (array!11934 (arr!5667 (Array (_ BitVec 32) ValueCell!2822)) (size!6009 (_ BitVec 32))) )
))
(declare-datatypes ((array!11935 0))(
  ( (array!11936 (arr!5668 (Array (_ BitVec 32) (_ BitVec 64))) (size!6010 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3544 0))(
  ( (LongMapFixedSize!3545 (defaultEntry!4457 Int) (mask!10514 (_ BitVec 32)) (extraKeys!4194 (_ BitVec 32)) (zeroValue!4298 V!8089) (minValue!4298 V!8089) (_size!1821 (_ BitVec 32)) (_keys!6558 array!11935) (_values!4440 array!11933) (_vacant!1821 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3544)

(declare-datatypes ((SeekEntryResult!1046 0))(
  ( (MissingZero!1046 (index!6354 (_ BitVec 32))) (Found!1046 (index!6355 (_ BitVec 32))) (Intermediate!1046 (undefined!1858 Bool) (index!6356 (_ BitVec 32)) (x!24165 (_ BitVec 32))) (Undefined!1046) (MissingVacant!1046 (index!6357 (_ BitVec 32))) )
))
(declare-fun lt!120813 () SeekEntryResult!1046)

(assert (=> b!240387 (= res!117847 (= (select (arr!5668 (_keys!6558 thiss!1504)) (index!6357 lt!120813)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!156021 () Bool)

(assert (=> b!240387 (=> (not res!117847) (not e!156021))))

(declare-fun b!240388 () Bool)

(declare-fun res!117856 () Bool)

(declare-fun e!156017 () Bool)

(assert (=> b!240388 (=> (not res!117856) (not e!156017))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!240388 (= res!117856 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!240389 () Bool)

(declare-fun res!117858 () Bool)

(declare-fun e!156010 () Bool)

(assert (=> b!240389 (=> (not res!117858) (not e!156010))))

(assert (=> b!240389 (= res!117858 (= (select (arr!5668 (_keys!6558 thiss!1504)) (index!6354 lt!120813)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!10728 () Bool)

(declare-fun mapRes!10728 () Bool)

(declare-fun tp!22610 () Bool)

(declare-fun e!156016 () Bool)

(assert (=> mapNonEmpty!10728 (= mapRes!10728 (and tp!22610 e!156016))))

(declare-fun mapValue!10728 () ValueCell!2822)

(declare-fun mapRest!10728 () (Array (_ BitVec 32) ValueCell!2822))

(declare-fun mapKey!10728 () (_ BitVec 32))

(assert (=> mapNonEmpty!10728 (= (arr!5667 (_values!4440 thiss!1504)) (store mapRest!10728 mapKey!10728 mapValue!10728))))

(declare-fun b!240390 () Bool)

(declare-fun e!156018 () Bool)

(get-info :version)

(assert (=> b!240390 (= e!156018 ((_ is Undefined!1046) lt!120813))))

(declare-fun b!240391 () Bool)

(declare-fun e!156014 () Bool)

(declare-fun e!156011 () Bool)

(assert (=> b!240391 (= e!156014 (and e!156011 mapRes!10728))))

(declare-fun condMapEmpty!10728 () Bool)

(declare-fun mapDefault!10728 () ValueCell!2822)

(assert (=> b!240391 (= condMapEmpty!10728 (= (arr!5667 (_values!4440 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2822)) mapDefault!10728)))))

(declare-fun b!240392 () Bool)

(declare-fun call!22343 () Bool)

(assert (=> b!240392 (= e!156010 (not call!22343))))

(declare-fun b!240393 () Bool)

(assert (=> b!240393 (= e!156018 e!156021)))

(declare-fun res!117851 () Bool)

(declare-fun call!22344 () Bool)

(assert (=> b!240393 (= res!117851 call!22344)))

(assert (=> b!240393 (=> (not res!117851) (not e!156021))))

(declare-fun b!240394 () Bool)

(declare-fun res!117855 () Bool)

(assert (=> b!240394 (=> (not res!117855) (not e!156010))))

(assert (=> b!240394 (= res!117855 call!22344)))

(declare-fun e!156013 () Bool)

(assert (=> b!240394 (= e!156013 e!156010)))

(declare-fun b!240395 () Bool)

(declare-fun res!117857 () Bool)

(declare-fun e!156015 () Bool)

(assert (=> b!240395 (=> (not res!117857) (not e!156015))))

(assert (=> b!240395 (= res!117857 (and (= (size!6009 (_values!4440 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10514 thiss!1504))) (= (size!6010 (_keys!6558 thiss!1504)) (size!6009 (_values!4440 thiss!1504))) (bvsge (mask!10514 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4194 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4194 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!240396 () Bool)

(declare-fun res!117853 () Bool)

(assert (=> b!240396 (=> (not res!117853) (not e!156015))))

(declare-fun arrayContainsKey!0 (array!11935 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!240396 (= res!117853 (arrayContainsKey!0 (_keys!6558 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun res!117852 () Bool)

(assert (=> start!22970 (=> (not res!117852) (not e!156017))))

(declare-fun valid!1398 (LongMapFixedSize!3544) Bool)

(assert (=> start!22970 (= res!117852 (valid!1398 thiss!1504))))

(assert (=> start!22970 e!156017))

(declare-fun e!156020 () Bool)

(assert (=> start!22970 e!156020))

(assert (=> start!22970 true))

(declare-fun b!240397 () Bool)

(declare-fun e!156012 () Bool)

(assert (=> b!240397 (= e!156017 e!156012)))

(declare-fun res!117849 () Bool)

(assert (=> b!240397 (=> (not res!117849) (not e!156012))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!240397 (= res!117849 (or (= lt!120813 (MissingZero!1046 index!297)) (= lt!120813 (MissingVacant!1046 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11935 (_ BitVec 32)) SeekEntryResult!1046)

(assert (=> b!240397 (= lt!120813 (seekEntryOrOpen!0 key!932 (_keys!6558 thiss!1504) (mask!10514 thiss!1504)))))

(declare-fun b!240398 () Bool)

(declare-fun res!117854 () Bool)

(assert (=> b!240398 (=> (not res!117854) (not e!156015))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11935 (_ BitVec 32)) Bool)

(assert (=> b!240398 (= res!117854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6558 thiss!1504) (mask!10514 thiss!1504)))))

(declare-fun b!240399 () Bool)

(declare-fun res!117848 () Bool)

(assert (=> b!240399 (=> (not res!117848) (not e!156015))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!240399 (= res!117848 (validMask!0 (mask!10514 thiss!1504)))))

(declare-fun bm!22340 () Bool)

(assert (=> bm!22340 (= call!22343 (arrayContainsKey!0 (_keys!6558 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!240400 () Bool)

(declare-datatypes ((Unit!7385 0))(
  ( (Unit!7386) )
))
(declare-fun e!156022 () Unit!7385)

(declare-fun lt!120812 () Unit!7385)

(assert (=> b!240400 (= e!156022 lt!120812)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!346 (array!11935 array!11933 (_ BitVec 32) (_ BitVec 32) V!8089 V!8089 (_ BitVec 64) Int) Unit!7385)

(assert (=> b!240400 (= lt!120812 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!346 (_keys!6558 thiss!1504) (_values!4440 thiss!1504) (mask!10514 thiss!1504) (extraKeys!4194 thiss!1504) (zeroValue!4298 thiss!1504) (minValue!4298 thiss!1504) key!932 (defaultEntry!4457 thiss!1504)))))

(declare-fun c!40037 () Bool)

(assert (=> b!240400 (= c!40037 ((_ is MissingZero!1046) lt!120813))))

(assert (=> b!240400 e!156013))

(declare-fun b!240401 () Bool)

(assert (=> b!240401 (= e!156021 (not call!22343))))

(declare-fun tp_is_empty!6331 () Bool)

(declare-fun array_inv!3737 (array!11935) Bool)

(declare-fun array_inv!3738 (array!11933) Bool)

(assert (=> b!240402 (= e!156020 (and tp!22611 tp_is_empty!6331 (array_inv!3737 (_keys!6558 thiss!1504)) (array_inv!3738 (_values!4440 thiss!1504)) e!156014))))

(declare-fun b!240403 () Bool)

(assert (=> b!240403 (= e!156016 tp_is_empty!6331)))

(declare-fun mapIsEmpty!10728 () Bool)

(assert (=> mapIsEmpty!10728 mapRes!10728))

(declare-fun b!240404 () Bool)

(declare-fun Unit!7387 () Unit!7385)

(assert (=> b!240404 (= e!156022 Unit!7387)))

(declare-fun lt!120811 () Unit!7385)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!345 (array!11935 array!11933 (_ BitVec 32) (_ BitVec 32) V!8089 V!8089 (_ BitVec 64) Int) Unit!7385)

(assert (=> b!240404 (= lt!120811 (lemmaInListMapThenSeekEntryOrOpenFindsIt!345 (_keys!6558 thiss!1504) (_values!4440 thiss!1504) (mask!10514 thiss!1504) (extraKeys!4194 thiss!1504) (zeroValue!4298 thiss!1504) (minValue!4298 thiss!1504) key!932 (defaultEntry!4457 thiss!1504)))))

(assert (=> b!240404 false))

(declare-fun b!240405 () Bool)

(assert (=> b!240405 (= e!156015 false)))

(declare-fun lt!120814 () Bool)

(declare-datatypes ((List!3601 0))(
  ( (Nil!3598) (Cons!3597 (h!4253 (_ BitVec 64)) (t!8587 List!3601)) )
))
(declare-fun arrayNoDuplicates!0 (array!11935 (_ BitVec 32) List!3601) Bool)

(assert (=> b!240405 (= lt!120814 (arrayNoDuplicates!0 (_keys!6558 thiss!1504) #b00000000000000000000000000000000 Nil!3598))))

(declare-fun bm!22341 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22341 (= call!22344 (inRange!0 (ite c!40037 (index!6354 lt!120813) (index!6357 lt!120813)) (mask!10514 thiss!1504)))))

(declare-fun b!240406 () Bool)

(assert (=> b!240406 (= e!156012 e!156015)))

(declare-fun res!117850 () Bool)

(assert (=> b!240406 (=> (not res!117850) (not e!156015))))

(assert (=> b!240406 (= res!117850 (inRange!0 index!297 (mask!10514 thiss!1504)))))

(declare-fun lt!120815 () Unit!7385)

(assert (=> b!240406 (= lt!120815 e!156022)))

(declare-fun c!40036 () Bool)

(declare-datatypes ((tuple2!4700 0))(
  ( (tuple2!4701 (_1!2361 (_ BitVec 64)) (_2!2361 V!8089)) )
))
(declare-datatypes ((List!3602 0))(
  ( (Nil!3599) (Cons!3598 (h!4254 tuple2!4700) (t!8588 List!3602)) )
))
(declare-datatypes ((ListLongMap!3603 0))(
  ( (ListLongMap!3604 (toList!1817 List!3602)) )
))
(declare-fun contains!1708 (ListLongMap!3603 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1326 (array!11935 array!11933 (_ BitVec 32) (_ BitVec 32) V!8089 V!8089 (_ BitVec 32) Int) ListLongMap!3603)

(assert (=> b!240406 (= c!40036 (contains!1708 (getCurrentListMap!1326 (_keys!6558 thiss!1504) (_values!4440 thiss!1504) (mask!10514 thiss!1504) (extraKeys!4194 thiss!1504) (zeroValue!4298 thiss!1504) (minValue!4298 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4457 thiss!1504)) key!932))))

(declare-fun b!240407 () Bool)

(declare-fun c!40038 () Bool)

(assert (=> b!240407 (= c!40038 ((_ is MissingVacant!1046) lt!120813))))

(assert (=> b!240407 (= e!156013 e!156018)))

(declare-fun b!240408 () Bool)

(assert (=> b!240408 (= e!156011 tp_is_empty!6331)))

(assert (= (and start!22970 res!117852) b!240388))

(assert (= (and b!240388 res!117856) b!240397))

(assert (= (and b!240397 res!117849) b!240406))

(assert (= (and b!240406 c!40036) b!240404))

(assert (= (and b!240406 (not c!40036)) b!240400))

(assert (= (and b!240400 c!40037) b!240394))

(assert (= (and b!240400 (not c!40037)) b!240407))

(assert (= (and b!240394 res!117855) b!240389))

(assert (= (and b!240389 res!117858) b!240392))

(assert (= (and b!240407 c!40038) b!240393))

(assert (= (and b!240407 (not c!40038)) b!240390))

(assert (= (and b!240393 res!117851) b!240387))

(assert (= (and b!240387 res!117847) b!240401))

(assert (= (or b!240394 b!240393) bm!22341))

(assert (= (or b!240392 b!240401) bm!22340))

(assert (= (and b!240406 res!117850) b!240396))

(assert (= (and b!240396 res!117853) b!240399))

(assert (= (and b!240399 res!117848) b!240395))

(assert (= (and b!240395 res!117857) b!240398))

(assert (= (and b!240398 res!117854) b!240405))

(assert (= (and b!240391 condMapEmpty!10728) mapIsEmpty!10728))

(assert (= (and b!240391 (not condMapEmpty!10728)) mapNonEmpty!10728))

(assert (= (and mapNonEmpty!10728 ((_ is ValueCellFull!2822) mapValue!10728)) b!240403))

(assert (= (and b!240391 ((_ is ValueCellFull!2822) mapDefault!10728)) b!240408))

(assert (= b!240402 b!240391))

(assert (= start!22970 b!240402))

(declare-fun m!259447 () Bool)

(assert (=> bm!22340 m!259447))

(declare-fun m!259449 () Bool)

(assert (=> b!240402 m!259449))

(declare-fun m!259451 () Bool)

(assert (=> b!240402 m!259451))

(declare-fun m!259453 () Bool)

(assert (=> b!240399 m!259453))

(declare-fun m!259455 () Bool)

(assert (=> b!240400 m!259455))

(declare-fun m!259457 () Bool)

(assert (=> bm!22341 m!259457))

(declare-fun m!259459 () Bool)

(assert (=> b!240389 m!259459))

(declare-fun m!259461 () Bool)

(assert (=> b!240406 m!259461))

(declare-fun m!259463 () Bool)

(assert (=> b!240406 m!259463))

(assert (=> b!240406 m!259463))

(declare-fun m!259465 () Bool)

(assert (=> b!240406 m!259465))

(assert (=> b!240396 m!259447))

(declare-fun m!259467 () Bool)

(assert (=> b!240405 m!259467))

(declare-fun m!259469 () Bool)

(assert (=> start!22970 m!259469))

(declare-fun m!259471 () Bool)

(assert (=> b!240404 m!259471))

(declare-fun m!259473 () Bool)

(assert (=> b!240387 m!259473))

(declare-fun m!259475 () Bool)

(assert (=> b!240398 m!259475))

(declare-fun m!259477 () Bool)

(assert (=> b!240397 m!259477))

(declare-fun m!259479 () Bool)

(assert (=> mapNonEmpty!10728 m!259479))

(check-sat (not start!22970) (not b!240398) (not mapNonEmpty!10728) (not b!240406) (not b!240396) (not b_next!6469) (not bm!22340) b_and!13409 (not b!240399) (not b!240402) (not bm!22341) (not b!240400) (not b!240404) (not b!240397) (not b!240405) tp_is_empty!6331)
(check-sat b_and!13409 (not b_next!6469))
