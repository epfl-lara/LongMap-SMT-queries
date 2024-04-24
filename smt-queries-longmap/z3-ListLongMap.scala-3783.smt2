; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51798 () Bool)

(assert start!51798)

(declare-fun b!566473 () Bool)

(declare-fun res!357338 () Bool)

(declare-fun e!326024 () Bool)

(assert (=> b!566473 (=> (not res!357338) (not e!326024))))

(declare-datatypes ((array!35553 0))(
  ( (array!35554 (arr!17074 (Array (_ BitVec 32) (_ BitVec 64))) (size!17438 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35553)

(declare-datatypes ((List!11061 0))(
  ( (Nil!11058) (Cons!11057 (h!12066 (_ BitVec 64)) (t!17281 List!11061)) )
))
(declare-fun arrayNoDuplicates!0 (array!35553 (_ BitVec 32) List!11061) Bool)

(assert (=> b!566473 (= res!357338 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11058))))

(declare-fun b!566474 () Bool)

(declare-fun res!357346 () Bool)

(declare-fun e!326022 () Bool)

(assert (=> b!566474 (=> (not res!357346) (not e!326022))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!566474 (= res!357346 (and (= (size!17438 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17438 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17438 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!566475 () Bool)

(declare-fun res!357337 () Bool)

(assert (=> b!566475 (=> (not res!357337) (not e!326022))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!566475 (= res!357337 (validKeyInArray!0 (select (arr!17074 a!3118) j!142)))))

(declare-fun b!566476 () Bool)

(declare-fun res!357343 () Bool)

(assert (=> b!566476 (=> (not res!357343) (not e!326022))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!566476 (= res!357343 (validKeyInArray!0 k0!1914))))

(declare-fun res!357340 () Bool)

(assert (=> start!51798 (=> (not res!357340) (not e!326022))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51798 (= res!357340 (validMask!0 mask!3119))))

(assert (=> start!51798 e!326022))

(assert (=> start!51798 true))

(declare-fun array_inv!12933 (array!35553) Bool)

(assert (=> start!51798 (array_inv!12933 a!3118)))

(declare-fun b!566477 () Bool)

(assert (=> b!566477 (= e!326022 e!326024)))

(declare-fun res!357341 () Bool)

(assert (=> b!566477 (=> (not res!357341) (not e!326024))))

(declare-datatypes ((SeekEntryResult!5479 0))(
  ( (MissingZero!5479 (index!24143 (_ BitVec 32))) (Found!5479 (index!24144 (_ BitVec 32))) (Intermediate!5479 (undefined!6291 Bool) (index!24145 (_ BitVec 32)) (x!53159 (_ BitVec 32))) (Undefined!5479) (MissingVacant!5479 (index!24146 (_ BitVec 32))) )
))
(declare-fun lt!258165 () SeekEntryResult!5479)

(assert (=> b!566477 (= res!357341 (or (= lt!258165 (MissingZero!5479 i!1132)) (= lt!258165 (MissingVacant!5479 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35553 (_ BitVec 32)) SeekEntryResult!5479)

(assert (=> b!566477 (= lt!258165 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!566478 () Bool)

(declare-fun res!357339 () Bool)

(assert (=> b!566478 (=> (not res!357339) (not e!326022))))

(declare-fun arrayContainsKey!0 (array!35553 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!566478 (= res!357339 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!566479 () Bool)

(declare-fun e!326023 () Bool)

(assert (=> b!566479 (= e!326023 (= (seekEntryOrOpen!0 (select (arr!17074 a!3118) j!142) a!3118 mask!3119) (Found!5479 j!142)))))

(declare-fun b!566480 () Bool)

(declare-fun res!357344 () Bool)

(assert (=> b!566480 (=> (not res!357344) (not e!326024))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35553 (_ BitVec 32)) SeekEntryResult!5479)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!566480 (= res!357344 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17074 a!3118) j!142) mask!3119) (select (arr!17074 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17074 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17074 a!3118) i!1132 k0!1914) j!142) (array!35554 (store (arr!17074 a!3118) i!1132 k0!1914) (size!17438 a!3118)) mask!3119)))))

(declare-fun b!566481 () Bool)

(assert (=> b!566481 (= e!326024 (not true))))

(assert (=> b!566481 e!326023))

(declare-fun res!357345 () Bool)

(assert (=> b!566481 (=> (not res!357345) (not e!326023))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35553 (_ BitVec 32)) Bool)

(assert (=> b!566481 (= res!357345 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17731 0))(
  ( (Unit!17732) )
))
(declare-fun lt!258166 () Unit!17731)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35553 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17731)

(assert (=> b!566481 (= lt!258166 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!566482 () Bool)

(declare-fun res!357342 () Bool)

(assert (=> b!566482 (=> (not res!357342) (not e!326024))))

(assert (=> b!566482 (= res!357342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!51798 res!357340) b!566474))

(assert (= (and b!566474 res!357346) b!566475))

(assert (= (and b!566475 res!357337) b!566476))

(assert (= (and b!566476 res!357343) b!566478))

(assert (= (and b!566478 res!357339) b!566477))

(assert (= (and b!566477 res!357341) b!566482))

(assert (= (and b!566482 res!357342) b!566473))

(assert (= (and b!566473 res!357338) b!566480))

(assert (= (and b!566480 res!357344) b!566481))

(assert (= (and b!566481 res!357345) b!566479))

(declare-fun m!545237 () Bool)

(assert (=> b!566478 m!545237))

(declare-fun m!545239 () Bool)

(assert (=> b!566473 m!545239))

(declare-fun m!545241 () Bool)

(assert (=> b!566481 m!545241))

(declare-fun m!545243 () Bool)

(assert (=> b!566481 m!545243))

(declare-fun m!545245 () Bool)

(assert (=> b!566479 m!545245))

(assert (=> b!566479 m!545245))

(declare-fun m!545247 () Bool)

(assert (=> b!566479 m!545247))

(assert (=> b!566480 m!545245))

(declare-fun m!545249 () Bool)

(assert (=> b!566480 m!545249))

(assert (=> b!566480 m!545245))

(declare-fun m!545251 () Bool)

(assert (=> b!566480 m!545251))

(declare-fun m!545253 () Bool)

(assert (=> b!566480 m!545253))

(assert (=> b!566480 m!545251))

(declare-fun m!545255 () Bool)

(assert (=> b!566480 m!545255))

(assert (=> b!566480 m!545249))

(assert (=> b!566480 m!545245))

(declare-fun m!545257 () Bool)

(assert (=> b!566480 m!545257))

(declare-fun m!545259 () Bool)

(assert (=> b!566480 m!545259))

(assert (=> b!566480 m!545251))

(assert (=> b!566480 m!545253))

(assert (=> b!566475 m!545245))

(assert (=> b!566475 m!545245))

(declare-fun m!545261 () Bool)

(assert (=> b!566475 m!545261))

(declare-fun m!545263 () Bool)

(assert (=> b!566482 m!545263))

(declare-fun m!545265 () Bool)

(assert (=> start!51798 m!545265))

(declare-fun m!545267 () Bool)

(assert (=> start!51798 m!545267))

(declare-fun m!545269 () Bool)

(assert (=> b!566477 m!545269))

(declare-fun m!545271 () Bool)

(assert (=> b!566476 m!545271))

(check-sat (not start!51798) (not b!566480) (not b!566477) (not b!566476) (not b!566479) (not b!566482) (not b!566478) (not b!566481) (not b!566473) (not b!566475))
(check-sat)
