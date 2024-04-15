; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7890 () Bool)

(assert start!7890)

(declare-fun res!28724 () Bool)

(declare-fun e!31956 () Bool)

(assert (=> start!7890 (=> (not res!28724) (not e!31956))))

(declare-fun mask!2234 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7890 (= res!28724 (validMask!0 mask!2234))))

(assert (=> start!7890 e!31956))

(assert (=> start!7890 true))

(declare-datatypes ((array!3217 0))(
  ( (array!3218 (arr!1540 (Array (_ BitVec 32) (_ BitVec 64))) (size!1763 (_ BitVec 32))) )
))
(declare-fun _keys!1794 () array!3217)

(declare-fun array_inv!939 (array!3217) Bool)

(assert (=> start!7890 (array_inv!939 _keys!1794)))

(declare-fun b!49621 () Bool)

(declare-fun res!28725 () Bool)

(assert (=> b!49621 (=> (not res!28725) (not e!31956))))

(declare-fun i!836 () (_ BitVec 32))

(assert (=> b!49621 (= res!28725 (and (= (size!1763 _keys!1794) (bvadd #b00000000000000000000000000000001 mask!2234)) (= _keys!1794 (array!3218 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!2234))) (bvsge i!836 #b00000000000000000000000000000000) (bvsle i!836 (size!1763 _keys!1794)) (bvslt i!836 (size!1763 _keys!1794)) (bvsge (bvadd #b00000000000000000000000000000001 i!836) #b00000000000000000000000000000000)))))

(declare-fun b!49622 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3217 (_ BitVec 32)) Bool)

(assert (=> b!49622 (= e!31956 (not (arrayForallSeekEntryOrOpenFound!0 i!836 _keys!1794 mask!2234)))))

(assert (=> b!49622 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836) _keys!1794 mask!2234)))

(declare-datatypes ((Unit!1410 0))(
  ( (Unit!1411) )
))
(declare-fun lt!20842 () Unit!1410)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!3217 (_ BitVec 32) (_ BitVec 32)) Unit!1410)

(assert (=> b!49622 (= lt!20842 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 _keys!1794 mask!2234 (bvadd #b00000000000000000000000000000001 i!836)))))

(assert (= (and start!7890 res!28724) b!49621))

(assert (= (and b!49621 res!28725) b!49622))

(declare-fun m!42989 () Bool)

(assert (=> start!7890 m!42989))

(declare-fun m!42991 () Bool)

(assert (=> start!7890 m!42991))

(declare-fun m!42993 () Bool)

(assert (=> b!49622 m!42993))

(declare-fun m!42995 () Bool)

(assert (=> b!49622 m!42995))

(declare-fun m!42997 () Bool)

(assert (=> b!49622 m!42997))

(check-sat (not start!7890) (not b!49622))
(check-sat)
(get-model)

(declare-fun d!9943 () Bool)

(assert (=> d!9943 (= (validMask!0 mask!2234) (and (or (= mask!2234 #b00000000000000000000000000000111) (= mask!2234 #b00000000000000000000000000001111) (= mask!2234 #b00000000000000000000000000011111) (= mask!2234 #b00000000000000000000000000111111) (= mask!2234 #b00000000000000000000000001111111) (= mask!2234 #b00000000000000000000000011111111) (= mask!2234 #b00000000000000000000000111111111) (= mask!2234 #b00000000000000000000001111111111) (= mask!2234 #b00000000000000000000011111111111) (= mask!2234 #b00000000000000000000111111111111) (= mask!2234 #b00000000000000000001111111111111) (= mask!2234 #b00000000000000000011111111111111) (= mask!2234 #b00000000000000000111111111111111) (= mask!2234 #b00000000000000001111111111111111) (= mask!2234 #b00000000000000011111111111111111) (= mask!2234 #b00000000000000111111111111111111) (= mask!2234 #b00000000000001111111111111111111) (= mask!2234 #b00000000000011111111111111111111) (= mask!2234 #b00000000000111111111111111111111) (= mask!2234 #b00000000001111111111111111111111) (= mask!2234 #b00000000011111111111111111111111) (= mask!2234 #b00000000111111111111111111111111) (= mask!2234 #b00000001111111111111111111111111) (= mask!2234 #b00000011111111111111111111111111) (= mask!2234 #b00000111111111111111111111111111) (= mask!2234 #b00001111111111111111111111111111) (= mask!2234 #b00011111111111111111111111111111) (= mask!2234 #b00111111111111111111111111111111)) (bvsle mask!2234 #b00111111111111111111111111111111)))))

(assert (=> start!7890 d!9943))

(declare-fun d!9949 () Bool)

(assert (=> d!9949 (= (array_inv!939 _keys!1794) (bvsge (size!1763 _keys!1794) #b00000000000000000000000000000000))))

(assert (=> start!7890 d!9949))

(declare-fun b!49652 () Bool)

(declare-fun e!31983 () Bool)

(declare-fun e!31981 () Bool)

(assert (=> b!49652 (= e!31983 e!31981)))

(declare-fun lt!20862 () (_ BitVec 64))

(assert (=> b!49652 (= lt!20862 (select (arr!1540 _keys!1794) i!836))))

(declare-fun lt!20863 () Unit!1410)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3217 (_ BitVec 64) (_ BitVec 32)) Unit!1410)

(assert (=> b!49652 (= lt!20863 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1794 lt!20862 i!836))))

(declare-fun arrayContainsKey!0 (array!3217 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!49652 (arrayContainsKey!0 _keys!1794 lt!20862 #b00000000000000000000000000000000)))

(declare-fun lt!20861 () Unit!1410)

(assert (=> b!49652 (= lt!20861 lt!20863)))

(declare-fun res!28747 () Bool)

(declare-datatypes ((SeekEntryResult!215 0))(
  ( (MissingZero!215 (index!2982 (_ BitVec 32))) (Found!215 (index!2983 (_ BitVec 32))) (Intermediate!215 (undefined!1027 Bool) (index!2984 (_ BitVec 32)) (x!9104 (_ BitVec 32))) (Undefined!215) (MissingVacant!215 (index!2985 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3217 (_ BitVec 32)) SeekEntryResult!215)

(assert (=> b!49652 (= res!28747 (= (seekEntryOrOpen!0 (select (arr!1540 _keys!1794) i!836) _keys!1794 mask!2234) (Found!215 i!836)))))

(assert (=> b!49652 (=> (not res!28747) (not e!31981))))

(declare-fun bm!3845 () Bool)

(declare-fun call!3848 () Bool)

(assert (=> bm!3845 (= call!3848 (arrayForallSeekEntryOrOpenFound!0 (bvadd i!836 #b00000000000000000000000000000001) _keys!1794 mask!2234))))

(declare-fun b!49653 () Bool)

(assert (=> b!49653 (= e!31983 call!3848)))

(declare-fun b!49654 () Bool)

(declare-fun e!31982 () Bool)

(assert (=> b!49654 (= e!31982 e!31983)))

(declare-fun c!6678 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!49654 (= c!6678 (validKeyInArray!0 (select (arr!1540 _keys!1794) i!836)))))

(declare-fun d!9951 () Bool)

(declare-fun res!28746 () Bool)

(assert (=> d!9951 (=> res!28746 e!31982)))

(assert (=> d!9951 (= res!28746 (bvsge i!836 (size!1763 _keys!1794)))))

(assert (=> d!9951 (= (arrayForallSeekEntryOrOpenFound!0 i!836 _keys!1794 mask!2234) e!31982)))

(declare-fun b!49651 () Bool)

(assert (=> b!49651 (= e!31981 call!3848)))

(assert (= (and d!9951 (not res!28746)) b!49654))

(assert (= (and b!49654 c!6678) b!49652))

(assert (= (and b!49654 (not c!6678)) b!49653))

(assert (= (and b!49652 res!28747) b!49651))

(assert (= (or b!49651 b!49653) bm!3845))

(declare-fun m!43019 () Bool)

(assert (=> b!49652 m!43019))

(declare-fun m!43021 () Bool)

(assert (=> b!49652 m!43021))

(declare-fun m!43023 () Bool)

(assert (=> b!49652 m!43023))

(assert (=> b!49652 m!43019))

(declare-fun m!43025 () Bool)

(assert (=> b!49652 m!43025))

(declare-fun m!43027 () Bool)

(assert (=> bm!3845 m!43027))

(assert (=> b!49654 m!43019))

(assert (=> b!49654 m!43019))

(declare-fun m!43029 () Bool)

(assert (=> b!49654 m!43029))

(assert (=> b!49622 d!9951))

(declare-fun b!49660 () Bool)

(declare-fun e!31989 () Bool)

(declare-fun e!31987 () Bool)

(assert (=> b!49660 (= e!31989 e!31987)))

(declare-fun lt!20868 () (_ BitVec 64))

(assert (=> b!49660 (= lt!20868 (select (arr!1540 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836)))))

(declare-fun lt!20869 () Unit!1410)

(assert (=> b!49660 (= lt!20869 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1794 lt!20868 (bvadd #b00000000000000000000000000000001 i!836)))))

(assert (=> b!49660 (arrayContainsKey!0 _keys!1794 lt!20868 #b00000000000000000000000000000000)))

(declare-fun lt!20867 () Unit!1410)

(assert (=> b!49660 (= lt!20867 lt!20869)))

(declare-fun res!28751 () Bool)

(assert (=> b!49660 (= res!28751 (= (seekEntryOrOpen!0 (select (arr!1540 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836)) _keys!1794 mask!2234) (Found!215 (bvadd #b00000000000000000000000000000001 i!836))))))

(assert (=> b!49660 (=> (not res!28751) (not e!31987))))

(declare-fun call!3850 () Bool)

(declare-fun bm!3847 () Bool)

(assert (=> bm!3847 (= call!3850 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836 #b00000000000000000000000000000001) _keys!1794 mask!2234))))

(declare-fun b!49661 () Bool)

(assert (=> b!49661 (= e!31989 call!3850)))

(declare-fun b!49662 () Bool)

(declare-fun e!31988 () Bool)

(assert (=> b!49662 (= e!31988 e!31989)))

(declare-fun c!6680 () Bool)

(assert (=> b!49662 (= c!6680 (validKeyInArray!0 (select (arr!1540 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836))))))

(declare-fun d!9955 () Bool)

(declare-fun res!28750 () Bool)

(assert (=> d!9955 (=> res!28750 e!31988)))

(assert (=> d!9955 (= res!28750 (bvsge (bvadd #b00000000000000000000000000000001 i!836) (size!1763 _keys!1794)))))

(assert (=> d!9955 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836) _keys!1794 mask!2234) e!31988)))

(declare-fun b!49659 () Bool)

(assert (=> b!49659 (= e!31987 call!3850)))

(assert (= (and d!9955 (not res!28750)) b!49662))

(assert (= (and b!49662 c!6680) b!49660))

(assert (= (and b!49662 (not c!6680)) b!49661))

(assert (= (and b!49660 res!28751) b!49659))

(assert (= (or b!49659 b!49661) bm!3847))

(declare-fun m!43031 () Bool)

(assert (=> b!49660 m!43031))

(declare-fun m!43033 () Bool)

(assert (=> b!49660 m!43033))

(declare-fun m!43035 () Bool)

(assert (=> b!49660 m!43035))

(assert (=> b!49660 m!43031))

(declare-fun m!43037 () Bool)

(assert (=> b!49660 m!43037))

(declare-fun m!43039 () Bool)

(assert (=> bm!3847 m!43039))

(assert (=> b!49662 m!43031))

(assert (=> b!49662 m!43031))

(declare-fun m!43041 () Bool)

(assert (=> b!49662 m!43041))

(assert (=> b!49622 d!9955))

(declare-fun d!9959 () Bool)

(assert (=> d!9959 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836) _keys!1794 mask!2234)))

(declare-fun lt!20875 () Unit!1410)

(declare-fun choose!34 (array!3217 (_ BitVec 32) (_ BitVec 32)) Unit!1410)

(assert (=> d!9959 (= lt!20875 (choose!34 _keys!1794 mask!2234 (bvadd #b00000000000000000000000000000001 i!836)))))

(assert (=> d!9959 (validMask!0 mask!2234)))

(assert (=> d!9959 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 _keys!1794 mask!2234 (bvadd #b00000000000000000000000000000001 i!836)) lt!20875)))

(declare-fun bs!2331 () Bool)

(assert (= bs!2331 d!9959))

(assert (=> bs!2331 m!42995))

(declare-fun m!43067 () Bool)

(assert (=> bs!2331 m!43067))

(assert (=> bs!2331 m!42989))

(assert (=> b!49622 d!9959))

(check-sat (not b!49660) (not b!49652) (not b!49662) (not bm!3847) (not d!9959) (not b!49654) (not bm!3845))
(check-sat)
(get-model)

(declare-fun b!49684 () Bool)

(declare-fun e!32007 () Bool)

(declare-fun e!32005 () Bool)

(assert (=> b!49684 (= e!32007 e!32005)))

(declare-fun lt!20895 () (_ BitVec 64))

(assert (=> b!49684 (= lt!20895 (select (arr!1540 _keys!1794) (bvadd i!836 #b00000000000000000000000000000001)))))

(declare-fun lt!20896 () Unit!1410)

(assert (=> b!49684 (= lt!20896 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1794 lt!20895 (bvadd i!836 #b00000000000000000000000000000001)))))

(assert (=> b!49684 (arrayContainsKey!0 _keys!1794 lt!20895 #b00000000000000000000000000000000)))

(declare-fun lt!20894 () Unit!1410)

(assert (=> b!49684 (= lt!20894 lt!20896)))

(declare-fun res!28763 () Bool)

(assert (=> b!49684 (= res!28763 (= (seekEntryOrOpen!0 (select (arr!1540 _keys!1794) (bvadd i!836 #b00000000000000000000000000000001)) _keys!1794 mask!2234) (Found!215 (bvadd i!836 #b00000000000000000000000000000001))))))

(assert (=> b!49684 (=> (not res!28763) (not e!32005))))

(declare-fun bm!3853 () Bool)

(declare-fun call!3856 () Bool)

(assert (=> bm!3853 (= call!3856 (arrayForallSeekEntryOrOpenFound!0 (bvadd i!836 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1794 mask!2234))))

(declare-fun b!49685 () Bool)

(assert (=> b!49685 (= e!32007 call!3856)))

(declare-fun b!49686 () Bool)

(declare-fun e!32006 () Bool)

(assert (=> b!49686 (= e!32006 e!32007)))

(declare-fun c!6686 () Bool)

(assert (=> b!49686 (= c!6686 (validKeyInArray!0 (select (arr!1540 _keys!1794) (bvadd i!836 #b00000000000000000000000000000001))))))

(declare-fun d!9973 () Bool)

(declare-fun res!28762 () Bool)

(assert (=> d!9973 (=> res!28762 e!32006)))

(assert (=> d!9973 (= res!28762 (bvsge (bvadd i!836 #b00000000000000000000000000000001) (size!1763 _keys!1794)))))

(assert (=> d!9973 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd i!836 #b00000000000000000000000000000001) _keys!1794 mask!2234) e!32006)))

(declare-fun b!49683 () Bool)

(assert (=> b!49683 (= e!32005 call!3856)))

(assert (= (and d!9973 (not res!28762)) b!49686))

(assert (= (and b!49686 c!6686) b!49684))

(assert (= (and b!49686 (not c!6686)) b!49685))

(assert (= (and b!49684 res!28763) b!49683))

(assert (= (or b!49683 b!49685) bm!3853))

(declare-fun m!43097 () Bool)

(assert (=> b!49684 m!43097))

(declare-fun m!43099 () Bool)

(assert (=> b!49684 m!43099))

(declare-fun m!43101 () Bool)

(assert (=> b!49684 m!43101))

(assert (=> b!49684 m!43097))

(declare-fun m!43103 () Bool)

(assert (=> b!49684 m!43103))

(declare-fun m!43105 () Bool)

(assert (=> bm!3853 m!43105))

(assert (=> b!49686 m!43097))

(assert (=> b!49686 m!43097))

(declare-fun m!43107 () Bool)

(assert (=> b!49686 m!43107))

(assert (=> bm!3845 d!9973))

(declare-fun d!9975 () Bool)

(assert (=> d!9975 (arrayContainsKey!0 _keys!1794 lt!20868 #b00000000000000000000000000000000)))

(declare-fun lt!20899 () Unit!1410)

(declare-fun choose!13 (array!3217 (_ BitVec 64) (_ BitVec 32)) Unit!1410)

(assert (=> d!9975 (= lt!20899 (choose!13 _keys!1794 lt!20868 (bvadd #b00000000000000000000000000000001 i!836)))))

(assert (=> d!9975 (bvsge (bvadd #b00000000000000000000000000000001 i!836) #b00000000000000000000000000000000)))

(assert (=> d!9975 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1794 lt!20868 (bvadd #b00000000000000000000000000000001 i!836)) lt!20899)))

(declare-fun bs!2334 () Bool)

(assert (= bs!2334 d!9975))

(assert (=> bs!2334 m!43035))

(declare-fun m!43109 () Bool)

(assert (=> bs!2334 m!43109))

(assert (=> b!49660 d!9975))

(declare-fun d!9977 () Bool)

(declare-fun res!28768 () Bool)

(declare-fun e!32012 () Bool)

(assert (=> d!9977 (=> res!28768 e!32012)))

(assert (=> d!9977 (= res!28768 (= (select (arr!1540 _keys!1794) #b00000000000000000000000000000000) lt!20868))))

(assert (=> d!9977 (= (arrayContainsKey!0 _keys!1794 lt!20868 #b00000000000000000000000000000000) e!32012)))

(declare-fun b!49691 () Bool)

(declare-fun e!32013 () Bool)

(assert (=> b!49691 (= e!32012 e!32013)))

(declare-fun res!28769 () Bool)

(assert (=> b!49691 (=> (not res!28769) (not e!32013))))

(assert (=> b!49691 (= res!28769 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1763 _keys!1794)))))

(declare-fun b!49692 () Bool)

(assert (=> b!49692 (= e!32013 (arrayContainsKey!0 _keys!1794 lt!20868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!9977 (not res!28768)) b!49691))

(assert (= (and b!49691 res!28769) b!49692))

(declare-fun m!43111 () Bool)

(assert (=> d!9977 m!43111))

(declare-fun m!43113 () Bool)

(assert (=> b!49692 m!43113))

(assert (=> b!49660 d!9977))

(declare-fun b!49719 () Bool)

(declare-fun e!32033 () SeekEntryResult!215)

(declare-fun lt!20916 () SeekEntryResult!215)

(assert (=> b!49719 (= e!32033 (Found!215 (index!2984 lt!20916)))))

(declare-fun e!32032 () SeekEntryResult!215)

(declare-fun b!49720 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3217 (_ BitVec 32)) SeekEntryResult!215)

(assert (=> b!49720 (= e!32032 (seekKeyOrZeroReturnVacant!0 (x!9104 lt!20916) (index!2984 lt!20916) (index!2984 lt!20916) (select (arr!1540 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836)) _keys!1794 mask!2234))))

(declare-fun d!9979 () Bool)

(declare-fun lt!20915 () SeekEntryResult!215)

(get-info :version)

(assert (=> d!9979 (and (or ((_ is Undefined!215) lt!20915) (not ((_ is Found!215) lt!20915)) (and (bvsge (index!2983 lt!20915) #b00000000000000000000000000000000) (bvslt (index!2983 lt!20915) (size!1763 _keys!1794)))) (or ((_ is Undefined!215) lt!20915) ((_ is Found!215) lt!20915) (not ((_ is MissingZero!215) lt!20915)) (and (bvsge (index!2982 lt!20915) #b00000000000000000000000000000000) (bvslt (index!2982 lt!20915) (size!1763 _keys!1794)))) (or ((_ is Undefined!215) lt!20915) ((_ is Found!215) lt!20915) ((_ is MissingZero!215) lt!20915) (not ((_ is MissingVacant!215) lt!20915)) (and (bvsge (index!2985 lt!20915) #b00000000000000000000000000000000) (bvslt (index!2985 lt!20915) (size!1763 _keys!1794)))) (or ((_ is Undefined!215) lt!20915) (ite ((_ is Found!215) lt!20915) (= (select (arr!1540 _keys!1794) (index!2983 lt!20915)) (select (arr!1540 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836))) (ite ((_ is MissingZero!215) lt!20915) (= (select (arr!1540 _keys!1794) (index!2982 lt!20915)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!215) lt!20915) (= (select (arr!1540 _keys!1794) (index!2985 lt!20915)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!32034 () SeekEntryResult!215)

(assert (=> d!9979 (= lt!20915 e!32034)))

(declare-fun c!6695 () Bool)

(assert (=> d!9979 (= c!6695 (and ((_ is Intermediate!215) lt!20916) (undefined!1027 lt!20916)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3217 (_ BitVec 32)) SeekEntryResult!215)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!9979 (= lt!20916 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1540 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836)) mask!2234) (select (arr!1540 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836)) _keys!1794 mask!2234))))

(assert (=> d!9979 (validMask!0 mask!2234)))

(assert (=> d!9979 (= (seekEntryOrOpen!0 (select (arr!1540 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836)) _keys!1794 mask!2234) lt!20915)))

(declare-fun b!49721 () Bool)

(assert (=> b!49721 (= e!32034 Undefined!215)))

(declare-fun b!49722 () Bool)

(assert (=> b!49722 (= e!32034 e!32033)))

(declare-fun lt!20917 () (_ BitVec 64))

(assert (=> b!49722 (= lt!20917 (select (arr!1540 _keys!1794) (index!2984 lt!20916)))))

(declare-fun c!6696 () Bool)

(assert (=> b!49722 (= c!6696 (= lt!20917 (select (arr!1540 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836))))))

(declare-fun b!49723 () Bool)

(assert (=> b!49723 (= e!32032 (MissingZero!215 (index!2984 lt!20916)))))

(declare-fun b!49724 () Bool)

(declare-fun c!6697 () Bool)

(assert (=> b!49724 (= c!6697 (= lt!20917 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!49724 (= e!32033 e!32032)))

(assert (= (and d!9979 c!6695) b!49721))

(assert (= (and d!9979 (not c!6695)) b!49722))

(assert (= (and b!49722 c!6696) b!49719))

(assert (= (and b!49722 (not c!6696)) b!49724))

(assert (= (and b!49724 c!6697) b!49723))

(assert (= (and b!49724 (not c!6697)) b!49720))

(assert (=> b!49720 m!43031))

(declare-fun m!43145 () Bool)

(assert (=> b!49720 m!43145))

(assert (=> d!9979 m!43031))

(declare-fun m!43147 () Bool)

(assert (=> d!9979 m!43147))

(declare-fun m!43149 () Bool)

(assert (=> d!9979 m!43149))

(assert (=> d!9979 m!42989))

(declare-fun m!43151 () Bool)

(assert (=> d!9979 m!43151))

(assert (=> d!9979 m!43147))

(assert (=> d!9979 m!43031))

(declare-fun m!43153 () Bool)

(assert (=> d!9979 m!43153))

(declare-fun m!43155 () Bool)

(assert (=> d!9979 m!43155))

(declare-fun m!43157 () Bool)

(assert (=> b!49722 m!43157))

(assert (=> b!49660 d!9979))

(declare-fun b!49726 () Bool)

(declare-fun e!32037 () Bool)

(declare-fun e!32035 () Bool)

(assert (=> b!49726 (= e!32037 e!32035)))

(declare-fun lt!20919 () (_ BitVec 64))

(assert (=> b!49726 (= lt!20919 (select (arr!1540 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836 #b00000000000000000000000000000001)))))

(declare-fun lt!20920 () Unit!1410)

(assert (=> b!49726 (= lt!20920 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1794 lt!20919 (bvadd #b00000000000000000000000000000001 i!836 #b00000000000000000000000000000001)))))

(assert (=> b!49726 (arrayContainsKey!0 _keys!1794 lt!20919 #b00000000000000000000000000000000)))

(declare-fun lt!20918 () Unit!1410)

(assert (=> b!49726 (= lt!20918 lt!20920)))

(declare-fun res!28781 () Bool)

(assert (=> b!49726 (= res!28781 (= (seekEntryOrOpen!0 (select (arr!1540 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836 #b00000000000000000000000000000001)) _keys!1794 mask!2234) (Found!215 (bvadd #b00000000000000000000000000000001 i!836 #b00000000000000000000000000000001))))))

(assert (=> b!49726 (=> (not res!28781) (not e!32035))))

(declare-fun call!3859 () Bool)

(declare-fun bm!3856 () Bool)

(assert (=> bm!3856 (= call!3859 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1794 mask!2234))))

(declare-fun b!49727 () Bool)

(assert (=> b!49727 (= e!32037 call!3859)))

(declare-fun b!49728 () Bool)

(declare-fun e!32036 () Bool)

(assert (=> b!49728 (= e!32036 e!32037)))

(declare-fun c!6698 () Bool)

(assert (=> b!49728 (= c!6698 (validKeyInArray!0 (select (arr!1540 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836 #b00000000000000000000000000000001))))))

(declare-fun d!9997 () Bool)

(declare-fun res!28780 () Bool)

(assert (=> d!9997 (=> res!28780 e!32036)))

(assert (=> d!9997 (= res!28780 (bvsge (bvadd #b00000000000000000000000000000001 i!836 #b00000000000000000000000000000001) (size!1763 _keys!1794)))))

(assert (=> d!9997 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836 #b00000000000000000000000000000001) _keys!1794 mask!2234) e!32036)))

(declare-fun b!49725 () Bool)

(assert (=> b!49725 (= e!32035 call!3859)))

(assert (= (and d!9997 (not res!28780)) b!49728))

(assert (= (and b!49728 c!6698) b!49726))

(assert (= (and b!49728 (not c!6698)) b!49727))

(assert (= (and b!49726 res!28781) b!49725))

(assert (= (or b!49725 b!49727) bm!3856))

(declare-fun m!43159 () Bool)

(assert (=> b!49726 m!43159))

(declare-fun m!43161 () Bool)

(assert (=> b!49726 m!43161))

(declare-fun m!43163 () Bool)

(assert (=> b!49726 m!43163))

(assert (=> b!49726 m!43159))

(declare-fun m!43165 () Bool)

(assert (=> b!49726 m!43165))

(declare-fun m!43167 () Bool)

(assert (=> bm!3856 m!43167))

(assert (=> b!49728 m!43159))

(assert (=> b!49728 m!43159))

(declare-fun m!43169 () Bool)

(assert (=> b!49728 m!43169))

(assert (=> bm!3847 d!9997))

(declare-fun d!10001 () Bool)

(assert (=> d!10001 (arrayContainsKey!0 _keys!1794 lt!20862 #b00000000000000000000000000000000)))

(declare-fun lt!20921 () Unit!1410)

(assert (=> d!10001 (= lt!20921 (choose!13 _keys!1794 lt!20862 i!836))))

(assert (=> d!10001 (bvsge i!836 #b00000000000000000000000000000000)))

(assert (=> d!10001 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1794 lt!20862 i!836) lt!20921)))

(declare-fun bs!2337 () Bool)

(assert (= bs!2337 d!10001))

(assert (=> bs!2337 m!43023))

(declare-fun m!43171 () Bool)

(assert (=> bs!2337 m!43171))

(assert (=> b!49652 d!10001))

(declare-fun d!10003 () Bool)

(declare-fun res!28782 () Bool)

(declare-fun e!32038 () Bool)

(assert (=> d!10003 (=> res!28782 e!32038)))

(assert (=> d!10003 (= res!28782 (= (select (arr!1540 _keys!1794) #b00000000000000000000000000000000) lt!20862))))

(assert (=> d!10003 (= (arrayContainsKey!0 _keys!1794 lt!20862 #b00000000000000000000000000000000) e!32038)))

(declare-fun b!49729 () Bool)

(declare-fun e!32039 () Bool)

(assert (=> b!49729 (= e!32038 e!32039)))

(declare-fun res!28783 () Bool)

(assert (=> b!49729 (=> (not res!28783) (not e!32039))))

(assert (=> b!49729 (= res!28783 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1763 _keys!1794)))))

(declare-fun b!49730 () Bool)

(assert (=> b!49730 (= e!32039 (arrayContainsKey!0 _keys!1794 lt!20862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!10003 (not res!28782)) b!49729))

(assert (= (and b!49729 res!28783) b!49730))

(assert (=> d!10003 m!43111))

(declare-fun m!43173 () Bool)

(assert (=> b!49730 m!43173))

(assert (=> b!49652 d!10003))

(declare-fun b!49731 () Bool)

(declare-fun e!32041 () SeekEntryResult!215)

(declare-fun lt!20923 () SeekEntryResult!215)

(assert (=> b!49731 (= e!32041 (Found!215 (index!2984 lt!20923)))))

(declare-fun e!32040 () SeekEntryResult!215)

(declare-fun b!49732 () Bool)

(assert (=> b!49732 (= e!32040 (seekKeyOrZeroReturnVacant!0 (x!9104 lt!20923) (index!2984 lt!20923) (index!2984 lt!20923) (select (arr!1540 _keys!1794) i!836) _keys!1794 mask!2234))))

(declare-fun d!10005 () Bool)

(declare-fun lt!20922 () SeekEntryResult!215)

(assert (=> d!10005 (and (or ((_ is Undefined!215) lt!20922) (not ((_ is Found!215) lt!20922)) (and (bvsge (index!2983 lt!20922) #b00000000000000000000000000000000) (bvslt (index!2983 lt!20922) (size!1763 _keys!1794)))) (or ((_ is Undefined!215) lt!20922) ((_ is Found!215) lt!20922) (not ((_ is MissingZero!215) lt!20922)) (and (bvsge (index!2982 lt!20922) #b00000000000000000000000000000000) (bvslt (index!2982 lt!20922) (size!1763 _keys!1794)))) (or ((_ is Undefined!215) lt!20922) ((_ is Found!215) lt!20922) ((_ is MissingZero!215) lt!20922) (not ((_ is MissingVacant!215) lt!20922)) (and (bvsge (index!2985 lt!20922) #b00000000000000000000000000000000) (bvslt (index!2985 lt!20922) (size!1763 _keys!1794)))) (or ((_ is Undefined!215) lt!20922) (ite ((_ is Found!215) lt!20922) (= (select (arr!1540 _keys!1794) (index!2983 lt!20922)) (select (arr!1540 _keys!1794) i!836)) (ite ((_ is MissingZero!215) lt!20922) (= (select (arr!1540 _keys!1794) (index!2982 lt!20922)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!215) lt!20922) (= (select (arr!1540 _keys!1794) (index!2985 lt!20922)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!32042 () SeekEntryResult!215)

(assert (=> d!10005 (= lt!20922 e!32042)))

(declare-fun c!6699 () Bool)

(assert (=> d!10005 (= c!6699 (and ((_ is Intermediate!215) lt!20923) (undefined!1027 lt!20923)))))

(assert (=> d!10005 (= lt!20923 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1540 _keys!1794) i!836) mask!2234) (select (arr!1540 _keys!1794) i!836) _keys!1794 mask!2234))))

(assert (=> d!10005 (validMask!0 mask!2234)))

(assert (=> d!10005 (= (seekEntryOrOpen!0 (select (arr!1540 _keys!1794) i!836) _keys!1794 mask!2234) lt!20922)))

(declare-fun b!49733 () Bool)

(assert (=> b!49733 (= e!32042 Undefined!215)))

(declare-fun b!49734 () Bool)

(assert (=> b!49734 (= e!32042 e!32041)))

(declare-fun lt!20924 () (_ BitVec 64))

(assert (=> b!49734 (= lt!20924 (select (arr!1540 _keys!1794) (index!2984 lt!20923)))))

(declare-fun c!6700 () Bool)

(assert (=> b!49734 (= c!6700 (= lt!20924 (select (arr!1540 _keys!1794) i!836)))))

(declare-fun b!49735 () Bool)

(assert (=> b!49735 (= e!32040 (MissingZero!215 (index!2984 lt!20923)))))

(declare-fun b!49736 () Bool)

(declare-fun c!6701 () Bool)

(assert (=> b!49736 (= c!6701 (= lt!20924 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!49736 (= e!32041 e!32040)))

(assert (= (and d!10005 c!6699) b!49733))

(assert (= (and d!10005 (not c!6699)) b!49734))

(assert (= (and b!49734 c!6700) b!49731))

(assert (= (and b!49734 (not c!6700)) b!49736))

(assert (= (and b!49736 c!6701) b!49735))

(assert (= (and b!49736 (not c!6701)) b!49732))

(assert (=> b!49732 m!43019))

(declare-fun m!43175 () Bool)

(assert (=> b!49732 m!43175))

(assert (=> d!10005 m!43019))

(declare-fun m!43177 () Bool)

(assert (=> d!10005 m!43177))

(declare-fun m!43179 () Bool)

(assert (=> d!10005 m!43179))

(assert (=> d!10005 m!42989))

(declare-fun m!43181 () Bool)

(assert (=> d!10005 m!43181))

(assert (=> d!10005 m!43177))

(assert (=> d!10005 m!43019))

(declare-fun m!43183 () Bool)

(assert (=> d!10005 m!43183))

(declare-fun m!43185 () Bool)

(assert (=> d!10005 m!43185))

(declare-fun m!43187 () Bool)

(assert (=> b!49734 m!43187))

(assert (=> b!49652 d!10005))

(assert (=> d!9959 d!9955))

(declare-fun d!10007 () Bool)

(assert (=> d!10007 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836) _keys!1794 mask!2234)))

(assert (=> d!10007 true))

(declare-fun _$30!81 () Unit!1410)

(assert (=> d!10007 (= (choose!34 _keys!1794 mask!2234 (bvadd #b00000000000000000000000000000001 i!836)) _$30!81)))

(declare-fun bs!2339 () Bool)

(assert (= bs!2339 d!10007))

(assert (=> bs!2339 m!42995))

(assert (=> d!9959 d!10007))

(assert (=> d!9959 d!9943))

(declare-fun d!10011 () Bool)

(assert (=> d!10011 (= (validKeyInArray!0 (select (arr!1540 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836))) (and (not (= (select (arr!1540 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1540 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!49662 d!10011))

(declare-fun d!10013 () Bool)

(assert (=> d!10013 (= (validKeyInArray!0 (select (arr!1540 _keys!1794) i!836)) (and (not (= (select (arr!1540 _keys!1794) i!836) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1540 _keys!1794) i!836) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!49654 d!10013))

(check-sat (not d!10007) (not b!49692) (not b!49686) (not bm!3856) (not d!9979) (not d!10001) (not d!9975) (not d!10005) (not b!49728) (not b!49732) (not bm!3853) (not b!49684) (not b!49726) (not b!49730) (not b!49720))
(check-sat)
