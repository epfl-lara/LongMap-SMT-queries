; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23794 () Bool)

(assert start!23794)

(declare-fun b!249734 () Bool)

(declare-fun b_free!6619 () Bool)

(declare-fun b_next!6619 () Bool)

(assert (=> b!249734 (= b_free!6619 (not b_next!6619))))

(declare-fun tp!23117 () Bool)

(declare-fun b_and!13647 () Bool)

(assert (=> b!249734 (= tp!23117 b_and!13647)))

(declare-fun b!249724 () Bool)

(declare-datatypes ((Unit!7701 0))(
  ( (Unit!7702) )
))
(declare-fun e!161959 () Unit!7701)

(declare-fun Unit!7703 () Unit!7701)

(assert (=> b!249724 (= e!161959 Unit!7703)))

(declare-fun lt!125133 () Unit!7701)

(declare-datatypes ((V!8289 0))(
  ( (V!8290 (val!3285 Int)) )
))
(declare-datatypes ((ValueCell!2897 0))(
  ( (ValueCellFull!2897 (v!5349 V!8289)) (EmptyCell!2897) )
))
(declare-datatypes ((array!12275 0))(
  ( (array!12276 (arr!5821 (Array (_ BitVec 32) ValueCell!2897)) (size!6165 (_ BitVec 32))) )
))
(declare-datatypes ((array!12277 0))(
  ( (array!12278 (arr!5822 (Array (_ BitVec 32) (_ BitVec 64))) (size!6166 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3694 0))(
  ( (LongMapFixedSize!3695 (defaultEntry!4616 Int) (mask!10788 (_ BitVec 32)) (extraKeys!4353 (_ BitVec 32)) (zeroValue!4457 V!8289) (minValue!4457 V!8289) (_size!1896 (_ BitVec 32)) (_keys!6748 array!12277) (_values!4599 array!12275) (_vacant!1896 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3694)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!210 (array!12277 array!12275 (_ BitVec 32) (_ BitVec 32) V!8289 V!8289 (_ BitVec 64) (_ BitVec 32) Int) Unit!7701)

(assert (=> b!249724 (= lt!125133 (lemmaArrayContainsKeyThenInListMap!210 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)))))

(assert (=> b!249724 false))

(declare-fun b!249725 () Bool)

(declare-fun e!161958 () Bool)

(declare-fun e!161967 () Bool)

(assert (=> b!249725 (= e!161958 e!161967)))

(declare-fun res!122334 () Bool)

(assert (=> b!249725 (=> (not res!122334) (not e!161967))))

(declare-datatypes ((SeekEntryResult!1084 0))(
  ( (MissingZero!1084 (index!6506 (_ BitVec 32))) (Found!1084 (index!6507 (_ BitVec 32))) (Intermediate!1084 (undefined!1896 Bool) (index!6508 (_ BitVec 32)) (x!24608 (_ BitVec 32))) (Undefined!1084) (MissingVacant!1084 (index!6509 (_ BitVec 32))) )
))
(declare-fun lt!125130 () SeekEntryResult!1084)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!249725 (= res!122334 (or (= lt!125130 (MissingZero!1084 index!297)) (= lt!125130 (MissingVacant!1084 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12277 (_ BitVec 32)) SeekEntryResult!1084)

(assert (=> b!249725 (= lt!125130 (seekEntryOrOpen!0 key!932 (_keys!6748 thiss!1504) (mask!10788 thiss!1504)))))

(declare-fun b!249726 () Bool)

(declare-fun e!161960 () Bool)

(assert (=> b!249726 (= e!161967 e!161960)))

(declare-fun res!122339 () Bool)

(assert (=> b!249726 (=> (not res!122339) (not e!161960))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!249726 (= res!122339 (inRange!0 index!297 (mask!10788 thiss!1504)))))

(declare-fun lt!125126 () Unit!7701)

(declare-fun e!161966 () Unit!7701)

(assert (=> b!249726 (= lt!125126 e!161966)))

(declare-fun c!41918 () Bool)

(declare-datatypes ((tuple2!4760 0))(
  ( (tuple2!4761 (_1!2391 (_ BitVec 64)) (_2!2391 V!8289)) )
))
(declare-datatypes ((List!3637 0))(
  ( (Nil!3634) (Cons!3633 (h!4292 tuple2!4760) (t!8660 List!3637)) )
))
(declare-datatypes ((ListLongMap!3675 0))(
  ( (ListLongMap!3676 (toList!1853 List!3637)) )
))
(declare-fun contains!1788 (ListLongMap!3675 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1385 (array!12277 array!12275 (_ BitVec 32) (_ BitVec 32) V!8289 V!8289 (_ BitVec 32) Int) ListLongMap!3675)

(assert (=> b!249726 (= c!41918 (contains!1788 (getCurrentListMap!1385 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)) key!932))))

(declare-fun b!249727 () Bool)

(declare-fun e!161964 () Bool)

(declare-fun tp_is_empty!6481 () Bool)

(assert (=> b!249727 (= e!161964 tp_is_empty!6481)))

(declare-fun b!249728 () Bool)

(declare-fun c!41919 () Bool)

(get-info :version)

(assert (=> b!249728 (= c!41919 ((_ is MissingVacant!1084) lt!125130))))

(declare-fun e!161969 () Bool)

(declare-fun e!161956 () Bool)

(assert (=> b!249728 (= e!161969 e!161956)))

(declare-fun b!249729 () Bool)

(declare-fun e!161970 () Bool)

(assert (=> b!249729 (= e!161970 tp_is_empty!6481)))

(declare-fun mapIsEmpty!11010 () Bool)

(declare-fun mapRes!11010 () Bool)

(assert (=> mapIsEmpty!11010 mapRes!11010))

(declare-fun bm!23430 () Bool)

(declare-fun call!23434 () Bool)

(declare-fun arrayContainsKey!0 (array!12277 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!23430 (= call!23434 (arrayContainsKey!0 (_keys!6748 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun res!122333 () Bool)

(assert (=> start!23794 (=> (not res!122333) (not e!161958))))

(declare-fun valid!1454 (LongMapFixedSize!3694) Bool)

(assert (=> start!23794 (= res!122333 (valid!1454 thiss!1504))))

(assert (=> start!23794 e!161958))

(declare-fun e!161963 () Bool)

(assert (=> start!23794 e!161963))

(assert (=> start!23794 true))

(declare-fun bm!23431 () Bool)

(declare-fun c!41920 () Bool)

(declare-fun call!23433 () Bool)

(assert (=> bm!23431 (= call!23433 (inRange!0 (ite c!41920 (index!6506 lt!125130) (index!6509 lt!125130)) (mask!10788 thiss!1504)))))

(declare-fun b!249730 () Bool)

(declare-fun Unit!7704 () Unit!7701)

(assert (=> b!249730 (= e!161966 Unit!7704)))

(declare-fun lt!125129 () Unit!7701)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!389 (array!12277 array!12275 (_ BitVec 32) (_ BitVec 32) V!8289 V!8289 (_ BitVec 64) Int) Unit!7701)

(assert (=> b!249730 (= lt!125129 (lemmaInListMapThenSeekEntryOrOpenFindsIt!389 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) key!932 (defaultEntry!4616 thiss!1504)))))

(assert (=> b!249730 false))

(declare-fun b!249731 () Bool)

(declare-fun e!161962 () Bool)

(assert (=> b!249731 (= e!161956 e!161962)))

(declare-fun res!122338 () Bool)

(assert (=> b!249731 (= res!122338 call!23433)))

(assert (=> b!249731 (=> (not res!122338) (not e!161962))))

(declare-fun b!249732 () Bool)

(declare-fun lt!125131 () Unit!7701)

(assert (=> b!249732 (= e!161966 lt!125131)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!386 (array!12277 array!12275 (_ BitVec 32) (_ BitVec 32) V!8289 V!8289 (_ BitVec 64) Int) Unit!7701)

(assert (=> b!249732 (= lt!125131 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!386 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) key!932 (defaultEntry!4616 thiss!1504)))))

(assert (=> b!249732 (= c!41920 ((_ is MissingZero!1084) lt!125130))))

(assert (=> b!249732 e!161969))

(declare-fun b!249733 () Bool)

(declare-fun res!122341 () Bool)

(declare-fun e!161968 () Bool)

(assert (=> b!249733 (=> (not res!122341) (not e!161968))))

(assert (=> b!249733 (= res!122341 call!23433)))

(assert (=> b!249733 (= e!161969 e!161968)))

(declare-fun e!161957 () Bool)

(declare-fun array_inv!3829 (array!12277) Bool)

(declare-fun array_inv!3830 (array!12275) Bool)

(assert (=> b!249734 (= e!161963 (and tp!23117 tp_is_empty!6481 (array_inv!3829 (_keys!6748 thiss!1504)) (array_inv!3830 (_values!4599 thiss!1504)) e!161957))))

(declare-fun b!249735 () Bool)

(declare-fun res!122336 () Bool)

(assert (=> b!249735 (=> (not res!122336) (not e!161968))))

(assert (=> b!249735 (= res!122336 (= (select (arr!5822 (_keys!6748 thiss!1504)) (index!6506 lt!125130)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!249736 () Bool)

(declare-fun e!161965 () Bool)

(assert (=> b!249736 (= e!161965 (or (not (= (size!6165 (_values!4599 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10788 thiss!1504)))) (= (size!6166 (_keys!6748 thiss!1504)) (size!6165 (_values!4599 thiss!1504)))))))

(declare-fun b!249737 () Bool)

(assert (=> b!249737 (= e!161957 (and e!161970 mapRes!11010))))

(declare-fun condMapEmpty!11010 () Bool)

(declare-fun mapDefault!11010 () ValueCell!2897)

(assert (=> b!249737 (= condMapEmpty!11010 (= (arr!5821 (_values!4599 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2897)) mapDefault!11010)))))

(declare-fun b!249738 () Bool)

(assert (=> b!249738 (= e!161968 (not call!23434))))

(declare-fun b!249739 () Bool)

(declare-fun res!122337 () Bool)

(assert (=> b!249739 (= res!122337 (= (select (arr!5822 (_keys!6748 thiss!1504)) (index!6509 lt!125130)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!249739 (=> (not res!122337) (not e!161962))))

(declare-fun b!249740 () Bool)

(declare-fun Unit!7705 () Unit!7701)

(assert (=> b!249740 (= e!161959 Unit!7705)))

(declare-fun b!249741 () Bool)

(assert (=> b!249741 (= e!161962 (not call!23434))))

(declare-fun mapNonEmpty!11010 () Bool)

(declare-fun tp!23118 () Bool)

(assert (=> mapNonEmpty!11010 (= mapRes!11010 (and tp!23118 e!161964))))

(declare-fun mapValue!11010 () ValueCell!2897)

(declare-fun mapKey!11010 () (_ BitVec 32))

(declare-fun mapRest!11010 () (Array (_ BitVec 32) ValueCell!2897))

(assert (=> mapNonEmpty!11010 (= (arr!5821 (_values!4599 thiss!1504)) (store mapRest!11010 mapKey!11010 mapValue!11010))))

(declare-fun b!249742 () Bool)

(declare-fun res!122335 () Bool)

(assert (=> b!249742 (=> (not res!122335) (not e!161958))))

(assert (=> b!249742 (= res!122335 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!249743 () Bool)

(assert (=> b!249743 (= e!161960 (not e!161965))))

(declare-fun res!122340 () Bool)

(assert (=> b!249743 (=> res!122340 e!161965)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!249743 (= res!122340 (not (validMask!0 (mask!10788 thiss!1504))))))

(declare-fun lt!125128 () array!12277)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12277 (_ BitVec 32)) Bool)

(assert (=> b!249743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!125128 (mask!10788 thiss!1504))))

(declare-fun lt!125127 () Unit!7701)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12277 (_ BitVec 32) (_ BitVec 32)) Unit!7701)

(assert (=> b!249743 (= lt!125127 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6748 thiss!1504) index!297 (mask!10788 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12277 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!249743 (= (arrayCountValidKeys!0 lt!125128 #b00000000000000000000000000000000 (size!6166 (_keys!6748 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6748 thiss!1504) #b00000000000000000000000000000000 (size!6166 (_keys!6748 thiss!1504)))))))

(declare-fun lt!125132 () Unit!7701)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12277 (_ BitVec 32) (_ BitVec 64)) Unit!7701)

(assert (=> b!249743 (= lt!125132 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6748 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3638 0))(
  ( (Nil!3635) (Cons!3634 (h!4293 (_ BitVec 64)) (t!8661 List!3638)) )
))
(declare-fun arrayNoDuplicates!0 (array!12277 (_ BitVec 32) List!3638) Bool)

(assert (=> b!249743 (arrayNoDuplicates!0 lt!125128 #b00000000000000000000000000000000 Nil!3635)))

(assert (=> b!249743 (= lt!125128 (array!12278 (store (arr!5822 (_keys!6748 thiss!1504)) index!297 key!932) (size!6166 (_keys!6748 thiss!1504))))))

(declare-fun lt!125135 () Unit!7701)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12277 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3638) Unit!7701)

(assert (=> b!249743 (= lt!125135 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6748 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3635))))

(declare-fun lt!125134 () Unit!7701)

(assert (=> b!249743 (= lt!125134 e!161959)))

(declare-fun c!41917 () Bool)

(assert (=> b!249743 (= c!41917 (arrayContainsKey!0 (_keys!6748 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!249744 () Bool)

(assert (=> b!249744 (= e!161956 ((_ is Undefined!1084) lt!125130))))

(assert (= (and start!23794 res!122333) b!249742))

(assert (= (and b!249742 res!122335) b!249725))

(assert (= (and b!249725 res!122334) b!249726))

(assert (= (and b!249726 c!41918) b!249730))

(assert (= (and b!249726 (not c!41918)) b!249732))

(assert (= (and b!249732 c!41920) b!249733))

(assert (= (and b!249732 (not c!41920)) b!249728))

(assert (= (and b!249733 res!122341) b!249735))

(assert (= (and b!249735 res!122336) b!249738))

(assert (= (and b!249728 c!41919) b!249731))

(assert (= (and b!249728 (not c!41919)) b!249744))

(assert (= (and b!249731 res!122338) b!249739))

(assert (= (and b!249739 res!122337) b!249741))

(assert (= (or b!249733 b!249731) bm!23431))

(assert (= (or b!249738 b!249741) bm!23430))

(assert (= (and b!249726 res!122339) b!249743))

(assert (= (and b!249743 c!41917) b!249724))

(assert (= (and b!249743 (not c!41917)) b!249740))

(assert (= (and b!249743 (not res!122340)) b!249736))

(assert (= (and b!249737 condMapEmpty!11010) mapIsEmpty!11010))

(assert (= (and b!249737 (not condMapEmpty!11010)) mapNonEmpty!11010))

(assert (= (and mapNonEmpty!11010 ((_ is ValueCellFull!2897) mapValue!11010)) b!249727))

(assert (= (and b!249737 ((_ is ValueCellFull!2897) mapDefault!11010)) b!249729))

(assert (= b!249734 b!249737))

(assert (= start!23794 b!249734))

(declare-fun m!266377 () Bool)

(assert (=> bm!23430 m!266377))

(declare-fun m!266379 () Bool)

(assert (=> b!249743 m!266379))

(assert (=> b!249743 m!266377))

(declare-fun m!266381 () Bool)

(assert (=> b!249743 m!266381))

(declare-fun m!266383 () Bool)

(assert (=> b!249743 m!266383))

(declare-fun m!266385 () Bool)

(assert (=> b!249743 m!266385))

(declare-fun m!266387 () Bool)

(assert (=> b!249743 m!266387))

(declare-fun m!266389 () Bool)

(assert (=> b!249743 m!266389))

(declare-fun m!266391 () Bool)

(assert (=> b!249743 m!266391))

(declare-fun m!266393 () Bool)

(assert (=> b!249743 m!266393))

(declare-fun m!266395 () Bool)

(assert (=> b!249743 m!266395))

(declare-fun m!266397 () Bool)

(assert (=> b!249724 m!266397))

(declare-fun m!266399 () Bool)

(assert (=> start!23794 m!266399))

(declare-fun m!266401 () Bool)

(assert (=> b!249730 m!266401))

(declare-fun m!266403 () Bool)

(assert (=> b!249734 m!266403))

(declare-fun m!266405 () Bool)

(assert (=> b!249734 m!266405))

(declare-fun m!266407 () Bool)

(assert (=> b!249732 m!266407))

(declare-fun m!266409 () Bool)

(assert (=> mapNonEmpty!11010 m!266409))

(declare-fun m!266411 () Bool)

(assert (=> b!249726 m!266411))

(declare-fun m!266413 () Bool)

(assert (=> b!249726 m!266413))

(assert (=> b!249726 m!266413))

(declare-fun m!266415 () Bool)

(assert (=> b!249726 m!266415))

(declare-fun m!266417 () Bool)

(assert (=> b!249725 m!266417))

(declare-fun m!266419 () Bool)

(assert (=> b!249735 m!266419))

(declare-fun m!266421 () Bool)

(assert (=> b!249739 m!266421))

(declare-fun m!266423 () Bool)

(assert (=> bm!23431 m!266423))

(check-sat (not b_next!6619) (not start!23794) (not b!249734) (not b!249725) (not mapNonEmpty!11010) (not b!249732) (not b!249730) (not b!249726) (not b!249724) b_and!13647 tp_is_empty!6481 (not b!249743) (not bm!23430) (not bm!23431))
(check-sat b_and!13647 (not b_next!6619))
(get-model)

(declare-fun d!60845 () Bool)

(declare-fun e!162063 () Bool)

(assert (=> d!60845 e!162063))

(declare-fun res!122401 () Bool)

(assert (=> d!60845 (=> (not res!122401) (not e!162063))))

(declare-fun lt!125201 () SeekEntryResult!1084)

(assert (=> d!60845 (= res!122401 ((_ is Found!1084) lt!125201))))

(assert (=> d!60845 (= lt!125201 (seekEntryOrOpen!0 key!932 (_keys!6748 thiss!1504) (mask!10788 thiss!1504)))))

(declare-fun lt!125200 () Unit!7701)

(declare-fun choose!1186 (array!12277 array!12275 (_ BitVec 32) (_ BitVec 32) V!8289 V!8289 (_ BitVec 64) Int) Unit!7701)

(assert (=> d!60845 (= lt!125200 (choose!1186 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) key!932 (defaultEntry!4616 thiss!1504)))))

(assert (=> d!60845 (validMask!0 (mask!10788 thiss!1504))))

(assert (=> d!60845 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!389 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) key!932 (defaultEntry!4616 thiss!1504)) lt!125200)))

(declare-fun b!249875 () Bool)

(declare-fun res!122400 () Bool)

(assert (=> b!249875 (=> (not res!122400) (not e!162063))))

(assert (=> b!249875 (= res!122400 (inRange!0 (index!6507 lt!125201) (mask!10788 thiss!1504)))))

(declare-fun b!249876 () Bool)

(assert (=> b!249876 (= e!162063 (= (select (arr!5822 (_keys!6748 thiss!1504)) (index!6507 lt!125201)) key!932))))

(assert (=> b!249876 (and (bvsge (index!6507 lt!125201) #b00000000000000000000000000000000) (bvslt (index!6507 lt!125201) (size!6166 (_keys!6748 thiss!1504))))))

(assert (= (and d!60845 res!122401) b!249875))

(assert (= (and b!249875 res!122400) b!249876))

(assert (=> d!60845 m!266417))

(declare-fun m!266521 () Bool)

(assert (=> d!60845 m!266521))

(assert (=> d!60845 m!266379))

(declare-fun m!266523 () Bool)

(assert (=> b!249875 m!266523))

(declare-fun m!266525 () Bool)

(assert (=> b!249876 m!266525))

(assert (=> b!249730 d!60845))

(declare-fun d!60847 () Bool)

(declare-fun e!162075 () Bool)

(assert (=> d!60847 e!162075))

(declare-fun c!41950 () Bool)

(declare-fun lt!125206 () SeekEntryResult!1084)

(assert (=> d!60847 (= c!41950 ((_ is MissingZero!1084) lt!125206))))

(assert (=> d!60847 (= lt!125206 (seekEntryOrOpen!0 key!932 (_keys!6748 thiss!1504) (mask!10788 thiss!1504)))))

(declare-fun lt!125207 () Unit!7701)

(declare-fun choose!1187 (array!12277 array!12275 (_ BitVec 32) (_ BitVec 32) V!8289 V!8289 (_ BitVec 64) Int) Unit!7701)

(assert (=> d!60847 (= lt!125207 (choose!1187 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) key!932 (defaultEntry!4616 thiss!1504)))))

(assert (=> d!60847 (validMask!0 (mask!10788 thiss!1504))))

(assert (=> d!60847 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!386 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) key!932 (defaultEntry!4616 thiss!1504)) lt!125207)))

(declare-fun b!249893 () Bool)

(declare-fun res!122413 () Bool)

(declare-fun e!162073 () Bool)

(assert (=> b!249893 (=> (not res!122413) (not e!162073))))

(declare-fun call!23452 () Bool)

(assert (=> b!249893 (= res!122413 call!23452)))

(declare-fun e!162072 () Bool)

(assert (=> b!249893 (= e!162072 e!162073)))

(declare-fun b!249894 () Bool)

(declare-fun e!162074 () Bool)

(assert (=> b!249894 (= e!162075 e!162074)))

(declare-fun res!122412 () Bool)

(assert (=> b!249894 (= res!122412 call!23452)))

(assert (=> b!249894 (=> (not res!122412) (not e!162074))))

(declare-fun bm!23448 () Bool)

(declare-fun call!23451 () Bool)

(assert (=> bm!23448 (= call!23451 (arrayContainsKey!0 (_keys!6748 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!249895 () Bool)

(assert (=> b!249895 (= e!162072 ((_ is Undefined!1084) lt!125206))))

(declare-fun b!249896 () Bool)

(assert (=> b!249896 (= e!162074 (not call!23451))))

(declare-fun b!249897 () Bool)

(declare-fun res!122410 () Bool)

(assert (=> b!249897 (=> (not res!122410) (not e!162073))))

(assert (=> b!249897 (= res!122410 (= (select (arr!5822 (_keys!6748 thiss!1504)) (index!6509 lt!125206)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!249897 (and (bvsge (index!6509 lt!125206) #b00000000000000000000000000000000) (bvslt (index!6509 lt!125206) (size!6166 (_keys!6748 thiss!1504))))))

(declare-fun b!249898 () Bool)

(assert (=> b!249898 (and (bvsge (index!6506 lt!125206) #b00000000000000000000000000000000) (bvslt (index!6506 lt!125206) (size!6166 (_keys!6748 thiss!1504))))))

(declare-fun res!122411 () Bool)

(assert (=> b!249898 (= res!122411 (= (select (arr!5822 (_keys!6748 thiss!1504)) (index!6506 lt!125206)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!249898 (=> (not res!122411) (not e!162074))))

(declare-fun bm!23449 () Bool)

(assert (=> bm!23449 (= call!23452 (inRange!0 (ite c!41950 (index!6506 lt!125206) (index!6509 lt!125206)) (mask!10788 thiss!1504)))))

(declare-fun b!249899 () Bool)

(assert (=> b!249899 (= e!162075 e!162072)))

(declare-fun c!41949 () Bool)

(assert (=> b!249899 (= c!41949 ((_ is MissingVacant!1084) lt!125206))))

(declare-fun b!249900 () Bool)

(assert (=> b!249900 (= e!162073 (not call!23451))))

(assert (= (and d!60847 c!41950) b!249894))

(assert (= (and d!60847 (not c!41950)) b!249899))

(assert (= (and b!249894 res!122412) b!249898))

(assert (= (and b!249898 res!122411) b!249896))

(assert (= (and b!249899 c!41949) b!249893))

(assert (= (and b!249899 (not c!41949)) b!249895))

(assert (= (and b!249893 res!122413) b!249897))

(assert (= (and b!249897 res!122410) b!249900))

(assert (= (or b!249894 b!249893) bm!23449))

(assert (= (or b!249896 b!249900) bm!23448))

(assert (=> bm!23448 m!266377))

(assert (=> d!60847 m!266417))

(declare-fun m!266527 () Bool)

(assert (=> d!60847 m!266527))

(assert (=> d!60847 m!266379))

(declare-fun m!266529 () Bool)

(assert (=> b!249898 m!266529))

(declare-fun m!266531 () Bool)

(assert (=> bm!23449 m!266531))

(declare-fun m!266533 () Bool)

(assert (=> b!249897 m!266533))

(assert (=> b!249732 d!60847))

(declare-fun d!60849 () Bool)

(declare-fun res!122420 () Bool)

(declare-fun e!162078 () Bool)

(assert (=> d!60849 (=> (not res!122420) (not e!162078))))

(declare-fun simpleValid!262 (LongMapFixedSize!3694) Bool)

(assert (=> d!60849 (= res!122420 (simpleValid!262 thiss!1504))))

(assert (=> d!60849 (= (valid!1454 thiss!1504) e!162078)))

(declare-fun b!249907 () Bool)

(declare-fun res!122421 () Bool)

(assert (=> b!249907 (=> (not res!122421) (not e!162078))))

(assert (=> b!249907 (= res!122421 (= (arrayCountValidKeys!0 (_keys!6748 thiss!1504) #b00000000000000000000000000000000 (size!6166 (_keys!6748 thiss!1504))) (_size!1896 thiss!1504)))))

(declare-fun b!249908 () Bool)

(declare-fun res!122422 () Bool)

(assert (=> b!249908 (=> (not res!122422) (not e!162078))))

(assert (=> b!249908 (= res!122422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6748 thiss!1504) (mask!10788 thiss!1504)))))

(declare-fun b!249909 () Bool)

(assert (=> b!249909 (= e!162078 (arrayNoDuplicates!0 (_keys!6748 thiss!1504) #b00000000000000000000000000000000 Nil!3635))))

(assert (= (and d!60849 res!122420) b!249907))

(assert (= (and b!249907 res!122421) b!249908))

(assert (= (and b!249908 res!122422) b!249909))

(declare-fun m!266535 () Bool)

(assert (=> d!60849 m!266535))

(assert (=> b!249907 m!266391))

(declare-fun m!266537 () Bool)

(assert (=> b!249908 m!266537))

(declare-fun m!266539 () Bool)

(assert (=> b!249909 m!266539))

(assert (=> start!23794 d!60849))

(declare-fun d!60851 () Bool)

(assert (=> d!60851 (contains!1788 (getCurrentListMap!1385 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)) key!932)))

(declare-fun lt!125210 () Unit!7701)

(declare-fun choose!1188 (array!12277 array!12275 (_ BitVec 32) (_ BitVec 32) V!8289 V!8289 (_ BitVec 64) (_ BitVec 32) Int) Unit!7701)

(assert (=> d!60851 (= lt!125210 (choose!1188 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)))))

(assert (=> d!60851 (validMask!0 (mask!10788 thiss!1504))))

(assert (=> d!60851 (= (lemmaArrayContainsKeyThenInListMap!210 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)) lt!125210)))

(declare-fun bs!8982 () Bool)

(assert (= bs!8982 d!60851))

(assert (=> bs!8982 m!266413))

(assert (=> bs!8982 m!266413))

(assert (=> bs!8982 m!266415))

(declare-fun m!266541 () Bool)

(assert (=> bs!8982 m!266541))

(assert (=> bs!8982 m!266379))

(assert (=> b!249724 d!60851))

(declare-fun b!249921 () Bool)

(declare-fun e!162084 () Bool)

(assert (=> b!249921 (= e!162084 (= (arrayCountValidKeys!0 (array!12278 (store (arr!5822 (_keys!6748 thiss!1504)) index!297 key!932) (size!6166 (_keys!6748 thiss!1504))) #b00000000000000000000000000000000 (size!6166 (_keys!6748 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6748 thiss!1504) #b00000000000000000000000000000000 (size!6166 (_keys!6748 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!249920 () Bool)

(declare-fun e!162083 () Bool)

(assert (=> b!249920 (= e!162083 (bvslt (size!6166 (_keys!6748 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!249919 () Bool)

(declare-fun res!122431 () Bool)

(assert (=> b!249919 (=> (not res!122431) (not e!162083))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!249919 (= res!122431 (validKeyInArray!0 key!932))))

(declare-fun b!249918 () Bool)

(declare-fun res!122432 () Bool)

(assert (=> b!249918 (=> (not res!122432) (not e!162083))))

(assert (=> b!249918 (= res!122432 (not (validKeyInArray!0 (select (arr!5822 (_keys!6748 thiss!1504)) index!297))))))

(declare-fun d!60853 () Bool)

(assert (=> d!60853 e!162084))

(declare-fun res!122433 () Bool)

(assert (=> d!60853 (=> (not res!122433) (not e!162084))))

(assert (=> d!60853 (= res!122433 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6166 (_keys!6748 thiss!1504)))))))

(declare-fun lt!125213 () Unit!7701)

(declare-fun choose!1 (array!12277 (_ BitVec 32) (_ BitVec 64)) Unit!7701)

(assert (=> d!60853 (= lt!125213 (choose!1 (_keys!6748 thiss!1504) index!297 key!932))))

(assert (=> d!60853 e!162083))

(declare-fun res!122434 () Bool)

(assert (=> d!60853 (=> (not res!122434) (not e!162083))))

(assert (=> d!60853 (= res!122434 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6166 (_keys!6748 thiss!1504)))))))

(assert (=> d!60853 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6748 thiss!1504) index!297 key!932) lt!125213)))

(assert (= (and d!60853 res!122434) b!249918))

(assert (= (and b!249918 res!122432) b!249919))

(assert (= (and b!249919 res!122431) b!249920))

(assert (= (and d!60853 res!122433) b!249921))

(assert (=> b!249921 m!266389))

(declare-fun m!266543 () Bool)

(assert (=> b!249921 m!266543))

(assert (=> b!249921 m!266391))

(declare-fun m!266545 () Bool)

(assert (=> b!249919 m!266545))

(declare-fun m!266547 () Bool)

(assert (=> b!249918 m!266547))

(assert (=> b!249918 m!266547))

(declare-fun m!266549 () Bool)

(assert (=> b!249918 m!266549))

(declare-fun m!266551 () Bool)

(assert (=> d!60853 m!266551))

(assert (=> b!249743 d!60853))

(declare-fun b!249930 () Bool)

(declare-fun e!162093 () Bool)

(declare-fun call!23455 () Bool)

(assert (=> b!249930 (= e!162093 call!23455)))

(declare-fun b!249931 () Bool)

(declare-fun e!162091 () Bool)

(assert (=> b!249931 (= e!162091 call!23455)))

(declare-fun d!60855 () Bool)

(declare-fun res!122440 () Bool)

(declare-fun e!162092 () Bool)

(assert (=> d!60855 (=> res!122440 e!162092)))

(assert (=> d!60855 (= res!122440 (bvsge #b00000000000000000000000000000000 (size!6166 lt!125128)))))

(assert (=> d!60855 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!125128 (mask!10788 thiss!1504)) e!162092)))

(declare-fun bm!23452 () Bool)

(assert (=> bm!23452 (= call!23455 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!125128 (mask!10788 thiss!1504)))))

(declare-fun b!249932 () Bool)

(assert (=> b!249932 (= e!162093 e!162091)))

(declare-fun lt!125220 () (_ BitVec 64))

(assert (=> b!249932 (= lt!125220 (select (arr!5822 lt!125128) #b00000000000000000000000000000000))))

(declare-fun lt!125222 () Unit!7701)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12277 (_ BitVec 64) (_ BitVec 32)) Unit!7701)

(assert (=> b!249932 (= lt!125222 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!125128 lt!125220 #b00000000000000000000000000000000))))

(assert (=> b!249932 (arrayContainsKey!0 lt!125128 lt!125220 #b00000000000000000000000000000000)))

(declare-fun lt!125221 () Unit!7701)

(assert (=> b!249932 (= lt!125221 lt!125222)))

(declare-fun res!122439 () Bool)

(assert (=> b!249932 (= res!122439 (= (seekEntryOrOpen!0 (select (arr!5822 lt!125128) #b00000000000000000000000000000000) lt!125128 (mask!10788 thiss!1504)) (Found!1084 #b00000000000000000000000000000000)))))

(assert (=> b!249932 (=> (not res!122439) (not e!162091))))

(declare-fun b!249933 () Bool)

(assert (=> b!249933 (= e!162092 e!162093)))

(declare-fun c!41953 () Bool)

(assert (=> b!249933 (= c!41953 (validKeyInArray!0 (select (arr!5822 lt!125128) #b00000000000000000000000000000000)))))

(assert (= (and d!60855 (not res!122440)) b!249933))

(assert (= (and b!249933 c!41953) b!249932))

(assert (= (and b!249933 (not c!41953)) b!249930))

(assert (= (and b!249932 res!122439) b!249931))

(assert (= (or b!249931 b!249930) bm!23452))

(declare-fun m!266553 () Bool)

(assert (=> bm!23452 m!266553))

(declare-fun m!266555 () Bool)

(assert (=> b!249932 m!266555))

(declare-fun m!266557 () Bool)

(assert (=> b!249932 m!266557))

(declare-fun m!266559 () Bool)

(assert (=> b!249932 m!266559))

(assert (=> b!249932 m!266555))

(declare-fun m!266561 () Bool)

(assert (=> b!249932 m!266561))

(assert (=> b!249933 m!266555))

(assert (=> b!249933 m!266555))

(declare-fun m!266563 () Bool)

(assert (=> b!249933 m!266563))

(assert (=> b!249743 d!60855))

(declare-fun d!60857 () Bool)

(declare-fun lt!125225 () (_ BitVec 32))

(assert (=> d!60857 (and (bvsge lt!125225 #b00000000000000000000000000000000) (bvsle lt!125225 (bvsub (size!6166 lt!125128) #b00000000000000000000000000000000)))))

(declare-fun e!162098 () (_ BitVec 32))

(assert (=> d!60857 (= lt!125225 e!162098)))

(declare-fun c!41959 () Bool)

(assert (=> d!60857 (= c!41959 (bvsge #b00000000000000000000000000000000 (size!6166 (_keys!6748 thiss!1504))))))

(assert (=> d!60857 (and (bvsle #b00000000000000000000000000000000 (size!6166 (_keys!6748 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6166 (_keys!6748 thiss!1504)) (size!6166 lt!125128)))))

(assert (=> d!60857 (= (arrayCountValidKeys!0 lt!125128 #b00000000000000000000000000000000 (size!6166 (_keys!6748 thiss!1504))) lt!125225)))

(declare-fun b!249942 () Bool)

(declare-fun e!162099 () (_ BitVec 32))

(declare-fun call!23458 () (_ BitVec 32))

(assert (=> b!249942 (= e!162099 call!23458)))

(declare-fun b!249943 () Bool)

(assert (=> b!249943 (= e!162098 e!162099)))

(declare-fun c!41958 () Bool)

(assert (=> b!249943 (= c!41958 (validKeyInArray!0 (select (arr!5822 lt!125128) #b00000000000000000000000000000000)))))

(declare-fun b!249944 () Bool)

(assert (=> b!249944 (= e!162098 #b00000000000000000000000000000000)))

(declare-fun bm!23455 () Bool)

(assert (=> bm!23455 (= call!23458 (arrayCountValidKeys!0 lt!125128 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6166 (_keys!6748 thiss!1504))))))

(declare-fun b!249945 () Bool)

(assert (=> b!249945 (= e!162099 (bvadd #b00000000000000000000000000000001 call!23458))))

(assert (= (and d!60857 c!41959) b!249944))

(assert (= (and d!60857 (not c!41959)) b!249943))

(assert (= (and b!249943 c!41958) b!249945))

(assert (= (and b!249943 (not c!41958)) b!249942))

(assert (= (or b!249945 b!249942) bm!23455))

(assert (=> b!249943 m!266555))

(assert (=> b!249943 m!266555))

(assert (=> b!249943 m!266563))

(declare-fun m!266565 () Bool)

(assert (=> bm!23455 m!266565))

(assert (=> b!249743 d!60857))

(declare-fun d!60859 () Bool)

(declare-fun lt!125226 () (_ BitVec 32))

(assert (=> d!60859 (and (bvsge lt!125226 #b00000000000000000000000000000000) (bvsle lt!125226 (bvsub (size!6166 (_keys!6748 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!162100 () (_ BitVec 32))

(assert (=> d!60859 (= lt!125226 e!162100)))

(declare-fun c!41961 () Bool)

(assert (=> d!60859 (= c!41961 (bvsge #b00000000000000000000000000000000 (size!6166 (_keys!6748 thiss!1504))))))

(assert (=> d!60859 (and (bvsle #b00000000000000000000000000000000 (size!6166 (_keys!6748 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6166 (_keys!6748 thiss!1504)) (size!6166 (_keys!6748 thiss!1504))))))

(assert (=> d!60859 (= (arrayCountValidKeys!0 (_keys!6748 thiss!1504) #b00000000000000000000000000000000 (size!6166 (_keys!6748 thiss!1504))) lt!125226)))

(declare-fun b!249946 () Bool)

(declare-fun e!162101 () (_ BitVec 32))

(declare-fun call!23459 () (_ BitVec 32))

(assert (=> b!249946 (= e!162101 call!23459)))

(declare-fun b!249947 () Bool)

(assert (=> b!249947 (= e!162100 e!162101)))

(declare-fun c!41960 () Bool)

(assert (=> b!249947 (= c!41960 (validKeyInArray!0 (select (arr!5822 (_keys!6748 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!249948 () Bool)

(assert (=> b!249948 (= e!162100 #b00000000000000000000000000000000)))

(declare-fun bm!23456 () Bool)

(assert (=> bm!23456 (= call!23459 (arrayCountValidKeys!0 (_keys!6748 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6166 (_keys!6748 thiss!1504))))))

(declare-fun b!249949 () Bool)

(assert (=> b!249949 (= e!162101 (bvadd #b00000000000000000000000000000001 call!23459))))

(assert (= (and d!60859 c!41961) b!249948))

(assert (= (and d!60859 (not c!41961)) b!249947))

(assert (= (and b!249947 c!41960) b!249949))

(assert (= (and b!249947 (not c!41960)) b!249946))

(assert (= (or b!249949 b!249946) bm!23456))

(declare-fun m!266567 () Bool)

(assert (=> b!249947 m!266567))

(assert (=> b!249947 m!266567))

(declare-fun m!266569 () Bool)

(assert (=> b!249947 m!266569))

(declare-fun m!266571 () Bool)

(assert (=> bm!23456 m!266571))

(assert (=> b!249743 d!60859))

(declare-fun d!60861 () Bool)

(assert (=> d!60861 (= (validMask!0 (mask!10788 thiss!1504)) (and (or (= (mask!10788 thiss!1504) #b00000000000000000000000000000111) (= (mask!10788 thiss!1504) #b00000000000000000000000000001111) (= (mask!10788 thiss!1504) #b00000000000000000000000000011111) (= (mask!10788 thiss!1504) #b00000000000000000000000000111111) (= (mask!10788 thiss!1504) #b00000000000000000000000001111111) (= (mask!10788 thiss!1504) #b00000000000000000000000011111111) (= (mask!10788 thiss!1504) #b00000000000000000000000111111111) (= (mask!10788 thiss!1504) #b00000000000000000000001111111111) (= (mask!10788 thiss!1504) #b00000000000000000000011111111111) (= (mask!10788 thiss!1504) #b00000000000000000000111111111111) (= (mask!10788 thiss!1504) #b00000000000000000001111111111111) (= (mask!10788 thiss!1504) #b00000000000000000011111111111111) (= (mask!10788 thiss!1504) #b00000000000000000111111111111111) (= (mask!10788 thiss!1504) #b00000000000000001111111111111111) (= (mask!10788 thiss!1504) #b00000000000000011111111111111111) (= (mask!10788 thiss!1504) #b00000000000000111111111111111111) (= (mask!10788 thiss!1504) #b00000000000001111111111111111111) (= (mask!10788 thiss!1504) #b00000000000011111111111111111111) (= (mask!10788 thiss!1504) #b00000000000111111111111111111111) (= (mask!10788 thiss!1504) #b00000000001111111111111111111111) (= (mask!10788 thiss!1504) #b00000000011111111111111111111111) (= (mask!10788 thiss!1504) #b00000000111111111111111111111111) (= (mask!10788 thiss!1504) #b00000001111111111111111111111111) (= (mask!10788 thiss!1504) #b00000011111111111111111111111111) (= (mask!10788 thiss!1504) #b00000111111111111111111111111111) (= (mask!10788 thiss!1504) #b00001111111111111111111111111111) (= (mask!10788 thiss!1504) #b00011111111111111111111111111111) (= (mask!10788 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10788 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!249743 d!60861))

(declare-fun b!249961 () Bool)

(declare-fun e!162110 () Bool)

(declare-fun call!23462 () Bool)

(assert (=> b!249961 (= e!162110 call!23462)))

(declare-fun b!249962 () Bool)

(declare-fun e!162113 () Bool)

(declare-fun contains!1791 (List!3638 (_ BitVec 64)) Bool)

(assert (=> b!249962 (= e!162113 (contains!1791 Nil!3635 (select (arr!5822 lt!125128) #b00000000000000000000000000000000)))))

(declare-fun b!249963 () Bool)

(declare-fun e!162112 () Bool)

(assert (=> b!249963 (= e!162112 e!162110)))

(declare-fun c!41964 () Bool)

(assert (=> b!249963 (= c!41964 (validKeyInArray!0 (select (arr!5822 lt!125128) #b00000000000000000000000000000000)))))

(declare-fun b!249964 () Bool)

(assert (=> b!249964 (= e!162110 call!23462)))

(declare-fun bm!23459 () Bool)

(assert (=> bm!23459 (= call!23462 (arrayNoDuplicates!0 lt!125128 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41964 (Cons!3634 (select (arr!5822 lt!125128) #b00000000000000000000000000000000) Nil!3635) Nil!3635)))))

(declare-fun d!60863 () Bool)

(declare-fun res!122449 () Bool)

(declare-fun e!162111 () Bool)

(assert (=> d!60863 (=> res!122449 e!162111)))

(assert (=> d!60863 (= res!122449 (bvsge #b00000000000000000000000000000000 (size!6166 lt!125128)))))

(assert (=> d!60863 (= (arrayNoDuplicates!0 lt!125128 #b00000000000000000000000000000000 Nil!3635) e!162111)))

(declare-fun b!249960 () Bool)

(assert (=> b!249960 (= e!162111 e!162112)))

(declare-fun res!122448 () Bool)

(assert (=> b!249960 (=> (not res!122448) (not e!162112))))

(assert (=> b!249960 (= res!122448 (not e!162113))))

(declare-fun res!122447 () Bool)

(assert (=> b!249960 (=> (not res!122447) (not e!162113))))

(assert (=> b!249960 (= res!122447 (validKeyInArray!0 (select (arr!5822 lt!125128) #b00000000000000000000000000000000)))))

(assert (= (and d!60863 (not res!122449)) b!249960))

(assert (= (and b!249960 res!122447) b!249962))

(assert (= (and b!249960 res!122448) b!249963))

(assert (= (and b!249963 c!41964) b!249961))

(assert (= (and b!249963 (not c!41964)) b!249964))

(assert (= (or b!249961 b!249964) bm!23459))

(assert (=> b!249962 m!266555))

(assert (=> b!249962 m!266555))

(declare-fun m!266573 () Bool)

(assert (=> b!249962 m!266573))

(assert (=> b!249963 m!266555))

(assert (=> b!249963 m!266555))

(assert (=> b!249963 m!266563))

(assert (=> bm!23459 m!266555))

(declare-fun m!266575 () Bool)

(assert (=> bm!23459 m!266575))

(assert (=> b!249960 m!266555))

(assert (=> b!249960 m!266555))

(assert (=> b!249960 m!266563))

(assert (=> b!249743 d!60863))

(declare-fun d!60865 () Bool)

(declare-fun e!162116 () Bool)

(assert (=> d!60865 e!162116))

(declare-fun res!122452 () Bool)

(assert (=> d!60865 (=> (not res!122452) (not e!162116))))

(assert (=> d!60865 (= res!122452 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6166 (_keys!6748 thiss!1504)))))))

(declare-fun lt!125229 () Unit!7701)

(declare-fun choose!41 (array!12277 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3638) Unit!7701)

(assert (=> d!60865 (= lt!125229 (choose!41 (_keys!6748 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3635))))

(assert (=> d!60865 (bvslt (size!6166 (_keys!6748 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!60865 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6748 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3635) lt!125229)))

(declare-fun b!249967 () Bool)

(assert (=> b!249967 (= e!162116 (arrayNoDuplicates!0 (array!12278 (store (arr!5822 (_keys!6748 thiss!1504)) index!297 key!932) (size!6166 (_keys!6748 thiss!1504))) #b00000000000000000000000000000000 Nil!3635))))

(assert (= (and d!60865 res!122452) b!249967))

(declare-fun m!266577 () Bool)

(assert (=> d!60865 m!266577))

(assert (=> b!249967 m!266389))

(declare-fun m!266579 () Bool)

(assert (=> b!249967 m!266579))

(assert (=> b!249743 d!60865))

(declare-fun d!60867 () Bool)

(declare-fun res!122457 () Bool)

(declare-fun e!162121 () Bool)

(assert (=> d!60867 (=> res!122457 e!162121)))

(assert (=> d!60867 (= res!122457 (= (select (arr!5822 (_keys!6748 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60867 (= (arrayContainsKey!0 (_keys!6748 thiss!1504) key!932 #b00000000000000000000000000000000) e!162121)))

(declare-fun b!249972 () Bool)

(declare-fun e!162122 () Bool)

(assert (=> b!249972 (= e!162121 e!162122)))

(declare-fun res!122458 () Bool)

(assert (=> b!249972 (=> (not res!122458) (not e!162122))))

(assert (=> b!249972 (= res!122458 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6166 (_keys!6748 thiss!1504))))))

(declare-fun b!249973 () Bool)

(assert (=> b!249973 (= e!162122 (arrayContainsKey!0 (_keys!6748 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60867 (not res!122457)) b!249972))

(assert (= (and b!249972 res!122458) b!249973))

(assert (=> d!60867 m!266567))

(declare-fun m!266581 () Bool)

(assert (=> b!249973 m!266581))

(assert (=> b!249743 d!60867))

(declare-fun d!60869 () Bool)

(declare-fun e!162125 () Bool)

(assert (=> d!60869 e!162125))

(declare-fun res!122461 () Bool)

(assert (=> d!60869 (=> (not res!122461) (not e!162125))))

(assert (=> d!60869 (= res!122461 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6166 (_keys!6748 thiss!1504)))))))

(declare-fun lt!125232 () Unit!7701)

(declare-fun choose!102 ((_ BitVec 64) array!12277 (_ BitVec 32) (_ BitVec 32)) Unit!7701)

(assert (=> d!60869 (= lt!125232 (choose!102 key!932 (_keys!6748 thiss!1504) index!297 (mask!10788 thiss!1504)))))

(assert (=> d!60869 (validMask!0 (mask!10788 thiss!1504))))

(assert (=> d!60869 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6748 thiss!1504) index!297 (mask!10788 thiss!1504)) lt!125232)))

(declare-fun b!249976 () Bool)

(assert (=> b!249976 (= e!162125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12278 (store (arr!5822 (_keys!6748 thiss!1504)) index!297 key!932) (size!6166 (_keys!6748 thiss!1504))) (mask!10788 thiss!1504)))))

(assert (= (and d!60869 res!122461) b!249976))

(declare-fun m!266583 () Bool)

(assert (=> d!60869 m!266583))

(assert (=> d!60869 m!266379))

(assert (=> b!249976 m!266389))

(declare-fun m!266585 () Bool)

(assert (=> b!249976 m!266585))

(assert (=> b!249743 d!60869))

(assert (=> bm!23430 d!60867))

(declare-fun d!60871 () Bool)

(assert (=> d!60871 (= (inRange!0 index!297 (mask!10788 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10788 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!249726 d!60871))

(declare-fun d!60873 () Bool)

(declare-fun e!162131 () Bool)

(assert (=> d!60873 e!162131))

(declare-fun res!122464 () Bool)

(assert (=> d!60873 (=> res!122464 e!162131)))

(declare-fun lt!125242 () Bool)

(assert (=> d!60873 (= res!122464 (not lt!125242))))

(declare-fun lt!125241 () Bool)

(assert (=> d!60873 (= lt!125242 lt!125241)))

(declare-fun lt!125244 () Unit!7701)

(declare-fun e!162130 () Unit!7701)

(assert (=> d!60873 (= lt!125244 e!162130)))

(declare-fun c!41967 () Bool)

(assert (=> d!60873 (= c!41967 lt!125241)))

(declare-fun containsKey!289 (List!3637 (_ BitVec 64)) Bool)

(assert (=> d!60873 (= lt!125241 (containsKey!289 (toList!1853 (getCurrentListMap!1385 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504))) key!932))))

(assert (=> d!60873 (= (contains!1788 (getCurrentListMap!1385 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)) key!932) lt!125242)))

(declare-fun b!249983 () Bool)

(declare-fun lt!125243 () Unit!7701)

(assert (=> b!249983 (= e!162130 lt!125243)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!237 (List!3637 (_ BitVec 64)) Unit!7701)

(assert (=> b!249983 (= lt!125243 (lemmaContainsKeyImpliesGetValueByKeyDefined!237 (toList!1853 (getCurrentListMap!1385 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504))) key!932))))

(declare-datatypes ((Option!304 0))(
  ( (Some!303 (v!5352 V!8289)) (None!302) )
))
(declare-fun isDefined!238 (Option!304) Bool)

(declare-fun getValueByKey!298 (List!3637 (_ BitVec 64)) Option!304)

(assert (=> b!249983 (isDefined!238 (getValueByKey!298 (toList!1853 (getCurrentListMap!1385 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504))) key!932))))

(declare-fun b!249984 () Bool)

(declare-fun Unit!7715 () Unit!7701)

(assert (=> b!249984 (= e!162130 Unit!7715)))

(declare-fun b!249985 () Bool)

(assert (=> b!249985 (= e!162131 (isDefined!238 (getValueByKey!298 (toList!1853 (getCurrentListMap!1385 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504))) key!932)))))

(assert (= (and d!60873 c!41967) b!249983))

(assert (= (and d!60873 (not c!41967)) b!249984))

(assert (= (and d!60873 (not res!122464)) b!249985))

(declare-fun m!266587 () Bool)

(assert (=> d!60873 m!266587))

(declare-fun m!266589 () Bool)

(assert (=> b!249983 m!266589))

(declare-fun m!266591 () Bool)

(assert (=> b!249983 m!266591))

(assert (=> b!249983 m!266591))

(declare-fun m!266593 () Bool)

(assert (=> b!249983 m!266593))

(assert (=> b!249985 m!266591))

(assert (=> b!249985 m!266591))

(assert (=> b!249985 m!266593))

(assert (=> b!249726 d!60873))

(declare-fun b!250028 () Bool)

(declare-fun e!162167 () Bool)

(declare-fun e!162161 () Bool)

(assert (=> b!250028 (= e!162167 e!162161)))

(declare-fun res!122488 () Bool)

(declare-fun call!23482 () Bool)

(assert (=> b!250028 (= res!122488 call!23482)))

(assert (=> b!250028 (=> (not res!122488) (not e!162161))))

(declare-fun b!250029 () Bool)

(declare-fun res!122483 () Bool)

(declare-fun e!162170 () Bool)

(assert (=> b!250029 (=> (not res!122483) (not e!162170))))

(declare-fun e!162162 () Bool)

(assert (=> b!250029 (= res!122483 e!162162)))

(declare-fun c!41981 () Bool)

(assert (=> b!250029 (= c!41981 (not (= (bvand (extraKeys!4353 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!250030 () Bool)

(declare-fun call!23480 () Bool)

(assert (=> b!250030 (= e!162162 (not call!23480))))

(declare-fun b!250031 () Bool)

(declare-fun lt!125298 () ListLongMap!3675)

(declare-fun apply!239 (ListLongMap!3675 (_ BitVec 64)) V!8289)

(assert (=> b!250031 (= e!162161 (= (apply!239 lt!125298 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4457 thiss!1504)))))

(declare-fun b!250032 () Bool)

(assert (=> b!250032 (= e!162167 (not call!23482))))

(declare-fun b!250033 () Bool)

(declare-fun e!162165 () Bool)

(assert (=> b!250033 (= e!162165 (validKeyInArray!0 (select (arr!5822 (_keys!6748 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!23474 () Bool)

(declare-fun call!23481 () ListLongMap!3675)

(declare-fun call!23477 () ListLongMap!3675)

(assert (=> bm!23474 (= call!23481 call!23477)))

(declare-fun b!250034 () Bool)

(declare-fun e!162169 () ListLongMap!3675)

(declare-fun e!162164 () ListLongMap!3675)

(assert (=> b!250034 (= e!162169 e!162164)))

(declare-fun c!41982 () Bool)

(assert (=> b!250034 (= c!41982 (and (not (= (bvand (extraKeys!4353 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4353 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!250036 () Bool)

(declare-fun c!41980 () Bool)

(assert (=> b!250036 (= c!41980 (and (not (= (bvand (extraKeys!4353 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4353 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!162158 () ListLongMap!3675)

(assert (=> b!250036 (= e!162164 e!162158)))

(declare-fun b!250037 () Bool)

(declare-fun res!122489 () Bool)

(assert (=> b!250037 (=> (not res!122489) (not e!162170))))

(declare-fun e!162159 () Bool)

(assert (=> b!250037 (= res!122489 e!162159)))

(declare-fun res!122491 () Bool)

(assert (=> b!250037 (=> res!122491 e!162159)))

(declare-fun e!162166 () Bool)

(assert (=> b!250037 (= res!122491 (not e!162166))))

(declare-fun res!122490 () Bool)

(assert (=> b!250037 (=> (not res!122490) (not e!162166))))

(assert (=> b!250037 (= res!122490 (bvslt #b00000000000000000000000000000000 (size!6166 (_keys!6748 thiss!1504))))))

(declare-fun b!250038 () Bool)

(assert (=> b!250038 (= e!162166 (validKeyInArray!0 (select (arr!5822 (_keys!6748 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!250039 () Bool)

(assert (=> b!250039 (= e!162170 e!162167)))

(declare-fun c!41984 () Bool)

(assert (=> b!250039 (= c!41984 (not (= (bvand (extraKeys!4353 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!250040 () Bool)

(declare-fun e!162160 () Bool)

(declare-fun get!2997 (ValueCell!2897 V!8289) V!8289)

(declare-fun dynLambda!582 (Int (_ BitVec 64)) V!8289)

(assert (=> b!250040 (= e!162160 (= (apply!239 lt!125298 (select (arr!5822 (_keys!6748 thiss!1504)) #b00000000000000000000000000000000)) (get!2997 (select (arr!5821 (_values!4599 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!582 (defaultEntry!4616 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!250040 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6165 (_values!4599 thiss!1504))))))

(assert (=> b!250040 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6166 (_keys!6748 thiss!1504))))))

(declare-fun bm!23475 () Bool)

(assert (=> bm!23475 (= call!23482 (contains!1788 lt!125298 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!23476 () Bool)

(assert (=> bm!23476 (= call!23480 (contains!1788 lt!125298 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!250041 () Bool)

(declare-fun e!162163 () Bool)

(assert (=> b!250041 (= e!162162 e!162163)))

(declare-fun res!122484 () Bool)

(assert (=> b!250041 (= res!122484 call!23480)))

(assert (=> b!250041 (=> (not res!122484) (not e!162163))))

(declare-fun bm!23477 () Bool)

(declare-fun call!23478 () ListLongMap!3675)

(assert (=> bm!23477 (= call!23478 call!23481)))

(declare-fun b!250042 () Bool)

(assert (=> b!250042 (= e!162159 e!162160)))

(declare-fun res!122485 () Bool)

(assert (=> b!250042 (=> (not res!122485) (not e!162160))))

(assert (=> b!250042 (= res!122485 (contains!1788 lt!125298 (select (arr!5822 (_keys!6748 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!250042 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6166 (_keys!6748 thiss!1504))))))

(declare-fun d!60875 () Bool)

(assert (=> d!60875 e!162170))

(declare-fun res!122487 () Bool)

(assert (=> d!60875 (=> (not res!122487) (not e!162170))))

(assert (=> d!60875 (= res!122487 (or (bvsge #b00000000000000000000000000000000 (size!6166 (_keys!6748 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6166 (_keys!6748 thiss!1504))))))))

(declare-fun lt!125304 () ListLongMap!3675)

(assert (=> d!60875 (= lt!125298 lt!125304)))

(declare-fun lt!125307 () Unit!7701)

(declare-fun e!162168 () Unit!7701)

(assert (=> d!60875 (= lt!125307 e!162168)))

(declare-fun c!41985 () Bool)

(assert (=> d!60875 (= c!41985 e!162165)))

(declare-fun res!122486 () Bool)

(assert (=> d!60875 (=> (not res!122486) (not e!162165))))

(assert (=> d!60875 (= res!122486 (bvslt #b00000000000000000000000000000000 (size!6166 (_keys!6748 thiss!1504))))))

(assert (=> d!60875 (= lt!125304 e!162169)))

(declare-fun c!41983 () Bool)

(assert (=> d!60875 (= c!41983 (and (not (= (bvand (extraKeys!4353 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4353 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60875 (validMask!0 (mask!10788 thiss!1504))))

(assert (=> d!60875 (= (getCurrentListMap!1385 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)) lt!125298)))

(declare-fun b!250035 () Bool)

(declare-fun call!23479 () ListLongMap!3675)

(assert (=> b!250035 (= e!162164 call!23479)))

(declare-fun b!250043 () Bool)

(assert (=> b!250043 (= e!162158 call!23479)))

(declare-fun b!250044 () Bool)

(declare-fun Unit!7716 () Unit!7701)

(assert (=> b!250044 (= e!162168 Unit!7716)))

(declare-fun b!250045 () Bool)

(assert (=> b!250045 (= e!162163 (= (apply!239 lt!125298 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4457 thiss!1504)))))

(declare-fun bm!23478 () Bool)

(declare-fun call!23483 () ListLongMap!3675)

(assert (=> bm!23478 (= call!23479 call!23483)))

(declare-fun b!250046 () Bool)

(assert (=> b!250046 (= e!162158 call!23478)))

(declare-fun b!250047 () Bool)

(declare-fun +!666 (ListLongMap!3675 tuple2!4760) ListLongMap!3675)

(assert (=> b!250047 (= e!162169 (+!666 call!23483 (tuple2!4761 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504))))))

(declare-fun bm!23479 () Bool)

(assert (=> bm!23479 (= call!23483 (+!666 (ite c!41983 call!23477 (ite c!41982 call!23481 call!23478)) (ite (or c!41983 c!41982) (tuple2!4761 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4457 thiss!1504)) (tuple2!4761 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504)))))))

(declare-fun b!250048 () Bool)

(declare-fun lt!125301 () Unit!7701)

(assert (=> b!250048 (= e!162168 lt!125301)))

(declare-fun lt!125308 () ListLongMap!3675)

(declare-fun getCurrentListMapNoExtraKeys!555 (array!12277 array!12275 (_ BitVec 32) (_ BitVec 32) V!8289 V!8289 (_ BitVec 32) Int) ListLongMap!3675)

(assert (=> b!250048 (= lt!125308 (getCurrentListMapNoExtraKeys!555 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)))))

(declare-fun lt!125292 () (_ BitVec 64))

(assert (=> b!250048 (= lt!125292 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!125302 () (_ BitVec 64))

(assert (=> b!250048 (= lt!125302 (select (arr!5822 (_keys!6748 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!125309 () Unit!7701)

(declare-fun addStillContains!215 (ListLongMap!3675 (_ BitVec 64) V!8289 (_ BitVec 64)) Unit!7701)

(assert (=> b!250048 (= lt!125309 (addStillContains!215 lt!125308 lt!125292 (zeroValue!4457 thiss!1504) lt!125302))))

(assert (=> b!250048 (contains!1788 (+!666 lt!125308 (tuple2!4761 lt!125292 (zeroValue!4457 thiss!1504))) lt!125302)))

(declare-fun lt!125296 () Unit!7701)

(assert (=> b!250048 (= lt!125296 lt!125309)))

(declare-fun lt!125297 () ListLongMap!3675)

(assert (=> b!250048 (= lt!125297 (getCurrentListMapNoExtraKeys!555 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)))))

(declare-fun lt!125305 () (_ BitVec 64))

(assert (=> b!250048 (= lt!125305 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!125291 () (_ BitVec 64))

(assert (=> b!250048 (= lt!125291 (select (arr!5822 (_keys!6748 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!125295 () Unit!7701)

(declare-fun addApplyDifferent!215 (ListLongMap!3675 (_ BitVec 64) V!8289 (_ BitVec 64)) Unit!7701)

(assert (=> b!250048 (= lt!125295 (addApplyDifferent!215 lt!125297 lt!125305 (minValue!4457 thiss!1504) lt!125291))))

(assert (=> b!250048 (= (apply!239 (+!666 lt!125297 (tuple2!4761 lt!125305 (minValue!4457 thiss!1504))) lt!125291) (apply!239 lt!125297 lt!125291))))

(declare-fun lt!125289 () Unit!7701)

(assert (=> b!250048 (= lt!125289 lt!125295)))

(declare-fun lt!125293 () ListLongMap!3675)

(assert (=> b!250048 (= lt!125293 (getCurrentListMapNoExtraKeys!555 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)))))

(declare-fun lt!125294 () (_ BitVec 64))

(assert (=> b!250048 (= lt!125294 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!125299 () (_ BitVec 64))

(assert (=> b!250048 (= lt!125299 (select (arr!5822 (_keys!6748 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!125290 () Unit!7701)

(assert (=> b!250048 (= lt!125290 (addApplyDifferent!215 lt!125293 lt!125294 (zeroValue!4457 thiss!1504) lt!125299))))

(assert (=> b!250048 (= (apply!239 (+!666 lt!125293 (tuple2!4761 lt!125294 (zeroValue!4457 thiss!1504))) lt!125299) (apply!239 lt!125293 lt!125299))))

(declare-fun lt!125310 () Unit!7701)

(assert (=> b!250048 (= lt!125310 lt!125290)))

(declare-fun lt!125303 () ListLongMap!3675)

(assert (=> b!250048 (= lt!125303 (getCurrentListMapNoExtraKeys!555 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)))))

(declare-fun lt!125300 () (_ BitVec 64))

(assert (=> b!250048 (= lt!125300 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!125306 () (_ BitVec 64))

(assert (=> b!250048 (= lt!125306 (select (arr!5822 (_keys!6748 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!250048 (= lt!125301 (addApplyDifferent!215 lt!125303 lt!125300 (minValue!4457 thiss!1504) lt!125306))))

(assert (=> b!250048 (= (apply!239 (+!666 lt!125303 (tuple2!4761 lt!125300 (minValue!4457 thiss!1504))) lt!125306) (apply!239 lt!125303 lt!125306))))

(declare-fun bm!23480 () Bool)

(assert (=> bm!23480 (= call!23477 (getCurrentListMapNoExtraKeys!555 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)))))

(assert (= (and d!60875 c!41983) b!250047))

(assert (= (and d!60875 (not c!41983)) b!250034))

(assert (= (and b!250034 c!41982) b!250035))

(assert (= (and b!250034 (not c!41982)) b!250036))

(assert (= (and b!250036 c!41980) b!250043))

(assert (= (and b!250036 (not c!41980)) b!250046))

(assert (= (or b!250043 b!250046) bm!23477))

(assert (= (or b!250035 bm!23477) bm!23474))

(assert (= (or b!250035 b!250043) bm!23478))

(assert (= (or b!250047 bm!23474) bm!23480))

(assert (= (or b!250047 bm!23478) bm!23479))

(assert (= (and d!60875 res!122486) b!250033))

(assert (= (and d!60875 c!41985) b!250048))

(assert (= (and d!60875 (not c!41985)) b!250044))

(assert (= (and d!60875 res!122487) b!250037))

(assert (= (and b!250037 res!122490) b!250038))

(assert (= (and b!250037 (not res!122491)) b!250042))

(assert (= (and b!250042 res!122485) b!250040))

(assert (= (and b!250037 res!122489) b!250029))

(assert (= (and b!250029 c!41981) b!250041))

(assert (= (and b!250029 (not c!41981)) b!250030))

(assert (= (and b!250041 res!122484) b!250045))

(assert (= (or b!250041 b!250030) bm!23476))

(assert (= (and b!250029 res!122483) b!250039))

(assert (= (and b!250039 c!41984) b!250028))

(assert (= (and b!250039 (not c!41984)) b!250032))

(assert (= (and b!250028 res!122488) b!250031))

(assert (= (or b!250028 b!250032) bm!23475))

(declare-fun b_lambda!8097 () Bool)

(assert (=> (not b_lambda!8097) (not b!250040)))

(declare-fun t!8666 () Bool)

(declare-fun tb!2983 () Bool)

(assert (=> (and b!249734 (= (defaultEntry!4616 thiss!1504) (defaultEntry!4616 thiss!1504)) t!8666) tb!2983))

(declare-fun result!5287 () Bool)

(assert (=> tb!2983 (= result!5287 tp_is_empty!6481)))

(assert (=> b!250040 t!8666))

(declare-fun b_and!13653 () Bool)

(assert (= b_and!13647 (and (=> t!8666 result!5287) b_and!13653)))

(assert (=> b!250033 m!266567))

(assert (=> b!250033 m!266567))

(assert (=> b!250033 m!266569))

(declare-fun m!266595 () Bool)

(assert (=> bm!23476 m!266595))

(declare-fun m!266597 () Bool)

(assert (=> b!250040 m!266597))

(declare-fun m!266599 () Bool)

(assert (=> b!250040 m!266599))

(declare-fun m!266601 () Bool)

(assert (=> b!250040 m!266601))

(assert (=> b!250040 m!266597))

(assert (=> b!250040 m!266567))

(declare-fun m!266603 () Bool)

(assert (=> b!250040 m!266603))

(assert (=> b!250040 m!266599))

(assert (=> b!250040 m!266567))

(declare-fun m!266605 () Bool)

(assert (=> b!250048 m!266605))

(declare-fun m!266607 () Bool)

(assert (=> b!250048 m!266607))

(declare-fun m!266609 () Bool)

(assert (=> b!250048 m!266609))

(declare-fun m!266611 () Bool)

(assert (=> b!250048 m!266611))

(declare-fun m!266613 () Bool)

(assert (=> b!250048 m!266613))

(declare-fun m!266615 () Bool)

(assert (=> b!250048 m!266615))

(assert (=> b!250048 m!266567))

(declare-fun m!266617 () Bool)

(assert (=> b!250048 m!266617))

(assert (=> b!250048 m!266613))

(declare-fun m!266619 () Bool)

(assert (=> b!250048 m!266619))

(assert (=> b!250048 m!266609))

(declare-fun m!266621 () Bool)

(assert (=> b!250048 m!266621))

(assert (=> b!250048 m!266605))

(declare-fun m!266623 () Bool)

(assert (=> b!250048 m!266623))

(declare-fun m!266625 () Bool)

(assert (=> b!250048 m!266625))

(declare-fun m!266627 () Bool)

(assert (=> b!250048 m!266627))

(declare-fun m!266629 () Bool)

(assert (=> b!250048 m!266629))

(declare-fun m!266631 () Bool)

(assert (=> b!250048 m!266631))

(declare-fun m!266633 () Bool)

(assert (=> b!250048 m!266633))

(assert (=> b!250048 m!266607))

(declare-fun m!266635 () Bool)

(assert (=> b!250048 m!266635))

(declare-fun m!266637 () Bool)

(assert (=> b!250031 m!266637))

(assert (=> b!250038 m!266567))

(assert (=> b!250038 m!266567))

(assert (=> b!250038 m!266569))

(declare-fun m!266639 () Bool)

(assert (=> b!250045 m!266639))

(assert (=> bm!23480 m!266615))

(declare-fun m!266641 () Bool)

(assert (=> bm!23475 m!266641))

(assert (=> d!60875 m!266379))

(assert (=> b!250042 m!266567))

(assert (=> b!250042 m!266567))

(declare-fun m!266643 () Bool)

(assert (=> b!250042 m!266643))

(declare-fun m!266645 () Bool)

(assert (=> b!250047 m!266645))

(declare-fun m!266647 () Bool)

(assert (=> bm!23479 m!266647))

(assert (=> b!249726 d!60875))

(declare-fun e!162178 () SeekEntryResult!1084)

(declare-fun lt!125319 () SeekEntryResult!1084)

(declare-fun b!250063 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12277 (_ BitVec 32)) SeekEntryResult!1084)

(assert (=> b!250063 (= e!162178 (seekKeyOrZeroReturnVacant!0 (x!24608 lt!125319) (index!6508 lt!125319) (index!6508 lt!125319) key!932 (_keys!6748 thiss!1504) (mask!10788 thiss!1504)))))

(declare-fun b!250064 () Bool)

(declare-fun e!162179 () SeekEntryResult!1084)

(assert (=> b!250064 (= e!162179 (Found!1084 (index!6508 lt!125319)))))

(declare-fun b!250065 () Bool)

(assert (=> b!250065 (= e!162178 (MissingZero!1084 (index!6508 lt!125319)))))

(declare-fun b!250066 () Bool)

(declare-fun e!162177 () SeekEntryResult!1084)

(assert (=> b!250066 (= e!162177 e!162179)))

(declare-fun lt!125318 () (_ BitVec 64))

(assert (=> b!250066 (= lt!125318 (select (arr!5822 (_keys!6748 thiss!1504)) (index!6508 lt!125319)))))

(declare-fun c!41994 () Bool)

(assert (=> b!250066 (= c!41994 (= lt!125318 key!932))))

(declare-fun b!250067 () Bool)

(declare-fun c!41993 () Bool)

(assert (=> b!250067 (= c!41993 (= lt!125318 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!250067 (= e!162179 e!162178)))

(declare-fun d!60877 () Bool)

(declare-fun lt!125317 () SeekEntryResult!1084)

(assert (=> d!60877 (and (or ((_ is Undefined!1084) lt!125317) (not ((_ is Found!1084) lt!125317)) (and (bvsge (index!6507 lt!125317) #b00000000000000000000000000000000) (bvslt (index!6507 lt!125317) (size!6166 (_keys!6748 thiss!1504))))) (or ((_ is Undefined!1084) lt!125317) ((_ is Found!1084) lt!125317) (not ((_ is MissingZero!1084) lt!125317)) (and (bvsge (index!6506 lt!125317) #b00000000000000000000000000000000) (bvslt (index!6506 lt!125317) (size!6166 (_keys!6748 thiss!1504))))) (or ((_ is Undefined!1084) lt!125317) ((_ is Found!1084) lt!125317) ((_ is MissingZero!1084) lt!125317) (not ((_ is MissingVacant!1084) lt!125317)) (and (bvsge (index!6509 lt!125317) #b00000000000000000000000000000000) (bvslt (index!6509 lt!125317) (size!6166 (_keys!6748 thiss!1504))))) (or ((_ is Undefined!1084) lt!125317) (ite ((_ is Found!1084) lt!125317) (= (select (arr!5822 (_keys!6748 thiss!1504)) (index!6507 lt!125317)) key!932) (ite ((_ is MissingZero!1084) lt!125317) (= (select (arr!5822 (_keys!6748 thiss!1504)) (index!6506 lt!125317)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1084) lt!125317) (= (select (arr!5822 (_keys!6748 thiss!1504)) (index!6509 lt!125317)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!60877 (= lt!125317 e!162177)))

(declare-fun c!41992 () Bool)

(assert (=> d!60877 (= c!41992 (and ((_ is Intermediate!1084) lt!125319) (undefined!1896 lt!125319)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12277 (_ BitVec 32)) SeekEntryResult!1084)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60877 (= lt!125319 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10788 thiss!1504)) key!932 (_keys!6748 thiss!1504) (mask!10788 thiss!1504)))))

(assert (=> d!60877 (validMask!0 (mask!10788 thiss!1504))))

(assert (=> d!60877 (= (seekEntryOrOpen!0 key!932 (_keys!6748 thiss!1504) (mask!10788 thiss!1504)) lt!125317)))

(declare-fun b!250068 () Bool)

(assert (=> b!250068 (= e!162177 Undefined!1084)))

(assert (= (and d!60877 c!41992) b!250068))

(assert (= (and d!60877 (not c!41992)) b!250066))

(assert (= (and b!250066 c!41994) b!250064))

(assert (= (and b!250066 (not c!41994)) b!250067))

(assert (= (and b!250067 c!41993) b!250065))

(assert (= (and b!250067 (not c!41993)) b!250063))

(declare-fun m!266649 () Bool)

(assert (=> b!250063 m!266649))

(declare-fun m!266651 () Bool)

(assert (=> b!250066 m!266651))

(declare-fun m!266653 () Bool)

(assert (=> d!60877 m!266653))

(declare-fun m!266655 () Bool)

(assert (=> d!60877 m!266655))

(declare-fun m!266657 () Bool)

(assert (=> d!60877 m!266657))

(declare-fun m!266659 () Bool)

(assert (=> d!60877 m!266659))

(declare-fun m!266661 () Bool)

(assert (=> d!60877 m!266661))

(assert (=> d!60877 m!266379))

(assert (=> d!60877 m!266653))

(assert (=> b!249725 d!60877))

(declare-fun d!60879 () Bool)

(assert (=> d!60879 (= (array_inv!3829 (_keys!6748 thiss!1504)) (bvsge (size!6166 (_keys!6748 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!249734 d!60879))

(declare-fun d!60881 () Bool)

(assert (=> d!60881 (= (array_inv!3830 (_values!4599 thiss!1504)) (bvsge (size!6165 (_values!4599 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!249734 d!60881))

(declare-fun d!60883 () Bool)

(assert (=> d!60883 (= (inRange!0 (ite c!41920 (index!6506 lt!125130) (index!6509 lt!125130)) (mask!10788 thiss!1504)) (and (bvsge (ite c!41920 (index!6506 lt!125130) (index!6509 lt!125130)) #b00000000000000000000000000000000) (bvslt (ite c!41920 (index!6506 lt!125130) (index!6509 lt!125130)) (bvadd (mask!10788 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23431 d!60883))

(declare-fun mapIsEmpty!11019 () Bool)

(declare-fun mapRes!11019 () Bool)

(assert (=> mapIsEmpty!11019 mapRes!11019))

(declare-fun mapNonEmpty!11019 () Bool)

(declare-fun tp!23133 () Bool)

(declare-fun e!162185 () Bool)

(assert (=> mapNonEmpty!11019 (= mapRes!11019 (and tp!23133 e!162185))))

(declare-fun mapRest!11019 () (Array (_ BitVec 32) ValueCell!2897))

(declare-fun mapValue!11019 () ValueCell!2897)

(declare-fun mapKey!11019 () (_ BitVec 32))

(assert (=> mapNonEmpty!11019 (= mapRest!11010 (store mapRest!11019 mapKey!11019 mapValue!11019))))

(declare-fun b!250075 () Bool)

(assert (=> b!250075 (= e!162185 tp_is_empty!6481)))

(declare-fun b!250076 () Bool)

(declare-fun e!162184 () Bool)

(assert (=> b!250076 (= e!162184 tp_is_empty!6481)))

(declare-fun condMapEmpty!11019 () Bool)

(declare-fun mapDefault!11019 () ValueCell!2897)

(assert (=> mapNonEmpty!11010 (= condMapEmpty!11019 (= mapRest!11010 ((as const (Array (_ BitVec 32) ValueCell!2897)) mapDefault!11019)))))

(assert (=> mapNonEmpty!11010 (= tp!23118 (and e!162184 mapRes!11019))))

(assert (= (and mapNonEmpty!11010 condMapEmpty!11019) mapIsEmpty!11019))

(assert (= (and mapNonEmpty!11010 (not condMapEmpty!11019)) mapNonEmpty!11019))

(assert (= (and mapNonEmpty!11019 ((_ is ValueCellFull!2897) mapValue!11019)) b!250075))

(assert (= (and mapNonEmpty!11010 ((_ is ValueCellFull!2897) mapDefault!11019)) b!250076))

(declare-fun m!266663 () Bool)

(assert (=> mapNonEmpty!11019 m!266663))

(declare-fun b_lambda!8099 () Bool)

(assert (= b_lambda!8097 (or (and b!249734 b_free!6619) b_lambda!8099)))

(check-sat (not b!250045) (not b!250047) b_and!13653 (not b!249985) (not b!249918) (not b!249967) (not b!250042) (not d!60869) (not b!250031) (not b!249907) (not bm!23479) (not bm!23455) (not b!249933) (not d!60851) (not b_next!6619) (not b!250048) (not b!249909) (not b!249875) (not b!249919) (not b!250038) (not bm!23476) (not d!60849) (not mapNonEmpty!11019) (not d!60847) (not b!250040) (not d!60853) (not b!249932) (not bm!23452) (not b!249908) (not d!60845) (not bm!23480) (not b!249983) tp_is_empty!6481 (not bm!23459) (not b!249943) (not b_lambda!8099) (not b!249976) (not bm!23475) (not b!249960) (not d!60873) (not b!250063) (not d!60877) (not d!60875) (not bm!23448) (not b!249973) (not b!250033) (not b!249947) (not b!249921) (not b!249962) (not b!249963) (not bm!23449) (not d!60865) (not bm!23456))
(check-sat b_and!13653 (not b_next!6619))
(get-model)

(declare-fun b!250089 () Bool)

(declare-fun e!162194 () SeekEntryResult!1084)

(assert (=> b!250089 (= e!162194 Undefined!1084)))

(declare-fun b!250090 () Bool)

(declare-fun e!162193 () SeekEntryResult!1084)

(assert (=> b!250090 (= e!162193 (MissingVacant!1084 (index!6508 lt!125319)))))

(declare-fun b!250091 () Bool)

(declare-fun e!162192 () SeekEntryResult!1084)

(assert (=> b!250091 (= e!162194 e!162192)))

(declare-fun c!42002 () Bool)

(declare-fun lt!125324 () (_ BitVec 64))

(assert (=> b!250091 (= c!42002 (= lt!125324 key!932))))

(declare-fun b!250092 () Bool)

(assert (=> b!250092 (= e!162192 (Found!1084 (index!6508 lt!125319)))))

(declare-fun b!250093 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!250093 (= e!162193 (seekKeyOrZeroReturnVacant!0 (bvadd (x!24608 lt!125319) #b00000000000000000000000000000001) (nextIndex!0 (index!6508 lt!125319) (bvadd (x!24608 lt!125319) #b00000000000000000000000000000001) (mask!10788 thiss!1504)) (index!6508 lt!125319) key!932 (_keys!6748 thiss!1504) (mask!10788 thiss!1504)))))

(declare-fun d!60885 () Bool)

(declare-fun lt!125325 () SeekEntryResult!1084)

(assert (=> d!60885 (and (or ((_ is Undefined!1084) lt!125325) (not ((_ is Found!1084) lt!125325)) (and (bvsge (index!6507 lt!125325) #b00000000000000000000000000000000) (bvslt (index!6507 lt!125325) (size!6166 (_keys!6748 thiss!1504))))) (or ((_ is Undefined!1084) lt!125325) ((_ is Found!1084) lt!125325) (not ((_ is MissingVacant!1084) lt!125325)) (not (= (index!6509 lt!125325) (index!6508 lt!125319))) (and (bvsge (index!6509 lt!125325) #b00000000000000000000000000000000) (bvslt (index!6509 lt!125325) (size!6166 (_keys!6748 thiss!1504))))) (or ((_ is Undefined!1084) lt!125325) (ite ((_ is Found!1084) lt!125325) (= (select (arr!5822 (_keys!6748 thiss!1504)) (index!6507 lt!125325)) key!932) (and ((_ is MissingVacant!1084) lt!125325) (= (index!6509 lt!125325) (index!6508 lt!125319)) (= (select (arr!5822 (_keys!6748 thiss!1504)) (index!6509 lt!125325)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!60885 (= lt!125325 e!162194)))

(declare-fun c!42003 () Bool)

(assert (=> d!60885 (= c!42003 (bvsge (x!24608 lt!125319) #b01111111111111111111111111111110))))

(assert (=> d!60885 (= lt!125324 (select (arr!5822 (_keys!6748 thiss!1504)) (index!6508 lt!125319)))))

(assert (=> d!60885 (validMask!0 (mask!10788 thiss!1504))))

(assert (=> d!60885 (= (seekKeyOrZeroReturnVacant!0 (x!24608 lt!125319) (index!6508 lt!125319) (index!6508 lt!125319) key!932 (_keys!6748 thiss!1504) (mask!10788 thiss!1504)) lt!125325)))

(declare-fun b!250094 () Bool)

(declare-fun c!42001 () Bool)

(assert (=> b!250094 (= c!42001 (= lt!125324 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!250094 (= e!162192 e!162193)))

(assert (= (and d!60885 c!42003) b!250089))

(assert (= (and d!60885 (not c!42003)) b!250091))

(assert (= (and b!250091 c!42002) b!250092))

(assert (= (and b!250091 (not c!42002)) b!250094))

(assert (= (and b!250094 c!42001) b!250090))

(assert (= (and b!250094 (not c!42001)) b!250093))

(declare-fun m!266665 () Bool)

(assert (=> b!250093 m!266665))

(assert (=> b!250093 m!266665))

(declare-fun m!266667 () Bool)

(assert (=> b!250093 m!266667))

(declare-fun m!266669 () Bool)

(assert (=> d!60885 m!266669))

(declare-fun m!266671 () Bool)

(assert (=> d!60885 m!266671))

(assert (=> d!60885 m!266651))

(assert (=> d!60885 m!266379))

(assert (=> b!250063 d!60885))

(declare-fun d!60887 () Bool)

(assert (=> d!60887 (arrayNoDuplicates!0 (array!12278 (store (arr!5822 (_keys!6748 thiss!1504)) index!297 key!932) (size!6166 (_keys!6748 thiss!1504))) #b00000000000000000000000000000000 Nil!3635)))

(assert (=> d!60887 true))

(declare-fun _$65!77 () Unit!7701)

(assert (=> d!60887 (= (choose!41 (_keys!6748 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3635) _$65!77)))

(declare-fun bs!8983 () Bool)

(assert (= bs!8983 d!60887))

(assert (=> bs!8983 m!266389))

(assert (=> bs!8983 m!266579))

(assert (=> d!60865 d!60887))

(declare-fun d!60889 () Bool)

(declare-fun get!2998 (Option!304) V!8289)

(assert (=> d!60889 (= (apply!239 lt!125298 (select (arr!5822 (_keys!6748 thiss!1504)) #b00000000000000000000000000000000)) (get!2998 (getValueByKey!298 (toList!1853 lt!125298) (select (arr!5822 (_keys!6748 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!8984 () Bool)

(assert (= bs!8984 d!60889))

(assert (=> bs!8984 m!266567))

(declare-fun m!266673 () Bool)

(assert (=> bs!8984 m!266673))

(assert (=> bs!8984 m!266673))

(declare-fun m!266675 () Bool)

(assert (=> bs!8984 m!266675))

(assert (=> b!250040 d!60889))

(declare-fun d!60891 () Bool)

(declare-fun c!42006 () Bool)

(assert (=> d!60891 (= c!42006 ((_ is ValueCellFull!2897) (select (arr!5821 (_values!4599 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!162197 () V!8289)

(assert (=> d!60891 (= (get!2997 (select (arr!5821 (_values!4599 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!582 (defaultEntry!4616 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!162197)))

(declare-fun b!250099 () Bool)

(declare-fun get!2999 (ValueCell!2897 V!8289) V!8289)

(assert (=> b!250099 (= e!162197 (get!2999 (select (arr!5821 (_values!4599 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!582 (defaultEntry!4616 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!250100 () Bool)

(declare-fun get!3000 (ValueCell!2897 V!8289) V!8289)

(assert (=> b!250100 (= e!162197 (get!3000 (select (arr!5821 (_values!4599 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!582 (defaultEntry!4616 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!60891 c!42006) b!250099))

(assert (= (and d!60891 (not c!42006)) b!250100))

(assert (=> b!250099 m!266597))

(assert (=> b!250099 m!266599))

(declare-fun m!266677 () Bool)

(assert (=> b!250099 m!266677))

(assert (=> b!250100 m!266597))

(assert (=> b!250100 m!266599))

(declare-fun m!266679 () Bool)

(assert (=> b!250100 m!266679))

(assert (=> b!250040 d!60891))

(declare-fun d!60893 () Bool)

(assert (=> d!60893 (= (inRange!0 (index!6507 lt!125201) (mask!10788 thiss!1504)) (and (bvsge (index!6507 lt!125201) #b00000000000000000000000000000000) (bvslt (index!6507 lt!125201) (bvadd (mask!10788 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!249875 d!60893))

(declare-fun b!250119 () Bool)

(declare-fun e!162212 () SeekEntryResult!1084)

(assert (=> b!250119 (= e!162212 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!10788 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!10788 thiss!1504)) key!932 (_keys!6748 thiss!1504) (mask!10788 thiss!1504)))))

(declare-fun b!250120 () Bool)

(declare-fun lt!125330 () SeekEntryResult!1084)

(assert (=> b!250120 (and (bvsge (index!6508 lt!125330) #b00000000000000000000000000000000) (bvslt (index!6508 lt!125330) (size!6166 (_keys!6748 thiss!1504))))))

(declare-fun e!162208 () Bool)

(assert (=> b!250120 (= e!162208 (= (select (arr!5822 (_keys!6748 thiss!1504)) (index!6508 lt!125330)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!250121 () Bool)

(assert (=> b!250121 (and (bvsge (index!6508 lt!125330) #b00000000000000000000000000000000) (bvslt (index!6508 lt!125330) (size!6166 (_keys!6748 thiss!1504))))))

(declare-fun res!122498 () Bool)

(assert (=> b!250121 (= res!122498 (= (select (arr!5822 (_keys!6748 thiss!1504)) (index!6508 lt!125330)) key!932))))

(assert (=> b!250121 (=> res!122498 e!162208)))

(declare-fun e!162210 () Bool)

(assert (=> b!250121 (= e!162210 e!162208)))

(declare-fun b!250122 () Bool)

(declare-fun e!162211 () Bool)

(assert (=> b!250122 (= e!162211 (bvsge (x!24608 lt!125330) #b01111111111111111111111111111110))))

(declare-fun b!250124 () Bool)

(assert (=> b!250124 (= e!162211 e!162210)))

(declare-fun res!122499 () Bool)

(assert (=> b!250124 (= res!122499 (and ((_ is Intermediate!1084) lt!125330) (not (undefined!1896 lt!125330)) (bvslt (x!24608 lt!125330) #b01111111111111111111111111111110) (bvsge (x!24608 lt!125330) #b00000000000000000000000000000000) (bvsge (x!24608 lt!125330) #b00000000000000000000000000000000)))))

(assert (=> b!250124 (=> (not res!122499) (not e!162210))))

(declare-fun b!250125 () Bool)

(declare-fun e!162209 () SeekEntryResult!1084)

(assert (=> b!250125 (= e!162209 e!162212)))

(declare-fun c!42014 () Bool)

(declare-fun lt!125331 () (_ BitVec 64))

(assert (=> b!250125 (= c!42014 (or (= lt!125331 key!932) (= (bvadd lt!125331 lt!125331) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!250126 () Bool)

(assert (=> b!250126 (= e!162212 (Intermediate!1084 false (toIndex!0 key!932 (mask!10788 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!250127 () Bool)

(assert (=> b!250127 (and (bvsge (index!6508 lt!125330) #b00000000000000000000000000000000) (bvslt (index!6508 lt!125330) (size!6166 (_keys!6748 thiss!1504))))))

(declare-fun res!122500 () Bool)

(assert (=> b!250127 (= res!122500 (= (select (arr!5822 (_keys!6748 thiss!1504)) (index!6508 lt!125330)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!250127 (=> res!122500 e!162208)))

(declare-fun b!250123 () Bool)

(assert (=> b!250123 (= e!162209 (Intermediate!1084 true (toIndex!0 key!932 (mask!10788 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun d!60895 () Bool)

(assert (=> d!60895 e!162211))

(declare-fun c!42013 () Bool)

(assert (=> d!60895 (= c!42013 (and ((_ is Intermediate!1084) lt!125330) (undefined!1896 lt!125330)))))

(assert (=> d!60895 (= lt!125330 e!162209)))

(declare-fun c!42015 () Bool)

(assert (=> d!60895 (= c!42015 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!60895 (= lt!125331 (select (arr!5822 (_keys!6748 thiss!1504)) (toIndex!0 key!932 (mask!10788 thiss!1504))))))

(assert (=> d!60895 (validMask!0 (mask!10788 thiss!1504))))

(assert (=> d!60895 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10788 thiss!1504)) key!932 (_keys!6748 thiss!1504) (mask!10788 thiss!1504)) lt!125330)))

(assert (= (and d!60895 c!42015) b!250123))

(assert (= (and d!60895 (not c!42015)) b!250125))

(assert (= (and b!250125 c!42014) b!250126))

(assert (= (and b!250125 (not c!42014)) b!250119))

(assert (= (and d!60895 c!42013) b!250122))

(assert (= (and d!60895 (not c!42013)) b!250124))

(assert (= (and b!250124 res!122499) b!250121))

(assert (= (and b!250121 (not res!122498)) b!250127))

(assert (= (and b!250127 (not res!122500)) b!250120))

(assert (=> b!250119 m!266653))

(declare-fun m!266681 () Bool)

(assert (=> b!250119 m!266681))

(assert (=> b!250119 m!266681))

(declare-fun m!266683 () Bool)

(assert (=> b!250119 m!266683))

(assert (=> d!60895 m!266653))

(declare-fun m!266685 () Bool)

(assert (=> d!60895 m!266685))

(assert (=> d!60895 m!266379))

(declare-fun m!266687 () Bool)

(assert (=> b!250120 m!266687))

(assert (=> b!250121 m!266687))

(assert (=> b!250127 m!266687))

(assert (=> d!60877 d!60895))

(declare-fun d!60897 () Bool)

(declare-fun lt!125337 () (_ BitVec 32))

(declare-fun lt!125336 () (_ BitVec 32))

(assert (=> d!60897 (= lt!125337 (bvmul (bvxor lt!125336 (bvlshr lt!125336 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!60897 (= lt!125336 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!60897 (and (bvsge (mask!10788 thiss!1504) #b00000000000000000000000000000000) (let ((res!122501 (let ((h!4297 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!24627 (bvmul (bvxor h!4297 (bvlshr h!4297 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!24627 (bvlshr x!24627 #b00000000000000000000000000001101)) (mask!10788 thiss!1504)))))) (and (bvslt res!122501 (bvadd (mask!10788 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!122501 #b00000000000000000000000000000000))))))

(assert (=> d!60897 (= (toIndex!0 key!932 (mask!10788 thiss!1504)) (bvand (bvxor lt!125337 (bvlshr lt!125337 #b00000000000000000000000000001101)) (mask!10788 thiss!1504)))))

(assert (=> d!60877 d!60897))

(assert (=> d!60877 d!60861))

(declare-fun d!60899 () Bool)

(declare-fun res!122506 () Bool)

(declare-fun e!162217 () Bool)

(assert (=> d!60899 (=> res!122506 e!162217)))

(assert (=> d!60899 (= res!122506 (and ((_ is Cons!3633) (toList!1853 (getCurrentListMap!1385 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)))) (= (_1!2391 (h!4292 (toList!1853 (getCurrentListMap!1385 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504))))) key!932)))))

(assert (=> d!60899 (= (containsKey!289 (toList!1853 (getCurrentListMap!1385 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504))) key!932) e!162217)))

(declare-fun b!250132 () Bool)

(declare-fun e!162218 () Bool)

(assert (=> b!250132 (= e!162217 e!162218)))

(declare-fun res!122507 () Bool)

(assert (=> b!250132 (=> (not res!122507) (not e!162218))))

(assert (=> b!250132 (= res!122507 (and (or (not ((_ is Cons!3633) (toList!1853 (getCurrentListMap!1385 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504))))) (bvsle (_1!2391 (h!4292 (toList!1853 (getCurrentListMap!1385 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504))))) key!932)) ((_ is Cons!3633) (toList!1853 (getCurrentListMap!1385 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)))) (bvslt (_1!2391 (h!4292 (toList!1853 (getCurrentListMap!1385 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504))))) key!932)))))

(declare-fun b!250133 () Bool)

(assert (=> b!250133 (= e!162218 (containsKey!289 (t!8660 (toList!1853 (getCurrentListMap!1385 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)))) key!932))))

(assert (= (and d!60899 (not res!122506)) b!250132))

(assert (= (and b!250132 res!122507) b!250133))

(declare-fun m!266689 () Bool)

(assert (=> b!250133 m!266689))

(assert (=> d!60873 d!60899))

(declare-fun b!250135 () Bool)

(declare-fun e!162219 () Bool)

(declare-fun call!23484 () Bool)

(assert (=> b!250135 (= e!162219 call!23484)))

(declare-fun b!250136 () Bool)

(declare-fun e!162222 () Bool)

(assert (=> b!250136 (= e!162222 (contains!1791 Nil!3635 (select (arr!5822 (array!12278 (store (arr!5822 (_keys!6748 thiss!1504)) index!297 key!932) (size!6166 (_keys!6748 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!250137 () Bool)

(declare-fun e!162221 () Bool)

(assert (=> b!250137 (= e!162221 e!162219)))

(declare-fun c!42016 () Bool)

(assert (=> b!250137 (= c!42016 (validKeyInArray!0 (select (arr!5822 (array!12278 (store (arr!5822 (_keys!6748 thiss!1504)) index!297 key!932) (size!6166 (_keys!6748 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!250138 () Bool)

(assert (=> b!250138 (= e!162219 call!23484)))

(declare-fun bm!23481 () Bool)

(assert (=> bm!23481 (= call!23484 (arrayNoDuplicates!0 (array!12278 (store (arr!5822 (_keys!6748 thiss!1504)) index!297 key!932) (size!6166 (_keys!6748 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42016 (Cons!3634 (select (arr!5822 (array!12278 (store (arr!5822 (_keys!6748 thiss!1504)) index!297 key!932) (size!6166 (_keys!6748 thiss!1504)))) #b00000000000000000000000000000000) Nil!3635) Nil!3635)))))

(declare-fun d!60901 () Bool)

(declare-fun res!122510 () Bool)

(declare-fun e!162220 () Bool)

(assert (=> d!60901 (=> res!122510 e!162220)))

(assert (=> d!60901 (= res!122510 (bvsge #b00000000000000000000000000000000 (size!6166 (array!12278 (store (arr!5822 (_keys!6748 thiss!1504)) index!297 key!932) (size!6166 (_keys!6748 thiss!1504))))))))

(assert (=> d!60901 (= (arrayNoDuplicates!0 (array!12278 (store (arr!5822 (_keys!6748 thiss!1504)) index!297 key!932) (size!6166 (_keys!6748 thiss!1504))) #b00000000000000000000000000000000 Nil!3635) e!162220)))

(declare-fun b!250134 () Bool)

(assert (=> b!250134 (= e!162220 e!162221)))

(declare-fun res!122509 () Bool)

(assert (=> b!250134 (=> (not res!122509) (not e!162221))))

(assert (=> b!250134 (= res!122509 (not e!162222))))

(declare-fun res!122508 () Bool)

(assert (=> b!250134 (=> (not res!122508) (not e!162222))))

(assert (=> b!250134 (= res!122508 (validKeyInArray!0 (select (arr!5822 (array!12278 (store (arr!5822 (_keys!6748 thiss!1504)) index!297 key!932) (size!6166 (_keys!6748 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (= (and d!60901 (not res!122510)) b!250134))

(assert (= (and b!250134 res!122508) b!250136))

(assert (= (and b!250134 res!122509) b!250137))

(assert (= (and b!250137 c!42016) b!250135))

(assert (= (and b!250137 (not c!42016)) b!250138))

(assert (= (or b!250135 b!250138) bm!23481))

(declare-fun m!266691 () Bool)

(assert (=> b!250136 m!266691))

(assert (=> b!250136 m!266691))

(declare-fun m!266693 () Bool)

(assert (=> b!250136 m!266693))

(assert (=> b!250137 m!266691))

(assert (=> b!250137 m!266691))

(declare-fun m!266695 () Bool)

(assert (=> b!250137 m!266695))

(assert (=> bm!23481 m!266691))

(declare-fun m!266697 () Bool)

(assert (=> bm!23481 m!266697))

(assert (=> b!250134 m!266691))

(assert (=> b!250134 m!266691))

(assert (=> b!250134 m!266695))

(assert (=> b!249967 d!60901))

(declare-fun d!60903 () Bool)

(declare-fun e!162224 () Bool)

(assert (=> d!60903 e!162224))

(declare-fun res!122511 () Bool)

(assert (=> d!60903 (=> res!122511 e!162224)))

(declare-fun lt!125339 () Bool)

(assert (=> d!60903 (= res!122511 (not lt!125339))))

(declare-fun lt!125338 () Bool)

(assert (=> d!60903 (= lt!125339 lt!125338)))

(declare-fun lt!125341 () Unit!7701)

(declare-fun e!162223 () Unit!7701)

(assert (=> d!60903 (= lt!125341 e!162223)))

(declare-fun c!42017 () Bool)

(assert (=> d!60903 (= c!42017 lt!125338)))

(assert (=> d!60903 (= lt!125338 (containsKey!289 (toList!1853 lt!125298) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!60903 (= (contains!1788 lt!125298 #b0000000000000000000000000000000000000000000000000000000000000000) lt!125339)))

(declare-fun b!250139 () Bool)

(declare-fun lt!125340 () Unit!7701)

(assert (=> b!250139 (= e!162223 lt!125340)))

(assert (=> b!250139 (= lt!125340 (lemmaContainsKeyImpliesGetValueByKeyDefined!237 (toList!1853 lt!125298) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!250139 (isDefined!238 (getValueByKey!298 (toList!1853 lt!125298) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!250140 () Bool)

(declare-fun Unit!7717 () Unit!7701)

(assert (=> b!250140 (= e!162223 Unit!7717)))

(declare-fun b!250141 () Bool)

(assert (=> b!250141 (= e!162224 (isDefined!238 (getValueByKey!298 (toList!1853 lt!125298) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!60903 c!42017) b!250139))

(assert (= (and d!60903 (not c!42017)) b!250140))

(assert (= (and d!60903 (not res!122511)) b!250141))

(declare-fun m!266699 () Bool)

(assert (=> d!60903 m!266699))

(declare-fun m!266701 () Bool)

(assert (=> b!250139 m!266701))

(declare-fun m!266703 () Bool)

(assert (=> b!250139 m!266703))

(assert (=> b!250139 m!266703))

(declare-fun m!266705 () Bool)

(assert (=> b!250139 m!266705))

(assert (=> b!250141 m!266703))

(assert (=> b!250141 m!266703))

(assert (=> b!250141 m!266705))

(assert (=> bm!23476 d!60903))

(declare-fun d!60905 () Bool)

(assert (=> d!60905 (= (validKeyInArray!0 (select (arr!5822 (_keys!6748 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5822 (_keys!6748 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5822 (_keys!6748 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!250038 d!60905))

(declare-fun b!250143 () Bool)

(declare-fun e!162225 () Bool)

(declare-fun call!23485 () Bool)

(assert (=> b!250143 (= e!162225 call!23485)))

(declare-fun b!250144 () Bool)

(declare-fun e!162228 () Bool)

(assert (=> b!250144 (= e!162228 (contains!1791 (ite c!41964 (Cons!3634 (select (arr!5822 lt!125128) #b00000000000000000000000000000000) Nil!3635) Nil!3635) (select (arr!5822 lt!125128) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!250145 () Bool)

(declare-fun e!162227 () Bool)

(assert (=> b!250145 (= e!162227 e!162225)))

(declare-fun c!42018 () Bool)

(assert (=> b!250145 (= c!42018 (validKeyInArray!0 (select (arr!5822 lt!125128) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!250146 () Bool)

(assert (=> b!250146 (= e!162225 call!23485)))

(declare-fun bm!23482 () Bool)

(assert (=> bm!23482 (= call!23485 (arrayNoDuplicates!0 lt!125128 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!42018 (Cons!3634 (select (arr!5822 lt!125128) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!41964 (Cons!3634 (select (arr!5822 lt!125128) #b00000000000000000000000000000000) Nil!3635) Nil!3635)) (ite c!41964 (Cons!3634 (select (arr!5822 lt!125128) #b00000000000000000000000000000000) Nil!3635) Nil!3635))))))

(declare-fun d!60907 () Bool)

(declare-fun res!122514 () Bool)

(declare-fun e!162226 () Bool)

(assert (=> d!60907 (=> res!122514 e!162226)))

(assert (=> d!60907 (= res!122514 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6166 lt!125128)))))

(assert (=> d!60907 (= (arrayNoDuplicates!0 lt!125128 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41964 (Cons!3634 (select (arr!5822 lt!125128) #b00000000000000000000000000000000) Nil!3635) Nil!3635)) e!162226)))

(declare-fun b!250142 () Bool)

(assert (=> b!250142 (= e!162226 e!162227)))

(declare-fun res!122513 () Bool)

(assert (=> b!250142 (=> (not res!122513) (not e!162227))))

(assert (=> b!250142 (= res!122513 (not e!162228))))

(declare-fun res!122512 () Bool)

(assert (=> b!250142 (=> (not res!122512) (not e!162228))))

(assert (=> b!250142 (= res!122512 (validKeyInArray!0 (select (arr!5822 lt!125128) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!60907 (not res!122514)) b!250142))

(assert (= (and b!250142 res!122512) b!250144))

(assert (= (and b!250142 res!122513) b!250145))

(assert (= (and b!250145 c!42018) b!250143))

(assert (= (and b!250145 (not c!42018)) b!250146))

(assert (= (or b!250143 b!250146) bm!23482))

(declare-fun m!266707 () Bool)

(assert (=> b!250144 m!266707))

(assert (=> b!250144 m!266707))

(declare-fun m!266709 () Bool)

(assert (=> b!250144 m!266709))

(assert (=> b!250145 m!266707))

(assert (=> b!250145 m!266707))

(declare-fun m!266711 () Bool)

(assert (=> b!250145 m!266711))

(assert (=> bm!23482 m!266707))

(declare-fun m!266713 () Bool)

(assert (=> bm!23482 m!266713))

(assert (=> b!250142 m!266707))

(assert (=> b!250142 m!266707))

(assert (=> b!250142 m!266711))

(assert (=> bm!23459 d!60907))

(assert (=> bm!23448 d!60867))

(declare-fun d!60909 () Bool)

(declare-fun isEmpty!532 (Option!304) Bool)

(assert (=> d!60909 (= (isDefined!238 (getValueByKey!298 (toList!1853 (getCurrentListMap!1385 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504))) key!932)) (not (isEmpty!532 (getValueByKey!298 (toList!1853 (getCurrentListMap!1385 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504))) key!932))))))

(declare-fun bs!8985 () Bool)

(assert (= bs!8985 d!60909))

(assert (=> bs!8985 m!266591))

(declare-fun m!266715 () Bool)

(assert (=> bs!8985 m!266715))

(assert (=> b!249985 d!60909))

(declare-fun d!60911 () Bool)

(declare-fun c!42023 () Bool)

(assert (=> d!60911 (= c!42023 (and ((_ is Cons!3633) (toList!1853 (getCurrentListMap!1385 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)))) (= (_1!2391 (h!4292 (toList!1853 (getCurrentListMap!1385 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504))))) key!932)))))

(declare-fun e!162233 () Option!304)

(assert (=> d!60911 (= (getValueByKey!298 (toList!1853 (getCurrentListMap!1385 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504))) key!932) e!162233)))

(declare-fun b!250158 () Bool)

(declare-fun e!162234 () Option!304)

(assert (=> b!250158 (= e!162234 None!302)))

(declare-fun b!250155 () Bool)

(assert (=> b!250155 (= e!162233 (Some!303 (_2!2391 (h!4292 (toList!1853 (getCurrentListMap!1385 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)))))))))

(declare-fun b!250157 () Bool)

(assert (=> b!250157 (= e!162234 (getValueByKey!298 (t!8660 (toList!1853 (getCurrentListMap!1385 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)))) key!932))))

(declare-fun b!250156 () Bool)

(assert (=> b!250156 (= e!162233 e!162234)))

(declare-fun c!42024 () Bool)

(assert (=> b!250156 (= c!42024 (and ((_ is Cons!3633) (toList!1853 (getCurrentListMap!1385 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)))) (not (= (_1!2391 (h!4292 (toList!1853 (getCurrentListMap!1385 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504))))) key!932))))))

(assert (= (and d!60911 c!42023) b!250155))

(assert (= (and d!60911 (not c!42023)) b!250156))

(assert (= (and b!250156 c!42024) b!250157))

(assert (= (and b!250156 (not c!42024)) b!250158))

(declare-fun m!266717 () Bool)

(assert (=> b!250157 m!266717))

(assert (=> b!249985 d!60911))

(declare-fun d!60913 () Bool)

(declare-fun lt!125344 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!166 (List!3638) (InoxSet (_ BitVec 64)))

(assert (=> d!60913 (= lt!125344 (select (content!166 Nil!3635) (select (arr!5822 lt!125128) #b00000000000000000000000000000000)))))

(declare-fun e!162240 () Bool)

(assert (=> d!60913 (= lt!125344 e!162240)))

(declare-fun res!122519 () Bool)

(assert (=> d!60913 (=> (not res!122519) (not e!162240))))

(assert (=> d!60913 (= res!122519 ((_ is Cons!3634) Nil!3635))))

(assert (=> d!60913 (= (contains!1791 Nil!3635 (select (arr!5822 lt!125128) #b00000000000000000000000000000000)) lt!125344)))

(declare-fun b!250163 () Bool)

(declare-fun e!162239 () Bool)

(assert (=> b!250163 (= e!162240 e!162239)))

(declare-fun res!122520 () Bool)

(assert (=> b!250163 (=> res!122520 e!162239)))

(assert (=> b!250163 (= res!122520 (= (h!4293 Nil!3635) (select (arr!5822 lt!125128) #b00000000000000000000000000000000)))))

(declare-fun b!250164 () Bool)

(assert (=> b!250164 (= e!162239 (contains!1791 (t!8661 Nil!3635) (select (arr!5822 lt!125128) #b00000000000000000000000000000000)))))

(assert (= (and d!60913 res!122519) b!250163))

(assert (= (and b!250163 (not res!122520)) b!250164))

(declare-fun m!266719 () Bool)

(assert (=> d!60913 m!266719))

(assert (=> d!60913 m!266555))

(declare-fun m!266721 () Bool)

(assert (=> d!60913 m!266721))

(assert (=> b!250164 m!266555))

(declare-fun m!266723 () Bool)

(assert (=> b!250164 m!266723))

(assert (=> b!249962 d!60913))

(declare-fun d!60915 () Bool)

(assert (=> d!60915 (arrayContainsKey!0 lt!125128 lt!125220 #b00000000000000000000000000000000)))

(declare-fun lt!125347 () Unit!7701)

(declare-fun choose!13 (array!12277 (_ BitVec 64) (_ BitVec 32)) Unit!7701)

(assert (=> d!60915 (= lt!125347 (choose!13 lt!125128 lt!125220 #b00000000000000000000000000000000))))

(assert (=> d!60915 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!60915 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!125128 lt!125220 #b00000000000000000000000000000000) lt!125347)))

(declare-fun bs!8986 () Bool)

(assert (= bs!8986 d!60915))

(assert (=> bs!8986 m!266559))

(declare-fun m!266725 () Bool)

(assert (=> bs!8986 m!266725))

(assert (=> b!249932 d!60915))

(declare-fun d!60917 () Bool)

(declare-fun res!122521 () Bool)

(declare-fun e!162241 () Bool)

(assert (=> d!60917 (=> res!122521 e!162241)))

(assert (=> d!60917 (= res!122521 (= (select (arr!5822 lt!125128) #b00000000000000000000000000000000) lt!125220))))

(assert (=> d!60917 (= (arrayContainsKey!0 lt!125128 lt!125220 #b00000000000000000000000000000000) e!162241)))

(declare-fun b!250165 () Bool)

(declare-fun e!162242 () Bool)

(assert (=> b!250165 (= e!162241 e!162242)))

(declare-fun res!122522 () Bool)

(assert (=> b!250165 (=> (not res!122522) (not e!162242))))

(assert (=> b!250165 (= res!122522 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6166 lt!125128)))))

(declare-fun b!250166 () Bool)

(assert (=> b!250166 (= e!162242 (arrayContainsKey!0 lt!125128 lt!125220 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60917 (not res!122521)) b!250165))

(assert (= (and b!250165 res!122522) b!250166))

(assert (=> d!60917 m!266555))

(declare-fun m!266727 () Bool)

(assert (=> b!250166 m!266727))

(assert (=> b!249932 d!60917))

(declare-fun b!250167 () Bool)

(declare-fun lt!125350 () SeekEntryResult!1084)

(declare-fun e!162244 () SeekEntryResult!1084)

(assert (=> b!250167 (= e!162244 (seekKeyOrZeroReturnVacant!0 (x!24608 lt!125350) (index!6508 lt!125350) (index!6508 lt!125350) (select (arr!5822 lt!125128) #b00000000000000000000000000000000) lt!125128 (mask!10788 thiss!1504)))))

(declare-fun b!250168 () Bool)

(declare-fun e!162245 () SeekEntryResult!1084)

(assert (=> b!250168 (= e!162245 (Found!1084 (index!6508 lt!125350)))))

(declare-fun b!250169 () Bool)

(assert (=> b!250169 (= e!162244 (MissingZero!1084 (index!6508 lt!125350)))))

(declare-fun b!250170 () Bool)

(declare-fun e!162243 () SeekEntryResult!1084)

(assert (=> b!250170 (= e!162243 e!162245)))

(declare-fun lt!125349 () (_ BitVec 64))

(assert (=> b!250170 (= lt!125349 (select (arr!5822 lt!125128) (index!6508 lt!125350)))))

(declare-fun c!42027 () Bool)

(assert (=> b!250170 (= c!42027 (= lt!125349 (select (arr!5822 lt!125128) #b00000000000000000000000000000000)))))

(declare-fun b!250171 () Bool)

(declare-fun c!42026 () Bool)

(assert (=> b!250171 (= c!42026 (= lt!125349 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!250171 (= e!162245 e!162244)))

(declare-fun d!60919 () Bool)

(declare-fun lt!125348 () SeekEntryResult!1084)

(assert (=> d!60919 (and (or ((_ is Undefined!1084) lt!125348) (not ((_ is Found!1084) lt!125348)) (and (bvsge (index!6507 lt!125348) #b00000000000000000000000000000000) (bvslt (index!6507 lt!125348) (size!6166 lt!125128)))) (or ((_ is Undefined!1084) lt!125348) ((_ is Found!1084) lt!125348) (not ((_ is MissingZero!1084) lt!125348)) (and (bvsge (index!6506 lt!125348) #b00000000000000000000000000000000) (bvslt (index!6506 lt!125348) (size!6166 lt!125128)))) (or ((_ is Undefined!1084) lt!125348) ((_ is Found!1084) lt!125348) ((_ is MissingZero!1084) lt!125348) (not ((_ is MissingVacant!1084) lt!125348)) (and (bvsge (index!6509 lt!125348) #b00000000000000000000000000000000) (bvslt (index!6509 lt!125348) (size!6166 lt!125128)))) (or ((_ is Undefined!1084) lt!125348) (ite ((_ is Found!1084) lt!125348) (= (select (arr!5822 lt!125128) (index!6507 lt!125348)) (select (arr!5822 lt!125128) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1084) lt!125348) (= (select (arr!5822 lt!125128) (index!6506 lt!125348)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1084) lt!125348) (= (select (arr!5822 lt!125128) (index!6509 lt!125348)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!60919 (= lt!125348 e!162243)))

(declare-fun c!42025 () Bool)

(assert (=> d!60919 (= c!42025 (and ((_ is Intermediate!1084) lt!125350) (undefined!1896 lt!125350)))))

(assert (=> d!60919 (= lt!125350 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!5822 lt!125128) #b00000000000000000000000000000000) (mask!10788 thiss!1504)) (select (arr!5822 lt!125128) #b00000000000000000000000000000000) lt!125128 (mask!10788 thiss!1504)))))

(assert (=> d!60919 (validMask!0 (mask!10788 thiss!1504))))

(assert (=> d!60919 (= (seekEntryOrOpen!0 (select (arr!5822 lt!125128) #b00000000000000000000000000000000) lt!125128 (mask!10788 thiss!1504)) lt!125348)))

(declare-fun b!250172 () Bool)

(assert (=> b!250172 (= e!162243 Undefined!1084)))

(assert (= (and d!60919 c!42025) b!250172))

(assert (= (and d!60919 (not c!42025)) b!250170))

(assert (= (and b!250170 c!42027) b!250168))

(assert (= (and b!250170 (not c!42027)) b!250171))

(assert (= (and b!250171 c!42026) b!250169))

(assert (= (and b!250171 (not c!42026)) b!250167))

(assert (=> b!250167 m!266555))

(declare-fun m!266729 () Bool)

(assert (=> b!250167 m!266729))

(declare-fun m!266731 () Bool)

(assert (=> b!250170 m!266731))

(declare-fun m!266733 () Bool)

(assert (=> d!60919 m!266733))

(assert (=> d!60919 m!266555))

(declare-fun m!266735 () Bool)

(assert (=> d!60919 m!266735))

(declare-fun m!266737 () Bool)

(assert (=> d!60919 m!266737))

(declare-fun m!266739 () Bool)

(assert (=> d!60919 m!266739))

(declare-fun m!266741 () Bool)

(assert (=> d!60919 m!266741))

(assert (=> d!60919 m!266379))

(assert (=> d!60919 m!266555))

(assert (=> d!60919 m!266733))

(assert (=> b!249932 d!60919))

(assert (=> b!249907 d!60859))

(assert (=> b!249947 d!60905))

(declare-fun d!60921 () Bool)

(assert (=> d!60921 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!249919 d!60921))

(declare-fun b!250174 () Bool)

(declare-fun e!162246 () Bool)

(declare-fun call!23486 () Bool)

(assert (=> b!250174 (= e!162246 call!23486)))

(declare-fun b!250175 () Bool)

(declare-fun e!162249 () Bool)

(assert (=> b!250175 (= e!162249 (contains!1791 Nil!3635 (select (arr!5822 (_keys!6748 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!250176 () Bool)

(declare-fun e!162248 () Bool)

(assert (=> b!250176 (= e!162248 e!162246)))

(declare-fun c!42028 () Bool)

(assert (=> b!250176 (= c!42028 (validKeyInArray!0 (select (arr!5822 (_keys!6748 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!250177 () Bool)

(assert (=> b!250177 (= e!162246 call!23486)))

(declare-fun bm!23483 () Bool)

(assert (=> bm!23483 (= call!23486 (arrayNoDuplicates!0 (_keys!6748 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42028 (Cons!3634 (select (arr!5822 (_keys!6748 thiss!1504)) #b00000000000000000000000000000000) Nil!3635) Nil!3635)))))

(declare-fun d!60923 () Bool)

(declare-fun res!122525 () Bool)

(declare-fun e!162247 () Bool)

(assert (=> d!60923 (=> res!122525 e!162247)))

(assert (=> d!60923 (= res!122525 (bvsge #b00000000000000000000000000000000 (size!6166 (_keys!6748 thiss!1504))))))

(assert (=> d!60923 (= (arrayNoDuplicates!0 (_keys!6748 thiss!1504) #b00000000000000000000000000000000 Nil!3635) e!162247)))

(declare-fun b!250173 () Bool)

(assert (=> b!250173 (= e!162247 e!162248)))

(declare-fun res!122524 () Bool)

(assert (=> b!250173 (=> (not res!122524) (not e!162248))))

(assert (=> b!250173 (= res!122524 (not e!162249))))

(declare-fun res!122523 () Bool)

(assert (=> b!250173 (=> (not res!122523) (not e!162249))))

(assert (=> b!250173 (= res!122523 (validKeyInArray!0 (select (arr!5822 (_keys!6748 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!60923 (not res!122525)) b!250173))

(assert (= (and b!250173 res!122523) b!250175))

(assert (= (and b!250173 res!122524) b!250176))

(assert (= (and b!250176 c!42028) b!250174))

(assert (= (and b!250176 (not c!42028)) b!250177))

(assert (= (or b!250174 b!250177) bm!23483))

(assert (=> b!250175 m!266567))

(assert (=> b!250175 m!266567))

(declare-fun m!266743 () Bool)

(assert (=> b!250175 m!266743))

(assert (=> b!250176 m!266567))

(assert (=> b!250176 m!266567))

(assert (=> b!250176 m!266569))

(assert (=> bm!23483 m!266567))

(declare-fun m!266745 () Bool)

(assert (=> bm!23483 m!266745))

(assert (=> b!250173 m!266567))

(assert (=> b!250173 m!266567))

(assert (=> b!250173 m!266569))

(assert (=> b!249909 d!60923))

(declare-fun d!60925 () Bool)

(assert (=> d!60925 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12278 (store (arr!5822 (_keys!6748 thiss!1504)) index!297 key!932) (size!6166 (_keys!6748 thiss!1504))) (mask!10788 thiss!1504))))

(assert (=> d!60925 true))

(declare-fun _$56!24 () Unit!7701)

(assert (=> d!60925 (= (choose!102 key!932 (_keys!6748 thiss!1504) index!297 (mask!10788 thiss!1504)) _$56!24)))

(declare-fun bs!8987 () Bool)

(assert (= bs!8987 d!60925))

(assert (=> bs!8987 m!266389))

(assert (=> bs!8987 m!266585))

(assert (=> d!60869 d!60925))

(assert (=> d!60869 d!60861))

(declare-fun d!60927 () Bool)

(assert (=> d!60927 (isDefined!238 (getValueByKey!298 (toList!1853 (getCurrentListMap!1385 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504))) key!932))))

(declare-fun lt!125353 () Unit!7701)

(declare-fun choose!1189 (List!3637 (_ BitVec 64)) Unit!7701)

(assert (=> d!60927 (= lt!125353 (choose!1189 (toList!1853 (getCurrentListMap!1385 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504))) key!932))))

(declare-fun e!162252 () Bool)

(assert (=> d!60927 e!162252))

(declare-fun res!122528 () Bool)

(assert (=> d!60927 (=> (not res!122528) (not e!162252))))

(declare-fun isStrictlySorted!357 (List!3637) Bool)

(assert (=> d!60927 (= res!122528 (isStrictlySorted!357 (toList!1853 (getCurrentListMap!1385 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)))))))

(assert (=> d!60927 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!237 (toList!1853 (getCurrentListMap!1385 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504))) key!932) lt!125353)))

(declare-fun b!250180 () Bool)

(assert (=> b!250180 (= e!162252 (containsKey!289 (toList!1853 (getCurrentListMap!1385 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504))) key!932))))

(assert (= (and d!60927 res!122528) b!250180))

(assert (=> d!60927 m!266591))

(assert (=> d!60927 m!266591))

(assert (=> d!60927 m!266593))

(declare-fun m!266747 () Bool)

(assert (=> d!60927 m!266747))

(declare-fun m!266749 () Bool)

(assert (=> d!60927 m!266749))

(assert (=> b!250180 m!266587))

(assert (=> b!249983 d!60927))

(assert (=> b!249983 d!60909))

(assert (=> b!249983 d!60911))

(declare-fun d!60929 () Bool)

(assert (=> d!60929 (= (validKeyInArray!0 (select (arr!5822 lt!125128) #b00000000000000000000000000000000)) (and (not (= (select (arr!5822 lt!125128) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5822 lt!125128) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!249960 d!60929))

(declare-fun b!250205 () Bool)

(declare-fun e!162267 () ListLongMap!3675)

(declare-fun e!162271 () ListLongMap!3675)

(assert (=> b!250205 (= e!162267 e!162271)))

(declare-fun c!42039 () Bool)

(assert (=> b!250205 (= c!42039 (validKeyInArray!0 (select (arr!5822 (_keys!6748 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!250206 () Bool)

(declare-fun e!162273 () Bool)

(declare-fun e!162270 () Bool)

(assert (=> b!250206 (= e!162273 e!162270)))

(assert (=> b!250206 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6166 (_keys!6748 thiss!1504))))))

(declare-fun res!122537 () Bool)

(declare-fun lt!125370 () ListLongMap!3675)

(assert (=> b!250206 (= res!122537 (contains!1788 lt!125370 (select (arr!5822 (_keys!6748 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!250206 (=> (not res!122537) (not e!162270))))

(declare-fun b!250207 () Bool)

(declare-fun res!122538 () Bool)

(declare-fun e!162272 () Bool)

(assert (=> b!250207 (=> (not res!122538) (not e!162272))))

(assert (=> b!250207 (= res!122538 (not (contains!1788 lt!125370 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!23486 () Bool)

(declare-fun call!23489 () ListLongMap!3675)

(assert (=> bm!23486 (= call!23489 (getCurrentListMapNoExtraKeys!555 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4616 thiss!1504)))))

(declare-fun b!250208 () Bool)

(assert (=> b!250208 (= e!162272 e!162273)))

(declare-fun c!42040 () Bool)

(declare-fun e!162269 () Bool)

(assert (=> b!250208 (= c!42040 e!162269)))

(declare-fun res!122540 () Bool)

(assert (=> b!250208 (=> (not res!122540) (not e!162269))))

(assert (=> b!250208 (= res!122540 (bvslt #b00000000000000000000000000000000 (size!6166 (_keys!6748 thiss!1504))))))

(declare-fun b!250209 () Bool)

(assert (=> b!250209 (= e!162267 (ListLongMap!3676 Nil!3634))))

(declare-fun b!250210 () Bool)

(declare-fun e!162268 () Bool)

(assert (=> b!250210 (= e!162268 (= lt!125370 (getCurrentListMapNoExtraKeys!555 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4616 thiss!1504))))))

(declare-fun b!250212 () Bool)

(assert (=> b!250212 (= e!162269 (validKeyInArray!0 (select (arr!5822 (_keys!6748 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!250212 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!250213 () Bool)

(assert (=> b!250213 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6166 (_keys!6748 thiss!1504))))))

(assert (=> b!250213 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6165 (_values!4599 thiss!1504))))))

(assert (=> b!250213 (= e!162270 (= (apply!239 lt!125370 (select (arr!5822 (_keys!6748 thiss!1504)) #b00000000000000000000000000000000)) (get!2997 (select (arr!5821 (_values!4599 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!582 (defaultEntry!4616 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!250214 () Bool)

(declare-fun lt!125372 () Unit!7701)

(declare-fun lt!125374 () Unit!7701)

(assert (=> b!250214 (= lt!125372 lt!125374)))

(declare-fun lt!125368 () V!8289)

(declare-fun lt!125369 () ListLongMap!3675)

(declare-fun lt!125373 () (_ BitVec 64))

(declare-fun lt!125371 () (_ BitVec 64))

(assert (=> b!250214 (not (contains!1788 (+!666 lt!125369 (tuple2!4761 lt!125373 lt!125368)) lt!125371))))

(declare-fun addStillNotContains!124 (ListLongMap!3675 (_ BitVec 64) V!8289 (_ BitVec 64)) Unit!7701)

(assert (=> b!250214 (= lt!125374 (addStillNotContains!124 lt!125369 lt!125373 lt!125368 lt!125371))))

(assert (=> b!250214 (= lt!125371 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!250214 (= lt!125368 (get!2997 (select (arr!5821 (_values!4599 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!582 (defaultEntry!4616 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!250214 (= lt!125373 (select (arr!5822 (_keys!6748 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!250214 (= lt!125369 call!23489)))

(assert (=> b!250214 (= e!162271 (+!666 call!23489 (tuple2!4761 (select (arr!5822 (_keys!6748 thiss!1504)) #b00000000000000000000000000000000) (get!2997 (select (arr!5821 (_values!4599 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!582 (defaultEntry!4616 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!250215 () Bool)

(declare-fun isEmpty!533 (ListLongMap!3675) Bool)

(assert (=> b!250215 (= e!162268 (isEmpty!533 lt!125370))))

(declare-fun b!250216 () Bool)

(assert (=> b!250216 (= e!162273 e!162268)))

(declare-fun c!42037 () Bool)

(assert (=> b!250216 (= c!42037 (bvslt #b00000000000000000000000000000000 (size!6166 (_keys!6748 thiss!1504))))))

(declare-fun d!60931 () Bool)

(assert (=> d!60931 e!162272))

(declare-fun res!122539 () Bool)

(assert (=> d!60931 (=> (not res!122539) (not e!162272))))

(assert (=> d!60931 (= res!122539 (not (contains!1788 lt!125370 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60931 (= lt!125370 e!162267)))

(declare-fun c!42038 () Bool)

(assert (=> d!60931 (= c!42038 (bvsge #b00000000000000000000000000000000 (size!6166 (_keys!6748 thiss!1504))))))

(assert (=> d!60931 (validMask!0 (mask!10788 thiss!1504))))

(assert (=> d!60931 (= (getCurrentListMapNoExtraKeys!555 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)) lt!125370)))

(declare-fun b!250211 () Bool)

(assert (=> b!250211 (= e!162271 call!23489)))

(assert (= (and d!60931 c!42038) b!250209))

(assert (= (and d!60931 (not c!42038)) b!250205))

(assert (= (and b!250205 c!42039) b!250214))

(assert (= (and b!250205 (not c!42039)) b!250211))

(assert (= (or b!250214 b!250211) bm!23486))

(assert (= (and d!60931 res!122539) b!250207))

(assert (= (and b!250207 res!122538) b!250208))

(assert (= (and b!250208 res!122540) b!250212))

(assert (= (and b!250208 c!42040) b!250206))

(assert (= (and b!250208 (not c!42040)) b!250216))

(assert (= (and b!250206 res!122537) b!250213))

(assert (= (and b!250216 c!42037) b!250210))

(assert (= (and b!250216 (not c!42037)) b!250215))

(declare-fun b_lambda!8101 () Bool)

(assert (=> (not b_lambda!8101) (not b!250213)))

(assert (=> b!250213 t!8666))

(declare-fun b_and!13655 () Bool)

(assert (= b_and!13653 (and (=> t!8666 result!5287) b_and!13655)))

(declare-fun b_lambda!8103 () Bool)

(assert (=> (not b_lambda!8103) (not b!250214)))

(assert (=> b!250214 t!8666))

(declare-fun b_and!13657 () Bool)

(assert (= b_and!13655 (and (=> t!8666 result!5287) b_and!13657)))

(assert (=> b!250205 m!266567))

(assert (=> b!250205 m!266567))

(assert (=> b!250205 m!266569))

(declare-fun m!266751 () Bool)

(assert (=> b!250210 m!266751))

(declare-fun m!266753 () Bool)

(assert (=> b!250214 m!266753))

(declare-fun m!266755 () Bool)

(assert (=> b!250214 m!266755))

(declare-fun m!266757 () Bool)

(assert (=> b!250214 m!266757))

(assert (=> b!250214 m!266599))

(declare-fun m!266759 () Bool)

(assert (=> b!250214 m!266759))

(assert (=> b!250214 m!266597))

(assert (=> b!250214 m!266753))

(assert (=> b!250214 m!266567))

(assert (=> b!250214 m!266597))

(assert (=> b!250214 m!266599))

(assert (=> b!250214 m!266601))

(assert (=> bm!23486 m!266751))

(declare-fun m!266761 () Bool)

(assert (=> d!60931 m!266761))

(assert (=> d!60931 m!266379))

(assert (=> b!250206 m!266567))

(assert (=> b!250206 m!266567))

(declare-fun m!266763 () Bool)

(assert (=> b!250206 m!266763))

(assert (=> b!250212 m!266567))

(assert (=> b!250212 m!266567))

(assert (=> b!250212 m!266569))

(declare-fun m!266765 () Bool)

(assert (=> b!250215 m!266765))

(assert (=> b!250213 m!266567))

(declare-fun m!266767 () Bool)

(assert (=> b!250213 m!266767))

(assert (=> b!250213 m!266599))

(assert (=> b!250213 m!266597))

(assert (=> b!250213 m!266567))

(assert (=> b!250213 m!266597))

(assert (=> b!250213 m!266599))

(assert (=> b!250213 m!266601))

(declare-fun m!266769 () Bool)

(assert (=> b!250207 m!266769))

(assert (=> bm!23480 d!60931))

(declare-fun d!60933 () Bool)

(declare-fun e!162276 () Bool)

(assert (=> d!60933 e!162276))

(declare-fun res!122545 () Bool)

(assert (=> d!60933 (=> (not res!122545) (not e!162276))))

(declare-fun lt!125384 () ListLongMap!3675)

(assert (=> d!60933 (= res!122545 (contains!1788 lt!125384 (_1!2391 (ite (or c!41983 c!41982) (tuple2!4761 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4457 thiss!1504)) (tuple2!4761 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504))))))))

(declare-fun lt!125385 () List!3637)

(assert (=> d!60933 (= lt!125384 (ListLongMap!3676 lt!125385))))

(declare-fun lt!125386 () Unit!7701)

(declare-fun lt!125383 () Unit!7701)

(assert (=> d!60933 (= lt!125386 lt!125383)))

(assert (=> d!60933 (= (getValueByKey!298 lt!125385 (_1!2391 (ite (or c!41983 c!41982) (tuple2!4761 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4457 thiss!1504)) (tuple2!4761 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504))))) (Some!303 (_2!2391 (ite (or c!41983 c!41982) (tuple2!4761 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4457 thiss!1504)) (tuple2!4761 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!159 (List!3637 (_ BitVec 64) V!8289) Unit!7701)

(assert (=> d!60933 (= lt!125383 (lemmaContainsTupThenGetReturnValue!159 lt!125385 (_1!2391 (ite (or c!41983 c!41982) (tuple2!4761 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4457 thiss!1504)) (tuple2!4761 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504)))) (_2!2391 (ite (or c!41983 c!41982) (tuple2!4761 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4457 thiss!1504)) (tuple2!4761 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504))))))))

(declare-fun insertStrictlySorted!162 (List!3637 (_ BitVec 64) V!8289) List!3637)

(assert (=> d!60933 (= lt!125385 (insertStrictlySorted!162 (toList!1853 (ite c!41983 call!23477 (ite c!41982 call!23481 call!23478))) (_1!2391 (ite (or c!41983 c!41982) (tuple2!4761 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4457 thiss!1504)) (tuple2!4761 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504)))) (_2!2391 (ite (or c!41983 c!41982) (tuple2!4761 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4457 thiss!1504)) (tuple2!4761 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504))))))))

(assert (=> d!60933 (= (+!666 (ite c!41983 call!23477 (ite c!41982 call!23481 call!23478)) (ite (or c!41983 c!41982) (tuple2!4761 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4457 thiss!1504)) (tuple2!4761 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504)))) lt!125384)))

(declare-fun b!250221 () Bool)

(declare-fun res!122546 () Bool)

(assert (=> b!250221 (=> (not res!122546) (not e!162276))))

(assert (=> b!250221 (= res!122546 (= (getValueByKey!298 (toList!1853 lt!125384) (_1!2391 (ite (or c!41983 c!41982) (tuple2!4761 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4457 thiss!1504)) (tuple2!4761 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504))))) (Some!303 (_2!2391 (ite (or c!41983 c!41982) (tuple2!4761 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4457 thiss!1504)) (tuple2!4761 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504)))))))))

(declare-fun b!250222 () Bool)

(declare-fun contains!1792 (List!3637 tuple2!4760) Bool)

(assert (=> b!250222 (= e!162276 (contains!1792 (toList!1853 lt!125384) (ite (or c!41983 c!41982) (tuple2!4761 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4457 thiss!1504)) (tuple2!4761 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504)))))))

(assert (= (and d!60933 res!122545) b!250221))

(assert (= (and b!250221 res!122546) b!250222))

(declare-fun m!266771 () Bool)

(assert (=> d!60933 m!266771))

(declare-fun m!266773 () Bool)

(assert (=> d!60933 m!266773))

(declare-fun m!266775 () Bool)

(assert (=> d!60933 m!266775))

(declare-fun m!266777 () Bool)

(assert (=> d!60933 m!266777))

(declare-fun m!266779 () Bool)

(assert (=> b!250221 m!266779))

(declare-fun m!266781 () Bool)

(assert (=> b!250222 m!266781))

(assert (=> bm!23479 d!60933))

(assert (=> d!60845 d!60877))

(declare-fun d!60935 () Bool)

(declare-fun e!162279 () Bool)

(assert (=> d!60935 e!162279))

(declare-fun res!122552 () Bool)

(assert (=> d!60935 (=> (not res!122552) (not e!162279))))

(declare-fun lt!125389 () SeekEntryResult!1084)

(assert (=> d!60935 (= res!122552 ((_ is Found!1084) lt!125389))))

(assert (=> d!60935 (= lt!125389 (seekEntryOrOpen!0 key!932 (_keys!6748 thiss!1504) (mask!10788 thiss!1504)))))

(assert (=> d!60935 true))

(declare-fun _$33!165 () Unit!7701)

(assert (=> d!60935 (= (choose!1186 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) key!932 (defaultEntry!4616 thiss!1504)) _$33!165)))

(declare-fun b!250227 () Bool)

(declare-fun res!122551 () Bool)

(assert (=> b!250227 (=> (not res!122551) (not e!162279))))

(assert (=> b!250227 (= res!122551 (inRange!0 (index!6507 lt!125389) (mask!10788 thiss!1504)))))

(declare-fun b!250228 () Bool)

(assert (=> b!250228 (= e!162279 (= (select (arr!5822 (_keys!6748 thiss!1504)) (index!6507 lt!125389)) key!932))))

(assert (= (and d!60935 res!122552) b!250227))

(assert (= (and b!250227 res!122551) b!250228))

(assert (=> d!60935 m!266417))

(declare-fun m!266783 () Bool)

(assert (=> b!250227 m!266783))

(declare-fun m!266785 () Bool)

(assert (=> b!250228 m!266785))

(assert (=> d!60845 d!60935))

(assert (=> d!60845 d!60861))

(declare-fun d!60937 () Bool)

(assert (=> d!60937 (= (apply!239 lt!125298 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2998 (getValueByKey!298 (toList!1853 lt!125298) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8988 () Bool)

(assert (= bs!8988 d!60937))

(assert (=> bs!8988 m!266703))

(assert (=> bs!8988 m!266703))

(declare-fun m!266787 () Bool)

(assert (=> bs!8988 m!266787))

(assert (=> b!250045 d!60937))

(declare-fun d!60939 () Bool)

(declare-fun res!122553 () Bool)

(declare-fun e!162280 () Bool)

(assert (=> d!60939 (=> res!122553 e!162280)))

(assert (=> d!60939 (= res!122553 (= (select (arr!5822 (_keys!6748 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!60939 (= (arrayContainsKey!0 (_keys!6748 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!162280)))

(declare-fun b!250229 () Bool)

(declare-fun e!162281 () Bool)

(assert (=> b!250229 (= e!162280 e!162281)))

(declare-fun res!122554 () Bool)

(assert (=> b!250229 (=> (not res!122554) (not e!162281))))

(assert (=> b!250229 (= res!122554 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6166 (_keys!6748 thiss!1504))))))

(declare-fun b!250230 () Bool)

(assert (=> b!250230 (= e!162281 (arrayContainsKey!0 (_keys!6748 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!60939 (not res!122553)) b!250229))

(assert (= (and b!250229 res!122554) b!250230))

(declare-fun m!266789 () Bool)

(assert (=> d!60939 m!266789))

(declare-fun m!266791 () Bool)

(assert (=> b!250230 m!266791))

(assert (=> b!249973 d!60939))

(declare-fun d!60941 () Bool)

(assert (=> d!60941 (= (arrayCountValidKeys!0 (array!12278 (store (arr!5822 (_keys!6748 thiss!1504)) index!297 key!932) (size!6166 (_keys!6748 thiss!1504))) #b00000000000000000000000000000000 (size!6166 (_keys!6748 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6748 thiss!1504) #b00000000000000000000000000000000 (size!6166 (_keys!6748 thiss!1504))) #b00000000000000000000000000000001))))

(assert (=> d!60941 true))

(declare-fun _$84!27 () Unit!7701)

(assert (=> d!60941 (= (choose!1 (_keys!6748 thiss!1504) index!297 key!932) _$84!27)))

(declare-fun bs!8989 () Bool)

(assert (= bs!8989 d!60941))

(assert (=> bs!8989 m!266389))

(assert (=> bs!8989 m!266543))

(assert (=> bs!8989 m!266391))

(assert (=> d!60853 d!60941))

(declare-fun d!60943 () Bool)

(assert (=> d!60943 (= (inRange!0 (ite c!41950 (index!6506 lt!125206) (index!6509 lt!125206)) (mask!10788 thiss!1504)) (and (bvsge (ite c!41950 (index!6506 lt!125206) (index!6509 lt!125206)) #b00000000000000000000000000000000) (bvslt (ite c!41950 (index!6506 lt!125206) (index!6509 lt!125206)) (bvadd (mask!10788 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23449 d!60943))

(declare-fun d!60945 () Bool)

(declare-fun lt!125390 () (_ BitVec 32))

(assert (=> d!60945 (and (bvsge lt!125390 #b00000000000000000000000000000000) (bvsle lt!125390 (bvsub (size!6166 lt!125128) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!162282 () (_ BitVec 32))

(assert (=> d!60945 (= lt!125390 e!162282)))

(declare-fun c!42042 () Bool)

(assert (=> d!60945 (= c!42042 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6166 (_keys!6748 thiss!1504))))))

(assert (=> d!60945 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6166 (_keys!6748 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6166 (_keys!6748 thiss!1504)) (size!6166 lt!125128)))))

(assert (=> d!60945 (= (arrayCountValidKeys!0 lt!125128 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6166 (_keys!6748 thiss!1504))) lt!125390)))

(declare-fun b!250231 () Bool)

(declare-fun e!162283 () (_ BitVec 32))

(declare-fun call!23490 () (_ BitVec 32))

(assert (=> b!250231 (= e!162283 call!23490)))

(declare-fun b!250232 () Bool)

(assert (=> b!250232 (= e!162282 e!162283)))

(declare-fun c!42041 () Bool)

(assert (=> b!250232 (= c!42041 (validKeyInArray!0 (select (arr!5822 lt!125128) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!250233 () Bool)

(assert (=> b!250233 (= e!162282 #b00000000000000000000000000000000)))

(declare-fun bm!23487 () Bool)

(assert (=> bm!23487 (= call!23490 (arrayCountValidKeys!0 lt!125128 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6166 (_keys!6748 thiss!1504))))))

(declare-fun b!250234 () Bool)

(assert (=> b!250234 (= e!162283 (bvadd #b00000000000000000000000000000001 call!23490))))

(assert (= (and d!60945 c!42042) b!250233))

(assert (= (and d!60945 (not c!42042)) b!250232))

(assert (= (and b!250232 c!42041) b!250234))

(assert (= (and b!250232 (not c!42041)) b!250231))

(assert (= (or b!250234 b!250231) bm!23487))

(assert (=> b!250232 m!266707))

(assert (=> b!250232 m!266707))

(assert (=> b!250232 m!266711))

(declare-fun m!266793 () Bool)

(assert (=> bm!23487 m!266793))

(assert (=> bm!23455 d!60945))

(declare-fun d!60947 () Bool)

(declare-fun e!162285 () Bool)

(assert (=> d!60947 e!162285))

(declare-fun res!122555 () Bool)

(assert (=> d!60947 (=> res!122555 e!162285)))

(declare-fun lt!125392 () Bool)

(assert (=> d!60947 (= res!122555 (not lt!125392))))

(declare-fun lt!125391 () Bool)

(assert (=> d!60947 (= lt!125392 lt!125391)))

(declare-fun lt!125394 () Unit!7701)

(declare-fun e!162284 () Unit!7701)

(assert (=> d!60947 (= lt!125394 e!162284)))

(declare-fun c!42043 () Bool)

(assert (=> d!60947 (= c!42043 lt!125391)))

(assert (=> d!60947 (= lt!125391 (containsKey!289 (toList!1853 lt!125298) (select (arr!5822 (_keys!6748 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!60947 (= (contains!1788 lt!125298 (select (arr!5822 (_keys!6748 thiss!1504)) #b00000000000000000000000000000000)) lt!125392)))

(declare-fun b!250235 () Bool)

(declare-fun lt!125393 () Unit!7701)

(assert (=> b!250235 (= e!162284 lt!125393)))

(assert (=> b!250235 (= lt!125393 (lemmaContainsKeyImpliesGetValueByKeyDefined!237 (toList!1853 lt!125298) (select (arr!5822 (_keys!6748 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!250235 (isDefined!238 (getValueByKey!298 (toList!1853 lt!125298) (select (arr!5822 (_keys!6748 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!250236 () Bool)

(declare-fun Unit!7718 () Unit!7701)

(assert (=> b!250236 (= e!162284 Unit!7718)))

(declare-fun b!250237 () Bool)

(assert (=> b!250237 (= e!162285 (isDefined!238 (getValueByKey!298 (toList!1853 lt!125298) (select (arr!5822 (_keys!6748 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!60947 c!42043) b!250235))

(assert (= (and d!60947 (not c!42043)) b!250236))

(assert (= (and d!60947 (not res!122555)) b!250237))

(assert (=> d!60947 m!266567))

(declare-fun m!266795 () Bool)

(assert (=> d!60947 m!266795))

(assert (=> b!250235 m!266567))

(declare-fun m!266797 () Bool)

(assert (=> b!250235 m!266797))

(assert (=> b!250235 m!266567))

(assert (=> b!250235 m!266673))

(assert (=> b!250235 m!266673))

(declare-fun m!266799 () Bool)

(assert (=> b!250235 m!266799))

(assert (=> b!250237 m!266567))

(assert (=> b!250237 m!266673))

(assert (=> b!250237 m!266673))

(assert (=> b!250237 m!266799))

(assert (=> b!250042 d!60947))

(assert (=> d!60875 d!60861))

(assert (=> d!60851 d!60873))

(assert (=> d!60851 d!60875))

(declare-fun d!60949 () Bool)

(assert (=> d!60949 (contains!1788 (getCurrentListMap!1385 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)) key!932)))

(assert (=> d!60949 true))

(declare-fun _$17!74 () Unit!7701)

(assert (=> d!60949 (= (choose!1188 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4616 thiss!1504)) _$17!74)))

(declare-fun bs!8990 () Bool)

(assert (= bs!8990 d!60949))

(assert (=> bs!8990 m!266413))

(assert (=> bs!8990 m!266413))

(assert (=> bs!8990 m!266415))

(assert (=> d!60851 d!60949))

(assert (=> d!60851 d!60861))

(declare-fun d!60951 () Bool)

(declare-fun e!162287 () Bool)

(assert (=> d!60951 e!162287))

(declare-fun res!122556 () Bool)

(assert (=> d!60951 (=> res!122556 e!162287)))

(declare-fun lt!125396 () Bool)

(assert (=> d!60951 (= res!122556 (not lt!125396))))

(declare-fun lt!125395 () Bool)

(assert (=> d!60951 (= lt!125396 lt!125395)))

(declare-fun lt!125398 () Unit!7701)

(declare-fun e!162286 () Unit!7701)

(assert (=> d!60951 (= lt!125398 e!162286)))

(declare-fun c!42044 () Bool)

(assert (=> d!60951 (= c!42044 lt!125395)))

(assert (=> d!60951 (= lt!125395 (containsKey!289 (toList!1853 lt!125298) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!60951 (= (contains!1788 lt!125298 #b1000000000000000000000000000000000000000000000000000000000000000) lt!125396)))

(declare-fun b!250238 () Bool)

(declare-fun lt!125397 () Unit!7701)

(assert (=> b!250238 (= e!162286 lt!125397)))

(assert (=> b!250238 (= lt!125397 (lemmaContainsKeyImpliesGetValueByKeyDefined!237 (toList!1853 lt!125298) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!250238 (isDefined!238 (getValueByKey!298 (toList!1853 lt!125298) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!250239 () Bool)

(declare-fun Unit!7719 () Unit!7701)

(assert (=> b!250239 (= e!162286 Unit!7719)))

(declare-fun b!250240 () Bool)

(assert (=> b!250240 (= e!162287 (isDefined!238 (getValueByKey!298 (toList!1853 lt!125298) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!60951 c!42044) b!250238))

(assert (= (and d!60951 (not c!42044)) b!250239))

(assert (= (and d!60951 (not res!122556)) b!250240))

(declare-fun m!266801 () Bool)

(assert (=> d!60951 m!266801))

(declare-fun m!266803 () Bool)

(assert (=> b!250238 m!266803))

(declare-fun m!266805 () Bool)

(assert (=> b!250238 m!266805))

(assert (=> b!250238 m!266805))

(declare-fun m!266807 () Bool)

(assert (=> b!250238 m!266807))

(assert (=> b!250240 m!266805))

(assert (=> b!250240 m!266805))

(assert (=> b!250240 m!266807))

(assert (=> bm!23475 d!60951))

(assert (=> b!249943 d!60929))

(declare-fun d!60953 () Bool)

(declare-fun lt!125399 () (_ BitVec 32))

(assert (=> d!60953 (and (bvsge lt!125399 #b00000000000000000000000000000000) (bvsle lt!125399 (bvsub (size!6166 (_keys!6748 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!162288 () (_ BitVec 32))

(assert (=> d!60953 (= lt!125399 e!162288)))

(declare-fun c!42046 () Bool)

(assert (=> d!60953 (= c!42046 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6166 (_keys!6748 thiss!1504))))))

(assert (=> d!60953 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6166 (_keys!6748 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6166 (_keys!6748 thiss!1504)) (size!6166 (_keys!6748 thiss!1504))))))

(assert (=> d!60953 (= (arrayCountValidKeys!0 (_keys!6748 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6166 (_keys!6748 thiss!1504))) lt!125399)))

(declare-fun b!250241 () Bool)

(declare-fun e!162289 () (_ BitVec 32))

(declare-fun call!23491 () (_ BitVec 32))

(assert (=> b!250241 (= e!162289 call!23491)))

(declare-fun b!250242 () Bool)

(assert (=> b!250242 (= e!162288 e!162289)))

(declare-fun c!42045 () Bool)

(assert (=> b!250242 (= c!42045 (validKeyInArray!0 (select (arr!5822 (_keys!6748 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!250243 () Bool)

(assert (=> b!250243 (= e!162288 #b00000000000000000000000000000000)))

(declare-fun bm!23488 () Bool)

(assert (=> bm!23488 (= call!23491 (arrayCountValidKeys!0 (_keys!6748 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6166 (_keys!6748 thiss!1504))))))

(declare-fun b!250244 () Bool)

(assert (=> b!250244 (= e!162289 (bvadd #b00000000000000000000000000000001 call!23491))))

(assert (= (and d!60953 c!42046) b!250243))

(assert (= (and d!60953 (not c!42046)) b!250242))

(assert (= (and b!250242 c!42045) b!250244))

(assert (= (and b!250242 (not c!42045)) b!250241))

(assert (= (or b!250244 b!250241) bm!23488))

(assert (=> b!250242 m!266789))

(assert (=> b!250242 m!266789))

(declare-fun m!266809 () Bool)

(assert (=> b!250242 m!266809))

(declare-fun m!266811 () Bool)

(assert (=> bm!23488 m!266811))

(assert (=> bm!23456 d!60953))

(declare-fun d!60955 () Bool)

(declare-fun lt!125400 () (_ BitVec 32))

(assert (=> d!60955 (and (bvsge lt!125400 #b00000000000000000000000000000000) (bvsle lt!125400 (bvsub (size!6166 (array!12278 (store (arr!5822 (_keys!6748 thiss!1504)) index!297 key!932) (size!6166 (_keys!6748 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun e!162290 () (_ BitVec 32))

(assert (=> d!60955 (= lt!125400 e!162290)))

(declare-fun c!42048 () Bool)

(assert (=> d!60955 (= c!42048 (bvsge #b00000000000000000000000000000000 (size!6166 (_keys!6748 thiss!1504))))))

(assert (=> d!60955 (and (bvsle #b00000000000000000000000000000000 (size!6166 (_keys!6748 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6166 (_keys!6748 thiss!1504)) (size!6166 (array!12278 (store (arr!5822 (_keys!6748 thiss!1504)) index!297 key!932) (size!6166 (_keys!6748 thiss!1504))))))))

(assert (=> d!60955 (= (arrayCountValidKeys!0 (array!12278 (store (arr!5822 (_keys!6748 thiss!1504)) index!297 key!932) (size!6166 (_keys!6748 thiss!1504))) #b00000000000000000000000000000000 (size!6166 (_keys!6748 thiss!1504))) lt!125400)))

(declare-fun b!250245 () Bool)

(declare-fun e!162291 () (_ BitVec 32))

(declare-fun call!23492 () (_ BitVec 32))

(assert (=> b!250245 (= e!162291 call!23492)))

(declare-fun b!250246 () Bool)

(assert (=> b!250246 (= e!162290 e!162291)))

(declare-fun c!42047 () Bool)

(assert (=> b!250246 (= c!42047 (validKeyInArray!0 (select (arr!5822 (array!12278 (store (arr!5822 (_keys!6748 thiss!1504)) index!297 key!932) (size!6166 (_keys!6748 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!250247 () Bool)

(assert (=> b!250247 (= e!162290 #b00000000000000000000000000000000)))

(declare-fun bm!23489 () Bool)

(assert (=> bm!23489 (= call!23492 (arrayCountValidKeys!0 (array!12278 (store (arr!5822 (_keys!6748 thiss!1504)) index!297 key!932) (size!6166 (_keys!6748 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6166 (_keys!6748 thiss!1504))))))

(declare-fun b!250248 () Bool)

(assert (=> b!250248 (= e!162291 (bvadd #b00000000000000000000000000000001 call!23492))))

(assert (= (and d!60955 c!42048) b!250247))

(assert (= (and d!60955 (not c!42048)) b!250246))

(assert (= (and b!250246 c!42047) b!250248))

(assert (= (and b!250246 (not c!42047)) b!250245))

(assert (= (or b!250248 b!250245) bm!23489))

(assert (=> b!250246 m!266691))

(assert (=> b!250246 m!266691))

(assert (=> b!250246 m!266695))

(declare-fun m!266813 () Bool)

(assert (=> bm!23489 m!266813))

(assert (=> b!249921 d!60955))

(assert (=> b!249921 d!60859))

(declare-fun d!60957 () Bool)

(assert (=> d!60957 (= (validKeyInArray!0 (select (arr!5822 (_keys!6748 thiss!1504)) index!297)) (and (not (= (select (arr!5822 (_keys!6748 thiss!1504)) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5822 (_keys!6748 thiss!1504)) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!249918 d!60957))

(assert (=> b!249963 d!60929))

(assert (=> b!249933 d!60929))

(declare-fun b!250249 () Bool)

(declare-fun e!162294 () Bool)

(declare-fun call!23493 () Bool)

(assert (=> b!250249 (= e!162294 call!23493)))

(declare-fun b!250250 () Bool)

(declare-fun e!162292 () Bool)

(assert (=> b!250250 (= e!162292 call!23493)))

(declare-fun d!60959 () Bool)

(declare-fun res!122558 () Bool)

(declare-fun e!162293 () Bool)

(assert (=> d!60959 (=> res!122558 e!162293)))

(assert (=> d!60959 (= res!122558 (bvsge #b00000000000000000000000000000000 (size!6166 (_keys!6748 thiss!1504))))))

(assert (=> d!60959 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6748 thiss!1504) (mask!10788 thiss!1504)) e!162293)))

(declare-fun bm!23490 () Bool)

(assert (=> bm!23490 (= call!23493 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6748 thiss!1504) (mask!10788 thiss!1504)))))

(declare-fun b!250251 () Bool)

(assert (=> b!250251 (= e!162294 e!162292)))

(declare-fun lt!125401 () (_ BitVec 64))

(assert (=> b!250251 (= lt!125401 (select (arr!5822 (_keys!6748 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!125403 () Unit!7701)

(assert (=> b!250251 (= lt!125403 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6748 thiss!1504) lt!125401 #b00000000000000000000000000000000))))

(assert (=> b!250251 (arrayContainsKey!0 (_keys!6748 thiss!1504) lt!125401 #b00000000000000000000000000000000)))

(declare-fun lt!125402 () Unit!7701)

(assert (=> b!250251 (= lt!125402 lt!125403)))

(declare-fun res!122557 () Bool)

(assert (=> b!250251 (= res!122557 (= (seekEntryOrOpen!0 (select (arr!5822 (_keys!6748 thiss!1504)) #b00000000000000000000000000000000) (_keys!6748 thiss!1504) (mask!10788 thiss!1504)) (Found!1084 #b00000000000000000000000000000000)))))

(assert (=> b!250251 (=> (not res!122557) (not e!162292))))

(declare-fun b!250252 () Bool)

(assert (=> b!250252 (= e!162293 e!162294)))

(declare-fun c!42049 () Bool)

(assert (=> b!250252 (= c!42049 (validKeyInArray!0 (select (arr!5822 (_keys!6748 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!60959 (not res!122558)) b!250252))

(assert (= (and b!250252 c!42049) b!250251))

(assert (= (and b!250252 (not c!42049)) b!250249))

(assert (= (and b!250251 res!122557) b!250250))

(assert (= (or b!250250 b!250249) bm!23490))

(declare-fun m!266815 () Bool)

(assert (=> bm!23490 m!266815))

(assert (=> b!250251 m!266567))

(declare-fun m!266817 () Bool)

(assert (=> b!250251 m!266817))

(declare-fun m!266819 () Bool)

(assert (=> b!250251 m!266819))

(assert (=> b!250251 m!266567))

(declare-fun m!266821 () Bool)

(assert (=> b!250251 m!266821))

(assert (=> b!250252 m!266567))

(assert (=> b!250252 m!266567))

(assert (=> b!250252 m!266569))

(assert (=> b!249908 d!60959))

(assert (=> b!250033 d!60905))

(declare-fun b!250263 () Bool)

(declare-fun res!122569 () Bool)

(declare-fun e!162297 () Bool)

(assert (=> b!250263 (=> (not res!122569) (not e!162297))))

(declare-fun size!6171 (LongMapFixedSize!3694) (_ BitVec 32))

(assert (=> b!250263 (= res!122569 (= (size!6171 thiss!1504) (bvadd (_size!1896 thiss!1504) (bvsdiv (bvadd (extraKeys!4353 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!250261 () Bool)

(declare-fun res!122568 () Bool)

(assert (=> b!250261 (=> (not res!122568) (not e!162297))))

(assert (=> b!250261 (= res!122568 (and (= (size!6165 (_values!4599 thiss!1504)) (bvadd (mask!10788 thiss!1504) #b00000000000000000000000000000001)) (= (size!6166 (_keys!6748 thiss!1504)) (size!6165 (_values!4599 thiss!1504))) (bvsge (_size!1896 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1896 thiss!1504) (bvadd (mask!10788 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!250264 () Bool)

(assert (=> b!250264 (= e!162297 (and (bvsge (extraKeys!4353 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4353 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1896 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!250262 () Bool)

(declare-fun res!122567 () Bool)

(assert (=> b!250262 (=> (not res!122567) (not e!162297))))

(assert (=> b!250262 (= res!122567 (bvsge (size!6171 thiss!1504) (_size!1896 thiss!1504)))))

(declare-fun d!60961 () Bool)

(declare-fun res!122570 () Bool)

(assert (=> d!60961 (=> (not res!122570) (not e!162297))))

(assert (=> d!60961 (= res!122570 (validMask!0 (mask!10788 thiss!1504)))))

(assert (=> d!60961 (= (simpleValid!262 thiss!1504) e!162297)))

(assert (= (and d!60961 res!122570) b!250261))

(assert (= (and b!250261 res!122568) b!250262))

(assert (= (and b!250262 res!122567) b!250263))

(assert (= (and b!250263 res!122569) b!250264))

(declare-fun m!266823 () Bool)

(assert (=> b!250263 m!266823))

(assert (=> b!250262 m!266823))

(assert (=> d!60961 m!266379))

(assert (=> d!60849 d!60961))

(declare-fun b!250265 () Bool)

(declare-fun e!162300 () Bool)

(declare-fun call!23494 () Bool)

(assert (=> b!250265 (= e!162300 call!23494)))

(declare-fun b!250266 () Bool)

(declare-fun e!162298 () Bool)

(assert (=> b!250266 (= e!162298 call!23494)))

(declare-fun d!60963 () Bool)

(declare-fun res!122572 () Bool)

(declare-fun e!162299 () Bool)

(assert (=> d!60963 (=> res!122572 e!162299)))

(assert (=> d!60963 (= res!122572 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6166 lt!125128)))))

(assert (=> d!60963 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!125128 (mask!10788 thiss!1504)) e!162299)))

(declare-fun bm!23491 () Bool)

(assert (=> bm!23491 (= call!23494 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!125128 (mask!10788 thiss!1504)))))

(declare-fun b!250267 () Bool)

(assert (=> b!250267 (= e!162300 e!162298)))

(declare-fun lt!125404 () (_ BitVec 64))

(assert (=> b!250267 (= lt!125404 (select (arr!5822 lt!125128) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!125406 () Unit!7701)

(assert (=> b!250267 (= lt!125406 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!125128 lt!125404 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!250267 (arrayContainsKey!0 lt!125128 lt!125404 #b00000000000000000000000000000000)))

(declare-fun lt!125405 () Unit!7701)

(assert (=> b!250267 (= lt!125405 lt!125406)))

(declare-fun res!122571 () Bool)

(assert (=> b!250267 (= res!122571 (= (seekEntryOrOpen!0 (select (arr!5822 lt!125128) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!125128 (mask!10788 thiss!1504)) (Found!1084 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!250267 (=> (not res!122571) (not e!162298))))

(declare-fun b!250268 () Bool)

(assert (=> b!250268 (= e!162299 e!162300)))

(declare-fun c!42050 () Bool)

(assert (=> b!250268 (= c!42050 (validKeyInArray!0 (select (arr!5822 lt!125128) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!60963 (not res!122572)) b!250268))

(assert (= (and b!250268 c!42050) b!250267))

(assert (= (and b!250268 (not c!42050)) b!250265))

(assert (= (and b!250267 res!122571) b!250266))

(assert (= (or b!250266 b!250265) bm!23491))

(declare-fun m!266825 () Bool)

(assert (=> bm!23491 m!266825))

(assert (=> b!250267 m!266707))

(declare-fun m!266827 () Bool)

(assert (=> b!250267 m!266827))

(declare-fun m!266829 () Bool)

(assert (=> b!250267 m!266829))

(assert (=> b!250267 m!266707))

(declare-fun m!266831 () Bool)

(assert (=> b!250267 m!266831))

(assert (=> b!250268 m!266707))

(assert (=> b!250268 m!266707))

(assert (=> b!250268 m!266711))

(assert (=> bm!23452 d!60963))

(declare-fun d!60965 () Bool)

(declare-fun e!162301 () Bool)

(assert (=> d!60965 e!162301))

(declare-fun res!122573 () Bool)

(assert (=> d!60965 (=> (not res!122573) (not e!162301))))

(declare-fun lt!125408 () ListLongMap!3675)

(assert (=> d!60965 (= res!122573 (contains!1788 lt!125408 (_1!2391 (tuple2!4761 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504)))))))

(declare-fun lt!125409 () List!3637)

(assert (=> d!60965 (= lt!125408 (ListLongMap!3676 lt!125409))))

(declare-fun lt!125410 () Unit!7701)

(declare-fun lt!125407 () Unit!7701)

(assert (=> d!60965 (= lt!125410 lt!125407)))

(assert (=> d!60965 (= (getValueByKey!298 lt!125409 (_1!2391 (tuple2!4761 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504)))) (Some!303 (_2!2391 (tuple2!4761 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504)))))))

(assert (=> d!60965 (= lt!125407 (lemmaContainsTupThenGetReturnValue!159 lt!125409 (_1!2391 (tuple2!4761 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504))) (_2!2391 (tuple2!4761 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504)))))))

(assert (=> d!60965 (= lt!125409 (insertStrictlySorted!162 (toList!1853 call!23483) (_1!2391 (tuple2!4761 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504))) (_2!2391 (tuple2!4761 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504)))))))

(assert (=> d!60965 (= (+!666 call!23483 (tuple2!4761 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504))) lt!125408)))

(declare-fun b!250269 () Bool)

(declare-fun res!122574 () Bool)

(assert (=> b!250269 (=> (not res!122574) (not e!162301))))

(assert (=> b!250269 (= res!122574 (= (getValueByKey!298 (toList!1853 lt!125408) (_1!2391 (tuple2!4761 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504)))) (Some!303 (_2!2391 (tuple2!4761 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504))))))))

(declare-fun b!250270 () Bool)

(assert (=> b!250270 (= e!162301 (contains!1792 (toList!1853 lt!125408) (tuple2!4761 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4457 thiss!1504))))))

(assert (= (and d!60965 res!122573) b!250269))

(assert (= (and b!250269 res!122574) b!250270))

(declare-fun m!266833 () Bool)

(assert (=> d!60965 m!266833))

(declare-fun m!266835 () Bool)

(assert (=> d!60965 m!266835))

(declare-fun m!266837 () Bool)

(assert (=> d!60965 m!266837))

(declare-fun m!266839 () Bool)

(assert (=> d!60965 m!266839))

(declare-fun m!266841 () Bool)

(assert (=> b!250269 m!266841))

(declare-fun m!266843 () Bool)

(assert (=> b!250270 m!266843))

(assert (=> b!250047 d!60965))

(declare-fun d!60967 () Bool)

(assert (=> d!60967 (= (apply!239 lt!125298 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2998 (getValueByKey!298 (toList!1853 lt!125298) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8991 () Bool)

(assert (= bs!8991 d!60967))

(assert (=> bs!8991 m!266805))

(assert (=> bs!8991 m!266805))

(declare-fun m!266845 () Bool)

(assert (=> bs!8991 m!266845))

(assert (=> b!250031 d!60967))

(declare-fun d!60969 () Bool)

(assert (=> d!60969 (contains!1788 (+!666 lt!125308 (tuple2!4761 lt!125292 (zeroValue!4457 thiss!1504))) lt!125302)))

(declare-fun lt!125413 () Unit!7701)

(declare-fun choose!1190 (ListLongMap!3675 (_ BitVec 64) V!8289 (_ BitVec 64)) Unit!7701)

(assert (=> d!60969 (= lt!125413 (choose!1190 lt!125308 lt!125292 (zeroValue!4457 thiss!1504) lt!125302))))

(assert (=> d!60969 (contains!1788 lt!125308 lt!125302)))

(assert (=> d!60969 (= (addStillContains!215 lt!125308 lt!125292 (zeroValue!4457 thiss!1504) lt!125302) lt!125413)))

(declare-fun bs!8992 () Bool)

(assert (= bs!8992 d!60969))

(assert (=> bs!8992 m!266613))

(assert (=> bs!8992 m!266613))

(assert (=> bs!8992 m!266619))

(declare-fun m!266847 () Bool)

(assert (=> bs!8992 m!266847))

(declare-fun m!266849 () Bool)

(assert (=> bs!8992 m!266849))

(assert (=> b!250048 d!60969))

(declare-fun d!60971 () Bool)

(declare-fun e!162302 () Bool)

(assert (=> d!60971 e!162302))

(declare-fun res!122575 () Bool)

(assert (=> d!60971 (=> (not res!122575) (not e!162302))))

(declare-fun lt!125415 () ListLongMap!3675)

(assert (=> d!60971 (= res!122575 (contains!1788 lt!125415 (_1!2391 (tuple2!4761 lt!125292 (zeroValue!4457 thiss!1504)))))))

(declare-fun lt!125416 () List!3637)

(assert (=> d!60971 (= lt!125415 (ListLongMap!3676 lt!125416))))

(declare-fun lt!125417 () Unit!7701)

(declare-fun lt!125414 () Unit!7701)

(assert (=> d!60971 (= lt!125417 lt!125414)))

(assert (=> d!60971 (= (getValueByKey!298 lt!125416 (_1!2391 (tuple2!4761 lt!125292 (zeroValue!4457 thiss!1504)))) (Some!303 (_2!2391 (tuple2!4761 lt!125292 (zeroValue!4457 thiss!1504)))))))

(assert (=> d!60971 (= lt!125414 (lemmaContainsTupThenGetReturnValue!159 lt!125416 (_1!2391 (tuple2!4761 lt!125292 (zeroValue!4457 thiss!1504))) (_2!2391 (tuple2!4761 lt!125292 (zeroValue!4457 thiss!1504)))))))

(assert (=> d!60971 (= lt!125416 (insertStrictlySorted!162 (toList!1853 lt!125308) (_1!2391 (tuple2!4761 lt!125292 (zeroValue!4457 thiss!1504))) (_2!2391 (tuple2!4761 lt!125292 (zeroValue!4457 thiss!1504)))))))

(assert (=> d!60971 (= (+!666 lt!125308 (tuple2!4761 lt!125292 (zeroValue!4457 thiss!1504))) lt!125415)))

(declare-fun b!250272 () Bool)

(declare-fun res!122576 () Bool)

(assert (=> b!250272 (=> (not res!122576) (not e!162302))))

(assert (=> b!250272 (= res!122576 (= (getValueByKey!298 (toList!1853 lt!125415) (_1!2391 (tuple2!4761 lt!125292 (zeroValue!4457 thiss!1504)))) (Some!303 (_2!2391 (tuple2!4761 lt!125292 (zeroValue!4457 thiss!1504))))))))

(declare-fun b!250273 () Bool)

(assert (=> b!250273 (= e!162302 (contains!1792 (toList!1853 lt!125415) (tuple2!4761 lt!125292 (zeroValue!4457 thiss!1504))))))

(assert (= (and d!60971 res!122575) b!250272))

(assert (= (and b!250272 res!122576) b!250273))

(declare-fun m!266851 () Bool)

(assert (=> d!60971 m!266851))

(declare-fun m!266853 () Bool)

(assert (=> d!60971 m!266853))

(declare-fun m!266855 () Bool)

(assert (=> d!60971 m!266855))

(declare-fun m!266857 () Bool)

(assert (=> d!60971 m!266857))

(declare-fun m!266859 () Bool)

(assert (=> b!250272 m!266859))

(declare-fun m!266861 () Bool)

(assert (=> b!250273 m!266861))

(assert (=> b!250048 d!60971))

(declare-fun d!60973 () Bool)

(declare-fun e!162304 () Bool)

(assert (=> d!60973 e!162304))

(declare-fun res!122577 () Bool)

(assert (=> d!60973 (=> res!122577 e!162304)))

(declare-fun lt!125419 () Bool)

(assert (=> d!60973 (= res!122577 (not lt!125419))))

(declare-fun lt!125418 () Bool)

(assert (=> d!60973 (= lt!125419 lt!125418)))

(declare-fun lt!125421 () Unit!7701)

(declare-fun e!162303 () Unit!7701)

(assert (=> d!60973 (= lt!125421 e!162303)))

(declare-fun c!42051 () Bool)

(assert (=> d!60973 (= c!42051 lt!125418)))

(assert (=> d!60973 (= lt!125418 (containsKey!289 (toList!1853 (+!666 lt!125308 (tuple2!4761 lt!125292 (zeroValue!4457 thiss!1504)))) lt!125302))))

(assert (=> d!60973 (= (contains!1788 (+!666 lt!125308 (tuple2!4761 lt!125292 (zeroValue!4457 thiss!1504))) lt!125302) lt!125419)))

(declare-fun b!250274 () Bool)

(declare-fun lt!125420 () Unit!7701)

(assert (=> b!250274 (= e!162303 lt!125420)))

(assert (=> b!250274 (= lt!125420 (lemmaContainsKeyImpliesGetValueByKeyDefined!237 (toList!1853 (+!666 lt!125308 (tuple2!4761 lt!125292 (zeroValue!4457 thiss!1504)))) lt!125302))))

(assert (=> b!250274 (isDefined!238 (getValueByKey!298 (toList!1853 (+!666 lt!125308 (tuple2!4761 lt!125292 (zeroValue!4457 thiss!1504)))) lt!125302))))

(declare-fun b!250275 () Bool)

(declare-fun Unit!7720 () Unit!7701)

(assert (=> b!250275 (= e!162303 Unit!7720)))

(declare-fun b!250276 () Bool)

(assert (=> b!250276 (= e!162304 (isDefined!238 (getValueByKey!298 (toList!1853 (+!666 lt!125308 (tuple2!4761 lt!125292 (zeroValue!4457 thiss!1504)))) lt!125302)))))

(assert (= (and d!60973 c!42051) b!250274))

(assert (= (and d!60973 (not c!42051)) b!250275))

(assert (= (and d!60973 (not res!122577)) b!250276))

(declare-fun m!266863 () Bool)

(assert (=> d!60973 m!266863))

(declare-fun m!266865 () Bool)

(assert (=> b!250274 m!266865))

(declare-fun m!266867 () Bool)

(assert (=> b!250274 m!266867))

(assert (=> b!250274 m!266867))

(declare-fun m!266869 () Bool)

(assert (=> b!250274 m!266869))

(assert (=> b!250276 m!266867))

(assert (=> b!250276 m!266867))

(assert (=> b!250276 m!266869))

(assert (=> b!250048 d!60973))

(declare-fun d!60975 () Bool)

(assert (=> d!60975 (= (apply!239 (+!666 lt!125303 (tuple2!4761 lt!125300 (minValue!4457 thiss!1504))) lt!125306) (apply!239 lt!125303 lt!125306))))

(declare-fun lt!125424 () Unit!7701)

(declare-fun choose!1191 (ListLongMap!3675 (_ BitVec 64) V!8289 (_ BitVec 64)) Unit!7701)

(assert (=> d!60975 (= lt!125424 (choose!1191 lt!125303 lt!125300 (minValue!4457 thiss!1504) lt!125306))))

(declare-fun e!162307 () Bool)

(assert (=> d!60975 e!162307))

(declare-fun res!122580 () Bool)

(assert (=> d!60975 (=> (not res!122580) (not e!162307))))

(assert (=> d!60975 (= res!122580 (contains!1788 lt!125303 lt!125306))))

(assert (=> d!60975 (= (addApplyDifferent!215 lt!125303 lt!125300 (minValue!4457 thiss!1504) lt!125306) lt!125424)))

(declare-fun b!250280 () Bool)

(assert (=> b!250280 (= e!162307 (not (= lt!125306 lt!125300)))))

(assert (= (and d!60975 res!122580) b!250280))

(assert (=> d!60975 m!266609))

(assert (=> d!60975 m!266609))

(assert (=> d!60975 m!266611))

(declare-fun m!266871 () Bool)

(assert (=> d!60975 m!266871))

(declare-fun m!266873 () Bool)

(assert (=> d!60975 m!266873))

(assert (=> d!60975 m!266617))

(assert (=> b!250048 d!60975))

(declare-fun d!60977 () Bool)

(assert (=> d!60977 (= (apply!239 (+!666 lt!125293 (tuple2!4761 lt!125294 (zeroValue!4457 thiss!1504))) lt!125299) (apply!239 lt!125293 lt!125299))))

(declare-fun lt!125425 () Unit!7701)

(assert (=> d!60977 (= lt!125425 (choose!1191 lt!125293 lt!125294 (zeroValue!4457 thiss!1504) lt!125299))))

(declare-fun e!162308 () Bool)

(assert (=> d!60977 e!162308))

(declare-fun res!122581 () Bool)

(assert (=> d!60977 (=> (not res!122581) (not e!162308))))

(assert (=> d!60977 (= res!122581 (contains!1788 lt!125293 lt!125299))))

(assert (=> d!60977 (= (addApplyDifferent!215 lt!125293 lt!125294 (zeroValue!4457 thiss!1504) lt!125299) lt!125425)))

(declare-fun b!250281 () Bool)

(assert (=> b!250281 (= e!162308 (not (= lt!125299 lt!125294)))))

(assert (= (and d!60977 res!122581) b!250281))

(assert (=> d!60977 m!266605))

(assert (=> d!60977 m!266605))

(assert (=> d!60977 m!266623))

(declare-fun m!266875 () Bool)

(assert (=> d!60977 m!266875))

(declare-fun m!266877 () Bool)

(assert (=> d!60977 m!266877))

(assert (=> d!60977 m!266627))

(assert (=> b!250048 d!60977))

(assert (=> b!250048 d!60931))

(declare-fun d!60979 () Bool)

(assert (=> d!60979 (= (apply!239 (+!666 lt!125297 (tuple2!4761 lt!125305 (minValue!4457 thiss!1504))) lt!125291) (get!2998 (getValueByKey!298 (toList!1853 (+!666 lt!125297 (tuple2!4761 lt!125305 (minValue!4457 thiss!1504)))) lt!125291)))))

(declare-fun bs!8993 () Bool)

(assert (= bs!8993 d!60979))

(declare-fun m!266879 () Bool)

(assert (=> bs!8993 m!266879))

(assert (=> bs!8993 m!266879))

(declare-fun m!266881 () Bool)

(assert (=> bs!8993 m!266881))

(assert (=> b!250048 d!60979))

(declare-fun d!60981 () Bool)

(declare-fun e!162309 () Bool)

(assert (=> d!60981 e!162309))

(declare-fun res!122582 () Bool)

(assert (=> d!60981 (=> (not res!122582) (not e!162309))))

(declare-fun lt!125427 () ListLongMap!3675)

(assert (=> d!60981 (= res!122582 (contains!1788 lt!125427 (_1!2391 (tuple2!4761 lt!125294 (zeroValue!4457 thiss!1504)))))))

(declare-fun lt!125428 () List!3637)

(assert (=> d!60981 (= lt!125427 (ListLongMap!3676 lt!125428))))

(declare-fun lt!125429 () Unit!7701)

(declare-fun lt!125426 () Unit!7701)

(assert (=> d!60981 (= lt!125429 lt!125426)))

(assert (=> d!60981 (= (getValueByKey!298 lt!125428 (_1!2391 (tuple2!4761 lt!125294 (zeroValue!4457 thiss!1504)))) (Some!303 (_2!2391 (tuple2!4761 lt!125294 (zeroValue!4457 thiss!1504)))))))

(assert (=> d!60981 (= lt!125426 (lemmaContainsTupThenGetReturnValue!159 lt!125428 (_1!2391 (tuple2!4761 lt!125294 (zeroValue!4457 thiss!1504))) (_2!2391 (tuple2!4761 lt!125294 (zeroValue!4457 thiss!1504)))))))

(assert (=> d!60981 (= lt!125428 (insertStrictlySorted!162 (toList!1853 lt!125293) (_1!2391 (tuple2!4761 lt!125294 (zeroValue!4457 thiss!1504))) (_2!2391 (tuple2!4761 lt!125294 (zeroValue!4457 thiss!1504)))))))

(assert (=> d!60981 (= (+!666 lt!125293 (tuple2!4761 lt!125294 (zeroValue!4457 thiss!1504))) lt!125427)))

(declare-fun b!250282 () Bool)

(declare-fun res!122583 () Bool)

(assert (=> b!250282 (=> (not res!122583) (not e!162309))))

(assert (=> b!250282 (= res!122583 (= (getValueByKey!298 (toList!1853 lt!125427) (_1!2391 (tuple2!4761 lt!125294 (zeroValue!4457 thiss!1504)))) (Some!303 (_2!2391 (tuple2!4761 lt!125294 (zeroValue!4457 thiss!1504))))))))

(declare-fun b!250283 () Bool)

(assert (=> b!250283 (= e!162309 (contains!1792 (toList!1853 lt!125427) (tuple2!4761 lt!125294 (zeroValue!4457 thiss!1504))))))

(assert (= (and d!60981 res!122582) b!250282))

(assert (= (and b!250282 res!122583) b!250283))

(declare-fun m!266883 () Bool)

(assert (=> d!60981 m!266883))

(declare-fun m!266885 () Bool)

(assert (=> d!60981 m!266885))

(declare-fun m!266887 () Bool)

(assert (=> d!60981 m!266887))

(declare-fun m!266889 () Bool)

(assert (=> d!60981 m!266889))

(declare-fun m!266891 () Bool)

(assert (=> b!250282 m!266891))

(declare-fun m!266893 () Bool)

(assert (=> b!250283 m!266893))

(assert (=> b!250048 d!60981))

(declare-fun d!60983 () Bool)

(assert (=> d!60983 (= (apply!239 (+!666 lt!125297 (tuple2!4761 lt!125305 (minValue!4457 thiss!1504))) lt!125291) (apply!239 lt!125297 lt!125291))))

(declare-fun lt!125430 () Unit!7701)

(assert (=> d!60983 (= lt!125430 (choose!1191 lt!125297 lt!125305 (minValue!4457 thiss!1504) lt!125291))))

(declare-fun e!162310 () Bool)

(assert (=> d!60983 e!162310))

(declare-fun res!122584 () Bool)

(assert (=> d!60983 (=> (not res!122584) (not e!162310))))

(assert (=> d!60983 (= res!122584 (contains!1788 lt!125297 lt!125291))))

(assert (=> d!60983 (= (addApplyDifferent!215 lt!125297 lt!125305 (minValue!4457 thiss!1504) lt!125291) lt!125430)))

(declare-fun b!250284 () Bool)

(assert (=> b!250284 (= e!162310 (not (= lt!125291 lt!125305)))))

(assert (= (and d!60983 res!122584) b!250284))

(assert (=> d!60983 m!266607))

(assert (=> d!60983 m!266607))

(assert (=> d!60983 m!266635))

(declare-fun m!266895 () Bool)

(assert (=> d!60983 m!266895))

(declare-fun m!266897 () Bool)

(assert (=> d!60983 m!266897))

(assert (=> d!60983 m!266621))

(assert (=> b!250048 d!60983))

(declare-fun d!60985 () Bool)

(assert (=> d!60985 (= (apply!239 lt!125297 lt!125291) (get!2998 (getValueByKey!298 (toList!1853 lt!125297) lt!125291)))))

(declare-fun bs!8994 () Bool)

(assert (= bs!8994 d!60985))

(declare-fun m!266899 () Bool)

(assert (=> bs!8994 m!266899))

(assert (=> bs!8994 m!266899))

(declare-fun m!266901 () Bool)

(assert (=> bs!8994 m!266901))

(assert (=> b!250048 d!60985))

(declare-fun d!60987 () Bool)

(declare-fun e!162311 () Bool)

(assert (=> d!60987 e!162311))

(declare-fun res!122585 () Bool)

(assert (=> d!60987 (=> (not res!122585) (not e!162311))))

(declare-fun lt!125432 () ListLongMap!3675)

(assert (=> d!60987 (= res!122585 (contains!1788 lt!125432 (_1!2391 (tuple2!4761 lt!125305 (minValue!4457 thiss!1504)))))))

(declare-fun lt!125433 () List!3637)

(assert (=> d!60987 (= lt!125432 (ListLongMap!3676 lt!125433))))

(declare-fun lt!125434 () Unit!7701)

(declare-fun lt!125431 () Unit!7701)

(assert (=> d!60987 (= lt!125434 lt!125431)))

(assert (=> d!60987 (= (getValueByKey!298 lt!125433 (_1!2391 (tuple2!4761 lt!125305 (minValue!4457 thiss!1504)))) (Some!303 (_2!2391 (tuple2!4761 lt!125305 (minValue!4457 thiss!1504)))))))

(assert (=> d!60987 (= lt!125431 (lemmaContainsTupThenGetReturnValue!159 lt!125433 (_1!2391 (tuple2!4761 lt!125305 (minValue!4457 thiss!1504))) (_2!2391 (tuple2!4761 lt!125305 (minValue!4457 thiss!1504)))))))

(assert (=> d!60987 (= lt!125433 (insertStrictlySorted!162 (toList!1853 lt!125297) (_1!2391 (tuple2!4761 lt!125305 (minValue!4457 thiss!1504))) (_2!2391 (tuple2!4761 lt!125305 (minValue!4457 thiss!1504)))))))

(assert (=> d!60987 (= (+!666 lt!125297 (tuple2!4761 lt!125305 (minValue!4457 thiss!1504))) lt!125432)))

(declare-fun b!250285 () Bool)

(declare-fun res!122586 () Bool)

(assert (=> b!250285 (=> (not res!122586) (not e!162311))))

(assert (=> b!250285 (= res!122586 (= (getValueByKey!298 (toList!1853 lt!125432) (_1!2391 (tuple2!4761 lt!125305 (minValue!4457 thiss!1504)))) (Some!303 (_2!2391 (tuple2!4761 lt!125305 (minValue!4457 thiss!1504))))))))

(declare-fun b!250286 () Bool)

(assert (=> b!250286 (= e!162311 (contains!1792 (toList!1853 lt!125432) (tuple2!4761 lt!125305 (minValue!4457 thiss!1504))))))

(assert (= (and d!60987 res!122585) b!250285))

(assert (= (and b!250285 res!122586) b!250286))

(declare-fun m!266903 () Bool)

(assert (=> d!60987 m!266903))

(declare-fun m!266905 () Bool)

(assert (=> d!60987 m!266905))

(declare-fun m!266907 () Bool)

(assert (=> d!60987 m!266907))

(declare-fun m!266909 () Bool)

(assert (=> d!60987 m!266909))

(declare-fun m!266911 () Bool)

(assert (=> b!250285 m!266911))

(declare-fun m!266913 () Bool)

(assert (=> b!250286 m!266913))

(assert (=> b!250048 d!60987))

(declare-fun d!60989 () Bool)

(assert (=> d!60989 (= (apply!239 (+!666 lt!125303 (tuple2!4761 lt!125300 (minValue!4457 thiss!1504))) lt!125306) (get!2998 (getValueByKey!298 (toList!1853 (+!666 lt!125303 (tuple2!4761 lt!125300 (minValue!4457 thiss!1504)))) lt!125306)))))

(declare-fun bs!8995 () Bool)

(assert (= bs!8995 d!60989))

(declare-fun m!266915 () Bool)

(assert (=> bs!8995 m!266915))

(assert (=> bs!8995 m!266915))

(declare-fun m!266917 () Bool)

(assert (=> bs!8995 m!266917))

(assert (=> b!250048 d!60989))

(declare-fun d!60991 () Bool)

(declare-fun e!162312 () Bool)

(assert (=> d!60991 e!162312))

(declare-fun res!122587 () Bool)

(assert (=> d!60991 (=> (not res!122587) (not e!162312))))

(declare-fun lt!125436 () ListLongMap!3675)

(assert (=> d!60991 (= res!122587 (contains!1788 lt!125436 (_1!2391 (tuple2!4761 lt!125300 (minValue!4457 thiss!1504)))))))

(declare-fun lt!125437 () List!3637)

(assert (=> d!60991 (= lt!125436 (ListLongMap!3676 lt!125437))))

(declare-fun lt!125438 () Unit!7701)

(declare-fun lt!125435 () Unit!7701)

(assert (=> d!60991 (= lt!125438 lt!125435)))

(assert (=> d!60991 (= (getValueByKey!298 lt!125437 (_1!2391 (tuple2!4761 lt!125300 (minValue!4457 thiss!1504)))) (Some!303 (_2!2391 (tuple2!4761 lt!125300 (minValue!4457 thiss!1504)))))))

(assert (=> d!60991 (= lt!125435 (lemmaContainsTupThenGetReturnValue!159 lt!125437 (_1!2391 (tuple2!4761 lt!125300 (minValue!4457 thiss!1504))) (_2!2391 (tuple2!4761 lt!125300 (minValue!4457 thiss!1504)))))))

(assert (=> d!60991 (= lt!125437 (insertStrictlySorted!162 (toList!1853 lt!125303) (_1!2391 (tuple2!4761 lt!125300 (minValue!4457 thiss!1504))) (_2!2391 (tuple2!4761 lt!125300 (minValue!4457 thiss!1504)))))))

(assert (=> d!60991 (= (+!666 lt!125303 (tuple2!4761 lt!125300 (minValue!4457 thiss!1504))) lt!125436)))

(declare-fun b!250287 () Bool)

(declare-fun res!122588 () Bool)

(assert (=> b!250287 (=> (not res!122588) (not e!162312))))

(assert (=> b!250287 (= res!122588 (= (getValueByKey!298 (toList!1853 lt!125436) (_1!2391 (tuple2!4761 lt!125300 (minValue!4457 thiss!1504)))) (Some!303 (_2!2391 (tuple2!4761 lt!125300 (minValue!4457 thiss!1504))))))))

(declare-fun b!250288 () Bool)

(assert (=> b!250288 (= e!162312 (contains!1792 (toList!1853 lt!125436) (tuple2!4761 lt!125300 (minValue!4457 thiss!1504))))))

(assert (= (and d!60991 res!122587) b!250287))

(assert (= (and b!250287 res!122588) b!250288))

(declare-fun m!266919 () Bool)

(assert (=> d!60991 m!266919))

(declare-fun m!266921 () Bool)

(assert (=> d!60991 m!266921))

(declare-fun m!266923 () Bool)

(assert (=> d!60991 m!266923))

(declare-fun m!266925 () Bool)

(assert (=> d!60991 m!266925))

(declare-fun m!266927 () Bool)

(assert (=> b!250287 m!266927))

(declare-fun m!266929 () Bool)

(assert (=> b!250288 m!266929))

(assert (=> b!250048 d!60991))

(declare-fun d!60993 () Bool)

(assert (=> d!60993 (= (apply!239 lt!125293 lt!125299) (get!2998 (getValueByKey!298 (toList!1853 lt!125293) lt!125299)))))

(declare-fun bs!8996 () Bool)

(assert (= bs!8996 d!60993))

(declare-fun m!266931 () Bool)

(assert (=> bs!8996 m!266931))

(assert (=> bs!8996 m!266931))

(declare-fun m!266933 () Bool)

(assert (=> bs!8996 m!266933))

(assert (=> b!250048 d!60993))

(declare-fun d!60995 () Bool)

(assert (=> d!60995 (= (apply!239 (+!666 lt!125293 (tuple2!4761 lt!125294 (zeroValue!4457 thiss!1504))) lt!125299) (get!2998 (getValueByKey!298 (toList!1853 (+!666 lt!125293 (tuple2!4761 lt!125294 (zeroValue!4457 thiss!1504)))) lt!125299)))))

(declare-fun bs!8997 () Bool)

(assert (= bs!8997 d!60995))

(declare-fun m!266935 () Bool)

(assert (=> bs!8997 m!266935))

(assert (=> bs!8997 m!266935))

(declare-fun m!266937 () Bool)

(assert (=> bs!8997 m!266937))

(assert (=> b!250048 d!60995))

(declare-fun d!60997 () Bool)

(assert (=> d!60997 (= (apply!239 lt!125303 lt!125306) (get!2998 (getValueByKey!298 (toList!1853 lt!125303) lt!125306)))))

(declare-fun bs!8998 () Bool)

(assert (= bs!8998 d!60997))

(declare-fun m!266939 () Bool)

(assert (=> bs!8998 m!266939))

(assert (=> bs!8998 m!266939))

(declare-fun m!266941 () Bool)

(assert (=> bs!8998 m!266941))

(assert (=> b!250048 d!60997))

(assert (=> d!60847 d!60877))

(declare-fun d!60999 () Bool)

(declare-fun e!162322 () Bool)

(assert (=> d!60999 e!162322))

(declare-fun c!42057 () Bool)

(declare-fun lt!125441 () SeekEntryResult!1084)

(assert (=> d!60999 (= c!42057 ((_ is MissingZero!1084) lt!125441))))

(assert (=> d!60999 (= lt!125441 (seekEntryOrOpen!0 key!932 (_keys!6748 thiss!1504) (mask!10788 thiss!1504)))))

(assert (=> d!60999 true))

(declare-fun _$34!1110 () Unit!7701)

(assert (=> d!60999 (= (choose!1187 (_keys!6748 thiss!1504) (_values!4599 thiss!1504) (mask!10788 thiss!1504) (extraKeys!4353 thiss!1504) (zeroValue!4457 thiss!1504) (minValue!4457 thiss!1504) key!932 (defaultEntry!4616 thiss!1504)) _$34!1110)))

(declare-fun b!250305 () Bool)

(declare-fun e!162323 () Bool)

(declare-fun call!23499 () Bool)

(assert (=> b!250305 (= e!162323 (not call!23499))))

(declare-fun b!250306 () Bool)

(declare-fun res!122600 () Bool)

(assert (=> b!250306 (=> (not res!122600) (not e!162323))))

(assert (=> b!250306 (= res!122600 (= (select (arr!5822 (_keys!6748 thiss!1504)) (index!6509 lt!125441)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!23496 () Bool)

(assert (=> bm!23496 (= call!23499 (arrayContainsKey!0 (_keys!6748 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!250307 () Bool)

(declare-fun e!162321 () Bool)

(assert (=> b!250307 (= e!162321 (not call!23499))))

(declare-fun b!250308 () Bool)

(declare-fun e!162324 () Bool)

(assert (=> b!250308 (= e!162322 e!162324)))

(declare-fun c!42056 () Bool)

(assert (=> b!250308 (= c!42056 ((_ is MissingVacant!1084) lt!125441))))

(declare-fun b!250309 () Bool)

(assert (=> b!250309 (= e!162324 ((_ is Undefined!1084) lt!125441))))

(declare-fun b!250310 () Bool)

(declare-fun res!122599 () Bool)

(assert (=> b!250310 (=> (not res!122599) (not e!162323))))

(declare-fun call!23500 () Bool)

(assert (=> b!250310 (= res!122599 call!23500)))

(assert (=> b!250310 (= e!162324 e!162323)))

(declare-fun b!250311 () Bool)

(assert (=> b!250311 (= e!162322 e!162321)))

(declare-fun res!122598 () Bool)

(assert (=> b!250311 (= res!122598 call!23500)))

(assert (=> b!250311 (=> (not res!122598) (not e!162321))))

(declare-fun b!250312 () Bool)

(declare-fun res!122597 () Bool)

(assert (=> b!250312 (= res!122597 (= (select (arr!5822 (_keys!6748 thiss!1504)) (index!6506 lt!125441)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!250312 (=> (not res!122597) (not e!162321))))

(declare-fun bm!23497 () Bool)

(assert (=> bm!23497 (= call!23500 (inRange!0 (ite c!42057 (index!6506 lt!125441) (index!6509 lt!125441)) (mask!10788 thiss!1504)))))

(assert (= (and d!60999 c!42057) b!250311))

(assert (= (and d!60999 (not c!42057)) b!250308))

(assert (= (and b!250311 res!122598) b!250312))

(assert (= (and b!250312 res!122597) b!250307))

(assert (= (and b!250308 c!42056) b!250310))

(assert (= (and b!250308 (not c!42056)) b!250309))

(assert (= (and b!250310 res!122599) b!250306))

(assert (= (and b!250306 res!122600) b!250305))

(assert (= (or b!250311 b!250310) bm!23497))

(assert (= (or b!250307 b!250305) bm!23496))

(declare-fun m!266943 () Bool)

(assert (=> b!250306 m!266943))

(declare-fun m!266945 () Bool)

(assert (=> bm!23497 m!266945))

(declare-fun m!266947 () Bool)

(assert (=> b!250312 m!266947))

(assert (=> bm!23496 m!266377))

(assert (=> d!60999 m!266417))

(assert (=> d!60847 d!60999))

(assert (=> d!60847 d!60861))

(declare-fun b!250313 () Bool)

(declare-fun e!162327 () Bool)

(declare-fun call!23501 () Bool)

(assert (=> b!250313 (= e!162327 call!23501)))

(declare-fun b!250314 () Bool)

(declare-fun e!162325 () Bool)

(assert (=> b!250314 (= e!162325 call!23501)))

(declare-fun d!61001 () Bool)

(declare-fun res!122602 () Bool)

(declare-fun e!162326 () Bool)

(assert (=> d!61001 (=> res!122602 e!162326)))

(assert (=> d!61001 (= res!122602 (bvsge #b00000000000000000000000000000000 (size!6166 (array!12278 (store (arr!5822 (_keys!6748 thiss!1504)) index!297 key!932) (size!6166 (_keys!6748 thiss!1504))))))))

(assert (=> d!61001 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12278 (store (arr!5822 (_keys!6748 thiss!1504)) index!297 key!932) (size!6166 (_keys!6748 thiss!1504))) (mask!10788 thiss!1504)) e!162326)))

(declare-fun bm!23498 () Bool)

(assert (=> bm!23498 (= call!23501 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!12278 (store (arr!5822 (_keys!6748 thiss!1504)) index!297 key!932) (size!6166 (_keys!6748 thiss!1504))) (mask!10788 thiss!1504)))))

(declare-fun b!250315 () Bool)

(assert (=> b!250315 (= e!162327 e!162325)))

(declare-fun lt!125442 () (_ BitVec 64))

(assert (=> b!250315 (= lt!125442 (select (arr!5822 (array!12278 (store (arr!5822 (_keys!6748 thiss!1504)) index!297 key!932) (size!6166 (_keys!6748 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!125444 () Unit!7701)

(assert (=> b!250315 (= lt!125444 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12278 (store (arr!5822 (_keys!6748 thiss!1504)) index!297 key!932) (size!6166 (_keys!6748 thiss!1504))) lt!125442 #b00000000000000000000000000000000))))

(assert (=> b!250315 (arrayContainsKey!0 (array!12278 (store (arr!5822 (_keys!6748 thiss!1504)) index!297 key!932) (size!6166 (_keys!6748 thiss!1504))) lt!125442 #b00000000000000000000000000000000)))

(declare-fun lt!125443 () Unit!7701)

(assert (=> b!250315 (= lt!125443 lt!125444)))

(declare-fun res!122601 () Bool)

(assert (=> b!250315 (= res!122601 (= (seekEntryOrOpen!0 (select (arr!5822 (array!12278 (store (arr!5822 (_keys!6748 thiss!1504)) index!297 key!932) (size!6166 (_keys!6748 thiss!1504)))) #b00000000000000000000000000000000) (array!12278 (store (arr!5822 (_keys!6748 thiss!1504)) index!297 key!932) (size!6166 (_keys!6748 thiss!1504))) (mask!10788 thiss!1504)) (Found!1084 #b00000000000000000000000000000000)))))

(assert (=> b!250315 (=> (not res!122601) (not e!162325))))

(declare-fun b!250316 () Bool)

(assert (=> b!250316 (= e!162326 e!162327)))

(declare-fun c!42058 () Bool)

(assert (=> b!250316 (= c!42058 (validKeyInArray!0 (select (arr!5822 (array!12278 (store (arr!5822 (_keys!6748 thiss!1504)) index!297 key!932) (size!6166 (_keys!6748 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (= (and d!61001 (not res!122602)) b!250316))

(assert (= (and b!250316 c!42058) b!250315))

(assert (= (and b!250316 (not c!42058)) b!250313))

(assert (= (and b!250315 res!122601) b!250314))

(assert (= (or b!250314 b!250313) bm!23498))

(declare-fun m!266949 () Bool)

(assert (=> bm!23498 m!266949))

(assert (=> b!250315 m!266691))

(declare-fun m!266951 () Bool)

(assert (=> b!250315 m!266951))

(declare-fun m!266953 () Bool)

(assert (=> b!250315 m!266953))

(assert (=> b!250315 m!266691))

(declare-fun m!266955 () Bool)

(assert (=> b!250315 m!266955))

(assert (=> b!250316 m!266691))

(assert (=> b!250316 m!266691))

(assert (=> b!250316 m!266695))

(assert (=> b!249976 d!61001))

(declare-fun mapIsEmpty!11020 () Bool)

(declare-fun mapRes!11020 () Bool)

(assert (=> mapIsEmpty!11020 mapRes!11020))

(declare-fun mapNonEmpty!11020 () Bool)

(declare-fun tp!23134 () Bool)

(declare-fun e!162329 () Bool)

(assert (=> mapNonEmpty!11020 (= mapRes!11020 (and tp!23134 e!162329))))

(declare-fun mapRest!11020 () (Array (_ BitVec 32) ValueCell!2897))

(declare-fun mapValue!11020 () ValueCell!2897)

(declare-fun mapKey!11020 () (_ BitVec 32))

(assert (=> mapNonEmpty!11020 (= mapRest!11019 (store mapRest!11020 mapKey!11020 mapValue!11020))))

(declare-fun b!250317 () Bool)

(assert (=> b!250317 (= e!162329 tp_is_empty!6481)))

(declare-fun b!250318 () Bool)

(declare-fun e!162328 () Bool)

(assert (=> b!250318 (= e!162328 tp_is_empty!6481)))

(declare-fun condMapEmpty!11020 () Bool)

(declare-fun mapDefault!11020 () ValueCell!2897)

(assert (=> mapNonEmpty!11019 (= condMapEmpty!11020 (= mapRest!11019 ((as const (Array (_ BitVec 32) ValueCell!2897)) mapDefault!11020)))))

(assert (=> mapNonEmpty!11019 (= tp!23133 (and e!162328 mapRes!11020))))

(assert (= (and mapNonEmpty!11019 condMapEmpty!11020) mapIsEmpty!11020))

(assert (= (and mapNonEmpty!11019 (not condMapEmpty!11020)) mapNonEmpty!11020))

(assert (= (and mapNonEmpty!11020 ((_ is ValueCellFull!2897) mapValue!11020)) b!250317))

(assert (= (and mapNonEmpty!11019 ((_ is ValueCellFull!2897) mapDefault!11020)) b!250318))

(declare-fun m!266957 () Bool)

(assert (=> mapNonEmpty!11020 m!266957))

(declare-fun b_lambda!8105 () Bool)

(assert (= b_lambda!8101 (or (and b!249734 b_free!6619) b_lambda!8105)))

(declare-fun b_lambda!8107 () Bool)

(assert (= b_lambda!8103 (or (and b!249734 b_free!6619) b_lambda!8107)))

(check-sat (not bm!23496) (not b!250270) (not b_next!6619) (not b!250093) (not b!250273) (not d!60913) (not b!250288) (not d!60941) (not b!250263) (not b!250238) (not b!250142) (not d!60999) (not b!250252) (not b!250145) (not b!250136) (not d!60909) (not bm!23481) (not d!60971) (not d!60987) (not b!250246) (not d!60919) b_and!13657 (not b!250205) (not d!60885) (not b!250316) (not b!250166) (not d!60979) (not b!250215) (not b!250315) (not d!60973) (not b!250235) (not b!250268) (not d!60937) (not b!250242) (not bm!23498) (not d!60981) (not b!250180) (not d!60995) (not d!60935) (not b_lambda!8107) (not bm!23497) (not bm!23486) (not d!60951) tp_is_empty!6481 (not bm!23482) (not b!250283) (not bm!23488) (not b!250099) (not d!60889) (not b!250282) (not b!250213) (not b!250227) (not d!60947) (not d!60975) (not d!60931) (not b!250240) (not b!250232) (not bm!23483) (not b!250269) (not b_lambda!8099) (not d!60991) (not d!60933) (not d!60967) (not b!250221) (not b!250157) (not bm!23487) (not b!250267) (not b!250141) (not b!250287) (not b!250210) (not b!250175) (not d!60997) (not b_lambda!8105) (not d!60925) (not b!250237) (not bm!23489) (not b!250222) (not d!60915) (not b!250274) (not d!60887) (not b!250164) (not d!60983) (not b!250206) (not d!60949) (not mapNonEmpty!11020) (not d!60993) (not b!250276) (not b!250285) (not b!250251) (not b!250134) (not d!60903) (not b!250272) (not b!250207) (not d!60895) (not b!250230) (not b!250262) (not b!250212) (not d!60961) (not b!250214) (not d!60985) (not d!60969) (not b!250286) (not d!60977) (not d!60989) (not b!250133) (not b!250100) (not b!250173) (not b!250144) (not bm!23491) (not b!250176) (not d!60965) (not b!250119) (not b!250137) (not b!250139) (not d!60927) (not b!250167) (not bm!23490))
(check-sat b_and!13657 (not b_next!6619))
