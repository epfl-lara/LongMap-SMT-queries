; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118940 () Bool)

(assert start!118940)

(declare-fun b!1388684 () Bool)

(declare-fun res!928985 () Bool)

(declare-fun e!786662 () Bool)

(assert (=> b!1388684 (=> (not res!928985) (not e!786662))))

(declare-datatypes ((array!94923 0))(
  ( (array!94924 (arr!45832 (Array (_ BitVec 32) (_ BitVec 64))) (size!46384 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!94923)

(assert (=> b!1388684 (= res!928985 (and (bvsle #b00000000000000000000000000000000 (size!46384 a!2901)) (bvslt (size!46384 a!2901) #b01111111111111111111111111111111)))))

(declare-fun b!1388685 () Bool)

(declare-fun e!786660 () Bool)

(assert (=> b!1388685 (= e!786662 e!786660)))

(declare-fun res!928987 () Bool)

(assert (=> b!1388685 (=> res!928987 e!786660)))

(declare-datatypes ((List!32429 0))(
  ( (Nil!32426) (Cons!32425 (h!33640 (_ BitVec 64)) (t!47115 List!32429)) )
))
(declare-fun contains!9714 (List!32429 (_ BitVec 64)) Bool)

(assert (=> b!1388685 (= res!928987 (contains!9714 Nil!32426 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1388687 () Bool)

(declare-fun res!928986 () Bool)

(assert (=> b!1388687 (=> (not res!928986) (not e!786662))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1388687 (= res!928986 (validKeyInArray!0 (select (arr!45832 a!2901) j!112)))))

(declare-fun b!1388688 () Bool)

(assert (=> b!1388688 (= e!786660 (contains!9714 Nil!32426 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1388689 () Bool)

(declare-fun res!928989 () Bool)

(assert (=> b!1388689 (=> (not res!928989) (not e!786662))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1388689 (= res!928989 (and (= (size!46384 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46384 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46384 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1388686 () Bool)

(declare-fun res!928988 () Bool)

(assert (=> b!1388686 (=> (not res!928988) (not e!786662))))

(assert (=> b!1388686 (= res!928988 (validKeyInArray!0 (select (arr!45832 a!2901) i!1037)))))

(declare-fun res!928990 () Bool)

(assert (=> start!118940 (=> (not res!928990) (not e!786662))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118940 (= res!928990 (validMask!0 mask!2840))))

(assert (=> start!118940 e!786662))

(assert (=> start!118940 true))

(declare-fun array_inv!35065 (array!94923) Bool)

(assert (=> start!118940 (array_inv!35065 a!2901)))

(declare-fun b!1388690 () Bool)

(declare-fun res!928984 () Bool)

(assert (=> b!1388690 (=> (not res!928984) (not e!786662))))

(declare-fun noDuplicate!2625 (List!32429) Bool)

(assert (=> b!1388690 (= res!928984 (noDuplicate!2625 Nil!32426))))

(declare-fun b!1388691 () Bool)

(declare-fun res!928983 () Bool)

(assert (=> b!1388691 (=> (not res!928983) (not e!786662))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94923 (_ BitVec 32)) Bool)

(assert (=> b!1388691 (= res!928983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!118940 res!928990) b!1388689))

(assert (= (and b!1388689 res!928989) b!1388686))

(assert (= (and b!1388686 res!928988) b!1388687))

(assert (= (and b!1388687 res!928986) b!1388691))

(assert (= (and b!1388691 res!928983) b!1388684))

(assert (= (and b!1388684 res!928985) b!1388690))

(assert (= (and b!1388690 res!928984) b!1388685))

(assert (= (and b!1388685 (not res!928987)) b!1388688))

(declare-fun m!1273957 () Bool)

(assert (=> b!1388686 m!1273957))

(assert (=> b!1388686 m!1273957))

(declare-fun m!1273959 () Bool)

(assert (=> b!1388686 m!1273959))

(declare-fun m!1273961 () Bool)

(assert (=> b!1388685 m!1273961))

(declare-fun m!1273963 () Bool)

(assert (=> b!1388687 m!1273963))

(assert (=> b!1388687 m!1273963))

(declare-fun m!1273965 () Bool)

(assert (=> b!1388687 m!1273965))

(declare-fun m!1273967 () Bool)

(assert (=> b!1388690 m!1273967))

(declare-fun m!1273969 () Bool)

(assert (=> start!118940 m!1273969))

(declare-fun m!1273971 () Bool)

(assert (=> start!118940 m!1273971))

(declare-fun m!1273973 () Bool)

(assert (=> b!1388691 m!1273973))

(declare-fun m!1273975 () Bool)

(assert (=> b!1388688 m!1273975))

(check-sat (not b!1388691) (not b!1388687) (not b!1388685) (not b!1388688) (not b!1388686) (not b!1388690) (not start!118940))
(check-sat)
(get-model)

(declare-fun d!149893 () Bool)

(declare-fun res!929043 () Bool)

(declare-fun e!786685 () Bool)

(assert (=> d!149893 (=> res!929043 e!786685)))

(get-info :version)

(assert (=> d!149893 (= res!929043 ((_ is Nil!32426) Nil!32426))))

(assert (=> d!149893 (= (noDuplicate!2625 Nil!32426) e!786685)))

(declare-fun b!1388744 () Bool)

(declare-fun e!786686 () Bool)

(assert (=> b!1388744 (= e!786685 e!786686)))

(declare-fun res!929044 () Bool)

(assert (=> b!1388744 (=> (not res!929044) (not e!786686))))

(assert (=> b!1388744 (= res!929044 (not (contains!9714 (t!47115 Nil!32426) (h!33640 Nil!32426))))))

(declare-fun b!1388745 () Bool)

(assert (=> b!1388745 (= e!786686 (noDuplicate!2625 (t!47115 Nil!32426)))))

(assert (= (and d!149893 (not res!929043)) b!1388744))

(assert (= (and b!1388744 res!929044) b!1388745))

(declare-fun m!1274017 () Bool)

(assert (=> b!1388744 m!1274017))

(declare-fun m!1274019 () Bool)

(assert (=> b!1388745 m!1274019))

(assert (=> b!1388690 d!149893))

(declare-fun d!149897 () Bool)

(declare-fun lt!610228 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!763 (List!32429) (InoxSet (_ BitVec 64)))

(assert (=> d!149897 (= lt!610228 (select (content!763 Nil!32426) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!786701 () Bool)

(assert (=> d!149897 (= lt!610228 e!786701)))

(declare-fun res!929058 () Bool)

(assert (=> d!149897 (=> (not res!929058) (not e!786701))))

(assert (=> d!149897 (= res!929058 ((_ is Cons!32425) Nil!32426))))

(assert (=> d!149897 (= (contains!9714 Nil!32426 #b0000000000000000000000000000000000000000000000000000000000000000) lt!610228)))

(declare-fun b!1388758 () Bool)

(declare-fun e!786702 () Bool)

(assert (=> b!1388758 (= e!786701 e!786702)))

(declare-fun res!929057 () Bool)

(assert (=> b!1388758 (=> res!929057 e!786702)))

(assert (=> b!1388758 (= res!929057 (= (h!33640 Nil!32426) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1388759 () Bool)

(assert (=> b!1388759 (= e!786702 (contains!9714 (t!47115 Nil!32426) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!149897 res!929058) b!1388758))

(assert (= (and b!1388758 (not res!929057)) b!1388759))

(declare-fun m!1274027 () Bool)

(assert (=> d!149897 m!1274027))

(declare-fun m!1274029 () Bool)

(assert (=> d!149897 m!1274029))

(declare-fun m!1274031 () Bool)

(assert (=> b!1388759 m!1274031))

(assert (=> b!1388685 d!149897))

(declare-fun d!149903 () Bool)

(declare-fun res!929079 () Bool)

(declare-fun e!786727 () Bool)

(assert (=> d!149903 (=> res!929079 e!786727)))

(assert (=> d!149903 (= res!929079 (bvsge #b00000000000000000000000000000000 (size!46384 a!2901)))))

(assert (=> d!149903 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!786727)))

(declare-fun b!1388790 () Bool)

(declare-fun e!786726 () Bool)

(assert (=> b!1388790 (= e!786727 e!786726)))

(declare-fun c!129301 () Bool)

(assert (=> b!1388790 (= c!129301 (validKeyInArray!0 (select (arr!45832 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1388791 () Bool)

(declare-fun e!786728 () Bool)

(assert (=> b!1388791 (= e!786726 e!786728)))

(declare-fun lt!610246 () (_ BitVec 64))

(assert (=> b!1388791 (= lt!610246 (select (arr!45832 a!2901) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!46263 0))(
  ( (Unit!46264) )
))
(declare-fun lt!610245 () Unit!46263)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!94923 (_ BitVec 64) (_ BitVec 32)) Unit!46263)

(assert (=> b!1388791 (= lt!610245 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!610246 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!94923 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1388791 (arrayContainsKey!0 a!2901 lt!610246 #b00000000000000000000000000000000)))

(declare-fun lt!610247 () Unit!46263)

(assert (=> b!1388791 (= lt!610247 lt!610245)))

(declare-fun res!929080 () Bool)

(declare-datatypes ((SeekEntryResult!10193 0))(
  ( (MissingZero!10193 (index!43143 (_ BitVec 32))) (Found!10193 (index!43144 (_ BitVec 32))) (Intermediate!10193 (undefined!11005 Bool) (index!43145 (_ BitVec 32)) (x!124785 (_ BitVec 32))) (Undefined!10193) (MissingVacant!10193 (index!43146 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94923 (_ BitVec 32)) SeekEntryResult!10193)

(assert (=> b!1388791 (= res!929080 (= (seekEntryOrOpen!0 (select (arr!45832 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10193 #b00000000000000000000000000000000)))))

(assert (=> b!1388791 (=> (not res!929080) (not e!786728))))

(declare-fun b!1388792 () Bool)

(declare-fun call!66638 () Bool)

(assert (=> b!1388792 (= e!786726 call!66638)))

(declare-fun bm!66635 () Bool)

(assert (=> bm!66635 (= call!66638 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1388793 () Bool)

(assert (=> b!1388793 (= e!786728 call!66638)))

(assert (= (and d!149903 (not res!929079)) b!1388790))

(assert (= (and b!1388790 c!129301) b!1388791))

(assert (= (and b!1388790 (not c!129301)) b!1388792))

(assert (= (and b!1388791 res!929080) b!1388793))

(assert (= (or b!1388793 b!1388792) bm!66635))

(declare-fun m!1274053 () Bool)

(assert (=> b!1388790 m!1274053))

(assert (=> b!1388790 m!1274053))

(declare-fun m!1274057 () Bool)

(assert (=> b!1388790 m!1274057))

(assert (=> b!1388791 m!1274053))

(declare-fun m!1274059 () Bool)

(assert (=> b!1388791 m!1274059))

(declare-fun m!1274061 () Bool)

(assert (=> b!1388791 m!1274061))

(assert (=> b!1388791 m!1274053))

(declare-fun m!1274063 () Bool)

(assert (=> b!1388791 m!1274063))

(declare-fun m!1274065 () Bool)

(assert (=> bm!66635 m!1274065))

(assert (=> b!1388691 d!149903))

(declare-fun d!149911 () Bool)

(assert (=> d!149911 (= (validKeyInArray!0 (select (arr!45832 a!2901) i!1037)) (and (not (= (select (arr!45832 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45832 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1388686 d!149911))

(declare-fun d!149915 () Bool)

(assert (=> d!149915 (= (validKeyInArray!0 (select (arr!45832 a!2901) j!112)) (and (not (= (select (arr!45832 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45832 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1388687 d!149915))

(declare-fun d!149917 () Bool)

(assert (=> d!149917 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!118940 d!149917))

(declare-fun d!149931 () Bool)

(assert (=> d!149931 (= (array_inv!35065 a!2901) (bvsge (size!46384 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!118940 d!149931))

(declare-fun d!149933 () Bool)

(declare-fun lt!610259 () Bool)

(assert (=> d!149933 (= lt!610259 (select (content!763 Nil!32426) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!786748 () Bool)

(assert (=> d!149933 (= lt!610259 e!786748)))

(declare-fun res!929098 () Bool)

(assert (=> d!149933 (=> (not res!929098) (not e!786748))))

(assert (=> d!149933 (= res!929098 ((_ is Cons!32425) Nil!32426))))

(assert (=> d!149933 (= (contains!9714 Nil!32426 #b1000000000000000000000000000000000000000000000000000000000000000) lt!610259)))

(declare-fun b!1388816 () Bool)

(declare-fun e!786749 () Bool)

(assert (=> b!1388816 (= e!786748 e!786749)))

(declare-fun res!929097 () Bool)

(assert (=> b!1388816 (=> res!929097 e!786749)))

(assert (=> b!1388816 (= res!929097 (= (h!33640 Nil!32426) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1388817 () Bool)

(assert (=> b!1388817 (= e!786749 (contains!9714 (t!47115 Nil!32426) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!149933 res!929098) b!1388816))

(assert (= (and b!1388816 (not res!929097)) b!1388817))

(assert (=> d!149933 m!1274027))

(declare-fun m!1274091 () Bool)

(assert (=> d!149933 m!1274091))

(declare-fun m!1274093 () Bool)

(assert (=> b!1388817 m!1274093))

(assert (=> b!1388688 d!149933))

(check-sat (not b!1388744) (not d!149933) (not b!1388745) (not d!149897) (not b!1388817) (not b!1388790) (not b!1388759) (not bm!66635) (not b!1388791))
(check-sat)
