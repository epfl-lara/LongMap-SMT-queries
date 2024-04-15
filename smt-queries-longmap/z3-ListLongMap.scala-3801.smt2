; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52148 () Bool)

(assert start!52148)

(declare-fun b!569048 () Bool)

(declare-fun res!359209 () Bool)

(declare-fun e!327354 () Bool)

(assert (=> b!569048 (=> (not res!359209) (not e!327354))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35680 0))(
  ( (array!35681 (arr!17132 (Array (_ BitVec 32) (_ BitVec 64))) (size!17497 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35680)

(assert (=> b!569048 (= res!359209 (and (= (size!17497 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17497 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17497 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!569049 () Bool)

(declare-fun res!359211 () Bool)

(declare-fun e!327351 () Bool)

(assert (=> b!569049 (=> (not res!359211) (not e!327351))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35680 (_ BitVec 32)) Bool)

(assert (=> b!569049 (= res!359211 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569050 () Bool)

(declare-fun e!327352 () Bool)

(assert (=> b!569050 (= e!327351 e!327352)))

(declare-fun res!359208 () Bool)

(assert (=> b!569050 (=> (not res!359208) (not e!327352))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5578 0))(
  ( (MissingZero!5578 (index!24539 (_ BitVec 32))) (Found!5578 (index!24540 (_ BitVec 32))) (Intermediate!5578 (undefined!6390 Bool) (index!24541 (_ BitVec 32)) (x!53424 (_ BitVec 32))) (Undefined!5578) (MissingVacant!5578 (index!24542 (_ BitVec 32))) )
))
(declare-fun lt!259231 () SeekEntryResult!5578)

(declare-fun lt!259229 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35680 (_ BitVec 32)) SeekEntryResult!5578)

(assert (=> b!569050 (= res!359208 (= lt!259231 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259229 (select (store (arr!17132 a!3118) i!1132 k0!1914) j!142) (array!35681 (store (arr!17132 a!3118) i!1132 k0!1914) (size!17497 a!3118)) mask!3119)))))

(declare-fun lt!259232 () (_ BitVec 32))

(assert (=> b!569050 (= lt!259231 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259232 (select (arr!17132 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569050 (= lt!259229 (toIndex!0 (select (store (arr!17132 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!569050 (= lt!259232 (toIndex!0 (select (arr!17132 a!3118) j!142) mask!3119))))

(declare-fun b!569051 () Bool)

(assert (=> b!569051 (= e!327354 e!327351)))

(declare-fun res!359216 () Bool)

(assert (=> b!569051 (=> (not res!359216) (not e!327351))))

(declare-fun lt!259230 () SeekEntryResult!5578)

(assert (=> b!569051 (= res!359216 (or (= lt!259230 (MissingZero!5578 i!1132)) (= lt!259230 (MissingVacant!5578 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35680 (_ BitVec 32)) SeekEntryResult!5578)

(assert (=> b!569051 (= lt!259230 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!569052 () Bool)

(declare-fun res!359213 () Bool)

(assert (=> b!569052 (=> (not res!359213) (not e!327351))))

(declare-datatypes ((List!11251 0))(
  ( (Nil!11248) (Cons!11247 (h!12268 (_ BitVec 64)) (t!17470 List!11251)) )
))
(declare-fun arrayNoDuplicates!0 (array!35680 (_ BitVec 32) List!11251) Bool)

(assert (=> b!569052 (= res!359213 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11248))))

(declare-fun b!569053 () Bool)

(declare-fun res!359214 () Bool)

(assert (=> b!569053 (=> (not res!359214) (not e!327354))))

(declare-fun arrayContainsKey!0 (array!35680 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569053 (= res!359214 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569055 () Bool)

(declare-fun res!359210 () Bool)

(assert (=> b!569055 (=> (not res!359210) (not e!327354))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569055 (= res!359210 (validKeyInArray!0 k0!1914))))

(declare-fun b!569056 () Bool)

(get-info :version)

(assert (=> b!569056 (= e!327352 (not (or (undefined!6390 lt!259231) (not ((_ is Intermediate!5578) lt!259231)) (= (select (arr!17132 a!3118) (index!24541 lt!259231)) (select (arr!17132 a!3118) j!142)) (not (= (select (arr!17132 a!3118) (index!24541 lt!259231)) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!259234 () SeekEntryResult!5578)

(assert (=> b!569056 (and (= lt!259234 (Found!5578 j!142)) (or (undefined!6390 lt!259231) (not ((_ is Intermediate!5578) lt!259231)) (= (select (arr!17132 a!3118) (index!24541 lt!259231)) (select (arr!17132 a!3118) j!142)) (not (= (select (arr!17132 a!3118) (index!24541 lt!259231)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259234 (MissingZero!5578 (index!24541 lt!259231)))))))

(assert (=> b!569056 (= lt!259234 (seekEntryOrOpen!0 (select (arr!17132 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!569056 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17844 0))(
  ( (Unit!17845) )
))
(declare-fun lt!259233 () Unit!17844)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35680 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17844)

(assert (=> b!569056 (= lt!259233 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!359212 () Bool)

(assert (=> start!52148 (=> (not res!359212) (not e!327354))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52148 (= res!359212 (validMask!0 mask!3119))))

(assert (=> start!52148 e!327354))

(assert (=> start!52148 true))

(declare-fun array_inv!13015 (array!35680) Bool)

(assert (=> start!52148 (array_inv!13015 a!3118)))

(declare-fun b!569054 () Bool)

(declare-fun res!359215 () Bool)

(assert (=> b!569054 (=> (not res!359215) (not e!327354))))

(assert (=> b!569054 (= res!359215 (validKeyInArray!0 (select (arr!17132 a!3118) j!142)))))

(assert (= (and start!52148 res!359212) b!569048))

(assert (= (and b!569048 res!359209) b!569054))

(assert (= (and b!569054 res!359215) b!569055))

(assert (= (and b!569055 res!359210) b!569053))

(assert (= (and b!569053 res!359214) b!569051))

(assert (= (and b!569051 res!359216) b!569049))

(assert (= (and b!569049 res!359211) b!569052))

(assert (= (and b!569052 res!359213) b!569050))

(assert (= (and b!569050 res!359208) b!569056))

(declare-fun m!547229 () Bool)

(assert (=> b!569051 m!547229))

(declare-fun m!547231 () Bool)

(assert (=> b!569055 m!547231))

(declare-fun m!547233 () Bool)

(assert (=> b!569054 m!547233))

(assert (=> b!569054 m!547233))

(declare-fun m!547235 () Bool)

(assert (=> b!569054 m!547235))

(declare-fun m!547237 () Bool)

(assert (=> b!569052 m!547237))

(declare-fun m!547239 () Bool)

(assert (=> b!569053 m!547239))

(assert (=> b!569050 m!547233))

(declare-fun m!547241 () Bool)

(assert (=> b!569050 m!547241))

(assert (=> b!569050 m!547233))

(assert (=> b!569050 m!547233))

(declare-fun m!547243 () Bool)

(assert (=> b!569050 m!547243))

(declare-fun m!547245 () Bool)

(assert (=> b!569050 m!547245))

(declare-fun m!547247 () Bool)

(assert (=> b!569050 m!547247))

(assert (=> b!569050 m!547245))

(declare-fun m!547249 () Bool)

(assert (=> b!569050 m!547249))

(assert (=> b!569050 m!547245))

(declare-fun m!547251 () Bool)

(assert (=> b!569050 m!547251))

(declare-fun m!547253 () Bool)

(assert (=> b!569049 m!547253))

(assert (=> b!569056 m!547233))

(declare-fun m!547255 () Bool)

(assert (=> b!569056 m!547255))

(declare-fun m!547257 () Bool)

(assert (=> b!569056 m!547257))

(declare-fun m!547259 () Bool)

(assert (=> b!569056 m!547259))

(assert (=> b!569056 m!547233))

(declare-fun m!547261 () Bool)

(assert (=> b!569056 m!547261))

(declare-fun m!547263 () Bool)

(assert (=> start!52148 m!547263))

(declare-fun m!547265 () Bool)

(assert (=> start!52148 m!547265))

(check-sat (not b!569055) (not start!52148) (not b!569050) (not b!569049) (not b!569053) (not b!569052) (not b!569054) (not b!569051) (not b!569056))
(check-sat)
