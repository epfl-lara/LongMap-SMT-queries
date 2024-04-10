; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130448 () Bool)

(assert start!130448)

(declare-fun b!1531034 () Bool)

(declare-fun e!853113 () Bool)

(declare-fun e!853110 () Bool)

(assert (=> b!1531034 (= e!853113 (not e!853110))))

(declare-fun res!1048379 () Bool)

(assert (=> b!1531034 (=> res!1048379 e!853110)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((array!101684 0))(
  ( (array!101685 (arr!49064 (Array (_ BitVec 32) (_ BitVec 64))) (size!49614 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101684)

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1531034 (= res!1048379 (or (not (= (select (arr!49064 a!2804) j!70) (select (store (arr!49064 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!853112 () Bool)

(assert (=> b!1531034 e!853112))

(declare-fun res!1048378 () Bool)

(assert (=> b!1531034 (=> (not res!1048378) (not e!853112))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101684 (_ BitVec 32)) Bool)

(assert (=> b!1531034 (= res!1048378 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51242 0))(
  ( (Unit!51243) )
))
(declare-fun lt!663064 () Unit!51242)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101684 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51242)

(assert (=> b!1531034 (= lt!663064 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1531035 () Bool)

(declare-fun res!1048387 () Bool)

(declare-fun e!853109 () Bool)

(assert (=> b!1531035 (=> (not res!1048387) (not e!853109))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1531035 (= res!1048387 (validKeyInArray!0 (select (arr!49064 a!2804) j!70)))))

(declare-fun res!1048383 () Bool)

(assert (=> start!130448 (=> (not res!1048383) (not e!853109))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130448 (= res!1048383 (validMask!0 mask!2512))))

(assert (=> start!130448 e!853109))

(assert (=> start!130448 true))

(declare-fun array_inv!38092 (array!101684) Bool)

(assert (=> start!130448 (array_inv!38092 a!2804)))

(declare-fun b!1531036 () Bool)

(declare-fun res!1048376 () Bool)

(assert (=> b!1531036 (=> (not res!1048376) (not e!853109))))

(assert (=> b!1531036 (= res!1048376 (and (= (size!49614 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49614 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49614 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1531037 () Bool)

(declare-datatypes ((SeekEntryResult!13229 0))(
  ( (MissingZero!13229 (index!55311 (_ BitVec 32))) (Found!13229 (index!55312 (_ BitVec 32))) (Intermediate!13229 (undefined!14041 Bool) (index!55313 (_ BitVec 32)) (x!137006 (_ BitVec 32))) (Undefined!13229) (MissingVacant!13229 (index!55314 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101684 (_ BitVec 32)) SeekEntryResult!13229)

(assert (=> b!1531037 (= e!853112 (= (seekEntry!0 (select (arr!49064 a!2804) j!70) a!2804 mask!2512) (Found!13229 j!70)))))

(declare-fun b!1531038 () Bool)

(declare-fun res!1048377 () Bool)

(assert (=> b!1531038 (=> (not res!1048377) (not e!853109))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1531038 (= res!1048377 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49614 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49614 a!2804))))))

(declare-fun b!1531039 () Bool)

(declare-fun res!1048386 () Bool)

(assert (=> b!1531039 (=> (not res!1048386) (not e!853109))))

(assert (=> b!1531039 (= res!1048386 (validKeyInArray!0 (select (arr!49064 a!2804) i!961)))))

(declare-fun b!1531040 () Bool)

(declare-fun res!1048375 () Bool)

(assert (=> b!1531040 (=> (not res!1048375) (not e!853109))))

(assert (=> b!1531040 (= res!1048375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1531041 () Bool)

(declare-fun res!1048385 () Bool)

(assert (=> b!1531041 (=> (not res!1048385) (not e!853113))))

(declare-fun lt!663066 () SeekEntryResult!13229)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101684 (_ BitVec 32)) SeekEntryResult!13229)

(assert (=> b!1531041 (= res!1048385 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49064 a!2804) j!70) a!2804 mask!2512) lt!663066))))

(declare-fun b!1531042 () Bool)

(assert (=> b!1531042 (= e!853109 e!853113)))

(declare-fun res!1048382 () Bool)

(assert (=> b!1531042 (=> (not res!1048382) (not e!853113))))

(declare-fun lt!663065 () SeekEntryResult!13229)

(assert (=> b!1531042 (= res!1048382 (= lt!663065 lt!663066))))

(assert (=> b!1531042 (= lt!663066 (Intermediate!13229 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531042 (= lt!663065 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49064 a!2804) j!70) mask!2512) (select (arr!49064 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1531043 () Bool)

(declare-fun res!1048380 () Bool)

(assert (=> b!1531043 (=> (not res!1048380) (not e!853113))))

(assert (=> b!1531043 (= res!1048380 (= lt!663065 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49064 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49064 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101685 (store (arr!49064 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49614 a!2804)) mask!2512)))))

(declare-fun b!1531044 () Bool)

(declare-fun res!1048381 () Bool)

(assert (=> b!1531044 (=> (not res!1048381) (not e!853109))))

(declare-datatypes ((List!35547 0))(
  ( (Nil!35544) (Cons!35543 (h!36985 (_ BitVec 64)) (t!50241 List!35547)) )
))
(declare-fun arrayNoDuplicates!0 (array!101684 (_ BitVec 32) List!35547) Bool)

(assert (=> b!1531044 (= res!1048381 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35544))))

(declare-fun lt!663067 () (_ BitVec 32))

(declare-fun b!1531045 () Bool)

(declare-fun e!853114 () Bool)

(assert (=> b!1531045 (= e!853114 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!663067 (select (arr!49064 a!2804) j!70) a!2804 mask!2512) lt!663066))))

(declare-fun b!1531046 () Bool)

(assert (=> b!1531046 (= e!853110 e!853114)))

(declare-fun res!1048384 () Bool)

(assert (=> b!1531046 (=> res!1048384 e!853114)))

(assert (=> b!1531046 (= res!1048384 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!663067 #b00000000000000000000000000000000) (bvsge lt!663067 (size!49614 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531046 (= lt!663067 (nextIndex!0 index!487 x!534 mask!2512))))

(assert (= (and start!130448 res!1048383) b!1531036))

(assert (= (and b!1531036 res!1048376) b!1531039))

(assert (= (and b!1531039 res!1048386) b!1531035))

(assert (= (and b!1531035 res!1048387) b!1531040))

(assert (= (and b!1531040 res!1048375) b!1531044))

(assert (= (and b!1531044 res!1048381) b!1531038))

(assert (= (and b!1531038 res!1048377) b!1531042))

(assert (= (and b!1531042 res!1048382) b!1531041))

(assert (= (and b!1531041 res!1048385) b!1531043))

(assert (= (and b!1531043 res!1048380) b!1531034))

(assert (= (and b!1531034 res!1048378) b!1531037))

(assert (= (and b!1531034 (not res!1048379)) b!1531046))

(assert (= (and b!1531046 (not res!1048384)) b!1531045))

(declare-fun m!1413807 () Bool)

(assert (=> start!130448 m!1413807))

(declare-fun m!1413809 () Bool)

(assert (=> start!130448 m!1413809))

(declare-fun m!1413811 () Bool)

(assert (=> b!1531042 m!1413811))

(assert (=> b!1531042 m!1413811))

(declare-fun m!1413813 () Bool)

(assert (=> b!1531042 m!1413813))

(assert (=> b!1531042 m!1413813))

(assert (=> b!1531042 m!1413811))

(declare-fun m!1413815 () Bool)

(assert (=> b!1531042 m!1413815))

(declare-fun m!1413817 () Bool)

(assert (=> b!1531039 m!1413817))

(assert (=> b!1531039 m!1413817))

(declare-fun m!1413819 () Bool)

(assert (=> b!1531039 m!1413819))

(declare-fun m!1413821 () Bool)

(assert (=> b!1531043 m!1413821))

(declare-fun m!1413823 () Bool)

(assert (=> b!1531043 m!1413823))

(assert (=> b!1531043 m!1413823))

(declare-fun m!1413825 () Bool)

(assert (=> b!1531043 m!1413825))

(assert (=> b!1531043 m!1413825))

(assert (=> b!1531043 m!1413823))

(declare-fun m!1413827 () Bool)

(assert (=> b!1531043 m!1413827))

(declare-fun m!1413829 () Bool)

(assert (=> b!1531046 m!1413829))

(assert (=> b!1531035 m!1413811))

(assert (=> b!1531035 m!1413811))

(declare-fun m!1413831 () Bool)

(assert (=> b!1531035 m!1413831))

(assert (=> b!1531037 m!1413811))

(assert (=> b!1531037 m!1413811))

(declare-fun m!1413833 () Bool)

(assert (=> b!1531037 m!1413833))

(declare-fun m!1413835 () Bool)

(assert (=> b!1531044 m!1413835))

(assert (=> b!1531041 m!1413811))

(assert (=> b!1531041 m!1413811))

(declare-fun m!1413837 () Bool)

(assert (=> b!1531041 m!1413837))

(assert (=> b!1531034 m!1413811))

(declare-fun m!1413839 () Bool)

(assert (=> b!1531034 m!1413839))

(assert (=> b!1531034 m!1413821))

(assert (=> b!1531034 m!1413823))

(declare-fun m!1413841 () Bool)

(assert (=> b!1531034 m!1413841))

(assert (=> b!1531045 m!1413811))

(assert (=> b!1531045 m!1413811))

(declare-fun m!1413843 () Bool)

(assert (=> b!1531045 m!1413843))

(declare-fun m!1413845 () Bool)

(assert (=> b!1531040 m!1413845))

(push 1)

(assert (not start!130448))

(assert (not b!1531046))

(assert (not b!1531040))

(assert (not b!1531041))

(assert (not b!1531043))

(assert (not b!1531042))

(assert (not b!1531037))

(assert (not b!1531044))

(assert (not b!1531045))

(assert (not b!1531034))

(assert (not b!1531039))

(assert (not b!1531035))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1531222 () Bool)

(declare-fun e!853209 () Bool)

(declare-fun e!853211 () Bool)

(assert (=> b!1531222 (= e!853209 e!853211)))

(declare-fun res!1048504 () Bool)

(declare-fun lt!663131 () SeekEntryResult!13229)

(assert (=> b!1531222 (= res!1048504 (and (is-Intermediate!13229 lt!663131) (not (undefined!14041 lt!663131)) (bvslt (x!137006 lt!663131) #b01111111111111111111111111111110) (bvsge (x!137006 lt!663131) #b00000000000000000000000000000000) (bvsge (x!137006 lt!663131) #b00000000000000000000000000000000)))))

(assert (=> b!1531222 (=> (not res!1048504) (not e!853211))))

(declare-fun b!1531223 () Bool)

(assert (=> b!1531223 (= e!853209 (bvsge (x!137006 lt!663131) #b01111111111111111111111111111110))))

(declare-fun e!853208 () SeekEntryResult!13229)

(declare-fun b!1531224 () Bool)

(assert (=> b!1531224 (= e!853208 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!49064 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (store (arr!49064 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101685 (store (arr!49064 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49614 a!2804)) mask!2512))))

(declare-fun d!159931 () Bool)

(assert (=> d!159931 e!853209))

(declare-fun c!140919 () Bool)

(assert (=> d!159931 (= c!140919 (and (is-Intermediate!13229 lt!663131) (undefined!14041 lt!663131)))))

(declare-fun e!853212 () SeekEntryResult!13229)

(assert (=> d!159931 (= lt!663131 e!853212)))

(declare-fun c!140918 () Bool)

(assert (=> d!159931 (= c!140918 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!663130 () (_ BitVec 64))

(assert (=> d!159931 (= lt!663130 (select (arr!49064 (array!101685 (store (arr!49064 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49614 a!2804))) (toIndex!0 (select (store (arr!49064 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512)))))

(assert (=> d!159931 (validMask!0 mask!2512)))

(assert (=> d!159931 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49064 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49064 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101685 (store (arr!49064 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49614 a!2804)) mask!2512) lt!663131)))

(declare-fun b!1531225 () Bool)

(assert (=> b!1531225 (= e!853212 e!853208)))

(declare-fun c!140917 () Bool)

(assert (=> b!1531225 (= c!140917 (or (= lt!663130 (select (store (arr!49064 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!663130 lt!663130) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1531226 () Bool)

(assert (=> b!1531226 (= e!853208 (Intermediate!13229 false (toIndex!0 (select (store (arr!49064 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1531227 () Bool)

(assert (=> b!1531227 (and (bvsge (index!55313 lt!663131) #b00000000000000000000000000000000) (bvslt (index!55313 lt!663131) (size!49614 (array!101685 (store (arr!49064 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49614 a!2804)))))))

(declare-fun res!1048503 () Bool)

(assert (=> b!1531227 (= res!1048503 (= (select (arr!49064 (array!101685 (store (arr!49064 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49614 a!2804))) (index!55313 lt!663131)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!853210 () Bool)

(assert (=> b!1531227 (=> res!1048503 e!853210)))

(declare-fun b!1531228 () Bool)

(assert (=> b!1531228 (= e!853212 (Intermediate!13229 true (toIndex!0 (select (store (arr!49064 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1531229 () Bool)

(assert (=> b!1531229 (and (bvsge (index!55313 lt!663131) #b00000000000000000000000000000000) (bvslt (index!55313 lt!663131) (size!49614 (array!101685 (store (arr!49064 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49614 a!2804)))))))

(assert (=> b!1531229 (= e!853210 (= (select (arr!49064 (array!101685 (store (arr!49064 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49614 a!2804))) (index!55313 lt!663131)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1531230 () Bool)

(assert (=> b!1531230 (and (bvsge (index!55313 lt!663131) #b00000000000000000000000000000000) (bvslt (index!55313 lt!663131) (size!49614 (array!101685 (store (arr!49064 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49614 a!2804)))))))

(declare-fun res!1048502 () Bool)

(assert (=> b!1531230 (= res!1048502 (= (select (arr!49064 (array!101685 (store (arr!49064 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49614 a!2804))) (index!55313 lt!663131)) (select (store (arr!49064 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(assert (=> b!1531230 (=> res!1048502 e!853210)))

(assert (=> b!1531230 (= e!853211 e!853210)))

(assert (= (and d!159931 c!140918) b!1531228))

(assert (= (and d!159931 (not c!140918)) b!1531225))

(assert (= (and b!1531225 c!140917) b!1531226))

(assert (= (and b!1531225 (not c!140917)) b!1531224))

(assert (= (and d!159931 c!140919) b!1531223))

(assert (= (and d!159931 (not c!140919)) b!1531222))

(assert (= (and b!1531222 res!1048504) b!1531230))

(assert (= (and b!1531230 (not res!1048502)) b!1531227))

(assert (= (and b!1531227 (not res!1048503)) b!1531229))

(declare-fun m!1413973 () Bool)

(assert (=> b!1531227 m!1413973))

(assert (=> b!1531224 m!1413825))

(declare-fun m!1413975 () Bool)

(assert (=> b!1531224 m!1413975))

(assert (=> b!1531224 m!1413975))

(assert (=> b!1531224 m!1413823))

(declare-fun m!1413977 () Bool)

(assert (=> b!1531224 m!1413977))

(assert (=> b!1531229 m!1413973))

(assert (=> b!1531230 m!1413973))

(assert (=> d!159931 m!1413825))

(declare-fun m!1413979 () Bool)

(assert (=> d!159931 m!1413979))

(assert (=> d!159931 m!1413807))

(assert (=> b!1531043 d!159931))

(declare-fun d!159957 () Bool)

(declare-fun lt!663144 () (_ BitVec 32))

(declare-fun lt!663143 () (_ BitVec 32))

(assert (=> d!159957 (= lt!663144 (bvmul (bvxor lt!663143 (bvlshr lt!663143 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159957 (= lt!663143 ((_ extract 31 0) (bvand (bvxor (select (store (arr!49064 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!49064 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159957 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1048508 (let ((h!36989 ((_ extract 31 0) (bvand (bvxor (select (store (arr!49064 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!49064 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!137013 (bvmul (bvxor h!36989 (bvlshr h!36989 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!137013 (bvlshr x!137013 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1048508 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1048508 #b00000000000000000000000000000000))))))

(assert (=> d!159957 (= (toIndex!0 (select (store (arr!49064 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!663144 (bvlshr lt!663144 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1531043 d!159957))

(declare-fun bm!68536 () Bool)

(declare-fun call!68539 () Bool)

(declare-fun c!140937 () Bool)

(assert (=> bm!68536 (= call!68539 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!140937 (Cons!35543 (select (arr!49064 a!2804) #b00000000000000000000000000000000) Nil!35544) Nil!35544)))))

(declare-fun b!1531277 () Bool)

(declare-fun e!853241 () Bool)

(declare-fun contains!10003 (List!35547 (_ BitVec 64)) Bool)

(assert (=> b!1531277 (= e!853241 (contains!10003 Nil!35544 (select (arr!49064 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1531278 () Bool)

(declare-fun e!853240 () Bool)

(assert (=> b!1531278 (= e!853240 call!68539)))

(declare-fun b!1531279 () Bool)

(declare-fun e!853243 () Bool)

(declare-fun e!853242 () Bool)

(assert (=> b!1531279 (= e!853243 e!853242)))

(declare-fun res!1048520 () Bool)

(assert (=> b!1531279 (=> (not res!1048520) (not e!853242))))

(assert (=> b!1531279 (= res!1048520 (not e!853241))))

(declare-fun res!1048519 () Bool)

(assert (=> b!1531279 (=> (not res!1048519) (not e!853241))))

(assert (=> b!1531279 (= res!1048519 (validKeyInArray!0 (select (arr!49064 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1531280 () Bool)

(assert (=> b!1531280 (= e!853242 e!853240)))

(assert (=> b!1531280 (= c!140937 (validKeyInArray!0 (select (arr!49064 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!159963 () Bool)

(declare-fun res!1048521 () Bool)

(assert (=> d!159963 (=> res!1048521 e!853243)))

(assert (=> d!159963 (= res!1048521 (bvsge #b00000000000000000000000000000000 (size!49614 a!2804)))))

(assert (=> d!159963 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35544) e!853243)))

(declare-fun b!1531281 () Bool)

(assert (=> b!1531281 (= e!853240 call!68539)))

(assert (= (and d!159963 (not res!1048521)) b!1531279))

(assert (= (and b!1531279 res!1048519) b!1531277))

(assert (= (and b!1531279 res!1048520) b!1531280))

(assert (= (and b!1531280 c!140937) b!1531281))

(assert (= (and b!1531280 (not c!140937)) b!1531278))

(assert (= (or b!1531281 b!1531278) bm!68536))

(declare-fun m!1414003 () Bool)

(assert (=> bm!68536 m!1414003))

(declare-fun m!1414005 () Bool)

(assert (=> bm!68536 m!1414005))

(assert (=> b!1531277 m!1414003))

(assert (=> b!1531277 m!1414003))

(declare-fun m!1414007 () Bool)

(assert (=> b!1531277 m!1414007))

(assert (=> b!1531279 m!1414003))

(assert (=> b!1531279 m!1414003))

(declare-fun m!1414009 () Bool)

(assert (=> b!1531279 m!1414009))

(assert (=> b!1531280 m!1414003))

(assert (=> b!1531280 m!1414003))

(assert (=> b!1531280 m!1414009))

(assert (=> b!1531044 d!159963))

(declare-fun d!159971 () Bool)

(assert (=> d!159971 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!130448 d!159971))

(declare-fun d!159977 () Bool)

(assert (=> d!159977 (= (array_inv!38092 a!2804) (bvsge (size!49614 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!130448 d!159977))

(declare-fun b!1531330 () Bool)

(declare-fun e!853280 () Bool)

(declare-fun e!853279 () Bool)

(assert (=> b!1531330 (= e!853280 e!853279)))

(declare-fun c!140950 () Bool)

(assert (=> b!1531330 (= c!140950 (validKeyInArray!0 (select (arr!49064 a!2804) j!70)))))

(declare-fun bm!68546 () Bool)

(declare-fun call!68549 () Bool)

(assert (=> bm!68546 (= call!68549 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1531331 () Bool)

(declare-fun e!853281 () Bool)

(assert (=> b!1531331 (= e!853281 call!68549)))

(declare-fun b!1531332 () Bool)

(assert (=> b!1531332 (= e!853279 e!853281)))

(declare-fun lt!663187 () (_ BitVec 64))

(assert (=> b!1531332 (= lt!663187 (select (arr!49064 a!2804) j!70))))

(declare-fun lt!663188 () Unit!51242)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101684 (_ BitVec 64) (_ BitVec 32)) Unit!51242)

(assert (=> b!1531332 (= lt!663188 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!663187 j!70))))

(declare-fun arrayContainsKey!0 (array!101684 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1531332 (arrayContainsKey!0 a!2804 lt!663187 #b00000000000000000000000000000000)))

(declare-fun lt!663186 () Unit!51242)

(assert (=> b!1531332 (= lt!663186 lt!663188)))

(declare-fun res!1048546 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101684 (_ BitVec 32)) SeekEntryResult!13229)

(assert (=> b!1531332 (= res!1048546 (= (seekEntryOrOpen!0 (select (arr!49064 a!2804) j!70) a!2804 mask!2512) (Found!13229 j!70)))))

(assert (=> b!1531332 (=> (not res!1048546) (not e!853281))))

(declare-fun b!1531333 () Bool)

(assert (=> b!1531333 (= e!853279 call!68549)))

(declare-fun d!159979 () Bool)

(declare-fun res!1048547 () Bool)

(assert (=> d!159979 (=> res!1048547 e!853280)))

(assert (=> d!159979 (= res!1048547 (bvsge j!70 (size!49614 a!2804)))))

(assert (=> d!159979 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!853280)))

(assert (= (and d!159979 (not res!1048547)) b!1531330))

(assert (= (and b!1531330 c!140950) b!1531332))

(assert (= (and b!1531330 (not c!140950)) b!1531333))

(assert (= (and b!1531332 res!1048546) b!1531331))

(assert (= (or b!1531331 b!1531333) bm!68546))

(assert (=> b!1531330 m!1413811))

(assert (=> b!1531330 m!1413811))

(assert (=> b!1531330 m!1413831))

(declare-fun m!1414043 () Bool)

(assert (=> bm!68546 m!1414043))

(assert (=> b!1531332 m!1413811))

(declare-fun m!1414045 () Bool)

(assert (=> b!1531332 m!1414045))

(declare-fun m!1414047 () Bool)

(assert (=> b!1531332 m!1414047))

(assert (=> b!1531332 m!1413811))

(declare-fun m!1414049 () Bool)

(assert (=> b!1531332 m!1414049))

(assert (=> b!1531034 d!159979))

(declare-fun d!159987 () Bool)

(assert (=> d!159987 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!663194 () Unit!51242)

(declare-fun choose!38 (array!101684 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51242)

(assert (=> d!159987 (= lt!663194 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!159987 (validMask!0 mask!2512)))

(assert (=> d!159987 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!663194)))

(declare-fun bs!43903 () Bool)

(assert (= bs!43903 d!159987))

(assert (=> bs!43903 m!1413841))

(declare-fun m!1414053 () Bool)

(assert (=> bs!43903 m!1414053))

(assert (=> bs!43903 m!1413807))

(assert (=> b!1531034 d!159987))

(declare-fun b!1531334 () Bool)

(declare-fun e!853283 () Bool)

(declare-fun e!853285 () Bool)

(assert (=> b!1531334 (= e!853283 e!853285)))

(declare-fun res!1048550 () Bool)

(declare-fun lt!663196 () SeekEntryResult!13229)

(assert (=> b!1531334 (= res!1048550 (and (is-Intermediate!13229 lt!663196) (not (undefined!14041 lt!663196)) (bvslt (x!137006 lt!663196) #b01111111111111111111111111111110) (bvsge (x!137006 lt!663196) #b00000000000000000000000000000000) (bvsge (x!137006 lt!663196) (bvadd #b00000000000000000000000000000001 x!534))))))

(assert (=> b!1531334 (=> (not res!1048550) (not e!853285))))

(declare-fun b!1531335 () Bool)

(assert (=> b!1531335 (= e!853283 (bvsge (x!137006 lt!663196) #b01111111111111111111111111111110))))

(declare-fun b!1531336 () Bool)

(declare-fun e!853282 () SeekEntryResult!13229)

(assert (=> b!1531336 (= e!853282 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534 #b00000000000000000000000000000001) (nextIndex!0 lt!663067 (bvadd #b00000000000000000000000000000001 x!534) mask!2512) (select (arr!49064 a!2804) j!70) a!2804 mask!2512))))

(declare-fun d!159995 () Bool)

(assert (=> d!159995 e!853283))

(declare-fun c!140953 () Bool)

(assert (=> d!159995 (= c!140953 (and (is-Intermediate!13229 lt!663196) (undefined!14041 lt!663196)))))

(declare-fun e!853286 () SeekEntryResult!13229)

(assert (=> d!159995 (= lt!663196 e!853286)))

(declare-fun c!140952 () Bool)

(assert (=> d!159995 (= c!140952 (bvsge (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110))))

(declare-fun lt!663195 () (_ BitVec 64))

(assert (=> d!159995 (= lt!663195 (select (arr!49064 a!2804) lt!663067))))

(assert (=> d!159995 (validMask!0 mask!2512)))

(assert (=> d!159995 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!663067 (select (arr!49064 a!2804) j!70) a!2804 mask!2512) lt!663196)))

(declare-fun b!1531337 () Bool)

(assert (=> b!1531337 (= e!853286 e!853282)))

(declare-fun c!140951 () Bool)

(assert (=> b!1531337 (= c!140951 (or (= lt!663195 (select (arr!49064 a!2804) j!70)) (= (bvadd lt!663195 lt!663195) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1531338 () Bool)

(assert (=> b!1531338 (= e!853282 (Intermediate!13229 false lt!663067 (bvadd #b00000000000000000000000000000001 x!534)))))

(declare-fun b!1531339 () Bool)

(assert (=> b!1531339 (and (bvsge (index!55313 lt!663196) #b00000000000000000000000000000000) (bvslt (index!55313 lt!663196) (size!49614 a!2804)))))

(declare-fun res!1048549 () Bool)

(assert (=> b!1531339 (= res!1048549 (= (select (arr!49064 a!2804) (index!55313 lt!663196)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!853284 () Bool)

(assert (=> b!1531339 (=> res!1048549 e!853284)))

(declare-fun b!1531340 () Bool)

(assert (=> b!1531340 (= e!853286 (Intermediate!13229 true lt!663067 (bvadd #b00000000000000000000000000000001 x!534)))))

(declare-fun b!1531341 () Bool)

(assert (=> b!1531341 (and (bvsge (index!55313 lt!663196) #b00000000000000000000000000000000) (bvslt (index!55313 lt!663196) (size!49614 a!2804)))))

(assert (=> b!1531341 (= e!853284 (= (select (arr!49064 a!2804) (index!55313 lt!663196)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1531342 () Bool)

(assert (=> b!1531342 (and (bvsge (index!55313 lt!663196) #b00000000000000000000000000000000) (bvslt (index!55313 lt!663196) (size!49614 a!2804)))))

(declare-fun res!1048548 () Bool)

(assert (=> b!1531342 (= res!1048548 (= (select (arr!49064 a!2804) (index!55313 lt!663196)) (select (arr!49064 a!2804) j!70)))))

(assert (=> b!1531342 (=> res!1048548 e!853284)))

(assert (=> b!1531342 (= e!853285 e!853284)))

(assert (= (and d!159995 c!140952) b!1531340))

(assert (= (and d!159995 (not c!140952)) b!1531337))

(assert (= (and b!1531337 c!140951) b!1531338))

(assert (= (and b!1531337 (not c!140951)) b!1531336))

(assert (= (and d!159995 c!140953) b!1531335))

(assert (= (and d!159995 (not c!140953)) b!1531334))

(assert (= (and b!1531334 res!1048550) b!1531342))

(assert (= (and b!1531342 (not res!1048548)) b!1531339))

(assert (= (and b!1531339 (not res!1048549)) b!1531341))

(declare-fun m!1414055 () Bool)

(assert (=> b!1531339 m!1414055))

(declare-fun m!1414057 () Bool)

(assert (=> b!1531336 m!1414057))

(assert (=> b!1531336 m!1414057))

(assert (=> b!1531336 m!1413811))

(declare-fun m!1414059 () Bool)

(assert (=> b!1531336 m!1414059))

(assert (=> b!1531341 m!1414055))

(assert (=> b!1531342 m!1414055))

(declare-fun m!1414061 () Bool)

(assert (=> d!159995 m!1414061))

(assert (=> d!159995 m!1413807))

(assert (=> b!1531045 d!159995))

(declare-fun b!1531343 () Bool)

(declare-fun e!853288 () Bool)

(declare-fun e!853287 () Bool)

(assert (=> b!1531343 (= e!853288 e!853287)))

(declare-fun c!140954 () Bool)

(assert (=> b!1531343 (= c!140954 (validKeyInArray!0 (select (arr!49064 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68547 () Bool)

(declare-fun call!68550 () Bool)

(assert (=> bm!68547 (= call!68550 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1531344 () Bool)

(declare-fun e!853289 () Bool)

(assert (=> b!1531344 (= e!853289 call!68550)))

(declare-fun b!1531345 () Bool)

(assert (=> b!1531345 (= e!853287 e!853289)))

(declare-fun lt!663198 () (_ BitVec 64))

(assert (=> b!1531345 (= lt!663198 (select (arr!49064 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!663199 () Unit!51242)

(assert (=> b!1531345 (= lt!663199 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!663198 #b00000000000000000000000000000000))))

(assert (=> b!1531345 (arrayContainsKey!0 a!2804 lt!663198 #b00000000000000000000000000000000)))

(declare-fun lt!663197 () Unit!51242)

(assert (=> b!1531345 (= lt!663197 lt!663199)))

(declare-fun res!1048551 () Bool)

(assert (=> b!1531345 (= res!1048551 (= (seekEntryOrOpen!0 (select (arr!49064 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13229 #b00000000000000000000000000000000)))))

(assert (=> b!1531345 (=> (not res!1048551) (not e!853289))))

(declare-fun b!1531346 () Bool)

(assert (=> b!1531346 (= e!853287 call!68550)))

(declare-fun d!159997 () Bool)

(declare-fun res!1048552 () Bool)

(assert (=> d!159997 (=> res!1048552 e!853288)))

(assert (=> d!159997 (= res!1048552 (bvsge #b00000000000000000000000000000000 (size!49614 a!2804)))))

(assert (=> d!159997 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!853288)))

(assert (= (and d!159997 (not res!1048552)) b!1531343))

(assert (= (and b!1531343 c!140954) b!1531345))

(assert (= (and b!1531343 (not c!140954)) b!1531346))

(assert (= (and b!1531345 res!1048551) b!1531344))

(assert (= (or b!1531344 b!1531346) bm!68547))

(assert (=> b!1531343 m!1414003))

(assert (=> b!1531343 m!1414003))

(assert (=> b!1531343 m!1414009))

(declare-fun m!1414063 () Bool)

(assert (=> bm!68547 m!1414063))

(assert (=> b!1531345 m!1414003))

(declare-fun m!1414065 () Bool)

(assert (=> b!1531345 m!1414065))

(declare-fun m!1414067 () Bool)

(assert (=> b!1531345 m!1414067))

(assert (=> b!1531345 m!1414003))

(declare-fun m!1414069 () Bool)

(assert (=> b!1531345 m!1414069))

(assert (=> b!1531040 d!159997))

(declare-fun b!1531347 () Bool)

(declare-fun e!853291 () Bool)

(declare-fun e!853293 () Bool)

(assert (=> b!1531347 (= e!853291 e!853293)))

(declare-fun res!1048555 () Bool)

(declare-fun lt!663201 () SeekEntryResult!13229)

(assert (=> b!1531347 (= res!1048555 (and (is-Intermediate!13229 lt!663201) (not (undefined!14041 lt!663201)) (bvslt (x!137006 lt!663201) #b01111111111111111111111111111110) (bvsge (x!137006 lt!663201) #b00000000000000000000000000000000) (bvsge (x!137006 lt!663201) x!534)))))

(assert (=> b!1531347 (=> (not res!1048555) (not e!853293))))

(declare-fun b!1531348 () Bool)

(assert (=> b!1531348 (= e!853291 (bvsge (x!137006 lt!663201) #b01111111111111111111111111111110))))

(declare-fun e!853290 () SeekEntryResult!13229)

(declare-fun b!1531349 () Bool)

(assert (=> b!1531349 (= e!853290 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!49064 a!2804) j!70) a!2804 mask!2512))))

(declare-fun d!159999 () Bool)

(assert (=> d!159999 e!853291))

(declare-fun c!140957 () Bool)

(assert (=> d!159999 (= c!140957 (and (is-Intermediate!13229 lt!663201) (undefined!14041 lt!663201)))))

(declare-fun e!853294 () SeekEntryResult!13229)

(assert (=> d!159999 (= lt!663201 e!853294)))

(declare-fun c!140956 () Bool)

(assert (=> d!159999 (= c!140956 (bvsge x!534 #b01111111111111111111111111111110))))

(declare-fun lt!663200 () (_ BitVec 64))

(assert (=> d!159999 (= lt!663200 (select (arr!49064 a!2804) index!487))))

(assert (=> d!159999 (validMask!0 mask!2512)))

(assert (=> d!159999 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49064 a!2804) j!70) a!2804 mask!2512) lt!663201)))

(declare-fun b!1531350 () Bool)

(assert (=> b!1531350 (= e!853294 e!853290)))

(declare-fun c!140955 () Bool)

(assert (=> b!1531350 (= c!140955 (or (= lt!663200 (select (arr!49064 a!2804) j!70)) (= (bvadd lt!663200 lt!663200) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1531351 () Bool)

(assert (=> b!1531351 (= e!853290 (Intermediate!13229 false index!487 x!534))))

(declare-fun b!1531352 () Bool)

