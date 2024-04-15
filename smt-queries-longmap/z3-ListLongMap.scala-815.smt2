; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19932 () Bool)

(assert start!19932)

(declare-fun b!195403 () Bool)

(declare-fun b_free!4729 () Bool)

(declare-fun b_next!4729 () Bool)

(assert (=> b!195403 (= b_free!4729 (not b_next!4729))))

(declare-fun tp!17070 () Bool)

(declare-fun b_and!11449 () Bool)

(assert (=> b!195403 (= tp!17070 b_and!11449)))

(declare-fun b!195395 () Bool)

(declare-fun b_free!4731 () Bool)

(declare-fun b_next!4731 () Bool)

(assert (=> b!195395 (= b_free!4731 (not b_next!4731))))

(declare-fun tp!17068 () Bool)

(declare-fun b_and!11451 () Bool)

(assert (=> b!195395 (= tp!17068 b_and!11451)))

(declare-fun b!195392 () Bool)

(declare-fun e!128528 () Bool)

(declare-fun tp_is_empty!4501 () Bool)

(assert (=> b!195392 (= e!128528 tp_is_empty!4501)))

(declare-fun mapNonEmpty!7794 () Bool)

(declare-fun mapRes!7795 () Bool)

(declare-fun tp!17069 () Bool)

(declare-fun e!128533 () Bool)

(assert (=> mapNonEmpty!7794 (= mapRes!7795 (and tp!17069 e!128533))))

(declare-fun mapKey!7794 () (_ BitVec 32))

(declare-datatypes ((V!5649 0))(
  ( (V!5650 (val!2295 Int)) )
))
(declare-datatypes ((ValueCell!1907 0))(
  ( (ValueCellFull!1907 (v!4257 V!5649)) (EmptyCell!1907) )
))
(declare-fun mapValue!7795 () ValueCell!1907)

(declare-fun mapRest!7794 () (Array (_ BitVec 32) ValueCell!1907))

(declare-datatypes ((array!8237 0))(
  ( (array!8238 (arr!3874 (Array (_ BitVec 32) (_ BitVec 64))) (size!4200 (_ BitVec 32))) )
))
(declare-datatypes ((array!8239 0))(
  ( (array!8240 (arr!3875 (Array (_ BitVec 32) ValueCell!1907)) (size!4201 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2722 0))(
  ( (LongMapFixedSize!2723 (defaultEntry!3975 Int) (mask!9250 (_ BitVec 32)) (extraKeys!3712 (_ BitVec 32)) (zeroValue!3816 V!5649) (minValue!3816 V!5649) (_size!1410 (_ BitVec 32)) (_keys!5973 array!8237) (_values!3958 array!8239) (_vacant!1410 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2722)

(assert (=> mapNonEmpty!7794 (= (arr!3875 (_values!3958 thiss!1248)) (store mapRest!7794 mapKey!7794 mapValue!7795))))

(declare-fun b!195394 () Bool)

(declare-fun e!128521 () Bool)

(declare-fun e!128525 () Bool)

(assert (=> b!195394 (= e!128521 e!128525)))

(declare-datatypes ((tuple2!3516 0))(
  ( (tuple2!3517 (_1!1769 (_ BitVec 64)) (_2!1769 V!5649)) )
))
(declare-datatypes ((List!2431 0))(
  ( (Nil!2428) (Cons!2427 (h!3069 tuple2!3516) (t!7353 List!2431)) )
))
(declare-datatypes ((ListLongMap!2425 0))(
  ( (ListLongMap!2426 (toList!1228 List!2431)) )
))
(declare-fun lt!97294 () ListLongMap!2425)

(declare-fun call!19728 () ListLongMap!2425)

(assert (=> b!195394 (= lt!97294 call!19728)))

(declare-fun res!92206 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun contains!1361 (ListLongMap!2425 (_ BitVec 64)) Bool)

(assert (=> b!195394 (= res!92206 (not (contains!1361 lt!97294 key!828)))))

(assert (=> b!195394 (=> res!92206 e!128525)))

(declare-fun bm!19724 () Bool)

(declare-datatypes ((tuple2!3518 0))(
  ( (tuple2!3519 (_1!1770 Bool) (_2!1770 LongMapFixedSize!2722)) )
))
(declare-fun lt!97293 () tuple2!3518)

(declare-fun map!2014 (LongMapFixedSize!2722) ListLongMap!2425)

(assert (=> bm!19724 (= call!19728 (map!2014 (_2!1770 lt!97293)))))

(declare-fun e!128520 () Bool)

(declare-fun e!128529 () Bool)

(declare-fun array_inv!2511 (array!8237) Bool)

(declare-fun array_inv!2512 (array!8239) Bool)

(assert (=> b!195395 (= e!128529 (and tp!17068 tp_is_empty!4501 (array_inv!2511 (_keys!5973 thiss!1248)) (array_inv!2512 (_values!3958 thiss!1248)) e!128520))))

(declare-fun mapIsEmpty!7794 () Bool)

(declare-fun mapRes!7794 () Bool)

(assert (=> mapIsEmpty!7794 mapRes!7794))

(declare-fun b!195396 () Bool)

(declare-fun res!92208 () Bool)

(declare-fun e!128531 () Bool)

(assert (=> b!195396 (=> (not res!92208) (not e!128531))))

(assert (=> b!195396 (= res!92208 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!7795 () Bool)

(assert (=> mapIsEmpty!7795 mapRes!7795))

(declare-fun b!195397 () Bool)

(assert (=> b!195397 (= e!128520 (and e!128528 mapRes!7795))))

(declare-fun condMapEmpty!7794 () Bool)

(declare-fun mapDefault!7794 () ValueCell!1907)

(assert (=> b!195397 (= condMapEmpty!7794 (= (arr!3875 (_values!3958 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1907)) mapDefault!7794)))))

(declare-fun b!195398 () Bool)

(declare-fun e!128527 () Bool)

(declare-fun e!128526 () Bool)

(assert (=> b!195398 (= e!128527 e!128526)))

(declare-fun res!92207 () Bool)

(assert (=> b!195398 (=> res!92207 e!128526)))

(declare-fun valid!1133 (LongMapFixedSize!2722) Bool)

(assert (=> b!195398 (= res!92207 (not (valid!1133 (_2!1770 lt!97293))))))

(declare-fun err!99 () tuple2!3518)

(assert (=> b!195398 (= lt!97293 err!99)))

(assert (=> b!195398 true))

(declare-fun e!128522 () Bool)

(assert (=> b!195398 e!128522))

(declare-fun b!195399 () Bool)

(declare-fun e!128519 () Bool)

(assert (=> b!195399 (= e!128519 tp_is_empty!4501)))

(declare-fun res!92204 () Bool)

(assert (=> start!19932 (=> (not res!92204) (not e!128531))))

(assert (=> start!19932 (= res!92204 (valid!1133 thiss!1248))))

(assert (=> start!19932 e!128531))

(assert (=> start!19932 e!128529))

(assert (=> start!19932 true))

(assert (=> start!19932 tp_is_empty!4501))

(declare-fun b!195393 () Bool)

(declare-fun e!128532 () Bool)

(assert (=> b!195393 (= e!128532 (and e!128519 mapRes!7794))))

(declare-fun condMapEmpty!7795 () Bool)

(declare-fun mapDefault!7795 () ValueCell!1907)

(assert (=> b!195393 (= condMapEmpty!7795 (= (arr!3875 (_values!3958 (_2!1770 err!99))) ((as const (Array (_ BitVec 32) ValueCell!1907)) mapDefault!7795)))))

(declare-fun b!195400 () Bool)

(assert (=> b!195400 (= e!128531 e!128527)))

(declare-fun res!92205 () Bool)

(assert (=> b!195400 (=> (not res!92205) (not e!128527))))

(declare-datatypes ((SeekEntryResult!699 0))(
  ( (MissingZero!699 (index!4966 (_ BitVec 32))) (Found!699 (index!4967 (_ BitVec 32))) (Intermediate!699 (undefined!1511 Bool) (index!4968 (_ BitVec 32)) (x!20753 (_ BitVec 32))) (Undefined!699) (MissingVacant!699 (index!4969 (_ BitVec 32))) )
))
(declare-fun lt!97292 () SeekEntryResult!699)

(get-info :version)

(assert (=> b!195400 (= res!92205 (and (not ((_ is Undefined!699) lt!97292)) (not ((_ is MissingVacant!699) lt!97292)) (not ((_ is MissingZero!699) lt!97292)) (not ((_ is Found!699) lt!97292))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8237 (_ BitVec 32)) SeekEntryResult!699)

(assert (=> b!195400 (= lt!97292 (seekEntryOrOpen!0 key!828 (_keys!5973 thiss!1248) (mask!9250 thiss!1248)))))

(declare-fun b!195401 () Bool)

(declare-fun v!309 () V!5649)

(declare-fun call!19727 () ListLongMap!2425)

(declare-fun +!320 (ListLongMap!2425 tuple2!3516) ListLongMap!2425)

(assert (=> b!195401 (= e!128525 (not (= lt!97294 (+!320 call!19727 (tuple2!3517 key!828 v!309)))))))

(declare-fun mapNonEmpty!7795 () Bool)

(declare-fun tp!17071 () Bool)

(declare-fun e!128523 () Bool)

(assert (=> mapNonEmpty!7795 (= mapRes!7794 (and tp!17071 e!128523))))

(declare-fun mapValue!7794 () ValueCell!1907)

(declare-fun mapRest!7795 () (Array (_ BitVec 32) ValueCell!1907))

(declare-fun mapKey!7795 () (_ BitVec 32))

(assert (=> mapNonEmpty!7795 (= (arr!3875 (_values!3958 (_2!1770 err!99))) (store mapRest!7795 mapKey!7795 mapValue!7794))))

(declare-fun b!195402 () Bool)

(assert (=> b!195402 (= e!128526 e!128521)))

(declare-fun c!35379 () Bool)

(assert (=> b!195402 (= c!35379 (_1!1770 lt!97293))))

(assert (=> b!195403 (= e!128522 (and tp!17070 tp_is_empty!4501 (array_inv!2511 (_keys!5973 (_2!1770 err!99))) (array_inv!2512 (_values!3958 (_2!1770 err!99))) e!128532))))

(declare-fun b!195404 () Bool)

(assert (=> b!195404 (= e!128521 (not (= call!19728 call!19727)))))

(declare-fun b!195405 () Bool)

(assert (=> b!195405 (= e!128523 tp_is_empty!4501)))

(declare-fun bm!19725 () Bool)

(assert (=> bm!19725 (= call!19727 (map!2014 thiss!1248))))

(declare-fun b!195406 () Bool)

(assert (=> b!195406 (= e!128533 tp_is_empty!4501)))

(assert (= (and start!19932 res!92204) b!195396))

(assert (= (and b!195396 res!92208) b!195400))

(assert (= (and b!195400 res!92205) b!195398))

(assert (= (and b!195393 condMapEmpty!7795) mapIsEmpty!7794))

(assert (= (and b!195393 (not condMapEmpty!7795)) mapNonEmpty!7795))

(assert (= (and mapNonEmpty!7795 ((_ is ValueCellFull!1907) mapValue!7794)) b!195405))

(assert (= (and b!195393 ((_ is ValueCellFull!1907) mapDefault!7795)) b!195399))

(assert (= b!195403 b!195393))

(assert (= b!195398 b!195403))

(assert (= (and b!195398 (not res!92207)) b!195402))

(assert (= (and b!195402 c!35379) b!195394))

(assert (= (and b!195402 (not c!35379)) b!195404))

(assert (= (and b!195394 (not res!92206)) b!195401))

(assert (= (or b!195401 b!195404) bm!19725))

(assert (= (or b!195394 b!195404) bm!19724))

(assert (= (and b!195397 condMapEmpty!7794) mapIsEmpty!7795))

(assert (= (and b!195397 (not condMapEmpty!7794)) mapNonEmpty!7794))

(assert (= (and mapNonEmpty!7794 ((_ is ValueCellFull!1907) mapValue!7795)) b!195406))

(assert (= (and b!195397 ((_ is ValueCellFull!1907) mapDefault!7794)) b!195392))

(assert (= b!195395 b!195397))

(assert (= start!19932 b!195395))

(declare-fun m!222497 () Bool)

(assert (=> b!195398 m!222497))

(declare-fun m!222499 () Bool)

(assert (=> mapNonEmpty!7794 m!222499))

(declare-fun m!222501 () Bool)

(assert (=> bm!19724 m!222501))

(declare-fun m!222503 () Bool)

(assert (=> b!195400 m!222503))

(declare-fun m!222505 () Bool)

(assert (=> b!195394 m!222505))

(declare-fun m!222507 () Bool)

(assert (=> b!195401 m!222507))

(declare-fun m!222509 () Bool)

(assert (=> b!195403 m!222509))

(declare-fun m!222511 () Bool)

(assert (=> b!195403 m!222511))

(declare-fun m!222513 () Bool)

(assert (=> mapNonEmpty!7795 m!222513))

(declare-fun m!222515 () Bool)

(assert (=> start!19932 m!222515))

(declare-fun m!222517 () Bool)

(assert (=> bm!19725 m!222517))

(declare-fun m!222519 () Bool)

(assert (=> b!195395 m!222519))

(declare-fun m!222521 () Bool)

(assert (=> b!195395 m!222521))

(check-sat (not start!19932) b_and!11451 b_and!11449 tp_is_empty!4501 (not b!195398) (not mapNonEmpty!7795) (not b!195400) (not b_next!4731) (not bm!19725) (not b!195401) (not mapNonEmpty!7794) (not bm!19724) (not b!195395) (not b_next!4729) (not b!195403) (not b!195394))
(check-sat b_and!11449 b_and!11451 (not b_next!4731) (not b_next!4729))
(get-model)

(declare-fun b!195509 () Bool)

(declare-fun e!128630 () SeekEntryResult!699)

(declare-fun lt!97320 () SeekEntryResult!699)

(assert (=> b!195509 (= e!128630 (MissingZero!699 (index!4968 lt!97320)))))

(declare-fun b!195510 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8237 (_ BitVec 32)) SeekEntryResult!699)

(assert (=> b!195510 (= e!128630 (seekKeyOrZeroReturnVacant!0 (x!20753 lt!97320) (index!4968 lt!97320) (index!4968 lt!97320) key!828 (_keys!5973 thiss!1248) (mask!9250 thiss!1248)))))

(declare-fun b!195511 () Bool)

(declare-fun e!128631 () SeekEntryResult!699)

(assert (=> b!195511 (= e!128631 Undefined!699)))

(declare-fun b!195512 () Bool)

(declare-fun e!128632 () SeekEntryResult!699)

(assert (=> b!195512 (= e!128632 (Found!699 (index!4968 lt!97320)))))

(declare-fun b!195513 () Bool)

(assert (=> b!195513 (= e!128631 e!128632)))

(declare-fun lt!97321 () (_ BitVec 64))

(assert (=> b!195513 (= lt!97321 (select (arr!3874 (_keys!5973 thiss!1248)) (index!4968 lt!97320)))))

(declare-fun c!35392 () Bool)

(assert (=> b!195513 (= c!35392 (= lt!97321 key!828))))

(declare-fun b!195514 () Bool)

(declare-fun c!35394 () Bool)

(assert (=> b!195514 (= c!35394 (= lt!97321 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!195514 (= e!128632 e!128630)))

(declare-fun d!57351 () Bool)

(declare-fun lt!97319 () SeekEntryResult!699)

(assert (=> d!57351 (and (or ((_ is Undefined!699) lt!97319) (not ((_ is Found!699) lt!97319)) (and (bvsge (index!4967 lt!97319) #b00000000000000000000000000000000) (bvslt (index!4967 lt!97319) (size!4200 (_keys!5973 thiss!1248))))) (or ((_ is Undefined!699) lt!97319) ((_ is Found!699) lt!97319) (not ((_ is MissingZero!699) lt!97319)) (and (bvsge (index!4966 lt!97319) #b00000000000000000000000000000000) (bvslt (index!4966 lt!97319) (size!4200 (_keys!5973 thiss!1248))))) (or ((_ is Undefined!699) lt!97319) ((_ is Found!699) lt!97319) ((_ is MissingZero!699) lt!97319) (not ((_ is MissingVacant!699) lt!97319)) (and (bvsge (index!4969 lt!97319) #b00000000000000000000000000000000) (bvslt (index!4969 lt!97319) (size!4200 (_keys!5973 thiss!1248))))) (or ((_ is Undefined!699) lt!97319) (ite ((_ is Found!699) lt!97319) (= (select (arr!3874 (_keys!5973 thiss!1248)) (index!4967 lt!97319)) key!828) (ite ((_ is MissingZero!699) lt!97319) (= (select (arr!3874 (_keys!5973 thiss!1248)) (index!4966 lt!97319)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!699) lt!97319) (= (select (arr!3874 (_keys!5973 thiss!1248)) (index!4969 lt!97319)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!57351 (= lt!97319 e!128631)))

(declare-fun c!35393 () Bool)

(assert (=> d!57351 (= c!35393 (and ((_ is Intermediate!699) lt!97320) (undefined!1511 lt!97320)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8237 (_ BitVec 32)) SeekEntryResult!699)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!57351 (= lt!97320 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9250 thiss!1248)) key!828 (_keys!5973 thiss!1248) (mask!9250 thiss!1248)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!57351 (validMask!0 (mask!9250 thiss!1248))))

(assert (=> d!57351 (= (seekEntryOrOpen!0 key!828 (_keys!5973 thiss!1248) (mask!9250 thiss!1248)) lt!97319)))

(assert (= (and d!57351 c!35393) b!195511))

(assert (= (and d!57351 (not c!35393)) b!195513))

(assert (= (and b!195513 c!35392) b!195512))

(assert (= (and b!195513 (not c!35392)) b!195514))

(assert (= (and b!195514 c!35394) b!195509))

(assert (= (and b!195514 (not c!35394)) b!195510))

(declare-fun m!222575 () Bool)

(assert (=> b!195510 m!222575))

(declare-fun m!222577 () Bool)

(assert (=> b!195513 m!222577))

(declare-fun m!222579 () Bool)

(assert (=> d!57351 m!222579))

(declare-fun m!222581 () Bool)

(assert (=> d!57351 m!222581))

(declare-fun m!222583 () Bool)

(assert (=> d!57351 m!222583))

(declare-fun m!222585 () Bool)

(assert (=> d!57351 m!222585))

(assert (=> d!57351 m!222581))

(declare-fun m!222587 () Bool)

(assert (=> d!57351 m!222587))

(declare-fun m!222589 () Bool)

(assert (=> d!57351 m!222589))

(assert (=> b!195400 d!57351))

(declare-fun d!57353 () Bool)

(declare-fun res!92245 () Bool)

(declare-fun e!128635 () Bool)

(assert (=> d!57353 (=> (not res!92245) (not e!128635))))

(declare-fun simpleValid!206 (LongMapFixedSize!2722) Bool)

(assert (=> d!57353 (= res!92245 (simpleValid!206 thiss!1248))))

(assert (=> d!57353 (= (valid!1133 thiss!1248) e!128635)))

(declare-fun b!195521 () Bool)

(declare-fun res!92246 () Bool)

(assert (=> b!195521 (=> (not res!92246) (not e!128635))))

(declare-fun arrayCountValidKeys!0 (array!8237 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!195521 (= res!92246 (= (arrayCountValidKeys!0 (_keys!5973 thiss!1248) #b00000000000000000000000000000000 (size!4200 (_keys!5973 thiss!1248))) (_size!1410 thiss!1248)))))

(declare-fun b!195522 () Bool)

(declare-fun res!92247 () Bool)

(assert (=> b!195522 (=> (not res!92247) (not e!128635))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8237 (_ BitVec 32)) Bool)

(assert (=> b!195522 (= res!92247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5973 thiss!1248) (mask!9250 thiss!1248)))))

(declare-fun b!195523 () Bool)

(declare-datatypes ((List!2433 0))(
  ( (Nil!2430) (Cons!2429 (h!3071 (_ BitVec 64)) (t!7355 List!2433)) )
))
(declare-fun arrayNoDuplicates!0 (array!8237 (_ BitVec 32) List!2433) Bool)

(assert (=> b!195523 (= e!128635 (arrayNoDuplicates!0 (_keys!5973 thiss!1248) #b00000000000000000000000000000000 Nil!2430))))

(assert (= (and d!57353 res!92245) b!195521))

(assert (= (and b!195521 res!92246) b!195522))

(assert (= (and b!195522 res!92247) b!195523))

(declare-fun m!222591 () Bool)

(assert (=> d!57353 m!222591))

(declare-fun m!222593 () Bool)

(assert (=> b!195521 m!222593))

(declare-fun m!222595 () Bool)

(assert (=> b!195522 m!222595))

(declare-fun m!222597 () Bool)

(assert (=> b!195523 m!222597))

(assert (=> start!19932 d!57353))

(declare-fun d!57355 () Bool)

(assert (=> d!57355 (= (array_inv!2511 (_keys!5973 (_2!1770 err!99))) (bvsge (size!4200 (_keys!5973 (_2!1770 err!99))) #b00000000000000000000000000000000))))

(assert (=> b!195403 d!57355))

(declare-fun d!57357 () Bool)

(assert (=> d!57357 (= (array_inv!2512 (_values!3958 (_2!1770 err!99))) (bvsge (size!4201 (_values!3958 (_2!1770 err!99))) #b00000000000000000000000000000000))))

(assert (=> b!195403 d!57357))

(declare-fun d!57359 () Bool)

(assert (=> d!57359 (= (array_inv!2511 (_keys!5973 thiss!1248)) (bvsge (size!4200 (_keys!5973 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!195395 d!57359))

(declare-fun d!57361 () Bool)

(assert (=> d!57361 (= (array_inv!2512 (_values!3958 thiss!1248)) (bvsge (size!4201 (_values!3958 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!195395 d!57361))

(declare-fun d!57363 () Bool)

(declare-fun getCurrentListMap!861 (array!8237 array!8239 (_ BitVec 32) (_ BitVec 32) V!5649 V!5649 (_ BitVec 32) Int) ListLongMap!2425)

(assert (=> d!57363 (= (map!2014 (_2!1770 lt!97293)) (getCurrentListMap!861 (_keys!5973 (_2!1770 lt!97293)) (_values!3958 (_2!1770 lt!97293)) (mask!9250 (_2!1770 lt!97293)) (extraKeys!3712 (_2!1770 lt!97293)) (zeroValue!3816 (_2!1770 lt!97293)) (minValue!3816 (_2!1770 lt!97293)) #b00000000000000000000000000000000 (defaultEntry!3975 (_2!1770 lt!97293))))))

(declare-fun bs!7786 () Bool)

(assert (= bs!7786 d!57363))

(declare-fun m!222599 () Bool)

(assert (=> bs!7786 m!222599))

(assert (=> bm!19724 d!57363))

(declare-fun d!57365 () Bool)

(declare-fun res!92248 () Bool)

(declare-fun e!128636 () Bool)

(assert (=> d!57365 (=> (not res!92248) (not e!128636))))

(assert (=> d!57365 (= res!92248 (simpleValid!206 (_2!1770 lt!97293)))))

(assert (=> d!57365 (= (valid!1133 (_2!1770 lt!97293)) e!128636)))

(declare-fun b!195524 () Bool)

(declare-fun res!92249 () Bool)

(assert (=> b!195524 (=> (not res!92249) (not e!128636))))

(assert (=> b!195524 (= res!92249 (= (arrayCountValidKeys!0 (_keys!5973 (_2!1770 lt!97293)) #b00000000000000000000000000000000 (size!4200 (_keys!5973 (_2!1770 lt!97293)))) (_size!1410 (_2!1770 lt!97293))))))

(declare-fun b!195525 () Bool)

(declare-fun res!92250 () Bool)

(assert (=> b!195525 (=> (not res!92250) (not e!128636))))

(assert (=> b!195525 (= res!92250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5973 (_2!1770 lt!97293)) (mask!9250 (_2!1770 lt!97293))))))

(declare-fun b!195526 () Bool)

(assert (=> b!195526 (= e!128636 (arrayNoDuplicates!0 (_keys!5973 (_2!1770 lt!97293)) #b00000000000000000000000000000000 Nil!2430))))

(assert (= (and d!57365 res!92248) b!195524))

(assert (= (and b!195524 res!92249) b!195525))

(assert (= (and b!195525 res!92250) b!195526))

(declare-fun m!222601 () Bool)

(assert (=> d!57365 m!222601))

(declare-fun m!222603 () Bool)

(assert (=> b!195524 m!222603))

(declare-fun m!222605 () Bool)

(assert (=> b!195525 m!222605))

(declare-fun m!222607 () Bool)

(assert (=> b!195526 m!222607))

(assert (=> b!195398 d!57365))

(declare-fun d!57367 () Bool)

(declare-fun e!128639 () Bool)

(assert (=> d!57367 e!128639))

(declare-fun res!92255 () Bool)

(assert (=> d!57367 (=> (not res!92255) (not e!128639))))

(declare-fun lt!97331 () ListLongMap!2425)

(assert (=> d!57367 (= res!92255 (contains!1361 lt!97331 (_1!1769 (tuple2!3517 key!828 v!309))))))

(declare-fun lt!97333 () List!2431)

(assert (=> d!57367 (= lt!97331 (ListLongMap!2426 lt!97333))))

(declare-datatypes ((Unit!5883 0))(
  ( (Unit!5884) )
))
(declare-fun lt!97330 () Unit!5883)

(declare-fun lt!97332 () Unit!5883)

(assert (=> d!57367 (= lt!97330 lt!97332)))

(declare-datatypes ((Option!250 0))(
  ( (Some!249 (v!4260 V!5649)) (None!248) )
))
(declare-fun getValueByKey!244 (List!2431 (_ BitVec 64)) Option!250)

(assert (=> d!57367 (= (getValueByKey!244 lt!97333 (_1!1769 (tuple2!3517 key!828 v!309))) (Some!249 (_2!1769 (tuple2!3517 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!134 (List!2431 (_ BitVec 64) V!5649) Unit!5883)

(assert (=> d!57367 (= lt!97332 (lemmaContainsTupThenGetReturnValue!134 lt!97333 (_1!1769 (tuple2!3517 key!828 v!309)) (_2!1769 (tuple2!3517 key!828 v!309))))))

(declare-fun insertStrictlySorted!137 (List!2431 (_ BitVec 64) V!5649) List!2431)

(assert (=> d!57367 (= lt!97333 (insertStrictlySorted!137 (toList!1228 call!19727) (_1!1769 (tuple2!3517 key!828 v!309)) (_2!1769 (tuple2!3517 key!828 v!309))))))

(assert (=> d!57367 (= (+!320 call!19727 (tuple2!3517 key!828 v!309)) lt!97331)))

(declare-fun b!195531 () Bool)

(declare-fun res!92256 () Bool)

(assert (=> b!195531 (=> (not res!92256) (not e!128639))))

(assert (=> b!195531 (= res!92256 (= (getValueByKey!244 (toList!1228 lt!97331) (_1!1769 (tuple2!3517 key!828 v!309))) (Some!249 (_2!1769 (tuple2!3517 key!828 v!309)))))))

(declare-fun b!195532 () Bool)

(declare-fun contains!1362 (List!2431 tuple2!3516) Bool)

(assert (=> b!195532 (= e!128639 (contains!1362 (toList!1228 lt!97331) (tuple2!3517 key!828 v!309)))))

(assert (= (and d!57367 res!92255) b!195531))

(assert (= (and b!195531 res!92256) b!195532))

(declare-fun m!222609 () Bool)

(assert (=> d!57367 m!222609))

(declare-fun m!222611 () Bool)

(assert (=> d!57367 m!222611))

(declare-fun m!222613 () Bool)

(assert (=> d!57367 m!222613))

(declare-fun m!222615 () Bool)

(assert (=> d!57367 m!222615))

(declare-fun m!222617 () Bool)

(assert (=> b!195531 m!222617))

(declare-fun m!222619 () Bool)

(assert (=> b!195532 m!222619))

(assert (=> b!195401 d!57367))

(declare-fun d!57369 () Bool)

(declare-fun e!128645 () Bool)

(assert (=> d!57369 e!128645))

(declare-fun res!92259 () Bool)

(assert (=> d!57369 (=> res!92259 e!128645)))

(declare-fun lt!97345 () Bool)

(assert (=> d!57369 (= res!92259 (not lt!97345))))

(declare-fun lt!97344 () Bool)

(assert (=> d!57369 (= lt!97345 lt!97344)))

(declare-fun lt!97342 () Unit!5883)

(declare-fun e!128644 () Unit!5883)

(assert (=> d!57369 (= lt!97342 e!128644)))

(declare-fun c!35397 () Bool)

(assert (=> d!57369 (= c!35397 lt!97344)))

(declare-fun containsKey!248 (List!2431 (_ BitVec 64)) Bool)

(assert (=> d!57369 (= lt!97344 (containsKey!248 (toList!1228 lt!97294) key!828))))

(assert (=> d!57369 (= (contains!1361 lt!97294 key!828) lt!97345)))

(declare-fun b!195539 () Bool)

(declare-fun lt!97343 () Unit!5883)

(assert (=> b!195539 (= e!128644 lt!97343)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!197 (List!2431 (_ BitVec 64)) Unit!5883)

(assert (=> b!195539 (= lt!97343 (lemmaContainsKeyImpliesGetValueByKeyDefined!197 (toList!1228 lt!97294) key!828))))

(declare-fun isDefined!198 (Option!250) Bool)

(assert (=> b!195539 (isDefined!198 (getValueByKey!244 (toList!1228 lt!97294) key!828))))

(declare-fun b!195540 () Bool)

(declare-fun Unit!5885 () Unit!5883)

(assert (=> b!195540 (= e!128644 Unit!5885)))

(declare-fun b!195541 () Bool)

(assert (=> b!195541 (= e!128645 (isDefined!198 (getValueByKey!244 (toList!1228 lt!97294) key!828)))))

(assert (= (and d!57369 c!35397) b!195539))

(assert (= (and d!57369 (not c!35397)) b!195540))

(assert (= (and d!57369 (not res!92259)) b!195541))

(declare-fun m!222621 () Bool)

(assert (=> d!57369 m!222621))

(declare-fun m!222623 () Bool)

(assert (=> b!195539 m!222623))

(declare-fun m!222625 () Bool)

(assert (=> b!195539 m!222625))

(assert (=> b!195539 m!222625))

(declare-fun m!222627 () Bool)

(assert (=> b!195539 m!222627))

(assert (=> b!195541 m!222625))

(assert (=> b!195541 m!222625))

(assert (=> b!195541 m!222627))

(assert (=> b!195394 d!57369))

(declare-fun d!57371 () Bool)

(assert (=> d!57371 (= (map!2014 thiss!1248) (getCurrentListMap!861 (_keys!5973 thiss!1248) (_values!3958 thiss!1248) (mask!9250 thiss!1248) (extraKeys!3712 thiss!1248) (zeroValue!3816 thiss!1248) (minValue!3816 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3975 thiss!1248)))))

(declare-fun bs!7787 () Bool)

(assert (= bs!7787 d!57371))

(declare-fun m!222629 () Bool)

(assert (=> bs!7787 m!222629))

(assert (=> bm!19725 d!57371))

(declare-fun mapIsEmpty!7810 () Bool)

(declare-fun mapRes!7810 () Bool)

(assert (=> mapIsEmpty!7810 mapRes!7810))

(declare-fun b!195549 () Bool)

(declare-fun e!128651 () Bool)

(assert (=> b!195549 (= e!128651 tp_is_empty!4501)))

(declare-fun condMapEmpty!7810 () Bool)

(declare-fun mapDefault!7810 () ValueCell!1907)

(assert (=> mapNonEmpty!7794 (= condMapEmpty!7810 (= mapRest!7794 ((as const (Array (_ BitVec 32) ValueCell!1907)) mapDefault!7810)))))

(assert (=> mapNonEmpty!7794 (= tp!17069 (and e!128651 mapRes!7810))))

(declare-fun mapNonEmpty!7810 () Bool)

(declare-fun tp!17098 () Bool)

(declare-fun e!128650 () Bool)

(assert (=> mapNonEmpty!7810 (= mapRes!7810 (and tp!17098 e!128650))))

(declare-fun mapRest!7810 () (Array (_ BitVec 32) ValueCell!1907))

(declare-fun mapValue!7810 () ValueCell!1907)

(declare-fun mapKey!7810 () (_ BitVec 32))

(assert (=> mapNonEmpty!7810 (= mapRest!7794 (store mapRest!7810 mapKey!7810 mapValue!7810))))

(declare-fun b!195548 () Bool)

(assert (=> b!195548 (= e!128650 tp_is_empty!4501)))

(assert (= (and mapNonEmpty!7794 condMapEmpty!7810) mapIsEmpty!7810))

(assert (= (and mapNonEmpty!7794 (not condMapEmpty!7810)) mapNonEmpty!7810))

(assert (= (and mapNonEmpty!7810 ((_ is ValueCellFull!1907) mapValue!7810)) b!195548))

(assert (= (and mapNonEmpty!7794 ((_ is ValueCellFull!1907) mapDefault!7810)) b!195549))

(declare-fun m!222631 () Bool)

(assert (=> mapNonEmpty!7810 m!222631))

(declare-fun mapIsEmpty!7811 () Bool)

(declare-fun mapRes!7811 () Bool)

(assert (=> mapIsEmpty!7811 mapRes!7811))

(declare-fun b!195551 () Bool)

(declare-fun e!128653 () Bool)

(assert (=> b!195551 (= e!128653 tp_is_empty!4501)))

(declare-fun condMapEmpty!7811 () Bool)

(declare-fun mapDefault!7811 () ValueCell!1907)

(assert (=> mapNonEmpty!7795 (= condMapEmpty!7811 (= mapRest!7795 ((as const (Array (_ BitVec 32) ValueCell!1907)) mapDefault!7811)))))

(assert (=> mapNonEmpty!7795 (= tp!17071 (and e!128653 mapRes!7811))))

(declare-fun mapNonEmpty!7811 () Bool)

(declare-fun tp!17099 () Bool)

(declare-fun e!128652 () Bool)

(assert (=> mapNonEmpty!7811 (= mapRes!7811 (and tp!17099 e!128652))))

(declare-fun mapValue!7811 () ValueCell!1907)

(declare-fun mapKey!7811 () (_ BitVec 32))

(declare-fun mapRest!7811 () (Array (_ BitVec 32) ValueCell!1907))

(assert (=> mapNonEmpty!7811 (= mapRest!7795 (store mapRest!7811 mapKey!7811 mapValue!7811))))

(declare-fun b!195550 () Bool)

(assert (=> b!195550 (= e!128652 tp_is_empty!4501)))

(assert (= (and mapNonEmpty!7795 condMapEmpty!7811) mapIsEmpty!7811))

(assert (= (and mapNonEmpty!7795 (not condMapEmpty!7811)) mapNonEmpty!7811))

(assert (= (and mapNonEmpty!7811 ((_ is ValueCellFull!1907) mapValue!7811)) b!195550))

(assert (= (and mapNonEmpty!7795 ((_ is ValueCellFull!1907) mapDefault!7811)) b!195551))

(declare-fun m!222633 () Bool)

(assert (=> mapNonEmpty!7811 m!222633))

(check-sat b_and!11451 (not d!57353) (not b!195523) b_and!11449 tp_is_empty!4501 (not b!195531) (not b!195521) (not b!195524) (not d!57363) (not b_next!4731) (not b!195525) (not b!195541) (not d!57369) (not b!195522) (not d!57371) (not b!195510) (not d!57365) (not b!195539) (not b!195526) (not d!57351) (not b_next!4729) (not mapNonEmpty!7811) (not d!57367) (not b!195532) (not mapNonEmpty!7810))
(check-sat b_and!11449 b_and!11451 (not b_next!4731) (not b_next!4729))
