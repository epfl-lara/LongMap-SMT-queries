; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22910 () Bool)

(assert start!22910)

(declare-fun b!238699 () Bool)

(declare-fun b_free!6409 () Bool)

(declare-fun b_next!6409 () Bool)

(assert (=> b!238699 (= b_free!6409 (not b_next!6409))))

(declare-fun tp!22430 () Bool)

(declare-fun b_and!13389 () Bool)

(assert (=> b!238699 (= tp!22430 b_and!13389)))

(declare-fun b!238694 () Bool)

(declare-fun e!154969 () Bool)

(declare-fun e!154972 () Bool)

(assert (=> b!238694 (= e!154969 e!154972)))

(declare-fun res!116979 () Bool)

(declare-fun call!22176 () Bool)

(assert (=> b!238694 (= res!116979 call!22176)))

(assert (=> b!238694 (=> (not res!116979) (not e!154972))))

(declare-fun b!238695 () Bool)

(declare-fun res!116980 () Bool)

(declare-fun e!154966 () Bool)

(assert (=> b!238695 (=> (not res!116980) (not e!154966))))

(declare-datatypes ((V!8009 0))(
  ( (V!8010 (val!3180 Int)) )
))
(declare-datatypes ((ValueCell!2792 0))(
  ( (ValueCellFull!2792 (v!5219 V!8009)) (EmptyCell!2792) )
))
(declare-datatypes ((array!11819 0))(
  ( (array!11820 (arr!5611 (Array (_ BitVec 32) ValueCell!2792)) (size!5952 (_ BitVec 32))) )
))
(declare-datatypes ((array!11821 0))(
  ( (array!11822 (arr!5612 (Array (_ BitVec 32) (_ BitVec 64))) (size!5953 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3484 0))(
  ( (LongMapFixedSize!3485 (defaultEntry!4427 Int) (mask!10465 (_ BitVec 32)) (extraKeys!4164 (_ BitVec 32)) (zeroValue!4268 V!8009) (minValue!4268 V!8009) (_size!1791 (_ BitVec 32)) (_keys!6529 array!11821) (_values!4410 array!11819) (_vacant!1791 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3484)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11821 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!238695 (= res!116980 (arrayContainsKey!0 (_keys!6529 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun res!116983 () Bool)

(declare-fun e!154973 () Bool)

(assert (=> start!22910 (=> (not res!116983) (not e!154973))))

(declare-fun valid!1387 (LongMapFixedSize!3484) Bool)

(assert (=> start!22910 (= res!116983 (valid!1387 thiss!1504))))

(assert (=> start!22910 e!154973))

(declare-fun e!154967 () Bool)

(assert (=> start!22910 e!154967))

(assert (=> start!22910 true))

(declare-fun b!238696 () Bool)

(declare-fun call!22175 () Bool)

(assert (=> b!238696 (= e!154972 (not call!22175))))

(declare-fun b!238697 () Bool)

(declare-fun e!154974 () Bool)

(assert (=> b!238697 (= e!154974 e!154966)))

(declare-fun res!116978 () Bool)

(assert (=> b!238697 (=> (not res!116978) (not e!154966))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!238697 (= res!116978 (inRange!0 index!297 (mask!10465 thiss!1504)))))

(declare-datatypes ((Unit!7307 0))(
  ( (Unit!7308) )
))
(declare-fun lt!120691 () Unit!7307)

(declare-fun e!154971 () Unit!7307)

(assert (=> b!238697 (= lt!120691 e!154971)))

(declare-fun c!39807 () Bool)

(declare-datatypes ((tuple2!4614 0))(
  ( (tuple2!4615 (_1!2318 (_ BitVec 64)) (_2!2318 V!8009)) )
))
(declare-datatypes ((List!3504 0))(
  ( (Nil!3501) (Cons!3500 (h!4156 tuple2!4614) (t!8491 List!3504)) )
))
(declare-datatypes ((ListLongMap!3529 0))(
  ( (ListLongMap!3530 (toList!1780 List!3504)) )
))
(declare-fun contains!1682 (ListLongMap!3529 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1312 (array!11821 array!11819 (_ BitVec 32) (_ BitVec 32) V!8009 V!8009 (_ BitVec 32) Int) ListLongMap!3529)

(assert (=> b!238697 (= c!39807 (contains!1682 (getCurrentListMap!1312 (_keys!6529 thiss!1504) (_values!4410 thiss!1504) (mask!10465 thiss!1504) (extraKeys!4164 thiss!1504) (zeroValue!4268 thiss!1504) (minValue!4268 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4427 thiss!1504)) key!932))))

(declare-fun b!238698 () Bool)

(declare-fun e!154965 () Bool)

(declare-fun e!154975 () Bool)

(declare-fun mapRes!10638 () Bool)

(assert (=> b!238698 (= e!154965 (and e!154975 mapRes!10638))))

(declare-fun condMapEmpty!10638 () Bool)

(declare-fun mapDefault!10638 () ValueCell!2792)

(assert (=> b!238698 (= condMapEmpty!10638 (= (arr!5611 (_values!4410 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2792)) mapDefault!10638)))))

(declare-fun bm!22172 () Bool)

(assert (=> bm!22172 (= call!22175 (arrayContainsKey!0 (_keys!6529 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun tp_is_empty!6271 () Bool)

(declare-fun array_inv!3687 (array!11821) Bool)

(declare-fun array_inv!3688 (array!11819) Bool)

(assert (=> b!238699 (= e!154967 (and tp!22430 tp_is_empty!6271 (array_inv!3687 (_keys!6529 thiss!1504)) (array_inv!3688 (_values!4410 thiss!1504)) e!154965))))

(declare-fun c!39805 () Bool)

(declare-datatypes ((SeekEntryResult!990 0))(
  ( (MissingZero!990 (index!6130 (_ BitVec 32))) (Found!990 (index!6131 (_ BitVec 32))) (Intermediate!990 (undefined!1802 Bool) (index!6132 (_ BitVec 32)) (x!24030 (_ BitVec 32))) (Undefined!990) (MissingVacant!990 (index!6133 (_ BitVec 32))) )
))
(declare-fun lt!120690 () SeekEntryResult!990)

(declare-fun bm!22173 () Bool)

(assert (=> bm!22173 (= call!22176 (inRange!0 (ite c!39805 (index!6130 lt!120690) (index!6133 lt!120690)) (mask!10465 thiss!1504)))))

(declare-fun b!238700 () Bool)

(assert (=> b!238700 (= e!154975 tp_is_empty!6271)))

(declare-fun b!238701 () Bool)

(declare-fun Unit!7309 () Unit!7307)

(assert (=> b!238701 (= e!154971 Unit!7309)))

(declare-fun lt!120689 () Unit!7307)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!323 (array!11821 array!11819 (_ BitVec 32) (_ BitVec 32) V!8009 V!8009 (_ BitVec 64) Int) Unit!7307)

(assert (=> b!238701 (= lt!120689 (lemmaInListMapThenSeekEntryOrOpenFindsIt!323 (_keys!6529 thiss!1504) (_values!4410 thiss!1504) (mask!10465 thiss!1504) (extraKeys!4164 thiss!1504) (zeroValue!4268 thiss!1504) (minValue!4268 thiss!1504) key!932 (defaultEntry!4427 thiss!1504)))))

(assert (=> b!238701 false))

(declare-fun mapNonEmpty!10638 () Bool)

(declare-fun tp!22431 () Bool)

(declare-fun e!154976 () Bool)

(assert (=> mapNonEmpty!10638 (= mapRes!10638 (and tp!22431 e!154976))))

(declare-fun mapRest!10638 () (Array (_ BitVec 32) ValueCell!2792))

(declare-fun mapKey!10638 () (_ BitVec 32))

(declare-fun mapValue!10638 () ValueCell!2792)

(assert (=> mapNonEmpty!10638 (= (arr!5611 (_values!4410 thiss!1504)) (store mapRest!10638 mapKey!10638 mapValue!10638))))

(declare-fun b!238702 () Bool)

(assert (=> b!238702 (= e!154976 tp_is_empty!6271)))

(declare-fun b!238703 () Bool)

(assert (=> b!238703 (= e!154973 e!154974)))

(declare-fun res!116977 () Bool)

(assert (=> b!238703 (=> (not res!116977) (not e!154974))))

(assert (=> b!238703 (= res!116977 (or (= lt!120690 (MissingZero!990 index!297)) (= lt!120690 (MissingVacant!990 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11821 (_ BitVec 32)) SeekEntryResult!990)

(assert (=> b!238703 (= lt!120690 (seekEntryOrOpen!0 key!932 (_keys!6529 thiss!1504) (mask!10465 thiss!1504)))))

(declare-fun b!238704 () Bool)

(declare-fun c!39806 () Bool)

(get-info :version)

(assert (=> b!238704 (= c!39806 ((_ is MissingVacant!990) lt!120690))))

(declare-fun e!154970 () Bool)

(assert (=> b!238704 (= e!154970 e!154969)))

(declare-fun b!238705 () Bool)

(declare-fun lt!120692 () Unit!7307)

(assert (=> b!238705 (= e!154971 lt!120692)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!316 (array!11821 array!11819 (_ BitVec 32) (_ BitVec 32) V!8009 V!8009 (_ BitVec 64) Int) Unit!7307)

(assert (=> b!238705 (= lt!120692 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!316 (_keys!6529 thiss!1504) (_values!4410 thiss!1504) (mask!10465 thiss!1504) (extraKeys!4164 thiss!1504) (zeroValue!4268 thiss!1504) (minValue!4268 thiss!1504) key!932 (defaultEntry!4427 thiss!1504)))))

(assert (=> b!238705 (= c!39805 ((_ is MissingZero!990) lt!120690))))

(assert (=> b!238705 e!154970))

(declare-fun mapIsEmpty!10638 () Bool)

(assert (=> mapIsEmpty!10638 mapRes!10638))

(declare-fun b!238706 () Bool)

(declare-fun e!154977 () Bool)

(assert (=> b!238706 (= e!154977 (not call!22175))))

(declare-fun b!238707 () Bool)

(declare-fun res!116976 () Bool)

(assert (=> b!238707 (=> (not res!116976) (not e!154973))))

(assert (=> b!238707 (= res!116976 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!238708 () Bool)

(declare-fun res!116984 () Bool)

(assert (=> b!238708 (=> (not res!116984) (not e!154977))))

(assert (=> b!238708 (= res!116984 (= (select (arr!5612 (_keys!6529 thiss!1504)) (index!6130 lt!120690)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!238709 () Bool)

(declare-fun res!116982 () Bool)

(assert (=> b!238709 (=> (not res!116982) (not e!154977))))

(assert (=> b!238709 (= res!116982 call!22176)))

(assert (=> b!238709 (= e!154970 e!154977)))

(declare-fun b!238710 () Bool)

(assert (=> b!238710 (= e!154969 ((_ is Undefined!990) lt!120690))))

(declare-fun b!238711 () Bool)

(declare-fun res!116981 () Bool)

(assert (=> b!238711 (= res!116981 (= (select (arr!5612 (_keys!6529 thiss!1504)) (index!6133 lt!120690)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!238711 (=> (not res!116981) (not e!154972))))

(declare-fun b!238712 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!238712 (= e!154966 (not (validMask!0 (mask!10465 thiss!1504))))))

(assert (= (and start!22910 res!116983) b!238707))

(assert (= (and b!238707 res!116976) b!238703))

(assert (= (and b!238703 res!116977) b!238697))

(assert (= (and b!238697 c!39807) b!238701))

(assert (= (and b!238697 (not c!39807)) b!238705))

(assert (= (and b!238705 c!39805) b!238709))

(assert (= (and b!238705 (not c!39805)) b!238704))

(assert (= (and b!238709 res!116982) b!238708))

(assert (= (and b!238708 res!116984) b!238706))

(assert (= (and b!238704 c!39806) b!238694))

(assert (= (and b!238704 (not c!39806)) b!238710))

(assert (= (and b!238694 res!116979) b!238711))

(assert (= (and b!238711 res!116981) b!238696))

(assert (= (or b!238709 b!238694) bm!22173))

(assert (= (or b!238706 b!238696) bm!22172))

(assert (= (and b!238697 res!116978) b!238695))

(assert (= (and b!238695 res!116980) b!238712))

(assert (= (and b!238698 condMapEmpty!10638) mapIsEmpty!10638))

(assert (= (and b!238698 (not condMapEmpty!10638)) mapNonEmpty!10638))

(assert (= (and mapNonEmpty!10638 ((_ is ValueCellFull!2792) mapValue!10638)) b!238702))

(assert (= (and b!238698 ((_ is ValueCellFull!2792) mapDefault!10638)) b!238700))

(assert (= b!238699 b!238698))

(assert (= start!22910 b!238699))

(declare-fun m!259291 () Bool)

(assert (=> b!238703 m!259291))

(declare-fun m!259293 () Bool)

(assert (=> b!238701 m!259293))

(declare-fun m!259295 () Bool)

(assert (=> bm!22173 m!259295))

(declare-fun m!259297 () Bool)

(assert (=> b!238712 m!259297))

(declare-fun m!259299 () Bool)

(assert (=> bm!22172 m!259299))

(declare-fun m!259301 () Bool)

(assert (=> b!238705 m!259301))

(declare-fun m!259303 () Bool)

(assert (=> b!238699 m!259303))

(declare-fun m!259305 () Bool)

(assert (=> b!238699 m!259305))

(assert (=> b!238695 m!259299))

(declare-fun m!259307 () Bool)

(assert (=> mapNonEmpty!10638 m!259307))

(declare-fun m!259309 () Bool)

(assert (=> b!238711 m!259309))

(declare-fun m!259311 () Bool)

(assert (=> b!238708 m!259311))

(declare-fun m!259313 () Bool)

(assert (=> start!22910 m!259313))

(declare-fun m!259315 () Bool)

(assert (=> b!238697 m!259315))

(declare-fun m!259317 () Bool)

(assert (=> b!238697 m!259317))

(assert (=> b!238697 m!259317))

(declare-fun m!259319 () Bool)

(assert (=> b!238697 m!259319))

(check-sat (not b!238705) (not b!238703) b_and!13389 (not b!238695) (not b!238712) (not start!22910) (not b!238701) (not b!238697) tp_is_empty!6271 (not b_next!6409) (not bm!22172) (not b!238699) (not mapNonEmpty!10638) (not bm!22173))
(check-sat b_and!13389 (not b_next!6409))
