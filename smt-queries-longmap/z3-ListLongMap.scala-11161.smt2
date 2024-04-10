; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130450 () Bool)

(assert start!130450)

(declare-fun b!1531073 () Bool)

(declare-fun res!1048420 () Bool)

(declare-fun e!853131 () Bool)

(assert (=> b!1531073 (=> (not res!1048420) (not e!853131))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-datatypes ((array!101686 0))(
  ( (array!101687 (arr!49065 (Array (_ BitVec 32) (_ BitVec 64))) (size!49615 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101686)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1531073 (= res!1048420 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49615 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49615 a!2804))))))

(declare-fun b!1531074 () Bool)

(declare-fun res!1048416 () Bool)

(assert (=> b!1531074 (=> (not res!1048416) (not e!853131))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101686 (_ BitVec 32)) Bool)

(assert (=> b!1531074 (= res!1048416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1531075 () Bool)

(declare-fun res!1048422 () Bool)

(declare-fun e!853127 () Bool)

(assert (=> b!1531075 (=> (not res!1048422) (not e!853127))))

(declare-datatypes ((SeekEntryResult!13230 0))(
  ( (MissingZero!13230 (index!55315 (_ BitVec 32))) (Found!13230 (index!55316 (_ BitVec 32))) (Intermediate!13230 (undefined!14042 Bool) (index!55317 (_ BitVec 32)) (x!137007 (_ BitVec 32))) (Undefined!13230) (MissingVacant!13230 (index!55318 (_ BitVec 32))) )
))
(declare-fun lt!663079 () SeekEntryResult!13230)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101686 (_ BitVec 32)) SeekEntryResult!13230)

(assert (=> b!1531075 (= res!1048422 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49065 a!2804) j!70) a!2804 mask!2512) lt!663079))))

(declare-fun b!1531076 () Bool)

(declare-fun res!1048417 () Bool)

(assert (=> b!1531076 (=> (not res!1048417) (not e!853127))))

(declare-fun lt!663078 () SeekEntryResult!13230)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531076 (= res!1048417 (= lt!663078 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49065 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49065 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101687 (store (arr!49065 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49615 a!2804)) mask!2512)))))

(declare-fun b!1531077 () Bool)

(declare-fun res!1048425 () Bool)

(assert (=> b!1531077 (=> (not res!1048425) (not e!853131))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1531077 (= res!1048425 (validKeyInArray!0 (select (arr!49065 a!2804) j!70)))))

(declare-fun b!1531078 () Bool)

(declare-fun res!1048424 () Bool)

(assert (=> b!1531078 (=> (not res!1048424) (not e!853131))))

(assert (=> b!1531078 (= res!1048424 (and (= (size!49615 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49615 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49615 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1531079 () Bool)

(assert (=> b!1531079 (= e!853131 e!853127)))

(declare-fun res!1048415 () Bool)

(assert (=> b!1531079 (=> (not res!1048415) (not e!853127))))

(assert (=> b!1531079 (= res!1048415 (= lt!663078 lt!663079))))

(assert (=> b!1531079 (= lt!663079 (Intermediate!13230 false resIndex!21 resX!21))))

(assert (=> b!1531079 (= lt!663078 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49065 a!2804) j!70) mask!2512) (select (arr!49065 a!2804) j!70) a!2804 mask!2512))))

(declare-fun e!853128 () Bool)

(declare-fun lt!663077 () (_ BitVec 32))

(declare-fun b!1531080 () Bool)

(assert (=> b!1531080 (= e!853128 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!663077 (select (arr!49065 a!2804) j!70) a!2804 mask!2512) lt!663079))))

(declare-fun e!853130 () Bool)

(declare-fun b!1531081 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101686 (_ BitVec 32)) SeekEntryResult!13230)

(assert (=> b!1531081 (= e!853130 (= (seekEntry!0 (select (arr!49065 a!2804) j!70) a!2804 mask!2512) (Found!13230 j!70)))))

(declare-fun b!1531082 () Bool)

(declare-fun e!853132 () Bool)

(assert (=> b!1531082 (= e!853132 e!853128)))

(declare-fun res!1048418 () Bool)

(assert (=> b!1531082 (=> res!1048418 e!853128)))

(assert (=> b!1531082 (= res!1048418 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!663077 #b00000000000000000000000000000000) (bvsge lt!663077 (size!49615 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531082 (= lt!663077 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1531083 () Bool)

(declare-fun res!1048414 () Bool)

(assert (=> b!1531083 (=> (not res!1048414) (not e!853131))))

(declare-datatypes ((List!35548 0))(
  ( (Nil!35545) (Cons!35544 (h!36986 (_ BitVec 64)) (t!50242 List!35548)) )
))
(declare-fun arrayNoDuplicates!0 (array!101686 (_ BitVec 32) List!35548) Bool)

(assert (=> b!1531083 (= res!1048414 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35545))))

(declare-fun b!1531084 () Bool)

(declare-fun res!1048426 () Bool)

(assert (=> b!1531084 (=> (not res!1048426) (not e!853131))))

(assert (=> b!1531084 (= res!1048426 (validKeyInArray!0 (select (arr!49065 a!2804) i!961)))))

(declare-fun b!1531085 () Bool)

(assert (=> b!1531085 (= e!853127 (not e!853132))))

(declare-fun res!1048419 () Bool)

(assert (=> b!1531085 (=> res!1048419 e!853132)))

(assert (=> b!1531085 (= res!1048419 (or (not (= (select (arr!49065 a!2804) j!70) (select (store (arr!49065 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1531085 e!853130))

(declare-fun res!1048423 () Bool)

(assert (=> b!1531085 (=> (not res!1048423) (not e!853130))))

(assert (=> b!1531085 (= res!1048423 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51244 0))(
  ( (Unit!51245) )
))
(declare-fun lt!663076 () Unit!51244)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101686 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51244)

(assert (=> b!1531085 (= lt!663076 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1048421 () Bool)

(assert (=> start!130450 (=> (not res!1048421) (not e!853131))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130450 (= res!1048421 (validMask!0 mask!2512))))

(assert (=> start!130450 e!853131))

(assert (=> start!130450 true))

(declare-fun array_inv!38093 (array!101686) Bool)

(assert (=> start!130450 (array_inv!38093 a!2804)))

(assert (= (and start!130450 res!1048421) b!1531078))

(assert (= (and b!1531078 res!1048424) b!1531084))

(assert (= (and b!1531084 res!1048426) b!1531077))

(assert (= (and b!1531077 res!1048425) b!1531074))

(assert (= (and b!1531074 res!1048416) b!1531083))

(assert (= (and b!1531083 res!1048414) b!1531073))

(assert (= (and b!1531073 res!1048420) b!1531079))

(assert (= (and b!1531079 res!1048415) b!1531075))

(assert (= (and b!1531075 res!1048422) b!1531076))

(assert (= (and b!1531076 res!1048417) b!1531085))

(assert (= (and b!1531085 res!1048423) b!1531081))

(assert (= (and b!1531085 (not res!1048419)) b!1531082))

(assert (= (and b!1531082 (not res!1048418)) b!1531080))

(declare-fun m!1413847 () Bool)

(assert (=> b!1531075 m!1413847))

(assert (=> b!1531075 m!1413847))

(declare-fun m!1413849 () Bool)

(assert (=> b!1531075 m!1413849))

(declare-fun m!1413851 () Bool)

(assert (=> b!1531076 m!1413851))

(declare-fun m!1413853 () Bool)

(assert (=> b!1531076 m!1413853))

(assert (=> b!1531076 m!1413853))

(declare-fun m!1413855 () Bool)

(assert (=> b!1531076 m!1413855))

(assert (=> b!1531076 m!1413855))

(assert (=> b!1531076 m!1413853))

(declare-fun m!1413857 () Bool)

(assert (=> b!1531076 m!1413857))

(assert (=> b!1531079 m!1413847))

(assert (=> b!1531079 m!1413847))

(declare-fun m!1413859 () Bool)

(assert (=> b!1531079 m!1413859))

(assert (=> b!1531079 m!1413859))

(assert (=> b!1531079 m!1413847))

(declare-fun m!1413861 () Bool)

(assert (=> b!1531079 m!1413861))

(declare-fun m!1413863 () Bool)

(assert (=> b!1531083 m!1413863))

(declare-fun m!1413865 () Bool)

(assert (=> b!1531084 m!1413865))

(assert (=> b!1531084 m!1413865))

(declare-fun m!1413867 () Bool)

(assert (=> b!1531084 m!1413867))

(assert (=> b!1531081 m!1413847))

(assert (=> b!1531081 m!1413847))

(declare-fun m!1413869 () Bool)

(assert (=> b!1531081 m!1413869))

(declare-fun m!1413871 () Bool)

(assert (=> start!130450 m!1413871))

(declare-fun m!1413873 () Bool)

(assert (=> start!130450 m!1413873))

(assert (=> b!1531080 m!1413847))

(assert (=> b!1531080 m!1413847))

(declare-fun m!1413875 () Bool)

(assert (=> b!1531080 m!1413875))

(assert (=> b!1531077 m!1413847))

(assert (=> b!1531077 m!1413847))

(declare-fun m!1413877 () Bool)

(assert (=> b!1531077 m!1413877))

(declare-fun m!1413879 () Bool)

(assert (=> b!1531082 m!1413879))

(declare-fun m!1413881 () Bool)

(assert (=> b!1531074 m!1413881))

(assert (=> b!1531085 m!1413847))

(declare-fun m!1413883 () Bool)

(assert (=> b!1531085 m!1413883))

(assert (=> b!1531085 m!1413851))

(assert (=> b!1531085 m!1413853))

(declare-fun m!1413885 () Bool)

(assert (=> b!1531085 m!1413885))

(check-sat (not b!1531081) (not b!1531079) (not b!1531074) (not b!1531077) (not b!1531085) (not b!1531075) (not start!130450) (not b!1531083) (not b!1531084) (not b!1531076) (not b!1531080) (not b!1531082))
(check-sat)
(get-model)

(declare-fun b!1531143 () Bool)

(declare-fun e!853165 () Bool)

(declare-fun lt!663097 () SeekEntryResult!13230)

(assert (=> b!1531143 (= e!853165 (bvsge (x!137007 lt!663097) #b01111111111111111111111111111110))))

(declare-fun b!1531144 () Bool)

(declare-fun e!853161 () Bool)

(assert (=> b!1531144 (= e!853165 e!853161)))

(declare-fun res!1048473 () Bool)

(get-info :version)

(assert (=> b!1531144 (= res!1048473 (and ((_ is Intermediate!13230) lt!663097) (not (undefined!14042 lt!663097)) (bvslt (x!137007 lt!663097) #b01111111111111111111111111111110) (bvsge (x!137007 lt!663097) #b00000000000000000000000000000000) (bvsge (x!137007 lt!663097) #b00000000000000000000000000000000)))))

(assert (=> b!1531144 (=> (not res!1048473) (not e!853161))))

(declare-fun b!1531145 () Bool)

(assert (=> b!1531145 (and (bvsge (index!55317 lt!663097) #b00000000000000000000000000000000) (bvslt (index!55317 lt!663097) (size!49615 a!2804)))))

(declare-fun res!1048472 () Bool)

(assert (=> b!1531145 (= res!1048472 (= (select (arr!49065 a!2804) (index!55317 lt!663097)) (select (arr!49065 a!2804) j!70)))))

(declare-fun e!853163 () Bool)

(assert (=> b!1531145 (=> res!1048472 e!853163)))

(assert (=> b!1531145 (= e!853161 e!853163)))

(declare-fun e!853164 () SeekEntryResult!13230)

(declare-fun b!1531146 () Bool)

(assert (=> b!1531146 (= e!853164 (Intermediate!13230 false (toIndex!0 (select (arr!49065 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun e!853162 () SeekEntryResult!13230)

(declare-fun b!1531147 () Bool)

(assert (=> b!1531147 (= e!853162 (Intermediate!13230 true (toIndex!0 (select (arr!49065 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1531148 () Bool)

(assert (=> b!1531148 (= e!853162 e!853164)))

(declare-fun lt!663096 () (_ BitVec 64))

(declare-fun c!140892 () Bool)

(assert (=> b!1531148 (= c!140892 (or (= lt!663096 (select (arr!49065 a!2804) j!70)) (= (bvadd lt!663096 lt!663096) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1531149 () Bool)

(assert (=> b!1531149 (and (bvsge (index!55317 lt!663097) #b00000000000000000000000000000000) (bvslt (index!55317 lt!663097) (size!49615 a!2804)))))

(assert (=> b!1531149 (= e!853163 (= (select (arr!49065 a!2804) (index!55317 lt!663097)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!159927 () Bool)

(assert (=> d!159927 e!853165))

(declare-fun c!140893 () Bool)

(assert (=> d!159927 (= c!140893 (and ((_ is Intermediate!13230) lt!663097) (undefined!14042 lt!663097)))))

(assert (=> d!159927 (= lt!663097 e!853162)))

(declare-fun c!140894 () Bool)

(assert (=> d!159927 (= c!140894 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!159927 (= lt!663096 (select (arr!49065 a!2804) (toIndex!0 (select (arr!49065 a!2804) j!70) mask!2512)))))

(assert (=> d!159927 (validMask!0 mask!2512)))

(assert (=> d!159927 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49065 a!2804) j!70) mask!2512) (select (arr!49065 a!2804) j!70) a!2804 mask!2512) lt!663097)))

(declare-fun b!1531150 () Bool)

(assert (=> b!1531150 (and (bvsge (index!55317 lt!663097) #b00000000000000000000000000000000) (bvslt (index!55317 lt!663097) (size!49615 a!2804)))))

(declare-fun res!1048474 () Bool)

(assert (=> b!1531150 (= res!1048474 (= (select (arr!49065 a!2804) (index!55317 lt!663097)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1531150 (=> res!1048474 e!853163)))

(declare-fun b!1531151 () Bool)

(assert (=> b!1531151 (= e!853164 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!49065 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!49065 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and d!159927 c!140894) b!1531147))

(assert (= (and d!159927 (not c!140894)) b!1531148))

(assert (= (and b!1531148 c!140892) b!1531146))

(assert (= (and b!1531148 (not c!140892)) b!1531151))

(assert (= (and d!159927 c!140893) b!1531143))

(assert (= (and d!159927 (not c!140893)) b!1531144))

(assert (= (and b!1531144 res!1048473) b!1531145))

(assert (= (and b!1531145 (not res!1048472)) b!1531150))

(assert (= (and b!1531150 (not res!1048474)) b!1531149))

(assert (=> d!159927 m!1413859))

(declare-fun m!1413927 () Bool)

(assert (=> d!159927 m!1413927))

(assert (=> d!159927 m!1413871))

(assert (=> b!1531151 m!1413859))

(declare-fun m!1413929 () Bool)

(assert (=> b!1531151 m!1413929))

(assert (=> b!1531151 m!1413929))

(assert (=> b!1531151 m!1413847))

(declare-fun m!1413931 () Bool)

(assert (=> b!1531151 m!1413931))

(declare-fun m!1413933 () Bool)

(assert (=> b!1531145 m!1413933))

(assert (=> b!1531150 m!1413933))

(assert (=> b!1531149 m!1413933))

(assert (=> b!1531079 d!159927))

(declare-fun d!159929 () Bool)

(declare-fun lt!663103 () (_ BitVec 32))

(declare-fun lt!663102 () (_ BitVec 32))

(assert (=> d!159929 (= lt!663103 (bvmul (bvxor lt!663102 (bvlshr lt!663102 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159929 (= lt!663102 ((_ extract 31 0) (bvand (bvxor (select (arr!49065 a!2804) j!70) (bvlshr (select (arr!49065 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159929 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1048475 (let ((h!36988 ((_ extract 31 0) (bvand (bvxor (select (arr!49065 a!2804) j!70) (bvlshr (select (arr!49065 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!137010 (bvmul (bvxor h!36988 (bvlshr h!36988 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!137010 (bvlshr x!137010 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1048475 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1048475 #b00000000000000000000000000000000))))))

(assert (=> d!159929 (= (toIndex!0 (select (arr!49065 a!2804) j!70) mask!2512) (bvand (bvxor lt!663103 (bvlshr lt!663103 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1531079 d!159929))

(declare-fun b!1531152 () Bool)

(declare-fun e!853170 () Bool)

(declare-fun lt!663105 () SeekEntryResult!13230)

(assert (=> b!1531152 (= e!853170 (bvsge (x!137007 lt!663105) #b01111111111111111111111111111110))))

(declare-fun b!1531153 () Bool)

(declare-fun e!853166 () Bool)

(assert (=> b!1531153 (= e!853170 e!853166)))

(declare-fun res!1048477 () Bool)

(assert (=> b!1531153 (= res!1048477 (and ((_ is Intermediate!13230) lt!663105) (not (undefined!14042 lt!663105)) (bvslt (x!137007 lt!663105) #b01111111111111111111111111111110) (bvsge (x!137007 lt!663105) #b00000000000000000000000000000000) (bvsge (x!137007 lt!663105) (bvadd #b00000000000000000000000000000001 x!534))))))

(assert (=> b!1531153 (=> (not res!1048477) (not e!853166))))

(declare-fun b!1531154 () Bool)

(assert (=> b!1531154 (and (bvsge (index!55317 lt!663105) #b00000000000000000000000000000000) (bvslt (index!55317 lt!663105) (size!49615 a!2804)))))

(declare-fun res!1048476 () Bool)

(assert (=> b!1531154 (= res!1048476 (= (select (arr!49065 a!2804) (index!55317 lt!663105)) (select (arr!49065 a!2804) j!70)))))

(declare-fun e!853168 () Bool)

(assert (=> b!1531154 (=> res!1048476 e!853168)))

(assert (=> b!1531154 (= e!853166 e!853168)))

(declare-fun b!1531155 () Bool)

(declare-fun e!853169 () SeekEntryResult!13230)

(assert (=> b!1531155 (= e!853169 (Intermediate!13230 false lt!663077 (bvadd #b00000000000000000000000000000001 x!534)))))

(declare-fun b!1531156 () Bool)

(declare-fun e!853167 () SeekEntryResult!13230)

(assert (=> b!1531156 (= e!853167 (Intermediate!13230 true lt!663077 (bvadd #b00000000000000000000000000000001 x!534)))))

(declare-fun b!1531157 () Bool)

(assert (=> b!1531157 (= e!853167 e!853169)))

(declare-fun c!140895 () Bool)

(declare-fun lt!663104 () (_ BitVec 64))

(assert (=> b!1531157 (= c!140895 (or (= lt!663104 (select (arr!49065 a!2804) j!70)) (= (bvadd lt!663104 lt!663104) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1531158 () Bool)

(assert (=> b!1531158 (and (bvsge (index!55317 lt!663105) #b00000000000000000000000000000000) (bvslt (index!55317 lt!663105) (size!49615 a!2804)))))

(assert (=> b!1531158 (= e!853168 (= (select (arr!49065 a!2804) (index!55317 lt!663105)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!159933 () Bool)

(assert (=> d!159933 e!853170))

(declare-fun c!140896 () Bool)

(assert (=> d!159933 (= c!140896 (and ((_ is Intermediate!13230) lt!663105) (undefined!14042 lt!663105)))))

(assert (=> d!159933 (= lt!663105 e!853167)))

(declare-fun c!140897 () Bool)

(assert (=> d!159933 (= c!140897 (bvsge (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110))))

(assert (=> d!159933 (= lt!663104 (select (arr!49065 a!2804) lt!663077))))

(assert (=> d!159933 (validMask!0 mask!2512)))

(assert (=> d!159933 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!663077 (select (arr!49065 a!2804) j!70) a!2804 mask!2512) lt!663105)))

(declare-fun b!1531159 () Bool)

(assert (=> b!1531159 (and (bvsge (index!55317 lt!663105) #b00000000000000000000000000000000) (bvslt (index!55317 lt!663105) (size!49615 a!2804)))))

(declare-fun res!1048478 () Bool)

(assert (=> b!1531159 (= res!1048478 (= (select (arr!49065 a!2804) (index!55317 lt!663105)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1531159 (=> res!1048478 e!853168)))

(declare-fun b!1531160 () Bool)

(assert (=> b!1531160 (= e!853169 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534 #b00000000000000000000000000000001) (nextIndex!0 lt!663077 (bvadd #b00000000000000000000000000000001 x!534) mask!2512) (select (arr!49065 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and d!159933 c!140897) b!1531156))

(assert (= (and d!159933 (not c!140897)) b!1531157))

(assert (= (and b!1531157 c!140895) b!1531155))

(assert (= (and b!1531157 (not c!140895)) b!1531160))

(assert (= (and d!159933 c!140896) b!1531152))

(assert (= (and d!159933 (not c!140896)) b!1531153))

(assert (= (and b!1531153 res!1048477) b!1531154))

(assert (= (and b!1531154 (not res!1048476)) b!1531159))

(assert (= (and b!1531159 (not res!1048478)) b!1531158))

(declare-fun m!1413935 () Bool)

(assert (=> d!159933 m!1413935))

(assert (=> d!159933 m!1413871))

(declare-fun m!1413937 () Bool)

(assert (=> b!1531160 m!1413937))

(assert (=> b!1531160 m!1413937))

(assert (=> b!1531160 m!1413847))

(declare-fun m!1413939 () Bool)

(assert (=> b!1531160 m!1413939))

(declare-fun m!1413941 () Bool)

(assert (=> b!1531154 m!1413941))

(assert (=> b!1531159 m!1413941))

(assert (=> b!1531158 m!1413941))

(assert (=> b!1531080 d!159933))

(declare-fun b!1531161 () Bool)

(declare-fun e!853175 () Bool)

(declare-fun lt!663107 () SeekEntryResult!13230)

(assert (=> b!1531161 (= e!853175 (bvsge (x!137007 lt!663107) #b01111111111111111111111111111110))))

(declare-fun b!1531162 () Bool)

(declare-fun e!853171 () Bool)

(assert (=> b!1531162 (= e!853175 e!853171)))

(declare-fun res!1048480 () Bool)

(assert (=> b!1531162 (= res!1048480 (and ((_ is Intermediate!13230) lt!663107) (not (undefined!14042 lt!663107)) (bvslt (x!137007 lt!663107) #b01111111111111111111111111111110) (bvsge (x!137007 lt!663107) #b00000000000000000000000000000000) (bvsge (x!137007 lt!663107) #b00000000000000000000000000000000)))))

(assert (=> b!1531162 (=> (not res!1048480) (not e!853171))))

(declare-fun b!1531163 () Bool)

(assert (=> b!1531163 (and (bvsge (index!55317 lt!663107) #b00000000000000000000000000000000) (bvslt (index!55317 lt!663107) (size!49615 (array!101687 (store (arr!49065 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49615 a!2804)))))))

(declare-fun res!1048479 () Bool)

(assert (=> b!1531163 (= res!1048479 (= (select (arr!49065 (array!101687 (store (arr!49065 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49615 a!2804))) (index!55317 lt!663107)) (select (store (arr!49065 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(declare-fun e!853173 () Bool)

(assert (=> b!1531163 (=> res!1048479 e!853173)))

(assert (=> b!1531163 (= e!853171 e!853173)))

(declare-fun e!853174 () SeekEntryResult!13230)

(declare-fun b!1531164 () Bool)

(assert (=> b!1531164 (= e!853174 (Intermediate!13230 false (toIndex!0 (select (store (arr!49065 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1531165 () Bool)

(declare-fun e!853172 () SeekEntryResult!13230)

(assert (=> b!1531165 (= e!853172 (Intermediate!13230 true (toIndex!0 (select (store (arr!49065 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1531166 () Bool)

(assert (=> b!1531166 (= e!853172 e!853174)))

(declare-fun c!140898 () Bool)

(declare-fun lt!663106 () (_ BitVec 64))

(assert (=> b!1531166 (= c!140898 (or (= lt!663106 (select (store (arr!49065 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!663106 lt!663106) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1531167 () Bool)

(assert (=> b!1531167 (and (bvsge (index!55317 lt!663107) #b00000000000000000000000000000000) (bvslt (index!55317 lt!663107) (size!49615 (array!101687 (store (arr!49065 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49615 a!2804)))))))

(assert (=> b!1531167 (= e!853173 (= (select (arr!49065 (array!101687 (store (arr!49065 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49615 a!2804))) (index!55317 lt!663107)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!159937 () Bool)

(assert (=> d!159937 e!853175))

(declare-fun c!140899 () Bool)

(assert (=> d!159937 (= c!140899 (and ((_ is Intermediate!13230) lt!663107) (undefined!14042 lt!663107)))))

(assert (=> d!159937 (= lt!663107 e!853172)))

(declare-fun c!140900 () Bool)

(assert (=> d!159937 (= c!140900 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!159937 (= lt!663106 (select (arr!49065 (array!101687 (store (arr!49065 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49615 a!2804))) (toIndex!0 (select (store (arr!49065 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512)))))

(assert (=> d!159937 (validMask!0 mask!2512)))

(assert (=> d!159937 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49065 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49065 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101687 (store (arr!49065 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49615 a!2804)) mask!2512) lt!663107)))

(declare-fun b!1531168 () Bool)

(assert (=> b!1531168 (and (bvsge (index!55317 lt!663107) #b00000000000000000000000000000000) (bvslt (index!55317 lt!663107) (size!49615 (array!101687 (store (arr!49065 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49615 a!2804)))))))

(declare-fun res!1048481 () Bool)

(assert (=> b!1531168 (= res!1048481 (= (select (arr!49065 (array!101687 (store (arr!49065 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49615 a!2804))) (index!55317 lt!663107)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1531168 (=> res!1048481 e!853173)))

(declare-fun b!1531169 () Bool)

(assert (=> b!1531169 (= e!853174 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!49065 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (store (arr!49065 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101687 (store (arr!49065 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49615 a!2804)) mask!2512))))

(assert (= (and d!159937 c!140900) b!1531165))

(assert (= (and d!159937 (not c!140900)) b!1531166))

(assert (= (and b!1531166 c!140898) b!1531164))

(assert (= (and b!1531166 (not c!140898)) b!1531169))

(assert (= (and d!159937 c!140899) b!1531161))

(assert (= (and d!159937 (not c!140899)) b!1531162))

(assert (= (and b!1531162 res!1048480) b!1531163))

(assert (= (and b!1531163 (not res!1048479)) b!1531168))

(assert (= (and b!1531168 (not res!1048481)) b!1531167))

(assert (=> d!159937 m!1413855))

(declare-fun m!1413943 () Bool)

(assert (=> d!159937 m!1413943))

(assert (=> d!159937 m!1413871))

(assert (=> b!1531169 m!1413855))

(declare-fun m!1413945 () Bool)

(assert (=> b!1531169 m!1413945))

(assert (=> b!1531169 m!1413945))

(assert (=> b!1531169 m!1413853))

(declare-fun m!1413947 () Bool)

(assert (=> b!1531169 m!1413947))

(declare-fun m!1413949 () Bool)

(assert (=> b!1531163 m!1413949))

(assert (=> b!1531168 m!1413949))

(assert (=> b!1531167 m!1413949))

(assert (=> b!1531076 d!159937))

(declare-fun d!159939 () Bool)

(declare-fun lt!663109 () (_ BitVec 32))

(declare-fun lt!663108 () (_ BitVec 32))

(assert (=> d!159939 (= lt!663109 (bvmul (bvxor lt!663108 (bvlshr lt!663108 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159939 (= lt!663108 ((_ extract 31 0) (bvand (bvxor (select (store (arr!49065 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!49065 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159939 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1048475 (let ((h!36988 ((_ extract 31 0) (bvand (bvxor (select (store (arr!49065 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!49065 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!137010 (bvmul (bvxor h!36988 (bvlshr h!36988 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!137010 (bvlshr x!137010 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1048475 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1048475 #b00000000000000000000000000000000))))))

(assert (=> d!159939 (= (toIndex!0 (select (store (arr!49065 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!663109 (bvlshr lt!663109 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1531076 d!159939))

(declare-fun d!159941 () Bool)

(assert (=> d!159941 (= (validKeyInArray!0 (select (arr!49065 a!2804) j!70)) (and (not (= (select (arr!49065 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49065 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1531077 d!159941))

(declare-fun d!159943 () Bool)

(assert (=> d!159943 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!130450 d!159943))

(declare-fun d!159945 () Bool)

(assert (=> d!159945 (= (array_inv!38093 a!2804) (bvsge (size!49615 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!130450 d!159945))

(declare-fun d!159947 () Bool)

(assert (=> d!159947 (= (validKeyInArray!0 (select (arr!49065 a!2804) i!961)) (and (not (= (select (arr!49065 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49065 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1531084 d!159947))

(declare-fun b!1531196 () Bool)

(declare-fun e!853192 () Bool)

(declare-fun e!853193 () Bool)

(assert (=> b!1531196 (= e!853192 e!853193)))

(declare-fun lt!663121 () (_ BitVec 64))

(assert (=> b!1531196 (= lt!663121 (select (arr!49065 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!663122 () Unit!51244)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101686 (_ BitVec 64) (_ BitVec 32)) Unit!51244)

(assert (=> b!1531196 (= lt!663122 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!663121 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!101686 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1531196 (arrayContainsKey!0 a!2804 lt!663121 #b00000000000000000000000000000000)))

(declare-fun lt!663120 () Unit!51244)

(assert (=> b!1531196 (= lt!663120 lt!663122)))

(declare-fun res!1048493 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101686 (_ BitVec 32)) SeekEntryResult!13230)

(assert (=> b!1531196 (= res!1048493 (= (seekEntryOrOpen!0 (select (arr!49065 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13230 #b00000000000000000000000000000000)))))

(assert (=> b!1531196 (=> (not res!1048493) (not e!853193))))

(declare-fun b!1531198 () Bool)

(declare-fun call!68535 () Bool)

(assert (=> b!1531198 (= e!853192 call!68535)))

(declare-fun b!1531199 () Bool)

(declare-fun e!853194 () Bool)

(assert (=> b!1531199 (= e!853194 e!853192)))

(declare-fun c!140909 () Bool)

(assert (=> b!1531199 (= c!140909 (validKeyInArray!0 (select (arr!49065 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68532 () Bool)

(assert (=> bm!68532 (= call!68535 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun d!159949 () Bool)

(declare-fun res!1048492 () Bool)

(assert (=> d!159949 (=> res!1048492 e!853194)))

(assert (=> d!159949 (= res!1048492 (bvsge #b00000000000000000000000000000000 (size!49615 a!2804)))))

(assert (=> d!159949 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!853194)))

(declare-fun b!1531197 () Bool)

(assert (=> b!1531197 (= e!853193 call!68535)))

(assert (= (and d!159949 (not res!1048492)) b!1531199))

(assert (= (and b!1531199 c!140909) b!1531196))

(assert (= (and b!1531199 (not c!140909)) b!1531198))

(assert (= (and b!1531196 res!1048493) b!1531197))

(assert (= (or b!1531197 b!1531198) bm!68532))

(declare-fun m!1413951 () Bool)

(assert (=> b!1531196 m!1413951))

(declare-fun m!1413953 () Bool)

(assert (=> b!1531196 m!1413953))

(declare-fun m!1413955 () Bool)

(assert (=> b!1531196 m!1413955))

(assert (=> b!1531196 m!1413951))

(declare-fun m!1413957 () Bool)

(assert (=> b!1531196 m!1413957))

(assert (=> b!1531199 m!1413951))

(assert (=> b!1531199 m!1413951))

(declare-fun m!1413959 () Bool)

(assert (=> b!1531199 m!1413959))

(declare-fun m!1413961 () Bool)

(assert (=> bm!68532 m!1413961))

(assert (=> b!1531074 d!159949))

(declare-fun b!1531202 () Bool)

(declare-fun e!853195 () Bool)

(declare-fun e!853196 () Bool)

(assert (=> b!1531202 (= e!853195 e!853196)))

(declare-fun lt!663128 () (_ BitVec 64))

(assert (=> b!1531202 (= lt!663128 (select (arr!49065 a!2804) j!70))))

(declare-fun lt!663129 () Unit!51244)

(assert (=> b!1531202 (= lt!663129 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!663128 j!70))))

(assert (=> b!1531202 (arrayContainsKey!0 a!2804 lt!663128 #b00000000000000000000000000000000)))

(declare-fun lt!663127 () Unit!51244)

(assert (=> b!1531202 (= lt!663127 lt!663129)))

(declare-fun res!1048495 () Bool)

(assert (=> b!1531202 (= res!1048495 (= (seekEntryOrOpen!0 (select (arr!49065 a!2804) j!70) a!2804 mask!2512) (Found!13230 j!70)))))

(assert (=> b!1531202 (=> (not res!1048495) (not e!853196))))

(declare-fun b!1531204 () Bool)

(declare-fun call!68536 () Bool)

(assert (=> b!1531204 (= e!853195 call!68536)))

(declare-fun b!1531205 () Bool)

(declare-fun e!853197 () Bool)

(assert (=> b!1531205 (= e!853197 e!853195)))

(declare-fun c!140910 () Bool)

(assert (=> b!1531205 (= c!140910 (validKeyInArray!0 (select (arr!49065 a!2804) j!70)))))

(declare-fun bm!68533 () Bool)

(assert (=> bm!68533 (= call!68536 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun d!159951 () Bool)

(declare-fun res!1048494 () Bool)

(assert (=> d!159951 (=> res!1048494 e!853197)))

(assert (=> d!159951 (= res!1048494 (bvsge j!70 (size!49615 a!2804)))))

(assert (=> d!159951 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!853197)))

(declare-fun b!1531203 () Bool)

(assert (=> b!1531203 (= e!853196 call!68536)))

(assert (= (and d!159951 (not res!1048494)) b!1531205))

(assert (= (and b!1531205 c!140910) b!1531202))

(assert (= (and b!1531205 (not c!140910)) b!1531204))

(assert (= (and b!1531202 res!1048495) b!1531203))

(assert (= (or b!1531203 b!1531204) bm!68533))

(assert (=> b!1531202 m!1413847))

(declare-fun m!1413963 () Bool)

(assert (=> b!1531202 m!1413963))

(declare-fun m!1413965 () Bool)

(assert (=> b!1531202 m!1413965))

(assert (=> b!1531202 m!1413847))

(declare-fun m!1413967 () Bool)

(assert (=> b!1531202 m!1413967))

(assert (=> b!1531205 m!1413847))

(assert (=> b!1531205 m!1413847))

(assert (=> b!1531205 m!1413877))

(declare-fun m!1413969 () Bool)

(assert (=> bm!68533 m!1413969))

(assert (=> b!1531085 d!159951))

(declare-fun d!159953 () Bool)

(assert (=> d!159953 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!663134 () Unit!51244)

(declare-fun choose!38 (array!101686 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51244)

(assert (=> d!159953 (= lt!663134 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!159953 (validMask!0 mask!2512)))

(assert (=> d!159953 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!663134)))

(declare-fun bs!43900 () Bool)

(assert (= bs!43900 d!159953))

(assert (=> bs!43900 m!1413885))

(declare-fun m!1413971 () Bool)

(assert (=> bs!43900 m!1413971))

(assert (=> bs!43900 m!1413871))

(assert (=> b!1531085 d!159953))

(declare-fun b!1531231 () Bool)

(declare-fun e!853217 () Bool)

(declare-fun lt!663136 () SeekEntryResult!13230)

(assert (=> b!1531231 (= e!853217 (bvsge (x!137007 lt!663136) #b01111111111111111111111111111110))))

(declare-fun b!1531232 () Bool)

(declare-fun e!853213 () Bool)

(assert (=> b!1531232 (= e!853217 e!853213)))

(declare-fun res!1048506 () Bool)

(assert (=> b!1531232 (= res!1048506 (and ((_ is Intermediate!13230) lt!663136) (not (undefined!14042 lt!663136)) (bvslt (x!137007 lt!663136) #b01111111111111111111111111111110) (bvsge (x!137007 lt!663136) #b00000000000000000000000000000000) (bvsge (x!137007 lt!663136) x!534)))))

(assert (=> b!1531232 (=> (not res!1048506) (not e!853213))))

(declare-fun b!1531233 () Bool)

(assert (=> b!1531233 (and (bvsge (index!55317 lt!663136) #b00000000000000000000000000000000) (bvslt (index!55317 lt!663136) (size!49615 a!2804)))))

(declare-fun res!1048505 () Bool)

(assert (=> b!1531233 (= res!1048505 (= (select (arr!49065 a!2804) (index!55317 lt!663136)) (select (arr!49065 a!2804) j!70)))))

(declare-fun e!853215 () Bool)

(assert (=> b!1531233 (=> res!1048505 e!853215)))

(assert (=> b!1531233 (= e!853213 e!853215)))

(declare-fun b!1531234 () Bool)

(declare-fun e!853216 () SeekEntryResult!13230)

(assert (=> b!1531234 (= e!853216 (Intermediate!13230 false index!487 x!534))))

(declare-fun b!1531235 () Bool)

(declare-fun e!853214 () SeekEntryResult!13230)

(assert (=> b!1531235 (= e!853214 (Intermediate!13230 true index!487 x!534))))

(declare-fun b!1531236 () Bool)

(assert (=> b!1531236 (= e!853214 e!853216)))

(declare-fun c!140920 () Bool)

(declare-fun lt!663135 () (_ BitVec 64))

(assert (=> b!1531236 (= c!140920 (or (= lt!663135 (select (arr!49065 a!2804) j!70)) (= (bvadd lt!663135 lt!663135) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1531237 () Bool)

(assert (=> b!1531237 (and (bvsge (index!55317 lt!663136) #b00000000000000000000000000000000) (bvslt (index!55317 lt!663136) (size!49615 a!2804)))))

(assert (=> b!1531237 (= e!853215 (= (select (arr!49065 a!2804) (index!55317 lt!663136)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!159955 () Bool)

(assert (=> d!159955 e!853217))

(declare-fun c!140921 () Bool)

(assert (=> d!159955 (= c!140921 (and ((_ is Intermediate!13230) lt!663136) (undefined!14042 lt!663136)))))

(assert (=> d!159955 (= lt!663136 e!853214)))

(declare-fun c!140922 () Bool)

(assert (=> d!159955 (= c!140922 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!159955 (= lt!663135 (select (arr!49065 a!2804) index!487))))

(assert (=> d!159955 (validMask!0 mask!2512)))

(assert (=> d!159955 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49065 a!2804) j!70) a!2804 mask!2512) lt!663136)))

(declare-fun b!1531238 () Bool)

(assert (=> b!1531238 (and (bvsge (index!55317 lt!663136) #b00000000000000000000000000000000) (bvslt (index!55317 lt!663136) (size!49615 a!2804)))))

(declare-fun res!1048507 () Bool)

(assert (=> b!1531238 (= res!1048507 (= (select (arr!49065 a!2804) (index!55317 lt!663136)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1531238 (=> res!1048507 e!853215)))

(declare-fun b!1531239 () Bool)

(assert (=> b!1531239 (= e!853216 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!49065 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and d!159955 c!140922) b!1531235))

(assert (= (and d!159955 (not c!140922)) b!1531236))

(assert (= (and b!1531236 c!140920) b!1531234))

(assert (= (and b!1531236 (not c!140920)) b!1531239))

(assert (= (and d!159955 c!140921) b!1531231))

(assert (= (and d!159955 (not c!140921)) b!1531232))

(assert (= (and b!1531232 res!1048506) b!1531233))

(assert (= (and b!1531233 (not res!1048505)) b!1531238))

(assert (= (and b!1531238 (not res!1048507)) b!1531237))

(declare-fun m!1413981 () Bool)

(assert (=> d!159955 m!1413981))

(assert (=> d!159955 m!1413871))

(assert (=> b!1531239 m!1413879))

(assert (=> b!1531239 m!1413879))

(assert (=> b!1531239 m!1413847))

(declare-fun m!1413983 () Bool)

(assert (=> b!1531239 m!1413983))

(declare-fun m!1413985 () Bool)

(assert (=> b!1531233 m!1413985))

(assert (=> b!1531238 m!1413985))

(assert (=> b!1531237 m!1413985))

(assert (=> b!1531075 d!159955))

(declare-fun b!1531271 () Bool)

(declare-fun e!853237 () SeekEntryResult!13230)

(declare-fun lt!663159 () SeekEntryResult!13230)

(assert (=> b!1531271 (= e!853237 (MissingZero!13230 (index!55317 lt!663159)))))

(declare-fun b!1531272 () Bool)

(declare-fun lt!663162 () SeekEntryResult!13230)

(assert (=> b!1531272 (= e!853237 (ite ((_ is MissingVacant!13230) lt!663162) (MissingZero!13230 (index!55318 lt!663162)) lt!663162))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101686 (_ BitVec 32)) SeekEntryResult!13230)

(assert (=> b!1531272 (= lt!663162 (seekKeyOrZeroReturnVacant!0 (x!137007 lt!663159) (index!55317 lt!663159) (index!55317 lt!663159) (select (arr!49065 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1531273 () Bool)

(declare-fun e!853238 () SeekEntryResult!13230)

(assert (=> b!1531273 (= e!853238 Undefined!13230)))

(declare-fun b!1531274 () Bool)

(declare-fun e!853239 () SeekEntryResult!13230)

(assert (=> b!1531274 (= e!853238 e!853239)))

(declare-fun lt!663161 () (_ BitVec 64))

(assert (=> b!1531274 (= lt!663161 (select (arr!49065 a!2804) (index!55317 lt!663159)))))

(declare-fun c!140935 () Bool)

(assert (=> b!1531274 (= c!140935 (= lt!663161 (select (arr!49065 a!2804) j!70)))))

(declare-fun b!1531275 () Bool)

(declare-fun c!140936 () Bool)

(assert (=> b!1531275 (= c!140936 (= lt!663161 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1531275 (= e!853239 e!853237)))

(declare-fun b!1531276 () Bool)

(assert (=> b!1531276 (= e!853239 (Found!13230 (index!55317 lt!663159)))))

(declare-fun d!159959 () Bool)

(declare-fun lt!663160 () SeekEntryResult!13230)

(assert (=> d!159959 (and (or ((_ is MissingVacant!13230) lt!663160) (not ((_ is Found!13230) lt!663160)) (and (bvsge (index!55316 lt!663160) #b00000000000000000000000000000000) (bvslt (index!55316 lt!663160) (size!49615 a!2804)))) (not ((_ is MissingVacant!13230) lt!663160)) (or (not ((_ is Found!13230) lt!663160)) (= (select (arr!49065 a!2804) (index!55316 lt!663160)) (select (arr!49065 a!2804) j!70))))))

(assert (=> d!159959 (= lt!663160 e!853238)))

(declare-fun c!140934 () Bool)

(assert (=> d!159959 (= c!140934 (and ((_ is Intermediate!13230) lt!663159) (undefined!14042 lt!663159)))))

(assert (=> d!159959 (= lt!663159 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49065 a!2804) j!70) mask!2512) (select (arr!49065 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159959 (validMask!0 mask!2512)))

(assert (=> d!159959 (= (seekEntry!0 (select (arr!49065 a!2804) j!70) a!2804 mask!2512) lt!663160)))

(assert (= (and d!159959 c!140934) b!1531273))

(assert (= (and d!159959 (not c!140934)) b!1531274))

(assert (= (and b!1531274 c!140935) b!1531276))

(assert (= (and b!1531274 (not c!140935)) b!1531275))

(assert (= (and b!1531275 c!140936) b!1531271))

(assert (= (and b!1531275 (not c!140936)) b!1531272))

(assert (=> b!1531272 m!1413847))

(declare-fun m!1413995 () Bool)

(assert (=> b!1531272 m!1413995))

(declare-fun m!1413997 () Bool)

(assert (=> b!1531274 m!1413997))

(declare-fun m!1413999 () Bool)

(assert (=> d!159959 m!1413999))

(assert (=> d!159959 m!1413847))

(assert (=> d!159959 m!1413859))

(assert (=> d!159959 m!1413859))

(assert (=> d!159959 m!1413847))

(assert (=> d!159959 m!1413861))

(assert (=> d!159959 m!1413871))

(assert (=> b!1531081 d!159959))

(declare-fun d!159967 () Bool)

(declare-fun lt!663165 () (_ BitVec 32))

(assert (=> d!159967 (and (bvsge lt!663165 #b00000000000000000000000000000000) (bvslt lt!663165 (bvadd mask!2512 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!159967 (= lt!663165 (choose!52 index!487 x!534 mask!2512))))

(assert (=> d!159967 (validMask!0 mask!2512)))

(assert (=> d!159967 (= (nextIndex!0 index!487 x!534 mask!2512) lt!663165)))

(declare-fun bs!43901 () Bool)

(assert (= bs!43901 d!159967))

(declare-fun m!1414001 () Bool)

(assert (=> bs!43901 m!1414001))

(assert (=> bs!43901 m!1413871))

(assert (=> b!1531082 d!159967))

(declare-fun b!1531300 () Bool)

(declare-fun e!853261 () Bool)

(declare-fun e!853260 () Bool)

(assert (=> b!1531300 (= e!853261 e!853260)))

(declare-fun res!1048532 () Bool)

(assert (=> b!1531300 (=> (not res!1048532) (not e!853260))))

(declare-fun e!853258 () Bool)

(assert (=> b!1531300 (= res!1048532 (not e!853258))))

(declare-fun res!1048534 () Bool)

(assert (=> b!1531300 (=> (not res!1048534) (not e!853258))))

(assert (=> b!1531300 (= res!1048534 (validKeyInArray!0 (select (arr!49065 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1531301 () Bool)

(declare-fun e!853259 () Bool)

(assert (=> b!1531301 (= e!853260 e!853259)))

(declare-fun c!140942 () Bool)

(assert (=> b!1531301 (= c!140942 (validKeyInArray!0 (select (arr!49065 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1531302 () Bool)

(declare-fun call!68544 () Bool)

(assert (=> b!1531302 (= e!853259 call!68544)))

(declare-fun b!1531303 () Bool)

(declare-fun contains!10002 (List!35548 (_ BitVec 64)) Bool)

(assert (=> b!1531303 (= e!853258 (contains!10002 Nil!35545 (select (arr!49065 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!159969 () Bool)

(declare-fun res!1048533 () Bool)

(assert (=> d!159969 (=> res!1048533 e!853261)))

(assert (=> d!159969 (= res!1048533 (bvsge #b00000000000000000000000000000000 (size!49615 a!2804)))))

(assert (=> d!159969 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35545) e!853261)))

(declare-fun bm!68541 () Bool)

(assert (=> bm!68541 (= call!68544 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!140942 (Cons!35544 (select (arr!49065 a!2804) #b00000000000000000000000000000000) Nil!35545) Nil!35545)))))

(declare-fun b!1531304 () Bool)

(assert (=> b!1531304 (= e!853259 call!68544)))

(assert (= (and d!159969 (not res!1048533)) b!1531300))

(assert (= (and b!1531300 res!1048534) b!1531303))

(assert (= (and b!1531300 res!1048532) b!1531301))

(assert (= (and b!1531301 c!140942) b!1531302))

(assert (= (and b!1531301 (not c!140942)) b!1531304))

(assert (= (or b!1531302 b!1531304) bm!68541))

(assert (=> b!1531300 m!1413951))

(assert (=> b!1531300 m!1413951))

(assert (=> b!1531300 m!1413959))

(assert (=> b!1531301 m!1413951))

(assert (=> b!1531301 m!1413951))

(assert (=> b!1531301 m!1413959))

(assert (=> b!1531303 m!1413951))

(assert (=> b!1531303 m!1413951))

(declare-fun m!1414011 () Bool)

(assert (=> b!1531303 m!1414011))

(assert (=> bm!68541 m!1413951))

(declare-fun m!1414013 () Bool)

(assert (=> bm!68541 m!1414013))

(assert (=> b!1531083 d!159969))

(check-sat (not b!1531169) (not d!159955) (not d!159937) (not d!159927) (not d!159959) (not b!1531300) (not b!1531205) (not bm!68533) (not d!159933) (not b!1531301) (not b!1531272) (not b!1531151) (not b!1531303) (not b!1531199) (not bm!68541) (not d!159953) (not bm!68532) (not d!159967) (not b!1531196) (not b!1531202) (not b!1531239) (not b!1531160))
(check-sat)
