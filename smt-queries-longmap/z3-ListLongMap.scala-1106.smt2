; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22830 () Bool)

(assert start!22830)

(declare-fun b!237879 () Bool)

(declare-fun b_free!6387 () Bool)

(declare-fun b_next!6387 () Bool)

(assert (=> b!237879 (= b_free!6387 (not b_next!6387))))

(declare-fun tp!22356 () Bool)

(declare-fun b_and!13347 () Bool)

(assert (=> b!237879 (= tp!22356 b_and!13347)))

(declare-fun b!237870 () Bool)

(declare-fun e!154463 () Bool)

(declare-fun e!154464 () Bool)

(declare-fun mapRes!10596 () Bool)

(assert (=> b!237870 (= e!154463 (and e!154464 mapRes!10596))))

(declare-fun condMapEmpty!10596 () Bool)

(declare-datatypes ((V!7979 0))(
  ( (V!7980 (val!3169 Int)) )
))
(declare-datatypes ((ValueCell!2781 0))(
  ( (ValueCellFull!2781 (v!5204 V!7979)) (EmptyCell!2781) )
))
(declare-datatypes ((array!11771 0))(
  ( (array!11772 (arr!5590 (Array (_ BitVec 32) ValueCell!2781)) (size!5931 (_ BitVec 32))) )
))
(declare-datatypes ((array!11773 0))(
  ( (array!11774 (arr!5591 (Array (_ BitVec 32) (_ BitVec 64))) (size!5932 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3462 0))(
  ( (LongMapFixedSize!3463 (defaultEntry!4413 Int) (mask!10434 (_ BitVec 32)) (extraKeys!4150 (_ BitVec 32)) (zeroValue!4254 V!7979) (minValue!4254 V!7979) (_size!1780 (_ BitVec 32)) (_keys!6509 array!11773) (_values!4396 array!11771) (_vacant!1780 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3462)

(declare-fun mapDefault!10596 () ValueCell!2781)

(assert (=> b!237870 (= condMapEmpty!10596 (= (arr!5590 (_values!4396 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2781)) mapDefault!10596)))))

(declare-fun mapIsEmpty!10596 () Bool)

(assert (=> mapIsEmpty!10596 mapRes!10596))

(declare-fun b!237872 () Bool)

(declare-fun res!116564 () Bool)

(declare-fun e!154460 () Bool)

(assert (=> b!237872 (=> (not res!116564) (not e!154460))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!237872 (= res!116564 (validMask!0 (mask!10434 thiss!1504)))))

(declare-fun b!237873 () Bool)

(declare-fun tp_is_empty!6249 () Bool)

(assert (=> b!237873 (= e!154464 tp_is_empty!6249)))

(declare-fun mapNonEmpty!10596 () Bool)

(declare-fun tp!22355 () Bool)

(declare-fun e!154462 () Bool)

(assert (=> mapNonEmpty!10596 (= mapRes!10596 (and tp!22355 e!154462))))

(declare-fun mapRest!10596 () (Array (_ BitVec 32) ValueCell!2781))

(declare-fun mapKey!10596 () (_ BitVec 32))

(declare-fun mapValue!10596 () ValueCell!2781)

(assert (=> mapNonEmpty!10596 (= (arr!5590 (_values!4396 thiss!1504)) (store mapRest!10596 mapKey!10596 mapValue!10596))))

(declare-fun b!237874 () Bool)

(declare-fun res!116566 () Bool)

(assert (=> b!237874 (=> (not res!116566) (not e!154460))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4672 0))(
  ( (tuple2!4673 (_1!2347 (_ BitVec 64)) (_2!2347 V!7979)) )
))
(declare-datatypes ((List!3570 0))(
  ( (Nil!3567) (Cons!3566 (h!4222 tuple2!4672) (t!8559 List!3570)) )
))
(declare-datatypes ((ListLongMap!3585 0))(
  ( (ListLongMap!3586 (toList!1808 List!3570)) )
))
(declare-fun contains!1694 (ListLongMap!3585 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1336 (array!11773 array!11771 (_ BitVec 32) (_ BitVec 32) V!7979 V!7979 (_ BitVec 32) Int) ListLongMap!3585)

(assert (=> b!237874 (= res!116566 (not (contains!1694 (getCurrentListMap!1336 (_keys!6509 thiss!1504) (_values!4396 thiss!1504) (mask!10434 thiss!1504) (extraKeys!4150 thiss!1504) (zeroValue!4254 thiss!1504) (minValue!4254 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4413 thiss!1504)) key!932)))))

(declare-fun b!237875 () Bool)

(declare-fun res!116562 () Bool)

(declare-fun e!154461 () Bool)

(assert (=> b!237875 (=> (not res!116562) (not e!154461))))

(assert (=> b!237875 (= res!116562 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!237876 () Bool)

(assert (=> b!237876 (= e!154461 e!154460)))

(declare-fun res!116567 () Bool)

(assert (=> b!237876 (=> (not res!116567) (not e!154460))))

(declare-datatypes ((SeekEntryResult!1012 0))(
  ( (MissingZero!1012 (index!6218 (_ BitVec 32))) (Found!1012 (index!6219 (_ BitVec 32))) (Intermediate!1012 (undefined!1824 Bool) (index!6220 (_ BitVec 32)) (x!23990 (_ BitVec 32))) (Undefined!1012) (MissingVacant!1012 (index!6221 (_ BitVec 32))) )
))
(declare-fun lt!120294 () SeekEntryResult!1012)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!237876 (= res!116567 (or (= lt!120294 (MissingZero!1012 index!297)) (= lt!120294 (MissingVacant!1012 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11773 (_ BitVec 32)) SeekEntryResult!1012)

(assert (=> b!237876 (= lt!120294 (seekEntryOrOpen!0 key!932 (_keys!6509 thiss!1504) (mask!10434 thiss!1504)))))

(declare-fun b!237877 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11773 (_ BitVec 32)) Bool)

(assert (=> b!237877 (= e!154460 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6509 thiss!1504) (mask!10434 thiss!1504))))))

(declare-fun b!237878 () Bool)

(assert (=> b!237878 (= e!154462 tp_is_empty!6249)))

(declare-fun e!154458 () Bool)

(declare-fun array_inv!3693 (array!11773) Bool)

(declare-fun array_inv!3694 (array!11771) Bool)

(assert (=> b!237879 (= e!154458 (and tp!22356 tp_is_empty!6249 (array_inv!3693 (_keys!6509 thiss!1504)) (array_inv!3694 (_values!4396 thiss!1504)) e!154463))))

(declare-fun res!116565 () Bool)

(assert (=> start!22830 (=> (not res!116565) (not e!154461))))

(declare-fun valid!1367 (LongMapFixedSize!3462) Bool)

(assert (=> start!22830 (= res!116565 (valid!1367 thiss!1504))))

(assert (=> start!22830 e!154461))

(assert (=> start!22830 e!154458))

(assert (=> start!22830 true))

(declare-fun b!237871 () Bool)

(declare-fun res!116563 () Bool)

(assert (=> b!237871 (=> (not res!116563) (not e!154460))))

(assert (=> b!237871 (= res!116563 (and (= (size!5931 (_values!4396 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10434 thiss!1504))) (= (size!5932 (_keys!6509 thiss!1504)) (size!5931 (_values!4396 thiss!1504))) (bvsge (mask!10434 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4150 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4150 thiss!1504) #b00000000000000000000000000000011)))))

(assert (= (and start!22830 res!116565) b!237875))

(assert (= (and b!237875 res!116562) b!237876))

(assert (= (and b!237876 res!116567) b!237874))

(assert (= (and b!237874 res!116566) b!237872))

(assert (= (and b!237872 res!116564) b!237871))

(assert (= (and b!237871 res!116563) b!237877))

(assert (= (and b!237870 condMapEmpty!10596) mapIsEmpty!10596))

(assert (= (and b!237870 (not condMapEmpty!10596)) mapNonEmpty!10596))

(get-info :version)

(assert (= (and mapNonEmpty!10596 ((_ is ValueCellFull!2781) mapValue!10596)) b!237878))

(assert (= (and b!237870 ((_ is ValueCellFull!2781) mapDefault!10596)) b!237873))

(assert (= b!237879 b!237870))

(assert (= start!22830 b!237879))

(declare-fun m!258595 () Bool)

(assert (=> b!237872 m!258595))

(declare-fun m!258597 () Bool)

(assert (=> start!22830 m!258597))

(declare-fun m!258599 () Bool)

(assert (=> b!237879 m!258599))

(declare-fun m!258601 () Bool)

(assert (=> b!237879 m!258601))

(declare-fun m!258603 () Bool)

(assert (=> b!237876 m!258603))

(declare-fun m!258605 () Bool)

(assert (=> mapNonEmpty!10596 m!258605))

(declare-fun m!258607 () Bool)

(assert (=> b!237874 m!258607))

(assert (=> b!237874 m!258607))

(declare-fun m!258609 () Bool)

(assert (=> b!237874 m!258609))

(declare-fun m!258611 () Bool)

(assert (=> b!237877 m!258611))

(check-sat (not b!237877) tp_is_empty!6249 (not b!237876) (not b_next!6387) (not start!22830) (not b!237874) (not b!237879) (not b!237872) (not mapNonEmpty!10596) b_and!13347)
(check-sat b_and!13347 (not b_next!6387))
(get-model)

(declare-fun d!59711 () Bool)

(declare-fun e!154490 () Bool)

(assert (=> d!59711 e!154490))

(declare-fun res!116588 () Bool)

(assert (=> d!59711 (=> res!116588 e!154490)))

(declare-fun lt!120306 () Bool)

(assert (=> d!59711 (= res!116588 (not lt!120306))))

(declare-fun lt!120309 () Bool)

(assert (=> d!59711 (= lt!120306 lt!120309)))

(declare-datatypes ((Unit!7308 0))(
  ( (Unit!7309) )
))
(declare-fun lt!120307 () Unit!7308)

(declare-fun e!154491 () Unit!7308)

(assert (=> d!59711 (= lt!120307 e!154491)))

(declare-fun c!39683 () Bool)

(assert (=> d!59711 (= c!39683 lt!120309)))

(declare-fun containsKey!268 (List!3570 (_ BitVec 64)) Bool)

(assert (=> d!59711 (= lt!120309 (containsKey!268 (toList!1808 (getCurrentListMap!1336 (_keys!6509 thiss!1504) (_values!4396 thiss!1504) (mask!10434 thiss!1504) (extraKeys!4150 thiss!1504) (zeroValue!4254 thiss!1504) (minValue!4254 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4413 thiss!1504))) key!932))))

(assert (=> d!59711 (= (contains!1694 (getCurrentListMap!1336 (_keys!6509 thiss!1504) (_values!4396 thiss!1504) (mask!10434 thiss!1504) (extraKeys!4150 thiss!1504) (zeroValue!4254 thiss!1504) (minValue!4254 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4413 thiss!1504)) key!932) lt!120306)))

(declare-fun b!237916 () Bool)

(declare-fun lt!120308 () Unit!7308)

(assert (=> b!237916 (= e!154491 lt!120308)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!216 (List!3570 (_ BitVec 64)) Unit!7308)

(assert (=> b!237916 (= lt!120308 (lemmaContainsKeyImpliesGetValueByKeyDefined!216 (toList!1808 (getCurrentListMap!1336 (_keys!6509 thiss!1504) (_values!4396 thiss!1504) (mask!10434 thiss!1504) (extraKeys!4150 thiss!1504) (zeroValue!4254 thiss!1504) (minValue!4254 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4413 thiss!1504))) key!932))))

(declare-datatypes ((Option!282 0))(
  ( (Some!281 (v!5206 V!7979)) (None!280) )
))
(declare-fun isDefined!217 (Option!282) Bool)

(declare-fun getValueByKey!276 (List!3570 (_ BitVec 64)) Option!282)

(assert (=> b!237916 (isDefined!217 (getValueByKey!276 (toList!1808 (getCurrentListMap!1336 (_keys!6509 thiss!1504) (_values!4396 thiss!1504) (mask!10434 thiss!1504) (extraKeys!4150 thiss!1504) (zeroValue!4254 thiss!1504) (minValue!4254 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4413 thiss!1504))) key!932))))

(declare-fun b!237917 () Bool)

(declare-fun Unit!7310 () Unit!7308)

(assert (=> b!237917 (= e!154491 Unit!7310)))

(declare-fun b!237918 () Bool)

(assert (=> b!237918 (= e!154490 (isDefined!217 (getValueByKey!276 (toList!1808 (getCurrentListMap!1336 (_keys!6509 thiss!1504) (_values!4396 thiss!1504) (mask!10434 thiss!1504) (extraKeys!4150 thiss!1504) (zeroValue!4254 thiss!1504) (minValue!4254 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4413 thiss!1504))) key!932)))))

(assert (= (and d!59711 c!39683) b!237916))

(assert (= (and d!59711 (not c!39683)) b!237917))

(assert (= (and d!59711 (not res!116588)) b!237918))

(declare-fun m!258631 () Bool)

(assert (=> d!59711 m!258631))

(declare-fun m!258633 () Bool)

(assert (=> b!237916 m!258633))

(declare-fun m!258635 () Bool)

(assert (=> b!237916 m!258635))

(assert (=> b!237916 m!258635))

(declare-fun m!258637 () Bool)

(assert (=> b!237916 m!258637))

(assert (=> b!237918 m!258635))

(assert (=> b!237918 m!258635))

(assert (=> b!237918 m!258637))

(assert (=> b!237874 d!59711))

(declare-fun b!237961 () Bool)

(declare-fun e!154529 () Bool)

(declare-fun e!154519 () Bool)

(assert (=> b!237961 (= e!154529 e!154519)))

(declare-fun res!116613 () Bool)

(declare-fun call!22125 () Bool)

(assert (=> b!237961 (= res!116613 call!22125)))

(assert (=> b!237961 (=> (not res!116613) (not e!154519))))

(declare-fun b!237962 () Bool)

(declare-fun c!39696 () Bool)

(assert (=> b!237962 (= c!39696 (and (not (= (bvand (extraKeys!4150 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4150 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!154522 () ListLongMap!3585)

(declare-fun e!154518 () ListLongMap!3585)

(assert (=> b!237962 (= e!154522 e!154518)))

(declare-fun b!237963 () Bool)

(declare-fun e!154528 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!237963 (= e!154528 (validKeyInArray!0 (select (arr!5591 (_keys!6509 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!237964 () Bool)

(declare-fun e!154525 () Bool)

(declare-fun e!154520 () Bool)

(assert (=> b!237964 (= e!154525 e!154520)))

(declare-fun res!116612 () Bool)

(assert (=> b!237964 (=> (not res!116612) (not e!154520))))

(declare-fun lt!120373 () ListLongMap!3585)

(assert (=> b!237964 (= res!116612 (contains!1694 lt!120373 (select (arr!5591 (_keys!6509 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!237964 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5932 (_keys!6509 thiss!1504))))))

(declare-fun d!59713 () Bool)

(declare-fun e!154524 () Bool)

(assert (=> d!59713 e!154524))

(declare-fun res!116614 () Bool)

(assert (=> d!59713 (=> (not res!116614) (not e!154524))))

(assert (=> d!59713 (= res!116614 (or (bvsge #b00000000000000000000000000000000 (size!5932 (_keys!6509 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5932 (_keys!6509 thiss!1504))))))))

(declare-fun lt!120355 () ListLongMap!3585)

(assert (=> d!59713 (= lt!120373 lt!120355)))

(declare-fun lt!120374 () Unit!7308)

(declare-fun e!154530 () Unit!7308)

(assert (=> d!59713 (= lt!120374 e!154530)))

(declare-fun c!39697 () Bool)

(assert (=> d!59713 (= c!39697 e!154528)))

(declare-fun res!116610 () Bool)

(assert (=> d!59713 (=> (not res!116610) (not e!154528))))

(assert (=> d!59713 (= res!116610 (bvslt #b00000000000000000000000000000000 (size!5932 (_keys!6509 thiss!1504))))))

(declare-fun e!154521 () ListLongMap!3585)

(assert (=> d!59713 (= lt!120355 e!154521)))

(declare-fun c!39699 () Bool)

(assert (=> d!59713 (= c!39699 (and (not (= (bvand (extraKeys!4150 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4150 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59713 (validMask!0 (mask!10434 thiss!1504))))

(assert (=> d!59713 (= (getCurrentListMap!1336 (_keys!6509 thiss!1504) (_values!4396 thiss!1504) (mask!10434 thiss!1504) (extraKeys!4150 thiss!1504) (zeroValue!4254 thiss!1504) (minValue!4254 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4413 thiss!1504)) lt!120373)))

(declare-fun b!237965 () Bool)

(declare-fun e!154527 () Bool)

(declare-fun e!154523 () Bool)

(assert (=> b!237965 (= e!154527 e!154523)))

(declare-fun res!116611 () Bool)

(declare-fun call!22121 () Bool)

(assert (=> b!237965 (= res!116611 call!22121)))

(assert (=> b!237965 (=> (not res!116611) (not e!154523))))

(declare-fun b!237966 () Bool)

(declare-fun call!22122 () ListLongMap!3585)

(declare-fun +!645 (ListLongMap!3585 tuple2!4672) ListLongMap!3585)

(assert (=> b!237966 (= e!154521 (+!645 call!22122 (tuple2!4673 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4254 thiss!1504))))))

(declare-fun bm!22116 () Bool)

(assert (=> bm!22116 (= call!22121 (contains!1694 lt!120373 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!22117 () Bool)

(declare-fun c!39700 () Bool)

(declare-fun call!22120 () ListLongMap!3585)

(declare-fun call!22123 () ListLongMap!3585)

(declare-fun call!22119 () ListLongMap!3585)

(assert (=> bm!22117 (= call!22122 (+!645 (ite c!39699 call!22119 (ite c!39700 call!22120 call!22123)) (ite (or c!39699 c!39700) (tuple2!4673 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4254 thiss!1504)) (tuple2!4673 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4254 thiss!1504)))))))

(declare-fun b!237967 () Bool)

(declare-fun apply!218 (ListLongMap!3585 (_ BitVec 64)) V!7979)

(assert (=> b!237967 (= e!154519 (= (apply!218 lt!120373 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4254 thiss!1504)))))

(declare-fun b!237968 () Bool)

(declare-fun call!22124 () ListLongMap!3585)

(assert (=> b!237968 (= e!154522 call!22124)))

(declare-fun b!237969 () Bool)

(assert (=> b!237969 (= e!154527 (not call!22121))))

(declare-fun b!237970 () Bool)

(declare-fun get!2883 (ValueCell!2781 V!7979) V!7979)

(declare-fun dynLambda!561 (Int (_ BitVec 64)) V!7979)

(assert (=> b!237970 (= e!154520 (= (apply!218 lt!120373 (select (arr!5591 (_keys!6509 thiss!1504)) #b00000000000000000000000000000000)) (get!2883 (select (arr!5590 (_values!4396 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!561 (defaultEntry!4413 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!237970 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5931 (_values!4396 thiss!1504))))))

(assert (=> b!237970 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5932 (_keys!6509 thiss!1504))))))

(declare-fun b!237971 () Bool)

(declare-fun lt!120363 () Unit!7308)

(assert (=> b!237971 (= e!154530 lt!120363)))

(declare-fun lt!120354 () ListLongMap!3585)

(declare-fun getCurrentListMapNoExtraKeys!540 (array!11773 array!11771 (_ BitVec 32) (_ BitVec 32) V!7979 V!7979 (_ BitVec 32) Int) ListLongMap!3585)

(assert (=> b!237971 (= lt!120354 (getCurrentListMapNoExtraKeys!540 (_keys!6509 thiss!1504) (_values!4396 thiss!1504) (mask!10434 thiss!1504) (extraKeys!4150 thiss!1504) (zeroValue!4254 thiss!1504) (minValue!4254 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4413 thiss!1504)))))

(declare-fun lt!120358 () (_ BitVec 64))

(assert (=> b!237971 (= lt!120358 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120365 () (_ BitVec 64))

(assert (=> b!237971 (= lt!120365 (select (arr!5591 (_keys!6509 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120369 () Unit!7308)

(declare-fun addStillContains!194 (ListLongMap!3585 (_ BitVec 64) V!7979 (_ BitVec 64)) Unit!7308)

(assert (=> b!237971 (= lt!120369 (addStillContains!194 lt!120354 lt!120358 (zeroValue!4254 thiss!1504) lt!120365))))

(assert (=> b!237971 (contains!1694 (+!645 lt!120354 (tuple2!4673 lt!120358 (zeroValue!4254 thiss!1504))) lt!120365)))

(declare-fun lt!120356 () Unit!7308)

(assert (=> b!237971 (= lt!120356 lt!120369)))

(declare-fun lt!120364 () ListLongMap!3585)

(assert (=> b!237971 (= lt!120364 (getCurrentListMapNoExtraKeys!540 (_keys!6509 thiss!1504) (_values!4396 thiss!1504) (mask!10434 thiss!1504) (extraKeys!4150 thiss!1504) (zeroValue!4254 thiss!1504) (minValue!4254 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4413 thiss!1504)))))

(declare-fun lt!120357 () (_ BitVec 64))

(assert (=> b!237971 (= lt!120357 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120375 () (_ BitVec 64))

(assert (=> b!237971 (= lt!120375 (select (arr!5591 (_keys!6509 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120372 () Unit!7308)

(declare-fun addApplyDifferent!194 (ListLongMap!3585 (_ BitVec 64) V!7979 (_ BitVec 64)) Unit!7308)

(assert (=> b!237971 (= lt!120372 (addApplyDifferent!194 lt!120364 lt!120357 (minValue!4254 thiss!1504) lt!120375))))

(assert (=> b!237971 (= (apply!218 (+!645 lt!120364 (tuple2!4673 lt!120357 (minValue!4254 thiss!1504))) lt!120375) (apply!218 lt!120364 lt!120375))))

(declare-fun lt!120361 () Unit!7308)

(assert (=> b!237971 (= lt!120361 lt!120372)))

(declare-fun lt!120368 () ListLongMap!3585)

(assert (=> b!237971 (= lt!120368 (getCurrentListMapNoExtraKeys!540 (_keys!6509 thiss!1504) (_values!4396 thiss!1504) (mask!10434 thiss!1504) (extraKeys!4150 thiss!1504) (zeroValue!4254 thiss!1504) (minValue!4254 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4413 thiss!1504)))))

(declare-fun lt!120360 () (_ BitVec 64))

(assert (=> b!237971 (= lt!120360 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120366 () (_ BitVec 64))

(assert (=> b!237971 (= lt!120366 (select (arr!5591 (_keys!6509 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120371 () Unit!7308)

(assert (=> b!237971 (= lt!120371 (addApplyDifferent!194 lt!120368 lt!120360 (zeroValue!4254 thiss!1504) lt!120366))))

(assert (=> b!237971 (= (apply!218 (+!645 lt!120368 (tuple2!4673 lt!120360 (zeroValue!4254 thiss!1504))) lt!120366) (apply!218 lt!120368 lt!120366))))

(declare-fun lt!120359 () Unit!7308)

(assert (=> b!237971 (= lt!120359 lt!120371)))

(declare-fun lt!120370 () ListLongMap!3585)

(assert (=> b!237971 (= lt!120370 (getCurrentListMapNoExtraKeys!540 (_keys!6509 thiss!1504) (_values!4396 thiss!1504) (mask!10434 thiss!1504) (extraKeys!4150 thiss!1504) (zeroValue!4254 thiss!1504) (minValue!4254 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4413 thiss!1504)))))

(declare-fun lt!120362 () (_ BitVec 64))

(assert (=> b!237971 (= lt!120362 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120367 () (_ BitVec 64))

(assert (=> b!237971 (= lt!120367 (select (arr!5591 (_keys!6509 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!237971 (= lt!120363 (addApplyDifferent!194 lt!120370 lt!120362 (minValue!4254 thiss!1504) lt!120367))))

(assert (=> b!237971 (= (apply!218 (+!645 lt!120370 (tuple2!4673 lt!120362 (minValue!4254 thiss!1504))) lt!120367) (apply!218 lt!120370 lt!120367))))

(declare-fun bm!22118 () Bool)

(assert (=> bm!22118 (= call!22119 (getCurrentListMapNoExtraKeys!540 (_keys!6509 thiss!1504) (_values!4396 thiss!1504) (mask!10434 thiss!1504) (extraKeys!4150 thiss!1504) (zeroValue!4254 thiss!1504) (minValue!4254 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4413 thiss!1504)))))

(declare-fun b!237972 () Bool)

(declare-fun Unit!7311 () Unit!7308)

(assert (=> b!237972 (= e!154530 Unit!7311)))

(declare-fun b!237973 () Bool)

(declare-fun e!154526 () Bool)

(assert (=> b!237973 (= e!154526 (validKeyInArray!0 (select (arr!5591 (_keys!6509 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!237974 () Bool)

(assert (=> b!237974 (= e!154523 (= (apply!218 lt!120373 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4254 thiss!1504)))))

(declare-fun bm!22119 () Bool)

(assert (=> bm!22119 (= call!22124 call!22122)))

(declare-fun b!237975 () Bool)

(assert (=> b!237975 (= e!154518 call!22123)))

(declare-fun bm!22120 () Bool)

(assert (=> bm!22120 (= call!22120 call!22119)))

(declare-fun b!237976 () Bool)

(assert (=> b!237976 (= e!154529 (not call!22125))))

(declare-fun b!237977 () Bool)

(assert (=> b!237977 (= e!154524 e!154527)))

(declare-fun c!39701 () Bool)

(assert (=> b!237977 (= c!39701 (not (= (bvand (extraKeys!4150 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!22121 () Bool)

(assert (=> bm!22121 (= call!22125 (contains!1694 lt!120373 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!22122 () Bool)

(assert (=> bm!22122 (= call!22123 call!22120)))

(declare-fun b!237978 () Bool)

(assert (=> b!237978 (= e!154518 call!22124)))

(declare-fun b!237979 () Bool)

(declare-fun res!116609 () Bool)

(assert (=> b!237979 (=> (not res!116609) (not e!154524))))

(assert (=> b!237979 (= res!116609 e!154525)))

(declare-fun res!116608 () Bool)

(assert (=> b!237979 (=> res!116608 e!154525)))

(assert (=> b!237979 (= res!116608 (not e!154526))))

(declare-fun res!116607 () Bool)

(assert (=> b!237979 (=> (not res!116607) (not e!154526))))

(assert (=> b!237979 (= res!116607 (bvslt #b00000000000000000000000000000000 (size!5932 (_keys!6509 thiss!1504))))))

(declare-fun b!237980 () Bool)

(declare-fun res!116615 () Bool)

(assert (=> b!237980 (=> (not res!116615) (not e!154524))))

(assert (=> b!237980 (= res!116615 e!154529)))

(declare-fun c!39698 () Bool)

(assert (=> b!237980 (= c!39698 (not (= (bvand (extraKeys!4150 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!237981 () Bool)

(assert (=> b!237981 (= e!154521 e!154522)))

(assert (=> b!237981 (= c!39700 (and (not (= (bvand (extraKeys!4150 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4150 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!59713 c!39699) b!237966))

(assert (= (and d!59713 (not c!39699)) b!237981))

(assert (= (and b!237981 c!39700) b!237968))

(assert (= (and b!237981 (not c!39700)) b!237962))

(assert (= (and b!237962 c!39696) b!237978))

(assert (= (and b!237962 (not c!39696)) b!237975))

(assert (= (or b!237978 b!237975) bm!22122))

(assert (= (or b!237968 bm!22122) bm!22120))

(assert (= (or b!237968 b!237978) bm!22119))

(assert (= (or b!237966 bm!22120) bm!22118))

(assert (= (or b!237966 bm!22119) bm!22117))

(assert (= (and d!59713 res!116610) b!237963))

(assert (= (and d!59713 c!39697) b!237971))

(assert (= (and d!59713 (not c!39697)) b!237972))

(assert (= (and d!59713 res!116614) b!237979))

(assert (= (and b!237979 res!116607) b!237973))

(assert (= (and b!237979 (not res!116608)) b!237964))

(assert (= (and b!237964 res!116612) b!237970))

(assert (= (and b!237979 res!116609) b!237980))

(assert (= (and b!237980 c!39698) b!237961))

(assert (= (and b!237980 (not c!39698)) b!237976))

(assert (= (and b!237961 res!116613) b!237967))

(assert (= (or b!237961 b!237976) bm!22121))

(assert (= (and b!237980 res!116615) b!237977))

(assert (= (and b!237977 c!39701) b!237965))

(assert (= (and b!237977 (not c!39701)) b!237969))

(assert (= (and b!237965 res!116611) b!237974))

(assert (= (or b!237965 b!237969) bm!22116))

(declare-fun b_lambda!7967 () Bool)

(assert (=> (not b_lambda!7967) (not b!237970)))

(declare-fun t!8561 () Bool)

(declare-fun tb!2949 () Bool)

(assert (=> (and b!237879 (= (defaultEntry!4413 thiss!1504) (defaultEntry!4413 thiss!1504)) t!8561) tb!2949))

(declare-fun result!5169 () Bool)

(assert (=> tb!2949 (= result!5169 tp_is_empty!6249)))

(assert (=> b!237970 t!8561))

(declare-fun b_and!13351 () Bool)

(assert (= b_and!13347 (and (=> t!8561 result!5169) b_and!13351)))

(declare-fun m!258639 () Bool)

(assert (=> b!237974 m!258639))

(declare-fun m!258641 () Bool)

(assert (=> bm!22116 m!258641))

(assert (=> d!59713 m!258595))

(declare-fun m!258643 () Bool)

(assert (=> b!237966 m!258643))

(declare-fun m!258645 () Bool)

(assert (=> b!237967 m!258645))

(declare-fun m!258647 () Bool)

(assert (=> b!237963 m!258647))

(assert (=> b!237963 m!258647))

(declare-fun m!258649 () Bool)

(assert (=> b!237963 m!258649))

(declare-fun m!258651 () Bool)

(assert (=> bm!22117 m!258651))

(declare-fun m!258653 () Bool)

(assert (=> bm!22118 m!258653))

(declare-fun m!258655 () Bool)

(assert (=> b!237970 m!258655))

(declare-fun m!258657 () Bool)

(assert (=> b!237970 m!258657))

(assert (=> b!237970 m!258655))

(declare-fun m!258659 () Bool)

(assert (=> b!237970 m!258659))

(assert (=> b!237970 m!258657))

(assert (=> b!237970 m!258647))

(assert (=> b!237970 m!258647))

(declare-fun m!258661 () Bool)

(assert (=> b!237970 m!258661))

(assert (=> b!237973 m!258647))

(assert (=> b!237973 m!258647))

(assert (=> b!237973 m!258649))

(declare-fun m!258663 () Bool)

(assert (=> b!237971 m!258663))

(declare-fun m!258665 () Bool)

(assert (=> b!237971 m!258665))

(declare-fun m!258667 () Bool)

(assert (=> b!237971 m!258667))

(assert (=> b!237971 m!258653))

(declare-fun m!258669 () Bool)

(assert (=> b!237971 m!258669))

(declare-fun m!258671 () Bool)

(assert (=> b!237971 m!258671))

(assert (=> b!237971 m!258647))

(assert (=> b!237971 m!258663))

(assert (=> b!237971 m!258669))

(declare-fun m!258673 () Bool)

(assert (=> b!237971 m!258673))

(declare-fun m!258675 () Bool)

(assert (=> b!237971 m!258675))

(declare-fun m!258677 () Bool)

(assert (=> b!237971 m!258677))

(declare-fun m!258679 () Bool)

(assert (=> b!237971 m!258679))

(declare-fun m!258681 () Bool)

(assert (=> b!237971 m!258681))

(assert (=> b!237971 m!258675))

(declare-fun m!258683 () Bool)

(assert (=> b!237971 m!258683))

(declare-fun m!258685 () Bool)

(assert (=> b!237971 m!258685))

(declare-fun m!258687 () Bool)

(assert (=> b!237971 m!258687))

(declare-fun m!258689 () Bool)

(assert (=> b!237971 m!258689))

(assert (=> b!237971 m!258683))

(declare-fun m!258691 () Bool)

(assert (=> b!237971 m!258691))

(assert (=> b!237964 m!258647))

(assert (=> b!237964 m!258647))

(declare-fun m!258693 () Bool)

(assert (=> b!237964 m!258693))

(declare-fun m!258695 () Bool)

(assert (=> bm!22121 m!258695))

(assert (=> b!237874 d!59713))

(declare-fun d!59715 () Bool)

(assert (=> d!59715 (= (array_inv!3693 (_keys!6509 thiss!1504)) (bvsge (size!5932 (_keys!6509 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!237879 d!59715))

(declare-fun d!59717 () Bool)

(assert (=> d!59717 (= (array_inv!3694 (_values!4396 thiss!1504)) (bvsge (size!5931 (_values!4396 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!237879 d!59717))

(declare-fun b!237992 () Bool)

(declare-fun e!154539 () Bool)

(declare-fun e!154538 () Bool)

(assert (=> b!237992 (= e!154539 e!154538)))

(declare-fun lt!120383 () (_ BitVec 64))

(assert (=> b!237992 (= lt!120383 (select (arr!5591 (_keys!6509 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120382 () Unit!7308)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11773 (_ BitVec 64) (_ BitVec 32)) Unit!7308)

(assert (=> b!237992 (= lt!120382 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6509 thiss!1504) lt!120383 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!11773 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!237992 (arrayContainsKey!0 (_keys!6509 thiss!1504) lt!120383 #b00000000000000000000000000000000)))

(declare-fun lt!120384 () Unit!7308)

(assert (=> b!237992 (= lt!120384 lt!120382)))

(declare-fun res!116621 () Bool)

(assert (=> b!237992 (= res!116621 (= (seekEntryOrOpen!0 (select (arr!5591 (_keys!6509 thiss!1504)) #b00000000000000000000000000000000) (_keys!6509 thiss!1504) (mask!10434 thiss!1504)) (Found!1012 #b00000000000000000000000000000000)))))

(assert (=> b!237992 (=> (not res!116621) (not e!154538))))

(declare-fun bm!22125 () Bool)

(declare-fun call!22128 () Bool)

(assert (=> bm!22125 (= call!22128 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6509 thiss!1504) (mask!10434 thiss!1504)))))

(declare-fun b!237993 () Bool)

(declare-fun e!154537 () Bool)

(assert (=> b!237993 (= e!154537 e!154539)))

(declare-fun c!39704 () Bool)

(assert (=> b!237993 (= c!39704 (validKeyInArray!0 (select (arr!5591 (_keys!6509 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!237994 () Bool)

(assert (=> b!237994 (= e!154538 call!22128)))

(declare-fun d!59719 () Bool)

(declare-fun res!116620 () Bool)

(assert (=> d!59719 (=> res!116620 e!154537)))

(assert (=> d!59719 (= res!116620 (bvsge #b00000000000000000000000000000000 (size!5932 (_keys!6509 thiss!1504))))))

(assert (=> d!59719 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6509 thiss!1504) (mask!10434 thiss!1504)) e!154537)))

(declare-fun b!237995 () Bool)

(assert (=> b!237995 (= e!154539 call!22128)))

(assert (= (and d!59719 (not res!116620)) b!237993))

(assert (= (and b!237993 c!39704) b!237992))

(assert (= (and b!237993 (not c!39704)) b!237995))

(assert (= (and b!237992 res!116621) b!237994))

(assert (= (or b!237994 b!237995) bm!22125))

(assert (=> b!237992 m!258647))

(declare-fun m!258697 () Bool)

(assert (=> b!237992 m!258697))

(declare-fun m!258699 () Bool)

(assert (=> b!237992 m!258699))

(assert (=> b!237992 m!258647))

(declare-fun m!258701 () Bool)

(assert (=> b!237992 m!258701))

(declare-fun m!258703 () Bool)

(assert (=> bm!22125 m!258703))

(assert (=> b!237993 m!258647))

(assert (=> b!237993 m!258647))

(assert (=> b!237993 m!258649))

(assert (=> b!237877 d!59719))

(declare-fun b!238009 () Bool)

(declare-fun e!154547 () SeekEntryResult!1012)

(declare-fun lt!120391 () SeekEntryResult!1012)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11773 (_ BitVec 32)) SeekEntryResult!1012)

(assert (=> b!238009 (= e!154547 (seekKeyOrZeroReturnVacant!0 (x!23990 lt!120391) (index!6220 lt!120391) (index!6220 lt!120391) key!932 (_keys!6509 thiss!1504) (mask!10434 thiss!1504)))))

(declare-fun b!238010 () Bool)

(declare-fun e!154548 () SeekEntryResult!1012)

(declare-fun e!154546 () SeekEntryResult!1012)

(assert (=> b!238010 (= e!154548 e!154546)))

(declare-fun lt!120392 () (_ BitVec 64))

(assert (=> b!238010 (= lt!120392 (select (arr!5591 (_keys!6509 thiss!1504)) (index!6220 lt!120391)))))

(declare-fun c!39713 () Bool)

(assert (=> b!238010 (= c!39713 (= lt!120392 key!932))))

(declare-fun b!238011 () Bool)

(declare-fun c!39711 () Bool)

(assert (=> b!238011 (= c!39711 (= lt!120392 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!238011 (= e!154546 e!154547)))

(declare-fun b!238012 () Bool)

(assert (=> b!238012 (= e!154546 (Found!1012 (index!6220 lt!120391)))))

(declare-fun b!238013 () Bool)

(assert (=> b!238013 (= e!154547 (MissingZero!1012 (index!6220 lt!120391)))))

(declare-fun b!238008 () Bool)

(assert (=> b!238008 (= e!154548 Undefined!1012)))

(declare-fun d!59721 () Bool)

(declare-fun lt!120393 () SeekEntryResult!1012)

(assert (=> d!59721 (and (or ((_ is Undefined!1012) lt!120393) (not ((_ is Found!1012) lt!120393)) (and (bvsge (index!6219 lt!120393) #b00000000000000000000000000000000) (bvslt (index!6219 lt!120393) (size!5932 (_keys!6509 thiss!1504))))) (or ((_ is Undefined!1012) lt!120393) ((_ is Found!1012) lt!120393) (not ((_ is MissingZero!1012) lt!120393)) (and (bvsge (index!6218 lt!120393) #b00000000000000000000000000000000) (bvslt (index!6218 lt!120393) (size!5932 (_keys!6509 thiss!1504))))) (or ((_ is Undefined!1012) lt!120393) ((_ is Found!1012) lt!120393) ((_ is MissingZero!1012) lt!120393) (not ((_ is MissingVacant!1012) lt!120393)) (and (bvsge (index!6221 lt!120393) #b00000000000000000000000000000000) (bvslt (index!6221 lt!120393) (size!5932 (_keys!6509 thiss!1504))))) (or ((_ is Undefined!1012) lt!120393) (ite ((_ is Found!1012) lt!120393) (= (select (arr!5591 (_keys!6509 thiss!1504)) (index!6219 lt!120393)) key!932) (ite ((_ is MissingZero!1012) lt!120393) (= (select (arr!5591 (_keys!6509 thiss!1504)) (index!6218 lt!120393)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1012) lt!120393) (= (select (arr!5591 (_keys!6509 thiss!1504)) (index!6221 lt!120393)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!59721 (= lt!120393 e!154548)))

(declare-fun c!39712 () Bool)

(assert (=> d!59721 (= c!39712 (and ((_ is Intermediate!1012) lt!120391) (undefined!1824 lt!120391)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11773 (_ BitVec 32)) SeekEntryResult!1012)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59721 (= lt!120391 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10434 thiss!1504)) key!932 (_keys!6509 thiss!1504) (mask!10434 thiss!1504)))))

(assert (=> d!59721 (validMask!0 (mask!10434 thiss!1504))))

(assert (=> d!59721 (= (seekEntryOrOpen!0 key!932 (_keys!6509 thiss!1504) (mask!10434 thiss!1504)) lt!120393)))

(assert (= (and d!59721 c!39712) b!238008))

(assert (= (and d!59721 (not c!39712)) b!238010))

(assert (= (and b!238010 c!39713) b!238012))

(assert (= (and b!238010 (not c!39713)) b!238011))

(assert (= (and b!238011 c!39711) b!238013))

(assert (= (and b!238011 (not c!39711)) b!238009))

(declare-fun m!258705 () Bool)

(assert (=> b!238009 m!258705))

(declare-fun m!258707 () Bool)

(assert (=> b!238010 m!258707))

(declare-fun m!258709 () Bool)

(assert (=> d!59721 m!258709))

(declare-fun m!258711 () Bool)

(assert (=> d!59721 m!258711))

(declare-fun m!258713 () Bool)

(assert (=> d!59721 m!258713))

(declare-fun m!258715 () Bool)

(assert (=> d!59721 m!258715))

(assert (=> d!59721 m!258595))

(assert (=> d!59721 m!258711))

(declare-fun m!258717 () Bool)

(assert (=> d!59721 m!258717))

(assert (=> b!237876 d!59721))

(declare-fun d!59723 () Bool)

(assert (=> d!59723 (= (validMask!0 (mask!10434 thiss!1504)) (and (or (= (mask!10434 thiss!1504) #b00000000000000000000000000000111) (= (mask!10434 thiss!1504) #b00000000000000000000000000001111) (= (mask!10434 thiss!1504) #b00000000000000000000000000011111) (= (mask!10434 thiss!1504) #b00000000000000000000000000111111) (= (mask!10434 thiss!1504) #b00000000000000000000000001111111) (= (mask!10434 thiss!1504) #b00000000000000000000000011111111) (= (mask!10434 thiss!1504) #b00000000000000000000000111111111) (= (mask!10434 thiss!1504) #b00000000000000000000001111111111) (= (mask!10434 thiss!1504) #b00000000000000000000011111111111) (= (mask!10434 thiss!1504) #b00000000000000000000111111111111) (= (mask!10434 thiss!1504) #b00000000000000000001111111111111) (= (mask!10434 thiss!1504) #b00000000000000000011111111111111) (= (mask!10434 thiss!1504) #b00000000000000000111111111111111) (= (mask!10434 thiss!1504) #b00000000000000001111111111111111) (= (mask!10434 thiss!1504) #b00000000000000011111111111111111) (= (mask!10434 thiss!1504) #b00000000000000111111111111111111) (= (mask!10434 thiss!1504) #b00000000000001111111111111111111) (= (mask!10434 thiss!1504) #b00000000000011111111111111111111) (= (mask!10434 thiss!1504) #b00000000000111111111111111111111) (= (mask!10434 thiss!1504) #b00000000001111111111111111111111) (= (mask!10434 thiss!1504) #b00000000011111111111111111111111) (= (mask!10434 thiss!1504) #b00000000111111111111111111111111) (= (mask!10434 thiss!1504) #b00000001111111111111111111111111) (= (mask!10434 thiss!1504) #b00000011111111111111111111111111) (= (mask!10434 thiss!1504) #b00000111111111111111111111111111) (= (mask!10434 thiss!1504) #b00001111111111111111111111111111) (= (mask!10434 thiss!1504) #b00011111111111111111111111111111) (= (mask!10434 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10434 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!237872 d!59723))

(declare-fun d!59725 () Bool)

(declare-fun res!116628 () Bool)

(declare-fun e!154551 () Bool)

(assert (=> d!59725 (=> (not res!116628) (not e!154551))))

(declare-fun simpleValid!241 (LongMapFixedSize!3462) Bool)

(assert (=> d!59725 (= res!116628 (simpleValid!241 thiss!1504))))

(assert (=> d!59725 (= (valid!1367 thiss!1504) e!154551)))

(declare-fun b!238020 () Bool)

(declare-fun res!116629 () Bool)

(assert (=> b!238020 (=> (not res!116629) (not e!154551))))

(declare-fun arrayCountValidKeys!0 (array!11773 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!238020 (= res!116629 (= (arrayCountValidKeys!0 (_keys!6509 thiss!1504) #b00000000000000000000000000000000 (size!5932 (_keys!6509 thiss!1504))) (_size!1780 thiss!1504)))))

(declare-fun b!238021 () Bool)

(declare-fun res!116630 () Bool)

(assert (=> b!238021 (=> (not res!116630) (not e!154551))))

(assert (=> b!238021 (= res!116630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6509 thiss!1504) (mask!10434 thiss!1504)))))

(declare-fun b!238022 () Bool)

(declare-datatypes ((List!3571 0))(
  ( (Nil!3568) (Cons!3567 (h!4223 (_ BitVec 64)) (t!8562 List!3571)) )
))
(declare-fun arrayNoDuplicates!0 (array!11773 (_ BitVec 32) List!3571) Bool)

(assert (=> b!238022 (= e!154551 (arrayNoDuplicates!0 (_keys!6509 thiss!1504) #b00000000000000000000000000000000 Nil!3568))))

(assert (= (and d!59725 res!116628) b!238020))

(assert (= (and b!238020 res!116629) b!238021))

(assert (= (and b!238021 res!116630) b!238022))

(declare-fun m!258719 () Bool)

(assert (=> d!59725 m!258719))

(declare-fun m!258721 () Bool)

(assert (=> b!238020 m!258721))

(assert (=> b!238021 m!258611))

(declare-fun m!258723 () Bool)

(assert (=> b!238022 m!258723))

(assert (=> start!22830 d!59725))

(declare-fun condMapEmpty!10602 () Bool)

(declare-fun mapDefault!10602 () ValueCell!2781)

(assert (=> mapNonEmpty!10596 (= condMapEmpty!10602 (= mapRest!10596 ((as const (Array (_ BitVec 32) ValueCell!2781)) mapDefault!10602)))))

(declare-fun e!154557 () Bool)

(declare-fun mapRes!10602 () Bool)

(assert (=> mapNonEmpty!10596 (= tp!22355 (and e!154557 mapRes!10602))))

(declare-fun b!238030 () Bool)

(assert (=> b!238030 (= e!154557 tp_is_empty!6249)))

(declare-fun mapIsEmpty!10602 () Bool)

(assert (=> mapIsEmpty!10602 mapRes!10602))

(declare-fun mapNonEmpty!10602 () Bool)

(declare-fun tp!22365 () Bool)

(declare-fun e!154556 () Bool)

(assert (=> mapNonEmpty!10602 (= mapRes!10602 (and tp!22365 e!154556))))

(declare-fun mapKey!10602 () (_ BitVec 32))

(declare-fun mapValue!10602 () ValueCell!2781)

(declare-fun mapRest!10602 () (Array (_ BitVec 32) ValueCell!2781))

(assert (=> mapNonEmpty!10602 (= mapRest!10596 (store mapRest!10602 mapKey!10602 mapValue!10602))))

(declare-fun b!238029 () Bool)

(assert (=> b!238029 (= e!154556 tp_is_empty!6249)))

(assert (= (and mapNonEmpty!10596 condMapEmpty!10602) mapIsEmpty!10602))

(assert (= (and mapNonEmpty!10596 (not condMapEmpty!10602)) mapNonEmpty!10602))

(assert (= (and mapNonEmpty!10602 ((_ is ValueCellFull!2781) mapValue!10602)) b!238029))

(assert (= (and mapNonEmpty!10596 ((_ is ValueCellFull!2781) mapDefault!10602)) b!238030))

(declare-fun m!258725 () Bool)

(assert (=> mapNonEmpty!10602 m!258725))

(declare-fun b_lambda!7969 () Bool)

(assert (= b_lambda!7967 (or (and b!237879 b_free!6387) b_lambda!7969)))

(check-sat (not b!237964) (not b!237971) (not d!59725) (not b_lambda!7969) (not bm!22116) (not bm!22121) (not b!237963) (not d!59713) (not b!238022) (not b!237918) (not b!237993) (not b!237974) (not bm!22125) (not b!238021) (not bm!22118) (not b!238020) (not mapNonEmpty!10602) tp_is_empty!6249 (not d!59721) (not bm!22117) (not b!237992) (not b!238009) b_and!13351 (not b!237967) (not b_next!6387) (not d!59711) (not b!237973) (not b!237970) (not b!237966) (not b!237916))
(check-sat b_and!13351 (not b_next!6387))
