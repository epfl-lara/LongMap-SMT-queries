; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50986 () Bool)

(assert start!50986)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!557351 () Bool)

(declare-fun e!321099 () Bool)

(declare-datatypes ((array!35097 0))(
  ( (array!35098 (arr!16855 (Array (_ BitVec 32) (_ BitVec 64))) (size!17219 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35097)

(declare-datatypes ((SeekEntryResult!5304 0))(
  ( (MissingZero!5304 (index!23443 (_ BitVec 32))) (Found!5304 (index!23444 (_ BitVec 32))) (Intermediate!5304 (undefined!6116 Bool) (index!23445 (_ BitVec 32)) (x!52342 (_ BitVec 32))) (Undefined!5304) (MissingVacant!5304 (index!23446 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35097 (_ BitVec 32)) SeekEntryResult!5304)

(assert (=> b!557351 (= e!321099 (= (seekEntryOrOpen!0 (select (arr!16855 a!3118) j!142) a!3118 mask!3119) (Found!5304 j!142)))))

(declare-fun b!557352 () Bool)

(declare-fun res!349401 () Bool)

(declare-fun e!321096 () Bool)

(assert (=> b!557352 (=> (not res!349401) (not e!321096))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!557352 (= res!349401 (and (= (size!17219 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17219 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17219 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!557353 () Bool)

(declare-fun e!321098 () Bool)

(assert (=> b!557353 (= e!321098 (not true))))

(assert (=> b!557353 e!321099))

(declare-fun res!349403 () Bool)

(assert (=> b!557353 (=> (not res!349403) (not e!321099))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35097 (_ BitVec 32)) Bool)

(assert (=> b!557353 (= res!349403 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17382 0))(
  ( (Unit!17383) )
))
(declare-fun lt!253267 () Unit!17382)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35097 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17382)

(assert (=> b!557353 (= lt!253267 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!349398 () Bool)

(assert (=> start!50986 (=> (not res!349398) (not e!321096))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50986 (= res!349398 (validMask!0 mask!3119))))

(assert (=> start!50986 e!321096))

(assert (=> start!50986 true))

(declare-fun array_inv!12651 (array!35097) Bool)

(assert (=> start!50986 (array_inv!12651 a!3118)))

(declare-fun b!557354 () Bool)

(declare-fun res!349405 () Bool)

(assert (=> b!557354 (=> (not res!349405) (not e!321098))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35097 (_ BitVec 32)) SeekEntryResult!5304)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!557354 (= res!349405 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16855 a!3118) j!142) mask!3119) (select (arr!16855 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16855 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16855 a!3118) i!1132 k0!1914) j!142) (array!35098 (store (arr!16855 a!3118) i!1132 k0!1914) (size!17219 a!3118)) mask!3119)))))

(declare-fun b!557355 () Bool)

(declare-fun res!349402 () Bool)

(assert (=> b!557355 (=> (not res!349402) (not e!321096))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!557355 (= res!349402 (validKeyInArray!0 k0!1914))))

(declare-fun b!557356 () Bool)

(assert (=> b!557356 (= e!321096 e!321098)))

(declare-fun res!349406 () Bool)

(assert (=> b!557356 (=> (not res!349406) (not e!321098))))

(declare-fun lt!253266 () SeekEntryResult!5304)

(assert (=> b!557356 (= res!349406 (or (= lt!253266 (MissingZero!5304 i!1132)) (= lt!253266 (MissingVacant!5304 i!1132))))))

(assert (=> b!557356 (= lt!253266 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!557357 () Bool)

(declare-fun res!349400 () Bool)

(assert (=> b!557357 (=> (not res!349400) (not e!321098))))

(assert (=> b!557357 (= res!349400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!557358 () Bool)

(declare-fun res!349397 () Bool)

(assert (=> b!557358 (=> (not res!349397) (not e!321096))))

(declare-fun arrayContainsKey!0 (array!35097 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!557358 (= res!349397 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!557359 () Bool)

(declare-fun res!349399 () Bool)

(assert (=> b!557359 (=> (not res!349399) (not e!321098))))

(declare-datatypes ((List!10935 0))(
  ( (Nil!10932) (Cons!10931 (h!11922 (_ BitVec 64)) (t!17163 List!10935)) )
))
(declare-fun arrayNoDuplicates!0 (array!35097 (_ BitVec 32) List!10935) Bool)

(assert (=> b!557359 (= res!349399 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10932))))

(declare-fun b!557360 () Bool)

(declare-fun res!349404 () Bool)

(assert (=> b!557360 (=> (not res!349404) (not e!321096))))

(assert (=> b!557360 (= res!349404 (validKeyInArray!0 (select (arr!16855 a!3118) j!142)))))

(assert (= (and start!50986 res!349398) b!557352))

(assert (= (and b!557352 res!349401) b!557360))

(assert (= (and b!557360 res!349404) b!557355))

(assert (= (and b!557355 res!349402) b!557358))

(assert (= (and b!557358 res!349397) b!557356))

(assert (= (and b!557356 res!349406) b!557357))

(assert (= (and b!557357 res!349400) b!557359))

(assert (= (and b!557359 res!349399) b!557354))

(assert (= (and b!557354 res!349405) b!557353))

(assert (= (and b!557353 res!349403) b!557351))

(declare-fun m!535251 () Bool)

(assert (=> start!50986 m!535251))

(declare-fun m!535253 () Bool)

(assert (=> start!50986 m!535253))

(declare-fun m!535255 () Bool)

(assert (=> b!557357 m!535255))

(declare-fun m!535257 () Bool)

(assert (=> b!557360 m!535257))

(assert (=> b!557360 m!535257))

(declare-fun m!535259 () Bool)

(assert (=> b!557360 m!535259))

(declare-fun m!535261 () Bool)

(assert (=> b!557359 m!535261))

(declare-fun m!535263 () Bool)

(assert (=> b!557355 m!535263))

(declare-fun m!535265 () Bool)

(assert (=> b!557358 m!535265))

(declare-fun m!535267 () Bool)

(assert (=> b!557356 m!535267))

(assert (=> b!557354 m!535257))

(declare-fun m!535269 () Bool)

(assert (=> b!557354 m!535269))

(assert (=> b!557354 m!535257))

(declare-fun m!535271 () Bool)

(assert (=> b!557354 m!535271))

(declare-fun m!535273 () Bool)

(assert (=> b!557354 m!535273))

(assert (=> b!557354 m!535271))

(declare-fun m!535275 () Bool)

(assert (=> b!557354 m!535275))

(assert (=> b!557354 m!535269))

(assert (=> b!557354 m!535257))

(declare-fun m!535277 () Bool)

(assert (=> b!557354 m!535277))

(declare-fun m!535279 () Bool)

(assert (=> b!557354 m!535279))

(assert (=> b!557354 m!535271))

(assert (=> b!557354 m!535273))

(declare-fun m!535281 () Bool)

(assert (=> b!557353 m!535281))

(declare-fun m!535283 () Bool)

(assert (=> b!557353 m!535283))

(assert (=> b!557351 m!535257))

(assert (=> b!557351 m!535257))

(declare-fun m!535285 () Bool)

(assert (=> b!557351 m!535285))

(check-sat (not b!557356) (not b!557357) (not b!557355) (not b!557358) (not b!557354) (not start!50986) (not b!557351) (not b!557353) (not b!557359) (not b!557360))
(check-sat)
