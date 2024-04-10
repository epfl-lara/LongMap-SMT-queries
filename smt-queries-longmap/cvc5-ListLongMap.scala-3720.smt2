; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51248 () Bool)

(assert start!51248)

(declare-fun b!559483 () Bool)

(declare-fun e!322325 () Bool)

(declare-fun e!322322 () Bool)

(assert (=> b!559483 (= e!322325 e!322322)))

(declare-fun res!350882 () Bool)

(assert (=> b!559483 (=> (not res!350882) (not e!322322))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!254268 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5339 0))(
  ( (MissingZero!5339 (index!23583 (_ BitVec 32))) (Found!5339 (index!23584 (_ BitVec 32))) (Intermediate!5339 (undefined!6151 Bool) (index!23585 (_ BitVec 32)) (x!52497 (_ BitVec 32))) (Undefined!5339) (MissingVacant!5339 (index!23586 (_ BitVec 32))) )
))
(declare-fun lt!254269 () SeekEntryResult!5339)

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35176 0))(
  ( (array!35177 (arr!16890 (Array (_ BitVec 32) (_ BitVec 64))) (size!17254 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35176)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35176 (_ BitVec 32)) SeekEntryResult!5339)

(assert (=> b!559483 (= res!350882 (= lt!254269 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254268 (select (store (arr!16890 a!3118) i!1132 k!1914) j!142) (array!35177 (store (arr!16890 a!3118) i!1132 k!1914) (size!17254 a!3118)) mask!3119)))))

(declare-fun lt!254272 () (_ BitVec 32))

(assert (=> b!559483 (= lt!254269 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254272 (select (arr!16890 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!559483 (= lt!254268 (toIndex!0 (select (store (arr!16890 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!559483 (= lt!254272 (toIndex!0 (select (arr!16890 a!3118) j!142) mask!3119))))

(declare-fun b!559484 () Bool)

(declare-fun res!350875 () Bool)

(declare-fun e!322323 () Bool)

(assert (=> b!559484 (=> (not res!350875) (not e!322323))))

(declare-fun arrayContainsKey!0 (array!35176 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!559484 (= res!350875 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!559485 () Bool)

(declare-fun res!350876 () Bool)

(assert (=> b!559485 (=> (not res!350876) (not e!322323))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!559485 (= res!350876 (validKeyInArray!0 (select (arr!16890 a!3118) j!142)))))

(declare-fun b!559487 () Bool)

(declare-fun res!350880 () Bool)

(assert (=> b!559487 (=> (not res!350880) (not e!322323))))

(assert (=> b!559487 (= res!350880 (validKeyInArray!0 k!1914))))

(declare-fun b!559488 () Bool)

(declare-fun lt!254267 () SeekEntryResult!5339)

(declare-fun e!322326 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35176 (_ BitVec 32)) SeekEntryResult!5339)

(assert (=> b!559488 (= e!322326 (= lt!254267 (seekKeyOrZeroReturnVacant!0 (x!52497 lt!254269) (index!23585 lt!254269) (index!23585 lt!254269) (select (arr!16890 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!559489 () Bool)

(declare-fun res!350873 () Bool)

(assert (=> b!559489 (=> (not res!350873) (not e!322325))))

(declare-datatypes ((List!10970 0))(
  ( (Nil!10967) (Cons!10966 (h!11966 (_ BitVec 64)) (t!17198 List!10970)) )
))
(declare-fun arrayNoDuplicates!0 (array!35176 (_ BitVec 32) List!10970) Bool)

(assert (=> b!559489 (= res!350873 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10967))))

(declare-fun b!559490 () Bool)

(assert (=> b!559490 (= e!322322 (not true))))

(declare-fun e!322324 () Bool)

(assert (=> b!559490 e!322324))

(declare-fun res!350872 () Bool)

(assert (=> b!559490 (=> (not res!350872) (not e!322324))))

(assert (=> b!559490 (= res!350872 (= lt!254267 (Found!5339 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35176 (_ BitVec 32)) SeekEntryResult!5339)

(assert (=> b!559490 (= lt!254267 (seekEntryOrOpen!0 (select (arr!16890 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35176 (_ BitVec 32)) Bool)

(assert (=> b!559490 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17452 0))(
  ( (Unit!17453) )
))
(declare-fun lt!254270 () Unit!17452)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35176 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17452)

(assert (=> b!559490 (= lt!254270 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!559491 () Bool)

(assert (=> b!559491 (= e!322324 e!322326)))

(declare-fun res!350877 () Bool)

(assert (=> b!559491 (=> res!350877 e!322326)))

(assert (=> b!559491 (= res!350877 (or (undefined!6151 lt!254269) (not (is-Intermediate!5339 lt!254269)) (= (select (arr!16890 a!3118) (index!23585 lt!254269)) (select (arr!16890 a!3118) j!142)) (= (select (arr!16890 a!3118) (index!23585 lt!254269)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!559492 () Bool)

(declare-fun res!350881 () Bool)

(assert (=> b!559492 (=> (not res!350881) (not e!322323))))

(assert (=> b!559492 (= res!350881 (and (= (size!17254 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17254 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17254 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!559493 () Bool)

(assert (=> b!559493 (= e!322323 e!322325)))

(declare-fun res!350874 () Bool)

(assert (=> b!559493 (=> (not res!350874) (not e!322325))))

(declare-fun lt!254271 () SeekEntryResult!5339)

(assert (=> b!559493 (= res!350874 (or (= lt!254271 (MissingZero!5339 i!1132)) (= lt!254271 (MissingVacant!5339 i!1132))))))

(assert (=> b!559493 (= lt!254271 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!350879 () Bool)

(assert (=> start!51248 (=> (not res!350879) (not e!322323))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51248 (= res!350879 (validMask!0 mask!3119))))

(assert (=> start!51248 e!322323))

(assert (=> start!51248 true))

(declare-fun array_inv!12686 (array!35176) Bool)

(assert (=> start!51248 (array_inv!12686 a!3118)))

(declare-fun b!559486 () Bool)

(declare-fun res!350878 () Bool)

(assert (=> b!559486 (=> (not res!350878) (not e!322325))))

(assert (=> b!559486 (= res!350878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!51248 res!350879) b!559492))

(assert (= (and b!559492 res!350881) b!559485))

(assert (= (and b!559485 res!350876) b!559487))

(assert (= (and b!559487 res!350880) b!559484))

(assert (= (and b!559484 res!350875) b!559493))

(assert (= (and b!559493 res!350874) b!559486))

(assert (= (and b!559486 res!350878) b!559489))

(assert (= (and b!559489 res!350873) b!559483))

(assert (= (and b!559483 res!350882) b!559490))

(assert (= (and b!559490 res!350872) b!559491))

(assert (= (and b!559491 (not res!350877)) b!559488))

(declare-fun m!537291 () Bool)

(assert (=> b!559493 m!537291))

(declare-fun m!537293 () Bool)

(assert (=> b!559488 m!537293))

(assert (=> b!559488 m!537293))

(declare-fun m!537295 () Bool)

(assert (=> b!559488 m!537295))

(declare-fun m!537297 () Bool)

(assert (=> b!559484 m!537297))

(declare-fun m!537299 () Bool)

(assert (=> b!559489 m!537299))

(declare-fun m!537301 () Bool)

(assert (=> b!559491 m!537301))

(assert (=> b!559491 m!537293))

(assert (=> b!559483 m!537293))

(declare-fun m!537303 () Bool)

(assert (=> b!559483 m!537303))

(assert (=> b!559483 m!537293))

(declare-fun m!537305 () Bool)

(assert (=> b!559483 m!537305))

(assert (=> b!559483 m!537305))

(declare-fun m!537307 () Bool)

(assert (=> b!559483 m!537307))

(declare-fun m!537309 () Bool)

(assert (=> b!559483 m!537309))

(assert (=> b!559483 m!537293))

(declare-fun m!537311 () Bool)

(assert (=> b!559483 m!537311))

(assert (=> b!559483 m!537305))

(declare-fun m!537313 () Bool)

(assert (=> b!559483 m!537313))

(declare-fun m!537315 () Bool)

(assert (=> start!51248 m!537315))

(declare-fun m!537317 () Bool)

(assert (=> start!51248 m!537317))

(assert (=> b!559490 m!537293))

(assert (=> b!559490 m!537293))

(declare-fun m!537319 () Bool)

(assert (=> b!559490 m!537319))

(declare-fun m!537321 () Bool)

(assert (=> b!559490 m!537321))

(declare-fun m!537323 () Bool)

(assert (=> b!559490 m!537323))

(declare-fun m!537325 () Bool)

(assert (=> b!559487 m!537325))

(declare-fun m!537327 () Bool)

(assert (=> b!559486 m!537327))

(assert (=> b!559485 m!537293))

(assert (=> b!559485 m!537293))

(declare-fun m!537329 () Bool)

(assert (=> b!559485 m!537329))

(push 1)

