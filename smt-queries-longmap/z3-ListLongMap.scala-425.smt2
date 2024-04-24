; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7890 () Bool)

(assert start!7890)

(declare-fun res!28719 () Bool)

(declare-fun e!31962 () Bool)

(assert (=> start!7890 (=> (not res!28719) (not e!31962))))

(declare-fun mask!2234 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7890 (= res!28719 (validMask!0 mask!2234))))

(assert (=> start!7890 e!31962))

(assert (=> start!7890 true))

(declare-datatypes ((array!3223 0))(
  ( (array!3224 (arr!1544 (Array (_ BitVec 32) (_ BitVec 64))) (size!1766 (_ BitVec 32))) )
))
(declare-fun _keys!1794 () array!3223)

(declare-fun array_inv!929 (array!3223) Bool)

(assert (=> start!7890 (array_inv!929 _keys!1794)))

(declare-fun b!49630 () Bool)

(declare-fun res!28720 () Bool)

(assert (=> b!49630 (=> (not res!28720) (not e!31962))))

(declare-fun i!836 () (_ BitVec 32))

(assert (=> b!49630 (= res!28720 (and (= (size!1766 _keys!1794) (bvadd #b00000000000000000000000000000001 mask!2234)) (= _keys!1794 (array!3224 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!2234))) (bvsge i!836 #b00000000000000000000000000000000) (bvsle i!836 (size!1766 _keys!1794)) (bvslt i!836 (size!1766 _keys!1794)) (bvsge (bvadd #b00000000000000000000000000000001 i!836) #b00000000000000000000000000000000)))))

(declare-fun b!49631 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3223 (_ BitVec 32)) Bool)

(assert (=> b!49631 (= e!31962 (not (arrayForallSeekEntryOrOpenFound!0 i!836 _keys!1794 mask!2234)))))

(assert (=> b!49631 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836) _keys!1794 mask!2234)))

(declare-datatypes ((Unit!1416 0))(
  ( (Unit!1417) )
))
(declare-fun lt!20815 () Unit!1416)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!3223 (_ BitVec 32) (_ BitVec 32)) Unit!1416)

(assert (=> b!49631 (= lt!20815 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 _keys!1794 mask!2234 (bvadd #b00000000000000000000000000000001 i!836)))))

(assert (= (and start!7890 res!28719) b!49630))

(assert (= (and b!49630 res!28720) b!49631))

(declare-fun m!42947 () Bool)

(assert (=> start!7890 m!42947))

(declare-fun m!42949 () Bool)

(assert (=> start!7890 m!42949))

(declare-fun m!42951 () Bool)

(assert (=> b!49631 m!42951))

(declare-fun m!42953 () Bool)

(assert (=> b!49631 m!42953))

(declare-fun m!42955 () Bool)

(assert (=> b!49631 m!42955))

(check-sat (not start!7890) (not b!49631))
(check-sat)
(get-model)

(declare-fun d!9953 () Bool)

(assert (=> d!9953 (= (validMask!0 mask!2234) (and (or (= mask!2234 #b00000000000000000000000000000111) (= mask!2234 #b00000000000000000000000000001111) (= mask!2234 #b00000000000000000000000000011111) (= mask!2234 #b00000000000000000000000000111111) (= mask!2234 #b00000000000000000000000001111111) (= mask!2234 #b00000000000000000000000011111111) (= mask!2234 #b00000000000000000000000111111111) (= mask!2234 #b00000000000000000000001111111111) (= mask!2234 #b00000000000000000000011111111111) (= mask!2234 #b00000000000000000000111111111111) (= mask!2234 #b00000000000000000001111111111111) (= mask!2234 #b00000000000000000011111111111111) (= mask!2234 #b00000000000000000111111111111111) (= mask!2234 #b00000000000000001111111111111111) (= mask!2234 #b00000000000000011111111111111111) (= mask!2234 #b00000000000000111111111111111111) (= mask!2234 #b00000000000001111111111111111111) (= mask!2234 #b00000000000011111111111111111111) (= mask!2234 #b00000000000111111111111111111111) (= mask!2234 #b00000000001111111111111111111111) (= mask!2234 #b00000000011111111111111111111111) (= mask!2234 #b00000000111111111111111111111111) (= mask!2234 #b00000001111111111111111111111111) (= mask!2234 #b00000011111111111111111111111111) (= mask!2234 #b00000111111111111111111111111111) (= mask!2234 #b00001111111111111111111111111111) (= mask!2234 #b00011111111111111111111111111111) (= mask!2234 #b00111111111111111111111111111111)) (bvsle mask!2234 #b00111111111111111111111111111111)))))

(assert (=> start!7890 d!9953))

(declare-fun d!9959 () Bool)

(assert (=> d!9959 (= (array_inv!929 _keys!1794) (bvsge (size!1766 _keys!1794) #b00000000000000000000000000000000))))

(assert (=> start!7890 d!9959))

(declare-fun b!49652 () Bool)

(declare-fun e!31981 () Bool)

(declare-fun call!3833 () Bool)

(assert (=> b!49652 (= e!31981 call!3833)))

(declare-fun bm!3830 () Bool)

(assert (=> bm!3830 (= call!3833 (arrayForallSeekEntryOrOpenFound!0 (bvadd i!836 #b00000000000000000000000000000001) _keys!1794 mask!2234))))

(declare-fun d!9961 () Bool)

(declare-fun res!28738 () Bool)

(declare-fun e!31983 () Bool)

(assert (=> d!9961 (=> res!28738 e!31983)))

(assert (=> d!9961 (= res!28738 (bvsge i!836 (size!1766 _keys!1794)))))

(assert (=> d!9961 (= (arrayForallSeekEntryOrOpenFound!0 i!836 _keys!1794 mask!2234) e!31983)))

(declare-fun b!49653 () Bool)

(declare-fun e!31982 () Bool)

(assert (=> b!49653 (= e!31982 call!3833)))

(declare-fun b!49654 () Bool)

(assert (=> b!49654 (= e!31982 e!31981)))

(declare-fun lt!20830 () (_ BitVec 64))

(assert (=> b!49654 (= lt!20830 (select (arr!1544 _keys!1794) i!836))))

(declare-fun lt!20828 () Unit!1416)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3223 (_ BitVec 64) (_ BitVec 32)) Unit!1416)

(assert (=> b!49654 (= lt!20828 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1794 lt!20830 i!836))))

(declare-fun arrayContainsKey!0 (array!3223 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!49654 (arrayContainsKey!0 _keys!1794 lt!20830 #b00000000000000000000000000000000)))

(declare-fun lt!20829 () Unit!1416)

(assert (=> b!49654 (= lt!20829 lt!20828)))

(declare-fun res!28737 () Bool)

(declare-datatypes ((SeekEntryResult!206 0))(
  ( (MissingZero!206 (index!2946 (_ BitVec 32))) (Found!206 (index!2947 (_ BitVec 32))) (Intermediate!206 (undefined!1018 Bool) (index!2948 (_ BitVec 32)) (x!9096 (_ BitVec 32))) (Undefined!206) (MissingVacant!206 (index!2949 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3223 (_ BitVec 32)) SeekEntryResult!206)

(assert (=> b!49654 (= res!28737 (= (seekEntryOrOpen!0 (select (arr!1544 _keys!1794) i!836) _keys!1794 mask!2234) (Found!206 i!836)))))

(assert (=> b!49654 (=> (not res!28737) (not e!31981))))

(declare-fun b!49655 () Bool)

(assert (=> b!49655 (= e!31983 e!31982)))

(declare-fun c!6683 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!49655 (= c!6683 (validKeyInArray!0 (select (arr!1544 _keys!1794) i!836)))))

(assert (= (and d!9961 (not res!28738)) b!49655))

(assert (= (and b!49655 c!6683) b!49654))

(assert (= (and b!49655 (not c!6683)) b!49653))

(assert (= (and b!49654 res!28737) b!49652))

(assert (= (or b!49652 b!49653) bm!3830))

(declare-fun m!42977 () Bool)

(assert (=> bm!3830 m!42977))

(declare-fun m!42979 () Bool)

(assert (=> b!49654 m!42979))

(declare-fun m!42981 () Bool)

(assert (=> b!49654 m!42981))

(declare-fun m!42983 () Bool)

(assert (=> b!49654 m!42983))

(assert (=> b!49654 m!42979))

(declare-fun m!42985 () Bool)

(assert (=> b!49654 m!42985))

(assert (=> b!49655 m!42979))

(assert (=> b!49655 m!42979))

(declare-fun m!42987 () Bool)

(assert (=> b!49655 m!42987))

(assert (=> b!49631 d!9961))

(declare-fun b!49656 () Bool)

(declare-fun e!31984 () Bool)

(declare-fun call!3834 () Bool)

(assert (=> b!49656 (= e!31984 call!3834)))

(declare-fun bm!3831 () Bool)

(assert (=> bm!3831 (= call!3834 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836 #b00000000000000000000000000000001) _keys!1794 mask!2234))))

(declare-fun d!9963 () Bool)

(declare-fun res!28740 () Bool)

(declare-fun e!31986 () Bool)

(assert (=> d!9963 (=> res!28740 e!31986)))

(assert (=> d!9963 (= res!28740 (bvsge (bvadd #b00000000000000000000000000000001 i!836) (size!1766 _keys!1794)))))

(assert (=> d!9963 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836) _keys!1794 mask!2234) e!31986)))

(declare-fun b!49657 () Bool)

(declare-fun e!31985 () Bool)

(assert (=> b!49657 (= e!31985 call!3834)))

(declare-fun b!49658 () Bool)

(assert (=> b!49658 (= e!31985 e!31984)))

(declare-fun lt!20833 () (_ BitVec 64))

(assert (=> b!49658 (= lt!20833 (select (arr!1544 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836)))))

(declare-fun lt!20831 () Unit!1416)

(assert (=> b!49658 (= lt!20831 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1794 lt!20833 (bvadd #b00000000000000000000000000000001 i!836)))))

(assert (=> b!49658 (arrayContainsKey!0 _keys!1794 lt!20833 #b00000000000000000000000000000000)))

(declare-fun lt!20832 () Unit!1416)

(assert (=> b!49658 (= lt!20832 lt!20831)))

(declare-fun res!28739 () Bool)

(assert (=> b!49658 (= res!28739 (= (seekEntryOrOpen!0 (select (arr!1544 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836)) _keys!1794 mask!2234) (Found!206 (bvadd #b00000000000000000000000000000001 i!836))))))

(assert (=> b!49658 (=> (not res!28739) (not e!31984))))

(declare-fun b!49659 () Bool)

(assert (=> b!49659 (= e!31986 e!31985)))

(declare-fun c!6684 () Bool)

(assert (=> b!49659 (= c!6684 (validKeyInArray!0 (select (arr!1544 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836))))))

(assert (= (and d!9963 (not res!28740)) b!49659))

(assert (= (and b!49659 c!6684) b!49658))

(assert (= (and b!49659 (not c!6684)) b!49657))

(assert (= (and b!49658 res!28739) b!49656))

(assert (= (or b!49656 b!49657) bm!3831))

(declare-fun m!42989 () Bool)

(assert (=> bm!3831 m!42989))

(declare-fun m!42991 () Bool)

(assert (=> b!49658 m!42991))

(declare-fun m!42993 () Bool)

(assert (=> b!49658 m!42993))

(declare-fun m!42995 () Bool)

(assert (=> b!49658 m!42995))

(assert (=> b!49658 m!42991))

(declare-fun m!42997 () Bool)

(assert (=> b!49658 m!42997))

(assert (=> b!49659 m!42991))

(assert (=> b!49659 m!42991))

(declare-fun m!42999 () Bool)

(assert (=> b!49659 m!42999))

(assert (=> b!49631 d!9963))

(declare-fun d!9965 () Bool)

(assert (=> d!9965 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836) _keys!1794 mask!2234)))

(declare-fun lt!20836 () Unit!1416)

(declare-fun choose!34 (array!3223 (_ BitVec 32) (_ BitVec 32)) Unit!1416)

(assert (=> d!9965 (= lt!20836 (choose!34 _keys!1794 mask!2234 (bvadd #b00000000000000000000000000000001 i!836)))))

(assert (=> d!9965 (validMask!0 mask!2234)))

(assert (=> d!9965 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 _keys!1794 mask!2234 (bvadd #b00000000000000000000000000000001 i!836)) lt!20836)))

(declare-fun bs!2332 () Bool)

(assert (= bs!2332 d!9965))

(assert (=> bs!2332 m!42953))

(declare-fun m!43001 () Bool)

(assert (=> bs!2332 m!43001))

(assert (=> bs!2332 m!42947))

(assert (=> b!49631 d!9965))

(check-sat (not d!9965) (not bm!3831) (not b!49658) (not bm!3830) (not b!49654) (not b!49655) (not b!49659))
(check-sat)
(get-model)

(declare-fun b!49692 () Bool)

(declare-fun e!32011 () Bool)

(declare-fun call!3843 () Bool)

(assert (=> b!49692 (= e!32011 call!3843)))

(declare-fun bm!3840 () Bool)

(assert (=> bm!3840 (= call!3843 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1794 mask!2234))))

(declare-fun d!9983 () Bool)

(declare-fun res!28758 () Bool)

(declare-fun e!32013 () Bool)

(assert (=> d!9983 (=> res!28758 e!32013)))

(assert (=> d!9983 (= res!28758 (bvsge (bvadd #b00000000000000000000000000000001 i!836 #b00000000000000000000000000000001) (size!1766 _keys!1794)))))

(assert (=> d!9983 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836 #b00000000000000000000000000000001) _keys!1794 mask!2234) e!32013)))

(declare-fun b!49693 () Bool)

(declare-fun e!32012 () Bool)

(assert (=> b!49693 (= e!32012 call!3843)))

(declare-fun b!49694 () Bool)

(assert (=> b!49694 (= e!32012 e!32011)))

(declare-fun lt!20869 () (_ BitVec 64))

(assert (=> b!49694 (= lt!20869 (select (arr!1544 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836 #b00000000000000000000000000000001)))))

(declare-fun lt!20867 () Unit!1416)

(assert (=> b!49694 (= lt!20867 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1794 lt!20869 (bvadd #b00000000000000000000000000000001 i!836 #b00000000000000000000000000000001)))))

(assert (=> b!49694 (arrayContainsKey!0 _keys!1794 lt!20869 #b00000000000000000000000000000000)))

(declare-fun lt!20868 () Unit!1416)

(assert (=> b!49694 (= lt!20868 lt!20867)))

(declare-fun res!28757 () Bool)

(assert (=> b!49694 (= res!28757 (= (seekEntryOrOpen!0 (select (arr!1544 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836 #b00000000000000000000000000000001)) _keys!1794 mask!2234) (Found!206 (bvadd #b00000000000000000000000000000001 i!836 #b00000000000000000000000000000001))))))

(assert (=> b!49694 (=> (not res!28757) (not e!32011))))

(declare-fun b!49695 () Bool)

(assert (=> b!49695 (= e!32013 e!32012)))

(declare-fun c!6693 () Bool)

(assert (=> b!49695 (= c!6693 (validKeyInArray!0 (select (arr!1544 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836 #b00000000000000000000000000000001))))))

(assert (= (and d!9983 (not res!28758)) b!49695))

(assert (= (and b!49695 c!6693) b!49694))

(assert (= (and b!49695 (not c!6693)) b!49693))

(assert (= (and b!49694 res!28757) b!49692))

(assert (= (or b!49692 b!49693) bm!3840))

(declare-fun m!43055 () Bool)

(assert (=> bm!3840 m!43055))

(declare-fun m!43057 () Bool)

(assert (=> b!49694 m!43057))

(declare-fun m!43059 () Bool)

(assert (=> b!49694 m!43059))

(declare-fun m!43061 () Bool)

(assert (=> b!49694 m!43061))

(assert (=> b!49694 m!43057))

(declare-fun m!43063 () Bool)

(assert (=> b!49694 m!43063))

(assert (=> b!49695 m!43057))

(assert (=> b!49695 m!43057))

(declare-fun m!43065 () Bool)

(assert (=> b!49695 m!43065))

(assert (=> bm!3831 d!9983))

(declare-fun b!49696 () Bool)

(declare-fun e!32014 () Bool)

(declare-fun call!3844 () Bool)

(assert (=> b!49696 (= e!32014 call!3844)))

(declare-fun bm!3841 () Bool)

(assert (=> bm!3841 (= call!3844 (arrayForallSeekEntryOrOpenFound!0 (bvadd i!836 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1794 mask!2234))))

(declare-fun d!9985 () Bool)

(declare-fun res!28760 () Bool)

(declare-fun e!32016 () Bool)

(assert (=> d!9985 (=> res!28760 e!32016)))

(assert (=> d!9985 (= res!28760 (bvsge (bvadd i!836 #b00000000000000000000000000000001) (size!1766 _keys!1794)))))

(assert (=> d!9985 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd i!836 #b00000000000000000000000000000001) _keys!1794 mask!2234) e!32016)))

(declare-fun b!49697 () Bool)

(declare-fun e!32015 () Bool)

(assert (=> b!49697 (= e!32015 call!3844)))

(declare-fun b!49698 () Bool)

(assert (=> b!49698 (= e!32015 e!32014)))

(declare-fun lt!20872 () (_ BitVec 64))

(assert (=> b!49698 (= lt!20872 (select (arr!1544 _keys!1794) (bvadd i!836 #b00000000000000000000000000000001)))))

(declare-fun lt!20870 () Unit!1416)

(assert (=> b!49698 (= lt!20870 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1794 lt!20872 (bvadd i!836 #b00000000000000000000000000000001)))))

(assert (=> b!49698 (arrayContainsKey!0 _keys!1794 lt!20872 #b00000000000000000000000000000000)))

(declare-fun lt!20871 () Unit!1416)

(assert (=> b!49698 (= lt!20871 lt!20870)))

(declare-fun res!28759 () Bool)

(assert (=> b!49698 (= res!28759 (= (seekEntryOrOpen!0 (select (arr!1544 _keys!1794) (bvadd i!836 #b00000000000000000000000000000001)) _keys!1794 mask!2234) (Found!206 (bvadd i!836 #b00000000000000000000000000000001))))))

(assert (=> b!49698 (=> (not res!28759) (not e!32014))))

(declare-fun b!49699 () Bool)

(assert (=> b!49699 (= e!32016 e!32015)))

(declare-fun c!6694 () Bool)

(assert (=> b!49699 (= c!6694 (validKeyInArray!0 (select (arr!1544 _keys!1794) (bvadd i!836 #b00000000000000000000000000000001))))))

(assert (= (and d!9985 (not res!28760)) b!49699))

(assert (= (and b!49699 c!6694) b!49698))

(assert (= (and b!49699 (not c!6694)) b!49697))

(assert (= (and b!49698 res!28759) b!49696))

(assert (= (or b!49696 b!49697) bm!3841))

(declare-fun m!43067 () Bool)

(assert (=> bm!3841 m!43067))

(declare-fun m!43069 () Bool)

(assert (=> b!49698 m!43069))

(declare-fun m!43071 () Bool)

(assert (=> b!49698 m!43071))

(declare-fun m!43073 () Bool)

(assert (=> b!49698 m!43073))

(assert (=> b!49698 m!43069))

(declare-fun m!43075 () Bool)

(assert (=> b!49698 m!43075))

(assert (=> b!49699 m!43069))

(assert (=> b!49699 m!43069))

(declare-fun m!43077 () Bool)

(assert (=> b!49699 m!43077))

(assert (=> bm!3830 d!9985))

(declare-fun d!9987 () Bool)

(assert (=> d!9987 (= (validKeyInArray!0 (select (arr!1544 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836))) (and (not (= (select (arr!1544 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1544 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!49659 d!9987))

(declare-fun d!9989 () Bool)

(assert (=> d!9989 (= (validKeyInArray!0 (select (arr!1544 _keys!1794) i!836)) (and (not (= (select (arr!1544 _keys!1794) i!836) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1544 _keys!1794) i!836) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!49655 d!9989))

(declare-fun d!9991 () Bool)

(assert (=> d!9991 (arrayContainsKey!0 _keys!1794 lt!20833 #b00000000000000000000000000000000)))

(declare-fun lt!20875 () Unit!1416)

(declare-fun choose!13 (array!3223 (_ BitVec 64) (_ BitVec 32)) Unit!1416)

(assert (=> d!9991 (= lt!20875 (choose!13 _keys!1794 lt!20833 (bvadd #b00000000000000000000000000000001 i!836)))))

(assert (=> d!9991 (bvsge (bvadd #b00000000000000000000000000000001 i!836) #b00000000000000000000000000000000)))

(assert (=> d!9991 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1794 lt!20833 (bvadd #b00000000000000000000000000000001 i!836)) lt!20875)))

(declare-fun bs!2335 () Bool)

(assert (= bs!2335 d!9991))

(assert (=> bs!2335 m!42995))

(declare-fun m!43079 () Bool)

(assert (=> bs!2335 m!43079))

(assert (=> b!49658 d!9991))

(declare-fun d!9993 () Bool)

(declare-fun res!28765 () Bool)

(declare-fun e!32021 () Bool)

(assert (=> d!9993 (=> res!28765 e!32021)))

(assert (=> d!9993 (= res!28765 (= (select (arr!1544 _keys!1794) #b00000000000000000000000000000000) lt!20833))))

(assert (=> d!9993 (= (arrayContainsKey!0 _keys!1794 lt!20833 #b00000000000000000000000000000000) e!32021)))

(declare-fun b!49704 () Bool)

(declare-fun e!32022 () Bool)

(assert (=> b!49704 (= e!32021 e!32022)))

(declare-fun res!28766 () Bool)

(assert (=> b!49704 (=> (not res!28766) (not e!32022))))

(assert (=> b!49704 (= res!28766 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1766 _keys!1794)))))

(declare-fun b!49705 () Bool)

(assert (=> b!49705 (= e!32022 (arrayContainsKey!0 _keys!1794 lt!20833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!9993 (not res!28765)) b!49704))

(assert (= (and b!49704 res!28766) b!49705))

(declare-fun m!43081 () Bool)

(assert (=> d!9993 m!43081))

(declare-fun m!43083 () Bool)

(assert (=> b!49705 m!43083))

(assert (=> b!49658 d!9993))

(declare-fun b!49730 () Bool)

(declare-fun e!32041 () SeekEntryResult!206)

(declare-fun e!32043 () SeekEntryResult!206)

(assert (=> b!49730 (= e!32041 e!32043)))

(declare-fun lt!20888 () (_ BitVec 64))

(declare-fun lt!20890 () SeekEntryResult!206)

(assert (=> b!49730 (= lt!20888 (select (arr!1544 _keys!1794) (index!2948 lt!20890)))))

(declare-fun c!6702 () Bool)

(assert (=> b!49730 (= c!6702 (= lt!20888 (select (arr!1544 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836))))))

(declare-fun b!49731 () Bool)

(assert (=> b!49731 (= e!32041 Undefined!206)))

(declare-fun d!9997 () Bool)

(declare-fun lt!20889 () SeekEntryResult!206)

(get-info :version)

(assert (=> d!9997 (and (or ((_ is Undefined!206) lt!20889) (not ((_ is Found!206) lt!20889)) (and (bvsge (index!2947 lt!20889) #b00000000000000000000000000000000) (bvslt (index!2947 lt!20889) (size!1766 _keys!1794)))) (or ((_ is Undefined!206) lt!20889) ((_ is Found!206) lt!20889) (not ((_ is MissingZero!206) lt!20889)) (and (bvsge (index!2946 lt!20889) #b00000000000000000000000000000000) (bvslt (index!2946 lt!20889) (size!1766 _keys!1794)))) (or ((_ is Undefined!206) lt!20889) ((_ is Found!206) lt!20889) ((_ is MissingZero!206) lt!20889) (not ((_ is MissingVacant!206) lt!20889)) (and (bvsge (index!2949 lt!20889) #b00000000000000000000000000000000) (bvslt (index!2949 lt!20889) (size!1766 _keys!1794)))) (or ((_ is Undefined!206) lt!20889) (ite ((_ is Found!206) lt!20889) (= (select (arr!1544 _keys!1794) (index!2947 lt!20889)) (select (arr!1544 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836))) (ite ((_ is MissingZero!206) lt!20889) (= (select (arr!1544 _keys!1794) (index!2946 lt!20889)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!206) lt!20889) (= (select (arr!1544 _keys!1794) (index!2949 lt!20889)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!9997 (= lt!20889 e!32041)))

(declare-fun c!6701 () Bool)

(assert (=> d!9997 (= c!6701 (and ((_ is Intermediate!206) lt!20890) (undefined!1018 lt!20890)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3223 (_ BitVec 32)) SeekEntryResult!206)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!9997 (= lt!20890 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1544 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836)) mask!2234) (select (arr!1544 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836)) _keys!1794 mask!2234))))

(assert (=> d!9997 (validMask!0 mask!2234)))

(assert (=> d!9997 (= (seekEntryOrOpen!0 (select (arr!1544 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836)) _keys!1794 mask!2234) lt!20889)))

(declare-fun b!49732 () Bool)

(declare-fun c!6703 () Bool)

(assert (=> b!49732 (= c!6703 (= lt!20888 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!32042 () SeekEntryResult!206)

(assert (=> b!49732 (= e!32043 e!32042)))

(declare-fun b!49733 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3223 (_ BitVec 32)) SeekEntryResult!206)

(assert (=> b!49733 (= e!32042 (seekKeyOrZeroReturnVacant!0 (x!9096 lt!20890) (index!2948 lt!20890) (index!2948 lt!20890) (select (arr!1544 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836)) _keys!1794 mask!2234))))

(declare-fun b!49734 () Bool)

(assert (=> b!49734 (= e!32043 (Found!206 (index!2948 lt!20890)))))

(declare-fun b!49735 () Bool)

(assert (=> b!49735 (= e!32042 (MissingZero!206 (index!2948 lt!20890)))))

(assert (= (and d!9997 c!6701) b!49731))

(assert (= (and d!9997 (not c!6701)) b!49730))

(assert (= (and b!49730 c!6702) b!49734))

(assert (= (and b!49730 (not c!6702)) b!49732))

(assert (= (and b!49732 c!6703) b!49735))

(assert (= (and b!49732 (not c!6703)) b!49733))

(declare-fun m!43097 () Bool)

(assert (=> b!49730 m!43097))

(declare-fun m!43099 () Bool)

(assert (=> d!9997 m!43099))

(assert (=> d!9997 m!42991))

(declare-fun m!43101 () Bool)

(assert (=> d!9997 m!43101))

(declare-fun m!43103 () Bool)

(assert (=> d!9997 m!43103))

(assert (=> d!9997 m!42991))

(assert (=> d!9997 m!43099))

(declare-fun m!43105 () Bool)

(assert (=> d!9997 m!43105))

(assert (=> d!9997 m!42947))

(declare-fun m!43107 () Bool)

(assert (=> d!9997 m!43107))

(assert (=> b!49733 m!42991))

(declare-fun m!43109 () Bool)

(assert (=> b!49733 m!43109))

(assert (=> b!49658 d!9997))

(declare-fun d!10015 () Bool)

(assert (=> d!10015 (arrayContainsKey!0 _keys!1794 lt!20830 #b00000000000000000000000000000000)))

(declare-fun lt!20897 () Unit!1416)

(assert (=> d!10015 (= lt!20897 (choose!13 _keys!1794 lt!20830 i!836))))

(assert (=> d!10015 (bvsge i!836 #b00000000000000000000000000000000)))

(assert (=> d!10015 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1794 lt!20830 i!836) lt!20897)))

(declare-fun bs!2339 () Bool)

(assert (= bs!2339 d!10015))

(assert (=> bs!2339 m!42983))

(declare-fun m!43111 () Bool)

(assert (=> bs!2339 m!43111))

(assert (=> b!49654 d!10015))

(declare-fun d!10017 () Bool)

(declare-fun res!28779 () Bool)

(declare-fun e!32050 () Bool)

(assert (=> d!10017 (=> res!28779 e!32050)))

(assert (=> d!10017 (= res!28779 (= (select (arr!1544 _keys!1794) #b00000000000000000000000000000000) lt!20830))))

(assert (=> d!10017 (= (arrayContainsKey!0 _keys!1794 lt!20830 #b00000000000000000000000000000000) e!32050)))

(declare-fun b!49748 () Bool)

(declare-fun e!32051 () Bool)

(assert (=> b!49748 (= e!32050 e!32051)))

(declare-fun res!28780 () Bool)

(assert (=> b!49748 (=> (not res!28780) (not e!32051))))

(assert (=> b!49748 (= res!28780 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1766 _keys!1794)))))

(declare-fun b!49749 () Bool)

(assert (=> b!49749 (= e!32051 (arrayContainsKey!0 _keys!1794 lt!20830 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!10017 (not res!28779)) b!49748))

(assert (= (and b!49748 res!28780) b!49749))

(assert (=> d!10017 m!43081))

(declare-fun m!43113 () Bool)

(assert (=> b!49749 m!43113))

(assert (=> b!49654 d!10017))

(declare-fun b!49750 () Bool)

(declare-fun e!32052 () SeekEntryResult!206)

(declare-fun e!32054 () SeekEntryResult!206)

(assert (=> b!49750 (= e!32052 e!32054)))

(declare-fun lt!20898 () (_ BitVec 64))

(declare-fun lt!20900 () SeekEntryResult!206)

(assert (=> b!49750 (= lt!20898 (select (arr!1544 _keys!1794) (index!2948 lt!20900)))))

(declare-fun c!6711 () Bool)

(assert (=> b!49750 (= c!6711 (= lt!20898 (select (arr!1544 _keys!1794) i!836)))))

(declare-fun b!49751 () Bool)

(assert (=> b!49751 (= e!32052 Undefined!206)))

(declare-fun d!10019 () Bool)

(declare-fun lt!20899 () SeekEntryResult!206)

(assert (=> d!10019 (and (or ((_ is Undefined!206) lt!20899) (not ((_ is Found!206) lt!20899)) (and (bvsge (index!2947 lt!20899) #b00000000000000000000000000000000) (bvslt (index!2947 lt!20899) (size!1766 _keys!1794)))) (or ((_ is Undefined!206) lt!20899) ((_ is Found!206) lt!20899) (not ((_ is MissingZero!206) lt!20899)) (and (bvsge (index!2946 lt!20899) #b00000000000000000000000000000000) (bvslt (index!2946 lt!20899) (size!1766 _keys!1794)))) (or ((_ is Undefined!206) lt!20899) ((_ is Found!206) lt!20899) ((_ is MissingZero!206) lt!20899) (not ((_ is MissingVacant!206) lt!20899)) (and (bvsge (index!2949 lt!20899) #b00000000000000000000000000000000) (bvslt (index!2949 lt!20899) (size!1766 _keys!1794)))) (or ((_ is Undefined!206) lt!20899) (ite ((_ is Found!206) lt!20899) (= (select (arr!1544 _keys!1794) (index!2947 lt!20899)) (select (arr!1544 _keys!1794) i!836)) (ite ((_ is MissingZero!206) lt!20899) (= (select (arr!1544 _keys!1794) (index!2946 lt!20899)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!206) lt!20899) (= (select (arr!1544 _keys!1794) (index!2949 lt!20899)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!10019 (= lt!20899 e!32052)))

(declare-fun c!6710 () Bool)

(assert (=> d!10019 (= c!6710 (and ((_ is Intermediate!206) lt!20900) (undefined!1018 lt!20900)))))

(assert (=> d!10019 (= lt!20900 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1544 _keys!1794) i!836) mask!2234) (select (arr!1544 _keys!1794) i!836) _keys!1794 mask!2234))))

(assert (=> d!10019 (validMask!0 mask!2234)))

(assert (=> d!10019 (= (seekEntryOrOpen!0 (select (arr!1544 _keys!1794) i!836) _keys!1794 mask!2234) lt!20899)))

(declare-fun b!49752 () Bool)

(declare-fun c!6712 () Bool)

(assert (=> b!49752 (= c!6712 (= lt!20898 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!32053 () SeekEntryResult!206)

(assert (=> b!49752 (= e!32054 e!32053)))

(declare-fun b!49753 () Bool)

(assert (=> b!49753 (= e!32053 (seekKeyOrZeroReturnVacant!0 (x!9096 lt!20900) (index!2948 lt!20900) (index!2948 lt!20900) (select (arr!1544 _keys!1794) i!836) _keys!1794 mask!2234))))

(declare-fun b!49754 () Bool)

(assert (=> b!49754 (= e!32054 (Found!206 (index!2948 lt!20900)))))

(declare-fun b!49755 () Bool)

(assert (=> b!49755 (= e!32053 (MissingZero!206 (index!2948 lt!20900)))))

(assert (= (and d!10019 c!6710) b!49751))

(assert (= (and d!10019 (not c!6710)) b!49750))

(assert (= (and b!49750 c!6711) b!49754))

(assert (= (and b!49750 (not c!6711)) b!49752))

(assert (= (and b!49752 c!6712) b!49755))

(assert (= (and b!49752 (not c!6712)) b!49753))

(declare-fun m!43115 () Bool)

(assert (=> b!49750 m!43115))

(declare-fun m!43117 () Bool)

(assert (=> d!10019 m!43117))

(assert (=> d!10019 m!42979))

(declare-fun m!43119 () Bool)

(assert (=> d!10019 m!43119))

(declare-fun m!43121 () Bool)

(assert (=> d!10019 m!43121))

(assert (=> d!10019 m!42979))

(assert (=> d!10019 m!43117))

(declare-fun m!43123 () Bool)

(assert (=> d!10019 m!43123))

(assert (=> d!10019 m!42947))

(declare-fun m!43125 () Bool)

(assert (=> d!10019 m!43125))

(assert (=> b!49753 m!42979))

(declare-fun m!43127 () Bool)

(assert (=> b!49753 m!43127))

(assert (=> b!49654 d!10019))

(assert (=> d!9965 d!9963))

(declare-fun d!10021 () Bool)

(assert (=> d!10021 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836) _keys!1794 mask!2234)))

(assert (=> d!10021 true))

(declare-fun _$30!81 () Unit!1416)

(assert (=> d!10021 (= (choose!34 _keys!1794 mask!2234 (bvadd #b00000000000000000000000000000001 i!836)) _$30!81)))

(declare-fun bs!2340 () Bool)

(assert (= bs!2340 d!10021))

(assert (=> bs!2340 m!42953))

(assert (=> d!9965 d!10021))

(assert (=> d!9965 d!9953))

(check-sat (not d!9991) (not bm!3841) (not b!49705) (not b!49749) (not d!9997) (not b!49694) (not b!49698) (not b!49733) (not b!49753) (not d!10019) (not d!10015) (not b!49695) (not b!49699) (not bm!3840) (not d!10021))
(check-sat)
