; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7886 () Bool)

(assert start!7886)

(declare-fun res!28744 () Bool)

(declare-fun e!31998 () Bool)

(assert (=> start!7886 (=> (not res!28744) (not e!31998))))

(declare-fun mask!2234 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7886 (= res!28744 (validMask!0 mask!2234))))

(assert (=> start!7886 e!31998))

(assert (=> start!7886 true))

(declare-datatypes ((array!3237 0))(
  ( (array!3238 (arr!1551 (Array (_ BitVec 32) (_ BitVec 64))) (size!1773 (_ BitVec 32))) )
))
(declare-fun _keys!1794 () array!3237)

(declare-fun array_inv!947 (array!3237) Bool)

(assert (=> start!7886 (array_inv!947 _keys!1794)))

(declare-fun b!49687 () Bool)

(declare-fun res!28745 () Bool)

(assert (=> b!49687 (=> (not res!28745) (not e!31998))))

(declare-fun i!836 () (_ BitVec 32))

(assert (=> b!49687 (= res!28745 (and (= (size!1773 _keys!1794) (bvadd #b00000000000000000000000000000001 mask!2234)) (= _keys!1794 (array!3238 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!2234))) (bvsge i!836 #b00000000000000000000000000000000) (bvsle i!836 (size!1773 _keys!1794)) (bvslt i!836 (size!1773 _keys!1794)) (bvsge (bvadd #b00000000000000000000000000000001 i!836) #b00000000000000000000000000000000)))))

(declare-fun b!49688 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3237 (_ BitVec 32)) Bool)

(assert (=> b!49688 (= e!31998 (not (arrayForallSeekEntryOrOpenFound!0 i!836 _keys!1794 mask!2234)))))

(assert (=> b!49688 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836) _keys!1794 mask!2234)))

(declare-datatypes ((Unit!1405 0))(
  ( (Unit!1406) )
))
(declare-fun lt!20858 () Unit!1405)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!3237 (_ BitVec 32) (_ BitVec 32)) Unit!1405)

(assert (=> b!49688 (= lt!20858 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 _keys!1794 mask!2234 (bvadd #b00000000000000000000000000000001 i!836)))))

(assert (= (and start!7886 res!28744) b!49687))

(assert (= (and b!49687 res!28745) b!49688))

(declare-fun m!43071 () Bool)

(assert (=> start!7886 m!43071))

(declare-fun m!43073 () Bool)

(assert (=> start!7886 m!43073))

(declare-fun m!43075 () Bool)

(assert (=> b!49688 m!43075))

(declare-fun m!43077 () Bool)

(assert (=> b!49688 m!43077))

(declare-fun m!43079 () Bool)

(assert (=> b!49688 m!43079))

(push 1)

(assert (not start!7886))

(assert (not b!49688))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9969 () Bool)

(assert (=> d!9969 (= (validMask!0 mask!2234) (and (or (= mask!2234 #b00000000000000000000000000000111) (= mask!2234 #b00000000000000000000000000001111) (= mask!2234 #b00000000000000000000000000011111) (= mask!2234 #b00000000000000000000000000111111) (= mask!2234 #b00000000000000000000000001111111) (= mask!2234 #b00000000000000000000000011111111) (= mask!2234 #b00000000000000000000000111111111) (= mask!2234 #b00000000000000000000001111111111) (= mask!2234 #b00000000000000000000011111111111) (= mask!2234 #b00000000000000000000111111111111) (= mask!2234 #b00000000000000000001111111111111) (= mask!2234 #b00000000000000000011111111111111) (= mask!2234 #b00000000000000000111111111111111) (= mask!2234 #b00000000000000001111111111111111) (= mask!2234 #b00000000000000011111111111111111) (= mask!2234 #b00000000000000111111111111111111) (= mask!2234 #b00000000000001111111111111111111) (= mask!2234 #b00000000000011111111111111111111) (= mask!2234 #b00000000000111111111111111111111) (= mask!2234 #b00000000001111111111111111111111) (= mask!2234 #b00000000011111111111111111111111) (= mask!2234 #b00000000111111111111111111111111) (= mask!2234 #b00000001111111111111111111111111) (= mask!2234 #b00000011111111111111111111111111) (= mask!2234 #b00000111111111111111111111111111) (= mask!2234 #b00001111111111111111111111111111) (= mask!2234 #b00011111111111111111111111111111) (= mask!2234 #b00111111111111111111111111111111)) (bvsle mask!2234 #b00111111111111111111111111111111)))))

(assert (=> start!7886 d!9969))

(declare-fun d!9977 () Bool)

(assert (=> d!9977 (= (array_inv!947 _keys!1794) (bvsge (size!1773 _keys!1794) #b00000000000000000000000000000000))))

(assert (=> start!7886 d!9977))

(declare-fun d!9979 () Bool)

(declare-fun res!28774 () Bool)

(declare-fun e!32038 () Bool)

(assert (=> d!9979 (=> res!28774 e!32038)))

(assert (=> d!9979 (= res!28774 (bvsge i!836 (size!1773 _keys!1794)))))

(assert (=> d!9979 (= (arrayForallSeekEntryOrOpenFound!0 i!836 _keys!1794 mask!2234) e!32038)))

(declare-fun b!49733 () Bool)

(declare-fun e!32036 () Bool)

(assert (=> b!49733 (= e!32038 e!32036)))

(declare-fun c!6705 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!49733 (= c!6705 (validKeyInArray!0 (select (arr!1551 _keys!1794) i!836)))))

(declare-fun b!49734 () Bool)

(declare-fun e!32037 () Bool)

(assert (=> b!49734 (= e!32036 e!32037)))

(declare-fun lt!20890 () (_ BitVec 64))

(assert (=> b!49734 (= lt!20890 (select (arr!1551 _keys!1794) i!836))))

(declare-fun lt!20891 () Unit!1405)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3237 (_ BitVec 64) (_ BitVec 32)) Unit!1405)

(assert (=> b!49734 (= lt!20891 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1794 lt!20890 i!836))))

(declare-fun arrayContainsKey!0 (array!3237 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!49734 (arrayContainsKey!0 _keys!1794 lt!20890 #b00000000000000000000000000000000)))

(declare-fun lt!20889 () Unit!1405)

(assert (=> b!49734 (= lt!20889 lt!20891)))

(declare-fun res!28775 () Bool)

(declare-datatypes ((SeekEntryResult!213 0))(
  ( (MissingZero!213 (index!2974 (_ BitVec 32))) (Found!213 (index!2975 (_ BitVec 32))) (Intermediate!213 (undefined!1025 Bool) (index!2976 (_ BitVec 32)) (x!9103 (_ BitVec 32))) (Undefined!213) (MissingVacant!213 (index!2977 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3237 (_ BitVec 32)) SeekEntryResult!213)

(assert (=> b!49734 (= res!28775 (= (seekEntryOrOpen!0 (select (arr!1551 _keys!1794) i!836) _keys!1794 mask!2234) (Found!213 i!836)))))

(assert (=> b!49734 (=> (not res!28775) (not e!32037))))

(declare-fun call!3853 () Bool)

(declare-fun bm!3850 () Bool)

(assert (=> bm!3850 (= call!3853 (arrayForallSeekEntryOrOpenFound!0 (bvadd i!836 #b00000000000000000000000000000001) _keys!1794 mask!2234))))

(declare-fun b!49735 () Bool)

(assert (=> b!49735 (= e!32037 call!3853)))

(declare-fun b!49736 () Bool)

(assert (=> b!49736 (= e!32036 call!3853)))

(assert (= (and d!9979 (not res!28774)) b!49733))

(assert (= (and b!49733 c!6705) b!49734))

(assert (= (and b!49733 (not c!6705)) b!49736))

(assert (= (and b!49734 res!28775) b!49735))

(assert (= (or b!49735 b!49736) bm!3850))

(declare-fun m!43125 () Bool)

(assert (=> b!49733 m!43125))

(assert (=> b!49733 m!43125))

(declare-fun m!43127 () Bool)

(assert (=> b!49733 m!43127))

(assert (=> b!49734 m!43125))

(declare-fun m!43129 () Bool)

(assert (=> b!49734 m!43129))

(declare-fun m!43131 () Bool)

(assert (=> b!49734 m!43131))

(assert (=> b!49734 m!43125))

(declare-fun m!43133 () Bool)

(assert (=> b!49734 m!43133))

(declare-fun m!43135 () Bool)

(assert (=> bm!3850 m!43135))

(assert (=> b!49688 d!9979))

(declare-fun d!9989 () Bool)

(declare-fun res!28776 () Bool)

(declare-fun e!32041 () Bool)

(assert (=> d!9989 (=> res!28776 e!32041)))

(assert (=> d!9989 (= res!28776 (bvsge (bvadd #b00000000000000000000000000000001 i!836) (size!1773 _keys!1794)))))

(assert (=> d!9989 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836) _keys!1794 mask!2234) e!32041)))

(declare-fun b!49737 () Bool)

(declare-fun e!32039 () Bool)

(assert (=> b!49737 (= e!32041 e!32039)))

(declare-fun c!6706 () Bool)

(assert (=> b!49737 (= c!6706 (validKeyInArray!0 (select (arr!1551 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836))))))

(declare-fun b!49738 () Bool)

(declare-fun e!32040 () Bool)

(assert (=> b!49738 (= e!32039 e!32040)))

(declare-fun lt!20893 () (_ BitVec 64))

(assert (=> b!49738 (= lt!20893 (select (arr!1551 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836)))))

(declare-fun lt!20894 () Unit!1405)

(assert (=> b!49738 (= lt!20894 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1794 lt!20893 (bvadd #b00000000000000000000000000000001 i!836)))))

(assert (=> b!49738 (arrayContainsKey!0 _keys!1794 lt!20893 #b00000000000000000000000000000000)))

(declare-fun lt!20892 () Unit!1405)

(assert (=> b!49738 (= lt!20892 lt!20894)))

(declare-fun res!28777 () Bool)

(assert (=> b!49738 (= res!28777 (= (seekEntryOrOpen!0 (select (arr!1551 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836)) _keys!1794 mask!2234) (Found!213 (bvadd #b00000000000000000000000000000001 i!836))))))

(assert (=> b!49738 (=> (not res!28777) (not e!32040))))

(declare-fun call!3854 () Bool)

(declare-fun bm!3851 () Bool)

(assert (=> bm!3851 (= call!3854 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836 #b00000000000000000000000000000001) _keys!1794 mask!2234))))

(declare-fun b!49739 () Bool)

(assert (=> b!49739 (= e!32040 call!3854)))

(declare-fun b!49740 () Bool)

(assert (=> b!49740 (= e!32039 call!3854)))

(assert (= (and d!9989 (not res!28776)) b!49737))

(assert (= (and b!49737 c!6706) b!49738))

(assert (= (and b!49737 (not c!6706)) b!49740))

(assert (= (and b!49738 res!28777) b!49739))

(assert (= (or b!49739 b!49740) bm!3851))

(declare-fun m!43137 () Bool)

(assert (=> b!49737 m!43137))

(assert (=> b!49737 m!43137))

(declare-fun m!43139 () Bool)

(assert (=> b!49737 m!43139))

(assert (=> b!49738 m!43137))

(declare-fun m!43141 () Bool)

(assert (=> b!49738 m!43141))

(declare-fun m!43143 () Bool)

(assert (=> b!49738 m!43143))

(assert (=> b!49738 m!43137))

(declare-fun m!43145 () Bool)

(assert (=> b!49738 m!43145))

(declare-fun m!43147 () Bool)

(assert (=> bm!3851 m!43147))

(assert (=> b!49688 d!9989))

(declare-fun d!9991 () Bool)

(assert (=> d!9991 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836) _keys!1794 mask!2234)))

(declare-fun lt!20906 () Unit!1405)

(declare-fun choose!34 (array!3237 (_ BitVec 32) (_ BitVec 32)) Unit!1405)

(assert (=> d!9991 (= lt!20906 (choose!34 _keys!1794 mask!2234 (bvadd #b00000000000000000000000000000001 i!836)))))

(assert (=> d!9991 (validMask!0 mask!2234)))

(assert (=> d!9991 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 _keys!1794 mask!2234 (bvadd #b00000000000000000000000000000001 i!836)) lt!20906)))

(declare-fun bs!2333 () Bool)

(assert (= bs!2333 d!9991))

(assert (=> bs!2333 m!43077))

(declare-fun m!43175 () Bool)

(assert (=> bs!2333 m!43175))

(assert (=> bs!2333 m!43071))

(assert (=> b!49688 d!9991))

(push 1)

(assert (not b!49737))

(assert (not b!49734))

(assert (not bm!3850))

(assert (not b!49738))

(assert (not b!49733))

(assert (not d!9991))

(assert (not bm!3851))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9999 () Bool)

(declare-fun res!28782 () Bool)

(declare-fun e!32050 () Bool)

(assert (=> d!9999 (=> res!28782 e!32050)))

(assert (=> d!9999 (= res!28782 (bvsge (bvadd #b00000000000000000000000000000001 i!836 #b00000000000000000000000000000001) (size!1773 _keys!1794)))))

(assert (=> d!9999 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836 #b00000000000000000000000000000001) _keys!1794 mask!2234) e!32050)))

(declare-fun b!49749 () Bool)

(declare-fun e!32048 () Bool)

(assert (=> b!49749 (= e!32050 e!32048)))

(declare-fun c!6709 () Bool)

(assert (=> b!49749 (= c!6709 (validKeyInArray!0 (select (arr!1551 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836 #b00000000000000000000000000000001))))))

(declare-fun b!49750 () Bool)

(declare-fun e!32049 () Bool)

(assert (=> b!49750 (= e!32048 e!32049)))

(declare-fun lt!20914 () (_ BitVec 64))

(assert (=> b!49750 (= lt!20914 (select (arr!1551 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836 #b00000000000000000000000000000001)))))

(declare-fun lt!20915 () Unit!1405)

(assert (=> b!49750 (= lt!20915 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1794 lt!20914 (bvadd #b00000000000000000000000000000001 i!836 #b00000000000000000000000000000001)))))

(assert (=> b!49750 (arrayContainsKey!0 _keys!1794 lt!20914 #b00000000000000000000000000000000)))

(declare-fun lt!20913 () Unit!1405)

(assert (=> b!49750 (= lt!20913 lt!20915)))

(declare-fun res!28783 () Bool)

(assert (=> b!49750 (= res!28783 (= (seekEntryOrOpen!0 (select (arr!1551 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836 #b00000000000000000000000000000001)) _keys!1794 mask!2234) (Found!213 (bvadd #b00000000000000000000000000000001 i!836 #b00000000000000000000000000000001))))))

(assert (=> b!49750 (=> (not res!28783) (not e!32049))))

(declare-fun call!3857 () Bool)

(declare-fun bm!3854 () Bool)

(assert (=> bm!3854 (= call!3857 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1794 mask!2234))))

(declare-fun b!49751 () Bool)

(assert (=> b!49751 (= e!32049 call!3857)))

(declare-fun b!49752 () Bool)

(assert (=> b!49752 (= e!32048 call!3857)))

(assert (= (and d!9999 (not res!28782)) b!49749))

(assert (= (and b!49749 c!6709) b!49750))

(assert (= (and b!49749 (not c!6709)) b!49752))

(assert (= (and b!49750 res!28783) b!49751))

(assert (= (or b!49751 b!49752) bm!3854))

(declare-fun m!43181 () Bool)

(assert (=> b!49749 m!43181))

(assert (=> b!49749 m!43181))

(declare-fun m!43183 () Bool)

(assert (=> b!49749 m!43183))

(assert (=> b!49750 m!43181))

(declare-fun m!43185 () Bool)

(assert (=> b!49750 m!43185))

(declare-fun m!43187 () Bool)

(assert (=> b!49750 m!43187))

(assert (=> b!49750 m!43181))

(declare-fun m!43189 () Bool)

(assert (=> b!49750 m!43189))

(declare-fun m!43191 () Bool)

(assert (=> bm!3854 m!43191))

(assert (=> bm!3851 d!9999))

(declare-fun d!10003 () Bool)

(assert (=> d!10003 (= (validKeyInArray!0 (select (arr!1551 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836))) (and (not (= (select (arr!1551 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1551 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!49737 d!10003))

(declare-fun d!10005 () Bool)

(assert (=> d!10005 (arrayContainsKey!0 _keys!1794 lt!20893 #b00000000000000000000000000000000)))

(declare-fun lt!20918 () Unit!1405)

(declare-fun choose!13 (array!3237 (_ BitVec 64) (_ BitVec 32)) Unit!1405)

(assert (=> d!10005 (= lt!20918 (choose!13 _keys!1794 lt!20893 (bvadd #b00000000000000000000000000000001 i!836)))))

(assert (=> d!10005 (bvsge (bvadd #b00000000000000000000000000000001 i!836) #b00000000000000000000000000000000)))

(assert (=> d!10005 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1794 lt!20893 (bvadd #b00000000000000000000000000000001 i!836)) lt!20918)))

(declare-fun bs!2336 () Bool)

(assert (= bs!2336 d!10005))

(assert (=> bs!2336 m!43143))

(declare-fun m!43197 () Bool)

(assert (=> bs!2336 m!43197))

(assert (=> b!49738 d!10005))

(declare-fun d!10009 () Bool)

(declare-fun res!28794 () Bool)

(declare-fun e!32061 () Bool)

(assert (=> d!10009 (=> res!28794 e!32061)))

(assert (=> d!10009 (= res!28794 (= (select (arr!1551 _keys!1794) #b00000000000000000000000000000000) lt!20893))))

(assert (=> d!10009 (= (arrayContainsKey!0 _keys!1794 lt!20893 #b00000000000000000000000000000000) e!32061)))

(declare-fun b!49763 () Bool)

(declare-fun e!32062 () Bool)

(assert (=> b!49763 (= e!32061 e!32062)))

(declare-fun res!28795 () Bool)

(assert (=> b!49763 (=> (not res!28795) (not e!32062))))

(assert (=> b!49763 (= res!28795 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1773 _keys!1794)))))

(declare-fun b!49764 () Bool)

(assert (=> b!49764 (= e!32062 (arrayContainsKey!0 _keys!1794 lt!20893 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!10009 (not res!28794)) b!49763))

(assert (= (and b!49763 res!28795) b!49764))

(declare-fun m!43199 () Bool)

(assert (=> d!10009 m!43199))

(declare-fun m!43201 () Bool)

(assert (=> b!49764 m!43201))

(assert (=> b!49738 d!10009))

(declare-fun b!49801 () Bool)

(declare-fun e!32085 () SeekEntryResult!213)

(assert (=> b!49801 (= e!32085 Undefined!213)))

(declare-fun b!49802 () Bool)

(declare-fun c!6727 () Bool)

(declare-fun lt!20938 () (_ BitVec 64))

(assert (=> b!49802 (= c!6727 (= lt!20938 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!32086 () SeekEntryResult!213)

(declare-fun e!32084 () SeekEntryResult!213)

(assert (=> b!49802 (= e!32086 e!32084)))

(declare-fun lt!20937 () SeekEntryResult!213)

(declare-fun b!49803 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3237 (_ BitVec 32)) SeekEntryResult!213)

(assert (=> b!49803 (= e!32084 (seekKeyOrZeroReturnVacant!0 (x!9103 lt!20937) (index!2976 lt!20937) (index!2976 lt!20937) (select (arr!1551 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836)) _keys!1794 mask!2234))))

(declare-fun b!49804 () Bool)

(assert (=> b!49804 (= e!32084 (MissingZero!213 (index!2976 lt!20937)))))

(declare-fun b!49805 () Bool)

(assert (=> b!49805 (= e!32086 (Found!213 (index!2976 lt!20937)))))

(declare-fun d!10011 () Bool)

(declare-fun lt!20939 () SeekEntryResult!213)

(assert (=> d!10011 (and (or (is-Undefined!213 lt!20939) (not (is-Found!213 lt!20939)) (and (bvsge (index!2975 lt!20939) #b00000000000000000000000000000000) (bvslt (index!2975 lt!20939) (size!1773 _keys!1794)))) (or (is-Undefined!213 lt!20939) (is-Found!213 lt!20939) (not (is-MissingZero!213 lt!20939)) (and (bvsge (index!2974 lt!20939) #b00000000000000000000000000000000) (bvslt (index!2974 lt!20939) (size!1773 _keys!1794)))) (or (is-Undefined!213 lt!20939) (is-Found!213 lt!20939) (is-MissingZero!213 lt!20939) (not (is-MissingVacant!213 lt!20939)) (and (bvsge (index!2977 lt!20939) #b00000000000000000000000000000000) (bvslt (index!2977 lt!20939) (size!1773 _keys!1794)))) (or (is-Undefined!213 lt!20939) (ite (is-Found!213 lt!20939) (= (select (arr!1551 _keys!1794) (index!2975 lt!20939)) (select (arr!1551 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836))) (ite (is-MissingZero!213 lt!20939) (= (select (arr!1551 _keys!1794) (index!2974 lt!20939)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!213 lt!20939) (= (select (arr!1551 _keys!1794) (index!2977 lt!20939)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!10011 (= lt!20939 e!32085)))

(declare-fun c!6726 () Bool)

(assert (=> d!10011 (= c!6726 (and (is-Intermediate!213 lt!20937) (undefined!1025 lt!20937)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3237 (_ BitVec 32)) SeekEntryResult!213)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!10011 (= lt!20937 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1551 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836)) mask!2234) (select (arr!1551 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836)) _keys!1794 mask!2234))))

(assert (=> d!10011 (validMask!0 mask!2234)))

(assert (=> d!10011 (= (seekEntryOrOpen!0 (select (arr!1551 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836)) _keys!1794 mask!2234) lt!20939)))

(declare-fun b!49806 () Bool)

(assert (=> b!49806 (= e!32085 e!32086)))

(assert (=> b!49806 (= lt!20938 (select (arr!1551 _keys!1794) (index!2976 lt!20937)))))

(declare-fun c!6725 () Bool)

(assert (=> b!49806 (= c!6725 (= lt!20938 (select (arr!1551 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836))))))

(assert (= (and d!10011 c!6726) b!49801))

(assert (= (and d!10011 (not c!6726)) b!49806))

(assert (= (and b!49806 c!6725) b!49805))

(assert (= (and b!49806 (not c!6725)) b!49802))

(assert (= (and b!49802 c!6727) b!49804))

(assert (= (and b!49802 (not c!6727)) b!49803))

(assert (=> b!49803 m!43137))

(declare-fun m!43223 () Bool)

(assert (=> b!49803 m!43223))

(declare-fun m!43225 () Bool)

(assert (=> d!10011 m!43225))

(assert (=> d!10011 m!43137))

(declare-fun m!43227 () Bool)

(assert (=> d!10011 m!43227))

(declare-fun m!43229 () Bool)

(assert (=> d!10011 m!43229))

(assert (=> d!10011 m!43137))

(assert (=> d!10011 m!43225))

(declare-fun m!43231 () Bool)

(assert (=> d!10011 m!43231))

(assert (=> d!10011 m!43071))

(declare-fun m!43233 () Bool)

(assert (=> d!10011 m!43233))

(declare-fun m!43235 () Bool)

(assert (=> b!49806 m!43235))

(assert (=> b!49738 d!10011))

(assert (=> d!9991 d!9989))

(declare-fun d!10023 () Bool)

(assert (=> d!10023 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836) _keys!1794 mask!2234)))

(assert (=> d!10023 true))

(declare-fun _$30!81 () Unit!1405)

(assert (=> d!10023 (= (choose!34 _keys!1794 mask!2234 (bvadd #b00000000000000000000000000000001 i!836)) _$30!81)))

(declare-fun bs!2339 () Bool)

(assert (= bs!2339 d!10023))

(assert (=> bs!2339 m!43077))

(assert (=> d!9991 d!10023))

(assert (=> d!9991 d!9969))

(declare-fun d!10033 () Bool)

(assert (=> d!10033 (arrayContainsKey!0 _keys!1794 lt!20890 #b00000000000000000000000000000000)))

(declare-fun lt!20947 () Unit!1405)

(assert (=> d!10033 (= lt!20947 (choose!13 _keys!1794 lt!20890 i!836))))

(assert (=> d!10033 (bvsge i!836 #b00000000000000000000000000000000)))

(assert (=> d!10033 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1794 lt!20890 i!836) lt!20947)))

(declare-fun bs!2341 () Bool)

(assert (= bs!2341 d!10033))

(assert (=> bs!2341 m!43131))

(declare-fun m!43263 () Bool)

(assert (=> bs!2341 m!43263))

(assert (=> b!49734 d!10033))

(declare-fun d!10037 () Bool)

(declare-fun res!28808 () Bool)

(declare-fun e!32095 () Bool)

(assert (=> d!10037 (=> res!28808 e!32095)))

(assert (=> d!10037 (= res!28808 (= (select (arr!1551 _keys!1794) #b00000000000000000000000000000000) lt!20890))))

(assert (=> d!10037 (= (arrayContainsKey!0 _keys!1794 lt!20890 #b00000000000000000000000000000000) e!32095)))

(declare-fun b!49817 () Bool)

(declare-fun e!32096 () Bool)

(assert (=> b!49817 (= e!32095 e!32096)))

(declare-fun res!28809 () Bool)

(assert (=> b!49817 (=> (not res!28809) (not e!32096))))

(assert (=> b!49817 (= res!28809 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1773 _keys!1794)))))

(declare-fun b!49818 () Bool)

(assert (=> b!49818 (= e!32096 (arrayContainsKey!0 _keys!1794 lt!20890 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!10037 (not res!28808)) b!49817))

(assert (= (and b!49817 res!28809) b!49818))

(assert (=> d!10037 m!43199))

(declare-fun m!43267 () Bool)

(assert (=> b!49818 m!43267))

(assert (=> b!49734 d!10037))

(declare-fun b!49825 () Bool)

(declare-fun e!32101 () SeekEntryResult!213)

(assert (=> b!49825 (= e!32101 Undefined!213)))

(declare-fun b!49826 () Bool)

(declare-fun c!6735 () Bool)

(declare-fun lt!20952 () (_ BitVec 64))

(assert (=> b!49826 (= c!6735 (= lt!20952 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!32102 () SeekEntryResult!213)

(declare-fun e!32100 () SeekEntryResult!213)

(assert (=> b!49826 (= e!32102 e!32100)))

(declare-fun b!49827 () Bool)

(declare-fun lt!20951 () SeekEntryResult!213)

(assert (=> b!49827 (= e!32100 (seekKeyOrZeroReturnVacant!0 (x!9103 lt!20951) (index!2976 lt!20951) (index!2976 lt!20951) (select (arr!1551 _keys!1794) i!836) _keys!1794 mask!2234))))

(declare-fun b!49828 () Bool)

(assert (=> b!49828 (= e!32100 (MissingZero!213 (index!2976 lt!20951)))))

(declare-fun b!49829 () Bool)

(assert (=> b!49829 (= e!32102 (Found!213 (index!2976 lt!20951)))))

(declare-fun d!10041 () Bool)

(declare-fun lt!20953 () SeekEntryResult!213)

(assert (=> d!10041 (and (or (is-Undefined!213 lt!20953) (not (is-Found!213 lt!20953)) (and (bvsge (index!2975 lt!20953) #b00000000000000000000000000000000) (bvslt (index!2975 lt!20953) (size!1773 _keys!1794)))) (or (is-Undefined!213 lt!20953) (is-Found!213 lt!20953) (not (is-MissingZero!213 lt!20953)) (and (bvsge (index!2974 lt!20953) #b00000000000000000000000000000000) (bvslt (index!2974 lt!20953) (size!1773 _keys!1794)))) (or (is-Undefined!213 lt!20953) (is-Found!213 lt!20953) (is-MissingZero!213 lt!20953) (not (is-MissingVacant!213 lt!20953)) (and (bvsge (index!2977 lt!20953) #b00000000000000000000000000000000) (bvslt (index!2977 lt!20953) (size!1773 _keys!1794)))) (or (is-Undefined!213 lt!20953) (ite (is-Found!213 lt!20953) (= (select (arr!1551 _keys!1794) (index!2975 lt!20953)) (select (arr!1551 _keys!1794) i!836)) (ite (is-MissingZero!213 lt!20953) (= (select (arr!1551 _keys!1794) (index!2974 lt!20953)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!213 lt!20953) (= (select (arr!1551 _keys!1794) (index!2977 lt!20953)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!10041 (= lt!20953 e!32101)))

(declare-fun c!6734 () Bool)

(assert (=> d!10041 (= c!6734 (and (is-Intermediate!213 lt!20951) (undefined!1025 lt!20951)))))

(assert (=> d!10041 (= lt!20951 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1551 _keys!1794) i!836) mask!2234) (select (arr!1551 _keys!1794) i!836) _keys!1794 mask!2234))))

(assert (=> d!10041 (validMask!0 mask!2234)))

(assert (=> d!10041 (= (seekEntryOrOpen!0 (select (arr!1551 _keys!1794) i!836) _keys!1794 mask!2234) lt!20953)))

(declare-fun b!49830 () Bool)

(assert (=> b!49830 (= e!32101 e!32102)))

(assert (=> b!49830 (= lt!20952 (select (arr!1551 _keys!1794) (index!2976 lt!20951)))))

(declare-fun c!6733 () Bool)

(assert (=> b!49830 (= c!6733 (= lt!20952 (select (arr!1551 _keys!1794) i!836)))))

(assert (= (and d!10041 c!6734) b!49825))

(assert (= (and d!10041 (not c!6734)) b!49830))

(assert (= (and b!49830 c!6733) b!49829))

(assert (= (and b!49830 (not c!6733)) b!49826))

(assert (= (and b!49826 c!6735) b!49828))

(assert (= (and b!49826 (not c!6735)) b!49827))

(assert (=> b!49827 m!43125))

(declare-fun m!43277 () Bool)

(assert (=> b!49827 m!43277))

(declare-fun m!43282 () Bool)

(assert (=> d!10041 m!43282))

(assert (=> d!10041 m!43125))

(declare-fun m!43285 () Bool)

(assert (=> d!10041 m!43285))

(declare-fun m!43289 () Bool)

(assert (=> d!10041 m!43289))

(assert (=> d!10041 m!43125))

(assert (=> d!10041 m!43282))

(declare-fun m!43291 () Bool)

(assert (=> d!10041 m!43291))

(assert (=> d!10041 m!43071))

(declare-fun m!43293 () Bool)

(assert (=> d!10041 m!43293))

(declare-fun m!43295 () Bool)

(assert (=> b!49830 m!43295))

(assert (=> b!49734 d!10041))

(declare-fun d!10043 () Bool)

(declare-fun res!28810 () Bool)

(declare-fun e!32105 () Bool)

(assert (=> d!10043 (=> res!28810 e!32105)))

(assert (=> d!10043 (= res!28810 (bvsge (bvadd i!836 #b00000000000000000000000000000001) (size!1773 _keys!1794)))))

(assert (=> d!10043 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd i!836 #b00000000000000000000000000000001) _keys!1794 mask!2234) e!32105)))

(declare-fun b!49831 () Bool)

(declare-fun e!32103 () Bool)

(assert (=> b!49831 (= e!32105 e!32103)))

(declare-fun c!6736 () Bool)

(assert (=> b!49831 (= c!6736 (validKeyInArray!0 (select (arr!1551 _keys!1794) (bvadd i!836 #b00000000000000000000000000000001))))))

(declare-fun b!49832 () Bool)

(declare-fun e!32104 () Bool)

(assert (=> b!49832 (= e!32103 e!32104)))

(declare-fun lt!20955 () (_ BitVec 64))

(assert (=> b!49832 (= lt!20955 (select (arr!1551 _keys!1794) (bvadd i!836 #b00000000000000000000000000000001)))))

(declare-fun lt!20956 () Unit!1405)

(assert (=> b!49832 (= lt!20956 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1794 lt!20955 (bvadd i!836 #b00000000000000000000000000000001)))))

(assert (=> b!49832 (arrayContainsKey!0 _keys!1794 lt!20955 #b00000000000000000000000000000000)))

(declare-fun lt!20954 () Unit!1405)

(assert (=> b!49832 (= lt!20954 lt!20956)))

(declare-fun res!28811 () Bool)

(assert (=> b!49832 (= res!28811 (= (seekEntryOrOpen!0 (select (arr!1551 _keys!1794) (bvadd i!836 #b00000000000000000000000000000001)) _keys!1794 mask!2234) (Found!213 (bvadd i!836 #b00000000000000000000000000000001))))))

(assert (=> b!49832 (=> (not res!28811) (not e!32104))))

(declare-fun call!3860 () Bool)

(declare-fun bm!3857 () Bool)

(assert (=> bm!3857 (= call!3860 (arrayForallSeekEntryOrOpenFound!0 (bvadd i!836 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1794 mask!2234))))

(declare-fun b!49833 () Bool)

(assert (=> b!49833 (= e!32104 call!3860)))

(declare-fun b!49834 () Bool)

(assert (=> b!49834 (= e!32103 call!3860)))

(assert (= (and d!10043 (not res!28810)) b!49831))

(assert (= (and b!49831 c!6736) b!49832))

(assert (= (and b!49831 (not c!6736)) b!49834))

(assert (= (and b!49832 res!28811) b!49833))

(assert (= (or b!49833 b!49834) bm!3857))

(declare-fun m!43297 () Bool)

(assert (=> b!49831 m!43297))

(assert (=> b!49831 m!43297))

(declare-fun m!43299 () Bool)

(assert (=> b!49831 m!43299))

(assert (=> b!49832 m!43297))

(declare-fun m!43301 () Bool)

(assert (=> b!49832 m!43301))

(declare-fun m!43303 () Bool)

(assert (=> b!49832 m!43303))

(assert (=> b!49832 m!43297))

(declare-fun m!43305 () Bool)

(assert (=> b!49832 m!43305))

(declare-fun m!43307 () Bool)

(assert (=> bm!3857 m!43307))

(assert (=> bm!3850 d!10043))

(declare-fun d!10045 () Bool)

(assert (=> d!10045 (= (validKeyInArray!0 (select (arr!1551 _keys!1794) i!836)) (and (not (= (select (arr!1551 _keys!1794) i!836) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1551 _keys!1794) i!836) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!49733 d!10045))

(push 1)

