; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16014 () Bool)

(assert start!16014)

(declare-fun b!158772 () Bool)

(declare-fun b_free!3499 () Bool)

(declare-fun b_next!3499 () Bool)

(assert (=> b!158772 (= b_free!3499 (not b_next!3499))))

(declare-fun tp!13060 () Bool)

(declare-fun b_and!9887 () Bool)

(assert (=> b!158772 (= tp!13060 b_and!9887)))

(declare-fun b!158769 () Bool)

(declare-fun e!103958 () Bool)

(declare-datatypes ((V!4049 0))(
  ( (V!4050 (val!1695 Int)) )
))
(declare-datatypes ((ValueCell!1307 0))(
  ( (ValueCellFull!1307 (v!3554 V!4049)) (EmptyCell!1307) )
))
(declare-datatypes ((array!5657 0))(
  ( (array!5658 (arr!2674 (Array (_ BitVec 32) (_ BitVec 64))) (size!2959 (_ BitVec 32))) )
))
(declare-datatypes ((array!5659 0))(
  ( (array!5660 (arr!2675 (Array (_ BitVec 32) ValueCell!1307)) (size!2960 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1522 0))(
  ( (LongMapFixedSize!1523 (defaultEntry!3203 Int) (mask!7738 (_ BitVec 32)) (extraKeys!2944 (_ BitVec 32)) (zeroValue!3046 V!4049) (minValue!3046 V!4049) (_size!810 (_ BitVec 32)) (_keys!4999 array!5657) (_values!3186 array!5659) (_vacant!810 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1522)

(declare-datatypes ((List!1890 0))(
  ( (Nil!1887) (Cons!1886 (h!2499 (_ BitVec 64)) (t!6683 List!1890)) )
))
(declare-fun arrayNoDuplicates!0 (array!5657 (_ BitVec 32) List!1890) Bool)

(assert (=> b!158769 (= e!103958 (not (arrayNoDuplicates!0 (_keys!4999 thiss!1248) #b00000000000000000000000000000000 Nil!1887)))))

(declare-fun b!158770 () Bool)

(declare-fun res!74938 () Bool)

(assert (=> b!158770 (=> (not res!74938) (not e!103958))))

(assert (=> b!158770 (= res!74938 (and (= (size!2960 (_values!3186 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7738 thiss!1248))) (= (size!2959 (_keys!4999 thiss!1248)) (size!2960 (_values!3186 thiss!1248))) (bvsge (mask!7738 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2944 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2944 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!158771 () Bool)

(declare-fun res!74936 () Bool)

(assert (=> b!158771 (=> (not res!74936) (not e!103958))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!158771 (= res!74936 (validMask!0 (mask!7738 thiss!1248)))))

(declare-fun e!103959 () Bool)

(declare-fun e!103962 () Bool)

(declare-fun tp_is_empty!3301 () Bool)

(declare-fun array_inv!1717 (array!5657) Bool)

(declare-fun array_inv!1718 (array!5659) Bool)

(assert (=> b!158772 (= e!103959 (and tp!13060 tp_is_empty!3301 (array_inv!1717 (_keys!4999 thiss!1248)) (array_inv!1718 (_values!3186 thiss!1248)) e!103962))))

(declare-fun b!158773 () Bool)

(declare-fun e!103960 () Bool)

(assert (=> b!158773 (= e!103960 tp_is_empty!3301)))

(declare-fun b!158774 () Bool)

(declare-fun e!103961 () Bool)

(declare-fun mapRes!5633 () Bool)

(assert (=> b!158774 (= e!103962 (and e!103961 mapRes!5633))))

(declare-fun condMapEmpty!5633 () Bool)

(declare-fun mapDefault!5633 () ValueCell!1307)

(assert (=> b!158774 (= condMapEmpty!5633 (= (arr!2675 (_values!3186 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1307)) mapDefault!5633)))))

(declare-fun res!74935 () Bool)

(assert (=> start!16014 (=> (not res!74935) (not e!103958))))

(declare-fun valid!718 (LongMapFixedSize!1522) Bool)

(assert (=> start!16014 (= res!74935 (valid!718 thiss!1248))))

(assert (=> start!16014 e!103958))

(assert (=> start!16014 e!103959))

(assert (=> start!16014 true))

(declare-fun b!158775 () Bool)

(declare-fun res!74939 () Bool)

(assert (=> b!158775 (=> (not res!74939) (not e!103958))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5657 (_ BitVec 32)) Bool)

(assert (=> b!158775 (= res!74939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4999 thiss!1248) (mask!7738 thiss!1248)))))

(declare-fun b!158776 () Bool)

(declare-fun res!74937 () Bool)

(assert (=> b!158776 (=> (not res!74937) (not e!103958))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!158776 (= res!74937 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!5633 () Bool)

(assert (=> mapIsEmpty!5633 mapRes!5633))

(declare-fun b!158777 () Bool)

(assert (=> b!158777 (= e!103961 tp_is_empty!3301)))

(declare-fun b!158778 () Bool)

(declare-fun res!74940 () Bool)

(assert (=> b!158778 (=> (not res!74940) (not e!103958))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!308 0))(
  ( (MissingZero!308 (index!3400 (_ BitVec 32))) (Found!308 (index!3401 (_ BitVec 32))) (Intermediate!308 (undefined!1120 Bool) (index!3402 (_ BitVec 32)) (x!17555 (_ BitVec 32))) (Undefined!308) (MissingVacant!308 (index!3403 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5657 (_ BitVec 32)) SeekEntryResult!308)

(assert (=> b!158778 (= res!74940 ((_ is Undefined!308) (seekEntryOrOpen!0 key!828 (_keys!4999 thiss!1248) (mask!7738 thiss!1248))))))

(declare-fun mapNonEmpty!5633 () Bool)

(declare-fun tp!13061 () Bool)

(assert (=> mapNonEmpty!5633 (= mapRes!5633 (and tp!13061 e!103960))))

(declare-fun mapRest!5633 () (Array (_ BitVec 32) ValueCell!1307))

(declare-fun mapValue!5633 () ValueCell!1307)

(declare-fun mapKey!5633 () (_ BitVec 32))

(assert (=> mapNonEmpty!5633 (= (arr!2675 (_values!3186 thiss!1248)) (store mapRest!5633 mapKey!5633 mapValue!5633))))

(assert (= (and start!16014 res!74935) b!158776))

(assert (= (and b!158776 res!74937) b!158778))

(assert (= (and b!158778 res!74940) b!158771))

(assert (= (and b!158771 res!74936) b!158770))

(assert (= (and b!158770 res!74938) b!158775))

(assert (= (and b!158775 res!74939) b!158769))

(assert (= (and b!158774 condMapEmpty!5633) mapIsEmpty!5633))

(assert (= (and b!158774 (not condMapEmpty!5633)) mapNonEmpty!5633))

(assert (= (and mapNonEmpty!5633 ((_ is ValueCellFull!1307) mapValue!5633)) b!158773))

(assert (= (and b!158774 ((_ is ValueCellFull!1307) mapDefault!5633)) b!158777))

(assert (= b!158772 b!158774))

(assert (= start!16014 b!158772))

(declare-fun m!190789 () Bool)

(assert (=> mapNonEmpty!5633 m!190789))

(declare-fun m!190791 () Bool)

(assert (=> b!158769 m!190791))

(declare-fun m!190793 () Bool)

(assert (=> b!158772 m!190793))

(declare-fun m!190795 () Bool)

(assert (=> b!158772 m!190795))

(declare-fun m!190797 () Bool)

(assert (=> b!158778 m!190797))

(declare-fun m!190799 () Bool)

(assert (=> start!16014 m!190799))

(declare-fun m!190801 () Bool)

(assert (=> b!158771 m!190801))

(declare-fun m!190803 () Bool)

(assert (=> b!158775 m!190803))

(check-sat (not mapNonEmpty!5633) (not b!158778) (not b!158775) (not start!16014) b_and!9887 (not b_next!3499) (not b!158772) tp_is_empty!3301 (not b!158769) (not b!158771))
(check-sat b_and!9887 (not b_next!3499))
(get-model)

(declare-fun d!51091 () Bool)

(declare-fun lt!81768 () SeekEntryResult!308)

(assert (=> d!51091 (and (or ((_ is Undefined!308) lt!81768) (not ((_ is Found!308) lt!81768)) (and (bvsge (index!3401 lt!81768) #b00000000000000000000000000000000) (bvslt (index!3401 lt!81768) (size!2959 (_keys!4999 thiss!1248))))) (or ((_ is Undefined!308) lt!81768) ((_ is Found!308) lt!81768) (not ((_ is MissingZero!308) lt!81768)) (and (bvsge (index!3400 lt!81768) #b00000000000000000000000000000000) (bvslt (index!3400 lt!81768) (size!2959 (_keys!4999 thiss!1248))))) (or ((_ is Undefined!308) lt!81768) ((_ is Found!308) lt!81768) ((_ is MissingZero!308) lt!81768) (not ((_ is MissingVacant!308) lt!81768)) (and (bvsge (index!3403 lt!81768) #b00000000000000000000000000000000) (bvslt (index!3403 lt!81768) (size!2959 (_keys!4999 thiss!1248))))) (or ((_ is Undefined!308) lt!81768) (ite ((_ is Found!308) lt!81768) (= (select (arr!2674 (_keys!4999 thiss!1248)) (index!3401 lt!81768)) key!828) (ite ((_ is MissingZero!308) lt!81768) (= (select (arr!2674 (_keys!4999 thiss!1248)) (index!3400 lt!81768)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!308) lt!81768) (= (select (arr!2674 (_keys!4999 thiss!1248)) (index!3403 lt!81768)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!104006 () SeekEntryResult!308)

(assert (=> d!51091 (= lt!81768 e!104006)))

(declare-fun c!29883 () Bool)

(declare-fun lt!81767 () SeekEntryResult!308)

(assert (=> d!51091 (= c!29883 (and ((_ is Intermediate!308) lt!81767) (undefined!1120 lt!81767)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5657 (_ BitVec 32)) SeekEntryResult!308)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51091 (= lt!81767 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7738 thiss!1248)) key!828 (_keys!4999 thiss!1248) (mask!7738 thiss!1248)))))

(assert (=> d!51091 (validMask!0 (mask!7738 thiss!1248))))

(assert (=> d!51091 (= (seekEntryOrOpen!0 key!828 (_keys!4999 thiss!1248) (mask!7738 thiss!1248)) lt!81768)))

(declare-fun b!158851 () Bool)

(assert (=> b!158851 (= e!104006 Undefined!308)))

(declare-fun e!104008 () SeekEntryResult!308)

(declare-fun b!158852 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5657 (_ BitVec 32)) SeekEntryResult!308)

(assert (=> b!158852 (= e!104008 (seekKeyOrZeroReturnVacant!0 (x!17555 lt!81767) (index!3402 lt!81767) (index!3402 lt!81767) key!828 (_keys!4999 thiss!1248) (mask!7738 thiss!1248)))))

(declare-fun b!158853 () Bool)

(declare-fun c!29885 () Bool)

(declare-fun lt!81766 () (_ BitVec 64))

(assert (=> b!158853 (= c!29885 (= lt!81766 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!104007 () SeekEntryResult!308)

(assert (=> b!158853 (= e!104007 e!104008)))

(declare-fun b!158854 () Bool)

(assert (=> b!158854 (= e!104006 e!104007)))

(assert (=> b!158854 (= lt!81766 (select (arr!2674 (_keys!4999 thiss!1248)) (index!3402 lt!81767)))))

(declare-fun c!29884 () Bool)

(assert (=> b!158854 (= c!29884 (= lt!81766 key!828))))

(declare-fun b!158855 () Bool)

(assert (=> b!158855 (= e!104007 (Found!308 (index!3402 lt!81767)))))

(declare-fun b!158856 () Bool)

(assert (=> b!158856 (= e!104008 (MissingZero!308 (index!3402 lt!81767)))))

(assert (= (and d!51091 c!29883) b!158851))

(assert (= (and d!51091 (not c!29883)) b!158854))

(assert (= (and b!158854 c!29884) b!158855))

(assert (= (and b!158854 (not c!29884)) b!158853))

(assert (= (and b!158853 c!29885) b!158856))

(assert (= (and b!158853 (not c!29885)) b!158852))

(assert (=> d!51091 m!190801))

(declare-fun m!190837 () Bool)

(assert (=> d!51091 m!190837))

(declare-fun m!190839 () Bool)

(assert (=> d!51091 m!190839))

(declare-fun m!190841 () Bool)

(assert (=> d!51091 m!190841))

(declare-fun m!190843 () Bool)

(assert (=> d!51091 m!190843))

(declare-fun m!190845 () Bool)

(assert (=> d!51091 m!190845))

(assert (=> d!51091 m!190841))

(declare-fun m!190847 () Bool)

(assert (=> b!158852 m!190847))

(declare-fun m!190849 () Bool)

(assert (=> b!158854 m!190849))

(assert (=> b!158778 d!51091))

(declare-fun d!51093 () Bool)

(declare-fun res!74981 () Bool)

(declare-fun e!104017 () Bool)

(assert (=> d!51093 (=> res!74981 e!104017)))

(assert (=> d!51093 (= res!74981 (bvsge #b00000000000000000000000000000000 (size!2959 (_keys!4999 thiss!1248))))))

(assert (=> d!51093 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4999 thiss!1248) (mask!7738 thiss!1248)) e!104017)))

(declare-fun b!158865 () Bool)

(declare-fun e!104016 () Bool)

(declare-fun call!17251 () Bool)

(assert (=> b!158865 (= e!104016 call!17251)))

(declare-fun b!158866 () Bool)

(declare-fun e!104015 () Bool)

(assert (=> b!158866 (= e!104016 e!104015)))

(declare-fun lt!81776 () (_ BitVec 64))

(assert (=> b!158866 (= lt!81776 (select (arr!2674 (_keys!4999 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!4968 0))(
  ( (Unit!4969) )
))
(declare-fun lt!81775 () Unit!4968)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!5657 (_ BitVec 64) (_ BitVec 32)) Unit!4968)

(assert (=> b!158866 (= lt!81775 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4999 thiss!1248) lt!81776 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!5657 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158866 (arrayContainsKey!0 (_keys!4999 thiss!1248) lt!81776 #b00000000000000000000000000000000)))

(declare-fun lt!81777 () Unit!4968)

(assert (=> b!158866 (= lt!81777 lt!81775)))

(declare-fun res!74982 () Bool)

(assert (=> b!158866 (= res!74982 (= (seekEntryOrOpen!0 (select (arr!2674 (_keys!4999 thiss!1248)) #b00000000000000000000000000000000) (_keys!4999 thiss!1248) (mask!7738 thiss!1248)) (Found!308 #b00000000000000000000000000000000)))))

(assert (=> b!158866 (=> (not res!74982) (not e!104015))))

(declare-fun b!158867 () Bool)

(assert (=> b!158867 (= e!104015 call!17251)))

(declare-fun bm!17248 () Bool)

(assert (=> bm!17248 (= call!17251 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4999 thiss!1248) (mask!7738 thiss!1248)))))

(declare-fun b!158868 () Bool)

(assert (=> b!158868 (= e!104017 e!104016)))

(declare-fun c!29888 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!158868 (= c!29888 (validKeyInArray!0 (select (arr!2674 (_keys!4999 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51093 (not res!74981)) b!158868))

(assert (= (and b!158868 c!29888) b!158866))

(assert (= (and b!158868 (not c!29888)) b!158865))

(assert (= (and b!158866 res!74982) b!158867))

(assert (= (or b!158867 b!158865) bm!17248))

(declare-fun m!190851 () Bool)

(assert (=> b!158866 m!190851))

(declare-fun m!190853 () Bool)

(assert (=> b!158866 m!190853))

(declare-fun m!190855 () Bool)

(assert (=> b!158866 m!190855))

(assert (=> b!158866 m!190851))

(declare-fun m!190857 () Bool)

(assert (=> b!158866 m!190857))

(declare-fun m!190859 () Bool)

(assert (=> bm!17248 m!190859))

(assert (=> b!158868 m!190851))

(assert (=> b!158868 m!190851))

(declare-fun m!190861 () Bool)

(assert (=> b!158868 m!190861))

(assert (=> b!158775 d!51093))

(declare-fun b!158879 () Bool)

(declare-fun e!104027 () Bool)

(declare-fun contains!968 (List!1890 (_ BitVec 64)) Bool)

(assert (=> b!158879 (= e!104027 (contains!968 Nil!1887 (select (arr!2674 (_keys!4999 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!158881 () Bool)

(declare-fun e!104026 () Bool)

(declare-fun call!17254 () Bool)

(assert (=> b!158881 (= e!104026 call!17254)))

(declare-fun bm!17251 () Bool)

(declare-fun c!29891 () Bool)

(assert (=> bm!17251 (= call!17254 (arrayNoDuplicates!0 (_keys!4999 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!29891 (Cons!1886 (select (arr!2674 (_keys!4999 thiss!1248)) #b00000000000000000000000000000000) Nil!1887) Nil!1887)))))

(declare-fun b!158882 () Bool)

(declare-fun e!104029 () Bool)

(assert (=> b!158882 (= e!104029 e!104026)))

(assert (=> b!158882 (= c!29891 (validKeyInArray!0 (select (arr!2674 (_keys!4999 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!158883 () Bool)

(assert (=> b!158883 (= e!104026 call!17254)))

(declare-fun d!51095 () Bool)

(declare-fun res!74991 () Bool)

(declare-fun e!104028 () Bool)

(assert (=> d!51095 (=> res!74991 e!104028)))

(assert (=> d!51095 (= res!74991 (bvsge #b00000000000000000000000000000000 (size!2959 (_keys!4999 thiss!1248))))))

(assert (=> d!51095 (= (arrayNoDuplicates!0 (_keys!4999 thiss!1248) #b00000000000000000000000000000000 Nil!1887) e!104028)))

(declare-fun b!158880 () Bool)

(assert (=> b!158880 (= e!104028 e!104029)))

(declare-fun res!74989 () Bool)

(assert (=> b!158880 (=> (not res!74989) (not e!104029))))

(assert (=> b!158880 (= res!74989 (not e!104027))))

(declare-fun res!74990 () Bool)

(assert (=> b!158880 (=> (not res!74990) (not e!104027))))

(assert (=> b!158880 (= res!74990 (validKeyInArray!0 (select (arr!2674 (_keys!4999 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51095 (not res!74991)) b!158880))

(assert (= (and b!158880 res!74990) b!158879))

(assert (= (and b!158880 res!74989) b!158882))

(assert (= (and b!158882 c!29891) b!158881))

(assert (= (and b!158882 (not c!29891)) b!158883))

(assert (= (or b!158881 b!158883) bm!17251))

(assert (=> b!158879 m!190851))

(assert (=> b!158879 m!190851))

(declare-fun m!190863 () Bool)

(assert (=> b!158879 m!190863))

(assert (=> bm!17251 m!190851))

(declare-fun m!190865 () Bool)

(assert (=> bm!17251 m!190865))

(assert (=> b!158882 m!190851))

(assert (=> b!158882 m!190851))

(assert (=> b!158882 m!190861))

(assert (=> b!158880 m!190851))

(assert (=> b!158880 m!190851))

(assert (=> b!158880 m!190861))

(assert (=> b!158769 d!51095))

(declare-fun d!51097 () Bool)

(assert (=> d!51097 (= (validMask!0 (mask!7738 thiss!1248)) (and (or (= (mask!7738 thiss!1248) #b00000000000000000000000000000111) (= (mask!7738 thiss!1248) #b00000000000000000000000000001111) (= (mask!7738 thiss!1248) #b00000000000000000000000000011111) (= (mask!7738 thiss!1248) #b00000000000000000000000000111111) (= (mask!7738 thiss!1248) #b00000000000000000000000001111111) (= (mask!7738 thiss!1248) #b00000000000000000000000011111111) (= (mask!7738 thiss!1248) #b00000000000000000000000111111111) (= (mask!7738 thiss!1248) #b00000000000000000000001111111111) (= (mask!7738 thiss!1248) #b00000000000000000000011111111111) (= (mask!7738 thiss!1248) #b00000000000000000000111111111111) (= (mask!7738 thiss!1248) #b00000000000000000001111111111111) (= (mask!7738 thiss!1248) #b00000000000000000011111111111111) (= (mask!7738 thiss!1248) #b00000000000000000111111111111111) (= (mask!7738 thiss!1248) #b00000000000000001111111111111111) (= (mask!7738 thiss!1248) #b00000000000000011111111111111111) (= (mask!7738 thiss!1248) #b00000000000000111111111111111111) (= (mask!7738 thiss!1248) #b00000000000001111111111111111111) (= (mask!7738 thiss!1248) #b00000000000011111111111111111111) (= (mask!7738 thiss!1248) #b00000000000111111111111111111111) (= (mask!7738 thiss!1248) #b00000000001111111111111111111111) (= (mask!7738 thiss!1248) #b00000000011111111111111111111111) (= (mask!7738 thiss!1248) #b00000000111111111111111111111111) (= (mask!7738 thiss!1248) #b00000001111111111111111111111111) (= (mask!7738 thiss!1248) #b00000011111111111111111111111111) (= (mask!7738 thiss!1248) #b00000111111111111111111111111111) (= (mask!7738 thiss!1248) #b00001111111111111111111111111111) (= (mask!7738 thiss!1248) #b00011111111111111111111111111111) (= (mask!7738 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7738 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!158771 d!51097))

(declare-fun d!51099 () Bool)

(declare-fun res!74998 () Bool)

(declare-fun e!104032 () Bool)

(assert (=> d!51099 (=> (not res!74998) (not e!104032))))

(declare-fun simpleValid!116 (LongMapFixedSize!1522) Bool)

(assert (=> d!51099 (= res!74998 (simpleValid!116 thiss!1248))))

(assert (=> d!51099 (= (valid!718 thiss!1248) e!104032)))

(declare-fun b!158890 () Bool)

(declare-fun res!74999 () Bool)

(assert (=> b!158890 (=> (not res!74999) (not e!104032))))

(declare-fun arrayCountValidKeys!0 (array!5657 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!158890 (= res!74999 (= (arrayCountValidKeys!0 (_keys!4999 thiss!1248) #b00000000000000000000000000000000 (size!2959 (_keys!4999 thiss!1248))) (_size!810 thiss!1248)))))

(declare-fun b!158891 () Bool)

(declare-fun res!75000 () Bool)

(assert (=> b!158891 (=> (not res!75000) (not e!104032))))

(assert (=> b!158891 (= res!75000 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4999 thiss!1248) (mask!7738 thiss!1248)))))

(declare-fun b!158892 () Bool)

(assert (=> b!158892 (= e!104032 (arrayNoDuplicates!0 (_keys!4999 thiss!1248) #b00000000000000000000000000000000 Nil!1887))))

(assert (= (and d!51099 res!74998) b!158890))

(assert (= (and b!158890 res!74999) b!158891))

(assert (= (and b!158891 res!75000) b!158892))

(declare-fun m!190867 () Bool)

(assert (=> d!51099 m!190867))

(declare-fun m!190869 () Bool)

(assert (=> b!158890 m!190869))

(assert (=> b!158891 m!190803))

(assert (=> b!158892 m!190791))

(assert (=> start!16014 d!51099))

(declare-fun d!51101 () Bool)

(assert (=> d!51101 (= (array_inv!1717 (_keys!4999 thiss!1248)) (bvsge (size!2959 (_keys!4999 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!158772 d!51101))

(declare-fun d!51103 () Bool)

(assert (=> d!51103 (= (array_inv!1718 (_values!3186 thiss!1248)) (bvsge (size!2960 (_values!3186 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!158772 d!51103))

(declare-fun condMapEmpty!5642 () Bool)

(declare-fun mapDefault!5642 () ValueCell!1307)

(assert (=> mapNonEmpty!5633 (= condMapEmpty!5642 (= mapRest!5633 ((as const (Array (_ BitVec 32) ValueCell!1307)) mapDefault!5642)))))

(declare-fun e!104037 () Bool)

(declare-fun mapRes!5642 () Bool)

(assert (=> mapNonEmpty!5633 (= tp!13061 (and e!104037 mapRes!5642))))

(declare-fun mapNonEmpty!5642 () Bool)

(declare-fun tp!13076 () Bool)

(declare-fun e!104038 () Bool)

(assert (=> mapNonEmpty!5642 (= mapRes!5642 (and tp!13076 e!104038))))

(declare-fun mapRest!5642 () (Array (_ BitVec 32) ValueCell!1307))

(declare-fun mapValue!5642 () ValueCell!1307)

(declare-fun mapKey!5642 () (_ BitVec 32))

(assert (=> mapNonEmpty!5642 (= mapRest!5633 (store mapRest!5642 mapKey!5642 mapValue!5642))))

(declare-fun b!158899 () Bool)

(assert (=> b!158899 (= e!104038 tp_is_empty!3301)))

(declare-fun mapIsEmpty!5642 () Bool)

(assert (=> mapIsEmpty!5642 mapRes!5642))

(declare-fun b!158900 () Bool)

(assert (=> b!158900 (= e!104037 tp_is_empty!3301)))

(assert (= (and mapNonEmpty!5633 condMapEmpty!5642) mapIsEmpty!5642))

(assert (= (and mapNonEmpty!5633 (not condMapEmpty!5642)) mapNonEmpty!5642))

(assert (= (and mapNonEmpty!5642 ((_ is ValueCellFull!1307) mapValue!5642)) b!158899))

(assert (= (and mapNonEmpty!5633 ((_ is ValueCellFull!1307) mapDefault!5642)) b!158900))

(declare-fun m!190871 () Bool)

(assert (=> mapNonEmpty!5642 m!190871))

(check-sat (not b!158880) (not bm!17251) (not b!158891) (not mapNonEmpty!5642) b_and!9887 (not b!158868) (not b_next!3499) (not b!158892) (not b!158852) (not d!51091) (not d!51099) (not b!158882) (not b!158879) (not bm!17248) (not b!158866) tp_is_empty!3301 (not b!158890))
(check-sat b_and!9887 (not b_next!3499))
