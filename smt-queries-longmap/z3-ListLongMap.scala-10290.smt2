; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120902 () Bool)

(assert start!120902)

(declare-fun b!1406773 () Bool)

(declare-fun e!796206 () Bool)

(declare-datatypes ((SeekEntryResult!10763 0))(
  ( (MissingZero!10763 (index!45429 (_ BitVec 32))) (Found!10763 (index!45430 (_ BitVec 32))) (Intermediate!10763 (undefined!11575 Bool) (index!45431 (_ BitVec 32)) (x!127026 (_ BitVec 32))) (Undefined!10763) (MissingVacant!10763 (index!45432 (_ BitVec 32))) )
))
(declare-fun lt!619502 () SeekEntryResult!10763)

(assert (=> b!1406773 (= e!796206 (and (bvsge (x!127026 lt!619502) #b00000000000000000000000000000000) (bvsle (x!127026 lt!619502) #b01111111111111111111111111111110)))))

(declare-fun b!1406774 () Bool)

(declare-fun res!944994 () Bool)

(declare-fun e!796205 () Bool)

(assert (=> b!1406774 (=> (not res!944994) (not e!796205))))

(declare-datatypes ((array!96209 0))(
  ( (array!96210 (arr!46452 (Array (_ BitVec 32) (_ BitVec 64))) (size!47002 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96209)

(declare-datatypes ((List!32971 0))(
  ( (Nil!32968) (Cons!32967 (h!34221 (_ BitVec 64)) (t!47665 List!32971)) )
))
(declare-fun arrayNoDuplicates!0 (array!96209 (_ BitVec 32) List!32971) Bool)

(assert (=> b!1406774 (= res!944994 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32968))))

(declare-fun b!1406775 () Bool)

(declare-fun res!944996 () Bool)

(assert (=> b!1406775 (=> (not res!944996) (not e!796205))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96209 (_ BitVec 32)) Bool)

(assert (=> b!1406775 (= res!944996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun e!796208 () Bool)

(declare-fun b!1406776 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96209 (_ BitVec 32)) SeekEntryResult!10763)

(assert (=> b!1406776 (= e!796208 (= (seekEntryOrOpen!0 (select (arr!46452 a!2901) j!112) a!2901 mask!2840) (Found!10763 j!112)))))

(declare-fun b!1406777 () Bool)

(declare-fun res!944992 () Bool)

(assert (=> b!1406777 (=> (not res!944992) (not e!796205))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1406777 (= res!944992 (and (= (size!47002 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47002 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47002 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406778 () Bool)

(declare-fun res!944991 () Bool)

(assert (=> b!1406778 (=> (not res!944991) (not e!796205))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406778 (= res!944991 (validKeyInArray!0 (select (arr!46452 a!2901) i!1037)))))

(declare-fun b!1406779 () Bool)

(declare-fun res!944995 () Bool)

(assert (=> b!1406779 (=> res!944995 e!796206)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96209 (_ BitVec 32)) SeekEntryResult!10763)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406779 (= res!944995 (not (= lt!619502 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46452 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46452 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96210 (store (arr!46452 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47002 a!2901)) mask!2840))))))

(declare-fun res!944993 () Bool)

(assert (=> start!120902 (=> (not res!944993) (not e!796205))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120902 (= res!944993 (validMask!0 mask!2840))))

(assert (=> start!120902 e!796205))

(assert (=> start!120902 true))

(declare-fun array_inv!35480 (array!96209) Bool)

(assert (=> start!120902 (array_inv!35480 a!2901)))

(declare-fun b!1406780 () Bool)

(assert (=> b!1406780 (= e!796205 (not e!796206))))

(declare-fun res!944990 () Bool)

(assert (=> b!1406780 (=> res!944990 e!796206)))

(get-info :version)

(assert (=> b!1406780 (= res!944990 (or (not ((_ is Intermediate!10763) lt!619502)) (undefined!11575 lt!619502)))))

(assert (=> b!1406780 e!796208))

(declare-fun res!944998 () Bool)

(assert (=> b!1406780 (=> (not res!944998) (not e!796208))))

(assert (=> b!1406780 (= res!944998 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47500 0))(
  ( (Unit!47501) )
))
(declare-fun lt!619503 () Unit!47500)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96209 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47500)

(assert (=> b!1406780 (= lt!619503 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1406780 (= lt!619502 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46452 a!2901) j!112) mask!2840) (select (arr!46452 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406781 () Bool)

(declare-fun res!944997 () Bool)

(assert (=> b!1406781 (=> (not res!944997) (not e!796205))))

(assert (=> b!1406781 (= res!944997 (validKeyInArray!0 (select (arr!46452 a!2901) j!112)))))

(assert (= (and start!120902 res!944993) b!1406777))

(assert (= (and b!1406777 res!944992) b!1406778))

(assert (= (and b!1406778 res!944991) b!1406781))

(assert (= (and b!1406781 res!944997) b!1406775))

(assert (= (and b!1406775 res!944996) b!1406774))

(assert (= (and b!1406774 res!944994) b!1406780))

(assert (= (and b!1406780 res!944998) b!1406776))

(assert (= (and b!1406780 (not res!944990)) b!1406779))

(assert (= (and b!1406779 (not res!944995)) b!1406773))

(declare-fun m!1296049 () Bool)

(assert (=> b!1406778 m!1296049))

(assert (=> b!1406778 m!1296049))

(declare-fun m!1296051 () Bool)

(assert (=> b!1406778 m!1296051))

(declare-fun m!1296053 () Bool)

(assert (=> b!1406781 m!1296053))

(assert (=> b!1406781 m!1296053))

(declare-fun m!1296055 () Bool)

(assert (=> b!1406781 m!1296055))

(declare-fun m!1296057 () Bool)

(assert (=> b!1406774 m!1296057))

(declare-fun m!1296059 () Bool)

(assert (=> b!1406775 m!1296059))

(assert (=> b!1406776 m!1296053))

(assert (=> b!1406776 m!1296053))

(declare-fun m!1296061 () Bool)

(assert (=> b!1406776 m!1296061))

(declare-fun m!1296063 () Bool)

(assert (=> b!1406779 m!1296063))

(declare-fun m!1296065 () Bool)

(assert (=> b!1406779 m!1296065))

(assert (=> b!1406779 m!1296065))

(declare-fun m!1296067 () Bool)

(assert (=> b!1406779 m!1296067))

(assert (=> b!1406779 m!1296067))

(assert (=> b!1406779 m!1296065))

(declare-fun m!1296069 () Bool)

(assert (=> b!1406779 m!1296069))

(declare-fun m!1296071 () Bool)

(assert (=> start!120902 m!1296071))

(declare-fun m!1296073 () Bool)

(assert (=> start!120902 m!1296073))

(assert (=> b!1406780 m!1296053))

(declare-fun m!1296075 () Bool)

(assert (=> b!1406780 m!1296075))

(assert (=> b!1406780 m!1296053))

(declare-fun m!1296077 () Bool)

(assert (=> b!1406780 m!1296077))

(assert (=> b!1406780 m!1296075))

(assert (=> b!1406780 m!1296053))

(declare-fun m!1296079 () Bool)

(assert (=> b!1406780 m!1296079))

(declare-fun m!1296081 () Bool)

(assert (=> b!1406780 m!1296081))

(check-sat (not b!1406778) (not b!1406774) (not b!1406781) (not start!120902) (not b!1406775) (not b!1406776) (not b!1406779) (not b!1406780))
(check-sat)
(get-model)

(declare-fun b!1406821 () Bool)

(declare-fun e!796227 () SeekEntryResult!10763)

(declare-fun e!796229 () SeekEntryResult!10763)

(assert (=> b!1406821 (= e!796227 e!796229)))

(declare-fun lt!619517 () (_ BitVec 64))

(declare-fun lt!619516 () SeekEntryResult!10763)

(assert (=> b!1406821 (= lt!619517 (select (arr!46452 a!2901) (index!45431 lt!619516)))))

(declare-fun c!130362 () Bool)

(assert (=> b!1406821 (= c!130362 (= lt!619517 (select (arr!46452 a!2901) j!112)))))

(declare-fun d!151435 () Bool)

(declare-fun lt!619518 () SeekEntryResult!10763)

(assert (=> d!151435 (and (or ((_ is Undefined!10763) lt!619518) (not ((_ is Found!10763) lt!619518)) (and (bvsge (index!45430 lt!619518) #b00000000000000000000000000000000) (bvslt (index!45430 lt!619518) (size!47002 a!2901)))) (or ((_ is Undefined!10763) lt!619518) ((_ is Found!10763) lt!619518) (not ((_ is MissingZero!10763) lt!619518)) (and (bvsge (index!45429 lt!619518) #b00000000000000000000000000000000) (bvslt (index!45429 lt!619518) (size!47002 a!2901)))) (or ((_ is Undefined!10763) lt!619518) ((_ is Found!10763) lt!619518) ((_ is MissingZero!10763) lt!619518) (not ((_ is MissingVacant!10763) lt!619518)) (and (bvsge (index!45432 lt!619518) #b00000000000000000000000000000000) (bvslt (index!45432 lt!619518) (size!47002 a!2901)))) (or ((_ is Undefined!10763) lt!619518) (ite ((_ is Found!10763) lt!619518) (= (select (arr!46452 a!2901) (index!45430 lt!619518)) (select (arr!46452 a!2901) j!112)) (ite ((_ is MissingZero!10763) lt!619518) (= (select (arr!46452 a!2901) (index!45429 lt!619518)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10763) lt!619518) (= (select (arr!46452 a!2901) (index!45432 lt!619518)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!151435 (= lt!619518 e!796227)))

(declare-fun c!130360 () Bool)

(assert (=> d!151435 (= c!130360 (and ((_ is Intermediate!10763) lt!619516) (undefined!11575 lt!619516)))))

(assert (=> d!151435 (= lt!619516 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46452 a!2901) j!112) mask!2840) (select (arr!46452 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151435 (validMask!0 mask!2840)))

(assert (=> d!151435 (= (seekEntryOrOpen!0 (select (arr!46452 a!2901) j!112) a!2901 mask!2840) lt!619518)))

(declare-fun b!1406822 () Bool)

(declare-fun e!796228 () SeekEntryResult!10763)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96209 (_ BitVec 32)) SeekEntryResult!10763)

(assert (=> b!1406822 (= e!796228 (seekKeyOrZeroReturnVacant!0 (x!127026 lt!619516) (index!45431 lt!619516) (index!45431 lt!619516) (select (arr!46452 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406823 () Bool)

(assert (=> b!1406823 (= e!796228 (MissingZero!10763 (index!45431 lt!619516)))))

(declare-fun b!1406824 () Bool)

(assert (=> b!1406824 (= e!796229 (Found!10763 (index!45431 lt!619516)))))

(declare-fun b!1406825 () Bool)

(declare-fun c!130361 () Bool)

(assert (=> b!1406825 (= c!130361 (= lt!619517 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1406825 (= e!796229 e!796228)))

(declare-fun b!1406826 () Bool)

(assert (=> b!1406826 (= e!796227 Undefined!10763)))

(assert (= (and d!151435 c!130360) b!1406826))

(assert (= (and d!151435 (not c!130360)) b!1406821))

(assert (= (and b!1406821 c!130362) b!1406824))

(assert (= (and b!1406821 (not c!130362)) b!1406825))

(assert (= (and b!1406825 c!130361) b!1406823))

(assert (= (and b!1406825 (not c!130361)) b!1406822))

(declare-fun m!1296117 () Bool)

(assert (=> b!1406821 m!1296117))

(declare-fun m!1296119 () Bool)

(assert (=> d!151435 m!1296119))

(assert (=> d!151435 m!1296075))

(assert (=> d!151435 m!1296053))

(assert (=> d!151435 m!1296079))

(assert (=> d!151435 m!1296053))

(assert (=> d!151435 m!1296075))

(declare-fun m!1296121 () Bool)

(assert (=> d!151435 m!1296121))

(declare-fun m!1296123 () Bool)

(assert (=> d!151435 m!1296123))

(assert (=> d!151435 m!1296071))

(assert (=> b!1406822 m!1296053))

(declare-fun m!1296125 () Bool)

(assert (=> b!1406822 m!1296125))

(assert (=> b!1406776 d!151435))

(declare-fun b!1406835 () Bool)

(declare-fun e!796237 () Bool)

(declare-fun e!796238 () Bool)

(assert (=> b!1406835 (= e!796237 e!796238)))

(declare-fun lt!619527 () (_ BitVec 64))

(assert (=> b!1406835 (= lt!619527 (select (arr!46452 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!619525 () Unit!47500)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96209 (_ BitVec 64) (_ BitVec 32)) Unit!47500)

(assert (=> b!1406835 (= lt!619525 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!619527 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96209 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1406835 (arrayContainsKey!0 a!2901 lt!619527 #b00000000000000000000000000000000)))

(declare-fun lt!619526 () Unit!47500)

(assert (=> b!1406835 (= lt!619526 lt!619525)))

(declare-fun res!945030 () Bool)

(assert (=> b!1406835 (= res!945030 (= (seekEntryOrOpen!0 (select (arr!46452 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10763 #b00000000000000000000000000000000)))))

(assert (=> b!1406835 (=> (not res!945030) (not e!796238))))

(declare-fun bm!66949 () Bool)

(declare-fun call!66952 () Bool)

(assert (=> bm!66949 (= call!66952 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1406836 () Bool)

(assert (=> b!1406836 (= e!796237 call!66952)))

(declare-fun b!1406837 () Bool)

(assert (=> b!1406837 (= e!796238 call!66952)))

(declare-fun b!1406838 () Bool)

(declare-fun e!796236 () Bool)

(assert (=> b!1406838 (= e!796236 e!796237)))

(declare-fun c!130365 () Bool)

(assert (=> b!1406838 (= c!130365 (validKeyInArray!0 (select (arr!46452 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!151437 () Bool)

(declare-fun res!945031 () Bool)

(assert (=> d!151437 (=> res!945031 e!796236)))

(assert (=> d!151437 (= res!945031 (bvsge #b00000000000000000000000000000000 (size!47002 a!2901)))))

(assert (=> d!151437 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!796236)))

(assert (= (and d!151437 (not res!945031)) b!1406838))

(assert (= (and b!1406838 c!130365) b!1406835))

(assert (= (and b!1406838 (not c!130365)) b!1406836))

(assert (= (and b!1406835 res!945030) b!1406837))

(assert (= (or b!1406837 b!1406836) bm!66949))

(declare-fun m!1296127 () Bool)

(assert (=> b!1406835 m!1296127))

(declare-fun m!1296129 () Bool)

(assert (=> b!1406835 m!1296129))

(declare-fun m!1296131 () Bool)

(assert (=> b!1406835 m!1296131))

(assert (=> b!1406835 m!1296127))

(declare-fun m!1296133 () Bool)

(assert (=> b!1406835 m!1296133))

(declare-fun m!1296135 () Bool)

(assert (=> bm!66949 m!1296135))

(assert (=> b!1406838 m!1296127))

(assert (=> b!1406838 m!1296127))

(declare-fun m!1296137 () Bool)

(assert (=> b!1406838 m!1296137))

(assert (=> b!1406775 d!151437))

(declare-fun b!1406839 () Bool)

(declare-fun e!796240 () Bool)

(declare-fun e!796241 () Bool)

(assert (=> b!1406839 (= e!796240 e!796241)))

(declare-fun lt!619530 () (_ BitVec 64))

(assert (=> b!1406839 (= lt!619530 (select (arr!46452 a!2901) j!112))))

(declare-fun lt!619528 () Unit!47500)

(assert (=> b!1406839 (= lt!619528 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!619530 j!112))))

(assert (=> b!1406839 (arrayContainsKey!0 a!2901 lt!619530 #b00000000000000000000000000000000)))

(declare-fun lt!619529 () Unit!47500)

(assert (=> b!1406839 (= lt!619529 lt!619528)))

(declare-fun res!945032 () Bool)

(assert (=> b!1406839 (= res!945032 (= (seekEntryOrOpen!0 (select (arr!46452 a!2901) j!112) a!2901 mask!2840) (Found!10763 j!112)))))

(assert (=> b!1406839 (=> (not res!945032) (not e!796241))))

(declare-fun call!66953 () Bool)

(declare-fun bm!66950 () Bool)

(assert (=> bm!66950 (= call!66953 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1406840 () Bool)

(assert (=> b!1406840 (= e!796240 call!66953)))

(declare-fun b!1406841 () Bool)

(assert (=> b!1406841 (= e!796241 call!66953)))

(declare-fun b!1406842 () Bool)

(declare-fun e!796239 () Bool)

(assert (=> b!1406842 (= e!796239 e!796240)))

(declare-fun c!130366 () Bool)

(assert (=> b!1406842 (= c!130366 (validKeyInArray!0 (select (arr!46452 a!2901) j!112)))))

(declare-fun d!151445 () Bool)

(declare-fun res!945033 () Bool)

(assert (=> d!151445 (=> res!945033 e!796239)))

(assert (=> d!151445 (= res!945033 (bvsge j!112 (size!47002 a!2901)))))

(assert (=> d!151445 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!796239)))

(assert (= (and d!151445 (not res!945033)) b!1406842))

(assert (= (and b!1406842 c!130366) b!1406839))

(assert (= (and b!1406842 (not c!130366)) b!1406840))

(assert (= (and b!1406839 res!945032) b!1406841))

(assert (= (or b!1406841 b!1406840) bm!66950))

(assert (=> b!1406839 m!1296053))

(declare-fun m!1296139 () Bool)

(assert (=> b!1406839 m!1296139))

(declare-fun m!1296141 () Bool)

(assert (=> b!1406839 m!1296141))

(assert (=> b!1406839 m!1296053))

(assert (=> b!1406839 m!1296061))

(declare-fun m!1296143 () Bool)

(assert (=> bm!66950 m!1296143))

(assert (=> b!1406842 m!1296053))

(assert (=> b!1406842 m!1296053))

(assert (=> b!1406842 m!1296055))

(assert (=> b!1406780 d!151445))

(declare-fun d!151447 () Bool)

(assert (=> d!151447 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!619533 () Unit!47500)

(declare-fun choose!38 (array!96209 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47500)

(assert (=> d!151447 (= lt!619533 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151447 (validMask!0 mask!2840)))

(assert (=> d!151447 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!619533)))

(declare-fun bs!41009 () Bool)

(assert (= bs!41009 d!151447))

(assert (=> bs!41009 m!1296081))

(declare-fun m!1296145 () Bool)

(assert (=> bs!41009 m!1296145))

(assert (=> bs!41009 m!1296071))

(assert (=> b!1406780 d!151447))

(declare-fun b!1406922 () Bool)

(declare-fun e!796289 () SeekEntryResult!10763)

(assert (=> b!1406922 (= e!796289 (Intermediate!10763 false (toIndex!0 (select (arr!46452 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1406923 () Bool)

(declare-fun e!796292 () Bool)

(declare-fun lt!619569 () SeekEntryResult!10763)

(assert (=> b!1406923 (= e!796292 (bvsge (x!127026 lt!619569) #b01111111111111111111111111111110))))

(declare-fun b!1406924 () Bool)

(assert (=> b!1406924 (and (bvsge (index!45431 lt!619569) #b00000000000000000000000000000000) (bvslt (index!45431 lt!619569) (size!47002 a!2901)))))

(declare-fun res!945066 () Bool)

(assert (=> b!1406924 (= res!945066 (= (select (arr!46452 a!2901) (index!45431 lt!619569)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!796293 () Bool)

(assert (=> b!1406924 (=> res!945066 e!796293)))

(declare-fun b!1406925 () Bool)

(assert (=> b!1406925 (and (bvsge (index!45431 lt!619569) #b00000000000000000000000000000000) (bvslt (index!45431 lt!619569) (size!47002 a!2901)))))

(declare-fun res!945064 () Bool)

(assert (=> b!1406925 (= res!945064 (= (select (arr!46452 a!2901) (index!45431 lt!619569)) (select (arr!46452 a!2901) j!112)))))

(assert (=> b!1406925 (=> res!945064 e!796293)))

(declare-fun e!796291 () Bool)

(assert (=> b!1406925 (= e!796291 e!796293)))

(declare-fun b!1406926 () Bool)

(declare-fun e!796290 () SeekEntryResult!10763)

(assert (=> b!1406926 (= e!796290 e!796289)))

(declare-fun c!130392 () Bool)

(declare-fun lt!619570 () (_ BitVec 64))

(assert (=> b!1406926 (= c!130392 (or (= lt!619570 (select (arr!46452 a!2901) j!112)) (= (bvadd lt!619570 lt!619570) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1406927 () Bool)

(assert (=> b!1406927 (= e!796292 e!796291)))

(declare-fun res!945065 () Bool)

(assert (=> b!1406927 (= res!945065 (and ((_ is Intermediate!10763) lt!619569) (not (undefined!11575 lt!619569)) (bvslt (x!127026 lt!619569) #b01111111111111111111111111111110) (bvsge (x!127026 lt!619569) #b00000000000000000000000000000000) (bvsge (x!127026 lt!619569) #b00000000000000000000000000000000)))))

(assert (=> b!1406927 (=> (not res!945065) (not e!796291))))

(declare-fun b!1406928 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406928 (= e!796289 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46452 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!46452 a!2901) j!112) a!2901 mask!2840))))

(declare-fun d!151449 () Bool)

(assert (=> d!151449 e!796292))

(declare-fun c!130393 () Bool)

(assert (=> d!151449 (= c!130393 (and ((_ is Intermediate!10763) lt!619569) (undefined!11575 lt!619569)))))

(assert (=> d!151449 (= lt!619569 e!796290)))

(declare-fun c!130394 () Bool)

(assert (=> d!151449 (= c!130394 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!151449 (= lt!619570 (select (arr!46452 a!2901) (toIndex!0 (select (arr!46452 a!2901) j!112) mask!2840)))))

(assert (=> d!151449 (validMask!0 mask!2840)))

(assert (=> d!151449 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46452 a!2901) j!112) mask!2840) (select (arr!46452 a!2901) j!112) a!2901 mask!2840) lt!619569)))

(declare-fun b!1406929 () Bool)

(assert (=> b!1406929 (= e!796290 (Intermediate!10763 true (toIndex!0 (select (arr!46452 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1406930 () Bool)

(assert (=> b!1406930 (and (bvsge (index!45431 lt!619569) #b00000000000000000000000000000000) (bvslt (index!45431 lt!619569) (size!47002 a!2901)))))

(assert (=> b!1406930 (= e!796293 (= (select (arr!46452 a!2901) (index!45431 lt!619569)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!151449 c!130394) b!1406929))

(assert (= (and d!151449 (not c!130394)) b!1406926))

(assert (= (and b!1406926 c!130392) b!1406922))

(assert (= (and b!1406926 (not c!130392)) b!1406928))

(assert (= (and d!151449 c!130393) b!1406923))

(assert (= (and d!151449 (not c!130393)) b!1406927))

(assert (= (and b!1406927 res!945065) b!1406925))

(assert (= (and b!1406925 (not res!945064)) b!1406924))

(assert (= (and b!1406924 (not res!945066)) b!1406930))

(declare-fun m!1296175 () Bool)

(assert (=> b!1406930 m!1296175))

(assert (=> d!151449 m!1296075))

(declare-fun m!1296177 () Bool)

(assert (=> d!151449 m!1296177))

(assert (=> d!151449 m!1296071))

(assert (=> b!1406928 m!1296075))

(declare-fun m!1296179 () Bool)

(assert (=> b!1406928 m!1296179))

(assert (=> b!1406928 m!1296179))

(assert (=> b!1406928 m!1296053))

(declare-fun m!1296181 () Bool)

(assert (=> b!1406928 m!1296181))

(assert (=> b!1406925 m!1296175))

(assert (=> b!1406924 m!1296175))

(assert (=> b!1406780 d!151449))

(declare-fun d!151467 () Bool)

(declare-fun lt!619584 () (_ BitVec 32))

(declare-fun lt!619583 () (_ BitVec 32))

(assert (=> d!151467 (= lt!619584 (bvmul (bvxor lt!619583 (bvlshr lt!619583 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151467 (= lt!619583 ((_ extract 31 0) (bvand (bvxor (select (arr!46452 a!2901) j!112) (bvlshr (select (arr!46452 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151467 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!945073 (let ((h!34224 ((_ extract 31 0) (bvand (bvxor (select (arr!46452 a!2901) j!112) (bvlshr (select (arr!46452 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127032 (bvmul (bvxor h!34224 (bvlshr h!34224 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127032 (bvlshr x!127032 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!945073 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!945073 #b00000000000000000000000000000000))))))

(assert (=> d!151467 (= (toIndex!0 (select (arr!46452 a!2901) j!112) mask!2840) (bvand (bvxor lt!619584 (bvlshr lt!619584 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1406780 d!151467))

(declare-fun d!151475 () Bool)

(assert (=> d!151475 (= (validKeyInArray!0 (select (arr!46452 a!2901) j!112)) (and (not (= (select (arr!46452 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46452 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1406781 d!151475))

(declare-fun b!1406955 () Bool)

(declare-fun e!796311 () SeekEntryResult!10763)

(assert (=> b!1406955 (= e!796311 (Intermediate!10763 false (toIndex!0 (select (store (arr!46452 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1406956 () Bool)

(declare-fun e!796314 () Bool)

(declare-fun lt!619585 () SeekEntryResult!10763)

(assert (=> b!1406956 (= e!796314 (bvsge (x!127026 lt!619585) #b01111111111111111111111111111110))))

(declare-fun b!1406957 () Bool)

(assert (=> b!1406957 (and (bvsge (index!45431 lt!619585) #b00000000000000000000000000000000) (bvslt (index!45431 lt!619585) (size!47002 (array!96210 (store (arr!46452 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47002 a!2901)))))))

(declare-fun res!945083 () Bool)

(assert (=> b!1406957 (= res!945083 (= (select (arr!46452 (array!96210 (store (arr!46452 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47002 a!2901))) (index!45431 lt!619585)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!796315 () Bool)

(assert (=> b!1406957 (=> res!945083 e!796315)))

(declare-fun b!1406958 () Bool)

(assert (=> b!1406958 (and (bvsge (index!45431 lt!619585) #b00000000000000000000000000000000) (bvslt (index!45431 lt!619585) (size!47002 (array!96210 (store (arr!46452 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47002 a!2901)))))))

(declare-fun res!945081 () Bool)

(assert (=> b!1406958 (= res!945081 (= (select (arr!46452 (array!96210 (store (arr!46452 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47002 a!2901))) (index!45431 lt!619585)) (select (store (arr!46452 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(assert (=> b!1406958 (=> res!945081 e!796315)))

(declare-fun e!796313 () Bool)

(assert (=> b!1406958 (= e!796313 e!796315)))

(declare-fun b!1406959 () Bool)

(declare-fun e!796312 () SeekEntryResult!10763)

(assert (=> b!1406959 (= e!796312 e!796311)))

(declare-fun c!130401 () Bool)

(declare-fun lt!619586 () (_ BitVec 64))

(assert (=> b!1406959 (= c!130401 (or (= lt!619586 (select (store (arr!46452 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!619586 lt!619586) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1406960 () Bool)

(assert (=> b!1406960 (= e!796314 e!796313)))

(declare-fun res!945082 () Bool)

(assert (=> b!1406960 (= res!945082 (and ((_ is Intermediate!10763) lt!619585) (not (undefined!11575 lt!619585)) (bvslt (x!127026 lt!619585) #b01111111111111111111111111111110) (bvsge (x!127026 lt!619585) #b00000000000000000000000000000000) (bvsge (x!127026 lt!619585) #b00000000000000000000000000000000)))))

(assert (=> b!1406960 (=> (not res!945082) (not e!796313))))

(declare-fun b!1406961 () Bool)

(assert (=> b!1406961 (= e!796311 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46452 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (store (arr!46452 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96210 (store (arr!46452 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47002 a!2901)) mask!2840))))

(declare-fun d!151477 () Bool)

(assert (=> d!151477 e!796314))

(declare-fun c!130402 () Bool)

(assert (=> d!151477 (= c!130402 (and ((_ is Intermediate!10763) lt!619585) (undefined!11575 lt!619585)))))

(assert (=> d!151477 (= lt!619585 e!796312)))

(declare-fun c!130403 () Bool)

(assert (=> d!151477 (= c!130403 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!151477 (= lt!619586 (select (arr!46452 (array!96210 (store (arr!46452 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47002 a!2901))) (toIndex!0 (select (store (arr!46452 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!151477 (validMask!0 mask!2840)))

(assert (=> d!151477 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46452 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46452 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96210 (store (arr!46452 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47002 a!2901)) mask!2840) lt!619585)))

(declare-fun b!1406962 () Bool)

(assert (=> b!1406962 (= e!796312 (Intermediate!10763 true (toIndex!0 (select (store (arr!46452 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1406963 () Bool)

(assert (=> b!1406963 (and (bvsge (index!45431 lt!619585) #b00000000000000000000000000000000) (bvslt (index!45431 lt!619585) (size!47002 (array!96210 (store (arr!46452 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47002 a!2901)))))))

(assert (=> b!1406963 (= e!796315 (= (select (arr!46452 (array!96210 (store (arr!46452 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47002 a!2901))) (index!45431 lt!619585)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!151477 c!130403) b!1406962))

(assert (= (and d!151477 (not c!130403)) b!1406959))

(assert (= (and b!1406959 c!130401) b!1406955))

(assert (= (and b!1406959 (not c!130401)) b!1406961))

(assert (= (and d!151477 c!130402) b!1406956))

(assert (= (and d!151477 (not c!130402)) b!1406960))

(assert (= (and b!1406960 res!945082) b!1406958))

(assert (= (and b!1406958 (not res!945081)) b!1406957))

(assert (= (and b!1406957 (not res!945083)) b!1406963))

(declare-fun m!1296199 () Bool)

(assert (=> b!1406963 m!1296199))

(assert (=> d!151477 m!1296067))

(declare-fun m!1296201 () Bool)

(assert (=> d!151477 m!1296201))

(assert (=> d!151477 m!1296071))

(assert (=> b!1406961 m!1296067))

(declare-fun m!1296203 () Bool)

(assert (=> b!1406961 m!1296203))

(assert (=> b!1406961 m!1296203))

(assert (=> b!1406961 m!1296065))

(declare-fun m!1296205 () Bool)

(assert (=> b!1406961 m!1296205))

(assert (=> b!1406958 m!1296199))

(assert (=> b!1406957 m!1296199))

(assert (=> b!1406779 d!151477))

(declare-fun d!151479 () Bool)

(declare-fun lt!619588 () (_ BitVec 32))

(declare-fun lt!619587 () (_ BitVec 32))

(assert (=> d!151479 (= lt!619588 (bvmul (bvxor lt!619587 (bvlshr lt!619587 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151479 (= lt!619587 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46452 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46452 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151479 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!945073 (let ((h!34224 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46452 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46452 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127032 (bvmul (bvxor h!34224 (bvlshr h!34224 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127032 (bvlshr x!127032 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!945073 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!945073 #b00000000000000000000000000000000))))))

(assert (=> d!151479 (= (toIndex!0 (select (store (arr!46452 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!619588 (bvlshr lt!619588 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1406779 d!151479))

(declare-fun d!151481 () Bool)

(declare-fun res!945098 () Bool)

(declare-fun e!796333 () Bool)

(assert (=> d!151481 (=> res!945098 e!796333)))

(assert (=> d!151481 (= res!945098 (bvsge #b00000000000000000000000000000000 (size!47002 a!2901)))))

(assert (=> d!151481 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32968) e!796333)))

(declare-fun b!1406986 () Bool)

(declare-fun e!796336 () Bool)

(declare-fun call!66966 () Bool)

(assert (=> b!1406986 (= e!796336 call!66966)))

(declare-fun b!1406987 () Bool)

(declare-fun e!796334 () Bool)

(assert (=> b!1406987 (= e!796334 e!796336)))

(declare-fun c!130409 () Bool)

(assert (=> b!1406987 (= c!130409 (validKeyInArray!0 (select (arr!46452 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1406988 () Bool)

(assert (=> b!1406988 (= e!796336 call!66966)))

(declare-fun b!1406989 () Bool)

(declare-fun e!796335 () Bool)

(declare-fun contains!9795 (List!32971 (_ BitVec 64)) Bool)

(assert (=> b!1406989 (= e!796335 (contains!9795 Nil!32968 (select (arr!46452 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66963 () Bool)

(assert (=> bm!66963 (= call!66966 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130409 (Cons!32967 (select (arr!46452 a!2901) #b00000000000000000000000000000000) Nil!32968) Nil!32968)))))

(declare-fun b!1406990 () Bool)

(assert (=> b!1406990 (= e!796333 e!796334)))

(declare-fun res!945096 () Bool)

(assert (=> b!1406990 (=> (not res!945096) (not e!796334))))

(assert (=> b!1406990 (= res!945096 (not e!796335))))

(declare-fun res!945097 () Bool)

(assert (=> b!1406990 (=> (not res!945097) (not e!796335))))

(assert (=> b!1406990 (= res!945097 (validKeyInArray!0 (select (arr!46452 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!151481 (not res!945098)) b!1406990))

(assert (= (and b!1406990 res!945097) b!1406989))

(assert (= (and b!1406990 res!945096) b!1406987))

(assert (= (and b!1406987 c!130409) b!1406986))

(assert (= (and b!1406987 (not c!130409)) b!1406988))

(assert (= (or b!1406986 b!1406988) bm!66963))

(assert (=> b!1406987 m!1296127))

(assert (=> b!1406987 m!1296127))

(assert (=> b!1406987 m!1296137))

(assert (=> b!1406989 m!1296127))

(assert (=> b!1406989 m!1296127))

(declare-fun m!1296213 () Bool)

(assert (=> b!1406989 m!1296213))

(assert (=> bm!66963 m!1296127))

(declare-fun m!1296215 () Bool)

(assert (=> bm!66963 m!1296215))

(assert (=> b!1406990 m!1296127))

(assert (=> b!1406990 m!1296127))

(assert (=> b!1406990 m!1296137))

(assert (=> b!1406774 d!151481))

(declare-fun d!151485 () Bool)

(assert (=> d!151485 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!120902 d!151485))

(declare-fun d!151503 () Bool)

(assert (=> d!151503 (= (array_inv!35480 a!2901) (bvsge (size!47002 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!120902 d!151503))

(declare-fun d!151505 () Bool)

(assert (=> d!151505 (= (validKeyInArray!0 (select (arr!46452 a!2901) i!1037)) (and (not (= (select (arr!46452 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46452 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1406778 d!151505))

(check-sat (not bm!66950) (not b!1406987) (not b!1406961) (not b!1406989) (not d!151447) (not b!1406928) (not d!151449) (not b!1406990) (not d!151435) (not b!1406839) (not b!1406842) (not bm!66949) (not d!151477) (not b!1406822) (not bm!66963) (not b!1406835) (not b!1406838))
(check-sat)
