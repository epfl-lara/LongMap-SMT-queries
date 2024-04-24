; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21836 () Bool)

(assert start!21836)

(declare-fun b!219723 () Bool)

(declare-fun b_free!5899 () Bool)

(declare-fun b_next!5899 () Bool)

(assert (=> b!219723 (= b_free!5899 (not b_next!5899))))

(declare-fun tp!20839 () Bool)

(declare-fun b_and!12811 () Bool)

(assert (=> b!219723 (= tp!20839 b_and!12811)))

(declare-fun b!219711 () Bool)

(declare-fun e!142897 () Bool)

(declare-fun tp_is_empty!5761 () Bool)

(assert (=> b!219711 (= e!142897 tp_is_empty!5761)))

(declare-fun b!219713 () Bool)

(declare-fun e!142900 () Bool)

(declare-fun e!142894 () Bool)

(assert (=> b!219713 (= e!142900 e!142894)))

(declare-fun res!107693 () Bool)

(assert (=> b!219713 (=> (not res!107693) (not e!142894))))

(declare-datatypes ((SeekEntryResult!775 0))(
  ( (MissingZero!775 (index!5270 (_ BitVec 32))) (Found!775 (index!5271 (_ BitVec 32))) (Intermediate!775 (undefined!1587 Bool) (index!5272 (_ BitVec 32)) (x!22891 (_ BitVec 32))) (Undefined!775) (MissingVacant!775 (index!5273 (_ BitVec 32))) )
))
(declare-fun lt!112065 () SeekEntryResult!775)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!219713 (= res!107693 (or (= lt!112065 (MissingZero!775 index!297)) (= lt!112065 (MissingVacant!775 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7329 0))(
  ( (V!7330 (val!2925 Int)) )
))
(declare-datatypes ((ValueCell!2537 0))(
  ( (ValueCellFull!2537 (v!4946 V!7329)) (EmptyCell!2537) )
))
(declare-datatypes ((array!10763 0))(
  ( (array!10764 (arr!5101 (Array (_ BitVec 32) ValueCell!2537)) (size!5434 (_ BitVec 32))) )
))
(declare-datatypes ((array!10765 0))(
  ( (array!10766 (arr!5102 (Array (_ BitVec 32) (_ BitVec 64))) (size!5435 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2974 0))(
  ( (LongMapFixedSize!2975 (defaultEntry!4146 Int) (mask!9940 (_ BitVec 32)) (extraKeys!3883 (_ BitVec 32)) (zeroValue!3987 V!7329) (minValue!3987 V!7329) (_size!1536 (_ BitVec 32)) (_keys!6200 array!10765) (_values!4129 array!10763) (_vacant!1536 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2974)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10765 (_ BitVec 32)) SeekEntryResult!775)

(assert (=> b!219713 (= lt!112065 (seekEntryOrOpen!0 key!932 (_keys!6200 thiss!1504) (mask!9940 thiss!1504)))))

(declare-fun b!219714 () Bool)

(declare-fun res!107691 () Bool)

(declare-fun e!142899 () Bool)

(assert (=> b!219714 (=> (not res!107691) (not e!142899))))

(assert (=> b!219714 (= res!107691 (and (= (size!5434 (_values!4129 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9940 thiss!1504))) (= (size!5435 (_keys!6200 thiss!1504)) (size!5434 (_values!4129 thiss!1504))) (bvsge (mask!9940 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3883 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3883 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!9811 () Bool)

(declare-fun mapRes!9811 () Bool)

(assert (=> mapIsEmpty!9811 mapRes!9811))

(declare-fun b!219715 () Bool)

(declare-fun res!107689 () Bool)

(declare-fun e!142898 () Bool)

(assert (=> b!219715 (=> (not res!107689) (not e!142898))))

(declare-fun call!20520 () Bool)

(assert (=> b!219715 (= res!107689 call!20520)))

(declare-fun e!142895 () Bool)

(assert (=> b!219715 (= e!142895 e!142898)))

(declare-fun b!219716 () Bool)

(declare-fun e!142901 () Bool)

(declare-fun e!142892 () Bool)

(assert (=> b!219716 (= e!142901 e!142892)))

(declare-fun res!107695 () Bool)

(assert (=> b!219716 (= res!107695 call!20520)))

(assert (=> b!219716 (=> (not res!107695) (not e!142892))))

(declare-fun b!219717 () Bool)

(assert (=> b!219717 (= e!142899 false)))

(declare-fun lt!112066 () Bool)

(declare-datatypes ((List!3161 0))(
  ( (Nil!3158) (Cons!3157 (h!3805 (_ BitVec 64)) (t!8112 List!3161)) )
))
(declare-fun arrayNoDuplicates!0 (array!10765 (_ BitVec 32) List!3161) Bool)

(assert (=> b!219717 (= lt!112066 (arrayNoDuplicates!0 (_keys!6200 thiss!1504) #b00000000000000000000000000000000 Nil!3158))))

(declare-fun b!219718 () Bool)

(declare-fun e!142902 () Bool)

(assert (=> b!219718 (= e!142902 (and e!142897 mapRes!9811))))

(declare-fun condMapEmpty!9811 () Bool)

(declare-fun mapDefault!9811 () ValueCell!2537)

(assert (=> b!219718 (= condMapEmpty!9811 (= (arr!5101 (_values!4129 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2537)) mapDefault!9811)))))

(declare-fun b!219719 () Bool)

(declare-datatypes ((Unit!6531 0))(
  ( (Unit!6532) )
))
(declare-fun e!142893 () Unit!6531)

(declare-fun Unit!6533 () Unit!6531)

(assert (=> b!219719 (= e!142893 Unit!6533)))

(declare-fun lt!112064 () Unit!6531)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!193 (array!10765 array!10763 (_ BitVec 32) (_ BitVec 32) V!7329 V!7329 (_ BitVec 64) Int) Unit!6531)

(assert (=> b!219719 (= lt!112064 (lemmaInListMapThenSeekEntryOrOpenFindsIt!193 (_keys!6200 thiss!1504) (_values!4129 thiss!1504) (mask!9940 thiss!1504) (extraKeys!3883 thiss!1504) (zeroValue!3987 thiss!1504) (minValue!3987 thiss!1504) key!932 (defaultEntry!4146 thiss!1504)))))

(assert (=> b!219719 false))

(declare-fun b!219720 () Bool)

(declare-fun res!107698 () Bool)

(assert (=> b!219720 (=> (not res!107698) (not e!142900))))

(assert (=> b!219720 (= res!107698 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!219721 () Bool)

(declare-fun call!20519 () Bool)

(assert (=> b!219721 (= e!142898 (not call!20519))))

(declare-fun mapNonEmpty!9811 () Bool)

(declare-fun tp!20838 () Bool)

(declare-fun e!142896 () Bool)

(assert (=> mapNonEmpty!9811 (= mapRes!9811 (and tp!20838 e!142896))))

(declare-fun mapRest!9811 () (Array (_ BitVec 32) ValueCell!2537))

(declare-fun mapKey!9811 () (_ BitVec 32))

(declare-fun mapValue!9811 () ValueCell!2537)

(assert (=> mapNonEmpty!9811 (= (arr!5101 (_values!4129 thiss!1504)) (store mapRest!9811 mapKey!9811 mapValue!9811))))

(declare-fun c!36592 () Bool)

(declare-fun bm!20516 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20516 (= call!20520 (inRange!0 (ite c!36592 (index!5270 lt!112065) (index!5273 lt!112065)) (mask!9940 thiss!1504)))))

(declare-fun b!219722 () Bool)

(declare-fun res!107692 () Bool)

(assert (=> b!219722 (= res!107692 (= (select (arr!5102 (_keys!6200 thiss!1504)) (index!5273 lt!112065)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!219722 (=> (not res!107692) (not e!142892))))

(declare-fun e!142903 () Bool)

(declare-fun array_inv!3355 (array!10765) Bool)

(declare-fun array_inv!3356 (array!10763) Bool)

(assert (=> b!219723 (= e!142903 (and tp!20839 tp_is_empty!5761 (array_inv!3355 (_keys!6200 thiss!1504)) (array_inv!3356 (_values!4129 thiss!1504)) e!142902))))

(declare-fun b!219724 () Bool)

(declare-fun lt!112063 () Unit!6531)

(assert (=> b!219724 (= e!142893 lt!112063)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!190 (array!10765 array!10763 (_ BitVec 32) (_ BitVec 32) V!7329 V!7329 (_ BitVec 64) Int) Unit!6531)

(assert (=> b!219724 (= lt!112063 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!190 (_keys!6200 thiss!1504) (_values!4129 thiss!1504) (mask!9940 thiss!1504) (extraKeys!3883 thiss!1504) (zeroValue!3987 thiss!1504) (minValue!3987 thiss!1504) key!932 (defaultEntry!4146 thiss!1504)))))

(get-info :version)

(assert (=> b!219724 (= c!36592 ((_ is MissingZero!775) lt!112065))))

(assert (=> b!219724 e!142895))

(declare-fun res!107694 () Bool)

(assert (=> start!21836 (=> (not res!107694) (not e!142900))))

(declare-fun valid!1215 (LongMapFixedSize!2974) Bool)

(assert (=> start!21836 (= res!107694 (valid!1215 thiss!1504))))

(assert (=> start!21836 e!142900))

(assert (=> start!21836 e!142903))

(assert (=> start!21836 true))

(declare-fun b!219712 () Bool)

(assert (=> b!219712 (= e!142894 e!142899)))

(declare-fun res!107688 () Bool)

(assert (=> b!219712 (=> (not res!107688) (not e!142899))))

(assert (=> b!219712 (= res!107688 (inRange!0 index!297 (mask!9940 thiss!1504)))))

(declare-fun lt!112062 () Unit!6531)

(assert (=> b!219712 (= lt!112062 e!142893)))

(declare-fun c!36591 () Bool)

(declare-datatypes ((tuple2!4266 0))(
  ( (tuple2!4267 (_1!2144 (_ BitVec 64)) (_2!2144 V!7329)) )
))
(declare-datatypes ((List!3162 0))(
  ( (Nil!3159) (Cons!3158 (h!3806 tuple2!4266) (t!8113 List!3162)) )
))
(declare-datatypes ((ListLongMap!3181 0))(
  ( (ListLongMap!3182 (toList!1606 List!3162)) )
))
(declare-fun contains!1463 (ListLongMap!3181 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1138 (array!10765 array!10763 (_ BitVec 32) (_ BitVec 32) V!7329 V!7329 (_ BitVec 32) Int) ListLongMap!3181)

(assert (=> b!219712 (= c!36591 (contains!1463 (getCurrentListMap!1138 (_keys!6200 thiss!1504) (_values!4129 thiss!1504) (mask!9940 thiss!1504) (extraKeys!3883 thiss!1504) (zeroValue!3987 thiss!1504) (minValue!3987 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4146 thiss!1504)) key!932))))

(declare-fun b!219725 () Bool)

(declare-fun res!107696 () Bool)

(assert (=> b!219725 (=> (not res!107696) (not e!142899))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!219725 (= res!107696 (validMask!0 (mask!9940 thiss!1504)))))

(declare-fun b!219726 () Bool)

(declare-fun res!107697 () Bool)

(assert (=> b!219726 (=> (not res!107697) (not e!142898))))

(assert (=> b!219726 (= res!107697 (= (select (arr!5102 (_keys!6200 thiss!1504)) (index!5270 lt!112065)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!219727 () Bool)

(assert (=> b!219727 (= e!142896 tp_is_empty!5761)))

(declare-fun b!219728 () Bool)

(declare-fun res!107687 () Bool)

(assert (=> b!219728 (=> (not res!107687) (not e!142899))))

(declare-fun arrayContainsKey!0 (array!10765 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!219728 (= res!107687 (arrayContainsKey!0 (_keys!6200 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!219729 () Bool)

(declare-fun res!107690 () Bool)

(assert (=> b!219729 (=> (not res!107690) (not e!142899))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10765 (_ BitVec 32)) Bool)

(assert (=> b!219729 (= res!107690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6200 thiss!1504) (mask!9940 thiss!1504)))))

(declare-fun b!219730 () Bool)

(declare-fun c!36590 () Bool)

(assert (=> b!219730 (= c!36590 ((_ is MissingVacant!775) lt!112065))))

(assert (=> b!219730 (= e!142895 e!142901)))

(declare-fun b!219731 () Bool)

(assert (=> b!219731 (= e!142901 ((_ is Undefined!775) lt!112065))))

(declare-fun b!219732 () Bool)

(assert (=> b!219732 (= e!142892 (not call!20519))))

(declare-fun bm!20517 () Bool)

(assert (=> bm!20517 (= call!20519 (arrayContainsKey!0 (_keys!6200 thiss!1504) key!932 #b00000000000000000000000000000000))))

(assert (= (and start!21836 res!107694) b!219720))

(assert (= (and b!219720 res!107698) b!219713))

(assert (= (and b!219713 res!107693) b!219712))

(assert (= (and b!219712 c!36591) b!219719))

(assert (= (and b!219712 (not c!36591)) b!219724))

(assert (= (and b!219724 c!36592) b!219715))

(assert (= (and b!219724 (not c!36592)) b!219730))

(assert (= (and b!219715 res!107689) b!219726))

(assert (= (and b!219726 res!107697) b!219721))

(assert (= (and b!219730 c!36590) b!219716))

(assert (= (and b!219730 (not c!36590)) b!219731))

(assert (= (and b!219716 res!107695) b!219722))

(assert (= (and b!219722 res!107692) b!219732))

(assert (= (or b!219715 b!219716) bm!20516))

(assert (= (or b!219721 b!219732) bm!20517))

(assert (= (and b!219712 res!107688) b!219728))

(assert (= (and b!219728 res!107687) b!219725))

(assert (= (and b!219725 res!107696) b!219714))

(assert (= (and b!219714 res!107691) b!219729))

(assert (= (and b!219729 res!107690) b!219717))

(assert (= (and b!219718 condMapEmpty!9811) mapIsEmpty!9811))

(assert (= (and b!219718 (not condMapEmpty!9811)) mapNonEmpty!9811))

(assert (= (and mapNonEmpty!9811 ((_ is ValueCellFull!2537) mapValue!9811)) b!219727))

(assert (= (and b!219718 ((_ is ValueCellFull!2537) mapDefault!9811)) b!219711))

(assert (= b!219723 b!219718))

(assert (= start!21836 b!219723))

(declare-fun m!245347 () Bool)

(assert (=> b!219724 m!245347))

(declare-fun m!245349 () Bool)

(assert (=> mapNonEmpty!9811 m!245349))

(declare-fun m!245351 () Bool)

(assert (=> b!219713 m!245351))

(declare-fun m!245353 () Bool)

(assert (=> b!219717 m!245353))

(declare-fun m!245355 () Bool)

(assert (=> bm!20516 m!245355))

(declare-fun m!245357 () Bool)

(assert (=> b!219722 m!245357))

(declare-fun m!245359 () Bool)

(assert (=> bm!20517 m!245359))

(declare-fun m!245361 () Bool)

(assert (=> b!219712 m!245361))

(declare-fun m!245363 () Bool)

(assert (=> b!219712 m!245363))

(assert (=> b!219712 m!245363))

(declare-fun m!245365 () Bool)

(assert (=> b!219712 m!245365))

(assert (=> b!219728 m!245359))

(declare-fun m!245367 () Bool)

(assert (=> start!21836 m!245367))

(declare-fun m!245369 () Bool)

(assert (=> b!219726 m!245369))

(declare-fun m!245371 () Bool)

(assert (=> b!219725 m!245371))

(declare-fun m!245373 () Bool)

(assert (=> b!219723 m!245373))

(declare-fun m!245375 () Bool)

(assert (=> b!219723 m!245375))

(declare-fun m!245377 () Bool)

(assert (=> b!219719 m!245377))

(declare-fun m!245379 () Bool)

(assert (=> b!219729 m!245379))

(check-sat (not b!219712) (not b!219719) (not b_next!5899) (not b!219724) (not b!219729) (not b!219725) (not bm!20516) (not mapNonEmpty!9811) tp_is_empty!5761 (not b!219728) (not b!219723) (not b!219717) (not bm!20517) b_and!12811 (not start!21836) (not b!219713))
(check-sat b_and!12811 (not b_next!5899))
