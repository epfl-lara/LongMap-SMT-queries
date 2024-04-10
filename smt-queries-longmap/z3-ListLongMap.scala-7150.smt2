; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90910 () Bool)

(assert start!90910)

(declare-fun b!1038839 () Bool)

(declare-fun b_free!20955 () Bool)

(declare-fun b_next!20955 () Bool)

(assert (=> b!1038839 (= b_free!20955 (not b_next!20955))))

(declare-fun tp!74033 () Bool)

(declare-fun b_and!33487 () Bool)

(assert (=> b!1038839 (= tp!74033 b_and!33487)))

(declare-fun mapNonEmpty!38563 () Bool)

(declare-fun mapRes!38563 () Bool)

(declare-fun tp!74032 () Bool)

(declare-fun e!587864 () Bool)

(assert (=> mapNonEmpty!38563 (= mapRes!38563 (and tp!74032 e!587864))))

(declare-datatypes ((V!37773 0))(
  ( (V!37774 (val!12388 Int)) )
))
(declare-datatypes ((ValueCell!11634 0))(
  ( (ValueCellFull!11634 (v!14975 V!37773)) (EmptyCell!11634) )
))
(declare-fun mapRest!38563 () (Array (_ BitVec 32) ValueCell!11634))

(declare-fun mapValue!38563 () ValueCell!11634)

(declare-fun mapKey!38563 () (_ BitVec 32))

(declare-datatypes ((array!65468 0))(
  ( (array!65469 (arr!31509 (Array (_ BitVec 32) (_ BitVec 64))) (size!32040 (_ BitVec 32))) )
))
(declare-datatypes ((array!65470 0))(
  ( (array!65471 (arr!31510 (Array (_ BitVec 32) ValueCell!11634)) (size!32041 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5862 0))(
  ( (LongMapFixedSize!5863 (defaultEntry!6313 Int) (mask!30263 (_ BitVec 32)) (extraKeys!6041 (_ BitVec 32)) (zeroValue!6147 V!37773) (minValue!6147 V!37773) (_size!2986 (_ BitVec 32)) (_keys!11519 array!65468) (_values!6336 array!65470) (_vacant!2986 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5862)

(assert (=> mapNonEmpty!38563 (= (arr!31510 (_values!6336 thiss!1427)) (store mapRest!38563 mapKey!38563 mapValue!38563))))

(declare-fun mapIsEmpty!38563 () Bool)

(assert (=> mapIsEmpty!38563 mapRes!38563))

(declare-fun b!1038834 () Bool)

(declare-fun e!587858 () Bool)

(declare-datatypes ((SeekEntryResult!9775 0))(
  ( (MissingZero!9775 (index!41471 (_ BitVec 32))) (Found!9775 (index!41472 (_ BitVec 32))) (Intermediate!9775 (undefined!10587 Bool) (index!41473 (_ BitVec 32)) (x!92703 (_ BitVec 32))) (Undefined!9775) (MissingVacant!9775 (index!41474 (_ BitVec 32))) )
))
(declare-fun lt!457884 () SeekEntryResult!9775)

(assert (=> b!1038834 (= e!587858 (or (not (= (size!32040 (_keys!11519 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30263 thiss!1427)))) (bvsge (index!41472 lt!457884) #b00000000000000000000000000000000)))))

(declare-fun b!1038835 () Bool)

(declare-fun tp_is_empty!24675 () Bool)

(assert (=> b!1038835 (= e!587864 tp_is_empty!24675)))

(declare-fun b!1038836 () Bool)

(declare-fun e!587863 () Bool)

(assert (=> b!1038836 (= e!587863 (not e!587858))))

(declare-fun res!692903 () Bool)

(assert (=> b!1038836 (=> res!692903 e!587858)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1038836 (= res!692903 (not (validMask!0 (mask!30263 thiss!1427))))))

(declare-fun lt!457883 () array!65468)

(declare-datatypes ((List!21940 0))(
  ( (Nil!21937) (Cons!21936 (h!23140 (_ BitVec 64)) (t!31154 List!21940)) )
))
(declare-fun arrayNoDuplicates!0 (array!65468 (_ BitVec 32) List!21940) Bool)

(assert (=> b!1038836 (arrayNoDuplicates!0 lt!457883 #b00000000000000000000000000000000 Nil!21937)))

(declare-datatypes ((Unit!33983 0))(
  ( (Unit!33984) )
))
(declare-fun lt!457882 () Unit!33983)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65468 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21940) Unit!33983)

(assert (=> b!1038836 (= lt!457882 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11519 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41472 lt!457884) #b00000000000000000000000000000000 Nil!21937))))

(declare-fun arrayCountValidKeys!0 (array!65468 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1038836 (= (arrayCountValidKeys!0 lt!457883 #b00000000000000000000000000000000 (size!32040 (_keys!11519 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11519 thiss!1427) #b00000000000000000000000000000000 (size!32040 (_keys!11519 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1038836 (= lt!457883 (array!65469 (store (arr!31509 (_keys!11519 thiss!1427)) (index!41472 lt!457884) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32040 (_keys!11519 thiss!1427))))))

(declare-fun lt!457881 () Unit!33983)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65468 (_ BitVec 32) (_ BitVec 64)) Unit!33983)

(assert (=> b!1038836 (= lt!457881 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11519 thiss!1427) (index!41472 lt!457884) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1038837 () Bool)

(declare-fun e!587860 () Bool)

(declare-fun e!587862 () Bool)

(assert (=> b!1038837 (= e!587860 (and e!587862 mapRes!38563))))

(declare-fun condMapEmpty!38563 () Bool)

(declare-fun mapDefault!38563 () ValueCell!11634)

(assert (=> b!1038837 (= condMapEmpty!38563 (= (arr!31510 (_values!6336 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11634)) mapDefault!38563)))))

(declare-fun res!692905 () Bool)

(declare-fun e!587861 () Bool)

(assert (=> start!90910 (=> (not res!692905) (not e!587861))))

(declare-fun valid!2204 (LongMapFixedSize!5862) Bool)

(assert (=> start!90910 (= res!692905 (valid!2204 thiss!1427))))

(assert (=> start!90910 e!587861))

(declare-fun e!587857 () Bool)

(assert (=> start!90910 e!587857))

(assert (=> start!90910 true))

(declare-fun b!1038838 () Bool)

(assert (=> b!1038838 (= e!587862 tp_is_empty!24675)))

(declare-fun array_inv!24363 (array!65468) Bool)

(declare-fun array_inv!24364 (array!65470) Bool)

(assert (=> b!1038839 (= e!587857 (and tp!74033 tp_is_empty!24675 (array_inv!24363 (_keys!11519 thiss!1427)) (array_inv!24364 (_values!6336 thiss!1427)) e!587860))))

(declare-fun b!1038840 () Bool)

(assert (=> b!1038840 (= e!587861 e!587863)))

(declare-fun res!692904 () Bool)

(assert (=> b!1038840 (=> (not res!692904) (not e!587863))))

(get-info :version)

(assert (=> b!1038840 (= res!692904 ((_ is Found!9775) lt!457884))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65468 (_ BitVec 32)) SeekEntryResult!9775)

(assert (=> b!1038840 (= lt!457884 (seekEntry!0 key!909 (_keys!11519 thiss!1427) (mask!30263 thiss!1427)))))

(declare-fun b!1038841 () Bool)

(declare-fun res!692902 () Bool)

(assert (=> b!1038841 (=> (not res!692902) (not e!587861))))

(assert (=> b!1038841 (= res!692902 (not (= key!909 (bvneg key!909))))))

(assert (= (and start!90910 res!692905) b!1038841))

(assert (= (and b!1038841 res!692902) b!1038840))

(assert (= (and b!1038840 res!692904) b!1038836))

(assert (= (and b!1038836 (not res!692903)) b!1038834))

(assert (= (and b!1038837 condMapEmpty!38563) mapIsEmpty!38563))

(assert (= (and b!1038837 (not condMapEmpty!38563)) mapNonEmpty!38563))

(assert (= (and mapNonEmpty!38563 ((_ is ValueCellFull!11634) mapValue!38563)) b!1038835))

(assert (= (and b!1038837 ((_ is ValueCellFull!11634) mapDefault!38563)) b!1038838))

(assert (= b!1038839 b!1038837))

(assert (= start!90910 b!1038839))

(declare-fun m!958677 () Bool)

(assert (=> b!1038836 m!958677))

(declare-fun m!958679 () Bool)

(assert (=> b!1038836 m!958679))

(declare-fun m!958681 () Bool)

(assert (=> b!1038836 m!958681))

(declare-fun m!958683 () Bool)

(assert (=> b!1038836 m!958683))

(declare-fun m!958685 () Bool)

(assert (=> b!1038836 m!958685))

(declare-fun m!958687 () Bool)

(assert (=> b!1038836 m!958687))

(declare-fun m!958689 () Bool)

(assert (=> b!1038836 m!958689))

(declare-fun m!958691 () Bool)

(assert (=> mapNonEmpty!38563 m!958691))

(declare-fun m!958693 () Bool)

(assert (=> b!1038839 m!958693))

(declare-fun m!958695 () Bool)

(assert (=> b!1038839 m!958695))

(declare-fun m!958697 () Bool)

(assert (=> start!90910 m!958697))

(declare-fun m!958699 () Bool)

(assert (=> b!1038840 m!958699))

(check-sat (not b!1038839) tp_is_empty!24675 b_and!33487 (not b_next!20955) (not start!90910) (not b!1038836) (not b!1038840) (not mapNonEmpty!38563))
(check-sat b_and!33487 (not b_next!20955))
(get-model)

(declare-fun d!125413 () Bool)

(declare-fun res!692924 () Bool)

(declare-fun e!587891 () Bool)

(assert (=> d!125413 (=> (not res!692924) (not e!587891))))

(declare-fun simpleValid!424 (LongMapFixedSize!5862) Bool)

(assert (=> d!125413 (= res!692924 (simpleValid!424 thiss!1427))))

(assert (=> d!125413 (= (valid!2204 thiss!1427) e!587891)))

(declare-fun b!1038872 () Bool)

(declare-fun res!692925 () Bool)

(assert (=> b!1038872 (=> (not res!692925) (not e!587891))))

(assert (=> b!1038872 (= res!692925 (= (arrayCountValidKeys!0 (_keys!11519 thiss!1427) #b00000000000000000000000000000000 (size!32040 (_keys!11519 thiss!1427))) (_size!2986 thiss!1427)))))

(declare-fun b!1038873 () Bool)

(declare-fun res!692926 () Bool)

(assert (=> b!1038873 (=> (not res!692926) (not e!587891))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65468 (_ BitVec 32)) Bool)

(assert (=> b!1038873 (= res!692926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11519 thiss!1427) (mask!30263 thiss!1427)))))

(declare-fun b!1038874 () Bool)

(assert (=> b!1038874 (= e!587891 (arrayNoDuplicates!0 (_keys!11519 thiss!1427) #b00000000000000000000000000000000 Nil!21937))))

(assert (= (and d!125413 res!692924) b!1038872))

(assert (= (and b!1038872 res!692925) b!1038873))

(assert (= (and b!1038873 res!692926) b!1038874))

(declare-fun m!958725 () Bool)

(assert (=> d!125413 m!958725))

(assert (=> b!1038872 m!958683))

(declare-fun m!958727 () Bool)

(assert (=> b!1038873 m!958727))

(declare-fun m!958729 () Bool)

(assert (=> b!1038874 m!958729))

(assert (=> start!90910 d!125413))

(declare-fun d!125415 () Bool)

(declare-fun e!587894 () Bool)

(assert (=> d!125415 e!587894))

(declare-fun res!692929 () Bool)

(assert (=> d!125415 (=> (not res!692929) (not e!587894))))

(assert (=> d!125415 (= res!692929 (and (bvsge (index!41472 lt!457884) #b00000000000000000000000000000000) (bvslt (index!41472 lt!457884) (size!32040 (_keys!11519 thiss!1427)))))))

(declare-fun lt!457899 () Unit!33983)

(declare-fun choose!53 (array!65468 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21940) Unit!33983)

(assert (=> d!125415 (= lt!457899 (choose!53 (_keys!11519 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41472 lt!457884) #b00000000000000000000000000000000 Nil!21937))))

(assert (=> d!125415 (bvslt (size!32040 (_keys!11519 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125415 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11519 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41472 lt!457884) #b00000000000000000000000000000000 Nil!21937) lt!457899)))

(declare-fun b!1038877 () Bool)

(assert (=> b!1038877 (= e!587894 (arrayNoDuplicates!0 (array!65469 (store (arr!31509 (_keys!11519 thiss!1427)) (index!41472 lt!457884) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32040 (_keys!11519 thiss!1427))) #b00000000000000000000000000000000 Nil!21937))))

(assert (= (and d!125415 res!692929) b!1038877))

(declare-fun m!958731 () Bool)

(assert (=> d!125415 m!958731))

(assert (=> b!1038877 m!958681))

(declare-fun m!958733 () Bool)

(assert (=> b!1038877 m!958733))

(assert (=> b!1038836 d!125415))

(declare-fun b!1038886 () Bool)

(declare-fun e!587900 () (_ BitVec 32))

(declare-fun e!587899 () (_ BitVec 32))

(assert (=> b!1038886 (= e!587900 e!587899)))

(declare-fun c!105273 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1038886 (= c!105273 (validKeyInArray!0 (select (arr!31509 lt!457883) #b00000000000000000000000000000000)))))

(declare-fun bm!43964 () Bool)

(declare-fun call!43967 () (_ BitVec 32))

(assert (=> bm!43964 (= call!43967 (arrayCountValidKeys!0 lt!457883 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32040 (_keys!11519 thiss!1427))))))

(declare-fun b!1038887 () Bool)

(assert (=> b!1038887 (= e!587900 #b00000000000000000000000000000000)))

(declare-fun b!1038888 () Bool)

(assert (=> b!1038888 (= e!587899 (bvadd #b00000000000000000000000000000001 call!43967))))

(declare-fun d!125417 () Bool)

(declare-fun lt!457902 () (_ BitVec 32))

(assert (=> d!125417 (and (bvsge lt!457902 #b00000000000000000000000000000000) (bvsle lt!457902 (bvsub (size!32040 lt!457883) #b00000000000000000000000000000000)))))

(assert (=> d!125417 (= lt!457902 e!587900)))

(declare-fun c!105274 () Bool)

(assert (=> d!125417 (= c!105274 (bvsge #b00000000000000000000000000000000 (size!32040 (_keys!11519 thiss!1427))))))

(assert (=> d!125417 (and (bvsle #b00000000000000000000000000000000 (size!32040 (_keys!11519 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32040 (_keys!11519 thiss!1427)) (size!32040 lt!457883)))))

(assert (=> d!125417 (= (arrayCountValidKeys!0 lt!457883 #b00000000000000000000000000000000 (size!32040 (_keys!11519 thiss!1427))) lt!457902)))

(declare-fun b!1038889 () Bool)

(assert (=> b!1038889 (= e!587899 call!43967)))

(assert (= (and d!125417 c!105274) b!1038887))

(assert (= (and d!125417 (not c!105274)) b!1038886))

(assert (= (and b!1038886 c!105273) b!1038888))

(assert (= (and b!1038886 (not c!105273)) b!1038889))

(assert (= (or b!1038888 b!1038889) bm!43964))

(declare-fun m!958735 () Bool)

(assert (=> b!1038886 m!958735))

(assert (=> b!1038886 m!958735))

(declare-fun m!958737 () Bool)

(assert (=> b!1038886 m!958737))

(declare-fun m!958739 () Bool)

(assert (=> bm!43964 m!958739))

(assert (=> b!1038836 d!125417))

(declare-fun d!125419 () Bool)

(assert (=> d!125419 (= (validMask!0 (mask!30263 thiss!1427)) (and (or (= (mask!30263 thiss!1427) #b00000000000000000000000000000111) (= (mask!30263 thiss!1427) #b00000000000000000000000000001111) (= (mask!30263 thiss!1427) #b00000000000000000000000000011111) (= (mask!30263 thiss!1427) #b00000000000000000000000000111111) (= (mask!30263 thiss!1427) #b00000000000000000000000001111111) (= (mask!30263 thiss!1427) #b00000000000000000000000011111111) (= (mask!30263 thiss!1427) #b00000000000000000000000111111111) (= (mask!30263 thiss!1427) #b00000000000000000000001111111111) (= (mask!30263 thiss!1427) #b00000000000000000000011111111111) (= (mask!30263 thiss!1427) #b00000000000000000000111111111111) (= (mask!30263 thiss!1427) #b00000000000000000001111111111111) (= (mask!30263 thiss!1427) #b00000000000000000011111111111111) (= (mask!30263 thiss!1427) #b00000000000000000111111111111111) (= (mask!30263 thiss!1427) #b00000000000000001111111111111111) (= (mask!30263 thiss!1427) #b00000000000000011111111111111111) (= (mask!30263 thiss!1427) #b00000000000000111111111111111111) (= (mask!30263 thiss!1427) #b00000000000001111111111111111111) (= (mask!30263 thiss!1427) #b00000000000011111111111111111111) (= (mask!30263 thiss!1427) #b00000000000111111111111111111111) (= (mask!30263 thiss!1427) #b00000000001111111111111111111111) (= (mask!30263 thiss!1427) #b00000000011111111111111111111111) (= (mask!30263 thiss!1427) #b00000000111111111111111111111111) (= (mask!30263 thiss!1427) #b00000001111111111111111111111111) (= (mask!30263 thiss!1427) #b00000011111111111111111111111111) (= (mask!30263 thiss!1427) #b00000111111111111111111111111111) (= (mask!30263 thiss!1427) #b00001111111111111111111111111111) (= (mask!30263 thiss!1427) #b00011111111111111111111111111111) (= (mask!30263 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30263 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1038836 d!125419))

(declare-fun b!1038890 () Bool)

(declare-fun e!587902 () (_ BitVec 32))

(declare-fun e!587901 () (_ BitVec 32))

(assert (=> b!1038890 (= e!587902 e!587901)))

(declare-fun c!105275 () Bool)

(assert (=> b!1038890 (= c!105275 (validKeyInArray!0 (select (arr!31509 (_keys!11519 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43965 () Bool)

(declare-fun call!43968 () (_ BitVec 32))

(assert (=> bm!43965 (= call!43968 (arrayCountValidKeys!0 (_keys!11519 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32040 (_keys!11519 thiss!1427))))))

(declare-fun b!1038891 () Bool)

(assert (=> b!1038891 (= e!587902 #b00000000000000000000000000000000)))

(declare-fun b!1038892 () Bool)

(assert (=> b!1038892 (= e!587901 (bvadd #b00000000000000000000000000000001 call!43968))))

(declare-fun d!125421 () Bool)

(declare-fun lt!457903 () (_ BitVec 32))

(assert (=> d!125421 (and (bvsge lt!457903 #b00000000000000000000000000000000) (bvsle lt!457903 (bvsub (size!32040 (_keys!11519 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125421 (= lt!457903 e!587902)))

(declare-fun c!105276 () Bool)

(assert (=> d!125421 (= c!105276 (bvsge #b00000000000000000000000000000000 (size!32040 (_keys!11519 thiss!1427))))))

(assert (=> d!125421 (and (bvsle #b00000000000000000000000000000000 (size!32040 (_keys!11519 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32040 (_keys!11519 thiss!1427)) (size!32040 (_keys!11519 thiss!1427))))))

(assert (=> d!125421 (= (arrayCountValidKeys!0 (_keys!11519 thiss!1427) #b00000000000000000000000000000000 (size!32040 (_keys!11519 thiss!1427))) lt!457903)))

(declare-fun b!1038893 () Bool)

(assert (=> b!1038893 (= e!587901 call!43968)))

(assert (= (and d!125421 c!105276) b!1038891))

(assert (= (and d!125421 (not c!105276)) b!1038890))

(assert (= (and b!1038890 c!105275) b!1038892))

(assert (= (and b!1038890 (not c!105275)) b!1038893))

(assert (= (or b!1038892 b!1038893) bm!43965))

(declare-fun m!958741 () Bool)

(assert (=> b!1038890 m!958741))

(assert (=> b!1038890 m!958741))

(declare-fun m!958743 () Bool)

(assert (=> b!1038890 m!958743))

(declare-fun m!958745 () Bool)

(assert (=> bm!43965 m!958745))

(assert (=> b!1038836 d!125421))

(declare-fun b!1038904 () Bool)

(declare-fun e!587913 () Bool)

(declare-fun e!587911 () Bool)

(assert (=> b!1038904 (= e!587913 e!587911)))

(declare-fun res!692938 () Bool)

(assert (=> b!1038904 (=> (not res!692938) (not e!587911))))

(declare-fun e!587912 () Bool)

(assert (=> b!1038904 (= res!692938 (not e!587912))))

(declare-fun res!692937 () Bool)

(assert (=> b!1038904 (=> (not res!692937) (not e!587912))))

(assert (=> b!1038904 (= res!692937 (validKeyInArray!0 (select (arr!31509 lt!457883) #b00000000000000000000000000000000)))))

(declare-fun b!1038905 () Bool)

(declare-fun e!587914 () Bool)

(declare-fun call!43971 () Bool)

(assert (=> b!1038905 (= e!587914 call!43971)))

(declare-fun b!1038906 () Bool)

(assert (=> b!1038906 (= e!587914 call!43971)))

(declare-fun d!125423 () Bool)

(declare-fun res!692936 () Bool)

(assert (=> d!125423 (=> res!692936 e!587913)))

(assert (=> d!125423 (= res!692936 (bvsge #b00000000000000000000000000000000 (size!32040 lt!457883)))))

(assert (=> d!125423 (= (arrayNoDuplicates!0 lt!457883 #b00000000000000000000000000000000 Nil!21937) e!587913)))

(declare-fun b!1038907 () Bool)

(assert (=> b!1038907 (= e!587911 e!587914)))

(declare-fun c!105279 () Bool)

(assert (=> b!1038907 (= c!105279 (validKeyInArray!0 (select (arr!31509 lt!457883) #b00000000000000000000000000000000)))))

(declare-fun b!1038908 () Bool)

(declare-fun contains!6040 (List!21940 (_ BitVec 64)) Bool)

(assert (=> b!1038908 (= e!587912 (contains!6040 Nil!21937 (select (arr!31509 lt!457883) #b00000000000000000000000000000000)))))

(declare-fun bm!43968 () Bool)

(assert (=> bm!43968 (= call!43971 (arrayNoDuplicates!0 lt!457883 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105279 (Cons!21936 (select (arr!31509 lt!457883) #b00000000000000000000000000000000) Nil!21937) Nil!21937)))))

(assert (= (and d!125423 (not res!692936)) b!1038904))

(assert (= (and b!1038904 res!692937) b!1038908))

(assert (= (and b!1038904 res!692938) b!1038907))

(assert (= (and b!1038907 c!105279) b!1038905))

(assert (= (and b!1038907 (not c!105279)) b!1038906))

(assert (= (or b!1038905 b!1038906) bm!43968))

(assert (=> b!1038904 m!958735))

(assert (=> b!1038904 m!958735))

(assert (=> b!1038904 m!958737))

(assert (=> b!1038907 m!958735))

(assert (=> b!1038907 m!958735))

(assert (=> b!1038907 m!958737))

(assert (=> b!1038908 m!958735))

(assert (=> b!1038908 m!958735))

(declare-fun m!958747 () Bool)

(assert (=> b!1038908 m!958747))

(assert (=> bm!43968 m!958735))

(declare-fun m!958749 () Bool)

(assert (=> bm!43968 m!958749))

(assert (=> b!1038836 d!125423))

(declare-fun b!1038920 () Bool)

(declare-fun e!587920 () Bool)

(assert (=> b!1038920 (= e!587920 (= (arrayCountValidKeys!0 (array!65469 (store (arr!31509 (_keys!11519 thiss!1427)) (index!41472 lt!457884) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32040 (_keys!11519 thiss!1427))) #b00000000000000000000000000000000 (size!32040 (_keys!11519 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11519 thiss!1427) #b00000000000000000000000000000000 (size!32040 (_keys!11519 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1038919 () Bool)

(declare-fun e!587919 () Bool)

(assert (=> b!1038919 (= e!587919 (bvslt (size!32040 (_keys!11519 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1038917 () Bool)

(declare-fun res!692948 () Bool)

(assert (=> b!1038917 (=> (not res!692948) (not e!587919))))

(assert (=> b!1038917 (= res!692948 (validKeyInArray!0 (select (arr!31509 (_keys!11519 thiss!1427)) (index!41472 lt!457884))))))

(declare-fun d!125425 () Bool)

(assert (=> d!125425 e!587920))

(declare-fun res!692950 () Bool)

(assert (=> d!125425 (=> (not res!692950) (not e!587920))))

(assert (=> d!125425 (= res!692950 (and (bvsge (index!41472 lt!457884) #b00000000000000000000000000000000) (bvslt (index!41472 lt!457884) (size!32040 (_keys!11519 thiss!1427)))))))

(declare-fun lt!457906 () Unit!33983)

(declare-fun choose!82 (array!65468 (_ BitVec 32) (_ BitVec 64)) Unit!33983)

(assert (=> d!125425 (= lt!457906 (choose!82 (_keys!11519 thiss!1427) (index!41472 lt!457884) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125425 e!587919))

(declare-fun res!692949 () Bool)

(assert (=> d!125425 (=> (not res!692949) (not e!587919))))

(assert (=> d!125425 (= res!692949 (and (bvsge (index!41472 lt!457884) #b00000000000000000000000000000000) (bvslt (index!41472 lt!457884) (size!32040 (_keys!11519 thiss!1427)))))))

(assert (=> d!125425 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11519 thiss!1427) (index!41472 lt!457884) #b1000000000000000000000000000000000000000000000000000000000000000) lt!457906)))

(declare-fun b!1038918 () Bool)

(declare-fun res!692947 () Bool)

(assert (=> b!1038918 (=> (not res!692947) (not e!587919))))

(assert (=> b!1038918 (= res!692947 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!125425 res!692949) b!1038917))

(assert (= (and b!1038917 res!692948) b!1038918))

(assert (= (and b!1038918 res!692947) b!1038919))

(assert (= (and d!125425 res!692950) b!1038920))

(assert (=> b!1038920 m!958681))

(declare-fun m!958751 () Bool)

(assert (=> b!1038920 m!958751))

(assert (=> b!1038920 m!958683))

(declare-fun m!958753 () Bool)

(assert (=> b!1038917 m!958753))

(assert (=> b!1038917 m!958753))

(declare-fun m!958755 () Bool)

(assert (=> b!1038917 m!958755))

(declare-fun m!958757 () Bool)

(assert (=> d!125425 m!958757))

(declare-fun m!958759 () Bool)

(assert (=> b!1038918 m!958759))

(assert (=> b!1038836 d!125425))

(declare-fun d!125427 () Bool)

(assert (=> d!125427 (= (array_inv!24363 (_keys!11519 thiss!1427)) (bvsge (size!32040 (_keys!11519 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1038839 d!125427))

(declare-fun d!125429 () Bool)

(assert (=> d!125429 (= (array_inv!24364 (_values!6336 thiss!1427)) (bvsge (size!32041 (_values!6336 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1038839 d!125429))

(declare-fun b!1038933 () Bool)

(declare-fun e!587927 () SeekEntryResult!9775)

(declare-fun lt!457915 () SeekEntryResult!9775)

(assert (=> b!1038933 (= e!587927 (ite ((_ is MissingVacant!9775) lt!457915) (MissingZero!9775 (index!41474 lt!457915)) lt!457915))))

(declare-fun lt!457917 () SeekEntryResult!9775)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65468 (_ BitVec 32)) SeekEntryResult!9775)

(assert (=> b!1038933 (= lt!457915 (seekKeyOrZeroReturnVacant!0 (x!92703 lt!457917) (index!41473 lt!457917) (index!41473 lt!457917) key!909 (_keys!11519 thiss!1427) (mask!30263 thiss!1427)))))

(declare-fun b!1038934 () Bool)

(declare-fun e!587928 () SeekEntryResult!9775)

(assert (=> b!1038934 (= e!587928 (Found!9775 (index!41473 lt!457917)))))

(declare-fun b!1038935 () Bool)

(declare-fun e!587929 () SeekEntryResult!9775)

(assert (=> b!1038935 (= e!587929 Undefined!9775)))

(declare-fun b!1038937 () Bool)

(assert (=> b!1038937 (= e!587929 e!587928)))

(declare-fun lt!457918 () (_ BitVec 64))

(assert (=> b!1038937 (= lt!457918 (select (arr!31509 (_keys!11519 thiss!1427)) (index!41473 lt!457917)))))

(declare-fun c!105287 () Bool)

(assert (=> b!1038937 (= c!105287 (= lt!457918 key!909))))

(declare-fun b!1038938 () Bool)

(assert (=> b!1038938 (= e!587927 (MissingZero!9775 (index!41473 lt!457917)))))

(declare-fun b!1038936 () Bool)

(declare-fun c!105288 () Bool)

(assert (=> b!1038936 (= c!105288 (= lt!457918 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1038936 (= e!587928 e!587927)))

(declare-fun d!125431 () Bool)

(declare-fun lt!457916 () SeekEntryResult!9775)

(assert (=> d!125431 (and (or ((_ is MissingVacant!9775) lt!457916) (not ((_ is Found!9775) lt!457916)) (and (bvsge (index!41472 lt!457916) #b00000000000000000000000000000000) (bvslt (index!41472 lt!457916) (size!32040 (_keys!11519 thiss!1427))))) (not ((_ is MissingVacant!9775) lt!457916)) (or (not ((_ is Found!9775) lt!457916)) (= (select (arr!31509 (_keys!11519 thiss!1427)) (index!41472 lt!457916)) key!909)))))

(assert (=> d!125431 (= lt!457916 e!587929)))

(declare-fun c!105286 () Bool)

(assert (=> d!125431 (= c!105286 (and ((_ is Intermediate!9775) lt!457917) (undefined!10587 lt!457917)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65468 (_ BitVec 32)) SeekEntryResult!9775)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125431 (= lt!457917 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30263 thiss!1427)) key!909 (_keys!11519 thiss!1427) (mask!30263 thiss!1427)))))

(assert (=> d!125431 (validMask!0 (mask!30263 thiss!1427))))

(assert (=> d!125431 (= (seekEntry!0 key!909 (_keys!11519 thiss!1427) (mask!30263 thiss!1427)) lt!457916)))

(assert (= (and d!125431 c!105286) b!1038935))

(assert (= (and d!125431 (not c!105286)) b!1038937))

(assert (= (and b!1038937 c!105287) b!1038934))

(assert (= (and b!1038937 (not c!105287)) b!1038936))

(assert (= (and b!1038936 c!105288) b!1038938))

(assert (= (and b!1038936 (not c!105288)) b!1038933))

(declare-fun m!958761 () Bool)

(assert (=> b!1038933 m!958761))

(declare-fun m!958763 () Bool)

(assert (=> b!1038937 m!958763))

(declare-fun m!958765 () Bool)

(assert (=> d!125431 m!958765))

(declare-fun m!958767 () Bool)

(assert (=> d!125431 m!958767))

(assert (=> d!125431 m!958767))

(declare-fun m!958769 () Bool)

(assert (=> d!125431 m!958769))

(assert (=> d!125431 m!958679))

(assert (=> b!1038840 d!125431))

(declare-fun b!1038945 () Bool)

(declare-fun e!587934 () Bool)

(assert (=> b!1038945 (= e!587934 tp_is_empty!24675)))

(declare-fun mapNonEmpty!38569 () Bool)

(declare-fun mapRes!38569 () Bool)

(declare-fun tp!74042 () Bool)

(assert (=> mapNonEmpty!38569 (= mapRes!38569 (and tp!74042 e!587934))))

(declare-fun mapKey!38569 () (_ BitVec 32))

(declare-fun mapRest!38569 () (Array (_ BitVec 32) ValueCell!11634))

(declare-fun mapValue!38569 () ValueCell!11634)

(assert (=> mapNonEmpty!38569 (= mapRest!38563 (store mapRest!38569 mapKey!38569 mapValue!38569))))

(declare-fun condMapEmpty!38569 () Bool)

(declare-fun mapDefault!38569 () ValueCell!11634)

(assert (=> mapNonEmpty!38563 (= condMapEmpty!38569 (= mapRest!38563 ((as const (Array (_ BitVec 32) ValueCell!11634)) mapDefault!38569)))))

(declare-fun e!587935 () Bool)

(assert (=> mapNonEmpty!38563 (= tp!74032 (and e!587935 mapRes!38569))))

(declare-fun mapIsEmpty!38569 () Bool)

(assert (=> mapIsEmpty!38569 mapRes!38569))

(declare-fun b!1038946 () Bool)

(assert (=> b!1038946 (= e!587935 tp_is_empty!24675)))

(assert (= (and mapNonEmpty!38563 condMapEmpty!38569) mapIsEmpty!38569))

(assert (= (and mapNonEmpty!38563 (not condMapEmpty!38569)) mapNonEmpty!38569))

(assert (= (and mapNonEmpty!38569 ((_ is ValueCellFull!11634) mapValue!38569)) b!1038945))

(assert (= (and mapNonEmpty!38563 ((_ is ValueCellFull!11634) mapDefault!38569)) b!1038946))

(declare-fun m!958771 () Bool)

(assert (=> mapNonEmpty!38569 m!958771))

(check-sat tp_is_empty!24675 (not b!1038877) (not bm!43964) b_and!33487 (not b!1038933) (not b!1038904) (not b!1038886) (not b!1038908) (not b!1038907) (not mapNonEmpty!38569) (not b!1038920) (not bm!43965) (not b!1038872) (not b_next!20955) (not b!1038874) (not b!1038873) (not bm!43968) (not d!125413) (not b!1038890) (not d!125431) (not b!1038918) (not b!1038917) (not d!125415) (not d!125425))
(check-sat b_and!33487 (not b_next!20955))
