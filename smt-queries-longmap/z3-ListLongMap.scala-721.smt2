; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16850 () Bool)

(assert start!16850)

(declare-fun b!169816 () Bool)

(declare-fun b_free!4165 () Bool)

(declare-fun b_next!4165 () Bool)

(assert (=> b!169816 (= b_free!4165 (not b_next!4165))))

(declare-fun tp!15100 () Bool)

(declare-fun b_and!10593 () Bool)

(assert (=> b!169816 (= tp!15100 b_and!10593)))

(declare-fun b!169815 () Bool)

(declare-fun res!80732 () Bool)

(declare-fun e!111992 () Bool)

(assert (=> b!169815 (=> (not res!80732) (not e!111992))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!169815 (= res!80732 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!6673 () Bool)

(declare-fun mapRes!6673 () Bool)

(assert (=> mapIsEmpty!6673 mapRes!6673))

(declare-fun e!111994 () Bool)

(declare-fun tp_is_empty!3937 () Bool)

(declare-fun e!111996 () Bool)

(declare-datatypes ((V!4897 0))(
  ( (V!4898 (val!2013 Int)) )
))
(declare-datatypes ((ValueCell!1625 0))(
  ( (ValueCellFull!1625 (v!3879 V!4897)) (EmptyCell!1625) )
))
(declare-datatypes ((array!6959 0))(
  ( (array!6960 (arr!3314 (Array (_ BitVec 32) (_ BitVec 64))) (size!3603 (_ BitVec 32))) )
))
(declare-datatypes ((array!6961 0))(
  ( (array!6962 (arr!3315 (Array (_ BitVec 32) ValueCell!1625)) (size!3604 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2158 0))(
  ( (LongMapFixedSize!2159 (defaultEntry!3521 Int) (mask!8314 (_ BitVec 32)) (extraKeys!3262 (_ BitVec 32)) (zeroValue!3364 V!4897) (minValue!3364 V!4897) (_size!1128 (_ BitVec 32)) (_keys!5347 array!6959) (_values!3504 array!6961) (_vacant!1128 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2158)

(declare-fun array_inv!2127 (array!6959) Bool)

(declare-fun array_inv!2128 (array!6961) Bool)

(assert (=> b!169816 (= e!111994 (and tp!15100 tp_is_empty!3937 (array_inv!2127 (_keys!5347 thiss!1248)) (array_inv!2128 (_values!3504 thiss!1248)) e!111996))))

(declare-fun b!169817 () Bool)

(declare-fun res!80733 () Bool)

(assert (=> b!169817 (=> (not res!80733) (not e!111992))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!169817 (= res!80733 (validMask!0 (mask!8314 thiss!1248)))))

(declare-fun b!169818 () Bool)

(declare-fun e!111997 () Bool)

(assert (=> b!169818 (= e!111996 (and e!111997 mapRes!6673))))

(declare-fun condMapEmpty!6673 () Bool)

(declare-fun mapDefault!6673 () ValueCell!1625)

(assert (=> b!169818 (= condMapEmpty!6673 (= (arr!3315 (_values!3504 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1625)) mapDefault!6673)))))

(declare-fun res!80731 () Bool)

(assert (=> start!16850 (=> (not res!80731) (not e!111992))))

(declare-fun valid!940 (LongMapFixedSize!2158) Bool)

(assert (=> start!16850 (= res!80731 (valid!940 thiss!1248))))

(assert (=> start!16850 e!111992))

(assert (=> start!16850 e!111994))

(assert (=> start!16850 true))

(declare-fun b!169819 () Bool)

(declare-fun e!111993 () Bool)

(assert (=> b!169819 (= e!111993 tp_is_empty!3937)))

(declare-fun mapNonEmpty!6673 () Bool)

(declare-fun tp!15099 () Bool)

(assert (=> mapNonEmpty!6673 (= mapRes!6673 (and tp!15099 e!111993))))

(declare-fun mapRest!6673 () (Array (_ BitVec 32) ValueCell!1625))

(declare-fun mapKey!6673 () (_ BitVec 32))

(declare-fun mapValue!6673 () ValueCell!1625)

(assert (=> mapNonEmpty!6673 (= (arr!3315 (_values!3504 thiss!1248)) (store mapRest!6673 mapKey!6673 mapValue!6673))))

(declare-fun b!169820 () Bool)

(assert (=> b!169820 (= e!111992 (not (= (size!3604 (_values!3504 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8314 thiss!1248)))))))

(declare-fun b!169821 () Bool)

(assert (=> b!169821 (= e!111997 tp_is_empty!3937)))

(assert (= (and start!16850 res!80731) b!169815))

(assert (= (and b!169815 res!80732) b!169817))

(assert (= (and b!169817 res!80733) b!169820))

(assert (= (and b!169818 condMapEmpty!6673) mapIsEmpty!6673))

(assert (= (and b!169818 (not condMapEmpty!6673)) mapNonEmpty!6673))

(get-info :version)

(assert (= (and mapNonEmpty!6673 ((_ is ValueCellFull!1625) mapValue!6673)) b!169819))

(assert (= (and b!169818 ((_ is ValueCellFull!1625) mapDefault!6673)) b!169821))

(assert (= b!169816 b!169818))

(assert (= start!16850 b!169816))

(declare-fun m!198817 () Bool)

(assert (=> b!169816 m!198817))

(declare-fun m!198819 () Bool)

(assert (=> b!169816 m!198819))

(declare-fun m!198821 () Bool)

(assert (=> b!169817 m!198821))

(declare-fun m!198823 () Bool)

(assert (=> start!16850 m!198823))

(declare-fun m!198825 () Bool)

(assert (=> mapNonEmpty!6673 m!198825))

(check-sat tp_is_empty!3937 (not start!16850) (not b_next!4165) (not b!169817) (not mapNonEmpty!6673) b_and!10593 (not b!169816))
(check-sat b_and!10593 (not b_next!4165))
(get-model)

(declare-fun d!51725 () Bool)

(assert (=> d!51725 (= (validMask!0 (mask!8314 thiss!1248)) (and (or (= (mask!8314 thiss!1248) #b00000000000000000000000000000111) (= (mask!8314 thiss!1248) #b00000000000000000000000000001111) (= (mask!8314 thiss!1248) #b00000000000000000000000000011111) (= (mask!8314 thiss!1248) #b00000000000000000000000000111111) (= (mask!8314 thiss!1248) #b00000000000000000000000001111111) (= (mask!8314 thiss!1248) #b00000000000000000000000011111111) (= (mask!8314 thiss!1248) #b00000000000000000000000111111111) (= (mask!8314 thiss!1248) #b00000000000000000000001111111111) (= (mask!8314 thiss!1248) #b00000000000000000000011111111111) (= (mask!8314 thiss!1248) #b00000000000000000000111111111111) (= (mask!8314 thiss!1248) #b00000000000000000001111111111111) (= (mask!8314 thiss!1248) #b00000000000000000011111111111111) (= (mask!8314 thiss!1248) #b00000000000000000111111111111111) (= (mask!8314 thiss!1248) #b00000000000000001111111111111111) (= (mask!8314 thiss!1248) #b00000000000000011111111111111111) (= (mask!8314 thiss!1248) #b00000000000000111111111111111111) (= (mask!8314 thiss!1248) #b00000000000001111111111111111111) (= (mask!8314 thiss!1248) #b00000000000011111111111111111111) (= (mask!8314 thiss!1248) #b00000000000111111111111111111111) (= (mask!8314 thiss!1248) #b00000000001111111111111111111111) (= (mask!8314 thiss!1248) #b00000000011111111111111111111111) (= (mask!8314 thiss!1248) #b00000000111111111111111111111111) (= (mask!8314 thiss!1248) #b00000001111111111111111111111111) (= (mask!8314 thiss!1248) #b00000011111111111111111111111111) (= (mask!8314 thiss!1248) #b00000111111111111111111111111111) (= (mask!8314 thiss!1248) #b00001111111111111111111111111111) (= (mask!8314 thiss!1248) #b00011111111111111111111111111111) (= (mask!8314 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8314 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!169817 d!51725))

(declare-fun d!51727 () Bool)

(declare-fun res!80758 () Bool)

(declare-fun e!112036 () Bool)

(assert (=> d!51727 (=> (not res!80758) (not e!112036))))

(declare-fun simpleValid!128 (LongMapFixedSize!2158) Bool)

(assert (=> d!51727 (= res!80758 (simpleValid!128 thiss!1248))))

(assert (=> d!51727 (= (valid!940 thiss!1248) e!112036)))

(declare-fun b!169870 () Bool)

(declare-fun res!80759 () Bool)

(assert (=> b!169870 (=> (not res!80759) (not e!112036))))

(declare-fun arrayCountValidKeys!0 (array!6959 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!169870 (= res!80759 (= (arrayCountValidKeys!0 (_keys!5347 thiss!1248) #b00000000000000000000000000000000 (size!3603 (_keys!5347 thiss!1248))) (_size!1128 thiss!1248)))))

(declare-fun b!169871 () Bool)

(declare-fun res!80760 () Bool)

(assert (=> b!169871 (=> (not res!80760) (not e!112036))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6959 (_ BitVec 32)) Bool)

(assert (=> b!169871 (= res!80760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5347 thiss!1248) (mask!8314 thiss!1248)))))

(declare-fun b!169872 () Bool)

(declare-datatypes ((List!2167 0))(
  ( (Nil!2164) (Cons!2163 (h!2780 (_ BitVec 64)) (t!6961 List!2167)) )
))
(declare-fun arrayNoDuplicates!0 (array!6959 (_ BitVec 32) List!2167) Bool)

(assert (=> b!169872 (= e!112036 (arrayNoDuplicates!0 (_keys!5347 thiss!1248) #b00000000000000000000000000000000 Nil!2164))))

(assert (= (and d!51727 res!80758) b!169870))

(assert (= (and b!169870 res!80759) b!169871))

(assert (= (and b!169871 res!80760) b!169872))

(declare-fun m!198847 () Bool)

(assert (=> d!51727 m!198847))

(declare-fun m!198849 () Bool)

(assert (=> b!169870 m!198849))

(declare-fun m!198851 () Bool)

(assert (=> b!169871 m!198851))

(declare-fun m!198853 () Bool)

(assert (=> b!169872 m!198853))

(assert (=> start!16850 d!51727))

(declare-fun d!51729 () Bool)

(assert (=> d!51729 (= (array_inv!2127 (_keys!5347 thiss!1248)) (bvsge (size!3603 (_keys!5347 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!169816 d!51729))

(declare-fun d!51731 () Bool)

(assert (=> d!51731 (= (array_inv!2128 (_values!3504 thiss!1248)) (bvsge (size!3604 (_values!3504 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!169816 d!51731))

(declare-fun b!169880 () Bool)

(declare-fun e!112042 () Bool)

(assert (=> b!169880 (= e!112042 tp_is_empty!3937)))

(declare-fun mapNonEmpty!6682 () Bool)

(declare-fun mapRes!6682 () Bool)

(declare-fun tp!15115 () Bool)

(declare-fun e!112041 () Bool)

(assert (=> mapNonEmpty!6682 (= mapRes!6682 (and tp!15115 e!112041))))

(declare-fun mapValue!6682 () ValueCell!1625)

(declare-fun mapKey!6682 () (_ BitVec 32))

(declare-fun mapRest!6682 () (Array (_ BitVec 32) ValueCell!1625))

(assert (=> mapNonEmpty!6682 (= mapRest!6673 (store mapRest!6682 mapKey!6682 mapValue!6682))))

(declare-fun condMapEmpty!6682 () Bool)

(declare-fun mapDefault!6682 () ValueCell!1625)

(assert (=> mapNonEmpty!6673 (= condMapEmpty!6682 (= mapRest!6673 ((as const (Array (_ BitVec 32) ValueCell!1625)) mapDefault!6682)))))

(assert (=> mapNonEmpty!6673 (= tp!15099 (and e!112042 mapRes!6682))))

(declare-fun b!169879 () Bool)

(assert (=> b!169879 (= e!112041 tp_is_empty!3937)))

(declare-fun mapIsEmpty!6682 () Bool)

(assert (=> mapIsEmpty!6682 mapRes!6682))

(assert (= (and mapNonEmpty!6673 condMapEmpty!6682) mapIsEmpty!6682))

(assert (= (and mapNonEmpty!6673 (not condMapEmpty!6682)) mapNonEmpty!6682))

(assert (= (and mapNonEmpty!6682 ((_ is ValueCellFull!1625) mapValue!6682)) b!169879))

(assert (= (and mapNonEmpty!6673 ((_ is ValueCellFull!1625) mapDefault!6682)) b!169880))

(declare-fun m!198855 () Bool)

(assert (=> mapNonEmpty!6682 m!198855))

(check-sat (not b!169871) (not b!169870) (not mapNonEmpty!6682) tp_is_empty!3937 (not b_next!4165) (not d!51727) b_and!10593 (not b!169872))
(check-sat b_and!10593 (not b_next!4165))
(get-model)

(declare-fun b!169891 () Bool)

(declare-fun e!112051 () Bool)

(declare-fun call!17335 () Bool)

(assert (=> b!169891 (= e!112051 call!17335)))

(declare-fun bm!17332 () Bool)

(declare-fun c!30455 () Bool)

(assert (=> bm!17332 (= call!17335 (arrayNoDuplicates!0 (_keys!5347 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30455 (Cons!2163 (select (arr!3314 (_keys!5347 thiss!1248)) #b00000000000000000000000000000000) Nil!2164) Nil!2164)))))

(declare-fun b!169892 () Bool)

(assert (=> b!169892 (= e!112051 call!17335)))

(declare-fun b!169893 () Bool)

(declare-fun e!112052 () Bool)

(declare-fun contains!1134 (List!2167 (_ BitVec 64)) Bool)

(assert (=> b!169893 (= e!112052 (contains!1134 Nil!2164 (select (arr!3314 (_keys!5347 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!169895 () Bool)

(declare-fun e!112054 () Bool)

(declare-fun e!112053 () Bool)

(assert (=> b!169895 (= e!112054 e!112053)))

(declare-fun res!80767 () Bool)

(assert (=> b!169895 (=> (not res!80767) (not e!112053))))

(assert (=> b!169895 (= res!80767 (not e!112052))))

(declare-fun res!80768 () Bool)

(assert (=> b!169895 (=> (not res!80768) (not e!112052))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!169895 (= res!80768 (validKeyInArray!0 (select (arr!3314 (_keys!5347 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!51733 () Bool)

(declare-fun res!80769 () Bool)

(assert (=> d!51733 (=> res!80769 e!112054)))

(assert (=> d!51733 (= res!80769 (bvsge #b00000000000000000000000000000000 (size!3603 (_keys!5347 thiss!1248))))))

(assert (=> d!51733 (= (arrayNoDuplicates!0 (_keys!5347 thiss!1248) #b00000000000000000000000000000000 Nil!2164) e!112054)))

(declare-fun b!169894 () Bool)

(assert (=> b!169894 (= e!112053 e!112051)))

(assert (=> b!169894 (= c!30455 (validKeyInArray!0 (select (arr!3314 (_keys!5347 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51733 (not res!80769)) b!169895))

(assert (= (and b!169895 res!80768) b!169893))

(assert (= (and b!169895 res!80767) b!169894))

(assert (= (and b!169894 c!30455) b!169892))

(assert (= (and b!169894 (not c!30455)) b!169891))

(assert (= (or b!169892 b!169891) bm!17332))

(declare-fun m!198857 () Bool)

(assert (=> bm!17332 m!198857))

(declare-fun m!198859 () Bool)

(assert (=> bm!17332 m!198859))

(assert (=> b!169893 m!198857))

(assert (=> b!169893 m!198857))

(declare-fun m!198861 () Bool)

(assert (=> b!169893 m!198861))

(assert (=> b!169895 m!198857))

(assert (=> b!169895 m!198857))

(declare-fun m!198863 () Bool)

(assert (=> b!169895 m!198863))

(assert (=> b!169894 m!198857))

(assert (=> b!169894 m!198857))

(assert (=> b!169894 m!198863))

(assert (=> b!169872 d!51733))

(declare-fun b!169904 () Bool)

(declare-fun e!112061 () Bool)

(declare-fun e!112062 () Bool)

(assert (=> b!169904 (= e!112061 e!112062)))

(declare-fun c!30458 () Bool)

(assert (=> b!169904 (= c!30458 (validKeyInArray!0 (select (arr!3314 (_keys!5347 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!169905 () Bool)

(declare-fun call!17338 () Bool)

(assert (=> b!169905 (= e!112062 call!17338)))

(declare-fun b!169906 () Bool)

(declare-fun e!112063 () Bool)

(assert (=> b!169906 (= e!112063 call!17338)))

(declare-fun bm!17335 () Bool)

(assert (=> bm!17335 (= call!17338 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5347 thiss!1248) (mask!8314 thiss!1248)))))

(declare-fun b!169907 () Bool)

(assert (=> b!169907 (= e!112062 e!112063)))

(declare-fun lt!85028 () (_ BitVec 64))

(assert (=> b!169907 (= lt!85028 (select (arr!3314 (_keys!5347 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5239 0))(
  ( (Unit!5240) )
))
(declare-fun lt!85029 () Unit!5239)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!6959 (_ BitVec 64) (_ BitVec 32)) Unit!5239)

(assert (=> b!169907 (= lt!85029 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5347 thiss!1248) lt!85028 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!6959 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!169907 (arrayContainsKey!0 (_keys!5347 thiss!1248) lt!85028 #b00000000000000000000000000000000)))

(declare-fun lt!85027 () Unit!5239)

(assert (=> b!169907 (= lt!85027 lt!85029)))

(declare-fun res!80775 () Bool)

(declare-datatypes ((SeekEntryResult!522 0))(
  ( (MissingZero!522 (index!4256 (_ BitVec 32))) (Found!522 (index!4257 (_ BitVec 32))) (Intermediate!522 (undefined!1334 Bool) (index!4258 (_ BitVec 32)) (x!18770 (_ BitVec 32))) (Undefined!522) (MissingVacant!522 (index!4259 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6959 (_ BitVec 32)) SeekEntryResult!522)

(assert (=> b!169907 (= res!80775 (= (seekEntryOrOpen!0 (select (arr!3314 (_keys!5347 thiss!1248)) #b00000000000000000000000000000000) (_keys!5347 thiss!1248) (mask!8314 thiss!1248)) (Found!522 #b00000000000000000000000000000000)))))

(assert (=> b!169907 (=> (not res!80775) (not e!112063))))

(declare-fun d!51735 () Bool)

(declare-fun res!80774 () Bool)

(assert (=> d!51735 (=> res!80774 e!112061)))

(assert (=> d!51735 (= res!80774 (bvsge #b00000000000000000000000000000000 (size!3603 (_keys!5347 thiss!1248))))))

(assert (=> d!51735 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5347 thiss!1248) (mask!8314 thiss!1248)) e!112061)))

(assert (= (and d!51735 (not res!80774)) b!169904))

(assert (= (and b!169904 c!30458) b!169907))

(assert (= (and b!169904 (not c!30458)) b!169905))

(assert (= (and b!169907 res!80775) b!169906))

(assert (= (or b!169906 b!169905) bm!17335))

(assert (=> b!169904 m!198857))

(assert (=> b!169904 m!198857))

(assert (=> b!169904 m!198863))

(declare-fun m!198865 () Bool)

(assert (=> bm!17335 m!198865))

(assert (=> b!169907 m!198857))

(declare-fun m!198867 () Bool)

(assert (=> b!169907 m!198867))

(declare-fun m!198869 () Bool)

(assert (=> b!169907 m!198869))

(assert (=> b!169907 m!198857))

(declare-fun m!198871 () Bool)

(assert (=> b!169907 m!198871))

(assert (=> b!169871 d!51735))

(declare-fun b!169916 () Bool)

(declare-fun e!112069 () (_ BitVec 32))

(assert (=> b!169916 (= e!112069 #b00000000000000000000000000000000)))

(declare-fun b!169917 () Bool)

(declare-fun e!112068 () (_ BitVec 32))

(declare-fun call!17341 () (_ BitVec 32))

(assert (=> b!169917 (= e!112068 call!17341)))

(declare-fun d!51737 () Bool)

(declare-fun lt!85032 () (_ BitVec 32))

(assert (=> d!51737 (and (bvsge lt!85032 #b00000000000000000000000000000000) (bvsle lt!85032 (bvsub (size!3603 (_keys!5347 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!51737 (= lt!85032 e!112069)))

(declare-fun c!30464 () Bool)

(assert (=> d!51737 (= c!30464 (bvsge #b00000000000000000000000000000000 (size!3603 (_keys!5347 thiss!1248))))))

(assert (=> d!51737 (and (bvsle #b00000000000000000000000000000000 (size!3603 (_keys!5347 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3603 (_keys!5347 thiss!1248)) (size!3603 (_keys!5347 thiss!1248))))))

(assert (=> d!51737 (= (arrayCountValidKeys!0 (_keys!5347 thiss!1248) #b00000000000000000000000000000000 (size!3603 (_keys!5347 thiss!1248))) lt!85032)))

(declare-fun b!169918 () Bool)

(assert (=> b!169918 (= e!112068 (bvadd #b00000000000000000000000000000001 call!17341))))

(declare-fun b!169919 () Bool)

(assert (=> b!169919 (= e!112069 e!112068)))

(declare-fun c!30463 () Bool)

(assert (=> b!169919 (= c!30463 (validKeyInArray!0 (select (arr!3314 (_keys!5347 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17338 () Bool)

(assert (=> bm!17338 (= call!17341 (arrayCountValidKeys!0 (_keys!5347 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3603 (_keys!5347 thiss!1248))))))

(assert (= (and d!51737 c!30464) b!169916))

(assert (= (and d!51737 (not c!30464)) b!169919))

(assert (= (and b!169919 c!30463) b!169918))

(assert (= (and b!169919 (not c!30463)) b!169917))

(assert (= (or b!169918 b!169917) bm!17338))

(assert (=> b!169919 m!198857))

(assert (=> b!169919 m!198857))

(assert (=> b!169919 m!198863))

(declare-fun m!198873 () Bool)

(assert (=> bm!17338 m!198873))

(assert (=> b!169870 d!51737))

(declare-fun d!51739 () Bool)

(declare-fun res!80786 () Bool)

(declare-fun e!112072 () Bool)

(assert (=> d!51739 (=> (not res!80786) (not e!112072))))

(assert (=> d!51739 (= res!80786 (validMask!0 (mask!8314 thiss!1248)))))

(assert (=> d!51739 (= (simpleValid!128 thiss!1248) e!112072)))

(declare-fun b!169929 () Bool)

(declare-fun res!80785 () Bool)

(assert (=> b!169929 (=> (not res!80785) (not e!112072))))

(declare-fun size!3609 (LongMapFixedSize!2158) (_ BitVec 32))

(assert (=> b!169929 (= res!80785 (bvsge (size!3609 thiss!1248) (_size!1128 thiss!1248)))))

(declare-fun b!169930 () Bool)

(declare-fun res!80787 () Bool)

(assert (=> b!169930 (=> (not res!80787) (not e!112072))))

(assert (=> b!169930 (= res!80787 (= (size!3609 thiss!1248) (bvadd (_size!1128 thiss!1248) (bvsdiv (bvadd (extraKeys!3262 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!169928 () Bool)

(declare-fun res!80784 () Bool)

(assert (=> b!169928 (=> (not res!80784) (not e!112072))))

(assert (=> b!169928 (= res!80784 (and (= (size!3604 (_values!3504 thiss!1248)) (bvadd (mask!8314 thiss!1248) #b00000000000000000000000000000001)) (= (size!3603 (_keys!5347 thiss!1248)) (size!3604 (_values!3504 thiss!1248))) (bvsge (_size!1128 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1128 thiss!1248) (bvadd (mask!8314 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!169931 () Bool)

(assert (=> b!169931 (= e!112072 (and (bvsge (extraKeys!3262 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3262 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1128 thiss!1248) #b00000000000000000000000000000000)))))

(assert (= (and d!51739 res!80786) b!169928))

(assert (= (and b!169928 res!80784) b!169929))

(assert (= (and b!169929 res!80785) b!169930))

(assert (= (and b!169930 res!80787) b!169931))

(assert (=> d!51739 m!198821))

(declare-fun m!198875 () Bool)

(assert (=> b!169929 m!198875))

(assert (=> b!169930 m!198875))

(assert (=> d!51727 d!51739))

(declare-fun b!169933 () Bool)

(declare-fun e!112074 () Bool)

(assert (=> b!169933 (= e!112074 tp_is_empty!3937)))

(declare-fun mapNonEmpty!6683 () Bool)

(declare-fun mapRes!6683 () Bool)

(declare-fun tp!15116 () Bool)

(declare-fun e!112073 () Bool)

(assert (=> mapNonEmpty!6683 (= mapRes!6683 (and tp!15116 e!112073))))

(declare-fun mapKey!6683 () (_ BitVec 32))

(declare-fun mapRest!6683 () (Array (_ BitVec 32) ValueCell!1625))

(declare-fun mapValue!6683 () ValueCell!1625)

(assert (=> mapNonEmpty!6683 (= mapRest!6682 (store mapRest!6683 mapKey!6683 mapValue!6683))))

(declare-fun condMapEmpty!6683 () Bool)

(declare-fun mapDefault!6683 () ValueCell!1625)

(assert (=> mapNonEmpty!6682 (= condMapEmpty!6683 (= mapRest!6682 ((as const (Array (_ BitVec 32) ValueCell!1625)) mapDefault!6683)))))

(assert (=> mapNonEmpty!6682 (= tp!15115 (and e!112074 mapRes!6683))))

(declare-fun b!169932 () Bool)

(assert (=> b!169932 (= e!112073 tp_is_empty!3937)))

(declare-fun mapIsEmpty!6683 () Bool)

(assert (=> mapIsEmpty!6683 mapRes!6683))

(assert (= (and mapNonEmpty!6682 condMapEmpty!6683) mapIsEmpty!6683))

(assert (= (and mapNonEmpty!6682 (not condMapEmpty!6683)) mapNonEmpty!6683))

(assert (= (and mapNonEmpty!6683 ((_ is ValueCellFull!1625) mapValue!6683)) b!169932))

(assert (= (and mapNonEmpty!6682 ((_ is ValueCellFull!1625) mapDefault!6683)) b!169933))

(declare-fun m!198877 () Bool)

(assert (=> mapNonEmpty!6683 m!198877))

(check-sat (not b!169904) (not mapNonEmpty!6683) (not b!169929) tp_is_empty!3937 (not bm!17338) (not b!169930) (not b_next!4165) (not b!169919) (not b!169893) (not b!169895) (not b!169894) (not bm!17332) (not d!51739) (not bm!17335) b_and!10593 (not b!169907))
(check-sat b_and!10593 (not b_next!4165))
