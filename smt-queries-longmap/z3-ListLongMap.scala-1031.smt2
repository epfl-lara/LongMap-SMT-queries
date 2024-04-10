; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21870 () Bool)

(assert start!21870)

(declare-fun b!220939 () Bool)

(declare-fun b_free!5937 () Bool)

(declare-fun b_next!5937 () Bool)

(assert (=> b!220939 (= b_free!5937 (not b_next!5937))))

(declare-fun tp!20953 () Bool)

(declare-fun b_and!12835 () Bool)

(assert (=> b!220939 (= tp!20953 b_and!12835)))

(declare-fun bm!20642 () Bool)

(declare-fun call!20646 () Bool)

(declare-fun c!36750 () Bool)

(declare-datatypes ((V!7379 0))(
  ( (V!7380 (val!2944 Int)) )
))
(declare-datatypes ((ValueCell!2556 0))(
  ( (ValueCellFull!2556 (v!4964 V!7379)) (EmptyCell!2556) )
))
(declare-datatypes ((array!10841 0))(
  ( (array!10842 (arr!5140 (Array (_ BitVec 32) ValueCell!2556)) (size!5473 (_ BitVec 32))) )
))
(declare-datatypes ((array!10843 0))(
  ( (array!10844 (arr!5141 (Array (_ BitVec 32) (_ BitVec 64))) (size!5474 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3012 0))(
  ( (LongMapFixedSize!3013 (defaultEntry!4165 Int) (mask!9971 (_ BitVec 32)) (extraKeys!3902 (_ BitVec 32)) (zeroValue!4006 V!7379) (minValue!4006 V!7379) (_size!1555 (_ BitVec 32)) (_keys!6219 array!10843) (_values!4148 array!10841) (_vacant!1555 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3012)

(declare-datatypes ((SeekEntryResult!818 0))(
  ( (MissingZero!818 (index!5442 (_ BitVec 32))) (Found!818 (index!5443 (_ BitVec 32))) (Intermediate!818 (undefined!1630 Bool) (index!5444 (_ BitVec 32)) (x!22982 (_ BitVec 32))) (Undefined!818) (MissingVacant!818 (index!5445 (_ BitVec 32))) )
))
(declare-fun lt!112290 () SeekEntryResult!818)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20642 (= call!20646 (inRange!0 (ite c!36750 (index!5442 lt!112290) (index!5445 lt!112290)) (mask!9971 thiss!1504)))))

(declare-fun b!220918 () Bool)

(declare-fun e!143620 () Bool)

(declare-fun tp_is_empty!5799 () Bool)

(assert (=> b!220918 (= e!143620 tp_is_empty!5799)))

(declare-fun b!220919 () Bool)

(declare-fun e!143617 () Bool)

(declare-fun e!143614 () Bool)

(assert (=> b!220919 (= e!143617 e!143614)))

(declare-fun res!108358 () Bool)

(assert (=> b!220919 (=> (not res!108358) (not e!143614))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!220919 (= res!108358 (or (= lt!112290 (MissingZero!818 index!297)) (= lt!112290 (MissingVacant!818 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10843 (_ BitVec 32)) SeekEntryResult!818)

(assert (=> b!220919 (= lt!112290 (seekEntryOrOpen!0 key!932 (_keys!6219 thiss!1504) (mask!9971 thiss!1504)))))

(declare-fun b!220920 () Bool)

(declare-fun e!143618 () Bool)

(declare-fun call!20645 () Bool)

(assert (=> b!220920 (= e!143618 (not call!20645))))

(declare-fun b!220921 () Bool)

(declare-fun res!108359 () Bool)

(assert (=> b!220921 (= res!108359 (= (select (arr!5141 (_keys!6219 thiss!1504)) (index!5445 lt!112290)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!220921 (=> (not res!108359) (not e!143618))))

(declare-fun b!220922 () Bool)

(declare-fun e!143611 () Bool)

(assert (=> b!220922 (= e!143611 (not call!20645))))

(declare-fun b!220923 () Bool)

(declare-datatypes ((Unit!6594 0))(
  ( (Unit!6595) )
))
(declare-fun e!143616 () Unit!6594)

(declare-fun lt!112292 () Unit!6594)

(assert (=> b!220923 (= e!143616 lt!112292)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!220 (array!10843 array!10841 (_ BitVec 32) (_ BitVec 32) V!7379 V!7379 (_ BitVec 64) Int) Unit!6594)

(assert (=> b!220923 (= lt!112292 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!220 (_keys!6219 thiss!1504) (_values!4148 thiss!1504) (mask!9971 thiss!1504) (extraKeys!3902 thiss!1504) (zeroValue!4006 thiss!1504) (minValue!4006 thiss!1504) key!932 (defaultEntry!4165 thiss!1504)))))

(get-info :version)

(assert (=> b!220923 (= c!36750 ((_ is MissingZero!818) lt!112290))))

(declare-fun e!143610 () Bool)

(assert (=> b!220923 e!143610))

(declare-fun mapIsEmpty!9868 () Bool)

(declare-fun mapRes!9868 () Bool)

(assert (=> mapIsEmpty!9868 mapRes!9868))

(declare-fun b!220924 () Bool)

(declare-fun e!143621 () Bool)

(assert (=> b!220924 (= e!143621 false)))

(declare-fun lt!112289 () Bool)

(declare-datatypes ((List!3271 0))(
  ( (Nil!3268) (Cons!3267 (h!3915 (_ BitVec 64)) (t!8230 List!3271)) )
))
(declare-fun arrayNoDuplicates!0 (array!10843 (_ BitVec 32) List!3271) Bool)

(assert (=> b!220924 (= lt!112289 (arrayNoDuplicates!0 (_keys!6219 thiss!1504) #b00000000000000000000000000000000 Nil!3268))))

(declare-fun b!220925 () Bool)

(declare-fun res!108353 () Bool)

(assert (=> b!220925 (=> (not res!108353) (not e!143621))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10843 (_ BitVec 32)) Bool)

(assert (=> b!220925 (= res!108353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6219 thiss!1504) (mask!9971 thiss!1504)))))

(declare-fun b!220926 () Bool)

(declare-fun res!108352 () Bool)

(assert (=> b!220926 (=> (not res!108352) (not e!143621))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!220926 (= res!108352 (validMask!0 (mask!9971 thiss!1504)))))

(declare-fun b!220927 () Bool)

(declare-fun res!108355 () Bool)

(assert (=> b!220927 (=> (not res!108355) (not e!143617))))

(assert (=> b!220927 (= res!108355 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!220928 () Bool)

(assert (=> b!220928 (= e!143614 e!143621)))

(declare-fun res!108357 () Bool)

(assert (=> b!220928 (=> (not res!108357) (not e!143621))))

(assert (=> b!220928 (= res!108357 (inRange!0 index!297 (mask!9971 thiss!1504)))))

(declare-fun lt!112288 () Unit!6594)

(assert (=> b!220928 (= lt!112288 e!143616)))

(declare-fun c!36749 () Bool)

(declare-datatypes ((tuple2!4368 0))(
  ( (tuple2!4369 (_1!2195 (_ BitVec 64)) (_2!2195 V!7379)) )
))
(declare-datatypes ((List!3272 0))(
  ( (Nil!3269) (Cons!3268 (h!3916 tuple2!4368) (t!8231 List!3272)) )
))
(declare-datatypes ((ListLongMap!3281 0))(
  ( (ListLongMap!3282 (toList!1656 List!3272)) )
))
(declare-fun contains!1499 (ListLongMap!3281 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1184 (array!10843 array!10841 (_ BitVec 32) (_ BitVec 32) V!7379 V!7379 (_ BitVec 32) Int) ListLongMap!3281)

(assert (=> b!220928 (= c!36749 (contains!1499 (getCurrentListMap!1184 (_keys!6219 thiss!1504) (_values!4148 thiss!1504) (mask!9971 thiss!1504) (extraKeys!3902 thiss!1504) (zeroValue!4006 thiss!1504) (minValue!4006 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4165 thiss!1504)) key!932))))

(declare-fun b!220929 () Bool)

(declare-fun e!143615 () Bool)

(declare-fun e!143612 () Bool)

(assert (=> b!220929 (= e!143615 (and e!143612 mapRes!9868))))

(declare-fun condMapEmpty!9868 () Bool)

(declare-fun mapDefault!9868 () ValueCell!2556)

(assert (=> b!220929 (= condMapEmpty!9868 (= (arr!5140 (_values!4148 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2556)) mapDefault!9868)))))

(declare-fun b!220930 () Bool)

(declare-fun res!108354 () Bool)

(assert (=> b!220930 (=> (not res!108354) (not e!143621))))

(declare-fun arrayContainsKey!0 (array!10843 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!220930 (= res!108354 (arrayContainsKey!0 (_keys!6219 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!220931 () Bool)

(declare-fun res!108361 () Bool)

(assert (=> b!220931 (=> (not res!108361) (not e!143621))))

(assert (=> b!220931 (= res!108361 (and (= (size!5473 (_values!4148 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9971 thiss!1504))) (= (size!5474 (_keys!6219 thiss!1504)) (size!5473 (_values!4148 thiss!1504))) (bvsge (mask!9971 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3902 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3902 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun res!108350 () Bool)

(assert (=> start!21870 (=> (not res!108350) (not e!143617))))

(declare-fun valid!1215 (LongMapFixedSize!3012) Bool)

(assert (=> start!21870 (= res!108350 (valid!1215 thiss!1504))))

(assert (=> start!21870 e!143617))

(declare-fun e!143613 () Bool)

(assert (=> start!21870 e!143613))

(assert (=> start!21870 true))

(declare-fun b!220932 () Bool)

(declare-fun e!143609 () Bool)

(assert (=> b!220932 (= e!143609 ((_ is Undefined!818) lt!112290))))

(declare-fun b!220933 () Bool)

(declare-fun res!108360 () Bool)

(assert (=> b!220933 (=> (not res!108360) (not e!143611))))

(assert (=> b!220933 (= res!108360 call!20646)))

(assert (=> b!220933 (= e!143610 e!143611)))

(declare-fun b!220934 () Bool)

(assert (=> b!220934 (= e!143612 tp_is_empty!5799)))

(declare-fun b!220935 () Bool)

(declare-fun c!36748 () Bool)

(assert (=> b!220935 (= c!36748 ((_ is MissingVacant!818) lt!112290))))

(assert (=> b!220935 (= e!143610 e!143609)))

(declare-fun b!220936 () Bool)

(assert (=> b!220936 (= e!143609 e!143618)))

(declare-fun res!108356 () Bool)

(assert (=> b!220936 (= res!108356 call!20646)))

(assert (=> b!220936 (=> (not res!108356) (not e!143618))))

(declare-fun b!220937 () Bool)

(declare-fun res!108351 () Bool)

(assert (=> b!220937 (=> (not res!108351) (not e!143611))))

(assert (=> b!220937 (= res!108351 (= (select (arr!5141 (_keys!6219 thiss!1504)) (index!5442 lt!112290)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!9868 () Bool)

(declare-fun tp!20952 () Bool)

(assert (=> mapNonEmpty!9868 (= mapRes!9868 (and tp!20952 e!143620))))

(declare-fun mapRest!9868 () (Array (_ BitVec 32) ValueCell!2556))

(declare-fun mapKey!9868 () (_ BitVec 32))

(declare-fun mapValue!9868 () ValueCell!2556)

(assert (=> mapNonEmpty!9868 (= (arr!5140 (_values!4148 thiss!1504)) (store mapRest!9868 mapKey!9868 mapValue!9868))))

(declare-fun b!220938 () Bool)

(declare-fun Unit!6596 () Unit!6594)

(assert (=> b!220938 (= e!143616 Unit!6596)))

(declare-fun lt!112291 () Unit!6594)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!209 (array!10843 array!10841 (_ BitVec 32) (_ BitVec 32) V!7379 V!7379 (_ BitVec 64) Int) Unit!6594)

(assert (=> b!220938 (= lt!112291 (lemmaInListMapThenSeekEntryOrOpenFindsIt!209 (_keys!6219 thiss!1504) (_values!4148 thiss!1504) (mask!9971 thiss!1504) (extraKeys!3902 thiss!1504) (zeroValue!4006 thiss!1504) (minValue!4006 thiss!1504) key!932 (defaultEntry!4165 thiss!1504)))))

(assert (=> b!220938 false))

(declare-fun bm!20643 () Bool)

(assert (=> bm!20643 (= call!20645 (arrayContainsKey!0 (_keys!6219 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun array_inv!3401 (array!10843) Bool)

(declare-fun array_inv!3402 (array!10841) Bool)

(assert (=> b!220939 (= e!143613 (and tp!20953 tp_is_empty!5799 (array_inv!3401 (_keys!6219 thiss!1504)) (array_inv!3402 (_values!4148 thiss!1504)) e!143615))))

(assert (= (and start!21870 res!108350) b!220927))

(assert (= (and b!220927 res!108355) b!220919))

(assert (= (and b!220919 res!108358) b!220928))

(assert (= (and b!220928 c!36749) b!220938))

(assert (= (and b!220928 (not c!36749)) b!220923))

(assert (= (and b!220923 c!36750) b!220933))

(assert (= (and b!220923 (not c!36750)) b!220935))

(assert (= (and b!220933 res!108360) b!220937))

(assert (= (and b!220937 res!108351) b!220922))

(assert (= (and b!220935 c!36748) b!220936))

(assert (= (and b!220935 (not c!36748)) b!220932))

(assert (= (and b!220936 res!108356) b!220921))

(assert (= (and b!220921 res!108359) b!220920))

(assert (= (or b!220933 b!220936) bm!20642))

(assert (= (or b!220922 b!220920) bm!20643))

(assert (= (and b!220928 res!108357) b!220930))

(assert (= (and b!220930 res!108354) b!220926))

(assert (= (and b!220926 res!108352) b!220931))

(assert (= (and b!220931 res!108361) b!220925))

(assert (= (and b!220925 res!108353) b!220924))

(assert (= (and b!220929 condMapEmpty!9868) mapIsEmpty!9868))

(assert (= (and b!220929 (not condMapEmpty!9868)) mapNonEmpty!9868))

(assert (= (and mapNonEmpty!9868 ((_ is ValueCellFull!2556) mapValue!9868)) b!220918))

(assert (= (and b!220929 ((_ is ValueCellFull!2556) mapDefault!9868)) b!220934))

(assert (= b!220939 b!220929))

(assert (= start!21870 b!220939))

(declare-fun m!245811 () Bool)

(assert (=> b!220939 m!245811))

(declare-fun m!245813 () Bool)

(assert (=> b!220939 m!245813))

(declare-fun m!245815 () Bool)

(assert (=> b!220938 m!245815))

(declare-fun m!245817 () Bool)

(assert (=> b!220925 m!245817))

(declare-fun m!245819 () Bool)

(assert (=> b!220924 m!245819))

(declare-fun m!245821 () Bool)

(assert (=> mapNonEmpty!9868 m!245821))

(declare-fun m!245823 () Bool)

(assert (=> bm!20643 m!245823))

(declare-fun m!245825 () Bool)

(assert (=> bm!20642 m!245825))

(declare-fun m!245827 () Bool)

(assert (=> b!220921 m!245827))

(declare-fun m!245829 () Bool)

(assert (=> b!220928 m!245829))

(declare-fun m!245831 () Bool)

(assert (=> b!220928 m!245831))

(assert (=> b!220928 m!245831))

(declare-fun m!245833 () Bool)

(assert (=> b!220928 m!245833))

(assert (=> b!220930 m!245823))

(declare-fun m!245835 () Bool)

(assert (=> b!220919 m!245835))

(declare-fun m!245837 () Bool)

(assert (=> b!220937 m!245837))

(declare-fun m!245839 () Bool)

(assert (=> start!21870 m!245839))

(declare-fun m!245841 () Bool)

(assert (=> b!220923 m!245841))

(declare-fun m!245843 () Bool)

(assert (=> b!220926 m!245843))

(check-sat tp_is_empty!5799 (not b!220930) (not b!220926) (not bm!20642) (not b!220938) (not b!220924) (not b!220919) (not start!21870) (not b!220923) (not b!220928) (not b!220939) (not mapNonEmpty!9868) b_and!12835 (not b_next!5937) (not b!220925) (not bm!20643))
(check-sat b_and!12835 (not b_next!5937))
