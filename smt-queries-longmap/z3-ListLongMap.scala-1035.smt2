; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21896 () Bool)

(assert start!21896)

(declare-fun b!221715 () Bool)

(declare-fun b_free!5959 () Bool)

(declare-fun b_next!5959 () Bool)

(assert (=> b!221715 (= b_free!5959 (not b_next!5959))))

(declare-fun tp!21019 () Bool)

(declare-fun b_and!12871 () Bool)

(assert (=> b!221715 (= tp!21019 b_and!12871)))

(declare-fun b!221703 () Bool)

(declare-fun e!144087 () Bool)

(declare-fun tp_is_empty!5821 () Bool)

(assert (=> b!221703 (= e!144087 tp_is_empty!5821)))

(declare-fun b!221704 () Bool)

(declare-fun e!144081 () Bool)

(declare-datatypes ((SeekEntryResult!802 0))(
  ( (MissingZero!802 (index!5378 (_ BitVec 32))) (Found!802 (index!5379 (_ BitVec 32))) (Intermediate!802 (undefined!1614 Bool) (index!5380 (_ BitVec 32)) (x!22998 (_ BitVec 32))) (Undefined!802) (MissingVacant!802 (index!5381 (_ BitVec 32))) )
))
(declare-fun lt!112516 () SeekEntryResult!802)

(get-info :version)

(assert (=> b!221704 (= e!144081 ((_ is Undefined!802) lt!112516))))

(declare-fun b!221705 () Bool)

(declare-fun e!144073 () Bool)

(assert (=> b!221705 (= e!144073 tp_is_empty!5821)))

(declare-fun b!221706 () Bool)

(declare-fun e!144089 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((List!3194 0))(
  ( (Nil!3191) (Cons!3190 (h!3838 (_ BitVec 64)) (t!8145 List!3194)) )
))
(declare-fun contains!1480 (List!3194 (_ BitVec 64)) Bool)

(assert (=> b!221706 (= e!144089 (not (contains!1480 Nil!3191 key!932)))))

(declare-fun b!221707 () Bool)

(declare-fun c!36864 () Bool)

(assert (=> b!221707 (= c!36864 ((_ is MissingVacant!802) lt!112516))))

(declare-fun e!144084 () Bool)

(assert (=> b!221707 (= e!144084 e!144081)))

(declare-fun bm!20696 () Bool)

(declare-fun call!20700 () Bool)

(declare-datatypes ((V!7409 0))(
  ( (V!7410 (val!2955 Int)) )
))
(declare-datatypes ((ValueCell!2567 0))(
  ( (ValueCellFull!2567 (v!4976 V!7409)) (EmptyCell!2567) )
))
(declare-datatypes ((array!10883 0))(
  ( (array!10884 (arr!5161 (Array (_ BitVec 32) ValueCell!2567)) (size!5494 (_ BitVec 32))) )
))
(declare-datatypes ((array!10885 0))(
  ( (array!10886 (arr!5162 (Array (_ BitVec 32) (_ BitVec 64))) (size!5495 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3034 0))(
  ( (LongMapFixedSize!3035 (defaultEntry!4176 Int) (mask!9990 (_ BitVec 32)) (extraKeys!3913 (_ BitVec 32)) (zeroValue!4017 V!7409) (minValue!4017 V!7409) (_size!1566 (_ BitVec 32)) (_keys!6230 array!10885) (_values!4159 array!10883) (_vacant!1566 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3034)

(declare-fun arrayContainsKey!0 (array!10885 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20696 (= call!20700 (arrayContainsKey!0 (_keys!6230 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!221708 () Bool)

(declare-fun res!108779 () Bool)

(declare-fun e!144083 () Bool)

(assert (=> b!221708 (=> (not res!108779) (not e!144083))))

(declare-fun e!144076 () Bool)

(assert (=> b!221708 (= res!108779 e!144076)))

(declare-fun res!108776 () Bool)

(assert (=> b!221708 (=> res!108776 e!144076)))

(declare-fun e!144086 () Bool)

(assert (=> b!221708 (= res!108776 e!144086)))

(declare-fun res!108777 () Bool)

(assert (=> b!221708 (=> (not res!108777) (not e!144086))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!221708 (= res!108777 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!221709 () Bool)

(declare-fun res!108778 () Bool)

(declare-fun e!144072 () Bool)

(assert (=> b!221709 (=> (not res!108778) (not e!144072))))

(declare-fun call!20699 () Bool)

(assert (=> b!221709 (= res!108778 call!20699)))

(assert (=> b!221709 (= e!144084 e!144072)))

(declare-fun b!221710 () Bool)

(declare-fun res!108781 () Bool)

(assert (=> b!221710 (= res!108781 (= (select (arr!5162 (_keys!6230 thiss!1504)) (index!5381 lt!112516)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!144080 () Bool)

(assert (=> b!221710 (=> (not res!108781) (not e!144080))))

(declare-fun b!221711 () Bool)

(declare-fun e!144074 () Bool)

(declare-fun mapRes!9901 () Bool)

(assert (=> b!221711 (= e!144074 (and e!144073 mapRes!9901))))

(declare-fun condMapEmpty!9901 () Bool)

(declare-fun mapDefault!9901 () ValueCell!2567)

(assert (=> b!221711 (= condMapEmpty!9901 (= (arr!5161 (_values!4159 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2567)) mapDefault!9901)))))

(declare-fun b!221712 () Bool)

(assert (=> b!221712 (= e!144076 e!144089)))

(declare-fun res!108775 () Bool)

(assert (=> b!221712 (=> (not res!108775) (not e!144089))))

(assert (=> b!221712 (= res!108775 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!221713 () Bool)

(declare-fun res!108785 () Bool)

(assert (=> b!221713 (=> (not res!108785) (not e!144083))))

(declare-fun noDuplicate!62 (List!3194) Bool)

(assert (=> b!221713 (= res!108785 (noDuplicate!62 Nil!3191))))

(declare-fun b!221714 () Bool)

(declare-fun res!108789 () Bool)

(assert (=> b!221714 (=> (not res!108789) (not e!144083))))

(assert (=> b!221714 (= res!108789 (not (contains!1480 Nil!3191 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!144085 () Bool)

(declare-fun array_inv!3389 (array!10885) Bool)

(declare-fun array_inv!3390 (array!10883) Bool)

(assert (=> b!221715 (= e!144085 (and tp!21019 tp_is_empty!5821 (array_inv!3389 (_keys!6230 thiss!1504)) (array_inv!3390 (_values!4159 thiss!1504)) e!144074))))

(declare-fun b!221716 () Bool)

(declare-datatypes ((Unit!6590 0))(
  ( (Unit!6591) )
))
(declare-fun e!144078 () Unit!6590)

(declare-fun lt!112520 () Unit!6590)

(assert (=> b!221716 (= e!144078 lt!112520)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!207 (array!10885 array!10883 (_ BitVec 32) (_ BitVec 32) V!7409 V!7409 (_ BitVec 64) Int) Unit!6590)

(assert (=> b!221716 (= lt!112520 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!207 (_keys!6230 thiss!1504) (_values!4159 thiss!1504) (mask!9990 thiss!1504) (extraKeys!3913 thiss!1504) (zeroValue!4017 thiss!1504) (minValue!4017 thiss!1504) key!932 (defaultEntry!4176 thiss!1504)))))

(declare-fun c!36862 () Bool)

(assert (=> b!221716 (= c!36862 ((_ is MissingZero!802) lt!112516))))

(assert (=> b!221716 e!144084))

(declare-fun b!221717 () Bool)

(declare-fun e!144077 () Bool)

(assert (=> b!221717 (= e!144077 e!144083)))

(declare-fun res!108782 () Bool)

(assert (=> b!221717 (=> (not res!108782) (not e!144083))))

(assert (=> b!221717 (= res!108782 (and (bvslt (size!5495 (_keys!6230 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!5495 (_keys!6230 thiss!1504)))))))

(declare-fun lt!112518 () Unit!6590)

(declare-fun e!144079 () Unit!6590)

(assert (=> b!221717 (= lt!112518 e!144079)))

(declare-fun c!36865 () Bool)

(assert (=> b!221717 (= c!36865 (arrayContainsKey!0 (_keys!6230 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!221718 () Bool)

(declare-fun Unit!6592 () Unit!6590)

(assert (=> b!221718 (= e!144079 Unit!6592)))

(declare-fun lt!112522 () Unit!6590)

(declare-fun lemmaArrayContainsKeyThenInListMap!52 (array!10885 array!10883 (_ BitVec 32) (_ BitVec 32) V!7409 V!7409 (_ BitVec 64) (_ BitVec 32) Int) Unit!6590)

(assert (=> b!221718 (= lt!112522 (lemmaArrayContainsKeyThenInListMap!52 (_keys!6230 thiss!1504) (_values!4159 thiss!1504) (mask!9990 thiss!1504) (extraKeys!3913 thiss!1504) (zeroValue!4017 thiss!1504) (minValue!4017 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4176 thiss!1504)))))

(assert (=> b!221718 false))

(declare-fun res!108786 () Bool)

(declare-fun e!144082 () Bool)

(assert (=> start!21896 (=> (not res!108786) (not e!144082))))

(declare-fun valid!1232 (LongMapFixedSize!3034) Bool)

(assert (=> start!21896 (= res!108786 (valid!1232 thiss!1504))))

(assert (=> start!21896 e!144082))

(assert (=> start!21896 e!144085))

(assert (=> start!21896 true))

(declare-fun b!221719 () Bool)

(declare-fun res!108788 () Bool)

(assert (=> b!221719 (=> (not res!108788) (not e!144072))))

(assert (=> b!221719 (= res!108788 (= (select (arr!5162 (_keys!6230 thiss!1504)) (index!5378 lt!112516)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!221720 () Bool)

(assert (=> b!221720 (= e!144083 false)))

(declare-fun lt!112521 () Bool)

(declare-fun arrayNoDuplicates!0 (array!10885 (_ BitVec 32) List!3194) Bool)

(assert (=> b!221720 (= lt!112521 (arrayNoDuplicates!0 (_keys!6230 thiss!1504) #b00000000000000000000000000000000 Nil!3191))))

(declare-fun b!221721 () Bool)

(declare-fun e!144075 () Bool)

(assert (=> b!221721 (= e!144082 e!144075)))

(declare-fun res!108783 () Bool)

(assert (=> b!221721 (=> (not res!108783) (not e!144075))))

(assert (=> b!221721 (= res!108783 (or (= lt!112516 (MissingZero!802 index!297)) (= lt!112516 (MissingVacant!802 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10885 (_ BitVec 32)) SeekEntryResult!802)

(assert (=> b!221721 (= lt!112516 (seekEntryOrOpen!0 key!932 (_keys!6230 thiss!1504) (mask!9990 thiss!1504)))))

(declare-fun b!221722 () Bool)

(declare-fun res!108790 () Bool)

(assert (=> b!221722 (=> (not res!108790) (not e!144082))))

(assert (=> b!221722 (= res!108790 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!221723 () Bool)

(declare-fun res!108784 () Bool)

(assert (=> b!221723 (=> (not res!108784) (not e!144083))))

(assert (=> b!221723 (= res!108784 (not (contains!1480 Nil!3191 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!221724 () Bool)

(assert (=> b!221724 (= e!144081 e!144080)))

(declare-fun res!108780 () Bool)

(assert (=> b!221724 (= res!108780 call!20699)))

(assert (=> b!221724 (=> (not res!108780) (not e!144080))))

(declare-fun mapNonEmpty!9901 () Bool)

(declare-fun tp!21018 () Bool)

(assert (=> mapNonEmpty!9901 (= mapRes!9901 (and tp!21018 e!144087))))

(declare-fun mapKey!9901 () (_ BitVec 32))

(declare-fun mapValue!9901 () ValueCell!2567)

(declare-fun mapRest!9901 () (Array (_ BitVec 32) ValueCell!2567))

(assert (=> mapNonEmpty!9901 (= (arr!5161 (_values!4159 thiss!1504)) (store mapRest!9901 mapKey!9901 mapValue!9901))))

(declare-fun b!221725 () Bool)

(declare-fun Unit!6593 () Unit!6590)

(assert (=> b!221725 (= e!144078 Unit!6593)))

(declare-fun lt!112519 () Unit!6590)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!212 (array!10885 array!10883 (_ BitVec 32) (_ BitVec 32) V!7409 V!7409 (_ BitVec 64) Int) Unit!6590)

(assert (=> b!221725 (= lt!112519 (lemmaInListMapThenSeekEntryOrOpenFindsIt!212 (_keys!6230 thiss!1504) (_values!4159 thiss!1504) (mask!9990 thiss!1504) (extraKeys!3913 thiss!1504) (zeroValue!4017 thiss!1504) (minValue!4017 thiss!1504) key!932 (defaultEntry!4176 thiss!1504)))))

(assert (=> b!221725 false))

(declare-fun b!221726 () Bool)

(assert (=> b!221726 (= e!144080 (not call!20700))))

(declare-fun b!221727 () Bool)

(declare-fun Unit!6594 () Unit!6590)

(assert (=> b!221727 (= e!144079 Unit!6594)))

(declare-fun mapIsEmpty!9901 () Bool)

(assert (=> mapIsEmpty!9901 mapRes!9901))

(declare-fun b!221728 () Bool)

(assert (=> b!221728 (= e!144072 (not call!20700))))

(declare-fun b!221729 () Bool)

(assert (=> b!221729 (= e!144086 (contains!1480 Nil!3191 key!932))))

(declare-fun bm!20697 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20697 (= call!20699 (inRange!0 (ite c!36862 (index!5378 lt!112516) (index!5381 lt!112516)) (mask!9990 thiss!1504)))))

(declare-fun b!221730 () Bool)

(assert (=> b!221730 (= e!144075 e!144077)))

(declare-fun res!108787 () Bool)

(assert (=> b!221730 (=> (not res!108787) (not e!144077))))

(assert (=> b!221730 (= res!108787 (inRange!0 index!297 (mask!9990 thiss!1504)))))

(declare-fun lt!112517 () Unit!6590)

(assert (=> b!221730 (= lt!112517 e!144078)))

(declare-fun c!36863 () Bool)

(declare-datatypes ((tuple2!4300 0))(
  ( (tuple2!4301 (_1!2161 (_ BitVec 64)) (_2!2161 V!7409)) )
))
(declare-datatypes ((List!3195 0))(
  ( (Nil!3192) (Cons!3191 (h!3839 tuple2!4300) (t!8146 List!3195)) )
))
(declare-datatypes ((ListLongMap!3215 0))(
  ( (ListLongMap!3216 (toList!1623 List!3195)) )
))
(declare-fun contains!1481 (ListLongMap!3215 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1155 (array!10885 array!10883 (_ BitVec 32) (_ BitVec 32) V!7409 V!7409 (_ BitVec 32) Int) ListLongMap!3215)

(assert (=> b!221730 (= c!36863 (contains!1481 (getCurrentListMap!1155 (_keys!6230 thiss!1504) (_values!4159 thiss!1504) (mask!9990 thiss!1504) (extraKeys!3913 thiss!1504) (zeroValue!4017 thiss!1504) (minValue!4017 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4176 thiss!1504)) key!932))))

(assert (= (and start!21896 res!108786) b!221722))

(assert (= (and b!221722 res!108790) b!221721))

(assert (= (and b!221721 res!108783) b!221730))

(assert (= (and b!221730 c!36863) b!221725))

(assert (= (and b!221730 (not c!36863)) b!221716))

(assert (= (and b!221716 c!36862) b!221709))

(assert (= (and b!221716 (not c!36862)) b!221707))

(assert (= (and b!221709 res!108778) b!221719))

(assert (= (and b!221719 res!108788) b!221728))

(assert (= (and b!221707 c!36864) b!221724))

(assert (= (and b!221707 (not c!36864)) b!221704))

(assert (= (and b!221724 res!108780) b!221710))

(assert (= (and b!221710 res!108781) b!221726))

(assert (= (or b!221709 b!221724) bm!20697))

(assert (= (or b!221728 b!221726) bm!20696))

(assert (= (and b!221730 res!108787) b!221717))

(assert (= (and b!221717 c!36865) b!221718))

(assert (= (and b!221717 (not c!36865)) b!221727))

(assert (= (and b!221717 res!108782) b!221713))

(assert (= (and b!221713 res!108785) b!221723))

(assert (= (and b!221723 res!108784) b!221714))

(assert (= (and b!221714 res!108789) b!221708))

(assert (= (and b!221708 res!108777) b!221729))

(assert (= (and b!221708 (not res!108776)) b!221712))

(assert (= (and b!221712 res!108775) b!221706))

(assert (= (and b!221708 res!108779) b!221720))

(assert (= (and b!221711 condMapEmpty!9901) mapIsEmpty!9901))

(assert (= (and b!221711 (not condMapEmpty!9901)) mapNonEmpty!9901))

(assert (= (and mapNonEmpty!9901 ((_ is ValueCellFull!2567) mapValue!9901)) b!221703))

(assert (= (and b!221711 ((_ is ValueCellFull!2567) mapDefault!9901)) b!221705))

(assert (= b!221715 b!221711))

(assert (= start!21896 b!221715))

(declare-fun m!246367 () Bool)

(assert (=> bm!20696 m!246367))

(declare-fun m!246369 () Bool)

(assert (=> b!221714 m!246369))

(declare-fun m!246371 () Bool)

(assert (=> b!221725 m!246371))

(declare-fun m!246373 () Bool)

(assert (=> start!21896 m!246373))

(declare-fun m!246375 () Bool)

(assert (=> bm!20697 m!246375))

(declare-fun m!246377 () Bool)

(assert (=> b!221730 m!246377))

(declare-fun m!246379 () Bool)

(assert (=> b!221730 m!246379))

(assert (=> b!221730 m!246379))

(declare-fun m!246381 () Bool)

(assert (=> b!221730 m!246381))

(declare-fun m!246383 () Bool)

(assert (=> b!221715 m!246383))

(declare-fun m!246385 () Bool)

(assert (=> b!221715 m!246385))

(declare-fun m!246387 () Bool)

(assert (=> b!221706 m!246387))

(declare-fun m!246389 () Bool)

(assert (=> b!221716 m!246389))

(declare-fun m!246391 () Bool)

(assert (=> b!221718 m!246391))

(declare-fun m!246393 () Bool)

(assert (=> b!221723 m!246393))

(declare-fun m!246395 () Bool)

(assert (=> b!221720 m!246395))

(declare-fun m!246397 () Bool)

(assert (=> b!221710 m!246397))

(declare-fun m!246399 () Bool)

(assert (=> b!221713 m!246399))

(assert (=> b!221729 m!246387))

(assert (=> b!221717 m!246367))

(declare-fun m!246401 () Bool)

(assert (=> b!221721 m!246401))

(declare-fun m!246403 () Bool)

(assert (=> mapNonEmpty!9901 m!246403))

(declare-fun m!246405 () Bool)

(assert (=> b!221719 m!246405))

(check-sat b_and!12871 (not b!221723) (not b!221713) (not b_next!5959) (not bm!20697) (not b!221717) (not b!221725) (not b!221720) (not b!221718) (not b!221721) (not start!21896) (not b!221730) (not b!221716) (not b!221715) (not mapNonEmpty!9901) tp_is_empty!5821 (not b!221706) (not b!221714) (not bm!20696) (not b!221729))
(check-sat b_and!12871 (not b_next!5959))
