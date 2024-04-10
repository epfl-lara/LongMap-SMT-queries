; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51440 () Bool)

(assert start!51440)

(declare-fun b!562271 () Bool)

(declare-fun res!353433 () Bool)

(declare-fun e!324033 () Bool)

(assert (=> b!562271 (=> (not res!353433) (not e!324033))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35305 0))(
  ( (array!35306 (arr!16953 (Array (_ BitVec 32) (_ BitVec 64))) (size!17317 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35305)

(assert (=> b!562271 (= res!353433 (and (= (size!17317 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17317 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17317 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!562272 () Bool)

(declare-fun res!353429 () Bool)

(assert (=> b!562272 (=> (not res!353429) (not e!324033))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562272 (= res!353429 (validKeyInArray!0 k!1914))))

(declare-fun b!562273 () Bool)

(declare-fun e!324035 () Bool)

(declare-fun e!324038 () Bool)

(assert (=> b!562273 (= e!324035 e!324038)))

(declare-fun res!353435 () Bool)

(assert (=> b!562273 (=> res!353435 e!324038)))

(declare-datatypes ((SeekEntryResult!5402 0))(
  ( (MissingZero!5402 (index!23835 (_ BitVec 32))) (Found!5402 (index!23836 (_ BitVec 32))) (Intermediate!5402 (undefined!6214 Bool) (index!23837 (_ BitVec 32)) (x!52737 (_ BitVec 32))) (Undefined!5402) (MissingVacant!5402 (index!23838 (_ BitVec 32))) )
))
(declare-fun lt!256091 () SeekEntryResult!5402)

(assert (=> b!562273 (= res!353435 (or (undefined!6214 lt!256091) (not (is-Intermediate!5402 lt!256091))))))

(declare-fun res!353424 () Bool)

(assert (=> start!51440 (=> (not res!353424) (not e!324033))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51440 (= res!353424 (validMask!0 mask!3119))))

(assert (=> start!51440 e!324033))

(assert (=> start!51440 true))

(declare-fun array_inv!12749 (array!35305) Bool)

(assert (=> start!51440 (array_inv!12749 a!3118)))

(declare-fun b!562274 () Bool)

(declare-fun res!353425 () Bool)

(assert (=> b!562274 (=> (not res!353425) (not e!324033))))

(declare-fun arrayContainsKey!0 (array!35305 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562274 (= res!353425 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!562275 () Bool)

(declare-fun e!324039 () Bool)

(declare-fun e!324034 () Bool)

(assert (=> b!562275 (= e!324039 e!324034)))

(declare-fun res!353431 () Bool)

(assert (=> b!562275 (=> (not res!353431) (not e!324034))))

(declare-fun lt!256087 () SeekEntryResult!5402)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35305 (_ BitVec 32)) SeekEntryResult!5402)

(assert (=> b!562275 (= res!353431 (= lt!256087 (seekKeyOrZeroReturnVacant!0 (x!52737 lt!256091) (index!23837 lt!256091) (index!23837 lt!256091) (select (arr!16953 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!562276 () Bool)

(declare-fun res!353426 () Bool)

(declare-fun e!324032 () Bool)

(assert (=> b!562276 (=> (not res!353426) (not e!324032))))

(declare-datatypes ((List!11033 0))(
  ( (Nil!11030) (Cons!11029 (h!12032 (_ BitVec 64)) (t!17261 List!11033)) )
))
(declare-fun arrayNoDuplicates!0 (array!35305 (_ BitVec 32) List!11033) Bool)

(assert (=> b!562276 (= res!353426 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11030))))

(declare-fun b!562277 () Bool)

(assert (=> b!562277 (= e!324038 e!324039)))

(declare-fun res!353430 () Bool)

(assert (=> b!562277 (=> res!353430 e!324039)))

(declare-fun lt!256085 () (_ BitVec 64))

(assert (=> b!562277 (= res!353430 (or (= lt!256085 (select (arr!16953 a!3118) j!142)) (= lt!256085 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!562277 (= lt!256085 (select (arr!16953 a!3118) (index!23837 lt!256091)))))

(declare-fun b!562278 () Bool)

(declare-fun e!324037 () Bool)

(assert (=> b!562278 (= e!324032 e!324037)))

(declare-fun res!353423 () Bool)

(assert (=> b!562278 (=> (not res!353423) (not e!324037))))

(declare-fun lt!256090 () (_ BitVec 32))

(declare-fun lt!256088 () (_ BitVec 64))

(declare-fun lt!256092 () array!35305)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35305 (_ BitVec 32)) SeekEntryResult!5402)

(assert (=> b!562278 (= res!353423 (= lt!256091 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256090 lt!256088 lt!256092 mask!3119)))))

(declare-fun lt!256086 () (_ BitVec 32))

(assert (=> b!562278 (= lt!256091 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256086 (select (arr!16953 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562278 (= lt!256090 (toIndex!0 lt!256088 mask!3119))))

(assert (=> b!562278 (= lt!256088 (select (store (arr!16953 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!562278 (= lt!256086 (toIndex!0 (select (arr!16953 a!3118) j!142) mask!3119))))

(assert (=> b!562278 (= lt!256092 (array!35306 (store (arr!16953 a!3118) i!1132 k!1914) (size!17317 a!3118)))))

(declare-fun b!562279 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35305 (_ BitVec 32)) SeekEntryResult!5402)

(assert (=> b!562279 (= e!324034 (= (seekEntryOrOpen!0 lt!256088 lt!256092 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52737 lt!256091) (index!23837 lt!256091) (index!23837 lt!256091) lt!256088 lt!256092 mask!3119)))))

(declare-fun b!562280 () Bool)

(assert (=> b!562280 (= e!324033 e!324032)))

(declare-fun res!353432 () Bool)

(assert (=> b!562280 (=> (not res!353432) (not e!324032))))

(declare-fun lt!256093 () SeekEntryResult!5402)

(assert (=> b!562280 (= res!353432 (or (= lt!256093 (MissingZero!5402 i!1132)) (= lt!256093 (MissingVacant!5402 i!1132))))))

(assert (=> b!562280 (= lt!256093 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!562281 () Bool)

(assert (=> b!562281 (= e!324037 (not true))))

(assert (=> b!562281 e!324035))

(declare-fun res!353434 () Bool)

(assert (=> b!562281 (=> (not res!353434) (not e!324035))))

(assert (=> b!562281 (= res!353434 (= lt!256087 (Found!5402 j!142)))))

(assert (=> b!562281 (= lt!256087 (seekEntryOrOpen!0 (select (arr!16953 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35305 (_ BitVec 32)) Bool)

(assert (=> b!562281 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17578 0))(
  ( (Unit!17579) )
))
(declare-fun lt!256089 () Unit!17578)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35305 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17578)

(assert (=> b!562281 (= lt!256089 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!562282 () Bool)

(declare-fun res!353427 () Bool)

(assert (=> b!562282 (=> (not res!353427) (not e!324032))))

(assert (=> b!562282 (= res!353427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!562283 () Bool)

(declare-fun res!353428 () Bool)

(assert (=> b!562283 (=> (not res!353428) (not e!324033))))

(assert (=> b!562283 (= res!353428 (validKeyInArray!0 (select (arr!16953 a!3118) j!142)))))

(assert (= (and start!51440 res!353424) b!562271))

(assert (= (and b!562271 res!353433) b!562283))

(assert (= (and b!562283 res!353428) b!562272))

(assert (= (and b!562272 res!353429) b!562274))

(assert (= (and b!562274 res!353425) b!562280))

(assert (= (and b!562280 res!353432) b!562282))

(assert (= (and b!562282 res!353427) b!562276))

(assert (= (and b!562276 res!353426) b!562278))

(assert (= (and b!562278 res!353423) b!562281))

(assert (= (and b!562281 res!353434) b!562273))

(assert (= (and b!562273 (not res!353435)) b!562277))

(assert (= (and b!562277 (not res!353430)) b!562275))

(assert (= (and b!562275 res!353431) b!562279))

(declare-fun m!540273 () Bool)

(assert (=> b!562276 m!540273))

(declare-fun m!540275 () Bool)

(assert (=> b!562282 m!540275))

(declare-fun m!540277 () Bool)

(assert (=> start!51440 m!540277))

(declare-fun m!540279 () Bool)

(assert (=> start!51440 m!540279))

(declare-fun m!540281 () Bool)

(assert (=> b!562279 m!540281))

(declare-fun m!540283 () Bool)

(assert (=> b!562279 m!540283))

(declare-fun m!540285 () Bool)

(assert (=> b!562274 m!540285))

(declare-fun m!540287 () Bool)

(assert (=> b!562281 m!540287))

(assert (=> b!562281 m!540287))

(declare-fun m!540289 () Bool)

(assert (=> b!562281 m!540289))

(declare-fun m!540291 () Bool)

(assert (=> b!562281 m!540291))

(declare-fun m!540293 () Bool)

(assert (=> b!562281 m!540293))

(assert (=> b!562275 m!540287))

(assert (=> b!562275 m!540287))

(declare-fun m!540295 () Bool)

(assert (=> b!562275 m!540295))

(declare-fun m!540297 () Bool)

(assert (=> b!562278 m!540297))

(assert (=> b!562278 m!540287))

(declare-fun m!540299 () Bool)

(assert (=> b!562278 m!540299))

(declare-fun m!540301 () Bool)

(assert (=> b!562278 m!540301))

(declare-fun m!540303 () Bool)

(assert (=> b!562278 m!540303))

(assert (=> b!562278 m!540287))

(declare-fun m!540305 () Bool)

(assert (=> b!562278 m!540305))

(assert (=> b!562278 m!540287))

(declare-fun m!540307 () Bool)

(assert (=> b!562278 m!540307))

(assert (=> b!562277 m!540287))

(declare-fun m!540309 () Bool)

(assert (=> b!562277 m!540309))

(declare-fun m!540311 () Bool)

(assert (=> b!562280 m!540311))

(assert (=> b!562283 m!540287))

(assert (=> b!562283 m!540287))

(declare-fun m!540313 () Bool)

(assert (=> b!562283 m!540313))

(declare-fun m!540315 () Bool)

(assert (=> b!562272 m!540315))

(push 1)

