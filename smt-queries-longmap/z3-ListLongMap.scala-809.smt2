; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19662 () Bool)

(assert start!19662)

(declare-fun b!192734 () Bool)

(declare-fun b_free!4695 () Bool)

(declare-fun b_next!4695 () Bool)

(assert (=> b!192734 (= b_free!4695 (not b_next!4695))))

(declare-fun tp!16943 () Bool)

(declare-fun b_and!11393 () Bool)

(assert (=> b!192734 (= tp!16943 b_and!11393)))

(declare-datatypes ((SeekEntryResult!683 0))(
  ( (MissingZero!683 (index!4902 (_ BitVec 32))) (Found!683 (index!4903 (_ BitVec 32))) (Intermediate!683 (undefined!1495 Bool) (index!4904 (_ BitVec 32)) (x!20607 (_ BitVec 32))) (Undefined!683) (MissingVacant!683 (index!4905 (_ BitVec 32))) )
))
(declare-fun lt!95838 () SeekEntryResult!683)

(declare-datatypes ((V!5603 0))(
  ( (V!5604 (val!2278 Int)) )
))
(declare-datatypes ((ValueCell!1890 0))(
  ( (ValueCellFull!1890 (v!4228 V!5603)) (EmptyCell!1890) )
))
(declare-datatypes ((array!8177 0))(
  ( (array!8178 (arr!3851 (Array (_ BitVec 32) (_ BitVec 64))) (size!4175 (_ BitVec 32))) )
))
(declare-datatypes ((array!8179 0))(
  ( (array!8180 (arr!3852 (Array (_ BitVec 32) ValueCell!1890)) (size!4176 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2688 0))(
  ( (LongMapFixedSize!2689 (defaultEntry!3932 Int) (mask!9171 (_ BitVec 32)) (extraKeys!3669 (_ BitVec 32)) (zeroValue!3773 V!5603) (minValue!3773 V!5603) (_size!1393 (_ BitVec 32)) (_keys!5918 array!8177) (_values!3915 array!8179) (_vacant!1393 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2688)

(declare-fun e!126809 () Bool)

(declare-fun b!192727 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!192727 (= e!126809 (= (select (arr!3851 (_keys!5918 thiss!1248)) (index!4903 lt!95838)) key!828))))

(declare-fun mapNonEmpty!7721 () Bool)

(declare-fun mapRes!7721 () Bool)

(declare-fun tp!16942 () Bool)

(declare-fun e!126814 () Bool)

(assert (=> mapNonEmpty!7721 (= mapRes!7721 (and tp!16942 e!126814))))

(declare-fun mapRest!7721 () (Array (_ BitVec 32) ValueCell!1890))

(declare-fun mapValue!7721 () ValueCell!1890)

(declare-fun mapKey!7721 () (_ BitVec 32))

(assert (=> mapNonEmpty!7721 (= (arr!3852 (_values!3915 thiss!1248)) (store mapRest!7721 mapKey!7721 mapValue!7721))))

(declare-fun b!192728 () Bool)

(declare-fun e!126812 () Bool)

(declare-fun tp_is_empty!4467 () Bool)

(assert (=> b!192728 (= e!126812 tp_is_empty!4467)))

(declare-fun b!192729 () Bool)

(declare-fun res!91063 () Bool)

(declare-fun e!126810 () Bool)

(assert (=> b!192729 (=> (not res!91063) (not e!126810))))

(assert (=> b!192729 (= res!91063 (not (= key!828 (bvneg key!828))))))

(declare-fun b!192730 () Bool)

(declare-fun e!126813 () Bool)

(assert (=> b!192730 (= e!126813 (and e!126812 mapRes!7721))))

(declare-fun condMapEmpty!7721 () Bool)

(declare-fun mapDefault!7721 () ValueCell!1890)

(assert (=> b!192730 (= condMapEmpty!7721 (= (arr!3852 (_values!3915 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1890)) mapDefault!7721)))))

(declare-fun b!192731 () Bool)

(declare-datatypes ((Unit!5832 0))(
  ( (Unit!5833) )
))
(declare-fun e!126808 () Unit!5832)

(declare-fun lt!95843 () Unit!5832)

(assert (=> b!192731 (= e!126808 lt!95843)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!177 (array!8177 array!8179 (_ BitVec 32) (_ BitVec 32) V!5603 V!5603 (_ BitVec 64) Int) Unit!5832)

(assert (=> b!192731 (= lt!95843 (lemmaInListMapThenSeekEntryOrOpenFindsIt!177 (_keys!5918 thiss!1248) (_values!3915 thiss!1248) (mask!9171 thiss!1248) (extraKeys!3669 thiss!1248) (zeroValue!3773 thiss!1248) (minValue!3773 thiss!1248) key!828 (defaultEntry!3932 thiss!1248)))))

(declare-fun res!91064 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!192731 (= res!91064 (inRange!0 (index!4903 lt!95838) (mask!9171 thiss!1248)))))

(assert (=> b!192731 (=> (not res!91064) (not e!126809))))

(assert (=> b!192731 e!126809))

(declare-fun b!192732 () Bool)

(declare-fun res!91062 () Bool)

(declare-fun e!126816 () Bool)

(assert (=> b!192732 (=> res!91062 e!126816)))

(assert (=> b!192732 (= res!91062 (or (not (= (size!4176 (_values!3915 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9171 thiss!1248)))) (not (= (size!4175 (_keys!5918 thiss!1248)) (size!4176 (_values!3915 thiss!1248)))) (bvslt (mask!9171 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3669 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3669 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!192733 () Bool)

(assert (=> b!192733 (= e!126814 tp_is_empty!4467)))

(declare-fun e!126807 () Bool)

(declare-fun array_inv!2497 (array!8177) Bool)

(declare-fun array_inv!2498 (array!8179) Bool)

(assert (=> b!192734 (= e!126807 (and tp!16943 tp_is_empty!4467 (array_inv!2497 (_keys!5918 thiss!1248)) (array_inv!2498 (_values!3915 thiss!1248)) e!126813))))

(declare-fun b!192735 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8177 (_ BitVec 32)) Bool)

(assert (=> b!192735 (= e!126816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5918 thiss!1248) (mask!9171 thiss!1248)))))

(declare-fun res!91061 () Bool)

(assert (=> start!19662 (=> (not res!91061) (not e!126810))))

(declare-fun valid!1103 (LongMapFixedSize!2688) Bool)

(assert (=> start!19662 (= res!91061 (valid!1103 thiss!1248))))

(assert (=> start!19662 e!126810))

(assert (=> start!19662 e!126807))

(assert (=> start!19662 true))

(assert (=> start!19662 tp_is_empty!4467))

(declare-fun mapIsEmpty!7721 () Bool)

(assert (=> mapIsEmpty!7721 mapRes!7721))

(declare-fun b!192736 () Bool)

(declare-fun e!126811 () Bool)

(assert (=> b!192736 (= e!126810 e!126811)))

(declare-fun res!91065 () Bool)

(assert (=> b!192736 (=> (not res!91065) (not e!126811))))

(get-info :version)

(assert (=> b!192736 (= res!91065 (and (not ((_ is Undefined!683) lt!95838)) (not ((_ is MissingVacant!683) lt!95838)) (not ((_ is MissingZero!683) lt!95838)) ((_ is Found!683) lt!95838)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8177 (_ BitVec 32)) SeekEntryResult!683)

(assert (=> b!192736 (= lt!95838 (seekEntryOrOpen!0 key!828 (_keys!5918 thiss!1248) (mask!9171 thiss!1248)))))

(declare-fun b!192737 () Bool)

(assert (=> b!192737 (= e!126811 (not e!126816))))

(declare-fun res!91066 () Bool)

(assert (=> b!192737 (=> res!91066 e!126816)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!192737 (= res!91066 (not (validMask!0 (mask!9171 thiss!1248))))))

(declare-fun v!309 () V!5603)

(declare-datatypes ((tuple2!3538 0))(
  ( (tuple2!3539 (_1!1780 (_ BitVec 64)) (_2!1780 V!5603)) )
))
(declare-datatypes ((List!2430 0))(
  ( (Nil!2427) (Cons!2426 (h!3067 tuple2!3538) (t!7348 List!2430)) )
))
(declare-datatypes ((ListLongMap!2455 0))(
  ( (ListLongMap!2456 (toList!1243 List!2430)) )
))
(declare-fun lt!95842 () ListLongMap!2455)

(declare-fun +!311 (ListLongMap!2455 tuple2!3538) ListLongMap!2455)

(declare-fun getCurrentListMap!891 (array!8177 array!8179 (_ BitVec 32) (_ BitVec 32) V!5603 V!5603 (_ BitVec 32) Int) ListLongMap!2455)

(assert (=> b!192737 (= (+!311 lt!95842 (tuple2!3539 key!828 v!309)) (getCurrentListMap!891 (_keys!5918 thiss!1248) (array!8180 (store (arr!3852 (_values!3915 thiss!1248)) (index!4903 lt!95838) (ValueCellFull!1890 v!309)) (size!4176 (_values!3915 thiss!1248))) (mask!9171 thiss!1248) (extraKeys!3669 thiss!1248) (zeroValue!3773 thiss!1248) (minValue!3773 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3932 thiss!1248)))))

(declare-fun lt!95840 () Unit!5832)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!112 (array!8177 array!8179 (_ BitVec 32) (_ BitVec 32) V!5603 V!5603 (_ BitVec 32) (_ BitVec 64) V!5603 Int) Unit!5832)

(assert (=> b!192737 (= lt!95840 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!112 (_keys!5918 thiss!1248) (_values!3915 thiss!1248) (mask!9171 thiss!1248) (extraKeys!3669 thiss!1248) (zeroValue!3773 thiss!1248) (minValue!3773 thiss!1248) (index!4903 lt!95838) key!828 v!309 (defaultEntry!3932 thiss!1248)))))

(declare-fun lt!95841 () Unit!5832)

(assert (=> b!192737 (= lt!95841 e!126808)))

(declare-fun c!34757 () Bool)

(declare-fun contains!1361 (ListLongMap!2455 (_ BitVec 64)) Bool)

(assert (=> b!192737 (= c!34757 (contains!1361 lt!95842 key!828))))

(assert (=> b!192737 (= lt!95842 (getCurrentListMap!891 (_keys!5918 thiss!1248) (_values!3915 thiss!1248) (mask!9171 thiss!1248) (extraKeys!3669 thiss!1248) (zeroValue!3773 thiss!1248) (minValue!3773 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3932 thiss!1248)))))

(declare-fun b!192738 () Bool)

(declare-fun Unit!5834 () Unit!5832)

(assert (=> b!192738 (= e!126808 Unit!5834)))

(declare-fun lt!95839 () Unit!5832)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!186 (array!8177 array!8179 (_ BitVec 32) (_ BitVec 32) V!5603 V!5603 (_ BitVec 64) Int) Unit!5832)

(assert (=> b!192738 (= lt!95839 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!186 (_keys!5918 thiss!1248) (_values!3915 thiss!1248) (mask!9171 thiss!1248) (extraKeys!3669 thiss!1248) (zeroValue!3773 thiss!1248) (minValue!3773 thiss!1248) key!828 (defaultEntry!3932 thiss!1248)))))

(assert (=> b!192738 false))

(assert (= (and start!19662 res!91061) b!192729))

(assert (= (and b!192729 res!91063) b!192736))

(assert (= (and b!192736 res!91065) b!192737))

(assert (= (and b!192737 c!34757) b!192731))

(assert (= (and b!192737 (not c!34757)) b!192738))

(assert (= (and b!192731 res!91064) b!192727))

(assert (= (and b!192737 (not res!91066)) b!192732))

(assert (= (and b!192732 (not res!91062)) b!192735))

(assert (= (and b!192730 condMapEmpty!7721) mapIsEmpty!7721))

(assert (= (and b!192730 (not condMapEmpty!7721)) mapNonEmpty!7721))

(assert (= (and mapNonEmpty!7721 ((_ is ValueCellFull!1890) mapValue!7721)) b!192733))

(assert (= (and b!192730 ((_ is ValueCellFull!1890) mapDefault!7721)) b!192728))

(assert (= b!192734 b!192730))

(assert (= start!19662 b!192734))

(declare-fun m!219561 () Bool)

(assert (=> b!192736 m!219561))

(declare-fun m!219563 () Bool)

(assert (=> b!192734 m!219563))

(declare-fun m!219565 () Bool)

(assert (=> b!192734 m!219565))

(declare-fun m!219567 () Bool)

(assert (=> b!192738 m!219567))

(declare-fun m!219569 () Bool)

(assert (=> b!192731 m!219569))

(declare-fun m!219571 () Bool)

(assert (=> b!192731 m!219571))

(declare-fun m!219573 () Bool)

(assert (=> start!19662 m!219573))

(declare-fun m!219575 () Bool)

(assert (=> b!192727 m!219575))

(declare-fun m!219577 () Bool)

(assert (=> mapNonEmpty!7721 m!219577))

(declare-fun m!219579 () Bool)

(assert (=> b!192737 m!219579))

(declare-fun m!219581 () Bool)

(assert (=> b!192737 m!219581))

(declare-fun m!219583 () Bool)

(assert (=> b!192737 m!219583))

(declare-fun m!219585 () Bool)

(assert (=> b!192737 m!219585))

(declare-fun m!219587 () Bool)

(assert (=> b!192737 m!219587))

(declare-fun m!219589 () Bool)

(assert (=> b!192737 m!219589))

(declare-fun m!219591 () Bool)

(assert (=> b!192737 m!219591))

(declare-fun m!219593 () Bool)

(assert (=> b!192735 m!219593))

(check-sat (not mapNonEmpty!7721) (not b!192736) (not b!192735) b_and!11393 tp_is_empty!4467 (not b!192731) (not start!19662) (not b!192738) (not b_next!4695) (not b!192734) (not b!192737))
(check-sat b_and!11393 (not b_next!4695))
(get-model)

(declare-fun lt!95870 () SeekEntryResult!683)

(declare-fun e!126854 () SeekEntryResult!683)

(declare-fun b!192787 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8177 (_ BitVec 32)) SeekEntryResult!683)

(assert (=> b!192787 (= e!126854 (seekKeyOrZeroReturnVacant!0 (x!20607 lt!95870) (index!4904 lt!95870) (index!4904 lt!95870) key!828 (_keys!5918 thiss!1248) (mask!9171 thiss!1248)))))

(declare-fun b!192788 () Bool)

(declare-fun e!126855 () SeekEntryResult!683)

(assert (=> b!192788 (= e!126855 (Found!683 (index!4904 lt!95870)))))

(declare-fun b!192789 () Bool)

(declare-fun e!126853 () SeekEntryResult!683)

(assert (=> b!192789 (= e!126853 e!126855)))

(declare-fun lt!95869 () (_ BitVec 64))

(assert (=> b!192789 (= lt!95869 (select (arr!3851 (_keys!5918 thiss!1248)) (index!4904 lt!95870)))))

(declare-fun c!34769 () Bool)

(assert (=> b!192789 (= c!34769 (= lt!95869 key!828))))

(declare-fun b!192790 () Bool)

(assert (=> b!192790 (= e!126853 Undefined!683)))

(declare-fun d!56511 () Bool)

(declare-fun lt!95868 () SeekEntryResult!683)

(assert (=> d!56511 (and (or ((_ is Undefined!683) lt!95868) (not ((_ is Found!683) lt!95868)) (and (bvsge (index!4903 lt!95868) #b00000000000000000000000000000000) (bvslt (index!4903 lt!95868) (size!4175 (_keys!5918 thiss!1248))))) (or ((_ is Undefined!683) lt!95868) ((_ is Found!683) lt!95868) (not ((_ is MissingZero!683) lt!95868)) (and (bvsge (index!4902 lt!95868) #b00000000000000000000000000000000) (bvslt (index!4902 lt!95868) (size!4175 (_keys!5918 thiss!1248))))) (or ((_ is Undefined!683) lt!95868) ((_ is Found!683) lt!95868) ((_ is MissingZero!683) lt!95868) (not ((_ is MissingVacant!683) lt!95868)) (and (bvsge (index!4905 lt!95868) #b00000000000000000000000000000000) (bvslt (index!4905 lt!95868) (size!4175 (_keys!5918 thiss!1248))))) (or ((_ is Undefined!683) lt!95868) (ite ((_ is Found!683) lt!95868) (= (select (arr!3851 (_keys!5918 thiss!1248)) (index!4903 lt!95868)) key!828) (ite ((_ is MissingZero!683) lt!95868) (= (select (arr!3851 (_keys!5918 thiss!1248)) (index!4902 lt!95868)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!683) lt!95868) (= (select (arr!3851 (_keys!5918 thiss!1248)) (index!4905 lt!95868)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!56511 (= lt!95868 e!126853)))

(declare-fun c!34768 () Bool)

(assert (=> d!56511 (= c!34768 (and ((_ is Intermediate!683) lt!95870) (undefined!1495 lt!95870)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8177 (_ BitVec 32)) SeekEntryResult!683)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!56511 (= lt!95870 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9171 thiss!1248)) key!828 (_keys!5918 thiss!1248) (mask!9171 thiss!1248)))))

(assert (=> d!56511 (validMask!0 (mask!9171 thiss!1248))))

(assert (=> d!56511 (= (seekEntryOrOpen!0 key!828 (_keys!5918 thiss!1248) (mask!9171 thiss!1248)) lt!95868)))

(declare-fun b!192791 () Bool)

(assert (=> b!192791 (= e!126854 (MissingZero!683 (index!4904 lt!95870)))))

(declare-fun b!192792 () Bool)

(declare-fun c!34767 () Bool)

(assert (=> b!192792 (= c!34767 (= lt!95869 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!192792 (= e!126855 e!126854)))

(assert (= (and d!56511 c!34768) b!192790))

(assert (= (and d!56511 (not c!34768)) b!192789))

(assert (= (and b!192789 c!34769) b!192788))

(assert (= (and b!192789 (not c!34769)) b!192792))

(assert (= (and b!192792 c!34767) b!192791))

(assert (= (and b!192792 (not c!34767)) b!192787))

(declare-fun m!219629 () Bool)

(assert (=> b!192787 m!219629))

(declare-fun m!219631 () Bool)

(assert (=> b!192789 m!219631))

(declare-fun m!219633 () Bool)

(assert (=> d!56511 m!219633))

(declare-fun m!219635 () Bool)

(assert (=> d!56511 m!219635))

(assert (=> d!56511 m!219591))

(declare-fun m!219637 () Bool)

(assert (=> d!56511 m!219637))

(declare-fun m!219639 () Bool)

(assert (=> d!56511 m!219639))

(assert (=> d!56511 m!219633))

(declare-fun m!219641 () Bool)

(assert (=> d!56511 m!219641))

(assert (=> b!192736 d!56511))

(declare-fun d!56513 () Bool)

(declare-fun e!126858 () Bool)

(assert (=> d!56513 e!126858))

(declare-fun res!91089 () Bool)

(assert (=> d!56513 (=> (not res!91089) (not e!126858))))

(declare-fun lt!95875 () SeekEntryResult!683)

(assert (=> d!56513 (= res!91089 ((_ is Found!683) lt!95875))))

(assert (=> d!56513 (= lt!95875 (seekEntryOrOpen!0 key!828 (_keys!5918 thiss!1248) (mask!9171 thiss!1248)))))

(declare-fun lt!95876 () Unit!5832)

(declare-fun choose!1051 (array!8177 array!8179 (_ BitVec 32) (_ BitVec 32) V!5603 V!5603 (_ BitVec 64) Int) Unit!5832)

(assert (=> d!56513 (= lt!95876 (choose!1051 (_keys!5918 thiss!1248) (_values!3915 thiss!1248) (mask!9171 thiss!1248) (extraKeys!3669 thiss!1248) (zeroValue!3773 thiss!1248) (minValue!3773 thiss!1248) key!828 (defaultEntry!3932 thiss!1248)))))

(assert (=> d!56513 (validMask!0 (mask!9171 thiss!1248))))

(assert (=> d!56513 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!177 (_keys!5918 thiss!1248) (_values!3915 thiss!1248) (mask!9171 thiss!1248) (extraKeys!3669 thiss!1248) (zeroValue!3773 thiss!1248) (minValue!3773 thiss!1248) key!828 (defaultEntry!3932 thiss!1248)) lt!95876)))

(declare-fun b!192797 () Bool)

(declare-fun res!91090 () Bool)

(assert (=> b!192797 (=> (not res!91090) (not e!126858))))

(assert (=> b!192797 (= res!91090 (inRange!0 (index!4903 lt!95875) (mask!9171 thiss!1248)))))

(declare-fun b!192798 () Bool)

(assert (=> b!192798 (= e!126858 (= (select (arr!3851 (_keys!5918 thiss!1248)) (index!4903 lt!95875)) key!828))))

(assert (=> b!192798 (and (bvsge (index!4903 lt!95875) #b00000000000000000000000000000000) (bvslt (index!4903 lt!95875) (size!4175 (_keys!5918 thiss!1248))))))

(assert (= (and d!56513 res!91089) b!192797))

(assert (= (and b!192797 res!91090) b!192798))

(assert (=> d!56513 m!219561))

(declare-fun m!219643 () Bool)

(assert (=> d!56513 m!219643))

(assert (=> d!56513 m!219591))

(declare-fun m!219645 () Bool)

(assert (=> b!192797 m!219645))

(declare-fun m!219647 () Bool)

(assert (=> b!192798 m!219647))

(assert (=> b!192731 d!56513))

(declare-fun d!56515 () Bool)

(assert (=> d!56515 (= (inRange!0 (index!4903 lt!95838) (mask!9171 thiss!1248)) (and (bvsge (index!4903 lt!95838) #b00000000000000000000000000000000) (bvslt (index!4903 lt!95838) (bvadd (mask!9171 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!192731 d!56515))

(declare-fun d!56517 () Bool)

(declare-fun e!126861 () Bool)

(assert (=> d!56517 e!126861))

(declare-fun res!91093 () Bool)

(assert (=> d!56517 (=> (not res!91093) (not e!126861))))

(assert (=> d!56517 (= res!91093 (and (bvsge (index!4903 lt!95838) #b00000000000000000000000000000000) (bvslt (index!4903 lt!95838) (size!4176 (_values!3915 thiss!1248)))))))

(declare-fun lt!95879 () Unit!5832)

(declare-fun choose!1052 (array!8177 array!8179 (_ BitVec 32) (_ BitVec 32) V!5603 V!5603 (_ BitVec 32) (_ BitVec 64) V!5603 Int) Unit!5832)

(assert (=> d!56517 (= lt!95879 (choose!1052 (_keys!5918 thiss!1248) (_values!3915 thiss!1248) (mask!9171 thiss!1248) (extraKeys!3669 thiss!1248) (zeroValue!3773 thiss!1248) (minValue!3773 thiss!1248) (index!4903 lt!95838) key!828 v!309 (defaultEntry!3932 thiss!1248)))))

(assert (=> d!56517 (validMask!0 (mask!9171 thiss!1248))))

(assert (=> d!56517 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!112 (_keys!5918 thiss!1248) (_values!3915 thiss!1248) (mask!9171 thiss!1248) (extraKeys!3669 thiss!1248) (zeroValue!3773 thiss!1248) (minValue!3773 thiss!1248) (index!4903 lt!95838) key!828 v!309 (defaultEntry!3932 thiss!1248)) lt!95879)))

(declare-fun b!192801 () Bool)

(assert (=> b!192801 (= e!126861 (= (+!311 (getCurrentListMap!891 (_keys!5918 thiss!1248) (_values!3915 thiss!1248) (mask!9171 thiss!1248) (extraKeys!3669 thiss!1248) (zeroValue!3773 thiss!1248) (minValue!3773 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3932 thiss!1248)) (tuple2!3539 key!828 v!309)) (getCurrentListMap!891 (_keys!5918 thiss!1248) (array!8180 (store (arr!3852 (_values!3915 thiss!1248)) (index!4903 lt!95838) (ValueCellFull!1890 v!309)) (size!4176 (_values!3915 thiss!1248))) (mask!9171 thiss!1248) (extraKeys!3669 thiss!1248) (zeroValue!3773 thiss!1248) (minValue!3773 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3932 thiss!1248))))))

(assert (= (and d!56517 res!91093) b!192801))

(declare-fun m!219649 () Bool)

(assert (=> d!56517 m!219649))

(assert (=> d!56517 m!219591))

(assert (=> b!192801 m!219581))

(assert (=> b!192801 m!219581))

(declare-fun m!219651 () Bool)

(assert (=> b!192801 m!219651))

(assert (=> b!192801 m!219589))

(assert (=> b!192801 m!219585))

(assert (=> b!192737 d!56517))

(declare-fun d!56519 () Bool)

(declare-fun e!126867 () Bool)

(assert (=> d!56519 e!126867))

(declare-fun res!91096 () Bool)

(assert (=> d!56519 (=> res!91096 e!126867)))

(declare-fun lt!95888 () Bool)

(assert (=> d!56519 (= res!91096 (not lt!95888))))

(declare-fun lt!95889 () Bool)

(assert (=> d!56519 (= lt!95888 lt!95889)))

(declare-fun lt!95891 () Unit!5832)

(declare-fun e!126866 () Unit!5832)

(assert (=> d!56519 (= lt!95891 e!126866)))

(declare-fun c!34772 () Bool)

(assert (=> d!56519 (= c!34772 lt!95889)))

(declare-fun containsKey!245 (List!2430 (_ BitVec 64)) Bool)

(assert (=> d!56519 (= lt!95889 (containsKey!245 (toList!1243 lt!95842) key!828))))

(assert (=> d!56519 (= (contains!1361 lt!95842 key!828) lt!95888)))

(declare-fun b!192808 () Bool)

(declare-fun lt!95890 () Unit!5832)

(assert (=> b!192808 (= e!126866 lt!95890)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!193 (List!2430 (_ BitVec 64)) Unit!5832)

(assert (=> b!192808 (= lt!95890 (lemmaContainsKeyImpliesGetValueByKeyDefined!193 (toList!1243 lt!95842) key!828))))

(declare-datatypes ((Option!247 0))(
  ( (Some!246 (v!4232 V!5603)) (None!245) )
))
(declare-fun isDefined!194 (Option!247) Bool)

(declare-fun getValueByKey!241 (List!2430 (_ BitVec 64)) Option!247)

(assert (=> b!192808 (isDefined!194 (getValueByKey!241 (toList!1243 lt!95842) key!828))))

(declare-fun b!192809 () Bool)

(declare-fun Unit!5838 () Unit!5832)

(assert (=> b!192809 (= e!126866 Unit!5838)))

(declare-fun b!192810 () Bool)

(assert (=> b!192810 (= e!126867 (isDefined!194 (getValueByKey!241 (toList!1243 lt!95842) key!828)))))

(assert (= (and d!56519 c!34772) b!192808))

(assert (= (and d!56519 (not c!34772)) b!192809))

(assert (= (and d!56519 (not res!91096)) b!192810))

(declare-fun m!219653 () Bool)

(assert (=> d!56519 m!219653))

(declare-fun m!219655 () Bool)

(assert (=> b!192808 m!219655))

(declare-fun m!219657 () Bool)

(assert (=> b!192808 m!219657))

(assert (=> b!192808 m!219657))

(declare-fun m!219659 () Bool)

(assert (=> b!192808 m!219659))

(assert (=> b!192810 m!219657))

(assert (=> b!192810 m!219657))

(assert (=> b!192810 m!219659))

(assert (=> b!192737 d!56519))

(declare-fun d!56521 () Bool)

(declare-fun e!126870 () Bool)

(assert (=> d!56521 e!126870))

(declare-fun res!91101 () Bool)

(assert (=> d!56521 (=> (not res!91101) (not e!126870))))

(declare-fun lt!95903 () ListLongMap!2455)

(assert (=> d!56521 (= res!91101 (contains!1361 lt!95903 (_1!1780 (tuple2!3539 key!828 v!309))))))

(declare-fun lt!95901 () List!2430)

(assert (=> d!56521 (= lt!95903 (ListLongMap!2456 lt!95901))))

(declare-fun lt!95900 () Unit!5832)

(declare-fun lt!95902 () Unit!5832)

(assert (=> d!56521 (= lt!95900 lt!95902)))

(assert (=> d!56521 (= (getValueByKey!241 lt!95901 (_1!1780 (tuple2!3539 key!828 v!309))) (Some!246 (_2!1780 (tuple2!3539 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!128 (List!2430 (_ BitVec 64) V!5603) Unit!5832)

(assert (=> d!56521 (= lt!95902 (lemmaContainsTupThenGetReturnValue!128 lt!95901 (_1!1780 (tuple2!3539 key!828 v!309)) (_2!1780 (tuple2!3539 key!828 v!309))))))

(declare-fun insertStrictlySorted!131 (List!2430 (_ BitVec 64) V!5603) List!2430)

(assert (=> d!56521 (= lt!95901 (insertStrictlySorted!131 (toList!1243 lt!95842) (_1!1780 (tuple2!3539 key!828 v!309)) (_2!1780 (tuple2!3539 key!828 v!309))))))

(assert (=> d!56521 (= (+!311 lt!95842 (tuple2!3539 key!828 v!309)) lt!95903)))

(declare-fun b!192815 () Bool)

(declare-fun res!91102 () Bool)

(assert (=> b!192815 (=> (not res!91102) (not e!126870))))

(assert (=> b!192815 (= res!91102 (= (getValueByKey!241 (toList!1243 lt!95903) (_1!1780 (tuple2!3539 key!828 v!309))) (Some!246 (_2!1780 (tuple2!3539 key!828 v!309)))))))

(declare-fun b!192816 () Bool)

(declare-fun contains!1363 (List!2430 tuple2!3538) Bool)

(assert (=> b!192816 (= e!126870 (contains!1363 (toList!1243 lt!95903) (tuple2!3539 key!828 v!309)))))

(assert (= (and d!56521 res!91101) b!192815))

(assert (= (and b!192815 res!91102) b!192816))

(declare-fun m!219661 () Bool)

(assert (=> d!56521 m!219661))

(declare-fun m!219663 () Bool)

(assert (=> d!56521 m!219663))

(declare-fun m!219665 () Bool)

(assert (=> d!56521 m!219665))

(declare-fun m!219667 () Bool)

(assert (=> d!56521 m!219667))

(declare-fun m!219669 () Bool)

(assert (=> b!192815 m!219669))

(declare-fun m!219671 () Bool)

(assert (=> b!192816 m!219671))

(assert (=> b!192737 d!56521))

(declare-fun b!192859 () Bool)

(declare-fun e!126904 () ListLongMap!2455)

(declare-fun call!19470 () ListLongMap!2455)

(assert (=> b!192859 (= e!126904 (+!311 call!19470 (tuple2!3539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3773 thiss!1248))))))

(declare-fun b!192860 () Bool)

(declare-fun e!126907 () ListLongMap!2455)

(declare-fun call!19468 () ListLongMap!2455)

(assert (=> b!192860 (= e!126907 call!19468)))

(declare-fun b!192861 () Bool)

(declare-fun res!91121 () Bool)

(declare-fun e!126901 () Bool)

(assert (=> b!192861 (=> (not res!91121) (not e!126901))))

(declare-fun e!126908 () Bool)

(assert (=> b!192861 (= res!91121 e!126908)))

(declare-fun res!91126 () Bool)

(assert (=> b!192861 (=> res!91126 e!126908)))

(declare-fun e!126900 () Bool)

(assert (=> b!192861 (= res!91126 (not e!126900))))

(declare-fun res!91128 () Bool)

(assert (=> b!192861 (=> (not res!91128) (not e!126900))))

(assert (=> b!192861 (= res!91128 (bvslt #b00000000000000000000000000000000 (size!4175 (_keys!5918 thiss!1248))))))

(declare-fun b!192862 () Bool)

(declare-fun e!126906 () Bool)

(declare-fun e!126899 () Bool)

(assert (=> b!192862 (= e!126906 e!126899)))

(declare-fun res!91122 () Bool)

(declare-fun call!19469 () Bool)

(assert (=> b!192862 (= res!91122 call!19469)))

(assert (=> b!192862 (=> (not res!91122) (not e!126899))))

(declare-fun b!192863 () Bool)

(declare-fun lt!95953 () ListLongMap!2455)

(declare-fun apply!184 (ListLongMap!2455 (_ BitVec 64)) V!5603)

(assert (=> b!192863 (= e!126899 (= (apply!184 lt!95953 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3773 thiss!1248)))))

(declare-fun b!192864 () Bool)

(declare-fun e!126909 () Unit!5832)

(declare-fun Unit!5839 () Unit!5832)

(assert (=> b!192864 (= e!126909 Unit!5839)))

(declare-fun b!192865 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!192865 (= e!126900 (validKeyInArray!0 (select (arr!3851 (_keys!5918 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192866 () Bool)

(assert (=> b!192866 (= e!126906 (not call!19469))))

(declare-fun b!192867 () Bool)

(declare-fun e!126897 () ListLongMap!2455)

(assert (=> b!192867 (= e!126897 call!19468)))

(declare-fun b!192868 () Bool)

(declare-fun e!126898 () Bool)

(assert (=> b!192868 (= e!126898 (validKeyInArray!0 (select (arr!3851 (_keys!5918 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19464 () Bool)

(declare-fun call!19471 () Bool)

(assert (=> bm!19464 (= call!19471 (contains!1361 lt!95953 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!19467 () ListLongMap!2455)

(declare-fun call!19473 () ListLongMap!2455)

(declare-fun c!34788 () Bool)

(declare-fun call!19472 () ListLongMap!2455)

(declare-fun c!34787 () Bool)

(declare-fun bm!19465 () Bool)

(assert (=> bm!19465 (= call!19470 (+!311 (ite c!34787 call!19472 (ite c!34788 call!19467 call!19473)) (ite (or c!34787 c!34788) (tuple2!3539 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3773 thiss!1248)) (tuple2!3539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3773 thiss!1248)))))))

(declare-fun b!192869 () Bool)

(declare-fun e!126903 () Bool)

(assert (=> b!192869 (= e!126903 (not call!19471))))

(declare-fun b!192870 () Bool)

(assert (=> b!192870 (= e!126904 e!126907)))

(assert (=> b!192870 (= c!34788 (and (not (= (bvand (extraKeys!3669 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3669 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19466 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!217 (array!8177 array!8179 (_ BitVec 32) (_ BitVec 32) V!5603 V!5603 (_ BitVec 32) Int) ListLongMap!2455)

(assert (=> bm!19466 (= call!19472 (getCurrentListMapNoExtraKeys!217 (_keys!5918 thiss!1248) (_values!3915 thiss!1248) (mask!9171 thiss!1248) (extraKeys!3669 thiss!1248) (zeroValue!3773 thiss!1248) (minValue!3773 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3932 thiss!1248)))))

(declare-fun bm!19467 () Bool)

(assert (=> bm!19467 (= call!19469 (contains!1361 lt!95953 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!192871 () Bool)

(assert (=> b!192871 (= e!126901 e!126903)))

(declare-fun c!34789 () Bool)

(assert (=> b!192871 (= c!34789 (not (= (bvand (extraKeys!3669 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19468 () Bool)

(assert (=> bm!19468 (= call!19468 call!19470)))

(declare-fun b!192872 () Bool)

(declare-fun e!126905 () Bool)

(assert (=> b!192872 (= e!126905 (= (apply!184 lt!95953 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3773 thiss!1248)))))

(declare-fun b!192873 () Bool)

(declare-fun lt!95949 () Unit!5832)

(assert (=> b!192873 (= e!126909 lt!95949)))

(declare-fun lt!95959 () ListLongMap!2455)

(assert (=> b!192873 (= lt!95959 (getCurrentListMapNoExtraKeys!217 (_keys!5918 thiss!1248) (_values!3915 thiss!1248) (mask!9171 thiss!1248) (extraKeys!3669 thiss!1248) (zeroValue!3773 thiss!1248) (minValue!3773 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3932 thiss!1248)))))

(declare-fun lt!95951 () (_ BitVec 64))

(assert (=> b!192873 (= lt!95951 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95966 () (_ BitVec 64))

(assert (=> b!192873 (= lt!95966 (select (arr!3851 (_keys!5918 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95962 () Unit!5832)

(declare-fun addStillContains!160 (ListLongMap!2455 (_ BitVec 64) V!5603 (_ BitVec 64)) Unit!5832)

(assert (=> b!192873 (= lt!95962 (addStillContains!160 lt!95959 lt!95951 (zeroValue!3773 thiss!1248) lt!95966))))

(assert (=> b!192873 (contains!1361 (+!311 lt!95959 (tuple2!3539 lt!95951 (zeroValue!3773 thiss!1248))) lt!95966)))

(declare-fun lt!95948 () Unit!5832)

(assert (=> b!192873 (= lt!95948 lt!95962)))

(declare-fun lt!95960 () ListLongMap!2455)

(assert (=> b!192873 (= lt!95960 (getCurrentListMapNoExtraKeys!217 (_keys!5918 thiss!1248) (_values!3915 thiss!1248) (mask!9171 thiss!1248) (extraKeys!3669 thiss!1248) (zeroValue!3773 thiss!1248) (minValue!3773 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3932 thiss!1248)))))

(declare-fun lt!95952 () (_ BitVec 64))

(assert (=> b!192873 (= lt!95952 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95968 () (_ BitVec 64))

(assert (=> b!192873 (= lt!95968 (select (arr!3851 (_keys!5918 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95950 () Unit!5832)

(declare-fun addApplyDifferent!160 (ListLongMap!2455 (_ BitVec 64) V!5603 (_ BitVec 64)) Unit!5832)

(assert (=> b!192873 (= lt!95950 (addApplyDifferent!160 lt!95960 lt!95952 (minValue!3773 thiss!1248) lt!95968))))

(assert (=> b!192873 (= (apply!184 (+!311 lt!95960 (tuple2!3539 lt!95952 (minValue!3773 thiss!1248))) lt!95968) (apply!184 lt!95960 lt!95968))))

(declare-fun lt!95954 () Unit!5832)

(assert (=> b!192873 (= lt!95954 lt!95950)))

(declare-fun lt!95967 () ListLongMap!2455)

(assert (=> b!192873 (= lt!95967 (getCurrentListMapNoExtraKeys!217 (_keys!5918 thiss!1248) (_values!3915 thiss!1248) (mask!9171 thiss!1248) (extraKeys!3669 thiss!1248) (zeroValue!3773 thiss!1248) (minValue!3773 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3932 thiss!1248)))))

(declare-fun lt!95955 () (_ BitVec 64))

(assert (=> b!192873 (= lt!95955 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95956 () (_ BitVec 64))

(assert (=> b!192873 (= lt!95956 (select (arr!3851 (_keys!5918 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95963 () Unit!5832)

(assert (=> b!192873 (= lt!95963 (addApplyDifferent!160 lt!95967 lt!95955 (zeroValue!3773 thiss!1248) lt!95956))))

(assert (=> b!192873 (= (apply!184 (+!311 lt!95967 (tuple2!3539 lt!95955 (zeroValue!3773 thiss!1248))) lt!95956) (apply!184 lt!95967 lt!95956))))

(declare-fun lt!95969 () Unit!5832)

(assert (=> b!192873 (= lt!95969 lt!95963)))

(declare-fun lt!95957 () ListLongMap!2455)

(assert (=> b!192873 (= lt!95957 (getCurrentListMapNoExtraKeys!217 (_keys!5918 thiss!1248) (_values!3915 thiss!1248) (mask!9171 thiss!1248) (extraKeys!3669 thiss!1248) (zeroValue!3773 thiss!1248) (minValue!3773 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3932 thiss!1248)))))

(declare-fun lt!95958 () (_ BitVec 64))

(assert (=> b!192873 (= lt!95958 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95965 () (_ BitVec 64))

(assert (=> b!192873 (= lt!95965 (select (arr!3851 (_keys!5918 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!192873 (= lt!95949 (addApplyDifferent!160 lt!95957 lt!95958 (minValue!3773 thiss!1248) lt!95965))))

(assert (=> b!192873 (= (apply!184 (+!311 lt!95957 (tuple2!3539 lt!95958 (minValue!3773 thiss!1248))) lt!95965) (apply!184 lt!95957 lt!95965))))

(declare-fun b!192874 () Bool)

(declare-fun c!34785 () Bool)

(assert (=> b!192874 (= c!34785 (and (not (= (bvand (extraKeys!3669 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3669 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!192874 (= e!126907 e!126897)))

(declare-fun b!192875 () Bool)

(declare-fun res!91129 () Bool)

(assert (=> b!192875 (=> (not res!91129) (not e!126901))))

(assert (=> b!192875 (= res!91129 e!126906)))

(declare-fun c!34786 () Bool)

(assert (=> b!192875 (= c!34786 (not (= (bvand (extraKeys!3669 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!192876 () Bool)

(assert (=> b!192876 (= e!126903 e!126905)))

(declare-fun res!91123 () Bool)

(assert (=> b!192876 (= res!91123 call!19471)))

(assert (=> b!192876 (=> (not res!91123) (not e!126905))))

(declare-fun b!192877 () Bool)

(assert (=> b!192877 (= e!126897 call!19473)))

(declare-fun d!56523 () Bool)

(assert (=> d!56523 e!126901))

(declare-fun res!91124 () Bool)

(assert (=> d!56523 (=> (not res!91124) (not e!126901))))

(assert (=> d!56523 (= res!91124 (or (bvsge #b00000000000000000000000000000000 (size!4175 (_keys!5918 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4175 (_keys!5918 thiss!1248))))))))

(declare-fun lt!95961 () ListLongMap!2455)

(assert (=> d!56523 (= lt!95953 lt!95961)))

(declare-fun lt!95964 () Unit!5832)

(assert (=> d!56523 (= lt!95964 e!126909)))

(declare-fun c!34790 () Bool)

(assert (=> d!56523 (= c!34790 e!126898)))

(declare-fun res!91127 () Bool)

(assert (=> d!56523 (=> (not res!91127) (not e!126898))))

(assert (=> d!56523 (= res!91127 (bvslt #b00000000000000000000000000000000 (size!4175 (_keys!5918 thiss!1248))))))

(assert (=> d!56523 (= lt!95961 e!126904)))

(assert (=> d!56523 (= c!34787 (and (not (= (bvand (extraKeys!3669 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3669 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56523 (validMask!0 (mask!9171 thiss!1248))))

(assert (=> d!56523 (= (getCurrentListMap!891 (_keys!5918 thiss!1248) (_values!3915 thiss!1248) (mask!9171 thiss!1248) (extraKeys!3669 thiss!1248) (zeroValue!3773 thiss!1248) (minValue!3773 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3932 thiss!1248)) lt!95953)))

(declare-fun bm!19469 () Bool)

(assert (=> bm!19469 (= call!19467 call!19472)))

(declare-fun bm!19470 () Bool)

(assert (=> bm!19470 (= call!19473 call!19467)))

(declare-fun b!192878 () Bool)

(declare-fun e!126902 () Bool)

(declare-fun get!2225 (ValueCell!1890 V!5603) V!5603)

(declare-fun dynLambda!527 (Int (_ BitVec 64)) V!5603)

(assert (=> b!192878 (= e!126902 (= (apply!184 lt!95953 (select (arr!3851 (_keys!5918 thiss!1248)) #b00000000000000000000000000000000)) (get!2225 (select (arr!3852 (_values!3915 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!527 (defaultEntry!3932 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!192878 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4176 (_values!3915 thiss!1248))))))

(assert (=> b!192878 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4175 (_keys!5918 thiss!1248))))))

(declare-fun b!192879 () Bool)

(assert (=> b!192879 (= e!126908 e!126902)))

(declare-fun res!91125 () Bool)

(assert (=> b!192879 (=> (not res!91125) (not e!126902))))

(assert (=> b!192879 (= res!91125 (contains!1361 lt!95953 (select (arr!3851 (_keys!5918 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!192879 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4175 (_keys!5918 thiss!1248))))))

(assert (= (and d!56523 c!34787) b!192859))

(assert (= (and d!56523 (not c!34787)) b!192870))

(assert (= (and b!192870 c!34788) b!192860))

(assert (= (and b!192870 (not c!34788)) b!192874))

(assert (= (and b!192874 c!34785) b!192867))

(assert (= (and b!192874 (not c!34785)) b!192877))

(assert (= (or b!192867 b!192877) bm!19470))

(assert (= (or b!192860 bm!19470) bm!19469))

(assert (= (or b!192860 b!192867) bm!19468))

(assert (= (or b!192859 bm!19469) bm!19466))

(assert (= (or b!192859 bm!19468) bm!19465))

(assert (= (and d!56523 res!91127) b!192868))

(assert (= (and d!56523 c!34790) b!192873))

(assert (= (and d!56523 (not c!34790)) b!192864))

(assert (= (and d!56523 res!91124) b!192861))

(assert (= (and b!192861 res!91128) b!192865))

(assert (= (and b!192861 (not res!91126)) b!192879))

(assert (= (and b!192879 res!91125) b!192878))

(assert (= (and b!192861 res!91121) b!192875))

(assert (= (and b!192875 c!34786) b!192862))

(assert (= (and b!192875 (not c!34786)) b!192866))

(assert (= (and b!192862 res!91122) b!192863))

(assert (= (or b!192862 b!192866) bm!19467))

(assert (= (and b!192875 res!91129) b!192871))

(assert (= (and b!192871 c!34789) b!192876))

(assert (= (and b!192871 (not c!34789)) b!192869))

(assert (= (and b!192876 res!91123) b!192872))

(assert (= (or b!192876 b!192869) bm!19464))

(declare-fun b_lambda!7447 () Bool)

(assert (=> (not b_lambda!7447) (not b!192878)))

(declare-fun t!7351 () Bool)

(declare-fun tb!2879 () Bool)

(assert (=> (and b!192734 (= (defaultEntry!3932 thiss!1248) (defaultEntry!3932 thiss!1248)) t!7351) tb!2879))

(declare-fun result!4915 () Bool)

(assert (=> tb!2879 (= result!4915 tp_is_empty!4467)))

(assert (=> b!192878 t!7351))

(declare-fun b_and!11397 () Bool)

(assert (= b_and!11393 (and (=> t!7351 result!4915) b_and!11397)))

(declare-fun m!219673 () Bool)

(assert (=> bm!19467 m!219673))

(declare-fun m!219675 () Bool)

(assert (=> b!192873 m!219675))

(declare-fun m!219677 () Bool)

(assert (=> b!192873 m!219677))

(declare-fun m!219679 () Bool)

(assert (=> b!192873 m!219679))

(declare-fun m!219681 () Bool)

(assert (=> b!192873 m!219681))

(declare-fun m!219683 () Bool)

(assert (=> b!192873 m!219683))

(assert (=> b!192873 m!219681))

(declare-fun m!219685 () Bool)

(assert (=> b!192873 m!219685))

(declare-fun m!219687 () Bool)

(assert (=> b!192873 m!219687))

(declare-fun m!219689 () Bool)

(assert (=> b!192873 m!219689))

(declare-fun m!219691 () Bool)

(assert (=> b!192873 m!219691))

(declare-fun m!219693 () Bool)

(assert (=> b!192873 m!219693))

(declare-fun m!219695 () Bool)

(assert (=> b!192873 m!219695))

(declare-fun m!219697 () Bool)

(assert (=> b!192873 m!219697))

(assert (=> b!192873 m!219685))

(assert (=> b!192873 m!219693))

(declare-fun m!219699 () Bool)

(assert (=> b!192873 m!219699))

(assert (=> b!192873 m!219679))

(declare-fun m!219701 () Bool)

(assert (=> b!192873 m!219701))

(declare-fun m!219703 () Bool)

(assert (=> b!192873 m!219703))

(declare-fun m!219705 () Bool)

(assert (=> b!192873 m!219705))

(declare-fun m!219707 () Bool)

(assert (=> b!192873 m!219707))

(assert (=> b!192879 m!219703))

(assert (=> b!192879 m!219703))

(declare-fun m!219709 () Bool)

(assert (=> b!192879 m!219709))

(assert (=> d!56523 m!219591))

(declare-fun m!219711 () Bool)

(assert (=> b!192878 m!219711))

(assert (=> b!192878 m!219703))

(declare-fun m!219713 () Bool)

(assert (=> b!192878 m!219713))

(assert (=> b!192878 m!219711))

(declare-fun m!219715 () Bool)

(assert (=> b!192878 m!219715))

(declare-fun m!219717 () Bool)

(assert (=> b!192878 m!219717))

(assert (=> b!192878 m!219715))

(assert (=> b!192878 m!219703))

(declare-fun m!219719 () Bool)

(assert (=> b!192859 m!219719))

(declare-fun m!219721 () Bool)

(assert (=> bm!19464 m!219721))

(declare-fun m!219723 () Bool)

(assert (=> bm!19465 m!219723))

(assert (=> bm!19466 m!219677))

(declare-fun m!219725 () Bool)

(assert (=> b!192863 m!219725))

(declare-fun m!219727 () Bool)

(assert (=> b!192872 m!219727))

(assert (=> b!192865 m!219703))

(assert (=> b!192865 m!219703))

(declare-fun m!219729 () Bool)

(assert (=> b!192865 m!219729))

(assert (=> b!192868 m!219703))

(assert (=> b!192868 m!219703))

(assert (=> b!192868 m!219729))

(assert (=> b!192737 d!56523))

(declare-fun d!56525 () Bool)

(assert (=> d!56525 (= (validMask!0 (mask!9171 thiss!1248)) (and (or (= (mask!9171 thiss!1248) #b00000000000000000000000000000111) (= (mask!9171 thiss!1248) #b00000000000000000000000000001111) (= (mask!9171 thiss!1248) #b00000000000000000000000000011111) (= (mask!9171 thiss!1248) #b00000000000000000000000000111111) (= (mask!9171 thiss!1248) #b00000000000000000000000001111111) (= (mask!9171 thiss!1248) #b00000000000000000000000011111111) (= (mask!9171 thiss!1248) #b00000000000000000000000111111111) (= (mask!9171 thiss!1248) #b00000000000000000000001111111111) (= (mask!9171 thiss!1248) #b00000000000000000000011111111111) (= (mask!9171 thiss!1248) #b00000000000000000000111111111111) (= (mask!9171 thiss!1248) #b00000000000000000001111111111111) (= (mask!9171 thiss!1248) #b00000000000000000011111111111111) (= (mask!9171 thiss!1248) #b00000000000000000111111111111111) (= (mask!9171 thiss!1248) #b00000000000000001111111111111111) (= (mask!9171 thiss!1248) #b00000000000000011111111111111111) (= (mask!9171 thiss!1248) #b00000000000000111111111111111111) (= (mask!9171 thiss!1248) #b00000000000001111111111111111111) (= (mask!9171 thiss!1248) #b00000000000011111111111111111111) (= (mask!9171 thiss!1248) #b00000000000111111111111111111111) (= (mask!9171 thiss!1248) #b00000000001111111111111111111111) (= (mask!9171 thiss!1248) #b00000000011111111111111111111111) (= (mask!9171 thiss!1248) #b00000000111111111111111111111111) (= (mask!9171 thiss!1248) #b00000001111111111111111111111111) (= (mask!9171 thiss!1248) #b00000011111111111111111111111111) (= (mask!9171 thiss!1248) #b00000111111111111111111111111111) (= (mask!9171 thiss!1248) #b00001111111111111111111111111111) (= (mask!9171 thiss!1248) #b00011111111111111111111111111111) (= (mask!9171 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9171 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!192737 d!56525))

(declare-fun b!192882 () Bool)

(declare-fun e!126917 () ListLongMap!2455)

(declare-fun call!19477 () ListLongMap!2455)

(assert (=> b!192882 (= e!126917 (+!311 call!19477 (tuple2!3539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3773 thiss!1248))))))

(declare-fun b!192883 () Bool)

(declare-fun e!126920 () ListLongMap!2455)

(declare-fun call!19475 () ListLongMap!2455)

(assert (=> b!192883 (= e!126920 call!19475)))

(declare-fun b!192884 () Bool)

(declare-fun res!91130 () Bool)

(declare-fun e!126914 () Bool)

(assert (=> b!192884 (=> (not res!91130) (not e!126914))))

(declare-fun e!126921 () Bool)

(assert (=> b!192884 (= res!91130 e!126921)))

(declare-fun res!91135 () Bool)

(assert (=> b!192884 (=> res!91135 e!126921)))

(declare-fun e!126913 () Bool)

(assert (=> b!192884 (= res!91135 (not e!126913))))

(declare-fun res!91137 () Bool)

(assert (=> b!192884 (=> (not res!91137) (not e!126913))))

(assert (=> b!192884 (= res!91137 (bvslt #b00000000000000000000000000000000 (size!4175 (_keys!5918 thiss!1248))))))

(declare-fun b!192885 () Bool)

(declare-fun e!126919 () Bool)

(declare-fun e!126912 () Bool)

(assert (=> b!192885 (= e!126919 e!126912)))

(declare-fun res!91131 () Bool)

(declare-fun call!19476 () Bool)

(assert (=> b!192885 (= res!91131 call!19476)))

(assert (=> b!192885 (=> (not res!91131) (not e!126912))))

(declare-fun b!192886 () Bool)

(declare-fun lt!95975 () ListLongMap!2455)

(assert (=> b!192886 (= e!126912 (= (apply!184 lt!95975 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3773 thiss!1248)))))

(declare-fun b!192887 () Bool)

(declare-fun e!126922 () Unit!5832)

(declare-fun Unit!5840 () Unit!5832)

(assert (=> b!192887 (= e!126922 Unit!5840)))

(declare-fun b!192888 () Bool)

(assert (=> b!192888 (= e!126913 (validKeyInArray!0 (select (arr!3851 (_keys!5918 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192889 () Bool)

(assert (=> b!192889 (= e!126919 (not call!19476))))

(declare-fun b!192890 () Bool)

(declare-fun e!126910 () ListLongMap!2455)

(assert (=> b!192890 (= e!126910 call!19475)))

(declare-fun b!192891 () Bool)

(declare-fun e!126911 () Bool)

(assert (=> b!192891 (= e!126911 (validKeyInArray!0 (select (arr!3851 (_keys!5918 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19471 () Bool)

(declare-fun call!19478 () Bool)

(assert (=> bm!19471 (= call!19478 (contains!1361 lt!95975 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!34794 () Bool)

(declare-fun c!34793 () Bool)

(declare-fun call!19474 () ListLongMap!2455)

(declare-fun bm!19472 () Bool)

(declare-fun call!19480 () ListLongMap!2455)

(declare-fun call!19479 () ListLongMap!2455)

(assert (=> bm!19472 (= call!19477 (+!311 (ite c!34793 call!19479 (ite c!34794 call!19474 call!19480)) (ite (or c!34793 c!34794) (tuple2!3539 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3773 thiss!1248)) (tuple2!3539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3773 thiss!1248)))))))

(declare-fun b!192892 () Bool)

(declare-fun e!126916 () Bool)

(assert (=> b!192892 (= e!126916 (not call!19478))))

(declare-fun b!192893 () Bool)

(assert (=> b!192893 (= e!126917 e!126920)))

(assert (=> b!192893 (= c!34794 (and (not (= (bvand (extraKeys!3669 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3669 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19473 () Bool)

(assert (=> bm!19473 (= call!19479 (getCurrentListMapNoExtraKeys!217 (_keys!5918 thiss!1248) (array!8180 (store (arr!3852 (_values!3915 thiss!1248)) (index!4903 lt!95838) (ValueCellFull!1890 v!309)) (size!4176 (_values!3915 thiss!1248))) (mask!9171 thiss!1248) (extraKeys!3669 thiss!1248) (zeroValue!3773 thiss!1248) (minValue!3773 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3932 thiss!1248)))))

(declare-fun bm!19474 () Bool)

(assert (=> bm!19474 (= call!19476 (contains!1361 lt!95975 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!192894 () Bool)

(assert (=> b!192894 (= e!126914 e!126916)))

(declare-fun c!34795 () Bool)

(assert (=> b!192894 (= c!34795 (not (= (bvand (extraKeys!3669 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19475 () Bool)

(assert (=> bm!19475 (= call!19475 call!19477)))

(declare-fun b!192895 () Bool)

(declare-fun e!126918 () Bool)

(assert (=> b!192895 (= e!126918 (= (apply!184 lt!95975 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3773 thiss!1248)))))

(declare-fun b!192896 () Bool)

(declare-fun lt!95971 () Unit!5832)

(assert (=> b!192896 (= e!126922 lt!95971)))

(declare-fun lt!95981 () ListLongMap!2455)

(assert (=> b!192896 (= lt!95981 (getCurrentListMapNoExtraKeys!217 (_keys!5918 thiss!1248) (array!8180 (store (arr!3852 (_values!3915 thiss!1248)) (index!4903 lt!95838) (ValueCellFull!1890 v!309)) (size!4176 (_values!3915 thiss!1248))) (mask!9171 thiss!1248) (extraKeys!3669 thiss!1248) (zeroValue!3773 thiss!1248) (minValue!3773 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3932 thiss!1248)))))

(declare-fun lt!95973 () (_ BitVec 64))

(assert (=> b!192896 (= lt!95973 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95988 () (_ BitVec 64))

(assert (=> b!192896 (= lt!95988 (select (arr!3851 (_keys!5918 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95984 () Unit!5832)

(assert (=> b!192896 (= lt!95984 (addStillContains!160 lt!95981 lt!95973 (zeroValue!3773 thiss!1248) lt!95988))))

(assert (=> b!192896 (contains!1361 (+!311 lt!95981 (tuple2!3539 lt!95973 (zeroValue!3773 thiss!1248))) lt!95988)))

(declare-fun lt!95970 () Unit!5832)

(assert (=> b!192896 (= lt!95970 lt!95984)))

(declare-fun lt!95982 () ListLongMap!2455)

(assert (=> b!192896 (= lt!95982 (getCurrentListMapNoExtraKeys!217 (_keys!5918 thiss!1248) (array!8180 (store (arr!3852 (_values!3915 thiss!1248)) (index!4903 lt!95838) (ValueCellFull!1890 v!309)) (size!4176 (_values!3915 thiss!1248))) (mask!9171 thiss!1248) (extraKeys!3669 thiss!1248) (zeroValue!3773 thiss!1248) (minValue!3773 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3932 thiss!1248)))))

(declare-fun lt!95974 () (_ BitVec 64))

(assert (=> b!192896 (= lt!95974 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95990 () (_ BitVec 64))

(assert (=> b!192896 (= lt!95990 (select (arr!3851 (_keys!5918 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95972 () Unit!5832)

(assert (=> b!192896 (= lt!95972 (addApplyDifferent!160 lt!95982 lt!95974 (minValue!3773 thiss!1248) lt!95990))))

(assert (=> b!192896 (= (apply!184 (+!311 lt!95982 (tuple2!3539 lt!95974 (minValue!3773 thiss!1248))) lt!95990) (apply!184 lt!95982 lt!95990))))

(declare-fun lt!95976 () Unit!5832)

(assert (=> b!192896 (= lt!95976 lt!95972)))

(declare-fun lt!95989 () ListLongMap!2455)

(assert (=> b!192896 (= lt!95989 (getCurrentListMapNoExtraKeys!217 (_keys!5918 thiss!1248) (array!8180 (store (arr!3852 (_values!3915 thiss!1248)) (index!4903 lt!95838) (ValueCellFull!1890 v!309)) (size!4176 (_values!3915 thiss!1248))) (mask!9171 thiss!1248) (extraKeys!3669 thiss!1248) (zeroValue!3773 thiss!1248) (minValue!3773 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3932 thiss!1248)))))

(declare-fun lt!95977 () (_ BitVec 64))

(assert (=> b!192896 (= lt!95977 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95978 () (_ BitVec 64))

(assert (=> b!192896 (= lt!95978 (select (arr!3851 (_keys!5918 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95985 () Unit!5832)

(assert (=> b!192896 (= lt!95985 (addApplyDifferent!160 lt!95989 lt!95977 (zeroValue!3773 thiss!1248) lt!95978))))

(assert (=> b!192896 (= (apply!184 (+!311 lt!95989 (tuple2!3539 lt!95977 (zeroValue!3773 thiss!1248))) lt!95978) (apply!184 lt!95989 lt!95978))))

(declare-fun lt!95991 () Unit!5832)

(assert (=> b!192896 (= lt!95991 lt!95985)))

(declare-fun lt!95979 () ListLongMap!2455)

(assert (=> b!192896 (= lt!95979 (getCurrentListMapNoExtraKeys!217 (_keys!5918 thiss!1248) (array!8180 (store (arr!3852 (_values!3915 thiss!1248)) (index!4903 lt!95838) (ValueCellFull!1890 v!309)) (size!4176 (_values!3915 thiss!1248))) (mask!9171 thiss!1248) (extraKeys!3669 thiss!1248) (zeroValue!3773 thiss!1248) (minValue!3773 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3932 thiss!1248)))))

(declare-fun lt!95980 () (_ BitVec 64))

(assert (=> b!192896 (= lt!95980 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95987 () (_ BitVec 64))

(assert (=> b!192896 (= lt!95987 (select (arr!3851 (_keys!5918 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!192896 (= lt!95971 (addApplyDifferent!160 lt!95979 lt!95980 (minValue!3773 thiss!1248) lt!95987))))

(assert (=> b!192896 (= (apply!184 (+!311 lt!95979 (tuple2!3539 lt!95980 (minValue!3773 thiss!1248))) lt!95987) (apply!184 lt!95979 lt!95987))))

(declare-fun b!192897 () Bool)

(declare-fun c!34791 () Bool)

(assert (=> b!192897 (= c!34791 (and (not (= (bvand (extraKeys!3669 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3669 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!192897 (= e!126920 e!126910)))

(declare-fun b!192898 () Bool)

(declare-fun res!91138 () Bool)

(assert (=> b!192898 (=> (not res!91138) (not e!126914))))

(assert (=> b!192898 (= res!91138 e!126919)))

(declare-fun c!34792 () Bool)

(assert (=> b!192898 (= c!34792 (not (= (bvand (extraKeys!3669 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!192899 () Bool)

(assert (=> b!192899 (= e!126916 e!126918)))

(declare-fun res!91132 () Bool)

(assert (=> b!192899 (= res!91132 call!19478)))

(assert (=> b!192899 (=> (not res!91132) (not e!126918))))

(declare-fun b!192900 () Bool)

(assert (=> b!192900 (= e!126910 call!19480)))

(declare-fun d!56527 () Bool)

(assert (=> d!56527 e!126914))

(declare-fun res!91133 () Bool)

(assert (=> d!56527 (=> (not res!91133) (not e!126914))))

(assert (=> d!56527 (= res!91133 (or (bvsge #b00000000000000000000000000000000 (size!4175 (_keys!5918 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4175 (_keys!5918 thiss!1248))))))))

(declare-fun lt!95983 () ListLongMap!2455)

(assert (=> d!56527 (= lt!95975 lt!95983)))

(declare-fun lt!95986 () Unit!5832)

(assert (=> d!56527 (= lt!95986 e!126922)))

(declare-fun c!34796 () Bool)

(assert (=> d!56527 (= c!34796 e!126911)))

(declare-fun res!91136 () Bool)

(assert (=> d!56527 (=> (not res!91136) (not e!126911))))

(assert (=> d!56527 (= res!91136 (bvslt #b00000000000000000000000000000000 (size!4175 (_keys!5918 thiss!1248))))))

(assert (=> d!56527 (= lt!95983 e!126917)))

(assert (=> d!56527 (= c!34793 (and (not (= (bvand (extraKeys!3669 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3669 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56527 (validMask!0 (mask!9171 thiss!1248))))

(assert (=> d!56527 (= (getCurrentListMap!891 (_keys!5918 thiss!1248) (array!8180 (store (arr!3852 (_values!3915 thiss!1248)) (index!4903 lt!95838) (ValueCellFull!1890 v!309)) (size!4176 (_values!3915 thiss!1248))) (mask!9171 thiss!1248) (extraKeys!3669 thiss!1248) (zeroValue!3773 thiss!1248) (minValue!3773 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3932 thiss!1248)) lt!95975)))

(declare-fun bm!19476 () Bool)

(assert (=> bm!19476 (= call!19474 call!19479)))

(declare-fun bm!19477 () Bool)

(assert (=> bm!19477 (= call!19480 call!19474)))

(declare-fun e!126915 () Bool)

(declare-fun b!192901 () Bool)

(assert (=> b!192901 (= e!126915 (= (apply!184 lt!95975 (select (arr!3851 (_keys!5918 thiss!1248)) #b00000000000000000000000000000000)) (get!2225 (select (arr!3852 (array!8180 (store (arr!3852 (_values!3915 thiss!1248)) (index!4903 lt!95838) (ValueCellFull!1890 v!309)) (size!4176 (_values!3915 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!527 (defaultEntry!3932 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!192901 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4176 (array!8180 (store (arr!3852 (_values!3915 thiss!1248)) (index!4903 lt!95838) (ValueCellFull!1890 v!309)) (size!4176 (_values!3915 thiss!1248))))))))

(assert (=> b!192901 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4175 (_keys!5918 thiss!1248))))))

(declare-fun b!192902 () Bool)

(assert (=> b!192902 (= e!126921 e!126915)))

(declare-fun res!91134 () Bool)

(assert (=> b!192902 (=> (not res!91134) (not e!126915))))

(assert (=> b!192902 (= res!91134 (contains!1361 lt!95975 (select (arr!3851 (_keys!5918 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!192902 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4175 (_keys!5918 thiss!1248))))))

(assert (= (and d!56527 c!34793) b!192882))

(assert (= (and d!56527 (not c!34793)) b!192893))

(assert (= (and b!192893 c!34794) b!192883))

(assert (= (and b!192893 (not c!34794)) b!192897))

(assert (= (and b!192897 c!34791) b!192890))

(assert (= (and b!192897 (not c!34791)) b!192900))

(assert (= (or b!192890 b!192900) bm!19477))

(assert (= (or b!192883 bm!19477) bm!19476))

(assert (= (or b!192883 b!192890) bm!19475))

(assert (= (or b!192882 bm!19476) bm!19473))

(assert (= (or b!192882 bm!19475) bm!19472))

(assert (= (and d!56527 res!91136) b!192891))

(assert (= (and d!56527 c!34796) b!192896))

(assert (= (and d!56527 (not c!34796)) b!192887))

(assert (= (and d!56527 res!91133) b!192884))

(assert (= (and b!192884 res!91137) b!192888))

(assert (= (and b!192884 (not res!91135)) b!192902))

(assert (= (and b!192902 res!91134) b!192901))

(assert (= (and b!192884 res!91130) b!192898))

(assert (= (and b!192898 c!34792) b!192885))

(assert (= (and b!192898 (not c!34792)) b!192889))

(assert (= (and b!192885 res!91131) b!192886))

(assert (= (or b!192885 b!192889) bm!19474))

(assert (= (and b!192898 res!91138) b!192894))

(assert (= (and b!192894 c!34795) b!192899))

(assert (= (and b!192894 (not c!34795)) b!192892))

(assert (= (and b!192899 res!91132) b!192895))

(assert (= (or b!192899 b!192892) bm!19471))

(declare-fun b_lambda!7449 () Bool)

(assert (=> (not b_lambda!7449) (not b!192901)))

(assert (=> b!192901 t!7351))

(declare-fun b_and!11399 () Bool)

(assert (= b_and!11397 (and (=> t!7351 result!4915) b_and!11399)))

(declare-fun m!219731 () Bool)

(assert (=> bm!19474 m!219731))

(declare-fun m!219733 () Bool)

(assert (=> b!192896 m!219733))

(declare-fun m!219735 () Bool)

(assert (=> b!192896 m!219735))

(declare-fun m!219737 () Bool)

(assert (=> b!192896 m!219737))

(declare-fun m!219739 () Bool)

(assert (=> b!192896 m!219739))

(declare-fun m!219741 () Bool)

(assert (=> b!192896 m!219741))

(assert (=> b!192896 m!219739))

(declare-fun m!219743 () Bool)

(assert (=> b!192896 m!219743))

(declare-fun m!219745 () Bool)

(assert (=> b!192896 m!219745))

(declare-fun m!219747 () Bool)

(assert (=> b!192896 m!219747))

(declare-fun m!219749 () Bool)

(assert (=> b!192896 m!219749))

(declare-fun m!219751 () Bool)

(assert (=> b!192896 m!219751))

(declare-fun m!219753 () Bool)

(assert (=> b!192896 m!219753))

(declare-fun m!219755 () Bool)

(assert (=> b!192896 m!219755))

(assert (=> b!192896 m!219743))

(assert (=> b!192896 m!219751))

(declare-fun m!219757 () Bool)

(assert (=> b!192896 m!219757))

(assert (=> b!192896 m!219737))

(declare-fun m!219759 () Bool)

(assert (=> b!192896 m!219759))

(assert (=> b!192896 m!219703))

(declare-fun m!219761 () Bool)

(assert (=> b!192896 m!219761))

(declare-fun m!219763 () Bool)

(assert (=> b!192896 m!219763))

(assert (=> b!192902 m!219703))

(assert (=> b!192902 m!219703))

(declare-fun m!219765 () Bool)

(assert (=> b!192902 m!219765))

(assert (=> d!56527 m!219591))

(declare-fun m!219767 () Bool)

(assert (=> b!192901 m!219767))

(assert (=> b!192901 m!219703))

(declare-fun m!219769 () Bool)

(assert (=> b!192901 m!219769))

(assert (=> b!192901 m!219767))

(assert (=> b!192901 m!219715))

(declare-fun m!219771 () Bool)

(assert (=> b!192901 m!219771))

(assert (=> b!192901 m!219715))

(assert (=> b!192901 m!219703))

(declare-fun m!219773 () Bool)

(assert (=> b!192882 m!219773))

(declare-fun m!219775 () Bool)

(assert (=> bm!19471 m!219775))

(declare-fun m!219777 () Bool)

(assert (=> bm!19472 m!219777))

(assert (=> bm!19473 m!219735))

(declare-fun m!219779 () Bool)

(assert (=> b!192886 m!219779))

(declare-fun m!219781 () Bool)

(assert (=> b!192895 m!219781))

(assert (=> b!192888 m!219703))

(assert (=> b!192888 m!219703))

(assert (=> b!192888 m!219729))

(assert (=> b!192891 m!219703))

(assert (=> b!192891 m!219703))

(assert (=> b!192891 m!219729))

(assert (=> b!192737 d!56527))

(declare-fun d!56529 () Bool)

(assert (=> d!56529 (= (array_inv!2497 (_keys!5918 thiss!1248)) (bvsge (size!4175 (_keys!5918 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!192734 d!56529))

(declare-fun d!56531 () Bool)

(assert (=> d!56531 (= (array_inv!2498 (_values!3915 thiss!1248)) (bvsge (size!4176 (_values!3915 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!192734 d!56531))

(declare-fun b!192919 () Bool)

(declare-fun res!91150 () Bool)

(declare-fun e!126932 () Bool)

(assert (=> b!192919 (=> (not res!91150) (not e!126932))))

(declare-fun call!19486 () Bool)

(assert (=> b!192919 (= res!91150 call!19486)))

(declare-fun e!126933 () Bool)

(assert (=> b!192919 (= e!126933 e!126932)))

(declare-fun b!192920 () Bool)

(declare-fun e!126934 () Bool)

(declare-fun call!19485 () Bool)

(assert (=> b!192920 (= e!126934 (not call!19485))))

(declare-fun b!192921 () Bool)

(assert (=> b!192921 (= e!126932 (not call!19485))))

(declare-fun bm!19482 () Bool)

(declare-fun arrayContainsKey!0 (array!8177 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!19482 (= call!19485 (arrayContainsKey!0 (_keys!5918 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!192923 () Bool)

(declare-fun res!91148 () Bool)

(assert (=> b!192923 (=> (not res!91148) (not e!126932))))

(declare-fun lt!95996 () SeekEntryResult!683)

(assert (=> b!192923 (= res!91148 (= (select (arr!3851 (_keys!5918 thiss!1248)) (index!4905 lt!95996)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!192923 (and (bvsge (index!4905 lt!95996) #b00000000000000000000000000000000) (bvslt (index!4905 lt!95996) (size!4175 (_keys!5918 thiss!1248))))))

(declare-fun b!192924 () Bool)

(assert (=> b!192924 (and (bvsge (index!4902 lt!95996) #b00000000000000000000000000000000) (bvslt (index!4902 lt!95996) (size!4175 (_keys!5918 thiss!1248))))))

(declare-fun res!91149 () Bool)

(assert (=> b!192924 (= res!91149 (= (select (arr!3851 (_keys!5918 thiss!1248)) (index!4902 lt!95996)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!192924 (=> (not res!91149) (not e!126934))))

(declare-fun b!192925 () Bool)

(declare-fun e!126931 () Bool)

(assert (=> b!192925 (= e!126931 e!126933)))

(declare-fun c!34802 () Bool)

(assert (=> b!192925 (= c!34802 ((_ is MissingVacant!683) lt!95996))))

(declare-fun bm!19483 () Bool)

(declare-fun c!34801 () Bool)

(assert (=> bm!19483 (= call!19486 (inRange!0 (ite c!34801 (index!4902 lt!95996) (index!4905 lt!95996)) (mask!9171 thiss!1248)))))

(declare-fun b!192926 () Bool)

(assert (=> b!192926 (= e!126931 e!126934)))

(declare-fun res!91147 () Bool)

(assert (=> b!192926 (= res!91147 call!19486)))

(assert (=> b!192926 (=> (not res!91147) (not e!126934))))

(declare-fun d!56533 () Bool)

(assert (=> d!56533 e!126931))

(assert (=> d!56533 (= c!34801 ((_ is MissingZero!683) lt!95996))))

(assert (=> d!56533 (= lt!95996 (seekEntryOrOpen!0 key!828 (_keys!5918 thiss!1248) (mask!9171 thiss!1248)))))

(declare-fun lt!95997 () Unit!5832)

(declare-fun choose!1053 (array!8177 array!8179 (_ BitVec 32) (_ BitVec 32) V!5603 V!5603 (_ BitVec 64) Int) Unit!5832)

(assert (=> d!56533 (= lt!95997 (choose!1053 (_keys!5918 thiss!1248) (_values!3915 thiss!1248) (mask!9171 thiss!1248) (extraKeys!3669 thiss!1248) (zeroValue!3773 thiss!1248) (minValue!3773 thiss!1248) key!828 (defaultEntry!3932 thiss!1248)))))

(assert (=> d!56533 (validMask!0 (mask!9171 thiss!1248))))

(assert (=> d!56533 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!186 (_keys!5918 thiss!1248) (_values!3915 thiss!1248) (mask!9171 thiss!1248) (extraKeys!3669 thiss!1248) (zeroValue!3773 thiss!1248) (minValue!3773 thiss!1248) key!828 (defaultEntry!3932 thiss!1248)) lt!95997)))

(declare-fun b!192922 () Bool)

(assert (=> b!192922 (= e!126933 ((_ is Undefined!683) lt!95996))))

(assert (= (and d!56533 c!34801) b!192926))

(assert (= (and d!56533 (not c!34801)) b!192925))

(assert (= (and b!192926 res!91147) b!192924))

(assert (= (and b!192924 res!91149) b!192920))

(assert (= (and b!192925 c!34802) b!192919))

(assert (= (and b!192925 (not c!34802)) b!192922))

(assert (= (and b!192919 res!91150) b!192923))

(assert (= (and b!192923 res!91148) b!192921))

(assert (= (or b!192926 b!192919) bm!19483))

(assert (= (or b!192920 b!192921) bm!19482))

(declare-fun m!219783 () Bool)

(assert (=> b!192924 m!219783))

(assert (=> d!56533 m!219561))

(declare-fun m!219785 () Bool)

(assert (=> d!56533 m!219785))

(assert (=> d!56533 m!219591))

(declare-fun m!219787 () Bool)

(assert (=> bm!19483 m!219787))

(declare-fun m!219789 () Bool)

(assert (=> bm!19482 m!219789))

(declare-fun m!219791 () Bool)

(assert (=> b!192923 m!219791))

(assert (=> b!192738 d!56533))

(declare-fun d!56535 () Bool)

(declare-fun res!91157 () Bool)

(declare-fun e!126937 () Bool)

(assert (=> d!56535 (=> (not res!91157) (not e!126937))))

(declare-fun simpleValid!200 (LongMapFixedSize!2688) Bool)

(assert (=> d!56535 (= res!91157 (simpleValid!200 thiss!1248))))

(assert (=> d!56535 (= (valid!1103 thiss!1248) e!126937)))

(declare-fun b!192933 () Bool)

(declare-fun res!91158 () Bool)

(assert (=> b!192933 (=> (not res!91158) (not e!126937))))

(declare-fun arrayCountValidKeys!0 (array!8177 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!192933 (= res!91158 (= (arrayCountValidKeys!0 (_keys!5918 thiss!1248) #b00000000000000000000000000000000 (size!4175 (_keys!5918 thiss!1248))) (_size!1393 thiss!1248)))))

(declare-fun b!192934 () Bool)

(declare-fun res!91159 () Bool)

(assert (=> b!192934 (=> (not res!91159) (not e!126937))))

(assert (=> b!192934 (= res!91159 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5918 thiss!1248) (mask!9171 thiss!1248)))))

(declare-fun b!192935 () Bool)

(declare-datatypes ((List!2432 0))(
  ( (Nil!2429) (Cons!2428 (h!3069 (_ BitVec 64)) (t!7352 List!2432)) )
))
(declare-fun arrayNoDuplicates!0 (array!8177 (_ BitVec 32) List!2432) Bool)

(assert (=> b!192935 (= e!126937 (arrayNoDuplicates!0 (_keys!5918 thiss!1248) #b00000000000000000000000000000000 Nil!2429))))

(assert (= (and d!56535 res!91157) b!192933))

(assert (= (and b!192933 res!91158) b!192934))

(assert (= (and b!192934 res!91159) b!192935))

(declare-fun m!219793 () Bool)

(assert (=> d!56535 m!219793))

(declare-fun m!219795 () Bool)

(assert (=> b!192933 m!219795))

(assert (=> b!192934 m!219593))

(declare-fun m!219797 () Bool)

(assert (=> b!192935 m!219797))

(assert (=> start!19662 d!56535))

(declare-fun b!192944 () Bool)

(declare-fun e!126945 () Bool)

(declare-fun call!19489 () Bool)

(assert (=> b!192944 (= e!126945 call!19489)))

(declare-fun b!192945 () Bool)

(declare-fun e!126944 () Bool)

(declare-fun e!126946 () Bool)

(assert (=> b!192945 (= e!126944 e!126946)))

(declare-fun c!34805 () Bool)

(assert (=> b!192945 (= c!34805 (validKeyInArray!0 (select (arr!3851 (_keys!5918 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19486 () Bool)

(assert (=> bm!19486 (= call!19489 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5918 thiss!1248) (mask!9171 thiss!1248)))))

(declare-fun b!192946 () Bool)

(assert (=> b!192946 (= e!126946 e!126945)))

(declare-fun lt!96005 () (_ BitVec 64))

(assert (=> b!192946 (= lt!96005 (select (arr!3851 (_keys!5918 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96006 () Unit!5832)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8177 (_ BitVec 64) (_ BitVec 32)) Unit!5832)

(assert (=> b!192946 (= lt!96006 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5918 thiss!1248) lt!96005 #b00000000000000000000000000000000))))

(assert (=> b!192946 (arrayContainsKey!0 (_keys!5918 thiss!1248) lt!96005 #b00000000000000000000000000000000)))

(declare-fun lt!96004 () Unit!5832)

(assert (=> b!192946 (= lt!96004 lt!96006)))

(declare-fun res!91165 () Bool)

(assert (=> b!192946 (= res!91165 (= (seekEntryOrOpen!0 (select (arr!3851 (_keys!5918 thiss!1248)) #b00000000000000000000000000000000) (_keys!5918 thiss!1248) (mask!9171 thiss!1248)) (Found!683 #b00000000000000000000000000000000)))))

(assert (=> b!192946 (=> (not res!91165) (not e!126945))))

(declare-fun b!192947 () Bool)

(assert (=> b!192947 (= e!126946 call!19489)))

(declare-fun d!56537 () Bool)

(declare-fun res!91164 () Bool)

(assert (=> d!56537 (=> res!91164 e!126944)))

(assert (=> d!56537 (= res!91164 (bvsge #b00000000000000000000000000000000 (size!4175 (_keys!5918 thiss!1248))))))

(assert (=> d!56537 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5918 thiss!1248) (mask!9171 thiss!1248)) e!126944)))

(assert (= (and d!56537 (not res!91164)) b!192945))

(assert (= (and b!192945 c!34805) b!192946))

(assert (= (and b!192945 (not c!34805)) b!192947))

(assert (= (and b!192946 res!91165) b!192944))

(assert (= (or b!192944 b!192947) bm!19486))

(assert (=> b!192945 m!219703))

(assert (=> b!192945 m!219703))

(assert (=> b!192945 m!219729))

(declare-fun m!219799 () Bool)

(assert (=> bm!19486 m!219799))

(assert (=> b!192946 m!219703))

(declare-fun m!219801 () Bool)

(assert (=> b!192946 m!219801))

(declare-fun m!219803 () Bool)

(assert (=> b!192946 m!219803))

(assert (=> b!192946 m!219703))

(declare-fun m!219805 () Bool)

(assert (=> b!192946 m!219805))

(assert (=> b!192735 d!56537))

(declare-fun mapNonEmpty!7727 () Bool)

(declare-fun mapRes!7727 () Bool)

(declare-fun tp!16952 () Bool)

(declare-fun e!126952 () Bool)

(assert (=> mapNonEmpty!7727 (= mapRes!7727 (and tp!16952 e!126952))))

(declare-fun mapValue!7727 () ValueCell!1890)

(declare-fun mapRest!7727 () (Array (_ BitVec 32) ValueCell!1890))

(declare-fun mapKey!7727 () (_ BitVec 32))

(assert (=> mapNonEmpty!7727 (= mapRest!7721 (store mapRest!7727 mapKey!7727 mapValue!7727))))

(declare-fun condMapEmpty!7727 () Bool)

(declare-fun mapDefault!7727 () ValueCell!1890)

(assert (=> mapNonEmpty!7721 (= condMapEmpty!7727 (= mapRest!7721 ((as const (Array (_ BitVec 32) ValueCell!1890)) mapDefault!7727)))))

(declare-fun e!126951 () Bool)

(assert (=> mapNonEmpty!7721 (= tp!16942 (and e!126951 mapRes!7727))))

(declare-fun mapIsEmpty!7727 () Bool)

(assert (=> mapIsEmpty!7727 mapRes!7727))

(declare-fun b!192955 () Bool)

(assert (=> b!192955 (= e!126951 tp_is_empty!4467)))

(declare-fun b!192954 () Bool)

(assert (=> b!192954 (= e!126952 tp_is_empty!4467)))

(assert (= (and mapNonEmpty!7721 condMapEmpty!7727) mapIsEmpty!7727))

(assert (= (and mapNonEmpty!7721 (not condMapEmpty!7727)) mapNonEmpty!7727))

(assert (= (and mapNonEmpty!7727 ((_ is ValueCellFull!1890) mapValue!7727)) b!192954))

(assert (= (and mapNonEmpty!7721 ((_ is ValueCellFull!1890) mapDefault!7727)) b!192955))

(declare-fun m!219807 () Bool)

(assert (=> mapNonEmpty!7727 m!219807))

(declare-fun b_lambda!7451 () Bool)

(assert (= b_lambda!7449 (or (and b!192734 b_free!4695) b_lambda!7451)))

(declare-fun b_lambda!7453 () Bool)

(assert (= b_lambda!7447 (or (and b!192734 b_free!4695) b_lambda!7453)))

(check-sat (not b_lambda!7451) (not d!56517) (not bm!19483) (not b!192873) (not bm!19464) (not d!56523) (not d!56513) (not b!192888) (not b!192787) (not bm!19471) (not mapNonEmpty!7727) (not b!192934) (not b!192896) (not bm!19473) (not b!192810) (not b!192815) (not bm!19465) (not d!56533) tp_is_empty!4467 (not d!56535) (not d!56521) (not bm!19466) b_and!11399 (not b!192816) (not b!192865) (not b!192891) (not bm!19467) (not b!192801) (not bm!19482) (not bm!19472) (not b!192872) (not b!192808) (not b!192797) (not b!192878) (not d!56519) (not b!192935) (not b_next!4695) (not b!192886) (not bm!19474) (not b!192895) (not b_lambda!7453) (not b!192868) (not b!192946) (not b!192945) (not b!192882) (not d!56511) (not d!56527) (not b!192901) (not b!192863) (not b!192859) (not b!192879) (not b!192933) (not bm!19486) (not b!192902))
(check-sat b_and!11399 (not b_next!4695))
