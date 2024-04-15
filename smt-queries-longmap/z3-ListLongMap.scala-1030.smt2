; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21866 () Bool)

(assert start!21866)

(declare-fun b!220527 () Bool)

(declare-fun b_free!5929 () Bool)

(declare-fun b_next!5929 () Bool)

(assert (=> b!220527 (= b_free!5929 (not b_next!5929))))

(declare-fun tp!20928 () Bool)

(declare-fun b_and!12801 () Bool)

(assert (=> b!220527 (= tp!20928 b_and!12801)))

(declare-fun b!220507 () Bool)

(declare-fun res!108113 () Bool)

(declare-fun e!143362 () Bool)

(assert (=> b!220507 (=> (not res!108113) (not e!143362))))

(declare-fun call!20597 () Bool)

(assert (=> b!220507 (= res!108113 call!20597)))

(declare-fun e!143354 () Bool)

(assert (=> b!220507 (= e!143354 e!143362)))

(declare-fun b!220508 () Bool)

(declare-fun res!108119 () Bool)

(assert (=> b!220508 (=> (not res!108119) (not e!143362))))

(declare-datatypes ((V!7369 0))(
  ( (V!7370 (val!2940 Int)) )
))
(declare-datatypes ((ValueCell!2552 0))(
  ( (ValueCellFull!2552 (v!4954 V!7369)) (EmptyCell!2552) )
))
(declare-datatypes ((array!10817 0))(
  ( (array!10818 (arr!5127 (Array (_ BitVec 32) ValueCell!2552)) (size!5461 (_ BitVec 32))) )
))
(declare-datatypes ((array!10819 0))(
  ( (array!10820 (arr!5128 (Array (_ BitVec 32) (_ BitVec 64))) (size!5462 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3004 0))(
  ( (LongMapFixedSize!3005 (defaultEntry!4161 Int) (mask!9964 (_ BitVec 32)) (extraKeys!3898 (_ BitVec 32)) (zeroValue!4002 V!7369) (minValue!4002 V!7369) (_size!1551 (_ BitVec 32)) (_keys!6214 array!10819) (_values!4144 array!10817) (_vacant!1551 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3004)

(declare-datatypes ((SeekEntryResult!809 0))(
  ( (MissingZero!809 (index!5406 (_ BitVec 32))) (Found!809 (index!5407 (_ BitVec 32))) (Intermediate!809 (undefined!1621 Bool) (index!5408 (_ BitVec 32)) (x!22964 (_ BitVec 32))) (Undefined!809) (MissingVacant!809 (index!5409 (_ BitVec 32))) )
))
(declare-fun lt!112047 () SeekEntryResult!809)

(assert (=> b!220508 (= res!108119 (= (select (arr!5128 (_keys!6214 thiss!1504)) (index!5406 lt!112047)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220509 () Bool)

(declare-fun e!143352 () Bool)

(declare-fun tp_is_empty!5791 () Bool)

(assert (=> b!220509 (= e!143352 tp_is_empty!5791)))

(declare-fun b!220510 () Bool)

(declare-fun call!20598 () Bool)

(assert (=> b!220510 (= e!143362 (not call!20598))))

(declare-fun b!220511 () Bool)

(declare-fun e!143353 () Bool)

(declare-fun e!143356 () Bool)

(assert (=> b!220511 (= e!143353 e!143356)))

(declare-fun res!108117 () Bool)

(assert (=> b!220511 (= res!108117 call!20597)))

(assert (=> b!220511 (=> (not res!108117) (not e!143356))))

(declare-fun b!220512 () Bool)

(declare-fun c!36687 () Bool)

(get-info :version)

(assert (=> b!220512 (= c!36687 ((_ is MissingVacant!809) lt!112047))))

(assert (=> b!220512 (= e!143354 e!143353)))

(declare-fun b!220513 () Bool)

(declare-fun e!143358 () Bool)

(declare-fun e!143364 () Bool)

(assert (=> b!220513 (= e!143358 e!143364)))

(declare-fun res!108121 () Bool)

(assert (=> b!220513 (=> (not res!108121) (not e!143364))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!220513 (= res!108121 (inRange!0 index!297 (mask!9964 thiss!1504)))))

(declare-datatypes ((Unit!6537 0))(
  ( (Unit!6538) )
))
(declare-fun lt!112050 () Unit!6537)

(declare-fun e!143361 () Unit!6537)

(assert (=> b!220513 (= lt!112050 e!143361)))

(declare-fun c!36688 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4326 0))(
  ( (tuple2!4327 (_1!2174 (_ BitVec 64)) (_2!2174 V!7369)) )
))
(declare-datatypes ((List!3248 0))(
  ( (Nil!3245) (Cons!3244 (h!3892 tuple2!4326) (t!8198 List!3248)) )
))
(declare-datatypes ((ListLongMap!3229 0))(
  ( (ListLongMap!3230 (toList!1630 List!3248)) )
))
(declare-fun contains!1473 (ListLongMap!3229 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1139 (array!10819 array!10817 (_ BitVec 32) (_ BitVec 32) V!7369 V!7369 (_ BitVec 32) Int) ListLongMap!3229)

(assert (=> b!220513 (= c!36688 (contains!1473 (getCurrentListMap!1139 (_keys!6214 thiss!1504) (_values!4144 thiss!1504) (mask!9964 thiss!1504) (extraKeys!3898 thiss!1504) (zeroValue!4002 thiss!1504) (minValue!4002 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4161 thiss!1504)) key!932))))

(declare-fun b!220515 () Bool)

(assert (=> b!220515 (= e!143356 (not call!20598))))

(declare-fun bm!20594 () Bool)

(declare-fun c!36686 () Bool)

(assert (=> bm!20594 (= call!20597 (inRange!0 (ite c!36686 (index!5406 lt!112047) (index!5409 lt!112047)) (mask!9964 thiss!1504)))))

(declare-fun mapIsEmpty!9856 () Bool)

(declare-fun mapRes!9856 () Bool)

(assert (=> mapIsEmpty!9856 mapRes!9856))

(declare-fun b!220516 () Bool)

(declare-fun res!108118 () Bool)

(assert (=> b!220516 (=> (not res!108118) (not e!143364))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10819 (_ BitVec 32)) Bool)

(assert (=> b!220516 (= res!108118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6214 thiss!1504) (mask!9964 thiss!1504)))))

(declare-fun b!220517 () Bool)

(declare-fun Unit!6539 () Unit!6537)

(assert (=> b!220517 (= e!143361 Unit!6539)))

(declare-fun lt!112051 () Unit!6537)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!201 (array!10819 array!10817 (_ BitVec 32) (_ BitVec 32) V!7369 V!7369 (_ BitVec 64) Int) Unit!6537)

(assert (=> b!220517 (= lt!112051 (lemmaInListMapThenSeekEntryOrOpenFindsIt!201 (_keys!6214 thiss!1504) (_values!4144 thiss!1504) (mask!9964 thiss!1504) (extraKeys!3898 thiss!1504) (zeroValue!4002 thiss!1504) (minValue!4002 thiss!1504) key!932 (defaultEntry!4161 thiss!1504)))))

(assert (=> b!220517 false))

(declare-fun bm!20595 () Bool)

(declare-fun arrayContainsKey!0 (array!10819 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20595 (= call!20598 (arrayContainsKey!0 (_keys!6214 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!9856 () Bool)

(declare-fun tp!20929 () Bool)

(assert (=> mapNonEmpty!9856 (= mapRes!9856 (and tp!20929 e!143352))))

(declare-fun mapValue!9856 () ValueCell!2552)

(declare-fun mapKey!9856 () (_ BitVec 32))

(declare-fun mapRest!9856 () (Array (_ BitVec 32) ValueCell!2552))

(assert (=> mapNonEmpty!9856 (= (arr!5127 (_values!4144 thiss!1504)) (store mapRest!9856 mapKey!9856 mapValue!9856))))

(declare-fun b!220518 () Bool)

(declare-fun res!108115 () Bool)

(assert (=> b!220518 (= res!108115 (= (select (arr!5128 (_keys!6214 thiss!1504)) (index!5409 lt!112047)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!220518 (=> (not res!108115) (not e!143356))))

(declare-fun b!220519 () Bool)

(declare-fun e!143355 () Bool)

(assert (=> b!220519 (= e!143355 tp_is_empty!5791)))

(declare-fun b!220520 () Bool)

(declare-fun res!108122 () Bool)

(assert (=> b!220520 (=> (not res!108122) (not e!143364))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!220520 (= res!108122 (validMask!0 (mask!9964 thiss!1504)))))

(declare-fun b!220521 () Bool)

(declare-fun res!108111 () Bool)

(assert (=> b!220521 (=> (not res!108111) (not e!143364))))

(assert (=> b!220521 (= res!108111 (and (= (size!5461 (_values!4144 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9964 thiss!1504))) (= (size!5462 (_keys!6214 thiss!1504)) (size!5461 (_values!4144 thiss!1504))) (bvsge (mask!9964 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3898 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3898 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!220522 () Bool)

(declare-fun e!143357 () Bool)

(assert (=> b!220522 (= e!143357 e!143358)))

(declare-fun res!108114 () Bool)

(assert (=> b!220522 (=> (not res!108114) (not e!143358))))

(assert (=> b!220522 (= res!108114 (or (= lt!112047 (MissingZero!809 index!297)) (= lt!112047 (MissingVacant!809 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10819 (_ BitVec 32)) SeekEntryResult!809)

(assert (=> b!220522 (= lt!112047 (seekEntryOrOpen!0 key!932 (_keys!6214 thiss!1504) (mask!9964 thiss!1504)))))

(declare-fun b!220523 () Bool)

(declare-fun res!108112 () Bool)

(assert (=> b!220523 (=> (not res!108112) (not e!143364))))

(assert (=> b!220523 (= res!108112 (arrayContainsKey!0 (_keys!6214 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!220524 () Bool)

(declare-fun res!108116 () Bool)

(assert (=> b!220524 (=> (not res!108116) (not e!143357))))

(assert (=> b!220524 (= res!108116 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!220525 () Bool)

(declare-fun lt!112048 () Unit!6537)

(assert (=> b!220525 (= e!143361 lt!112048)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!202 (array!10819 array!10817 (_ BitVec 32) (_ BitVec 32) V!7369 V!7369 (_ BitVec 64) Int) Unit!6537)

(assert (=> b!220525 (= lt!112048 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!202 (_keys!6214 thiss!1504) (_values!4144 thiss!1504) (mask!9964 thiss!1504) (extraKeys!3898 thiss!1504) (zeroValue!4002 thiss!1504) (minValue!4002 thiss!1504) key!932 (defaultEntry!4161 thiss!1504)))))

(assert (=> b!220525 (= c!36686 ((_ is MissingZero!809) lt!112047))))

(assert (=> b!220525 e!143354))

(declare-fun b!220514 () Bool)

(assert (=> b!220514 (= e!143364 false)))

(declare-fun lt!112049 () Bool)

(declare-datatypes ((List!3249 0))(
  ( (Nil!3246) (Cons!3245 (h!3893 (_ BitVec 64)) (t!8199 List!3249)) )
))
(declare-fun arrayNoDuplicates!0 (array!10819 (_ BitVec 32) List!3249) Bool)

(assert (=> b!220514 (= lt!112049 (arrayNoDuplicates!0 (_keys!6214 thiss!1504) #b00000000000000000000000000000000 Nil!3246))))

(declare-fun res!108120 () Bool)

(assert (=> start!21866 (=> (not res!108120) (not e!143357))))

(declare-fun valid!1225 (LongMapFixedSize!3004) Bool)

(assert (=> start!21866 (= res!108120 (valid!1225 thiss!1504))))

(assert (=> start!21866 e!143357))

(declare-fun e!143359 () Bool)

(assert (=> start!21866 e!143359))

(assert (=> start!21866 true))

(declare-fun b!220526 () Bool)

(declare-fun e!143360 () Bool)

(assert (=> b!220526 (= e!143360 (and e!143355 mapRes!9856))))

(declare-fun condMapEmpty!9856 () Bool)

(declare-fun mapDefault!9856 () ValueCell!2552)

(assert (=> b!220526 (= condMapEmpty!9856 (= (arr!5127 (_values!4144 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2552)) mapDefault!9856)))))

(declare-fun array_inv!3375 (array!10819) Bool)

(declare-fun array_inv!3376 (array!10817) Bool)

(assert (=> b!220527 (= e!143359 (and tp!20928 tp_is_empty!5791 (array_inv!3375 (_keys!6214 thiss!1504)) (array_inv!3376 (_values!4144 thiss!1504)) e!143360))))

(declare-fun b!220528 () Bool)

(assert (=> b!220528 (= e!143353 ((_ is Undefined!809) lt!112047))))

(assert (= (and start!21866 res!108120) b!220524))

(assert (= (and b!220524 res!108116) b!220522))

(assert (= (and b!220522 res!108114) b!220513))

(assert (= (and b!220513 c!36688) b!220517))

(assert (= (and b!220513 (not c!36688)) b!220525))

(assert (= (and b!220525 c!36686) b!220507))

(assert (= (and b!220525 (not c!36686)) b!220512))

(assert (= (and b!220507 res!108113) b!220508))

(assert (= (and b!220508 res!108119) b!220510))

(assert (= (and b!220512 c!36687) b!220511))

(assert (= (and b!220512 (not c!36687)) b!220528))

(assert (= (and b!220511 res!108117) b!220518))

(assert (= (and b!220518 res!108115) b!220515))

(assert (= (or b!220507 b!220511) bm!20594))

(assert (= (or b!220510 b!220515) bm!20595))

(assert (= (and b!220513 res!108121) b!220523))

(assert (= (and b!220523 res!108112) b!220520))

(assert (= (and b!220520 res!108122) b!220521))

(assert (= (and b!220521 res!108111) b!220516))

(assert (= (and b!220516 res!108118) b!220514))

(assert (= (and b!220526 condMapEmpty!9856) mapIsEmpty!9856))

(assert (= (and b!220526 (not condMapEmpty!9856)) mapNonEmpty!9856))

(assert (= (and mapNonEmpty!9856 ((_ is ValueCellFull!2552) mapValue!9856)) b!220509))

(assert (= (and b!220526 ((_ is ValueCellFull!2552) mapDefault!9856)) b!220519))

(assert (= b!220527 b!220526))

(assert (= start!21866 b!220527))

(declare-fun m!245059 () Bool)

(assert (=> bm!20594 m!245059))

(declare-fun m!245061 () Bool)

(assert (=> bm!20595 m!245061))

(declare-fun m!245063 () Bool)

(assert (=> b!220527 m!245063))

(declare-fun m!245065 () Bool)

(assert (=> b!220527 m!245065))

(declare-fun m!245067 () Bool)

(assert (=> b!220516 m!245067))

(declare-fun m!245069 () Bool)

(assert (=> b!220513 m!245069))

(declare-fun m!245071 () Bool)

(assert (=> b!220513 m!245071))

(assert (=> b!220513 m!245071))

(declare-fun m!245073 () Bool)

(assert (=> b!220513 m!245073))

(declare-fun m!245075 () Bool)

(assert (=> b!220514 m!245075))

(declare-fun m!245077 () Bool)

(assert (=> b!220508 m!245077))

(declare-fun m!245079 () Bool)

(assert (=> b!220518 m!245079))

(declare-fun m!245081 () Bool)

(assert (=> b!220520 m!245081))

(declare-fun m!245083 () Bool)

(assert (=> b!220517 m!245083))

(declare-fun m!245085 () Bool)

(assert (=> b!220525 m!245085))

(declare-fun m!245087 () Bool)

(assert (=> mapNonEmpty!9856 m!245087))

(declare-fun m!245089 () Bool)

(assert (=> start!21866 m!245089))

(declare-fun m!245091 () Bool)

(assert (=> b!220522 m!245091))

(assert (=> b!220523 m!245061))

(check-sat (not b!220525) (not b!220527) (not b!220517) (not b!220513) (not b!220514) tp_is_empty!5791 (not mapNonEmpty!9856) (not start!21866) (not bm!20595) (not b_next!5929) b_and!12801 (not b!220522) (not b!220520) (not b!220523) (not b!220516) (not bm!20594))
(check-sat b_and!12801 (not b_next!5929))
