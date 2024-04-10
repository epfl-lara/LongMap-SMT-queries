; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86306 () Bool)

(assert start!86306)

(declare-fun b!999029 () Bool)

(declare-fun e!563317 () Bool)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun lt!441887 () (_ BitVec 32))

(assert (=> b!999029 (= e!563317 (and (bvsge mask!3464 #b00000000000000000000000000000000) (or (bvslt lt!441887 #b00000000000000000000000000000000) (bvsge lt!441887 (bvadd #b00000000000000000000000000000001 mask!3464)))))))

(declare-datatypes ((array!63158 0))(
  ( (array!63159 (arr!30406 (Array (_ BitVec 32) (_ BitVec 64))) (size!30908 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63158)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999029 (= lt!441887 (toIndex!0 (select (store (arr!30406 a!3219) i!1194 k!2224) j!170) mask!3464))))

(declare-fun b!999030 () Bool)

(declare-fun res!668673 () Bool)

(declare-fun e!563315 () Bool)

(assert (=> b!999030 (=> (not res!668673) (not e!563315))))

(declare-fun arrayContainsKey!0 (array!63158 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!999030 (= res!668673 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!999031 () Bool)

(declare-fun res!668676 () Bool)

(assert (=> b!999031 (=> (not res!668676) (not e!563315))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!999031 (= res!668676 (validKeyInArray!0 (select (arr!30406 a!3219) j!170)))))

(declare-fun b!999032 () Bool)

(declare-fun e!563314 () Bool)

(assert (=> b!999032 (= e!563314 e!563317)))

(declare-fun res!668669 () Bool)

(assert (=> b!999032 (=> (not res!668669) (not e!563317))))

(declare-datatypes ((SeekEntryResult!9338 0))(
  ( (MissingZero!9338 (index!39723 (_ BitVec 32))) (Found!9338 (index!39724 (_ BitVec 32))) (Intermediate!9338 (undefined!10150 Bool) (index!39725 (_ BitVec 32)) (x!87160 (_ BitVec 32))) (Undefined!9338) (MissingVacant!9338 (index!39726 (_ BitVec 32))) )
))
(declare-fun lt!441885 () SeekEntryResult!9338)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63158 (_ BitVec 32)) SeekEntryResult!9338)

(assert (=> b!999032 (= res!668669 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30406 a!3219) j!170) mask!3464) (select (arr!30406 a!3219) j!170) a!3219 mask!3464) lt!441885))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!999032 (= lt!441885 (Intermediate!9338 false resIndex!38 resX!38))))

(declare-fun b!999033 () Bool)

(declare-fun res!668672 () Bool)

(assert (=> b!999033 (=> (not res!668672) (not e!563314))))

(declare-datatypes ((List!21082 0))(
  ( (Nil!21079) (Cons!21078 (h!22252 (_ BitVec 64)) (t!30083 List!21082)) )
))
(declare-fun arrayNoDuplicates!0 (array!63158 (_ BitVec 32) List!21082) Bool)

(assert (=> b!999033 (= res!668672 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21079))))

(declare-fun b!999034 () Bool)

(declare-fun res!668671 () Bool)

(assert (=> b!999034 (=> (not res!668671) (not e!563315))))

(assert (=> b!999034 (= res!668671 (and (= (size!30908 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30908 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30908 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!668670 () Bool)

(assert (=> start!86306 (=> (not res!668670) (not e!563315))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86306 (= res!668670 (validMask!0 mask!3464))))

(assert (=> start!86306 e!563315))

(declare-fun array_inv!23530 (array!63158) Bool)

(assert (=> start!86306 (array_inv!23530 a!3219)))

(assert (=> start!86306 true))

(declare-fun b!999035 () Bool)

(declare-fun res!668675 () Bool)

(assert (=> b!999035 (=> (not res!668675) (not e!563315))))

(assert (=> b!999035 (= res!668675 (validKeyInArray!0 k!2224))))

(declare-fun b!999036 () Bool)

(declare-fun res!668674 () Bool)

(assert (=> b!999036 (=> (not res!668674) (not e!563317))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!999036 (= res!668674 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30406 a!3219) j!170) a!3219 mask!3464) lt!441885))))

(declare-fun b!999037 () Bool)

(declare-fun res!668668 () Bool)

(assert (=> b!999037 (=> (not res!668668) (not e!563314))))

(assert (=> b!999037 (= res!668668 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30908 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30908 a!3219))))))

(declare-fun b!999038 () Bool)

(declare-fun res!668666 () Bool)

(assert (=> b!999038 (=> (not res!668666) (not e!563314))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63158 (_ BitVec 32)) Bool)

(assert (=> b!999038 (= res!668666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!999039 () Bool)

(assert (=> b!999039 (= e!563315 e!563314)))

(declare-fun res!668667 () Bool)

(assert (=> b!999039 (=> (not res!668667) (not e!563314))))

(declare-fun lt!441886 () SeekEntryResult!9338)

(assert (=> b!999039 (= res!668667 (or (= lt!441886 (MissingVacant!9338 i!1194)) (= lt!441886 (MissingZero!9338 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63158 (_ BitVec 32)) SeekEntryResult!9338)

(assert (=> b!999039 (= lt!441886 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(assert (= (and start!86306 res!668670) b!999034))

(assert (= (and b!999034 res!668671) b!999031))

(assert (= (and b!999031 res!668676) b!999035))

(assert (= (and b!999035 res!668675) b!999030))

(assert (= (and b!999030 res!668673) b!999039))

(assert (= (and b!999039 res!668667) b!999038))

(assert (= (and b!999038 res!668666) b!999033))

(assert (= (and b!999033 res!668672) b!999037))

(assert (= (and b!999037 res!668668) b!999032))

(assert (= (and b!999032 res!668669) b!999036))

(assert (= (and b!999036 res!668674) b!999029))

(declare-fun m!925403 () Bool)

(assert (=> b!999039 m!925403))

(declare-fun m!925405 () Bool)

(assert (=> b!999032 m!925405))

(assert (=> b!999032 m!925405))

(declare-fun m!925407 () Bool)

(assert (=> b!999032 m!925407))

(assert (=> b!999032 m!925407))

(assert (=> b!999032 m!925405))

(declare-fun m!925409 () Bool)

(assert (=> b!999032 m!925409))

(declare-fun m!925411 () Bool)

(assert (=> b!999029 m!925411))

(declare-fun m!925413 () Bool)

(assert (=> b!999029 m!925413))

(assert (=> b!999029 m!925413))

(declare-fun m!925415 () Bool)

(assert (=> b!999029 m!925415))

(assert (=> b!999031 m!925405))

(assert (=> b!999031 m!925405))

(declare-fun m!925417 () Bool)

(assert (=> b!999031 m!925417))

(declare-fun m!925419 () Bool)

(assert (=> b!999035 m!925419))

(declare-fun m!925421 () Bool)

(assert (=> start!86306 m!925421))

(declare-fun m!925423 () Bool)

(assert (=> start!86306 m!925423))

(assert (=> b!999036 m!925405))

(assert (=> b!999036 m!925405))

(declare-fun m!925425 () Bool)

(assert (=> b!999036 m!925425))

(declare-fun m!925427 () Bool)

(assert (=> b!999033 m!925427))

(declare-fun m!925429 () Bool)

(assert (=> b!999030 m!925429))

(declare-fun m!925431 () Bool)

(assert (=> b!999038 m!925431))

(push 1)

(assert (not b!999029))

(assert (not b!999030))

(assert (not b!999038))

(assert (not b!999031))

(assert (not start!86306))

(assert (not b!999033))

(assert (not b!999039))

(assert (not b!999032))

(assert (not b!999035))

(assert (not b!999036))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!999138 () Bool)

(declare-fun lt!441920 () SeekEntryResult!9338)

(assert (=> b!999138 (and (bvsge (index!39725 lt!441920) #b00000000000000000000000000000000) (bvslt (index!39725 lt!441920) (size!30908 a!3219)))))

(declare-fun e!563365 () Bool)

(assert (=> b!999138 (= e!563365 (= (select (arr!30406 a!3219) (index!39725 lt!441920)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!999139 () Bool)

(declare-fun e!563363 () SeekEntryResult!9338)

(assert (=> b!999139 (= e!563363 (Intermediate!9338 true index!1507 x!1245))))

(declare-fun b!999140 () Bool)

(declare-fun e!563366 () Bool)

(declare-fun e!563364 () Bool)

(assert (=> b!999140 (= e!563366 e!563364)))

(declare-fun res!668758 () Bool)

(assert (=> b!999140 (= res!668758 (and (is-Intermediate!9338 lt!441920) (not (undefined!10150 lt!441920)) (bvslt (x!87160 lt!441920) #b01111111111111111111111111111110) (bvsge (x!87160 lt!441920) #b00000000000000000000000000000000) (bvsge (x!87160 lt!441920) x!1245)))))

(assert (=> b!999140 (=> (not res!668758) (not e!563364))))

(declare-fun e!563362 () SeekEntryResult!9338)

(declare-fun b!999141 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999141 (= e!563362 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30406 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!999142 () Bool)

(assert (=> b!999142 (= e!563362 (Intermediate!9338 false index!1507 x!1245))))

(declare-fun d!119263 () Bool)

(assert (=> d!119263 e!563366))

(declare-fun c!101338 () Bool)

(assert (=> d!119263 (= c!101338 (and (is-Intermediate!9338 lt!441920) (undefined!10150 lt!441920)))))

(assert (=> d!119263 (= lt!441920 e!563363)))

(declare-fun c!101340 () Bool)

(assert (=> d!119263 (= c!101340 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!441921 () (_ BitVec 64))

(assert (=> d!119263 (= lt!441921 (select (arr!30406 a!3219) index!1507))))

(assert (=> d!119263 (validMask!0 mask!3464)))

(assert (=> d!119263 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30406 a!3219) j!170) a!3219 mask!3464) lt!441920)))

(declare-fun b!999143 () Bool)

(assert (=> b!999143 (and (bvsge (index!39725 lt!441920) #b00000000000000000000000000000000) (bvslt (index!39725 lt!441920) (size!30908 a!3219)))))

(declare-fun res!668757 () Bool)

(assert (=> b!999143 (= res!668757 (= (select (arr!30406 a!3219) (index!39725 lt!441920)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!999143 (=> res!668757 e!563365)))

(declare-fun b!999144 () Bool)

(assert (=> b!999144 (and (bvsge (index!39725 lt!441920) #b00000000000000000000000000000000) (bvslt (index!39725 lt!441920) (size!30908 a!3219)))))

(declare-fun res!668756 () Bool)

(assert (=> b!999144 (= res!668756 (= (select (arr!30406 a!3219) (index!39725 lt!441920)) (select (arr!30406 a!3219) j!170)))))

(assert (=> b!999144 (=> res!668756 e!563365)))

(assert (=> b!999144 (= e!563364 e!563365)))

(declare-fun b!999147 () Bool)

(assert (=> b!999147 (= e!563363 e!563362)))

(declare-fun c!101339 () Bool)

(assert (=> b!999147 (= c!101339 (or (= lt!441921 (select (arr!30406 a!3219) j!170)) (= (bvadd lt!441921 lt!441921) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!999148 () Bool)

(assert (=> b!999148 (= e!563366 (bvsge (x!87160 lt!441920) #b01111111111111111111111111111110))))

(assert (= (and d!119263 c!101340) b!999139))

(assert (= (and d!119263 (not c!101340)) b!999147))

(assert (= (and b!999147 c!101339) b!999142))

(assert (= (and b!999147 (not c!101339)) b!999141))

(assert (= (and d!119263 c!101338) b!999148))

(assert (= (and d!119263 (not c!101338)) b!999140))

(assert (= (and b!999140 res!668758) b!999144))

(assert (= (and b!999144 (not res!668756)) b!999143))

(assert (= (and b!999143 (not res!668757)) b!999138))

(declare-fun m!925497 () Bool)

(assert (=> d!119263 m!925497))

(assert (=> d!119263 m!925421))

(declare-fun m!925499 () Bool)

(assert (=> b!999143 m!925499))

(declare-fun m!925501 () Bool)

(assert (=> b!999141 m!925501))

(assert (=> b!999141 m!925501))

(assert (=> b!999141 m!925405))

(declare-fun m!925503 () Bool)

(assert (=> b!999141 m!925503))

(assert (=> b!999138 m!925499))

(assert (=> b!999144 m!925499))

(assert (=> b!999036 d!119263))

(declare-fun d!119273 () Bool)

(assert (=> d!119273 (= (validKeyInArray!0 (select (arr!30406 a!3219) j!170)) (and (not (= (select (arr!30406 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30406 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!999031 d!119273))

(declare-fun d!119277 () Bool)

(declare-fun lt!441935 () (_ BitVec 32))

(declare-fun lt!441934 () (_ BitVec 32))

(assert (=> d!119277 (= lt!441935 (bvmul (bvxor lt!441934 (bvlshr lt!441934 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119277 (= lt!441934 ((_ extract 31 0) (bvand (bvxor (select (store (arr!30406 a!3219) i!1194 k!2224) j!170) (bvlshr (select (store (arr!30406 a!3219) i!1194 k!2224) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119277 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!668766 (let ((h!22257 ((_ extract 31 0) (bvand (bvxor (select (store (arr!30406 a!3219) i!1194 k!2224) j!170) (bvlshr (select (store (arr!30406 a!3219) i!1194 k!2224) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87167 (bvmul (bvxor h!22257 (bvlshr h!22257 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87167 (bvlshr x!87167 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!668766 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!668766 #b00000000000000000000000000000000))))))

(assert (=> d!119277 (= (toIndex!0 (select (store (arr!30406 a!3219) i!1194 k!2224) j!170) mask!3464) (bvand (bvxor lt!441935 (bvlshr lt!441935 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!999029 d!119277))

(declare-fun d!119285 () Bool)

(declare-fun res!668780 () Bool)

(declare-fun e!563390 () Bool)

(assert (=> d!119285 (=> res!668780 e!563390)))

(assert (=> d!119285 (= res!668780 (= (select (arr!30406 a!3219) #b00000000000000000000000000000000) k!2224))))

(assert (=> d!119285 (= (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000) e!563390)))

(declare-fun b!999180 () Bool)

(declare-fun e!563391 () Bool)

(assert (=> b!999180 (= e!563390 e!563391)))

(declare-fun res!668781 () Bool)

(assert (=> b!999180 (=> (not res!668781) (not e!563391))))

(assert (=> b!999180 (= res!668781 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30908 a!3219)))))

(declare-fun b!999181 () Bool)

(assert (=> b!999181 (= e!563391 (arrayContainsKey!0 a!3219 k!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119285 (not res!668780)) b!999180))

(assert (= (and b!999180 res!668781) b!999181))

(declare-fun m!925513 () Bool)

(assert (=> d!119285 m!925513))

(declare-fun m!925515 () Bool)

(assert (=> b!999181 m!925515))

(assert (=> b!999030 d!119285))

(declare-fun d!119291 () Bool)

(assert (=> d!119291 (= (validKeyInArray!0 k!2224) (and (not (= k!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!999035 d!119291))

(declare-fun b!999197 () Bool)

(declare-fun e!563406 () Bool)

(declare-fun e!563407 () Bool)

(assert (=> b!999197 (= e!563406 e!563407)))

(declare-fun res!668793 () Bool)

(assert (=> b!999197 (=> (not res!668793) (not e!563407))))

(declare-fun e!563405 () Bool)

(assert (=> b!999197 (= res!668793 (not e!563405))))

(declare-fun res!668792 () Bool)

(assert (=> b!999197 (=> (not res!668792) (not e!563405))))

(assert (=> b!999197 (= res!668792 (validKeyInArray!0 (select (arr!30406 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!999198 () Bool)

(declare-fun e!563404 () Bool)

(declare-fun call!42299 () Bool)

(assert (=> b!999198 (= e!563404 call!42299)))

(declare-fun b!999199 () Bool)

(assert (=> b!999199 (= e!563407 e!563404)))

(declare-fun c!101351 () Bool)

(assert (=> b!999199 (= c!101351 (validKeyInArray!0 (select (arr!30406 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!999200 () Bool)

(declare-fun contains!5878 (List!21082 (_ BitVec 64)) Bool)

(assert (=> b!999200 (= e!563405 (contains!5878 Nil!21079 (select (arr!30406 a!3219) #b00000000000000000000000000000000)))))

(declare-fun bm!42296 () Bool)

(assert (=> bm!42296 (= call!42299 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101351 (Cons!21078 (select (arr!30406 a!3219) #b00000000000000000000000000000000) Nil!21079) Nil!21079)))))

(declare-fun b!999201 () Bool)

(assert (=> b!999201 (= e!563404 call!42299)))

(declare-fun d!119293 () Bool)

(declare-fun res!668791 () Bool)

(assert (=> d!119293 (=> res!668791 e!563406)))

(assert (=> d!119293 (= res!668791 (bvsge #b00000000000000000000000000000000 (size!30908 a!3219)))))

(assert (=> d!119293 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21079) e!563406)))

(assert (= (and d!119293 (not res!668791)) b!999197))

(assert (= (and b!999197 res!668792) b!999200))

(assert (= (and b!999197 res!668793) b!999199))

(assert (= (and b!999199 c!101351) b!999201))

(assert (= (and b!999199 (not c!101351)) b!999198))

(assert (= (or b!999201 b!999198) bm!42296))

(assert (=> b!999197 m!925513))

(assert (=> b!999197 m!925513))

(declare-fun m!925523 () Bool)

(assert (=> b!999197 m!925523))

(assert (=> b!999199 m!925513))

(assert (=> b!999199 m!925513))

(assert (=> b!999199 m!925523))

(assert (=> b!999200 m!925513))

(assert (=> b!999200 m!925513))

(declare-fun m!925525 () Bool)

(assert (=> b!999200 m!925525))

(assert (=> bm!42296 m!925513))

(declare-fun m!925527 () Bool)

(assert (=> bm!42296 m!925527))

(assert (=> b!999033 d!119293))

(declare-fun d!119297 () Bool)

(declare-fun lt!441962 () SeekEntryResult!9338)

(assert (=> d!119297 (and (or (is-Undefined!9338 lt!441962) (not (is-Found!9338 lt!441962)) (and (bvsge (index!39724 lt!441962) #b00000000000000000000000000000000) (bvslt (index!39724 lt!441962) (size!30908 a!3219)))) (or (is-Undefined!9338 lt!441962) (is-Found!9338 lt!441962) (not (is-MissingZero!9338 lt!441962)) (and (bvsge (index!39723 lt!441962) #b00000000000000000000000000000000) (bvslt (index!39723 lt!441962) (size!30908 a!3219)))) (or (is-Undefined!9338 lt!441962) (is-Found!9338 lt!441962) (is-MissingZero!9338 lt!441962) (not (is-MissingVacant!9338 lt!441962)) (and (bvsge (index!39726 lt!441962) #b00000000000000000000000000000000) (bvslt (index!39726 lt!441962) (size!30908 a!3219)))) (or (is-Undefined!9338 lt!441962) (ite (is-Found!9338 lt!441962) (= (select (arr!30406 a!3219) (index!39724 lt!441962)) k!2224) (ite (is-MissingZero!9338 lt!441962) (= (select (arr!30406 a!3219) (index!39723 lt!441962)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!9338 lt!441962) (= (select (arr!30406 a!3219) (index!39726 lt!441962)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!563433 () SeekEntryResult!9338)

(assert (=> d!119297 (= lt!441962 e!563433)))

(declare-fun c!101377 () Bool)

(declare-fun lt!441963 () SeekEntryResult!9338)

(assert (=> d!119297 (= c!101377 (and (is-Intermediate!9338 lt!441963) (undefined!10150 lt!441963)))))

(assert (=> d!119297 (= lt!441963 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2224 mask!3464) k!2224 a!3219 mask!3464))))

(assert (=> d!119297 (validMask!0 mask!3464)))

(assert (=> d!119297 (= (seekEntryOrOpen!0 k!2224 a!3219 mask!3464) lt!441962)))

(declare-fun b!999250 () Bool)

(assert (=> b!999250 (= e!563433 Undefined!9338)))

(declare-fun b!999251 () Bool)

(declare-fun e!563432 () SeekEntryResult!9338)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63158 (_ BitVec 32)) SeekEntryResult!9338)

(assert (=> b!999251 (= e!563432 (seekKeyOrZeroReturnVacant!0 (x!87160 lt!441963) (index!39725 lt!441963) (index!39725 lt!441963) k!2224 a!3219 mask!3464))))

(declare-fun b!999252 () Bool)

(declare-fun e!563434 () SeekEntryResult!9338)

(assert (=> b!999252 (= e!563434 (Found!9338 (index!39725 lt!441963)))))

(declare-fun b!999253 () Bool)

(assert (=> b!999253 (= e!563433 e!563434)))

(declare-fun lt!441964 () (_ BitVec 64))

(assert (=> b!999253 (= lt!441964 (select (arr!30406 a!3219) (index!39725 lt!441963)))))

(declare-fun c!101376 () Bool)

(assert (=> b!999253 (= c!101376 (= lt!441964 k!2224))))

(declare-fun b!999254 () Bool)

(declare-fun c!101378 () Bool)

(assert (=> b!999254 (= c!101378 (= lt!441964 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!999254 (= e!563434 e!563432)))

(declare-fun b!999255 () Bool)

(assert (=> b!999255 (= e!563432 (MissingZero!9338 (index!39725 lt!441963)))))

(assert (= (and d!119297 c!101377) b!999250))

(assert (= (and d!119297 (not c!101377)) b!999253))

(assert (= (and b!999253 c!101376) b!999252))

(assert (= (and b!999253 (not c!101376)) b!999254))

(assert (= (and b!999254 c!101378) b!999255))

(assert (= (and b!999254 (not c!101378)) b!999251))

(declare-fun m!925557 () Bool)

(assert (=> d!119297 m!925557))

(declare-fun m!925559 () Bool)

(assert (=> d!119297 m!925559))

(declare-fun m!925561 () Bool)

(assert (=> d!119297 m!925561))

(assert (=> d!119297 m!925561))

(declare-fun m!925563 () Bool)

(assert (=> d!119297 m!925563))

(assert (=> d!119297 m!925421))

(declare-fun m!925565 () Bool)

(assert (=> d!119297 m!925565))

(declare-fun m!925567 () Bool)

(assert (=> b!999251 m!925567))

(declare-fun m!925569 () Bool)

(assert (=> b!999253 m!925569))

(assert (=> b!999039 d!119297))

(declare-fun b!999256 () Bool)

(declare-fun lt!441965 () SeekEntryResult!9338)

(assert (=> b!999256 (and (bvsge (index!39725 lt!441965) #b00000000000000000000000000000000) (bvslt (index!39725 lt!441965) (size!30908 a!3219)))))

(declare-fun e!563438 () Bool)

(assert (=> b!999256 (= e!563438 (= (select (arr!30406 a!3219) (index!39725 lt!441965)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!999257 () Bool)

(declare-fun e!563436 () SeekEntryResult!9338)

(assert (=> b!999257 (= e!563436 (Intermediate!9338 true (toIndex!0 (select (arr!30406 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!999258 () Bool)

(declare-fun e!563439 () Bool)

(declare-fun e!563437 () Bool)

(assert (=> b!999258 (= e!563439 e!563437)))

(declare-fun res!668796 () Bool)

(assert (=> b!999258 (= res!668796 (and (is-Intermediate!9338 lt!441965) (not (undefined!10150 lt!441965)) (bvslt (x!87160 lt!441965) #b01111111111111111111111111111110) (bvsge (x!87160 lt!441965) #b00000000000000000000000000000000) (bvsge (x!87160 lt!441965) #b00000000000000000000000000000000)))))

(assert (=> b!999258 (=> (not res!668796) (not e!563437))))

(declare-fun b!999259 () Bool)

(declare-fun e!563435 () SeekEntryResult!9338)

(assert (=> b!999259 (= e!563435 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30406 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (select (arr!30406 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!999260 () Bool)

(assert (=> b!999260 (= e!563435 (Intermediate!9338 false (toIndex!0 (select (arr!30406 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun d!119303 () Bool)

(assert (=> d!119303 e!563439))

(declare-fun c!101379 () Bool)

(assert (=> d!119303 (= c!101379 (and (is-Intermediate!9338 lt!441965) (undefined!10150 lt!441965)))))

(assert (=> d!119303 (= lt!441965 e!563436)))

(declare-fun c!101381 () Bool)

(assert (=> d!119303 (= c!101381 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!441966 () (_ BitVec 64))

(assert (=> d!119303 (= lt!441966 (select (arr!30406 a!3219) (toIndex!0 (select (arr!30406 a!3219) j!170) mask!3464)))))

(assert (=> d!119303 (validMask!0 mask!3464)))

(assert (=> d!119303 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30406 a!3219) j!170) mask!3464) (select (arr!30406 a!3219) j!170) a!3219 mask!3464) lt!441965)))

(declare-fun b!999261 () Bool)

(assert (=> b!999261 (and (bvsge (index!39725 lt!441965) #b00000000000000000000000000000000) (bvslt (index!39725 lt!441965) (size!30908 a!3219)))))

(declare-fun res!668795 () Bool)

(assert (=> b!999261 (= res!668795 (= (select (arr!30406 a!3219) (index!39725 lt!441965)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!999261 (=> res!668795 e!563438)))

(declare-fun b!999262 () Bool)

(assert (=> b!999262 (and (bvsge (index!39725 lt!441965) #b00000000000000000000000000000000) (bvslt (index!39725 lt!441965) (size!30908 a!3219)))))

(declare-fun res!668794 () Bool)

(assert (=> b!999262 (= res!668794 (= (select (arr!30406 a!3219) (index!39725 lt!441965)) (select (arr!30406 a!3219) j!170)))))

(assert (=> b!999262 (=> res!668794 e!563438)))

(assert (=> b!999262 (= e!563437 e!563438)))

(declare-fun b!999263 () Bool)

(assert (=> b!999263 (= e!563436 e!563435)))

(declare-fun c!101380 () Bool)

(assert (=> b!999263 (= c!101380 (or (= lt!441966 (select (arr!30406 a!3219) j!170)) (= (bvadd lt!441966 lt!441966) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!999264 () Bool)

(assert (=> b!999264 (= e!563439 (bvsge (x!87160 lt!441965) #b01111111111111111111111111111110))))

(assert (= (and d!119303 c!101381) b!999257))

(assert (= (and d!119303 (not c!101381)) b!999263))

(assert (= (and b!999263 c!101380) b!999260))

(assert (= (and b!999263 (not c!101380)) b!999259))

(assert (= (and d!119303 c!101379) b!999264))

(assert (= (and d!119303 (not c!101379)) b!999258))

(assert (= (and b!999258 res!668796) b!999262))

(assert (= (and b!999262 (not res!668794)) b!999261))

(assert (= (and b!999261 (not res!668795)) b!999256))

(assert (=> d!119303 m!925407))

(declare-fun m!925571 () Bool)

(assert (=> d!119303 m!925571))

(assert (=> d!119303 m!925421))

(declare-fun m!925573 () Bool)

(assert (=> b!999261 m!925573))

(assert (=> b!999259 m!925407))

(declare-fun m!925575 () Bool)

(assert (=> b!999259 m!925575))

(assert (=> b!999259 m!925575))

(assert (=> b!999259 m!925405))

(declare-fun m!925577 () Bool)

(assert (=> b!999259 m!925577))

(assert (=> b!999256 m!925573))

(assert (=> b!999262 m!925573))

(assert (=> b!999032 d!119303))

(declare-fun d!119305 () Bool)

(declare-fun lt!441968 () (_ BitVec 32))

(declare-fun lt!441967 () (_ BitVec 32))

(assert (=> d!119305 (= lt!441968 (bvmul (bvxor lt!441967 (bvlshr lt!441967 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119305 (= lt!441967 ((_ extract 31 0) (bvand (bvxor (select (arr!30406 a!3219) j!170) (bvlshr (select (arr!30406 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119305 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!668766 (let ((h!22257 ((_ extract 31 0) (bvand (bvxor (select (arr!30406 a!3219) j!170) (bvlshr (select (arr!30406 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87167 (bvmul (bvxor h!22257 (bvlshr h!22257 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87167 (bvlshr x!87167 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!668766 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!668766 #b00000000000000000000000000000000))))))

(assert (=> d!119305 (= (toIndex!0 (select (arr!30406 a!3219) j!170) mask!3464) (bvand (bvxor lt!441968 (bvlshr lt!441968 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!999032 d!119305))

(declare-fun d!119307 () Bool)

(assert (=> d!119307 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!86306 d!119307))

(declare-fun d!119311 () Bool)

(assert (=> d!119311 (= (array_inv!23530 a!3219) (bvsge (size!30908 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!86306 d!119311))

(declare-fun d!119313 () Bool)

(declare-fun res!668819 () Bool)

(declare-fun e!563475 () Bool)

(assert (=> d!119313 (=> res!668819 e!563475)))

(assert (=> d!119313 (= res!668819 (bvsge #b00000000000000000000000000000000 (size!30908 a!3219)))))

(assert (=> d!119313 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!563475)))

(declare-fun b!999321 () Bool)

(declare-fun e!563477 () Bool)

(declare-fun call!42305 () Bool)

(assert (=> b!999321 (= e!563477 call!42305)))

(declare-fun b!999322 () Bool)

(declare-fun e!563476 () Bool)

(assert (=> b!999322 (= e!563476 e!563477)))

(declare-fun lt!441994 () (_ BitVec 64))

(assert (=> b!999322 (= lt!441994 (select (arr!30406 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32994 0))(
  ( (Unit!32995) )
))
(declare-fun lt!441992 () Unit!32994)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63158 (_ BitVec 64) (_ BitVec 32)) Unit!32994)

(assert (=> b!999322 (= lt!441992 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!441994 #b00000000000000000000000000000000))))

(assert (=> b!999322 (arrayContainsKey!0 a!3219 lt!441994 #b00000000000000000000000000000000)))

(declare-fun lt!441993 () Unit!32994)

(assert (=> b!999322 (= lt!441993 lt!441992)))

(declare-fun res!668820 () Bool)

(assert (=> b!999322 (= res!668820 (= (seekEntryOrOpen!0 (select (arr!30406 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9338 #b00000000000000000000000000000000)))))

(assert (=> b!999322 (=> (not res!668820) (not e!563477))))

(declare-fun bm!42302 () Bool)

(assert (=> bm!42302 (= call!42305 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!999323 () Bool)

(assert (=> b!999323 (= e!563475 e!563476)))

(declare-fun c!101399 () Bool)

(assert (=> b!999323 (= c!101399 (validKeyInArray!0 (select (arr!30406 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!999324 () Bool)

(assert (=> b!999324 (= e!563476 call!42305)))

(assert (= (and d!119313 (not res!668819)) b!999323))

(assert (= (and b!999323 c!101399) b!999322))

(assert (= (and b!999323 (not c!101399)) b!999324))

(assert (= (and b!999322 res!668820) b!999321))

(assert (= (or b!999321 b!999324) bm!42302))

(assert (=> b!999322 m!925513))

(declare-fun m!925603 () Bool)

(assert (=> b!999322 m!925603))

(declare-fun m!925605 () Bool)

(assert (=> b!999322 m!925605))

(assert (=> b!999322 m!925513))

(declare-fun m!925607 () Bool)

(assert (=> b!999322 m!925607))

(declare-fun m!925609 () Bool)

(assert (=> bm!42302 m!925609))

(assert (=> b!999323 m!925513))

(assert (=> b!999323 m!925513))

(assert (=> b!999323 m!925523))

(assert (=> b!999038 d!119313))

(push 1)

(assert (not b!999200))

(assert (not b!999259))

(assert (not b!999199))

(assert (not d!119263))

(assert (not b!999197))

(assert (not bm!42296))

(assert (not b!999322))

(assert (not b!999251))

(assert (not b!999323))

(assert (not d!119297))

(assert (not b!999141))

(assert (not bm!42302))

(assert (not b!999181))

(assert (not d!119303))

(check-sat)

(pop 1)

(push 1)

(check-sat)

