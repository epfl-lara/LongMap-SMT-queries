; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116608 () Bool)

(assert start!116608)

(declare-fun b!1374848 () Bool)

(declare-fun res!918023 () Bool)

(declare-fun e!778857 () Bool)

(assert (=> b!1374848 (=> (not res!918023) (not e!778857))))

(declare-fun k0!2959 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374848 (= res!918023 (not (validKeyInArray!0 k0!2959)))))

(declare-fun res!918019 () Bool)

(assert (=> start!116608 (=> (not res!918019) (not e!778857))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((array!93252 0))(
  ( (array!93253 (arr!45031 (Array (_ BitVec 32) (_ BitVec 64))) (size!45583 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93252)

(assert (=> start!116608 (= res!918019 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45583 a!4142))))))

(assert (=> start!116608 e!778857))

(assert (=> start!116608 true))

(declare-fun array_inv!34264 (array!93252) Bool)

(assert (=> start!116608 (array_inv!34264 a!4142)))

(declare-fun b!1374849 () Bool)

(declare-fun res!918021 () Bool)

(assert (=> b!1374849 (=> (not res!918021) (not e!778857))))

(assert (=> b!1374849 (= res!918021 (validKeyInArray!0 (select (arr!45031 a!4142) i!1457)))))

(declare-fun b!1374850 () Bool)

(declare-fun e!778856 () Bool)

(assert (=> b!1374850 (= e!778857 (not e!778856))))

(declare-fun res!918020 () Bool)

(assert (=> b!1374850 (=> res!918020 e!778856)))

(assert (=> b!1374850 (= res!918020 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) i!1457)))))

(declare-fun lt!603740 () array!93252)

(declare-fun arrayCountValidKeys!0 (array!93252 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374850 (= (arrayCountValidKeys!0 lt!603740 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(assert (=> b!1374850 (= lt!603740 (array!93253 (store (arr!45031 a!4142) i!1457 k0!2959) (size!45583 a!4142)))))

(declare-datatypes ((Unit!45342 0))(
  ( (Unit!45343) )
))
(declare-fun lt!603739 () Unit!45342)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93252 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45342)

(assert (=> b!1374850 (= lt!603739 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k0!2959 i!1457))))

(declare-fun b!1374851 () Bool)

(declare-fun res!918022 () Bool)

(assert (=> b!1374851 (=> (not res!918022) (not e!778857))))

(assert (=> b!1374851 (= res!918022 (bvslt (size!45583 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374852 () Bool)

(assert (=> b!1374852 (= e!778856 (= (arrayCountValidKeys!0 lt!603740 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)) (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457))))))

(assert (= (and start!116608 res!918019) b!1374849))

(assert (= (and b!1374849 res!918021) b!1374848))

(assert (= (and b!1374848 res!918023) b!1374851))

(assert (= (and b!1374851 res!918022) b!1374850))

(assert (= (and b!1374850 (not res!918020)) b!1374852))

(declare-fun m!1257993 () Bool)

(assert (=> b!1374849 m!1257993))

(assert (=> b!1374849 m!1257993))

(declare-fun m!1257995 () Bool)

(assert (=> b!1374849 m!1257995))

(declare-fun m!1257997 () Bool)

(assert (=> b!1374848 m!1257997))

(declare-fun m!1257999 () Bool)

(assert (=> b!1374850 m!1257999))

(declare-fun m!1258001 () Bool)

(assert (=> b!1374850 m!1258001))

(declare-fun m!1258003 () Bool)

(assert (=> b!1374850 m!1258003))

(declare-fun m!1258005 () Bool)

(assert (=> b!1374850 m!1258005))

(declare-fun m!1258007 () Bool)

(assert (=> start!116608 m!1258007))

(declare-fun m!1258009 () Bool)

(assert (=> b!1374852 m!1258009))

(declare-fun m!1258011 () Bool)

(assert (=> b!1374852 m!1258011))

(check-sat (not b!1374849) (not b!1374848) (not b!1374850) (not b!1374852) (not start!116608))
(check-sat)
(get-model)

(declare-fun d!148061 () Bool)

(assert (=> d!148061 (= (validKeyInArray!0 (select (arr!45031 a!4142) i!1457)) (and (not (= (select (arr!45031 a!4142) i!1457) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45031 a!4142) i!1457) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1374849 d!148061))

(declare-fun bm!65637 () Bool)

(declare-fun call!65640 () (_ BitVec 32))

(assert (=> bm!65637 (= call!65640 (arrayCountValidKeys!0 lt!603740 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374891 () Bool)

(declare-fun e!778882 () (_ BitVec 32))

(assert (=> b!1374891 (= e!778882 #b00000000000000000000000000000000)))

(declare-fun b!1374892 () Bool)

(declare-fun e!778881 () (_ BitVec 32))

(assert (=> b!1374892 (= e!778881 (bvadd #b00000000000000000000000000000001 call!65640))))

(declare-fun d!148063 () Bool)

(declare-fun lt!603755 () (_ BitVec 32))

(assert (=> d!148063 (and (bvsge lt!603755 #b00000000000000000000000000000000) (bvsle lt!603755 (bvsub (size!45583 lt!603740) #b00000000000000000000000000000000)))))

(assert (=> d!148063 (= lt!603755 e!778882)))

(declare-fun c!127861 () Bool)

(assert (=> d!148063 (= c!127861 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> d!148063 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) (size!45583 lt!603740)))))

(assert (=> d!148063 (= (arrayCountValidKeys!0 lt!603740 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) lt!603755)))

(declare-fun b!1374893 () Bool)

(assert (=> b!1374893 (= e!778881 call!65640)))

(declare-fun b!1374894 () Bool)

(assert (=> b!1374894 (= e!778882 e!778881)))

(declare-fun c!127862 () Bool)

(assert (=> b!1374894 (= c!127862 (validKeyInArray!0 (select (arr!45031 lt!603740) #b00000000000000000000000000000000)))))

(assert (= (and d!148063 c!127861) b!1374891))

(assert (= (and d!148063 (not c!127861)) b!1374894))

(assert (= (and b!1374894 c!127862) b!1374892))

(assert (= (and b!1374894 (not c!127862)) b!1374893))

(assert (= (or b!1374892 b!1374893) bm!65637))

(declare-fun m!1258053 () Bool)

(assert (=> bm!65637 m!1258053))

(declare-fun m!1258055 () Bool)

(assert (=> b!1374894 m!1258055))

(assert (=> b!1374894 m!1258055))

(declare-fun m!1258057 () Bool)

(assert (=> b!1374894 m!1258057))

(assert (=> b!1374850 d!148063))

(declare-fun bm!65638 () Bool)

(declare-fun call!65641 () (_ BitVec 32))

(assert (=> bm!65638 (= call!65641 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374895 () Bool)

(declare-fun e!778884 () (_ BitVec 32))

(assert (=> b!1374895 (= e!778884 #b00000000000000000000000000000000)))

(declare-fun b!1374896 () Bool)

(declare-fun e!778883 () (_ BitVec 32))

(assert (=> b!1374896 (= e!778883 (bvadd #b00000000000000000000000000000001 call!65641))))

(declare-fun d!148065 () Bool)

(declare-fun lt!603756 () (_ BitVec 32))

(assert (=> d!148065 (and (bvsge lt!603756 #b00000000000000000000000000000000) (bvsle lt!603756 (bvsub (size!45583 a!4142) #b00000000000000000000000000000000)))))

(assert (=> d!148065 (= lt!603756 e!778884)))

(declare-fun c!127863 () Bool)

(assert (=> d!148065 (= c!127863 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> d!148065 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) (size!45583 a!4142)))))

(assert (=> d!148065 (= (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) lt!603756)))

(declare-fun b!1374897 () Bool)

(assert (=> b!1374897 (= e!778883 call!65641)))

(declare-fun b!1374898 () Bool)

(assert (=> b!1374898 (= e!778884 e!778883)))

(declare-fun c!127864 () Bool)

(assert (=> b!1374898 (= c!127864 (validKeyInArray!0 (select (arr!45031 a!4142) #b00000000000000000000000000000000)))))

(assert (= (and d!148065 c!127863) b!1374895))

(assert (= (and d!148065 (not c!127863)) b!1374898))

(assert (= (and b!1374898 c!127864) b!1374896))

(assert (= (and b!1374898 (not c!127864)) b!1374897))

(assert (= (or b!1374896 b!1374897) bm!65638))

(declare-fun m!1258059 () Bool)

(assert (=> bm!65638 m!1258059))

(declare-fun m!1258061 () Bool)

(assert (=> b!1374898 m!1258061))

(assert (=> b!1374898 m!1258061))

(declare-fun m!1258063 () Bool)

(assert (=> b!1374898 m!1258063))

(assert (=> b!1374850 d!148065))

(declare-fun d!148067 () Bool)

(declare-fun e!778891 () Bool)

(assert (=> d!148067 e!778891))

(declare-fun res!918056 () Bool)

(assert (=> d!148067 (=> (not res!918056) (not e!778891))))

(assert (=> d!148067 (= res!918056 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45583 a!4142))))))

(declare-fun lt!603761 () Unit!45342)

(declare-fun choose!4 (array!93252 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45342)

(assert (=> d!148067 (= lt!603761 (choose!4 a!4142 i!1457 k0!2959 i!1457))))

(assert (=> d!148067 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45583 a!4142)))))

(assert (=> d!148067 (= (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k0!2959 i!1457) lt!603761)))

(declare-fun b!1374909 () Bool)

(assert (=> b!1374909 (= e!778891 (= (arrayCountValidKeys!0 (array!93253 (store (arr!45031 a!4142) i!1457 k0!2959) (size!45583 a!4142)) #b00000000000000000000000000000000 (bvadd i!1457 #b00000000000000000000000000000001)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd i!1457 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))))

(assert (= (and d!148067 res!918056) b!1374909))

(declare-fun m!1258065 () Bool)

(assert (=> d!148067 m!1258065))

(assert (=> b!1374909 m!1258003))

(declare-fun m!1258067 () Bool)

(assert (=> b!1374909 m!1258067))

(declare-fun m!1258069 () Bool)

(assert (=> b!1374909 m!1258069))

(assert (=> b!1374850 d!148067))

(declare-fun d!148079 () Bool)

(assert (=> d!148079 (= (array_inv!34264 a!4142) (bvsge (size!45583 a!4142) #b00000000000000000000000000000000))))

(assert (=> start!116608 d!148079))

(declare-fun d!148081 () Bool)

(assert (=> d!148081 (= (validKeyInArray!0 k0!2959) (and (not (= k0!2959 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2959 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1374848 d!148081))

(declare-fun bm!65641 () Bool)

(declare-fun call!65644 () (_ BitVec 32))

(assert (=> bm!65641 (= call!65644 (arrayCountValidKeys!0 lt!603740 (bvadd #b00000000000000000000000000000001 i!1457 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374910 () Bool)

(declare-fun e!778893 () (_ BitVec 32))

(assert (=> b!1374910 (= e!778893 #b00000000000000000000000000000000)))

(declare-fun b!1374911 () Bool)

(declare-fun e!778892 () (_ BitVec 32))

(assert (=> b!1374911 (= e!778892 (bvadd #b00000000000000000000000000000001 call!65644))))

(declare-fun d!148083 () Bool)

(declare-fun lt!603762 () (_ BitVec 32))

(assert (=> d!148083 (and (bvsge lt!603762 #b00000000000000000000000000000000) (bvsle lt!603762 (bvsub (size!45583 lt!603740) (bvadd #b00000000000000000000000000000001 i!1457))))))

(assert (=> d!148083 (= lt!603762 e!778893)))

(declare-fun c!127869 () Bool)

(assert (=> d!148083 (= c!127869 (bvsge (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> d!148083 (and (bvsle (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)) (bvsge (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) (size!45583 lt!603740)))))

(assert (=> d!148083 (= (arrayCountValidKeys!0 lt!603740 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)) lt!603762)))

(declare-fun b!1374912 () Bool)

(assert (=> b!1374912 (= e!778892 call!65644)))

(declare-fun b!1374913 () Bool)

(assert (=> b!1374913 (= e!778893 e!778892)))

(declare-fun c!127870 () Bool)

(assert (=> b!1374913 (= c!127870 (validKeyInArray!0 (select (arr!45031 lt!603740) (bvadd #b00000000000000000000000000000001 i!1457))))))

(assert (= (and d!148083 c!127869) b!1374910))

(assert (= (and d!148083 (not c!127869)) b!1374913))

(assert (= (and b!1374913 c!127870) b!1374911))

(assert (= (and b!1374913 (not c!127870)) b!1374912))

(assert (= (or b!1374911 b!1374912) bm!65641))

(declare-fun m!1258071 () Bool)

(assert (=> bm!65641 m!1258071))

(declare-fun m!1258073 () Bool)

(assert (=> b!1374913 m!1258073))

(assert (=> b!1374913 m!1258073))

(declare-fun m!1258075 () Bool)

(assert (=> b!1374913 m!1258075))

(assert (=> b!1374852 d!148083))

(declare-fun bm!65642 () Bool)

(declare-fun call!65645 () (_ BitVec 32))

(assert (=> bm!65642 (= call!65645 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374914 () Bool)

(declare-fun e!778895 () (_ BitVec 32))

(assert (=> b!1374914 (= e!778895 #b00000000000000000000000000000000)))

(declare-fun b!1374915 () Bool)

(declare-fun e!778894 () (_ BitVec 32))

(assert (=> b!1374915 (= e!778894 (bvadd #b00000000000000000000000000000001 call!65645))))

(declare-fun d!148085 () Bool)

(declare-fun lt!603763 () (_ BitVec 32))

(assert (=> d!148085 (and (bvsge lt!603763 #b00000000000000000000000000000000) (bvsle lt!603763 (bvsub (size!45583 a!4142) (bvadd #b00000000000000000000000000000001 i!1457))))))

(assert (=> d!148085 (= lt!603763 e!778895)))

(declare-fun c!127871 () Bool)

(assert (=> d!148085 (= c!127871 (bvsge (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> d!148085 (and (bvsle (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)) (bvsge (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1457) (size!45583 a!4142)))))

(assert (=> d!148085 (= (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (bvadd #b00000000000000000000000000000001 i!1457)) lt!603763)))

(declare-fun b!1374916 () Bool)

(assert (=> b!1374916 (= e!778894 call!65645)))

(declare-fun b!1374917 () Bool)

(assert (=> b!1374917 (= e!778895 e!778894)))

(declare-fun c!127872 () Bool)

(assert (=> b!1374917 (= c!127872 (validKeyInArray!0 (select (arr!45031 a!4142) (bvadd #b00000000000000000000000000000001 i!1457))))))

(assert (= (and d!148085 c!127871) b!1374914))

(assert (= (and d!148085 (not c!127871)) b!1374917))

(assert (= (and b!1374917 c!127872) b!1374915))

(assert (= (and b!1374917 (not c!127872)) b!1374916))

(assert (= (or b!1374915 b!1374916) bm!65642))

(declare-fun m!1258077 () Bool)

(assert (=> bm!65642 m!1258077))

(declare-fun m!1258079 () Bool)

(assert (=> b!1374917 m!1258079))

(assert (=> b!1374917 m!1258079))

(declare-fun m!1258081 () Bool)

(assert (=> b!1374917 m!1258081))

(assert (=> b!1374852 d!148085))

(check-sat (not bm!65637) (not d!148067) (not b!1374917) (not bm!65642) (not b!1374894) (not b!1374913) (not bm!65641) (not bm!65638) (not b!1374898) (not b!1374909))
(check-sat)
