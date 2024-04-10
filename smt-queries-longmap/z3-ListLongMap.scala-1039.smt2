; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21918 () Bool)

(assert start!21918)

(declare-fun b!222750 () Bool)

(declare-fun b_free!5985 () Bool)

(declare-fun b_next!5985 () Bool)

(assert (=> b!222750 (= b_free!5985 (not b_next!5985))))

(declare-fun tp!21097 () Bool)

(declare-fun b_and!12883 () Bool)

(assert (=> b!222750 (= tp!21097 b_and!12883)))

(declare-fun b!222748 () Bool)

(declare-fun e!144765 () Bool)

(declare-fun e!144754 () Bool)

(assert (=> b!222748 (= e!144765 e!144754)))

(declare-fun res!109386 () Bool)

(declare-fun call!20790 () Bool)

(assert (=> b!222748 (= res!109386 call!20790)))

(assert (=> b!222748 (=> (not res!109386) (not e!144754))))

(declare-fun b!222749 () Bool)

(declare-datatypes ((Unit!6682 0))(
  ( (Unit!6683) )
))
(declare-fun e!144753 () Unit!6682)

(declare-fun Unit!6684 () Unit!6682)

(assert (=> b!222749 (= e!144753 Unit!6684)))

(declare-fun lt!112734 () Unit!6682)

(declare-datatypes ((V!7443 0))(
  ( (V!7444 (val!2968 Int)) )
))
(declare-datatypes ((ValueCell!2580 0))(
  ( (ValueCellFull!2580 (v!4988 V!7443)) (EmptyCell!2580) )
))
(declare-datatypes ((array!10937 0))(
  ( (array!10938 (arr!5188 (Array (_ BitVec 32) ValueCell!2580)) (size!5521 (_ BitVec 32))) )
))
(declare-datatypes ((array!10939 0))(
  ( (array!10940 (arr!5189 (Array (_ BitVec 32) (_ BitVec 64))) (size!5522 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3060 0))(
  ( (LongMapFixedSize!3061 (defaultEntry!4189 Int) (mask!10011 (_ BitVec 32)) (extraKeys!3926 (_ BitVec 32)) (zeroValue!4030 V!7443) (minValue!4030 V!7443) (_size!1579 (_ BitVec 32)) (_keys!6243 array!10939) (_values!4172 array!10937) (_vacant!1579 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3060)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!64 (array!10939 array!10937 (_ BitVec 32) (_ BitVec 32) V!7443 V!7443 (_ BitVec 64) (_ BitVec 32) Int) Unit!6682)

(assert (=> b!222749 (= lt!112734 (lemmaArrayContainsKeyThenInListMap!64 (_keys!6243 thiss!1504) (_values!4172 thiss!1504) (mask!10011 thiss!1504) (extraKeys!3926 thiss!1504) (zeroValue!4030 thiss!1504) (minValue!4030 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4189 thiss!1504)))))

(assert (=> b!222749 false))

(declare-fun e!144757 () Bool)

(declare-fun tp_is_empty!5847 () Bool)

(declare-fun e!144762 () Bool)

(declare-fun array_inv!3435 (array!10939) Bool)

(declare-fun array_inv!3436 (array!10937) Bool)

(assert (=> b!222750 (= e!144762 (and tp!21097 tp_is_empty!5847 (array_inv!3435 (_keys!6243 thiss!1504)) (array_inv!3436 (_values!4172 thiss!1504)) e!144757))))

(declare-fun b!222751 () Bool)

(declare-fun e!144752 () Bool)

(assert (=> b!222751 (= e!144752 tp_is_empty!5847)))

(declare-fun b!222752 () Bool)

(declare-datatypes ((SeekEntryResult!841 0))(
  ( (MissingZero!841 (index!5534 (_ BitVec 32))) (Found!841 (index!5535 (_ BitVec 32))) (Intermediate!841 (undefined!1653 Bool) (index!5536 (_ BitVec 32)) (x!23069 (_ BitVec 32))) (Undefined!841) (MissingVacant!841 (index!5537 (_ BitVec 32))) )
))
(declare-fun lt!112732 () SeekEntryResult!841)

(get-info :version)

(assert (=> b!222752 (= e!144765 ((_ is Undefined!841) lt!112732))))

(declare-fun b!222753 () Bool)

(declare-fun res!109381 () Bool)

(declare-fun e!144767 () Bool)

(assert (=> b!222753 (=> (not res!109381) (not e!144767))))

(declare-datatypes ((List!3309 0))(
  ( (Nil!3306) (Cons!3305 (h!3953 (_ BitVec 64)) (t!8268 List!3309)) )
))
(declare-fun noDuplicate!72 (List!3309) Bool)

(assert (=> b!222753 (= res!109381 (noDuplicate!72 Nil!3306))))

(declare-fun b!222754 () Bool)

(declare-fun e!144758 () Bool)

(declare-fun contains!1529 (List!3309 (_ BitVec 64)) Bool)

(assert (=> b!222754 (= e!144758 (contains!1529 Nil!3306 key!932))))

(declare-fun b!222755 () Bool)

(declare-fun call!20789 () Bool)

(assert (=> b!222755 (= e!144754 (not call!20789))))

(declare-fun b!222756 () Bool)

(declare-fun e!144750 () Bool)

(declare-fun e!144751 () Bool)

(assert (=> b!222756 (= e!144750 e!144751)))

(declare-fun res!109390 () Bool)

(assert (=> b!222756 (=> (not res!109390) (not e!144751))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!222756 (= res!109390 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!222757 () Bool)

(declare-fun mapRes!9940 () Bool)

(assert (=> b!222757 (= e!144757 (and e!144752 mapRes!9940))))

(declare-fun condMapEmpty!9940 () Bool)

(declare-fun mapDefault!9940 () ValueCell!2580)

(assert (=> b!222757 (= condMapEmpty!9940 (= (arr!5188 (_values!4172 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2580)) mapDefault!9940)))))

(declare-fun b!222758 () Bool)

(declare-fun e!144761 () Unit!6682)

(declare-fun lt!112731 () Unit!6682)

(assert (=> b!222758 (= e!144761 lt!112731)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!238 (array!10939 array!10937 (_ BitVec 32) (_ BitVec 32) V!7443 V!7443 (_ BitVec 64) Int) Unit!6682)

(assert (=> b!222758 (= lt!112731 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!238 (_keys!6243 thiss!1504) (_values!4172 thiss!1504) (mask!10011 thiss!1504) (extraKeys!3926 thiss!1504) (zeroValue!4030 thiss!1504) (minValue!4030 thiss!1504) key!932 (defaultEntry!4189 thiss!1504)))))

(declare-fun c!37006 () Bool)

(assert (=> b!222758 (= c!37006 ((_ is MissingZero!841) lt!112732))))

(declare-fun e!144764 () Bool)

(assert (=> b!222758 e!144764))

(declare-fun b!222759 () Bool)

(declare-fun res!109384 () Bool)

(assert (=> b!222759 (= res!109384 (= (select (arr!5189 (_keys!6243 thiss!1504)) (index!5537 lt!112732)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!222759 (=> (not res!109384) (not e!144754))))

(declare-fun b!222760 () Bool)

(declare-fun res!109380 () Bool)

(assert (=> b!222760 (=> (not res!109380) (not e!144767))))

(assert (=> b!222760 (= res!109380 e!144750)))

(declare-fun res!109389 () Bool)

(assert (=> b!222760 (=> res!109389 e!144750)))

(assert (=> b!222760 (= res!109389 e!144758)))

(declare-fun res!109391 () Bool)

(assert (=> b!222760 (=> (not res!109391) (not e!144758))))

(assert (=> b!222760 (= res!109391 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!222761 () Bool)

(declare-fun Unit!6685 () Unit!6682)

(assert (=> b!222761 (= e!144753 Unit!6685)))

(declare-fun b!222762 () Bool)

(declare-fun res!109393 () Bool)

(assert (=> b!222762 (=> (not res!109393) (not e!144767))))

(assert (=> b!222762 (= res!109393 (not (contains!1529 Nil!3306 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!20786 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20786 (= call!20790 (inRange!0 (ite c!37006 (index!5534 lt!112732) (index!5537 lt!112732)) (mask!10011 thiss!1504)))))

(declare-fun b!222763 () Bool)

(declare-fun res!109382 () Bool)

(assert (=> b!222763 (=> (not res!109382) (not e!144767))))

(assert (=> b!222763 (= res!109382 (not (contains!1529 Nil!3306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!222764 () Bool)

(assert (=> b!222764 (= e!144751 (not (contains!1529 Nil!3306 key!932)))))

(declare-fun b!222765 () Bool)

(declare-fun e!144756 () Bool)

(assert (=> b!222765 (= e!144756 tp_is_empty!5847)))

(declare-fun b!222766 () Bool)

(declare-fun res!109392 () Bool)

(declare-fun e!144755 () Bool)

(assert (=> b!222766 (=> (not res!109392) (not e!144755))))

(assert (=> b!222766 (= res!109392 (= (select (arr!5189 (_keys!6243 thiss!1504)) (index!5534 lt!112732)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!222767 () Bool)

(declare-fun e!144766 () Bool)

(assert (=> b!222767 (= e!144766 e!144767)))

(declare-fun res!109385 () Bool)

(assert (=> b!222767 (=> (not res!109385) (not e!144767))))

(assert (=> b!222767 (= res!109385 (and (bvslt (size!5522 (_keys!6243 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!5522 (_keys!6243 thiss!1504)))))))

(declare-fun lt!112733 () Unit!6682)

(assert (=> b!222767 (= lt!112733 e!144753)))

(declare-fun c!37007 () Bool)

(declare-fun arrayContainsKey!0 (array!10939 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!222767 (= c!37007 (arrayContainsKey!0 (_keys!6243 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!222768 () Bool)

(assert (=> b!222768 (= e!144767 false)))

(declare-fun lt!112736 () Bool)

(declare-fun arrayNoDuplicates!0 (array!10939 (_ BitVec 32) List!3309) Bool)

(assert (=> b!222768 (= lt!112736 (arrayNoDuplicates!0 (_keys!6243 thiss!1504) #b00000000000000000000000000000000 Nil!3306))))

(declare-fun b!222769 () Bool)

(declare-fun e!144759 () Bool)

(assert (=> b!222769 (= e!144759 e!144766)))

(declare-fun res!109388 () Bool)

(assert (=> b!222769 (=> (not res!109388) (not e!144766))))

(assert (=> b!222769 (= res!109388 (inRange!0 index!297 (mask!10011 thiss!1504)))))

(declare-fun lt!112730 () Unit!6682)

(assert (=> b!222769 (= lt!112730 e!144761)))

(declare-fun c!37008 () Bool)

(declare-datatypes ((tuple2!4404 0))(
  ( (tuple2!4405 (_1!2213 (_ BitVec 64)) (_2!2213 V!7443)) )
))
(declare-datatypes ((List!3310 0))(
  ( (Nil!3307) (Cons!3306 (h!3954 tuple2!4404) (t!8269 List!3310)) )
))
(declare-datatypes ((ListLongMap!3317 0))(
  ( (ListLongMap!3318 (toList!1674 List!3310)) )
))
(declare-fun contains!1530 (ListLongMap!3317 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1202 (array!10939 array!10937 (_ BitVec 32) (_ BitVec 32) V!7443 V!7443 (_ BitVec 32) Int) ListLongMap!3317)

(assert (=> b!222769 (= c!37008 (contains!1530 (getCurrentListMap!1202 (_keys!6243 thiss!1504) (_values!4172 thiss!1504) (mask!10011 thiss!1504) (extraKeys!3926 thiss!1504) (zeroValue!4030 thiss!1504) (minValue!4030 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4189 thiss!1504)) key!932))))

(declare-fun b!222770 () Bool)

(declare-fun c!37005 () Bool)

(assert (=> b!222770 (= c!37005 ((_ is MissingVacant!841) lt!112732))))

(assert (=> b!222770 (= e!144764 e!144765)))

(declare-fun bm!20787 () Bool)

(assert (=> bm!20787 (= call!20789 (arrayContainsKey!0 (_keys!6243 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!222771 () Bool)

(declare-fun res!109379 () Bool)

(assert (=> b!222771 (=> (not res!109379) (not e!144755))))

(assert (=> b!222771 (= res!109379 call!20790)))

(assert (=> b!222771 (= e!144764 e!144755)))

(declare-fun b!222772 () Bool)

(declare-fun Unit!6686 () Unit!6682)

(assert (=> b!222772 (= e!144761 Unit!6686)))

(declare-fun lt!112735 () Unit!6682)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!227 (array!10939 array!10937 (_ BitVec 32) (_ BitVec 32) V!7443 V!7443 (_ BitVec 64) Int) Unit!6682)

(assert (=> b!222772 (= lt!112735 (lemmaInListMapThenSeekEntryOrOpenFindsIt!227 (_keys!6243 thiss!1504) (_values!4172 thiss!1504) (mask!10011 thiss!1504) (extraKeys!3926 thiss!1504) (zeroValue!4030 thiss!1504) (minValue!4030 thiss!1504) key!932 (defaultEntry!4189 thiss!1504)))))

(assert (=> b!222772 false))

(declare-fun b!222773 () Bool)

(assert (=> b!222773 (= e!144755 (not call!20789))))

(declare-fun mapIsEmpty!9940 () Bool)

(assert (=> mapIsEmpty!9940 mapRes!9940))

(declare-fun b!222774 () Bool)

(declare-fun res!109383 () Bool)

(declare-fun e!144763 () Bool)

(assert (=> b!222774 (=> (not res!109383) (not e!144763))))

(assert (=> b!222774 (= res!109383 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!222775 () Bool)

(assert (=> b!222775 (= e!144763 e!144759)))

(declare-fun res!109378 () Bool)

(assert (=> b!222775 (=> (not res!109378) (not e!144759))))

(assert (=> b!222775 (= res!109378 (or (= lt!112732 (MissingZero!841 index!297)) (= lt!112732 (MissingVacant!841 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10939 (_ BitVec 32)) SeekEntryResult!841)

(assert (=> b!222775 (= lt!112732 (seekEntryOrOpen!0 key!932 (_keys!6243 thiss!1504) (mask!10011 thiss!1504)))))

(declare-fun mapNonEmpty!9940 () Bool)

(declare-fun tp!21096 () Bool)

(assert (=> mapNonEmpty!9940 (= mapRes!9940 (and tp!21096 e!144756))))

(declare-fun mapKey!9940 () (_ BitVec 32))

(declare-fun mapRest!9940 () (Array (_ BitVec 32) ValueCell!2580))

(declare-fun mapValue!9940 () ValueCell!2580)

(assert (=> mapNonEmpty!9940 (= (arr!5188 (_values!4172 thiss!1504)) (store mapRest!9940 mapKey!9940 mapValue!9940))))

(declare-fun res!109387 () Bool)

(assert (=> start!21918 (=> (not res!109387) (not e!144763))))

(declare-fun valid!1233 (LongMapFixedSize!3060) Bool)

(assert (=> start!21918 (= res!109387 (valid!1233 thiss!1504))))

(assert (=> start!21918 e!144763))

(assert (=> start!21918 e!144762))

(assert (=> start!21918 true))

(assert (= (and start!21918 res!109387) b!222774))

(assert (= (and b!222774 res!109383) b!222775))

(assert (= (and b!222775 res!109378) b!222769))

(assert (= (and b!222769 c!37008) b!222772))

(assert (= (and b!222769 (not c!37008)) b!222758))

(assert (= (and b!222758 c!37006) b!222771))

(assert (= (and b!222758 (not c!37006)) b!222770))

(assert (= (and b!222771 res!109379) b!222766))

(assert (= (and b!222766 res!109392) b!222773))

(assert (= (and b!222770 c!37005) b!222748))

(assert (= (and b!222770 (not c!37005)) b!222752))

(assert (= (and b!222748 res!109386) b!222759))

(assert (= (and b!222759 res!109384) b!222755))

(assert (= (or b!222771 b!222748) bm!20786))

(assert (= (or b!222773 b!222755) bm!20787))

(assert (= (and b!222769 res!109388) b!222767))

(assert (= (and b!222767 c!37007) b!222749))

(assert (= (and b!222767 (not c!37007)) b!222761))

(assert (= (and b!222767 res!109385) b!222753))

(assert (= (and b!222753 res!109381) b!222763))

(assert (= (and b!222763 res!109382) b!222762))

(assert (= (and b!222762 res!109393) b!222760))

(assert (= (and b!222760 res!109391) b!222754))

(assert (= (and b!222760 (not res!109389)) b!222756))

(assert (= (and b!222756 res!109390) b!222764))

(assert (= (and b!222760 res!109380) b!222768))

(assert (= (and b!222757 condMapEmpty!9940) mapIsEmpty!9940))

(assert (= (and b!222757 (not condMapEmpty!9940)) mapNonEmpty!9940))

(assert (= (and mapNonEmpty!9940 ((_ is ValueCellFull!2580) mapValue!9940)) b!222765))

(assert (= (and b!222757 ((_ is ValueCellFull!2580) mapDefault!9940)) b!222751))

(assert (= b!222750 b!222757))

(assert (= start!21918 b!222750))

(declare-fun m!246705 () Bool)

(assert (=> mapNonEmpty!9940 m!246705))

(declare-fun m!246707 () Bool)

(assert (=> b!222758 m!246707))

(declare-fun m!246709 () Bool)

(assert (=> b!222767 m!246709))

(declare-fun m!246711 () Bool)

(assert (=> b!222754 m!246711))

(declare-fun m!246713 () Bool)

(assert (=> b!222763 m!246713))

(declare-fun m!246715 () Bool)

(assert (=> b!222769 m!246715))

(declare-fun m!246717 () Bool)

(assert (=> b!222769 m!246717))

(assert (=> b!222769 m!246717))

(declare-fun m!246719 () Bool)

(assert (=> b!222769 m!246719))

(declare-fun m!246721 () Bool)

(assert (=> b!222766 m!246721))

(declare-fun m!246723 () Bool)

(assert (=> b!222772 m!246723))

(declare-fun m!246725 () Bool)

(assert (=> bm!20786 m!246725))

(declare-fun m!246727 () Bool)

(assert (=> b!222750 m!246727))

(declare-fun m!246729 () Bool)

(assert (=> b!222750 m!246729))

(declare-fun m!246731 () Bool)

(assert (=> start!21918 m!246731))

(assert (=> b!222764 m!246711))

(declare-fun m!246733 () Bool)

(assert (=> b!222768 m!246733))

(assert (=> bm!20787 m!246709))

(declare-fun m!246735 () Bool)

(assert (=> b!222749 m!246735))

(declare-fun m!246737 () Bool)

(assert (=> b!222762 m!246737))

(declare-fun m!246739 () Bool)

(assert (=> b!222775 m!246739))

(declare-fun m!246741 () Bool)

(assert (=> b!222753 m!246741))

(declare-fun m!246743 () Bool)

(assert (=> b!222759 m!246743))

(check-sat (not b!222767) (not start!21918) (not b!222763) (not b!222750) (not b!222764) (not b!222758) tp_is_empty!5847 (not b_next!5985) (not b!222772) (not bm!20787) (not b!222768) (not b!222775) (not b!222754) (not mapNonEmpty!9940) (not b!222769) (not b!222762) b_and!12883 (not b!222749) (not b!222753) (not bm!20786))
(check-sat b_and!12883 (not b_next!5985))
