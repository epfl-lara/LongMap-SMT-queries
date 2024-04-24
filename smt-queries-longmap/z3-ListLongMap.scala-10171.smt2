; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120086 () Bool)

(assert start!120086)

(declare-fun b!1397204 () Bool)

(declare-fun res!935603 () Bool)

(declare-fun e!791092 () Bool)

(assert (=> b!1397204 (=> (not res!935603) (not e!791092))))

(declare-datatypes ((array!95588 0))(
  ( (array!95589 (arr!46147 (Array (_ BitVec 32) (_ BitVec 64))) (size!46698 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95588)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397204 (= res!935603 (validKeyInArray!0 (select (arr!46147 a!2901) i!1037)))))

(declare-fun b!1397205 () Bool)

(declare-fun e!791093 () Bool)

(assert (=> b!1397205 (= e!791092 (not e!791093))))

(declare-fun res!935602 () Bool)

(assert (=> b!1397205 (=> res!935602 e!791093)))

(declare-datatypes ((SeekEntryResult!10367 0))(
  ( (MissingZero!10367 (index!43839 (_ BitVec 32))) (Found!10367 (index!43840 (_ BitVec 32))) (Intermediate!10367 (undefined!11179 Bool) (index!43841 (_ BitVec 32)) (x!125658 (_ BitVec 32))) (Undefined!10367) (MissingVacant!10367 (index!43842 (_ BitVec 32))) )
))
(declare-fun lt!613633 () SeekEntryResult!10367)

(get-info :version)

(assert (=> b!1397205 (= res!935602 (or (not ((_ is Intermediate!10367) lt!613633)) (undefined!11179 lt!613633)))))

(declare-fun e!791090 () Bool)

(assert (=> b!1397205 e!791090))

(declare-fun res!935604 () Bool)

(assert (=> b!1397205 (=> (not res!935604) (not e!791090))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95588 (_ BitVec 32)) Bool)

(assert (=> b!1397205 (= res!935604 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46765 0))(
  ( (Unit!46766) )
))
(declare-fun lt!613634 () Unit!46765)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95588 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46765)

(assert (=> b!1397205 (= lt!613634 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95588 (_ BitVec 32)) SeekEntryResult!10367)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397205 (= lt!613633 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46147 a!2901) j!112) mask!2840) (select (arr!46147 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1397206 () Bool)

(declare-fun res!935605 () Bool)

(assert (=> b!1397206 (=> (not res!935605) (not e!791092))))

(assert (=> b!1397206 (= res!935605 (and (= (size!46698 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46698 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46698 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397207 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95588 (_ BitVec 32)) SeekEntryResult!10367)

(assert (=> b!1397207 (= e!791090 (= (seekEntryOrOpen!0 (select (arr!46147 a!2901) j!112) a!2901 mask!2840) (Found!10367 j!112)))))

(declare-fun res!935598 () Bool)

(assert (=> start!120086 (=> (not res!935598) (not e!791092))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120086 (= res!935598 (validMask!0 mask!2840))))

(assert (=> start!120086 e!791092))

(assert (=> start!120086 true))

(declare-fun array_inv!35428 (array!95588) Bool)

(assert (=> start!120086 (array_inv!35428 a!2901)))

(declare-fun b!1397208 () Bool)

(declare-fun res!935601 () Bool)

(assert (=> b!1397208 (=> (not res!935601) (not e!791092))))

(assert (=> b!1397208 (= res!935601 (validKeyInArray!0 (select (arr!46147 a!2901) j!112)))))

(declare-fun b!1397209 () Bool)

(declare-fun res!935600 () Bool)

(assert (=> b!1397209 (=> (not res!935600) (not e!791092))))

(assert (=> b!1397209 (= res!935600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397210 () Bool)

(declare-fun res!935599 () Bool)

(assert (=> b!1397210 (=> (not res!935599) (not e!791092))))

(declare-datatypes ((List!32653 0))(
  ( (Nil!32650) (Cons!32649 (h!33896 (_ BitVec 64)) (t!47339 List!32653)) )
))
(declare-fun arrayNoDuplicates!0 (array!95588 (_ BitVec 32) List!32653) Bool)

(assert (=> b!1397210 (= res!935599 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32650))))

(declare-fun b!1397211 () Bool)

(declare-fun lt!613632 () SeekEntryResult!10367)

(assert (=> b!1397211 (= e!791093 (or (= lt!613633 lt!613632) (not ((_ is Intermediate!10367) lt!613632)) (bvslt mask!2840 #b00000000000000000000000000000000) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> b!1397211 (= lt!613632 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46147 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46147 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95589 (store (arr!46147 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46698 a!2901)) mask!2840))))

(assert (= (and start!120086 res!935598) b!1397206))

(assert (= (and b!1397206 res!935605) b!1397204))

(assert (= (and b!1397204 res!935603) b!1397208))

(assert (= (and b!1397208 res!935601) b!1397209))

(assert (= (and b!1397209 res!935600) b!1397210))

(assert (= (and b!1397210 res!935599) b!1397205))

(assert (= (and b!1397205 res!935604) b!1397207))

(assert (= (and b!1397205 (not res!935602)) b!1397211))

(declare-fun m!1283935 () Bool)

(assert (=> b!1397209 m!1283935))

(declare-fun m!1283937 () Bool)

(assert (=> start!120086 m!1283937))

(declare-fun m!1283939 () Bool)

(assert (=> start!120086 m!1283939))

(declare-fun m!1283941 () Bool)

(assert (=> b!1397208 m!1283941))

(assert (=> b!1397208 m!1283941))

(declare-fun m!1283943 () Bool)

(assert (=> b!1397208 m!1283943))

(assert (=> b!1397207 m!1283941))

(assert (=> b!1397207 m!1283941))

(declare-fun m!1283945 () Bool)

(assert (=> b!1397207 m!1283945))

(assert (=> b!1397205 m!1283941))

(declare-fun m!1283947 () Bool)

(assert (=> b!1397205 m!1283947))

(assert (=> b!1397205 m!1283941))

(declare-fun m!1283949 () Bool)

(assert (=> b!1397205 m!1283949))

(assert (=> b!1397205 m!1283947))

(assert (=> b!1397205 m!1283941))

(declare-fun m!1283951 () Bool)

(assert (=> b!1397205 m!1283951))

(declare-fun m!1283953 () Bool)

(assert (=> b!1397205 m!1283953))

(declare-fun m!1283955 () Bool)

(assert (=> b!1397204 m!1283955))

(assert (=> b!1397204 m!1283955))

(declare-fun m!1283957 () Bool)

(assert (=> b!1397204 m!1283957))

(declare-fun m!1283959 () Bool)

(assert (=> b!1397210 m!1283959))

(declare-fun m!1283961 () Bool)

(assert (=> b!1397211 m!1283961))

(declare-fun m!1283963 () Bool)

(assert (=> b!1397211 m!1283963))

(assert (=> b!1397211 m!1283963))

(declare-fun m!1283965 () Bool)

(assert (=> b!1397211 m!1283965))

(assert (=> b!1397211 m!1283965))

(assert (=> b!1397211 m!1283963))

(declare-fun m!1283967 () Bool)

(assert (=> b!1397211 m!1283967))

(check-sat (not b!1397207) (not b!1397205) (not b!1397210) (not b!1397211) (not b!1397204) (not start!120086) (not b!1397209) (not b!1397208))
(check-sat)
(get-model)

(declare-fun d!151151 () Bool)

(assert (=> d!151151 (= (validKeyInArray!0 (select (arr!46147 a!2901) j!112)) (and (not (= (select (arr!46147 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46147 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1397208 d!151151))

(declare-fun d!151153 () Bool)

(assert (=> d!151153 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!120086 d!151153))

(declare-fun d!151155 () Bool)

(assert (=> d!151155 (= (array_inv!35428 a!2901) (bvsge (size!46698 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!120086 d!151155))

(declare-fun b!1397280 () Bool)

(declare-fun e!791130 () SeekEntryResult!10367)

(assert (=> b!1397280 (= e!791130 Undefined!10367)))

(declare-fun b!1397281 () Bool)

(declare-fun c!130273 () Bool)

(declare-fun lt!613665 () (_ BitVec 64))

(assert (=> b!1397281 (= c!130273 (= lt!613665 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!791131 () SeekEntryResult!10367)

(declare-fun e!791132 () SeekEntryResult!10367)

(assert (=> b!1397281 (= e!791131 e!791132)))

(declare-fun b!1397282 () Bool)

(assert (=> b!1397282 (= e!791130 e!791131)))

(declare-fun lt!613667 () SeekEntryResult!10367)

(assert (=> b!1397282 (= lt!613665 (select (arr!46147 a!2901) (index!43841 lt!613667)))))

(declare-fun c!130274 () Bool)

(assert (=> b!1397282 (= c!130274 (= lt!613665 (select (arr!46147 a!2901) j!112)))))

(declare-fun b!1397283 () Bool)

(assert (=> b!1397283 (= e!791131 (Found!10367 (index!43841 lt!613667)))))

(declare-fun b!1397284 () Bool)

(assert (=> b!1397284 (= e!791132 (MissingZero!10367 (index!43841 lt!613667)))))

(declare-fun d!151157 () Bool)

(declare-fun lt!613666 () SeekEntryResult!10367)

(assert (=> d!151157 (and (or ((_ is Undefined!10367) lt!613666) (not ((_ is Found!10367) lt!613666)) (and (bvsge (index!43840 lt!613666) #b00000000000000000000000000000000) (bvslt (index!43840 lt!613666) (size!46698 a!2901)))) (or ((_ is Undefined!10367) lt!613666) ((_ is Found!10367) lt!613666) (not ((_ is MissingZero!10367) lt!613666)) (and (bvsge (index!43839 lt!613666) #b00000000000000000000000000000000) (bvslt (index!43839 lt!613666) (size!46698 a!2901)))) (or ((_ is Undefined!10367) lt!613666) ((_ is Found!10367) lt!613666) ((_ is MissingZero!10367) lt!613666) (not ((_ is MissingVacant!10367) lt!613666)) (and (bvsge (index!43842 lt!613666) #b00000000000000000000000000000000) (bvslt (index!43842 lt!613666) (size!46698 a!2901)))) (or ((_ is Undefined!10367) lt!613666) (ite ((_ is Found!10367) lt!613666) (= (select (arr!46147 a!2901) (index!43840 lt!613666)) (select (arr!46147 a!2901) j!112)) (ite ((_ is MissingZero!10367) lt!613666) (= (select (arr!46147 a!2901) (index!43839 lt!613666)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10367) lt!613666) (= (select (arr!46147 a!2901) (index!43842 lt!613666)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!151157 (= lt!613666 e!791130)))

(declare-fun c!130275 () Bool)

(assert (=> d!151157 (= c!130275 (and ((_ is Intermediate!10367) lt!613667) (undefined!11179 lt!613667)))))

(assert (=> d!151157 (= lt!613667 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46147 a!2901) j!112) mask!2840) (select (arr!46147 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151157 (validMask!0 mask!2840)))

(assert (=> d!151157 (= (seekEntryOrOpen!0 (select (arr!46147 a!2901) j!112) a!2901 mask!2840) lt!613666)))

(declare-fun b!1397285 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95588 (_ BitVec 32)) SeekEntryResult!10367)

(assert (=> b!1397285 (= e!791132 (seekKeyOrZeroReturnVacant!0 (x!125658 lt!613667) (index!43841 lt!613667) (index!43841 lt!613667) (select (arr!46147 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and d!151157 c!130275) b!1397280))

(assert (= (and d!151157 (not c!130275)) b!1397282))

(assert (= (and b!1397282 c!130274) b!1397283))

(assert (= (and b!1397282 (not c!130274)) b!1397281))

(assert (= (and b!1397281 c!130273) b!1397284))

(assert (= (and b!1397281 (not c!130273)) b!1397285))

(declare-fun m!1284037 () Bool)

(assert (=> b!1397282 m!1284037))

(assert (=> d!151157 m!1283937))

(assert (=> d!151157 m!1283941))

(assert (=> d!151157 m!1283947))

(assert (=> d!151157 m!1283947))

(assert (=> d!151157 m!1283941))

(assert (=> d!151157 m!1283951))

(declare-fun m!1284043 () Bool)

(assert (=> d!151157 m!1284043))

(declare-fun m!1284047 () Bool)

(assert (=> d!151157 m!1284047))

(declare-fun m!1284051 () Bool)

(assert (=> d!151157 m!1284051))

(assert (=> b!1397285 m!1283941))

(declare-fun m!1284054 () Bool)

(assert (=> b!1397285 m!1284054))

(assert (=> b!1397207 d!151157))

(declare-fun b!1397310 () Bool)

(declare-fun e!791149 () Bool)

(declare-fun e!791150 () Bool)

(assert (=> b!1397310 (= e!791149 e!791150)))

(declare-fun lt!613683 () (_ BitVec 64))

(assert (=> b!1397310 (= lt!613683 (select (arr!46147 a!2901) j!112))))

(declare-fun lt!613684 () Unit!46765)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95588 (_ BitVec 64) (_ BitVec 32)) Unit!46765)

(assert (=> b!1397310 (= lt!613684 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!613683 j!112))))

(declare-fun arrayContainsKey!0 (array!95588 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1397310 (arrayContainsKey!0 a!2901 lt!613683 #b00000000000000000000000000000000)))

(declare-fun lt!613685 () Unit!46765)

(assert (=> b!1397310 (= lt!613685 lt!613684)))

(declare-fun res!935665 () Bool)

(assert (=> b!1397310 (= res!935665 (= (seekEntryOrOpen!0 (select (arr!46147 a!2901) j!112) a!2901 mask!2840) (Found!10367 j!112)))))

(assert (=> b!1397310 (=> (not res!935665) (not e!791150))))

(declare-fun b!1397311 () Bool)

(declare-fun call!66909 () Bool)

(assert (=> b!1397311 (= e!791150 call!66909)))

(declare-fun b!1397312 () Bool)

(assert (=> b!1397312 (= e!791149 call!66909)))

(declare-fun b!1397313 () Bool)

(declare-fun e!791148 () Bool)

(assert (=> b!1397313 (= e!791148 e!791149)))

(declare-fun c!130285 () Bool)

(assert (=> b!1397313 (= c!130285 (validKeyInArray!0 (select (arr!46147 a!2901) j!112)))))

(declare-fun bm!66906 () Bool)

(assert (=> bm!66906 (= call!66909 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!151165 () Bool)

(declare-fun res!935664 () Bool)

(assert (=> d!151165 (=> res!935664 e!791148)))

(assert (=> d!151165 (= res!935664 (bvsge j!112 (size!46698 a!2901)))))

(assert (=> d!151165 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!791148)))

(assert (= (and d!151165 (not res!935664)) b!1397313))

(assert (= (and b!1397313 c!130285) b!1397310))

(assert (= (and b!1397313 (not c!130285)) b!1397312))

(assert (= (and b!1397310 res!935665) b!1397311))

(assert (= (or b!1397311 b!1397312) bm!66906))

(assert (=> b!1397310 m!1283941))

(declare-fun m!1284059 () Bool)

(assert (=> b!1397310 m!1284059))

(declare-fun m!1284061 () Bool)

(assert (=> b!1397310 m!1284061))

(assert (=> b!1397310 m!1283941))

(assert (=> b!1397310 m!1283945))

(assert (=> b!1397313 m!1283941))

(assert (=> b!1397313 m!1283941))

(assert (=> b!1397313 m!1283943))

(declare-fun m!1284063 () Bool)

(assert (=> bm!66906 m!1284063))

(assert (=> b!1397205 d!151165))

(declare-fun d!151169 () Bool)

(assert (=> d!151169 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!613691 () Unit!46765)

(declare-fun choose!38 (array!95588 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46765)

(assert (=> d!151169 (= lt!613691 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151169 (validMask!0 mask!2840)))

(assert (=> d!151169 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!613691)))

(declare-fun bs!40636 () Bool)

(assert (= bs!40636 d!151169))

(assert (=> bs!40636 m!1283953))

(declare-fun m!1284075 () Bool)

(assert (=> bs!40636 m!1284075))

(assert (=> bs!40636 m!1283937))

(assert (=> b!1397205 d!151169))

(declare-fun b!1397365 () Bool)

(declare-fun lt!613702 () SeekEntryResult!10367)

(assert (=> b!1397365 (and (bvsge (index!43841 lt!613702) #b00000000000000000000000000000000) (bvslt (index!43841 lt!613702) (size!46698 a!2901)))))

(declare-fun e!791180 () Bool)

(assert (=> b!1397365 (= e!791180 (= (select (arr!46147 a!2901) (index!43841 lt!613702)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!151177 () Bool)

(declare-fun e!791182 () Bool)

(assert (=> d!151177 e!791182))

(declare-fun c!130304 () Bool)

(assert (=> d!151177 (= c!130304 (and ((_ is Intermediate!10367) lt!613702) (undefined!11179 lt!613702)))))

(declare-fun e!791183 () SeekEntryResult!10367)

(assert (=> d!151177 (= lt!613702 e!791183)))

(declare-fun c!130306 () Bool)

(assert (=> d!151177 (= c!130306 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!613703 () (_ BitVec 64))

(assert (=> d!151177 (= lt!613703 (select (arr!46147 a!2901) (toIndex!0 (select (arr!46147 a!2901) j!112) mask!2840)))))

(assert (=> d!151177 (validMask!0 mask!2840)))

(assert (=> d!151177 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46147 a!2901) j!112) mask!2840) (select (arr!46147 a!2901) j!112) a!2901 mask!2840) lt!613702)))

(declare-fun b!1397366 () Bool)

(assert (=> b!1397366 (and (bvsge (index!43841 lt!613702) #b00000000000000000000000000000000) (bvslt (index!43841 lt!613702) (size!46698 a!2901)))))

(declare-fun res!935682 () Bool)

(assert (=> b!1397366 (= res!935682 (= (select (arr!46147 a!2901) (index!43841 lt!613702)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1397366 (=> res!935682 e!791180)))

(declare-fun e!791181 () SeekEntryResult!10367)

(declare-fun b!1397367 () Bool)

(assert (=> b!1397367 (= e!791181 (Intermediate!10367 false (toIndex!0 (select (arr!46147 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1397368 () Bool)

(assert (=> b!1397368 (= e!791183 e!791181)))

(declare-fun c!130305 () Bool)

(assert (=> b!1397368 (= c!130305 (or (= lt!613703 (select (arr!46147 a!2901) j!112)) (= (bvadd lt!613703 lt!613703) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1397369 () Bool)

(assert (=> b!1397369 (and (bvsge (index!43841 lt!613702) #b00000000000000000000000000000000) (bvslt (index!43841 lt!613702) (size!46698 a!2901)))))

(declare-fun res!935683 () Bool)

(assert (=> b!1397369 (= res!935683 (= (select (arr!46147 a!2901) (index!43841 lt!613702)) (select (arr!46147 a!2901) j!112)))))

(assert (=> b!1397369 (=> res!935683 e!791180)))

(declare-fun e!791179 () Bool)

(assert (=> b!1397369 (= e!791179 e!791180)))

(declare-fun b!1397370 () Bool)

(assert (=> b!1397370 (= e!791182 (bvsge (x!125658 lt!613702) #b01111111111111111111111111111110))))

(declare-fun b!1397371 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397371 (= e!791181 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46147 a!2901) j!112) mask!2840) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2840) (select (arr!46147 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1397372 () Bool)

(assert (=> b!1397372 (= e!791183 (Intermediate!10367 true (toIndex!0 (select (arr!46147 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1397373 () Bool)

(assert (=> b!1397373 (= e!791182 e!791179)))

(declare-fun res!935684 () Bool)

(assert (=> b!1397373 (= res!935684 (and ((_ is Intermediate!10367) lt!613702) (not (undefined!11179 lt!613702)) (bvslt (x!125658 lt!613702) #b01111111111111111111111111111110) (bvsge (x!125658 lt!613702) #b00000000000000000000000000000000) (bvsge (x!125658 lt!613702) #b00000000000000000000000000000000)))))

(assert (=> b!1397373 (=> (not res!935684) (not e!791179))))

(assert (= (and d!151177 c!130306) b!1397372))

(assert (= (and d!151177 (not c!130306)) b!1397368))

(assert (= (and b!1397368 c!130305) b!1397367))

(assert (= (and b!1397368 (not c!130305)) b!1397371))

(assert (= (and d!151177 c!130304) b!1397370))

(assert (= (and d!151177 (not c!130304)) b!1397373))

(assert (= (and b!1397373 res!935684) b!1397369))

(assert (= (and b!1397369 (not res!935683)) b!1397366))

(assert (= (and b!1397366 (not res!935682)) b!1397365))

(assert (=> d!151177 m!1283947))

(declare-fun m!1284085 () Bool)

(assert (=> d!151177 m!1284085))

(assert (=> d!151177 m!1283937))

(assert (=> b!1397371 m!1283947))

(declare-fun m!1284087 () Bool)

(assert (=> b!1397371 m!1284087))

(assert (=> b!1397371 m!1284087))

(assert (=> b!1397371 m!1283941))

(declare-fun m!1284089 () Bool)

(assert (=> b!1397371 m!1284089))

(declare-fun m!1284091 () Bool)

(assert (=> b!1397369 m!1284091))

(assert (=> b!1397365 m!1284091))

(assert (=> b!1397366 m!1284091))

(assert (=> b!1397205 d!151177))

(declare-fun d!151185 () Bool)

(declare-fun lt!613719 () (_ BitVec 32))

(declare-fun lt!613718 () (_ BitVec 32))

(assert (=> d!151185 (= lt!613719 (bvmul (bvxor lt!613718 (bvlshr lt!613718 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151185 (= lt!613718 ((_ extract 31 0) (bvand (bvxor (select (arr!46147 a!2901) j!112) (bvlshr (select (arr!46147 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151185 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!935685 (let ((h!33900 ((_ extract 31 0) (bvand (bvxor (select (arr!46147 a!2901) j!112) (bvlshr (select (arr!46147 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125665 (bvmul (bvxor h!33900 (bvlshr h!33900 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125665 (bvlshr x!125665 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!935685 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!935685 #b00000000000000000000000000000000))))))

(assert (=> d!151185 (= (toIndex!0 (select (arr!46147 a!2901) j!112) mask!2840) (bvand (bvxor lt!613719 (bvlshr lt!613719 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1397205 d!151185))

(declare-fun b!1397430 () Bool)

(declare-fun e!791223 () Bool)

(declare-fun call!66916 () Bool)

(assert (=> b!1397430 (= e!791223 call!66916)))

(declare-fun bm!66913 () Bool)

(declare-fun c!130322 () Bool)

(assert (=> bm!66913 (= call!66916 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130322 (Cons!32649 (select (arr!46147 a!2901) #b00000000000000000000000000000000) Nil!32650) Nil!32650)))))

(declare-fun b!1397431 () Bool)

(declare-fun e!791224 () Bool)

(declare-fun e!791222 () Bool)

(assert (=> b!1397431 (= e!791224 e!791222)))

(declare-fun res!935715 () Bool)

(assert (=> b!1397431 (=> (not res!935715) (not e!791222))))

(declare-fun e!791225 () Bool)

(assert (=> b!1397431 (= res!935715 (not e!791225))))

(declare-fun res!935713 () Bool)

(assert (=> b!1397431 (=> (not res!935713) (not e!791225))))

(assert (=> b!1397431 (= res!935713 (validKeyInArray!0 (select (arr!46147 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1397432 () Bool)

(assert (=> b!1397432 (= e!791223 call!66916)))

(declare-fun b!1397433 () Bool)

(assert (=> b!1397433 (= e!791222 e!791223)))

(assert (=> b!1397433 (= c!130322 (validKeyInArray!0 (select (arr!46147 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1397434 () Bool)

(declare-fun contains!9822 (List!32653 (_ BitVec 64)) Bool)

(assert (=> b!1397434 (= e!791225 (contains!9822 Nil!32650 (select (arr!46147 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!151189 () Bool)

(declare-fun res!935714 () Bool)

(assert (=> d!151189 (=> res!935714 e!791224)))

(assert (=> d!151189 (= res!935714 (bvsge #b00000000000000000000000000000000 (size!46698 a!2901)))))

(assert (=> d!151189 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32650) e!791224)))

(assert (= (and d!151189 (not res!935714)) b!1397431))

(assert (= (and b!1397431 res!935713) b!1397434))

(assert (= (and b!1397431 res!935715) b!1397433))

(assert (= (and b!1397433 c!130322) b!1397430))

(assert (= (and b!1397433 (not c!130322)) b!1397432))

(assert (= (or b!1397430 b!1397432) bm!66913))

(declare-fun m!1284111 () Bool)

(assert (=> bm!66913 m!1284111))

(declare-fun m!1284113 () Bool)

(assert (=> bm!66913 m!1284113))

(assert (=> b!1397431 m!1284111))

(assert (=> b!1397431 m!1284111))

(declare-fun m!1284115 () Bool)

(assert (=> b!1397431 m!1284115))

(assert (=> b!1397433 m!1284111))

(assert (=> b!1397433 m!1284111))

(assert (=> b!1397433 m!1284115))

(assert (=> b!1397434 m!1284111))

(assert (=> b!1397434 m!1284111))

(declare-fun m!1284117 () Bool)

(assert (=> b!1397434 m!1284117))

(assert (=> b!1397210 d!151189))

(declare-fun b!1397435 () Bool)

(declare-fun lt!613731 () SeekEntryResult!10367)

(assert (=> b!1397435 (and (bvsge (index!43841 lt!613731) #b00000000000000000000000000000000) (bvslt (index!43841 lt!613731) (size!46698 (array!95589 (store (arr!46147 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46698 a!2901)))))))

(declare-fun e!791227 () Bool)

(assert (=> b!1397435 (= e!791227 (= (select (arr!46147 (array!95589 (store (arr!46147 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46698 a!2901))) (index!43841 lt!613731)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!151199 () Bool)

(declare-fun e!791229 () Bool)

(assert (=> d!151199 e!791229))

(declare-fun c!130323 () Bool)

(assert (=> d!151199 (= c!130323 (and ((_ is Intermediate!10367) lt!613731) (undefined!11179 lt!613731)))))

(declare-fun e!791230 () SeekEntryResult!10367)

(assert (=> d!151199 (= lt!613731 e!791230)))

(declare-fun c!130325 () Bool)

(assert (=> d!151199 (= c!130325 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!613732 () (_ BitVec 64))

(assert (=> d!151199 (= lt!613732 (select (arr!46147 (array!95589 (store (arr!46147 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46698 a!2901))) (toIndex!0 (select (store (arr!46147 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!151199 (validMask!0 mask!2840)))

(assert (=> d!151199 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46147 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46147 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95589 (store (arr!46147 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46698 a!2901)) mask!2840) lt!613731)))

(declare-fun b!1397436 () Bool)

(assert (=> b!1397436 (and (bvsge (index!43841 lt!613731) #b00000000000000000000000000000000) (bvslt (index!43841 lt!613731) (size!46698 (array!95589 (store (arr!46147 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46698 a!2901)))))))

(declare-fun res!935716 () Bool)

(assert (=> b!1397436 (= res!935716 (= (select (arr!46147 (array!95589 (store (arr!46147 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46698 a!2901))) (index!43841 lt!613731)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1397436 (=> res!935716 e!791227)))

(declare-fun e!791228 () SeekEntryResult!10367)

(declare-fun b!1397437 () Bool)

(assert (=> b!1397437 (= e!791228 (Intermediate!10367 false (toIndex!0 (select (store (arr!46147 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1397438 () Bool)

(assert (=> b!1397438 (= e!791230 e!791228)))

(declare-fun c!130324 () Bool)

(assert (=> b!1397438 (= c!130324 (or (= lt!613732 (select (store (arr!46147 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!613732 lt!613732) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1397439 () Bool)

(assert (=> b!1397439 (and (bvsge (index!43841 lt!613731) #b00000000000000000000000000000000) (bvslt (index!43841 lt!613731) (size!46698 (array!95589 (store (arr!46147 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46698 a!2901)))))))

(declare-fun res!935717 () Bool)

(assert (=> b!1397439 (= res!935717 (= (select (arr!46147 (array!95589 (store (arr!46147 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46698 a!2901))) (index!43841 lt!613731)) (select (store (arr!46147 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(assert (=> b!1397439 (=> res!935717 e!791227)))

(declare-fun e!791226 () Bool)

(assert (=> b!1397439 (= e!791226 e!791227)))

(declare-fun b!1397440 () Bool)

(assert (=> b!1397440 (= e!791229 (bvsge (x!125658 lt!613731) #b01111111111111111111111111111110))))

(declare-fun b!1397441 () Bool)

(assert (=> b!1397441 (= e!791228 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46147 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2840) (select (store (arr!46147 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95589 (store (arr!46147 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46698 a!2901)) mask!2840))))

(declare-fun b!1397442 () Bool)

(assert (=> b!1397442 (= e!791230 (Intermediate!10367 true (toIndex!0 (select (store (arr!46147 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1397443 () Bool)

(assert (=> b!1397443 (= e!791229 e!791226)))

(declare-fun res!935718 () Bool)

(assert (=> b!1397443 (= res!935718 (and ((_ is Intermediate!10367) lt!613731) (not (undefined!11179 lt!613731)) (bvslt (x!125658 lt!613731) #b01111111111111111111111111111110) (bvsge (x!125658 lt!613731) #b00000000000000000000000000000000) (bvsge (x!125658 lt!613731) #b00000000000000000000000000000000)))))

(assert (=> b!1397443 (=> (not res!935718) (not e!791226))))

(assert (= (and d!151199 c!130325) b!1397442))

(assert (= (and d!151199 (not c!130325)) b!1397438))

(assert (= (and b!1397438 c!130324) b!1397437))

(assert (= (and b!1397438 (not c!130324)) b!1397441))

(assert (= (and d!151199 c!130323) b!1397440))

(assert (= (and d!151199 (not c!130323)) b!1397443))

(assert (= (and b!1397443 res!935718) b!1397439))

(assert (= (and b!1397439 (not res!935717)) b!1397436))

(assert (= (and b!1397436 (not res!935716)) b!1397435))

(assert (=> d!151199 m!1283965))

(declare-fun m!1284119 () Bool)

(assert (=> d!151199 m!1284119))

(assert (=> d!151199 m!1283937))

(assert (=> b!1397441 m!1283965))

(declare-fun m!1284121 () Bool)

(assert (=> b!1397441 m!1284121))

(assert (=> b!1397441 m!1284121))

(assert (=> b!1397441 m!1283963))

(declare-fun m!1284123 () Bool)

(assert (=> b!1397441 m!1284123))

(declare-fun m!1284125 () Bool)

(assert (=> b!1397439 m!1284125))

(assert (=> b!1397435 m!1284125))

(assert (=> b!1397436 m!1284125))

(assert (=> b!1397211 d!151199))

(declare-fun d!151203 () Bool)

(declare-fun lt!613736 () (_ BitVec 32))

(declare-fun lt!613735 () (_ BitVec 32))

(assert (=> d!151203 (= lt!613736 (bvmul (bvxor lt!613735 (bvlshr lt!613735 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151203 (= lt!613735 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46147 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46147 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151203 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!935685 (let ((h!33900 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46147 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46147 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125665 (bvmul (bvxor h!33900 (bvlshr h!33900 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125665 (bvlshr x!125665 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!935685 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!935685 #b00000000000000000000000000000000))))))

(assert (=> d!151203 (= (toIndex!0 (select (store (arr!46147 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!613736 (bvlshr lt!613736 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1397211 d!151203))

(declare-fun b!1397444 () Bool)

(declare-fun e!791232 () Bool)

(declare-fun e!791233 () Bool)

(assert (=> b!1397444 (= e!791232 e!791233)))

(declare-fun lt!613737 () (_ BitVec 64))

(assert (=> b!1397444 (= lt!613737 (select (arr!46147 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!613738 () Unit!46765)

(assert (=> b!1397444 (= lt!613738 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!613737 #b00000000000000000000000000000000))))

(assert (=> b!1397444 (arrayContainsKey!0 a!2901 lt!613737 #b00000000000000000000000000000000)))

(declare-fun lt!613739 () Unit!46765)

(assert (=> b!1397444 (= lt!613739 lt!613738)))

(declare-fun res!935720 () Bool)

(assert (=> b!1397444 (= res!935720 (= (seekEntryOrOpen!0 (select (arr!46147 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10367 #b00000000000000000000000000000000)))))

(assert (=> b!1397444 (=> (not res!935720) (not e!791233))))

(declare-fun b!1397445 () Bool)

(declare-fun call!66917 () Bool)

(assert (=> b!1397445 (= e!791233 call!66917)))

(declare-fun b!1397446 () Bool)

(assert (=> b!1397446 (= e!791232 call!66917)))

(declare-fun b!1397447 () Bool)

(declare-fun e!791231 () Bool)

(assert (=> b!1397447 (= e!791231 e!791232)))

(declare-fun c!130326 () Bool)

(assert (=> b!1397447 (= c!130326 (validKeyInArray!0 (select (arr!46147 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66914 () Bool)

(assert (=> bm!66914 (= call!66917 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!151205 () Bool)

(declare-fun res!935719 () Bool)

(assert (=> d!151205 (=> res!935719 e!791231)))

(assert (=> d!151205 (= res!935719 (bvsge #b00000000000000000000000000000000 (size!46698 a!2901)))))

(assert (=> d!151205 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!791231)))

(assert (= (and d!151205 (not res!935719)) b!1397447))

(assert (= (and b!1397447 c!130326) b!1397444))

(assert (= (and b!1397447 (not c!130326)) b!1397446))

(assert (= (and b!1397444 res!935720) b!1397445))

(assert (= (or b!1397445 b!1397446) bm!66914))

(assert (=> b!1397444 m!1284111))

(declare-fun m!1284129 () Bool)

(assert (=> b!1397444 m!1284129))

(declare-fun m!1284131 () Bool)

(assert (=> b!1397444 m!1284131))

(assert (=> b!1397444 m!1284111))

(declare-fun m!1284133 () Bool)

(assert (=> b!1397444 m!1284133))

(assert (=> b!1397447 m!1284111))

(assert (=> b!1397447 m!1284111))

(assert (=> b!1397447 m!1284115))

(declare-fun m!1284135 () Bool)

(assert (=> bm!66914 m!1284135))

(assert (=> b!1397209 d!151205))

(declare-fun d!151209 () Bool)

(assert (=> d!151209 (= (validKeyInArray!0 (select (arr!46147 a!2901) i!1037)) (and (not (= (select (arr!46147 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46147 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1397204 d!151209))

(check-sat (not bm!66906) (not b!1397310) (not b!1397433) (not b!1397285) (not b!1397371) (not b!1397441) (not b!1397431) (not d!151169) (not bm!66914) (not bm!66913) (not b!1397447) (not d!151199) (not d!151157) (not d!151177) (not b!1397313) (not b!1397444) (not b!1397434))
(check-sat)
