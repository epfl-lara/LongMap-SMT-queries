; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22916 () Bool)

(assert start!22916)

(declare-fun b!238691 () Bool)

(declare-fun b_free!6415 () Bool)

(declare-fun b_next!6415 () Bool)

(assert (=> b!238691 (= b_free!6415 (not b_next!6415))))

(declare-fun tp!22448 () Bool)

(declare-fun b_and!13355 () Bool)

(assert (=> b!238691 (= tp!22448 b_and!13355)))

(declare-fun b!238673 () Bool)

(declare-datatypes ((Unit!7321 0))(
  ( (Unit!7322) )
))
(declare-fun e!154969 () Unit!7321)

(declare-fun lt!120488 () Unit!7321)

(assert (=> b!238673 (= e!154969 lt!120488)))

(declare-datatypes ((V!8017 0))(
  ( (V!8018 (val!3183 Int)) )
))
(declare-datatypes ((ValueCell!2795 0))(
  ( (ValueCellFull!2795 (v!5215 V!8017)) (EmptyCell!2795) )
))
(declare-datatypes ((array!11825 0))(
  ( (array!11826 (arr!5613 (Array (_ BitVec 32) ValueCell!2795)) (size!5955 (_ BitVec 32))) )
))
(declare-datatypes ((array!11827 0))(
  ( (array!11828 (arr!5614 (Array (_ BitVec 32) (_ BitVec 64))) (size!5956 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3490 0))(
  ( (LongMapFixedSize!3491 (defaultEntry!4430 Int) (mask!10469 (_ BitVec 32)) (extraKeys!4167 (_ BitVec 32)) (zeroValue!4271 V!8017) (minValue!4271 V!8017) (_size!1794 (_ BitVec 32)) (_keys!6531 array!11827) (_values!4413 array!11825) (_vacant!1794 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3490)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!323 (array!11827 array!11825 (_ BitVec 32) (_ BitVec 32) V!8017 V!8017 (_ BitVec 64) Int) Unit!7321)

(assert (=> b!238673 (= lt!120488 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!323 (_keys!6531 thiss!1504) (_values!4413 thiss!1504) (mask!10469 thiss!1504) (extraKeys!4167 thiss!1504) (zeroValue!4271 thiss!1504) (minValue!4271 thiss!1504) key!932 (defaultEntry!4430 thiss!1504)))))

(declare-fun c!39794 () Bool)

(declare-datatypes ((SeekEntryResult!1019 0))(
  ( (MissingZero!1019 (index!6246 (_ BitVec 32))) (Found!1019 (index!6247 (_ BitVec 32))) (Intermediate!1019 (undefined!1831 Bool) (index!6248 (_ BitVec 32)) (x!24066 (_ BitVec 32))) (Undefined!1019) (MissingVacant!1019 (index!6249 (_ BitVec 32))) )
))
(declare-fun lt!120486 () SeekEntryResult!1019)

(get-info :version)

(assert (=> b!238673 (= c!39794 ((_ is MissingZero!1019) lt!120486))))

(declare-fun e!154968 () Bool)

(assert (=> b!238673 e!154968))

(declare-fun b!238674 () Bool)

(declare-fun res!116946 () Bool)

(declare-fun e!154962 () Bool)

(assert (=> b!238674 (=> (not res!116946) (not e!154962))))

(assert (=> b!238674 (= res!116946 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!238675 () Bool)

(declare-fun c!39793 () Bool)

(assert (=> b!238675 (= c!39793 ((_ is MissingVacant!1019) lt!120486))))

(declare-fun e!154959 () Bool)

(assert (=> b!238675 (= e!154968 e!154959)))

(declare-fun b!238676 () Bool)

(declare-fun res!116951 () Bool)

(declare-fun e!154964 () Bool)

(assert (=> b!238676 (=> (not res!116951) (not e!154964))))

(declare-fun call!22181 () Bool)

(assert (=> b!238676 (= res!116951 call!22181)))

(assert (=> b!238676 (= e!154968 e!154964)))

(declare-fun b!238677 () Bool)

(declare-fun res!116947 () Bool)

(declare-fun e!154965 () Bool)

(assert (=> b!238677 (=> (not res!116947) (not e!154965))))

(declare-fun arrayContainsKey!0 (array!11827 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!238677 (= res!116947 (arrayContainsKey!0 (_keys!6531 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!10647 () Bool)

(declare-fun mapRes!10647 () Bool)

(assert (=> mapIsEmpty!10647 mapRes!10647))

(declare-fun b!238678 () Bool)

(declare-fun e!154966 () Bool)

(declare-fun tp_is_empty!6277 () Bool)

(assert (=> b!238678 (= e!154966 tp_is_empty!6277)))

(declare-fun b!238679 () Bool)

(declare-fun res!116944 () Bool)

(assert (=> b!238679 (=> (not res!116944) (not e!154964))))

(assert (=> b!238679 (= res!116944 (= (select (arr!5614 (_keys!6531 thiss!1504)) (index!6246 lt!120486)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!238680 () Bool)

(declare-fun e!154961 () Bool)

(declare-fun call!22182 () Bool)

(assert (=> b!238680 (= e!154961 (not call!22182))))

(declare-fun b!238681 () Bool)

(assert (=> b!238681 (= e!154965 (not (= (size!5955 (_values!4413 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10469 thiss!1504)))))))

(declare-fun b!238682 () Bool)

(assert (=> b!238682 (= e!154959 e!154961)))

(declare-fun res!116949 () Bool)

(assert (=> b!238682 (= res!116949 call!22181)))

(assert (=> b!238682 (=> (not res!116949) (not e!154961))))

(declare-fun b!238683 () Bool)

(declare-fun res!116948 () Bool)

(assert (=> b!238683 (= res!116948 (= (select (arr!5614 (_keys!6531 thiss!1504)) (index!6249 lt!120486)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!238683 (=> (not res!116948) (not e!154961))))

(declare-fun bm!22178 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22178 (= call!22181 (inRange!0 (ite c!39794 (index!6246 lt!120486) (index!6249 lt!120486)) (mask!10469 thiss!1504)))))

(declare-fun res!116952 () Bool)

(assert (=> start!22916 (=> (not res!116952) (not e!154962))))

(declare-fun valid!1382 (LongMapFixedSize!3490) Bool)

(assert (=> start!22916 (= res!116952 (valid!1382 thiss!1504))))

(assert (=> start!22916 e!154962))

(declare-fun e!154960 () Bool)

(assert (=> start!22916 e!154960))

(assert (=> start!22916 true))

(declare-fun b!238684 () Bool)

(declare-fun e!154963 () Bool)

(assert (=> b!238684 (= e!154962 e!154963)))

(declare-fun res!116950 () Bool)

(assert (=> b!238684 (=> (not res!116950) (not e!154963))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!238684 (= res!116950 (or (= lt!120486 (MissingZero!1019 index!297)) (= lt!120486 (MissingVacant!1019 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11827 (_ BitVec 32)) SeekEntryResult!1019)

(assert (=> b!238684 (= lt!120486 (seekEntryOrOpen!0 key!932 (_keys!6531 thiss!1504) (mask!10469 thiss!1504)))))

(declare-fun b!238685 () Bool)

(assert (=> b!238685 (= e!154959 ((_ is Undefined!1019) lt!120486))))

(declare-fun bm!22179 () Bool)

(assert (=> bm!22179 (= call!22182 (arrayContainsKey!0 (_keys!6531 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!238686 () Bool)

(declare-fun Unit!7323 () Unit!7321)

(assert (=> b!238686 (= e!154969 Unit!7323)))

(declare-fun lt!120487 () Unit!7321)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!329 (array!11827 array!11825 (_ BitVec 32) (_ BitVec 32) V!8017 V!8017 (_ BitVec 64) Int) Unit!7321)

(assert (=> b!238686 (= lt!120487 (lemmaInListMapThenSeekEntryOrOpenFindsIt!329 (_keys!6531 thiss!1504) (_values!4413 thiss!1504) (mask!10469 thiss!1504) (extraKeys!4167 thiss!1504) (zeroValue!4271 thiss!1504) (minValue!4271 thiss!1504) key!932 (defaultEntry!4430 thiss!1504)))))

(assert (=> b!238686 false))

(declare-fun b!238687 () Bool)

(assert (=> b!238687 (= e!154963 e!154965)))

(declare-fun res!116945 () Bool)

(assert (=> b!238687 (=> (not res!116945) (not e!154965))))

(assert (=> b!238687 (= res!116945 (inRange!0 index!297 (mask!10469 thiss!1504)))))

(declare-fun lt!120485 () Unit!7321)

(assert (=> b!238687 (= lt!120485 e!154969)))

(declare-fun c!39795 () Bool)

(declare-datatypes ((tuple2!4666 0))(
  ( (tuple2!4667 (_1!2344 (_ BitVec 64)) (_2!2344 V!8017)) )
))
(declare-datatypes ((List!3576 0))(
  ( (Nil!3573) (Cons!3572 (h!4228 tuple2!4666) (t!8562 List!3576)) )
))
(declare-datatypes ((ListLongMap!3569 0))(
  ( (ListLongMap!3570 (toList!1800 List!3576)) )
))
(declare-fun contains!1691 (ListLongMap!3569 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1309 (array!11827 array!11825 (_ BitVec 32) (_ BitVec 32) V!8017 V!8017 (_ BitVec 32) Int) ListLongMap!3569)

(assert (=> b!238687 (= c!39795 (contains!1691 (getCurrentListMap!1309 (_keys!6531 thiss!1504) (_values!4413 thiss!1504) (mask!10469 thiss!1504) (extraKeys!4167 thiss!1504) (zeroValue!4271 thiss!1504) (minValue!4271 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4430 thiss!1504)) key!932))))

(declare-fun b!238688 () Bool)

(declare-fun e!154957 () Bool)

(declare-fun e!154958 () Bool)

(assert (=> b!238688 (= e!154957 (and e!154958 mapRes!10647))))

(declare-fun condMapEmpty!10647 () Bool)

(declare-fun mapDefault!10647 () ValueCell!2795)

(assert (=> b!238688 (= condMapEmpty!10647 (= (arr!5613 (_values!4413 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2795)) mapDefault!10647)))))

(declare-fun b!238689 () Bool)

(assert (=> b!238689 (= e!154958 tp_is_empty!6277)))

(declare-fun b!238690 () Bool)

(assert (=> b!238690 (= e!154964 (not call!22182))))

(declare-fun mapNonEmpty!10647 () Bool)

(declare-fun tp!22449 () Bool)

(assert (=> mapNonEmpty!10647 (= mapRes!10647 (and tp!22449 e!154966))))

(declare-fun mapValue!10647 () ValueCell!2795)

(declare-fun mapKey!10647 () (_ BitVec 32))

(declare-fun mapRest!10647 () (Array (_ BitVec 32) ValueCell!2795))

(assert (=> mapNonEmpty!10647 (= (arr!5613 (_values!4413 thiss!1504)) (store mapRest!10647 mapKey!10647 mapValue!10647))))

(declare-fun array_inv!3705 (array!11827) Bool)

(declare-fun array_inv!3706 (array!11825) Bool)

(assert (=> b!238691 (= e!154960 (and tp!22448 tp_is_empty!6277 (array_inv!3705 (_keys!6531 thiss!1504)) (array_inv!3706 (_values!4413 thiss!1504)) e!154957))))

(declare-fun b!238692 () Bool)

(declare-fun res!116943 () Bool)

(assert (=> b!238692 (=> (not res!116943) (not e!154965))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!238692 (= res!116943 (validMask!0 (mask!10469 thiss!1504)))))

(assert (= (and start!22916 res!116952) b!238674))

(assert (= (and b!238674 res!116946) b!238684))

(assert (= (and b!238684 res!116950) b!238687))

(assert (= (and b!238687 c!39795) b!238686))

(assert (= (and b!238687 (not c!39795)) b!238673))

(assert (= (and b!238673 c!39794) b!238676))

(assert (= (and b!238673 (not c!39794)) b!238675))

(assert (= (and b!238676 res!116951) b!238679))

(assert (= (and b!238679 res!116944) b!238690))

(assert (= (and b!238675 c!39793) b!238682))

(assert (= (and b!238675 (not c!39793)) b!238685))

(assert (= (and b!238682 res!116949) b!238683))

(assert (= (and b!238683 res!116948) b!238680))

(assert (= (or b!238676 b!238682) bm!22178))

(assert (= (or b!238690 b!238680) bm!22179))

(assert (= (and b!238687 res!116945) b!238677))

(assert (= (and b!238677 res!116947) b!238692))

(assert (= (and b!238692 res!116943) b!238681))

(assert (= (and b!238688 condMapEmpty!10647) mapIsEmpty!10647))

(assert (= (and b!238688 (not condMapEmpty!10647)) mapNonEmpty!10647))

(assert (= (and mapNonEmpty!10647 ((_ is ValueCellFull!2795) mapValue!10647)) b!238678))

(assert (= (and b!238688 ((_ is ValueCellFull!2795) mapDefault!10647)) b!238689))

(assert (= b!238691 b!238688))

(assert (= start!22916 b!238691))

(declare-fun m!258583 () Bool)

(assert (=> b!238679 m!258583))

(declare-fun m!258585 () Bool)

(assert (=> b!238683 m!258585))

(declare-fun m!258587 () Bool)

(assert (=> bm!22179 m!258587))

(assert (=> b!238677 m!258587))

(declare-fun m!258589 () Bool)

(assert (=> b!238686 m!258589))

(declare-fun m!258591 () Bool)

(assert (=> start!22916 m!258591))

(declare-fun m!258593 () Bool)

(assert (=> b!238684 m!258593))

(declare-fun m!258595 () Bool)

(assert (=> b!238691 m!258595))

(declare-fun m!258597 () Bool)

(assert (=> b!238691 m!258597))

(declare-fun m!258599 () Bool)

(assert (=> mapNonEmpty!10647 m!258599))

(declare-fun m!258601 () Bool)

(assert (=> b!238673 m!258601))

(declare-fun m!258603 () Bool)

(assert (=> b!238687 m!258603))

(declare-fun m!258605 () Bool)

(assert (=> b!238687 m!258605))

(assert (=> b!238687 m!258605))

(declare-fun m!258607 () Bool)

(assert (=> b!238687 m!258607))

(declare-fun m!258609 () Bool)

(assert (=> bm!22178 m!258609))

(declare-fun m!258611 () Bool)

(assert (=> b!238692 m!258611))

(check-sat (not b!238686) (not start!22916) (not b!238673) (not b!238687) (not b!238684) (not b!238692) b_and!13355 (not b!238691) tp_is_empty!6277 (not mapNonEmpty!10647) (not b!238677) (not b_next!6415) (not bm!22178) (not bm!22179))
(check-sat b_and!13355 (not b_next!6415))
