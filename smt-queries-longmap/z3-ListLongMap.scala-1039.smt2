; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21920 () Bool)

(assert start!21920)

(declare-fun b!222712 () Bool)

(declare-fun b_free!5983 () Bool)

(declare-fun b_next!5983 () Bool)

(assert (=> b!222712 (= b_free!5983 (not b_next!5983))))

(declare-fun tp!21090 () Bool)

(declare-fun b_and!12895 () Bool)

(assert (=> b!222712 (= tp!21090 b_and!12895)))

(declare-fun b!222711 () Bool)

(declare-datatypes ((Unit!6636 0))(
  ( (Unit!6637) )
))
(declare-fun e!144726 () Unit!6636)

(declare-fun lt!112770 () Unit!6636)

(assert (=> b!222711 (= e!144726 lt!112770)))

(declare-datatypes ((V!7441 0))(
  ( (V!7442 (val!2967 Int)) )
))
(declare-datatypes ((ValueCell!2579 0))(
  ( (ValueCellFull!2579 (v!4988 V!7441)) (EmptyCell!2579) )
))
(declare-datatypes ((array!10931 0))(
  ( (array!10932 (arr!5185 (Array (_ BitVec 32) ValueCell!2579)) (size!5518 (_ BitVec 32))) )
))
(declare-datatypes ((array!10933 0))(
  ( (array!10934 (arr!5186 (Array (_ BitVec 32) (_ BitVec 64))) (size!5519 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3058 0))(
  ( (LongMapFixedSize!3059 (defaultEntry!4188 Int) (mask!10010 (_ BitVec 32)) (extraKeys!3925 (_ BitVec 32)) (zeroValue!4029 V!7441) (minValue!4029 V!7441) (_size!1578 (_ BitVec 32)) (_keys!6242 array!10933) (_values!4171 array!10931) (_vacant!1578 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3058)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!214 (array!10933 array!10931 (_ BitVec 32) (_ BitVec 32) V!7441 V!7441 (_ BitVec 64) Int) Unit!6636)

(assert (=> b!222711 (= lt!112770 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!214 (_keys!6242 thiss!1504) (_values!4171 thiss!1504) (mask!10010 thiss!1504) (extraKeys!3925 thiss!1504) (zeroValue!4029 thiss!1504) (minValue!4029 thiss!1504) key!932 (defaultEntry!4188 thiss!1504)))))

(declare-fun c!37006 () Bool)

(declare-datatypes ((SeekEntryResult!811 0))(
  ( (MissingZero!811 (index!5414 (_ BitVec 32))) (Found!811 (index!5415 (_ BitVec 32))) (Intermediate!811 (undefined!1623 Bool) (index!5416 (_ BitVec 32)) (x!23039 (_ BitVec 32))) (Undefined!811) (MissingVacant!811 (index!5417 (_ BitVec 32))) )
))
(declare-fun lt!112769 () SeekEntryResult!811)

(get-info :version)

(assert (=> b!222711 (= c!37006 ((_ is MissingZero!811) lt!112769))))

(declare-fun e!144737 () Bool)

(assert (=> b!222711 e!144737))

(declare-fun e!144727 () Bool)

(declare-fun e!144735 () Bool)

(declare-fun tp_is_empty!5845 () Bool)

(declare-fun array_inv!3401 (array!10933) Bool)

(declare-fun array_inv!3402 (array!10931) Bool)

(assert (=> b!222712 (= e!144735 (and tp!21090 tp_is_empty!5845 (array_inv!3401 (_keys!6242 thiss!1504)) (array_inv!3402 (_values!4171 thiss!1504)) e!144727))))

(declare-fun mapNonEmpty!9937 () Bool)

(declare-fun mapRes!9937 () Bool)

(declare-fun tp!21091 () Bool)

(declare-fun e!144728 () Bool)

(assert (=> mapNonEmpty!9937 (= mapRes!9937 (and tp!21091 e!144728))))

(declare-fun mapValue!9937 () ValueCell!2579)

(declare-fun mapRest!9937 () (Array (_ BitVec 32) ValueCell!2579))

(declare-fun mapKey!9937 () (_ BitVec 32))

(assert (=> mapNonEmpty!9937 (= (arr!5185 (_values!4171 thiss!1504)) (store mapRest!9937 mapKey!9937 mapValue!9937))))

(declare-fun b!222713 () Bool)

(declare-fun res!109364 () Bool)

(declare-fun e!144732 () Bool)

(assert (=> b!222713 (=> (not res!109364) (not e!144732))))

(declare-fun call!20772 () Bool)

(assert (=> b!222713 (= res!109364 call!20772)))

(assert (=> b!222713 (= e!144737 e!144732)))

(declare-fun b!222714 () Bool)

(declare-fun e!144721 () Bool)

(declare-fun e!144736 () Bool)

(assert (=> b!222714 (= e!144721 e!144736)))

(declare-fun res!109365 () Bool)

(assert (=> b!222714 (=> (not res!109365) (not e!144736))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!222714 (= res!109365 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!222715 () Bool)

(declare-fun res!109359 () Bool)

(declare-fun e!144734 () Bool)

(assert (=> b!222715 (=> (not res!109359) (not e!144734))))

(assert (=> b!222715 (= res!109359 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!222716 () Bool)

(declare-fun e!144720 () Bool)

(assert (=> b!222716 (= e!144734 e!144720)))

(declare-fun res!109362 () Bool)

(assert (=> b!222716 (=> (not res!109362) (not e!144720))))

(assert (=> b!222716 (= res!109362 (or (= lt!112769 (MissingZero!811 index!297)) (= lt!112769 (MissingVacant!811 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10933 (_ BitVec 32)) SeekEntryResult!811)

(assert (=> b!222716 (= lt!112769 (seekEntryOrOpen!0 key!932 (_keys!6242 thiss!1504) (mask!10010 thiss!1504)))))

(declare-fun mapIsEmpty!9937 () Bool)

(assert (=> mapIsEmpty!9937 mapRes!9937))

(declare-fun b!222717 () Bool)

(declare-fun e!144722 () Bool)

(declare-datatypes ((List!3212 0))(
  ( (Nil!3209) (Cons!3208 (h!3856 (_ BitVec 64)) (t!8163 List!3212)) )
))
(declare-fun contains!1498 (List!3212 (_ BitVec 64)) Bool)

(assert (=> b!222717 (= e!144722 (contains!1498 Nil!3209 key!932))))

(declare-fun b!222718 () Bool)

(declare-fun res!109355 () Bool)

(assert (=> b!222718 (= res!109355 (= (select (arr!5186 (_keys!6242 thiss!1504)) (index!5417 lt!112769)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!144731 () Bool)

(assert (=> b!222718 (=> (not res!109355) (not e!144731))))

(declare-fun b!222719 () Bool)

(assert (=> b!222719 (= e!144736 (not (contains!1498 Nil!3209 key!932)))))

(declare-fun b!222720 () Bool)

(declare-fun call!20771 () Bool)

(assert (=> b!222720 (= e!144731 (not call!20771))))

(declare-fun b!222721 () Bool)

(declare-fun res!109363 () Bool)

(declare-fun e!144730 () Bool)

(assert (=> b!222721 (=> (not res!109363) (not e!144730))))

(assert (=> b!222721 (= res!109363 e!144721)))

(declare-fun res!109357 () Bool)

(assert (=> b!222721 (=> res!109357 e!144721)))

(assert (=> b!222721 (= res!109357 e!144722)))

(declare-fun res!109366 () Bool)

(assert (=> b!222721 (=> (not res!109366) (not e!144722))))

(assert (=> b!222721 (= res!109366 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun bm!20768 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20768 (= call!20772 (inRange!0 (ite c!37006 (index!5414 lt!112769) (index!5417 lt!112769)) (mask!10010 thiss!1504)))))

(declare-fun res!109360 () Bool)

(assert (=> start!21920 (=> (not res!109360) (not e!144734))))

(declare-fun valid!1239 (LongMapFixedSize!3058) Bool)

(assert (=> start!21920 (= res!109360 (valid!1239 thiss!1504))))

(assert (=> start!21920 e!144734))

(assert (=> start!21920 e!144735))

(assert (=> start!21920 true))

(declare-fun b!222722 () Bool)

(declare-fun res!109356 () Bool)

(assert (=> b!222722 (=> (not res!109356) (not e!144732))))

(assert (=> b!222722 (= res!109356 (= (select (arr!5186 (_keys!6242 thiss!1504)) (index!5414 lt!112769)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!222723 () Bool)

(declare-fun e!144725 () Bool)

(assert (=> b!222723 (= e!144727 (and e!144725 mapRes!9937))))

(declare-fun condMapEmpty!9937 () Bool)

(declare-fun mapDefault!9937 () ValueCell!2579)

(assert (=> b!222723 (= condMapEmpty!9937 (= (arr!5185 (_values!4171 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2579)) mapDefault!9937)))))

(declare-fun b!222724 () Bool)

(assert (=> b!222724 (= e!144725 tp_is_empty!5845)))

(declare-fun b!222725 () Bool)

(declare-fun res!109361 () Bool)

(assert (=> b!222725 (=> (not res!109361) (not e!144730))))

(assert (=> b!222725 (= res!109361 (not (contains!1498 Nil!3209 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!222726 () Bool)

(declare-fun e!144724 () Unit!6636)

(declare-fun Unit!6638 () Unit!6636)

(assert (=> b!222726 (= e!144724 Unit!6638)))

(declare-fun b!222727 () Bool)

(declare-fun Unit!6639 () Unit!6636)

(assert (=> b!222727 (= e!144724 Unit!6639)))

(declare-fun lt!112768 () Unit!6636)

(declare-fun lemmaArrayContainsKeyThenInListMap!60 (array!10933 array!10931 (_ BitVec 32) (_ BitVec 32) V!7441 V!7441 (_ BitVec 64) (_ BitVec 32) Int) Unit!6636)

(assert (=> b!222727 (= lt!112768 (lemmaArrayContainsKeyThenInListMap!60 (_keys!6242 thiss!1504) (_values!4171 thiss!1504) (mask!10010 thiss!1504) (extraKeys!3925 thiss!1504) (zeroValue!4029 thiss!1504) (minValue!4029 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4188 thiss!1504)))))

(assert (=> b!222727 false))

(declare-fun b!222728 () Bool)

(declare-fun e!144723 () Bool)

(assert (=> b!222728 (= e!144723 e!144730)))

(declare-fun res!109352 () Bool)

(assert (=> b!222728 (=> (not res!109352) (not e!144730))))

(assert (=> b!222728 (= res!109352 (and (bvslt (size!5519 (_keys!6242 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!5519 (_keys!6242 thiss!1504)))))))

(declare-fun lt!112773 () Unit!6636)

(assert (=> b!222728 (= lt!112773 e!144724)))

(declare-fun c!37009 () Bool)

(declare-fun arrayContainsKey!0 (array!10933 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!222728 (= c!37009 (arrayContainsKey!0 (_keys!6242 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!222729 () Bool)

(declare-fun res!109353 () Bool)

(assert (=> b!222729 (=> (not res!109353) (not e!144730))))

(assert (=> b!222729 (= res!109353 (not (contains!1498 Nil!3209 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!222730 () Bool)

(declare-fun res!109351 () Bool)

(assert (=> b!222730 (=> (not res!109351) (not e!144730))))

(declare-fun noDuplicate!71 (List!3212) Bool)

(assert (=> b!222730 (= res!109351 (noDuplicate!71 Nil!3209))))

(declare-fun b!222731 () Bool)

(declare-fun Unit!6640 () Unit!6636)

(assert (=> b!222731 (= e!144726 Unit!6640)))

(declare-fun lt!112771 () Unit!6636)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!221 (array!10933 array!10931 (_ BitVec 32) (_ BitVec 32) V!7441 V!7441 (_ BitVec 64) Int) Unit!6636)

(assert (=> b!222731 (= lt!112771 (lemmaInListMapThenSeekEntryOrOpenFindsIt!221 (_keys!6242 thiss!1504) (_values!4171 thiss!1504) (mask!10010 thiss!1504) (extraKeys!3925 thiss!1504) (zeroValue!4029 thiss!1504) (minValue!4029 thiss!1504) key!932 (defaultEntry!4188 thiss!1504)))))

(assert (=> b!222731 false))

(declare-fun b!222732 () Bool)

(declare-fun c!37007 () Bool)

(assert (=> b!222732 (= c!37007 ((_ is MissingVacant!811) lt!112769))))

(declare-fun e!144733 () Bool)

(assert (=> b!222732 (= e!144737 e!144733)))

(declare-fun b!222733 () Bool)

(assert (=> b!222733 (= e!144720 e!144723)))

(declare-fun res!109354 () Bool)

(assert (=> b!222733 (=> (not res!109354) (not e!144723))))

(assert (=> b!222733 (= res!109354 (inRange!0 index!297 (mask!10010 thiss!1504)))))

(declare-fun lt!112774 () Unit!6636)

(assert (=> b!222733 (= lt!112774 e!144726)))

(declare-fun c!37008 () Bool)

(declare-datatypes ((tuple2!4314 0))(
  ( (tuple2!4315 (_1!2168 (_ BitVec 64)) (_2!2168 V!7441)) )
))
(declare-datatypes ((List!3213 0))(
  ( (Nil!3210) (Cons!3209 (h!3857 tuple2!4314) (t!8164 List!3213)) )
))
(declare-datatypes ((ListLongMap!3229 0))(
  ( (ListLongMap!3230 (toList!1630 List!3213)) )
))
(declare-fun contains!1499 (ListLongMap!3229 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1162 (array!10933 array!10931 (_ BitVec 32) (_ BitVec 32) V!7441 V!7441 (_ BitVec 32) Int) ListLongMap!3229)

(assert (=> b!222733 (= c!37008 (contains!1499 (getCurrentListMap!1162 (_keys!6242 thiss!1504) (_values!4171 thiss!1504) (mask!10010 thiss!1504) (extraKeys!3925 thiss!1504) (zeroValue!4029 thiss!1504) (minValue!4029 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4188 thiss!1504)) key!932))))

(declare-fun b!222734 () Bool)

(assert (=> b!222734 (= e!144728 tp_is_empty!5845)))

(declare-fun b!222735 () Bool)

(assert (=> b!222735 (= e!144733 e!144731)))

(declare-fun res!109358 () Bool)

(assert (=> b!222735 (= res!109358 call!20772)))

(assert (=> b!222735 (=> (not res!109358) (not e!144731))))

(declare-fun b!222736 () Bool)

(assert (=> b!222736 (= e!144732 (not call!20771))))

(declare-fun b!222737 () Bool)

(assert (=> b!222737 (= e!144730 false)))

(declare-fun lt!112772 () Bool)

(declare-fun arrayNoDuplicates!0 (array!10933 (_ BitVec 32) List!3212) Bool)

(assert (=> b!222737 (= lt!112772 (arrayNoDuplicates!0 (_keys!6242 thiss!1504) #b00000000000000000000000000000000 Nil!3209))))

(declare-fun bm!20769 () Bool)

(assert (=> bm!20769 (= call!20771 (arrayContainsKey!0 (_keys!6242 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!222738 () Bool)

(assert (=> b!222738 (= e!144733 ((_ is Undefined!811) lt!112769))))

(assert (= (and start!21920 res!109360) b!222715))

(assert (= (and b!222715 res!109359) b!222716))

(assert (= (and b!222716 res!109362) b!222733))

(assert (= (and b!222733 c!37008) b!222731))

(assert (= (and b!222733 (not c!37008)) b!222711))

(assert (= (and b!222711 c!37006) b!222713))

(assert (= (and b!222711 (not c!37006)) b!222732))

(assert (= (and b!222713 res!109364) b!222722))

(assert (= (and b!222722 res!109356) b!222736))

(assert (= (and b!222732 c!37007) b!222735))

(assert (= (and b!222732 (not c!37007)) b!222738))

(assert (= (and b!222735 res!109358) b!222718))

(assert (= (and b!222718 res!109355) b!222720))

(assert (= (or b!222713 b!222735) bm!20768))

(assert (= (or b!222736 b!222720) bm!20769))

(assert (= (and b!222733 res!109354) b!222728))

(assert (= (and b!222728 c!37009) b!222727))

(assert (= (and b!222728 (not c!37009)) b!222726))

(assert (= (and b!222728 res!109352) b!222730))

(assert (= (and b!222730 res!109351) b!222725))

(assert (= (and b!222725 res!109361) b!222729))

(assert (= (and b!222729 res!109353) b!222721))

(assert (= (and b!222721 res!109366) b!222717))

(assert (= (and b!222721 (not res!109357)) b!222714))

(assert (= (and b!222714 res!109365) b!222719))

(assert (= (and b!222721 res!109363) b!222737))

(assert (= (and b!222723 condMapEmpty!9937) mapIsEmpty!9937))

(assert (= (and b!222723 (not condMapEmpty!9937)) mapNonEmpty!9937))

(assert (= (and mapNonEmpty!9937 ((_ is ValueCellFull!2579) mapValue!9937)) b!222734))

(assert (= (and b!222723 ((_ is ValueCellFull!2579) mapDefault!9937)) b!222724))

(assert (= b!222712 b!222723))

(assert (= start!21920 b!222712))

(declare-fun m!246847 () Bool)

(assert (=> b!222719 m!246847))

(declare-fun m!246849 () Bool)

(assert (=> b!222711 m!246849))

(declare-fun m!246851 () Bool)

(assert (=> b!222729 m!246851))

(declare-fun m!246853 () Bool)

(assert (=> b!222712 m!246853))

(declare-fun m!246855 () Bool)

(assert (=> b!222712 m!246855))

(declare-fun m!246857 () Bool)

(assert (=> b!222728 m!246857))

(declare-fun m!246859 () Bool)

(assert (=> b!222731 m!246859))

(assert (=> bm!20769 m!246857))

(declare-fun m!246861 () Bool)

(assert (=> b!222733 m!246861))

(declare-fun m!246863 () Bool)

(assert (=> b!222733 m!246863))

(assert (=> b!222733 m!246863))

(declare-fun m!246865 () Bool)

(assert (=> b!222733 m!246865))

(declare-fun m!246867 () Bool)

(assert (=> bm!20768 m!246867))

(declare-fun m!246869 () Bool)

(assert (=> b!222722 m!246869))

(declare-fun m!246871 () Bool)

(assert (=> mapNonEmpty!9937 m!246871))

(assert (=> b!222717 m!246847))

(declare-fun m!246873 () Bool)

(assert (=> b!222716 m!246873))

(declare-fun m!246875 () Bool)

(assert (=> start!21920 m!246875))

(declare-fun m!246877 () Bool)

(assert (=> b!222725 m!246877))

(declare-fun m!246879 () Bool)

(assert (=> b!222727 m!246879))

(declare-fun m!246881 () Bool)

(assert (=> b!222730 m!246881))

(declare-fun m!246883 () Bool)

(assert (=> b!222718 m!246883))

(declare-fun m!246885 () Bool)

(assert (=> b!222737 m!246885))

(check-sat (not b!222717) (not b!222733) (not b!222728) (not b_next!5983) (not b!222737) (not b!222712) (not b!222716) (not b!222729) (not bm!20768) (not bm!20769) (not b!222711) (not start!21920) (not b!222725) b_and!12895 (not b!222730) (not b!222719) (not b!222727) (not b!222731) tp_is_empty!5845 (not mapNonEmpty!9937))
(check-sat b_and!12895 (not b_next!5983))
