; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130300 () Bool)

(assert start!130300)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101650 0))(
  ( (array!101651 (arr!49050 (Array (_ BitVec 32) (_ BitVec 64))) (size!49600 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101650)

(declare-fun b!1529964 () Bool)

(declare-fun e!852549 () Bool)

(declare-datatypes ((SeekEntryResult!13215 0))(
  ( (MissingZero!13215 (index!55255 (_ BitVec 32))) (Found!13215 (index!55256 (_ BitVec 32))) (Intermediate!13215 (undefined!14027 Bool) (index!55257 (_ BitVec 32)) (x!136934 (_ BitVec 32))) (Undefined!13215) (MissingVacant!13215 (index!55258 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101650 (_ BitVec 32)) SeekEntryResult!13215)

(assert (=> b!1529964 (= e!852549 (= (seekEntry!0 (select (arr!49050 a!2804) j!70) a!2804 mask!2512) (Found!13215 j!70)))))

(declare-fun b!1529965 () Bool)

(declare-fun res!1047679 () Bool)

(declare-fun e!852550 () Bool)

(assert (=> b!1529965 (=> (not res!1047679) (not e!852550))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1529965 (= res!1047679 (and (= (size!49600 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49600 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49600 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1529966 () Bool)

(declare-fun e!852552 () Bool)

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1529966 (= e!852552 (and (bvsge (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110)))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun lt!662610 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529966 (= lt!662610 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1529967 () Bool)

(declare-fun res!1047680 () Bool)

(assert (=> b!1529967 (=> (not res!1047680) (not e!852550))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101650 (_ BitVec 32)) Bool)

(assert (=> b!1529967 (= res!1047680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1529968 () Bool)

(declare-fun res!1047677 () Bool)

(declare-fun e!852553 () Bool)

(assert (=> b!1529968 (=> (not res!1047677) (not e!852553))))

(declare-fun lt!662608 () SeekEntryResult!13215)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101650 (_ BitVec 32)) SeekEntryResult!13215)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529968 (= res!1047677 (= lt!662608 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49050 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49050 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101651 (store (arr!49050 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49600 a!2804)) mask!2512)))))

(declare-fun b!1529969 () Bool)

(declare-fun res!1047673 () Bool)

(assert (=> b!1529969 (=> (not res!1047673) (not e!852550))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1529969 (= res!1047673 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49600 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49600 a!2804))))))

(declare-fun b!1529970 () Bool)

(declare-fun res!1047675 () Bool)

(assert (=> b!1529970 (=> (not res!1047675) (not e!852553))))

(declare-fun lt!662609 () SeekEntryResult!13215)

(assert (=> b!1529970 (= res!1047675 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49050 a!2804) j!70) a!2804 mask!2512) lt!662609))))

(declare-fun b!1529971 () Bool)

(declare-fun res!1047681 () Bool)

(assert (=> b!1529971 (=> (not res!1047681) (not e!852550))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1529971 (= res!1047681 (validKeyInArray!0 (select (arr!49050 a!2804) i!961)))))

(declare-fun res!1047678 () Bool)

(assert (=> start!130300 (=> (not res!1047678) (not e!852550))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130300 (= res!1047678 (validMask!0 mask!2512))))

(assert (=> start!130300 e!852550))

(assert (=> start!130300 true))

(declare-fun array_inv!38078 (array!101650) Bool)

(assert (=> start!130300 (array_inv!38078 a!2804)))

(declare-fun b!1529972 () Bool)

(assert (=> b!1529972 (= e!852550 e!852553)))

(declare-fun res!1047676 () Bool)

(assert (=> b!1529972 (=> (not res!1047676) (not e!852553))))

(assert (=> b!1529972 (= res!1047676 (= lt!662608 lt!662609))))

(assert (=> b!1529972 (= lt!662609 (Intermediate!13215 false resIndex!21 resX!21))))

(assert (=> b!1529972 (= lt!662608 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49050 a!2804) j!70) mask!2512) (select (arr!49050 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1529973 () Bool)

(assert (=> b!1529973 (= e!852553 (not e!852552))))

(declare-fun res!1047672 () Bool)

(assert (=> b!1529973 (=> res!1047672 e!852552)))

(assert (=> b!1529973 (= res!1047672 (or (not (= (select (arr!49050 a!2804) j!70) (select (store (arr!49050 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1529973 e!852549))

(declare-fun res!1047671 () Bool)

(assert (=> b!1529973 (=> (not res!1047671) (not e!852549))))

(assert (=> b!1529973 (= res!1047671 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51214 0))(
  ( (Unit!51215) )
))
(declare-fun lt!662611 () Unit!51214)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101650 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51214)

(assert (=> b!1529973 (= lt!662611 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1529974 () Bool)

(declare-fun res!1047682 () Bool)

(assert (=> b!1529974 (=> (not res!1047682) (not e!852550))))

(declare-datatypes ((List!35533 0))(
  ( (Nil!35530) (Cons!35529 (h!36965 (_ BitVec 64)) (t!50227 List!35533)) )
))
(declare-fun arrayNoDuplicates!0 (array!101650 (_ BitVec 32) List!35533) Bool)

(assert (=> b!1529974 (= res!1047682 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35530))))

(declare-fun b!1529975 () Bool)

(declare-fun res!1047674 () Bool)

(assert (=> b!1529975 (=> (not res!1047674) (not e!852550))))

(assert (=> b!1529975 (= res!1047674 (validKeyInArray!0 (select (arr!49050 a!2804) j!70)))))

(assert (= (and start!130300 res!1047678) b!1529965))

(assert (= (and b!1529965 res!1047679) b!1529971))

(assert (= (and b!1529971 res!1047681) b!1529975))

(assert (= (and b!1529975 res!1047674) b!1529967))

(assert (= (and b!1529967 res!1047680) b!1529974))

(assert (= (and b!1529974 res!1047682) b!1529969))

(assert (= (and b!1529969 res!1047673) b!1529972))

(assert (= (and b!1529972 res!1047676) b!1529970))

(assert (= (and b!1529970 res!1047675) b!1529968))

(assert (= (and b!1529968 res!1047677) b!1529973))

(assert (= (and b!1529973 res!1047671) b!1529964))

(assert (= (and b!1529973 (not res!1047672)) b!1529966))

(declare-fun m!1412939 () Bool)

(assert (=> b!1529970 m!1412939))

(assert (=> b!1529970 m!1412939))

(declare-fun m!1412941 () Bool)

(assert (=> b!1529970 m!1412941))

(assert (=> b!1529972 m!1412939))

(assert (=> b!1529972 m!1412939))

(declare-fun m!1412943 () Bool)

(assert (=> b!1529972 m!1412943))

(assert (=> b!1529972 m!1412943))

(assert (=> b!1529972 m!1412939))

(declare-fun m!1412945 () Bool)

(assert (=> b!1529972 m!1412945))

(assert (=> b!1529973 m!1412939))

(declare-fun m!1412947 () Bool)

(assert (=> b!1529973 m!1412947))

(declare-fun m!1412949 () Bool)

(assert (=> b!1529973 m!1412949))

(declare-fun m!1412951 () Bool)

(assert (=> b!1529973 m!1412951))

(declare-fun m!1412953 () Bool)

(assert (=> b!1529973 m!1412953))

(assert (=> b!1529975 m!1412939))

(assert (=> b!1529975 m!1412939))

(declare-fun m!1412955 () Bool)

(assert (=> b!1529975 m!1412955))

(declare-fun m!1412957 () Bool)

(assert (=> b!1529971 m!1412957))

(assert (=> b!1529971 m!1412957))

(declare-fun m!1412959 () Bool)

(assert (=> b!1529971 m!1412959))

(declare-fun m!1412961 () Bool)

(assert (=> start!130300 m!1412961))

(declare-fun m!1412963 () Bool)

(assert (=> start!130300 m!1412963))

(assert (=> b!1529964 m!1412939))

(assert (=> b!1529964 m!1412939))

(declare-fun m!1412965 () Bool)

(assert (=> b!1529964 m!1412965))

(declare-fun m!1412967 () Bool)

(assert (=> b!1529967 m!1412967))

(assert (=> b!1529968 m!1412949))

(assert (=> b!1529968 m!1412951))

(assert (=> b!1529968 m!1412951))

(declare-fun m!1412969 () Bool)

(assert (=> b!1529968 m!1412969))

(assert (=> b!1529968 m!1412969))

(assert (=> b!1529968 m!1412951))

(declare-fun m!1412971 () Bool)

(assert (=> b!1529968 m!1412971))

(declare-fun m!1412973 () Bool)

(assert (=> b!1529966 m!1412973))

(declare-fun m!1412975 () Bool)

(assert (=> b!1529974 m!1412975))

(check-sat (not b!1529972) (not b!1529975) (not b!1529970) (not b!1529971) (not start!130300) (not b!1529964) (not b!1529973) (not b!1529967) (not b!1529966) (not b!1529968) (not b!1529974))
(check-sat)
(get-model)

(declare-fun b!1530030 () Bool)

(declare-fun e!852579 () Bool)

(declare-fun e!852583 () Bool)

(assert (=> b!1530030 (= e!852579 e!852583)))

(declare-fun res!1047727 () Bool)

(declare-fun lt!662628 () SeekEntryResult!13215)

(get-info :version)

(assert (=> b!1530030 (= res!1047727 (and ((_ is Intermediate!13215) lt!662628) (not (undefined!14027 lt!662628)) (bvslt (x!136934 lt!662628) #b01111111111111111111111111111110) (bvsge (x!136934 lt!662628) #b00000000000000000000000000000000) (bvsge (x!136934 lt!662628) x!534)))))

(assert (=> b!1530030 (=> (not res!1047727) (not e!852583))))

(declare-fun d!159737 () Bool)

(assert (=> d!159737 e!852579))

(declare-fun c!140708 () Bool)

(assert (=> d!159737 (= c!140708 (and ((_ is Intermediate!13215) lt!662628) (undefined!14027 lt!662628)))))

(declare-fun e!852581 () SeekEntryResult!13215)

(assert (=> d!159737 (= lt!662628 e!852581)))

(declare-fun c!140706 () Bool)

(assert (=> d!159737 (= c!140706 (bvsge x!534 #b01111111111111111111111111111110))))

(declare-fun lt!662629 () (_ BitVec 64))

(assert (=> d!159737 (= lt!662629 (select (arr!49050 a!2804) index!487))))

(assert (=> d!159737 (validMask!0 mask!2512)))

(assert (=> d!159737 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49050 a!2804) j!70) a!2804 mask!2512) lt!662628)))

(declare-fun b!1530031 () Bool)

(declare-fun e!852580 () SeekEntryResult!13215)

(assert (=> b!1530031 (= e!852580 (Intermediate!13215 false index!487 x!534))))

(declare-fun b!1530032 () Bool)

(assert (=> b!1530032 (= e!852579 (bvsge (x!136934 lt!662628) #b01111111111111111111111111111110))))

(declare-fun b!1530033 () Bool)

(assert (=> b!1530033 (and (bvsge (index!55257 lt!662628) #b00000000000000000000000000000000) (bvslt (index!55257 lt!662628) (size!49600 a!2804)))))

(declare-fun e!852582 () Bool)

(assert (=> b!1530033 (= e!852582 (= (select (arr!49050 a!2804) (index!55257 lt!662628)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1530034 () Bool)

(assert (=> b!1530034 (= e!852580 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!49050 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1530035 () Bool)

(assert (=> b!1530035 (= e!852581 (Intermediate!13215 true index!487 x!534))))

(declare-fun b!1530036 () Bool)

(assert (=> b!1530036 (and (bvsge (index!55257 lt!662628) #b00000000000000000000000000000000) (bvslt (index!55257 lt!662628) (size!49600 a!2804)))))

(declare-fun res!1047726 () Bool)

(assert (=> b!1530036 (= res!1047726 (= (select (arr!49050 a!2804) (index!55257 lt!662628)) (select (arr!49050 a!2804) j!70)))))

(assert (=> b!1530036 (=> res!1047726 e!852582)))

(assert (=> b!1530036 (= e!852583 e!852582)))

(declare-fun b!1530037 () Bool)

(assert (=> b!1530037 (and (bvsge (index!55257 lt!662628) #b00000000000000000000000000000000) (bvslt (index!55257 lt!662628) (size!49600 a!2804)))))

(declare-fun res!1047725 () Bool)

(assert (=> b!1530037 (= res!1047725 (= (select (arr!49050 a!2804) (index!55257 lt!662628)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1530037 (=> res!1047725 e!852582)))

(declare-fun b!1530038 () Bool)

(assert (=> b!1530038 (= e!852581 e!852580)))

(declare-fun c!140707 () Bool)

(assert (=> b!1530038 (= c!140707 (or (= lt!662629 (select (arr!49050 a!2804) j!70)) (= (bvadd lt!662629 lt!662629) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!159737 c!140706) b!1530035))

(assert (= (and d!159737 (not c!140706)) b!1530038))

(assert (= (and b!1530038 c!140707) b!1530031))

(assert (= (and b!1530038 (not c!140707)) b!1530034))

(assert (= (and d!159737 c!140708) b!1530032))

(assert (= (and d!159737 (not c!140708)) b!1530030))

(assert (= (and b!1530030 res!1047727) b!1530036))

(assert (= (and b!1530036 (not res!1047726)) b!1530037))

(assert (= (and b!1530037 (not res!1047725)) b!1530033))

(declare-fun m!1413015 () Bool)

(assert (=> d!159737 m!1413015))

(assert (=> d!159737 m!1412961))

(declare-fun m!1413017 () Bool)

(assert (=> b!1530036 m!1413017))

(assert (=> b!1530037 m!1413017))

(assert (=> b!1530033 m!1413017))

(assert (=> b!1530034 m!1412973))

(assert (=> b!1530034 m!1412973))

(assert (=> b!1530034 m!1412939))

(declare-fun m!1413019 () Bool)

(assert (=> b!1530034 m!1413019))

(assert (=> b!1529970 d!159737))

(declare-fun d!159741 () Bool)

(assert (=> d!159741 (= (validKeyInArray!0 (select (arr!49050 a!2804) i!961)) (and (not (= (select (arr!49050 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49050 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1529971 d!159741))

(declare-fun b!1530039 () Bool)

(declare-fun e!852584 () Bool)

(declare-fun e!852588 () Bool)

(assert (=> b!1530039 (= e!852584 e!852588)))

(declare-fun res!1047730 () Bool)

(declare-fun lt!662630 () SeekEntryResult!13215)

(assert (=> b!1530039 (= res!1047730 (and ((_ is Intermediate!13215) lt!662630) (not (undefined!14027 lt!662630)) (bvslt (x!136934 lt!662630) #b01111111111111111111111111111110) (bvsge (x!136934 lt!662630) #b00000000000000000000000000000000) (bvsge (x!136934 lt!662630) #b00000000000000000000000000000000)))))

(assert (=> b!1530039 (=> (not res!1047730) (not e!852588))))

(declare-fun d!159743 () Bool)

(assert (=> d!159743 e!852584))

(declare-fun c!140711 () Bool)

(assert (=> d!159743 (= c!140711 (and ((_ is Intermediate!13215) lt!662630) (undefined!14027 lt!662630)))))

(declare-fun e!852586 () SeekEntryResult!13215)

(assert (=> d!159743 (= lt!662630 e!852586)))

(declare-fun c!140709 () Bool)

(assert (=> d!159743 (= c!140709 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!662631 () (_ BitVec 64))

(assert (=> d!159743 (= lt!662631 (select (arr!49050 (array!101651 (store (arr!49050 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49600 a!2804))) (toIndex!0 (select (store (arr!49050 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512)))))

(assert (=> d!159743 (validMask!0 mask!2512)))

(assert (=> d!159743 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49050 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49050 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101651 (store (arr!49050 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49600 a!2804)) mask!2512) lt!662630)))

(declare-fun e!852585 () SeekEntryResult!13215)

(declare-fun b!1530040 () Bool)

(assert (=> b!1530040 (= e!852585 (Intermediate!13215 false (toIndex!0 (select (store (arr!49050 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1530041 () Bool)

(assert (=> b!1530041 (= e!852584 (bvsge (x!136934 lt!662630) #b01111111111111111111111111111110))))

(declare-fun b!1530042 () Bool)

(assert (=> b!1530042 (and (bvsge (index!55257 lt!662630) #b00000000000000000000000000000000) (bvslt (index!55257 lt!662630) (size!49600 (array!101651 (store (arr!49050 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49600 a!2804)))))))

(declare-fun e!852587 () Bool)

(assert (=> b!1530042 (= e!852587 (= (select (arr!49050 (array!101651 (store (arr!49050 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49600 a!2804))) (index!55257 lt!662630)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1530043 () Bool)

(assert (=> b!1530043 (= e!852585 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!49050 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (store (arr!49050 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101651 (store (arr!49050 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49600 a!2804)) mask!2512))))

(declare-fun b!1530044 () Bool)

(assert (=> b!1530044 (= e!852586 (Intermediate!13215 true (toIndex!0 (select (store (arr!49050 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1530045 () Bool)

(assert (=> b!1530045 (and (bvsge (index!55257 lt!662630) #b00000000000000000000000000000000) (bvslt (index!55257 lt!662630) (size!49600 (array!101651 (store (arr!49050 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49600 a!2804)))))))

(declare-fun res!1047729 () Bool)

(assert (=> b!1530045 (= res!1047729 (= (select (arr!49050 (array!101651 (store (arr!49050 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49600 a!2804))) (index!55257 lt!662630)) (select (store (arr!49050 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(assert (=> b!1530045 (=> res!1047729 e!852587)))

(assert (=> b!1530045 (= e!852588 e!852587)))

(declare-fun b!1530046 () Bool)

(assert (=> b!1530046 (and (bvsge (index!55257 lt!662630) #b00000000000000000000000000000000) (bvslt (index!55257 lt!662630) (size!49600 (array!101651 (store (arr!49050 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49600 a!2804)))))))

(declare-fun res!1047728 () Bool)

(assert (=> b!1530046 (= res!1047728 (= (select (arr!49050 (array!101651 (store (arr!49050 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49600 a!2804))) (index!55257 lt!662630)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1530046 (=> res!1047728 e!852587)))

(declare-fun b!1530047 () Bool)

(assert (=> b!1530047 (= e!852586 e!852585)))

(declare-fun c!140710 () Bool)

(assert (=> b!1530047 (= c!140710 (or (= lt!662631 (select (store (arr!49050 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!662631 lt!662631) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!159743 c!140709) b!1530044))

(assert (= (and d!159743 (not c!140709)) b!1530047))

(assert (= (and b!1530047 c!140710) b!1530040))

(assert (= (and b!1530047 (not c!140710)) b!1530043))

(assert (= (and d!159743 c!140711) b!1530041))

(assert (= (and d!159743 (not c!140711)) b!1530039))

(assert (= (and b!1530039 res!1047730) b!1530045))

(assert (= (and b!1530045 (not res!1047729)) b!1530046))

(assert (= (and b!1530046 (not res!1047728)) b!1530042))

(assert (=> d!159743 m!1412969))

(declare-fun m!1413021 () Bool)

(assert (=> d!159743 m!1413021))

(assert (=> d!159743 m!1412961))

(declare-fun m!1413023 () Bool)

(assert (=> b!1530045 m!1413023))

(assert (=> b!1530046 m!1413023))

(assert (=> b!1530042 m!1413023))

(assert (=> b!1530043 m!1412969))

(declare-fun m!1413025 () Bool)

(assert (=> b!1530043 m!1413025))

(assert (=> b!1530043 m!1413025))

(assert (=> b!1530043 m!1412951))

(declare-fun m!1413027 () Bool)

(assert (=> b!1530043 m!1413027))

(assert (=> b!1529968 d!159743))

(declare-fun d!159747 () Bool)

(declare-fun lt!662646 () (_ BitVec 32))

(declare-fun lt!662645 () (_ BitVec 32))

(assert (=> d!159747 (= lt!662646 (bvmul (bvxor lt!662645 (bvlshr lt!662645 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159747 (= lt!662645 ((_ extract 31 0) (bvand (bvxor (select (store (arr!49050 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!49050 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159747 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1047731 (let ((h!36967 ((_ extract 31 0) (bvand (bvxor (select (store (arr!49050 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!49050 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136937 (bvmul (bvxor h!36967 (bvlshr h!36967 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136937 (bvlshr x!136937 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1047731 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1047731 #b00000000000000000000000000000000))))))

(assert (=> d!159747 (= (toIndex!0 (select (store (arr!49050 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!662646 (bvlshr lt!662646 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1529968 d!159747))

(declare-fun d!159751 () Bool)

(declare-fun lt!662649 () (_ BitVec 32))

(assert (=> d!159751 (and (bvsge lt!662649 #b00000000000000000000000000000000) (bvslt lt!662649 (bvadd mask!2512 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!159751 (= lt!662649 (choose!52 index!487 x!534 mask!2512))))

(assert (=> d!159751 (validMask!0 mask!2512)))

(assert (=> d!159751 (= (nextIndex!0 index!487 x!534 mask!2512) lt!662649)))

(declare-fun bs!43873 () Bool)

(assert (= bs!43873 d!159751))

(declare-fun m!1413041 () Bool)

(assert (=> bs!43873 m!1413041))

(assert (=> bs!43873 m!1412961))

(assert (=> b!1529966 d!159751))

(declare-fun b!1530086 () Bool)

(declare-fun e!852615 () Bool)

(declare-fun e!852614 () Bool)

(assert (=> b!1530086 (= e!852615 e!852614)))

(declare-fun lt!662662 () (_ BitVec 64))

(assert (=> b!1530086 (= lt!662662 (select (arr!49050 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!662661 () Unit!51214)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101650 (_ BitVec 64) (_ BitVec 32)) Unit!51214)

(assert (=> b!1530086 (= lt!662661 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!662662 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!101650 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1530086 (arrayContainsKey!0 a!2804 lt!662662 #b00000000000000000000000000000000)))

(declare-fun lt!662660 () Unit!51214)

(assert (=> b!1530086 (= lt!662660 lt!662661)))

(declare-fun res!1047748 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101650 (_ BitVec 32)) SeekEntryResult!13215)

(assert (=> b!1530086 (= res!1047748 (= (seekEntryOrOpen!0 (select (arr!49050 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13215 #b00000000000000000000000000000000)))))

(assert (=> b!1530086 (=> (not res!1047748) (not e!852614))))

(declare-fun b!1530087 () Bool)

(declare-fun call!68496 () Bool)

(assert (=> b!1530087 (= e!852615 call!68496)))

(declare-fun b!1530088 () Bool)

(assert (=> b!1530088 (= e!852614 call!68496)))

(declare-fun b!1530089 () Bool)

(declare-fun e!852616 () Bool)

(assert (=> b!1530089 (= e!852616 e!852615)))

(declare-fun c!140723 () Bool)

(assert (=> b!1530089 (= c!140723 (validKeyInArray!0 (select (arr!49050 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68493 () Bool)

(assert (=> bm!68493 (= call!68496 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun d!159753 () Bool)

(declare-fun res!1047749 () Bool)

(assert (=> d!159753 (=> res!1047749 e!852616)))

(assert (=> d!159753 (= res!1047749 (bvsge #b00000000000000000000000000000000 (size!49600 a!2804)))))

(assert (=> d!159753 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!852616)))

(assert (= (and d!159753 (not res!1047749)) b!1530089))

(assert (= (and b!1530089 c!140723) b!1530086))

(assert (= (and b!1530089 (not c!140723)) b!1530087))

(assert (= (and b!1530086 res!1047748) b!1530088))

(assert (= (or b!1530088 b!1530087) bm!68493))

(declare-fun m!1413043 () Bool)

(assert (=> b!1530086 m!1413043))

(declare-fun m!1413045 () Bool)

(assert (=> b!1530086 m!1413045))

(declare-fun m!1413047 () Bool)

(assert (=> b!1530086 m!1413047))

(assert (=> b!1530086 m!1413043))

(declare-fun m!1413049 () Bool)

(assert (=> b!1530086 m!1413049))

(assert (=> b!1530089 m!1413043))

(assert (=> b!1530089 m!1413043))

(declare-fun m!1413051 () Bool)

(assert (=> b!1530089 m!1413051))

(declare-fun m!1413053 () Bool)

(assert (=> bm!68493 m!1413053))

(assert (=> b!1529967 d!159753))

(declare-fun d!159755 () Bool)

(declare-fun res!1047767 () Bool)

(declare-fun e!852643 () Bool)

(assert (=> d!159755 (=> res!1047767 e!852643)))

(assert (=> d!159755 (= res!1047767 (bvsge #b00000000000000000000000000000000 (size!49600 a!2804)))))

(assert (=> d!159755 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35530) e!852643)))

(declare-fun b!1530127 () Bool)

(declare-fun e!852641 () Bool)

(assert (=> b!1530127 (= e!852643 e!852641)))

(declare-fun res!1047766 () Bool)

(assert (=> b!1530127 (=> (not res!1047766) (not e!852641))))

(declare-fun e!852642 () Bool)

(assert (=> b!1530127 (= res!1047766 (not e!852642))))

(declare-fun res!1047768 () Bool)

(assert (=> b!1530127 (=> (not res!1047768) (not e!852642))))

(assert (=> b!1530127 (= res!1047768 (validKeyInArray!0 (select (arr!49050 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1530128 () Bool)

(declare-fun e!852640 () Bool)

(declare-fun call!68499 () Bool)

(assert (=> b!1530128 (= e!852640 call!68499)))

(declare-fun bm!68496 () Bool)

(declare-fun c!140735 () Bool)

(assert (=> bm!68496 (= call!68499 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!140735 (Cons!35529 (select (arr!49050 a!2804) #b00000000000000000000000000000000) Nil!35530) Nil!35530)))))

(declare-fun b!1530129 () Bool)

(assert (=> b!1530129 (= e!852641 e!852640)))

(assert (=> b!1530129 (= c!140735 (validKeyInArray!0 (select (arr!49050 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1530130 () Bool)

(assert (=> b!1530130 (= e!852640 call!68499)))

(declare-fun b!1530131 () Bool)

(declare-fun contains!9997 (List!35533 (_ BitVec 64)) Bool)

(assert (=> b!1530131 (= e!852642 (contains!9997 Nil!35530 (select (arr!49050 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!159755 (not res!1047767)) b!1530127))

(assert (= (and b!1530127 res!1047768) b!1530131))

(assert (= (and b!1530127 res!1047766) b!1530129))

(assert (= (and b!1530129 c!140735) b!1530128))

(assert (= (and b!1530129 (not c!140735)) b!1530130))

(assert (= (or b!1530128 b!1530130) bm!68496))

(assert (=> b!1530127 m!1413043))

(assert (=> b!1530127 m!1413043))

(assert (=> b!1530127 m!1413051))

(assert (=> bm!68496 m!1413043))

(declare-fun m!1413063 () Bool)

(assert (=> bm!68496 m!1413063))

(assert (=> b!1530129 m!1413043))

(assert (=> b!1530129 m!1413043))

(assert (=> b!1530129 m!1413051))

(assert (=> b!1530131 m!1413043))

(assert (=> b!1530131 m!1413043))

(declare-fun m!1413065 () Bool)

(assert (=> b!1530131 m!1413065))

(assert (=> b!1529974 d!159755))

(declare-fun d!159759 () Bool)

(assert (=> d!159759 (= (validKeyInArray!0 (select (arr!49050 a!2804) j!70)) (and (not (= (select (arr!49050 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49050 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1529975 d!159759))

(declare-fun b!1530174 () Bool)

(declare-fun c!140754 () Bool)

(declare-fun lt!662703 () (_ BitVec 64))

(assert (=> b!1530174 (= c!140754 (= lt!662703 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!852666 () SeekEntryResult!13215)

(declare-fun e!852667 () SeekEntryResult!13215)

(assert (=> b!1530174 (= e!852666 e!852667)))

(declare-fun b!1530175 () Bool)

(declare-fun e!852668 () SeekEntryResult!13215)

(assert (=> b!1530175 (= e!852668 e!852666)))

(declare-fun lt!662704 () SeekEntryResult!13215)

(assert (=> b!1530175 (= lt!662703 (select (arr!49050 a!2804) (index!55257 lt!662704)))))

(declare-fun c!140756 () Bool)

(assert (=> b!1530175 (= c!140756 (= lt!662703 (select (arr!49050 a!2804) j!70)))))

(declare-fun b!1530176 () Bool)

(assert (=> b!1530176 (= e!852667 (MissingZero!13215 (index!55257 lt!662704)))))

(declare-fun d!159761 () Bool)

(declare-fun lt!662702 () SeekEntryResult!13215)

(assert (=> d!159761 (and (or ((_ is MissingVacant!13215) lt!662702) (not ((_ is Found!13215) lt!662702)) (and (bvsge (index!55256 lt!662702) #b00000000000000000000000000000000) (bvslt (index!55256 lt!662702) (size!49600 a!2804)))) (not ((_ is MissingVacant!13215) lt!662702)) (or (not ((_ is Found!13215) lt!662702)) (= (select (arr!49050 a!2804) (index!55256 lt!662702)) (select (arr!49050 a!2804) j!70))))))

(assert (=> d!159761 (= lt!662702 e!852668)))

(declare-fun c!140755 () Bool)

(assert (=> d!159761 (= c!140755 (and ((_ is Intermediate!13215) lt!662704) (undefined!14027 lt!662704)))))

(assert (=> d!159761 (= lt!662704 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49050 a!2804) j!70) mask!2512) (select (arr!49050 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159761 (validMask!0 mask!2512)))

(assert (=> d!159761 (= (seekEntry!0 (select (arr!49050 a!2804) j!70) a!2804 mask!2512) lt!662702)))

(declare-fun b!1530177 () Bool)

(assert (=> b!1530177 (= e!852666 (Found!13215 (index!55257 lt!662704)))))

(declare-fun b!1530178 () Bool)

(assert (=> b!1530178 (= e!852668 Undefined!13215)))

(declare-fun b!1530179 () Bool)

(declare-fun lt!662701 () SeekEntryResult!13215)

(assert (=> b!1530179 (= e!852667 (ite ((_ is MissingVacant!13215) lt!662701) (MissingZero!13215 (index!55258 lt!662701)) lt!662701))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101650 (_ BitVec 32)) SeekEntryResult!13215)

(assert (=> b!1530179 (= lt!662701 (seekKeyOrZeroReturnVacant!0 (x!136934 lt!662704) (index!55257 lt!662704) (index!55257 lt!662704) (select (arr!49050 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and d!159761 c!140755) b!1530178))

(assert (= (and d!159761 (not c!140755)) b!1530175))

(assert (= (and b!1530175 c!140756) b!1530177))

(assert (= (and b!1530175 (not c!140756)) b!1530174))

(assert (= (and b!1530174 c!140754) b!1530176))

(assert (= (and b!1530174 (not c!140754)) b!1530179))

(declare-fun m!1413081 () Bool)

(assert (=> b!1530175 m!1413081))

(declare-fun m!1413083 () Bool)

(assert (=> d!159761 m!1413083))

(assert (=> d!159761 m!1412939))

(assert (=> d!159761 m!1412943))

(assert (=> d!159761 m!1412943))

(assert (=> d!159761 m!1412939))

(assert (=> d!159761 m!1412945))

(assert (=> d!159761 m!1412961))

(assert (=> b!1530179 m!1412939))

(declare-fun m!1413085 () Bool)

(assert (=> b!1530179 m!1413085))

(assert (=> b!1529964 d!159761))

(declare-fun b!1530180 () Bool)

(declare-fun e!852670 () Bool)

(declare-fun e!852669 () Bool)

(assert (=> b!1530180 (= e!852670 e!852669)))

(declare-fun lt!662707 () (_ BitVec 64))

(assert (=> b!1530180 (= lt!662707 (select (arr!49050 a!2804) j!70))))

(declare-fun lt!662706 () Unit!51214)

(assert (=> b!1530180 (= lt!662706 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!662707 j!70))))

(assert (=> b!1530180 (arrayContainsKey!0 a!2804 lt!662707 #b00000000000000000000000000000000)))

(declare-fun lt!662705 () Unit!51214)

(assert (=> b!1530180 (= lt!662705 lt!662706)))

(declare-fun res!1047776 () Bool)

(assert (=> b!1530180 (= res!1047776 (= (seekEntryOrOpen!0 (select (arr!49050 a!2804) j!70) a!2804 mask!2512) (Found!13215 j!70)))))

(assert (=> b!1530180 (=> (not res!1047776) (not e!852669))))

(declare-fun b!1530181 () Bool)

(declare-fun call!68500 () Bool)

(assert (=> b!1530181 (= e!852670 call!68500)))

(declare-fun b!1530182 () Bool)

(assert (=> b!1530182 (= e!852669 call!68500)))

(declare-fun b!1530183 () Bool)

(declare-fun e!852671 () Bool)

(assert (=> b!1530183 (= e!852671 e!852670)))

(declare-fun c!140757 () Bool)

(assert (=> b!1530183 (= c!140757 (validKeyInArray!0 (select (arr!49050 a!2804) j!70)))))

(declare-fun bm!68497 () Bool)

(assert (=> bm!68497 (= call!68500 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun d!159773 () Bool)

(declare-fun res!1047777 () Bool)

(assert (=> d!159773 (=> res!1047777 e!852671)))

(assert (=> d!159773 (= res!1047777 (bvsge j!70 (size!49600 a!2804)))))

(assert (=> d!159773 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!852671)))

(assert (= (and d!159773 (not res!1047777)) b!1530183))

(assert (= (and b!1530183 c!140757) b!1530180))

(assert (= (and b!1530183 (not c!140757)) b!1530181))

(assert (= (and b!1530180 res!1047776) b!1530182))

(assert (= (or b!1530182 b!1530181) bm!68497))

(assert (=> b!1530180 m!1412939))

(declare-fun m!1413087 () Bool)

(assert (=> b!1530180 m!1413087))

(declare-fun m!1413089 () Bool)

(assert (=> b!1530180 m!1413089))

(assert (=> b!1530180 m!1412939))

(declare-fun m!1413091 () Bool)

(assert (=> b!1530180 m!1413091))

(assert (=> b!1530183 m!1412939))

(assert (=> b!1530183 m!1412939))

(assert (=> b!1530183 m!1412955))

(declare-fun m!1413093 () Bool)

(assert (=> bm!68497 m!1413093))

(assert (=> b!1529973 d!159773))

(declare-fun d!159775 () Bool)

(assert (=> d!159775 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!662714 () Unit!51214)

(declare-fun choose!38 (array!101650 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51214)

(assert (=> d!159775 (= lt!662714 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!159775 (validMask!0 mask!2512)))

(assert (=> d!159775 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!662714)))

(declare-fun bs!43874 () Bool)

(assert (= bs!43874 d!159775))

(assert (=> bs!43874 m!1412953))

(declare-fun m!1413101 () Bool)

(assert (=> bs!43874 m!1413101))

(assert (=> bs!43874 m!1412961))

(assert (=> b!1529973 d!159775))

(declare-fun d!159785 () Bool)

(assert (=> d!159785 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!130300 d!159785))

(declare-fun d!159797 () Bool)

(assert (=> d!159797 (= (array_inv!38078 a!2804) (bvsge (size!49600 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!130300 d!159797))

(declare-fun b!1530230 () Bool)

(declare-fun e!852704 () Bool)

(declare-fun e!852708 () Bool)

(assert (=> b!1530230 (= e!852704 e!852708)))

(declare-fun res!1047800 () Bool)

(declare-fun lt!662733 () SeekEntryResult!13215)

(assert (=> b!1530230 (= res!1047800 (and ((_ is Intermediate!13215) lt!662733) (not (undefined!14027 lt!662733)) (bvslt (x!136934 lt!662733) #b01111111111111111111111111111110) (bvsge (x!136934 lt!662733) #b00000000000000000000000000000000) (bvsge (x!136934 lt!662733) #b00000000000000000000000000000000)))))

(assert (=> b!1530230 (=> (not res!1047800) (not e!852708))))

(declare-fun d!159799 () Bool)

(assert (=> d!159799 e!852704))

(declare-fun c!140773 () Bool)

(assert (=> d!159799 (= c!140773 (and ((_ is Intermediate!13215) lt!662733) (undefined!14027 lt!662733)))))

(declare-fun e!852706 () SeekEntryResult!13215)

(assert (=> d!159799 (= lt!662733 e!852706)))

(declare-fun c!140771 () Bool)

(assert (=> d!159799 (= c!140771 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!662734 () (_ BitVec 64))

(assert (=> d!159799 (= lt!662734 (select (arr!49050 a!2804) (toIndex!0 (select (arr!49050 a!2804) j!70) mask!2512)))))

(assert (=> d!159799 (validMask!0 mask!2512)))

(assert (=> d!159799 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49050 a!2804) j!70) mask!2512) (select (arr!49050 a!2804) j!70) a!2804 mask!2512) lt!662733)))

(declare-fun e!852705 () SeekEntryResult!13215)

(declare-fun b!1530231 () Bool)

(assert (=> b!1530231 (= e!852705 (Intermediate!13215 false (toIndex!0 (select (arr!49050 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1530232 () Bool)

(assert (=> b!1530232 (= e!852704 (bvsge (x!136934 lt!662733) #b01111111111111111111111111111110))))

(declare-fun b!1530233 () Bool)

(assert (=> b!1530233 (and (bvsge (index!55257 lt!662733) #b00000000000000000000000000000000) (bvslt (index!55257 lt!662733) (size!49600 a!2804)))))

(declare-fun e!852707 () Bool)

(assert (=> b!1530233 (= e!852707 (= (select (arr!49050 a!2804) (index!55257 lt!662733)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1530234 () Bool)

(assert (=> b!1530234 (= e!852705 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!49050 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!49050 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1530235 () Bool)

(assert (=> b!1530235 (= e!852706 (Intermediate!13215 true (toIndex!0 (select (arr!49050 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1530236 () Bool)

(assert (=> b!1530236 (and (bvsge (index!55257 lt!662733) #b00000000000000000000000000000000) (bvslt (index!55257 lt!662733) (size!49600 a!2804)))))

(declare-fun res!1047799 () Bool)

(assert (=> b!1530236 (= res!1047799 (= (select (arr!49050 a!2804) (index!55257 lt!662733)) (select (arr!49050 a!2804) j!70)))))

(assert (=> b!1530236 (=> res!1047799 e!852707)))

(assert (=> b!1530236 (= e!852708 e!852707)))

(declare-fun b!1530237 () Bool)

(assert (=> b!1530237 (and (bvsge (index!55257 lt!662733) #b00000000000000000000000000000000) (bvslt (index!55257 lt!662733) (size!49600 a!2804)))))

(declare-fun res!1047798 () Bool)

(assert (=> b!1530237 (= res!1047798 (= (select (arr!49050 a!2804) (index!55257 lt!662733)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1530237 (=> res!1047798 e!852707)))

(declare-fun b!1530238 () Bool)

(assert (=> b!1530238 (= e!852706 e!852705)))

(declare-fun c!140772 () Bool)

(assert (=> b!1530238 (= c!140772 (or (= lt!662734 (select (arr!49050 a!2804) j!70)) (= (bvadd lt!662734 lt!662734) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!159799 c!140771) b!1530235))

(assert (= (and d!159799 (not c!140771)) b!1530238))

(assert (= (and b!1530238 c!140772) b!1530231))

(assert (= (and b!1530238 (not c!140772)) b!1530234))

(assert (= (and d!159799 c!140773) b!1530232))

(assert (= (and d!159799 (not c!140773)) b!1530230))

(assert (= (and b!1530230 res!1047800) b!1530236))

(assert (= (and b!1530236 (not res!1047799)) b!1530237))

(assert (= (and b!1530237 (not res!1047798)) b!1530233))

(assert (=> d!159799 m!1412943))

(declare-fun m!1413133 () Bool)

(assert (=> d!159799 m!1413133))

(assert (=> d!159799 m!1412961))

(declare-fun m!1413135 () Bool)

(assert (=> b!1530236 m!1413135))

(assert (=> b!1530237 m!1413135))

(assert (=> b!1530233 m!1413135))

(assert (=> b!1530234 m!1412943))

(declare-fun m!1413137 () Bool)

(assert (=> b!1530234 m!1413137))

(assert (=> b!1530234 m!1413137))

(assert (=> b!1530234 m!1412939))

(declare-fun m!1413139 () Bool)

(assert (=> b!1530234 m!1413139))

(assert (=> b!1529972 d!159799))

(declare-fun d!159803 () Bool)

(declare-fun lt!662742 () (_ BitVec 32))

(declare-fun lt!662741 () (_ BitVec 32))

(assert (=> d!159803 (= lt!662742 (bvmul (bvxor lt!662741 (bvlshr lt!662741 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159803 (= lt!662741 ((_ extract 31 0) (bvand (bvxor (select (arr!49050 a!2804) j!70) (bvlshr (select (arr!49050 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159803 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1047731 (let ((h!36967 ((_ extract 31 0) (bvand (bvxor (select (arr!49050 a!2804) j!70) (bvlshr (select (arr!49050 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136937 (bvmul (bvxor h!36967 (bvlshr h!36967 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136937 (bvlshr x!136937 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1047731 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1047731 #b00000000000000000000000000000000))))))

(assert (=> d!159803 (= (toIndex!0 (select (arr!49050 a!2804) j!70) mask!2512) (bvand (bvxor lt!662742 (bvlshr lt!662742 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1529972 d!159803))

(check-sat (not bm!68496) (not d!159761) (not b!1530034) (not d!159743) (not b!1530183) (not d!159799) (not bm!68497) (not b!1530131) (not d!159737) (not b!1530043) (not b!1530179) (not b!1530086) (not b!1530127) (not d!159775) (not d!159751) (not bm!68493) (not b!1530234) (not b!1530129) (not b!1530089) (not b!1530180))
(check-sat)
