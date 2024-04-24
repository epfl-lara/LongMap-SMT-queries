; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91374 () Bool)

(assert start!91374)

(declare-fun b!1041626 () Bool)

(declare-fun b_free!21007 () Bool)

(declare-fun b_next!21007 () Bool)

(assert (=> b!1041626 (= b_free!21007 (not b_next!21007))))

(declare-fun tp!74215 () Bool)

(declare-fun b_and!33549 () Bool)

(assert (=> b!1041626 (= tp!74215 b_and!33549)))

(declare-fun b!1041618 () Bool)

(declare-fun e!589795 () Bool)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1041618 (= e!589795 (validKeyInArray!0 key!909))))

(declare-fun b!1041619 () Bool)

(declare-fun e!589793 () Bool)

(declare-fun tp_is_empty!24727 () Bool)

(assert (=> b!1041619 (= e!589793 tp_is_empty!24727)))

(declare-fun res!694103 () Bool)

(declare-fun e!589790 () Bool)

(assert (=> start!91374 (=> (not res!694103) (not e!589790))))

(declare-datatypes ((V!37843 0))(
  ( (V!37844 (val!12414 Int)) )
))
(declare-datatypes ((ValueCell!11660 0))(
  ( (ValueCellFull!11660 (v!14997 V!37843)) (EmptyCell!11660) )
))
(declare-datatypes ((array!65639 0))(
  ( (array!65640 (arr!31579 (Array (_ BitVec 32) (_ BitVec 64))) (size!32111 (_ BitVec 32))) )
))
(declare-datatypes ((array!65641 0))(
  ( (array!65642 (arr!31580 (Array (_ BitVec 32) ValueCell!11660)) (size!32112 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5914 0))(
  ( (LongMapFixedSize!5915 (defaultEntry!6339 Int) (mask!30390 (_ BitVec 32)) (extraKeys!6067 (_ BitVec 32)) (zeroValue!6173 V!37843) (minValue!6173 V!37843) (_size!3012 (_ BitVec 32)) (_keys!11597 array!65639) (_values!6362 array!65641) (_vacant!3012 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5914)

(declare-fun valid!2230 (LongMapFixedSize!5914) Bool)

(assert (=> start!91374 (= res!694103 (valid!2230 thiss!1427))))

(assert (=> start!91374 e!589790))

(declare-fun e!589791 () Bool)

(assert (=> start!91374 e!589791))

(assert (=> start!91374 true))

(declare-fun b!1041620 () Bool)

(declare-fun res!694104 () Bool)

(assert (=> b!1041620 (=> res!694104 e!589795)))

(declare-datatypes ((List!21946 0))(
  ( (Nil!21943) (Cons!21942 (h!23155 (_ BitVec 64)) (t!31152 List!21946)) )
))
(declare-fun arrayNoDuplicates!0 (array!65639 (_ BitVec 32) List!21946) Bool)

(assert (=> b!1041620 (= res!694104 (not (arrayNoDuplicates!0 (_keys!11597 thiss!1427) #b00000000000000000000000000000000 Nil!21943)))))

(declare-fun b!1041621 () Bool)

(declare-fun e!589794 () Bool)

(assert (=> b!1041621 (= e!589790 e!589794)))

(declare-fun res!694102 () Bool)

(assert (=> b!1041621 (=> (not res!694102) (not e!589794))))

(declare-datatypes ((SeekEntryResult!9750 0))(
  ( (MissingZero!9750 (index!41371 (_ BitVec 32))) (Found!9750 (index!41372 (_ BitVec 32))) (Intermediate!9750 (undefined!10562 Bool) (index!41373 (_ BitVec 32)) (x!92844 (_ BitVec 32))) (Undefined!9750) (MissingVacant!9750 (index!41374 (_ BitVec 32))) )
))
(declare-fun lt!459002 () SeekEntryResult!9750)

(get-info :version)

(assert (=> b!1041621 (= res!694102 ((_ is Found!9750) lt!459002))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65639 (_ BitVec 32)) SeekEntryResult!9750)

(assert (=> b!1041621 (= lt!459002 (seekEntry!0 key!909 (_keys!11597 thiss!1427) (mask!30390 thiss!1427)))))

(declare-fun b!1041622 () Bool)

(assert (=> b!1041622 (= e!589794 (not e!589795))))

(declare-fun res!694101 () Bool)

(assert (=> b!1041622 (=> res!694101 e!589795)))

(assert (=> b!1041622 (= res!694101 (or (bvslt (index!41372 lt!459002) #b00000000000000000000000000000000) (bvsge (index!41372 lt!459002) (size!32111 (_keys!11597 thiss!1427))) (bvsge (size!32111 (_keys!11597 thiss!1427)) #b01111111111111111111111111111111)))))

(declare-fun lt!459004 () array!65639)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65639 (_ BitVec 32)) Bool)

(assert (=> b!1041622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459004 (mask!30390 thiss!1427))))

(declare-datatypes ((Unit!34017 0))(
  ( (Unit!34018) )
))
(declare-fun lt!459005 () Unit!34017)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65639 (_ BitVec 32) (_ BitVec 32)) Unit!34017)

(assert (=> b!1041622 (= lt!459005 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11597 thiss!1427) (index!41372 lt!459002) (mask!30390 thiss!1427)))))

(assert (=> b!1041622 (arrayNoDuplicates!0 lt!459004 #b00000000000000000000000000000000 Nil!21943)))

(declare-fun lt!459003 () Unit!34017)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65639 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21946) Unit!34017)

(assert (=> b!1041622 (= lt!459003 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11597 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41372 lt!459002) #b00000000000000000000000000000000 Nil!21943))))

(declare-fun arrayCountValidKeys!0 (array!65639 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1041622 (= (arrayCountValidKeys!0 lt!459004 #b00000000000000000000000000000000 (size!32111 (_keys!11597 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11597 thiss!1427) #b00000000000000000000000000000000 (size!32111 (_keys!11597 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1041622 (= lt!459004 (array!65640 (store (arr!31579 (_keys!11597 thiss!1427)) (index!41372 lt!459002) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32111 (_keys!11597 thiss!1427))))))

(declare-fun lt!459001 () Unit!34017)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65639 (_ BitVec 32) (_ BitVec 64)) Unit!34017)

(assert (=> b!1041622 (= lt!459001 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11597 thiss!1427) (index!41372 lt!459002) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1041623 () Bool)

(declare-fun res!694105 () Bool)

(assert (=> b!1041623 (=> (not res!694105) (not e!589790))))

(assert (=> b!1041623 (= res!694105 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1041624 () Bool)

(declare-fun e!589792 () Bool)

(declare-fun mapRes!38668 () Bool)

(assert (=> b!1041624 (= e!589792 (and e!589793 mapRes!38668))))

(declare-fun condMapEmpty!38668 () Bool)

(declare-fun mapDefault!38668 () ValueCell!11660)

(assert (=> b!1041624 (= condMapEmpty!38668 (= (arr!31580 (_values!6362 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11660)) mapDefault!38668)))))

(declare-fun b!1041625 () Bool)

(declare-fun e!589789 () Bool)

(assert (=> b!1041625 (= e!589789 tp_is_empty!24727)))

(declare-fun array_inv!24419 (array!65639) Bool)

(declare-fun array_inv!24420 (array!65641) Bool)

(assert (=> b!1041626 (= e!589791 (and tp!74215 tp_is_empty!24727 (array_inv!24419 (_keys!11597 thiss!1427)) (array_inv!24420 (_values!6362 thiss!1427)) e!589792))))

(declare-fun mapNonEmpty!38668 () Bool)

(declare-fun tp!74216 () Bool)

(assert (=> mapNonEmpty!38668 (= mapRes!38668 (and tp!74216 e!589789))))

(declare-fun mapValue!38668 () ValueCell!11660)

(declare-fun mapKey!38668 () (_ BitVec 32))

(declare-fun mapRest!38668 () (Array (_ BitVec 32) ValueCell!11660))

(assert (=> mapNonEmpty!38668 (= (arr!31580 (_values!6362 thiss!1427)) (store mapRest!38668 mapKey!38668 mapValue!38668))))

(declare-fun mapIsEmpty!38668 () Bool)

(assert (=> mapIsEmpty!38668 mapRes!38668))

(assert (= (and start!91374 res!694103) b!1041623))

(assert (= (and b!1041623 res!694105) b!1041621))

(assert (= (and b!1041621 res!694102) b!1041622))

(assert (= (and b!1041622 (not res!694101)) b!1041620))

(assert (= (and b!1041620 (not res!694104)) b!1041618))

(assert (= (and b!1041624 condMapEmpty!38668) mapIsEmpty!38668))

(assert (= (and b!1041624 (not condMapEmpty!38668)) mapNonEmpty!38668))

(assert (= (and mapNonEmpty!38668 ((_ is ValueCellFull!11660) mapValue!38668)) b!1041625))

(assert (= (and b!1041624 ((_ is ValueCellFull!11660) mapDefault!38668)) b!1041619))

(assert (= b!1041626 b!1041624))

(assert (= start!91374 b!1041626))

(declare-fun m!961537 () Bool)

(assert (=> mapNonEmpty!38668 m!961537))

(declare-fun m!961539 () Bool)

(assert (=> b!1041626 m!961539))

(declare-fun m!961541 () Bool)

(assert (=> b!1041626 m!961541))

(declare-fun m!961543 () Bool)

(assert (=> b!1041622 m!961543))

(declare-fun m!961545 () Bool)

(assert (=> b!1041622 m!961545))

(declare-fun m!961547 () Bool)

(assert (=> b!1041622 m!961547))

(declare-fun m!961549 () Bool)

(assert (=> b!1041622 m!961549))

(declare-fun m!961551 () Bool)

(assert (=> b!1041622 m!961551))

(declare-fun m!961553 () Bool)

(assert (=> b!1041622 m!961553))

(declare-fun m!961555 () Bool)

(assert (=> b!1041622 m!961555))

(declare-fun m!961557 () Bool)

(assert (=> b!1041622 m!961557))

(declare-fun m!961559 () Bool)

(assert (=> start!91374 m!961559))

(declare-fun m!961561 () Bool)

(assert (=> b!1041621 m!961561))

(declare-fun m!961563 () Bool)

(assert (=> b!1041618 m!961563))

(declare-fun m!961565 () Bool)

(assert (=> b!1041620 m!961565))

(check-sat tp_is_empty!24727 (not mapNonEmpty!38668) (not b!1041626) (not start!91374) b_and!33549 (not b!1041618) (not b!1041620) (not b!1041621) (not b!1041622) (not b_next!21007))
(check-sat b_and!33549 (not b_next!21007))
(get-model)

(declare-fun b!1041692 () Bool)

(declare-fun e!589856 () Bool)

(declare-fun e!589853 () Bool)

(assert (=> b!1041692 (= e!589856 e!589853)))

(declare-fun c!105879 () Bool)

(assert (=> b!1041692 (= c!105879 (validKeyInArray!0 (select (arr!31579 lt!459004) #b00000000000000000000000000000000)))))

(declare-fun b!1041693 () Bool)

(declare-fun call!44115 () Bool)

(assert (=> b!1041693 (= e!589853 call!44115)))

(declare-fun b!1041694 () Bool)

(assert (=> b!1041694 (= e!589853 call!44115)))

(declare-fun bm!44112 () Bool)

(assert (=> bm!44112 (= call!44115 (arrayNoDuplicates!0 lt!459004 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105879 (Cons!21942 (select (arr!31579 lt!459004) #b00000000000000000000000000000000) Nil!21943) Nil!21943)))))

(declare-fun b!1041695 () Bool)

(declare-fun e!589855 () Bool)

(declare-fun contains!6075 (List!21946 (_ BitVec 64)) Bool)

(assert (=> b!1041695 (= e!589855 (contains!6075 Nil!21943 (select (arr!31579 lt!459004) #b00000000000000000000000000000000)))))

(declare-fun d!126095 () Bool)

(declare-fun res!694144 () Bool)

(declare-fun e!589854 () Bool)

(assert (=> d!126095 (=> res!694144 e!589854)))

(assert (=> d!126095 (= res!694144 (bvsge #b00000000000000000000000000000000 (size!32111 lt!459004)))))

(assert (=> d!126095 (= (arrayNoDuplicates!0 lt!459004 #b00000000000000000000000000000000 Nil!21943) e!589854)))

(declare-fun b!1041691 () Bool)

(assert (=> b!1041691 (= e!589854 e!589856)))

(declare-fun res!694142 () Bool)

(assert (=> b!1041691 (=> (not res!694142) (not e!589856))))

(assert (=> b!1041691 (= res!694142 (not e!589855))))

(declare-fun res!694143 () Bool)

(assert (=> b!1041691 (=> (not res!694143) (not e!589855))))

(assert (=> b!1041691 (= res!694143 (validKeyInArray!0 (select (arr!31579 lt!459004) #b00000000000000000000000000000000)))))

(assert (= (and d!126095 (not res!694144)) b!1041691))

(assert (= (and b!1041691 res!694143) b!1041695))

(assert (= (and b!1041691 res!694142) b!1041692))

(assert (= (and b!1041692 c!105879) b!1041694))

(assert (= (and b!1041692 (not c!105879)) b!1041693))

(assert (= (or b!1041694 b!1041693) bm!44112))

(declare-fun m!961627 () Bool)

(assert (=> b!1041692 m!961627))

(assert (=> b!1041692 m!961627))

(declare-fun m!961629 () Bool)

(assert (=> b!1041692 m!961629))

(assert (=> bm!44112 m!961627))

(declare-fun m!961631 () Bool)

(assert (=> bm!44112 m!961631))

(assert (=> b!1041695 m!961627))

(assert (=> b!1041695 m!961627))

(declare-fun m!961633 () Bool)

(assert (=> b!1041695 m!961633))

(assert (=> b!1041691 m!961627))

(assert (=> b!1041691 m!961627))

(assert (=> b!1041691 m!961629))

(assert (=> b!1041622 d!126095))

(declare-fun b!1041705 () Bool)

(declare-fun res!694155 () Bool)

(declare-fun e!589862 () Bool)

(assert (=> b!1041705 (=> (not res!694155) (not e!589862))))

(assert (=> b!1041705 (= res!694155 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1041704 () Bool)

(declare-fun res!694156 () Bool)

(assert (=> b!1041704 (=> (not res!694156) (not e!589862))))

(assert (=> b!1041704 (= res!694156 (validKeyInArray!0 (select (arr!31579 (_keys!11597 thiss!1427)) (index!41372 lt!459002))))))

(declare-fun b!1041707 () Bool)

(declare-fun e!589861 () Bool)

(assert (=> b!1041707 (= e!589861 (= (arrayCountValidKeys!0 (array!65640 (store (arr!31579 (_keys!11597 thiss!1427)) (index!41372 lt!459002) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32111 (_keys!11597 thiss!1427))) #b00000000000000000000000000000000 (size!32111 (_keys!11597 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11597 thiss!1427) #b00000000000000000000000000000000 (size!32111 (_keys!11597 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun d!126097 () Bool)

(assert (=> d!126097 e!589861))

(declare-fun res!694153 () Bool)

(assert (=> d!126097 (=> (not res!694153) (not e!589861))))

(assert (=> d!126097 (= res!694153 (and (bvsge (index!41372 lt!459002) #b00000000000000000000000000000000) (bvslt (index!41372 lt!459002) (size!32111 (_keys!11597 thiss!1427)))))))

(declare-fun lt!459038 () Unit!34017)

(declare-fun choose!82 (array!65639 (_ BitVec 32) (_ BitVec 64)) Unit!34017)

(assert (=> d!126097 (= lt!459038 (choose!82 (_keys!11597 thiss!1427) (index!41372 lt!459002) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!126097 e!589862))

(declare-fun res!694154 () Bool)

(assert (=> d!126097 (=> (not res!694154) (not e!589862))))

(assert (=> d!126097 (= res!694154 (and (bvsge (index!41372 lt!459002) #b00000000000000000000000000000000) (bvslt (index!41372 lt!459002) (size!32111 (_keys!11597 thiss!1427)))))))

(assert (=> d!126097 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11597 thiss!1427) (index!41372 lt!459002) #b1000000000000000000000000000000000000000000000000000000000000000) lt!459038)))

(declare-fun b!1041706 () Bool)

(assert (=> b!1041706 (= e!589862 (bvslt (size!32111 (_keys!11597 thiss!1427)) #b01111111111111111111111111111111))))

(assert (= (and d!126097 res!694154) b!1041704))

(assert (= (and b!1041704 res!694156) b!1041705))

(assert (= (and b!1041705 res!694155) b!1041706))

(assert (= (and d!126097 res!694153) b!1041707))

(declare-fun m!961635 () Bool)

(assert (=> b!1041705 m!961635))

(declare-fun m!961637 () Bool)

(assert (=> b!1041704 m!961637))

(assert (=> b!1041704 m!961637))

(declare-fun m!961639 () Bool)

(assert (=> b!1041704 m!961639))

(assert (=> b!1041707 m!961555))

(declare-fun m!961641 () Bool)

(assert (=> b!1041707 m!961641))

(assert (=> b!1041707 m!961545))

(declare-fun m!961643 () Bool)

(assert (=> d!126097 m!961643))

(assert (=> b!1041622 d!126097))

(declare-fun bm!44115 () Bool)

(declare-fun call!44118 () Bool)

(assert (=> bm!44115 (= call!44118 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!459004 (mask!30390 thiss!1427)))))

(declare-fun d!126099 () Bool)

(declare-fun res!694162 () Bool)

(declare-fun e!589871 () Bool)

(assert (=> d!126099 (=> res!694162 e!589871)))

(assert (=> d!126099 (= res!694162 (bvsge #b00000000000000000000000000000000 (size!32111 lt!459004)))))

(assert (=> d!126099 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459004 (mask!30390 thiss!1427)) e!589871)))

(declare-fun b!1041716 () Bool)

(declare-fun e!589869 () Bool)

(assert (=> b!1041716 (= e!589871 e!589869)))

(declare-fun c!105882 () Bool)

(assert (=> b!1041716 (= c!105882 (validKeyInArray!0 (select (arr!31579 lt!459004) #b00000000000000000000000000000000)))))

(declare-fun b!1041717 () Bool)

(assert (=> b!1041717 (= e!589869 call!44118)))

(declare-fun b!1041718 () Bool)

(declare-fun e!589870 () Bool)

(assert (=> b!1041718 (= e!589869 e!589870)))

(declare-fun lt!459047 () (_ BitVec 64))

(assert (=> b!1041718 (= lt!459047 (select (arr!31579 lt!459004) #b00000000000000000000000000000000))))

(declare-fun lt!459046 () Unit!34017)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65639 (_ BitVec 64) (_ BitVec 32)) Unit!34017)

(assert (=> b!1041718 (= lt!459046 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!459004 lt!459047 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65639 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1041718 (arrayContainsKey!0 lt!459004 lt!459047 #b00000000000000000000000000000000)))

(declare-fun lt!459045 () Unit!34017)

(assert (=> b!1041718 (= lt!459045 lt!459046)))

(declare-fun res!694161 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65639 (_ BitVec 32)) SeekEntryResult!9750)

(assert (=> b!1041718 (= res!694161 (= (seekEntryOrOpen!0 (select (arr!31579 lt!459004) #b00000000000000000000000000000000) lt!459004 (mask!30390 thiss!1427)) (Found!9750 #b00000000000000000000000000000000)))))

(assert (=> b!1041718 (=> (not res!694161) (not e!589870))))

(declare-fun b!1041719 () Bool)

(assert (=> b!1041719 (= e!589870 call!44118)))

(assert (= (and d!126099 (not res!694162)) b!1041716))

(assert (= (and b!1041716 c!105882) b!1041718))

(assert (= (and b!1041716 (not c!105882)) b!1041717))

(assert (= (and b!1041718 res!694161) b!1041719))

(assert (= (or b!1041719 b!1041717) bm!44115))

(declare-fun m!961645 () Bool)

(assert (=> bm!44115 m!961645))

(assert (=> b!1041716 m!961627))

(assert (=> b!1041716 m!961627))

(assert (=> b!1041716 m!961629))

(assert (=> b!1041718 m!961627))

(declare-fun m!961647 () Bool)

(assert (=> b!1041718 m!961647))

(declare-fun m!961649 () Bool)

(assert (=> b!1041718 m!961649))

(assert (=> b!1041718 m!961627))

(declare-fun m!961651 () Bool)

(assert (=> b!1041718 m!961651))

(assert (=> b!1041622 d!126099))

(declare-fun d!126101 () Bool)

(declare-fun e!589874 () Bool)

(assert (=> d!126101 e!589874))

(declare-fun res!694165 () Bool)

(assert (=> d!126101 (=> (not res!694165) (not e!589874))))

(assert (=> d!126101 (= res!694165 (and (bvsge (index!41372 lt!459002) #b00000000000000000000000000000000) (bvslt (index!41372 lt!459002) (size!32111 (_keys!11597 thiss!1427)))))))

(declare-fun lt!459050 () Unit!34017)

(declare-fun choose!53 (array!65639 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21946) Unit!34017)

(assert (=> d!126101 (= lt!459050 (choose!53 (_keys!11597 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41372 lt!459002) #b00000000000000000000000000000000 Nil!21943))))

(assert (=> d!126101 (bvslt (size!32111 (_keys!11597 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126101 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11597 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41372 lt!459002) #b00000000000000000000000000000000 Nil!21943) lt!459050)))

(declare-fun b!1041722 () Bool)

(assert (=> b!1041722 (= e!589874 (arrayNoDuplicates!0 (array!65640 (store (arr!31579 (_keys!11597 thiss!1427)) (index!41372 lt!459002) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32111 (_keys!11597 thiss!1427))) #b00000000000000000000000000000000 Nil!21943))))

(assert (= (and d!126101 res!694165) b!1041722))

(declare-fun m!961653 () Bool)

(assert (=> d!126101 m!961653))

(assert (=> b!1041722 m!961555))

(declare-fun m!961655 () Bool)

(assert (=> b!1041722 m!961655))

(assert (=> b!1041622 d!126101))

(declare-fun b!1041731 () Bool)

(declare-fun e!589879 () (_ BitVec 32))

(declare-fun call!44121 () (_ BitVec 32))

(assert (=> b!1041731 (= e!589879 (bvadd #b00000000000000000000000000000001 call!44121))))

(declare-fun b!1041732 () Bool)

(assert (=> b!1041732 (= e!589879 call!44121)))

(declare-fun b!1041733 () Bool)

(declare-fun e!589880 () (_ BitVec 32))

(assert (=> b!1041733 (= e!589880 e!589879)))

(declare-fun c!105888 () Bool)

(assert (=> b!1041733 (= c!105888 (validKeyInArray!0 (select (arr!31579 lt!459004) #b00000000000000000000000000000000)))))

(declare-fun bm!44118 () Bool)

(assert (=> bm!44118 (= call!44121 (arrayCountValidKeys!0 lt!459004 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32111 (_keys!11597 thiss!1427))))))

(declare-fun d!126103 () Bool)

(declare-fun lt!459053 () (_ BitVec 32))

(assert (=> d!126103 (and (bvsge lt!459053 #b00000000000000000000000000000000) (bvsle lt!459053 (bvsub (size!32111 lt!459004) #b00000000000000000000000000000000)))))

(assert (=> d!126103 (= lt!459053 e!589880)))

(declare-fun c!105887 () Bool)

(assert (=> d!126103 (= c!105887 (bvsge #b00000000000000000000000000000000 (size!32111 (_keys!11597 thiss!1427))))))

(assert (=> d!126103 (and (bvsle #b00000000000000000000000000000000 (size!32111 (_keys!11597 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32111 (_keys!11597 thiss!1427)) (size!32111 lt!459004)))))

(assert (=> d!126103 (= (arrayCountValidKeys!0 lt!459004 #b00000000000000000000000000000000 (size!32111 (_keys!11597 thiss!1427))) lt!459053)))

(declare-fun b!1041734 () Bool)

(assert (=> b!1041734 (= e!589880 #b00000000000000000000000000000000)))

(assert (= (and d!126103 c!105887) b!1041734))

(assert (= (and d!126103 (not c!105887)) b!1041733))

(assert (= (and b!1041733 c!105888) b!1041731))

(assert (= (and b!1041733 (not c!105888)) b!1041732))

(assert (= (or b!1041731 b!1041732) bm!44118))

(assert (=> b!1041733 m!961627))

(assert (=> b!1041733 m!961627))

(assert (=> b!1041733 m!961629))

(declare-fun m!961657 () Bool)

(assert (=> bm!44118 m!961657))

(assert (=> b!1041622 d!126103))

(declare-fun b!1041735 () Bool)

(declare-fun e!589881 () (_ BitVec 32))

(declare-fun call!44122 () (_ BitVec 32))

(assert (=> b!1041735 (= e!589881 (bvadd #b00000000000000000000000000000001 call!44122))))

(declare-fun b!1041736 () Bool)

(assert (=> b!1041736 (= e!589881 call!44122)))

(declare-fun b!1041737 () Bool)

(declare-fun e!589882 () (_ BitVec 32))

(assert (=> b!1041737 (= e!589882 e!589881)))

(declare-fun c!105890 () Bool)

(assert (=> b!1041737 (= c!105890 (validKeyInArray!0 (select (arr!31579 (_keys!11597 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44119 () Bool)

(assert (=> bm!44119 (= call!44122 (arrayCountValidKeys!0 (_keys!11597 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32111 (_keys!11597 thiss!1427))))))

(declare-fun d!126105 () Bool)

(declare-fun lt!459054 () (_ BitVec 32))

(assert (=> d!126105 (and (bvsge lt!459054 #b00000000000000000000000000000000) (bvsle lt!459054 (bvsub (size!32111 (_keys!11597 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!126105 (= lt!459054 e!589882)))

(declare-fun c!105889 () Bool)

(assert (=> d!126105 (= c!105889 (bvsge #b00000000000000000000000000000000 (size!32111 (_keys!11597 thiss!1427))))))

(assert (=> d!126105 (and (bvsle #b00000000000000000000000000000000 (size!32111 (_keys!11597 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32111 (_keys!11597 thiss!1427)) (size!32111 (_keys!11597 thiss!1427))))))

(assert (=> d!126105 (= (arrayCountValidKeys!0 (_keys!11597 thiss!1427) #b00000000000000000000000000000000 (size!32111 (_keys!11597 thiss!1427))) lt!459054)))

(declare-fun b!1041738 () Bool)

(assert (=> b!1041738 (= e!589882 #b00000000000000000000000000000000)))

(assert (= (and d!126105 c!105889) b!1041738))

(assert (= (and d!126105 (not c!105889)) b!1041737))

(assert (= (and b!1041737 c!105890) b!1041735))

(assert (= (and b!1041737 (not c!105890)) b!1041736))

(assert (= (or b!1041735 b!1041736) bm!44119))

(declare-fun m!961659 () Bool)

(assert (=> b!1041737 m!961659))

(assert (=> b!1041737 m!961659))

(declare-fun m!961661 () Bool)

(assert (=> b!1041737 m!961661))

(declare-fun m!961663 () Bool)

(assert (=> bm!44119 m!961663))

(assert (=> b!1041622 d!126105))

(declare-fun d!126107 () Bool)

(declare-fun e!589885 () Bool)

(assert (=> d!126107 e!589885))

(declare-fun res!694168 () Bool)

(assert (=> d!126107 (=> (not res!694168) (not e!589885))))

(assert (=> d!126107 (= res!694168 (and (bvsge (index!41372 lt!459002) #b00000000000000000000000000000000) (bvslt (index!41372 lt!459002) (size!32111 (_keys!11597 thiss!1427)))))))

(declare-fun lt!459057 () Unit!34017)

(declare-fun choose!25 (array!65639 (_ BitVec 32) (_ BitVec 32)) Unit!34017)

(assert (=> d!126107 (= lt!459057 (choose!25 (_keys!11597 thiss!1427) (index!41372 lt!459002) (mask!30390 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!126107 (validMask!0 (mask!30390 thiss!1427))))

(assert (=> d!126107 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11597 thiss!1427) (index!41372 lt!459002) (mask!30390 thiss!1427)) lt!459057)))

(declare-fun b!1041741 () Bool)

(assert (=> b!1041741 (= e!589885 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65640 (store (arr!31579 (_keys!11597 thiss!1427)) (index!41372 lt!459002) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32111 (_keys!11597 thiss!1427))) (mask!30390 thiss!1427)))))

(assert (= (and d!126107 res!694168) b!1041741))

(declare-fun m!961665 () Bool)

(assert (=> d!126107 m!961665))

(declare-fun m!961667 () Bool)

(assert (=> d!126107 m!961667))

(assert (=> b!1041741 m!961555))

(declare-fun m!961669 () Bool)

(assert (=> b!1041741 m!961669))

(assert (=> b!1041622 d!126107))

(declare-fun d!126109 () Bool)

(declare-fun res!694175 () Bool)

(declare-fun e!589888 () Bool)

(assert (=> d!126109 (=> (not res!694175) (not e!589888))))

(declare-fun simpleValid!433 (LongMapFixedSize!5914) Bool)

(assert (=> d!126109 (= res!694175 (simpleValid!433 thiss!1427))))

(assert (=> d!126109 (= (valid!2230 thiss!1427) e!589888)))

(declare-fun b!1041748 () Bool)

(declare-fun res!694176 () Bool)

(assert (=> b!1041748 (=> (not res!694176) (not e!589888))))

(assert (=> b!1041748 (= res!694176 (= (arrayCountValidKeys!0 (_keys!11597 thiss!1427) #b00000000000000000000000000000000 (size!32111 (_keys!11597 thiss!1427))) (_size!3012 thiss!1427)))))

(declare-fun b!1041749 () Bool)

(declare-fun res!694177 () Bool)

(assert (=> b!1041749 (=> (not res!694177) (not e!589888))))

(assert (=> b!1041749 (= res!694177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11597 thiss!1427) (mask!30390 thiss!1427)))))

(declare-fun b!1041750 () Bool)

(assert (=> b!1041750 (= e!589888 (arrayNoDuplicates!0 (_keys!11597 thiss!1427) #b00000000000000000000000000000000 Nil!21943))))

(assert (= (and d!126109 res!694175) b!1041748))

(assert (= (and b!1041748 res!694176) b!1041749))

(assert (= (and b!1041749 res!694177) b!1041750))

(declare-fun m!961671 () Bool)

(assert (=> d!126109 m!961671))

(assert (=> b!1041748 m!961545))

(declare-fun m!961673 () Bool)

(assert (=> b!1041749 m!961673))

(assert (=> b!1041750 m!961565))

(assert (=> start!91374 d!126109))

(declare-fun b!1041763 () Bool)

(declare-fun e!589895 () SeekEntryResult!9750)

(declare-fun lt!459069 () SeekEntryResult!9750)

(assert (=> b!1041763 (= e!589895 (ite ((_ is MissingVacant!9750) lt!459069) (MissingZero!9750 (index!41374 lt!459069)) lt!459069))))

(declare-fun lt!459067 () SeekEntryResult!9750)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65639 (_ BitVec 32)) SeekEntryResult!9750)

(assert (=> b!1041763 (= lt!459069 (seekKeyOrZeroReturnVacant!0 (x!92844 lt!459067) (index!41373 lt!459067) (index!41373 lt!459067) key!909 (_keys!11597 thiss!1427) (mask!30390 thiss!1427)))))

(declare-fun d!126111 () Bool)

(declare-fun lt!459066 () SeekEntryResult!9750)

(assert (=> d!126111 (and (or ((_ is MissingVacant!9750) lt!459066) (not ((_ is Found!9750) lt!459066)) (and (bvsge (index!41372 lt!459066) #b00000000000000000000000000000000) (bvslt (index!41372 lt!459066) (size!32111 (_keys!11597 thiss!1427))))) (not ((_ is MissingVacant!9750) lt!459066)) (or (not ((_ is Found!9750) lt!459066)) (= (select (arr!31579 (_keys!11597 thiss!1427)) (index!41372 lt!459066)) key!909)))))

(declare-fun e!589897 () SeekEntryResult!9750)

(assert (=> d!126111 (= lt!459066 e!589897)))

(declare-fun c!105899 () Bool)

(assert (=> d!126111 (= c!105899 (and ((_ is Intermediate!9750) lt!459067) (undefined!10562 lt!459067)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65639 (_ BitVec 32)) SeekEntryResult!9750)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126111 (= lt!459067 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30390 thiss!1427)) key!909 (_keys!11597 thiss!1427) (mask!30390 thiss!1427)))))

(assert (=> d!126111 (validMask!0 (mask!30390 thiss!1427))))

(assert (=> d!126111 (= (seekEntry!0 key!909 (_keys!11597 thiss!1427) (mask!30390 thiss!1427)) lt!459066)))

(declare-fun b!1041764 () Bool)

(declare-fun c!105897 () Bool)

(declare-fun lt!459068 () (_ BitVec 64))

(assert (=> b!1041764 (= c!105897 (= lt!459068 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!589896 () SeekEntryResult!9750)

(assert (=> b!1041764 (= e!589896 e!589895)))

(declare-fun b!1041765 () Bool)

(assert (=> b!1041765 (= e!589897 Undefined!9750)))

(declare-fun b!1041766 () Bool)

(assert (=> b!1041766 (= e!589895 (MissingZero!9750 (index!41373 lt!459067)))))

(declare-fun b!1041767 () Bool)

(assert (=> b!1041767 (= e!589896 (Found!9750 (index!41373 lt!459067)))))

(declare-fun b!1041768 () Bool)

(assert (=> b!1041768 (= e!589897 e!589896)))

(assert (=> b!1041768 (= lt!459068 (select (arr!31579 (_keys!11597 thiss!1427)) (index!41373 lt!459067)))))

(declare-fun c!105898 () Bool)

(assert (=> b!1041768 (= c!105898 (= lt!459068 key!909))))

(assert (= (and d!126111 c!105899) b!1041765))

(assert (= (and d!126111 (not c!105899)) b!1041768))

(assert (= (and b!1041768 c!105898) b!1041767))

(assert (= (and b!1041768 (not c!105898)) b!1041764))

(assert (= (and b!1041764 c!105897) b!1041766))

(assert (= (and b!1041764 (not c!105897)) b!1041763))

(declare-fun m!961675 () Bool)

(assert (=> b!1041763 m!961675))

(declare-fun m!961677 () Bool)

(assert (=> d!126111 m!961677))

(declare-fun m!961679 () Bool)

(assert (=> d!126111 m!961679))

(assert (=> d!126111 m!961679))

(declare-fun m!961681 () Bool)

(assert (=> d!126111 m!961681))

(assert (=> d!126111 m!961667))

(declare-fun m!961683 () Bool)

(assert (=> b!1041768 m!961683))

(assert (=> b!1041621 d!126111))

(declare-fun d!126113 () Bool)

(assert (=> d!126113 (= (array_inv!24419 (_keys!11597 thiss!1427)) (bvsge (size!32111 (_keys!11597 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1041626 d!126113))

(declare-fun d!126115 () Bool)

(assert (=> d!126115 (= (array_inv!24420 (_values!6362 thiss!1427)) (bvsge (size!32112 (_values!6362 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1041626 d!126115))

(declare-fun b!1041770 () Bool)

(declare-fun e!589901 () Bool)

(declare-fun e!589898 () Bool)

(assert (=> b!1041770 (= e!589901 e!589898)))

(declare-fun c!105900 () Bool)

(assert (=> b!1041770 (= c!105900 (validKeyInArray!0 (select (arr!31579 (_keys!11597 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1041771 () Bool)

(declare-fun call!44123 () Bool)

(assert (=> b!1041771 (= e!589898 call!44123)))

(declare-fun b!1041772 () Bool)

(assert (=> b!1041772 (= e!589898 call!44123)))

(declare-fun bm!44120 () Bool)

(assert (=> bm!44120 (= call!44123 (arrayNoDuplicates!0 (_keys!11597 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105900 (Cons!21942 (select (arr!31579 (_keys!11597 thiss!1427)) #b00000000000000000000000000000000) Nil!21943) Nil!21943)))))

(declare-fun b!1041773 () Bool)

(declare-fun e!589900 () Bool)

(assert (=> b!1041773 (= e!589900 (contains!6075 Nil!21943 (select (arr!31579 (_keys!11597 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!126117 () Bool)

(declare-fun res!694180 () Bool)

(declare-fun e!589899 () Bool)

(assert (=> d!126117 (=> res!694180 e!589899)))

(assert (=> d!126117 (= res!694180 (bvsge #b00000000000000000000000000000000 (size!32111 (_keys!11597 thiss!1427))))))

(assert (=> d!126117 (= (arrayNoDuplicates!0 (_keys!11597 thiss!1427) #b00000000000000000000000000000000 Nil!21943) e!589899)))

(declare-fun b!1041769 () Bool)

(assert (=> b!1041769 (= e!589899 e!589901)))

(declare-fun res!694178 () Bool)

(assert (=> b!1041769 (=> (not res!694178) (not e!589901))))

(assert (=> b!1041769 (= res!694178 (not e!589900))))

(declare-fun res!694179 () Bool)

(assert (=> b!1041769 (=> (not res!694179) (not e!589900))))

(assert (=> b!1041769 (= res!694179 (validKeyInArray!0 (select (arr!31579 (_keys!11597 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!126117 (not res!694180)) b!1041769))

(assert (= (and b!1041769 res!694179) b!1041773))

(assert (= (and b!1041769 res!694178) b!1041770))

(assert (= (and b!1041770 c!105900) b!1041772))

(assert (= (and b!1041770 (not c!105900)) b!1041771))

(assert (= (or b!1041772 b!1041771) bm!44120))

(assert (=> b!1041770 m!961659))

(assert (=> b!1041770 m!961659))

(assert (=> b!1041770 m!961661))

(assert (=> bm!44120 m!961659))

(declare-fun m!961685 () Bool)

(assert (=> bm!44120 m!961685))

(assert (=> b!1041773 m!961659))

(assert (=> b!1041773 m!961659))

(declare-fun m!961687 () Bool)

(assert (=> b!1041773 m!961687))

(assert (=> b!1041769 m!961659))

(assert (=> b!1041769 m!961659))

(assert (=> b!1041769 m!961661))

(assert (=> b!1041620 d!126117))

(declare-fun d!126119 () Bool)

(assert (=> d!126119 (= (validKeyInArray!0 key!909) (and (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!909 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1041618 d!126119))

(declare-fun mapNonEmpty!38677 () Bool)

(declare-fun mapRes!38677 () Bool)

(declare-fun tp!74231 () Bool)

(declare-fun e!589907 () Bool)

(assert (=> mapNonEmpty!38677 (= mapRes!38677 (and tp!74231 e!589907))))

(declare-fun mapKey!38677 () (_ BitVec 32))

(declare-fun mapValue!38677 () ValueCell!11660)

(declare-fun mapRest!38677 () (Array (_ BitVec 32) ValueCell!11660))

(assert (=> mapNonEmpty!38677 (= mapRest!38668 (store mapRest!38677 mapKey!38677 mapValue!38677))))

(declare-fun b!1041781 () Bool)

(declare-fun e!589906 () Bool)

(assert (=> b!1041781 (= e!589906 tp_is_empty!24727)))

(declare-fun mapIsEmpty!38677 () Bool)

(assert (=> mapIsEmpty!38677 mapRes!38677))

(declare-fun condMapEmpty!38677 () Bool)

(declare-fun mapDefault!38677 () ValueCell!11660)

(assert (=> mapNonEmpty!38668 (= condMapEmpty!38677 (= mapRest!38668 ((as const (Array (_ BitVec 32) ValueCell!11660)) mapDefault!38677)))))

(assert (=> mapNonEmpty!38668 (= tp!74216 (and e!589906 mapRes!38677))))

(declare-fun b!1041780 () Bool)

(assert (=> b!1041780 (= e!589907 tp_is_empty!24727)))

(assert (= (and mapNonEmpty!38668 condMapEmpty!38677) mapIsEmpty!38677))

(assert (= (and mapNonEmpty!38668 (not condMapEmpty!38677)) mapNonEmpty!38677))

(assert (= (and mapNonEmpty!38677 ((_ is ValueCellFull!11660) mapValue!38677)) b!1041780))

(assert (= (and mapNonEmpty!38668 ((_ is ValueCellFull!11660) mapDefault!38677)) b!1041781))

(declare-fun m!961689 () Bool)

(assert (=> mapNonEmpty!38677 m!961689))

(check-sat (not b!1041749) (not bm!44115) tp_is_empty!24727 (not b!1041705) (not d!126109) (not bm!44120) (not bm!44119) (not b!1041763) (not b!1041718) (not b!1041741) (not b!1041773) (not bm!44112) (not b!1041707) (not b!1041704) (not d!126111) (not d!126107) b_and!33549 (not mapNonEmpty!38677) (not b!1041737) (not d!126097) (not b_next!21007) (not b!1041733) (not b!1041722) (not bm!44118) (not b!1041716) (not d!126101) (not b!1041691) (not b!1041748) (not b!1041750) (not b!1041769) (not b!1041695) (not b!1041770) (not b!1041692))
(check-sat b_and!33549 (not b_next!21007))
