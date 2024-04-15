; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51692 () Bool)

(assert start!51692)

(declare-fun b!565282 () Bool)

(declare-fun res!356402 () Bool)

(declare-fun e!325433 () Bool)

(assert (=> b!565282 (=> (not res!356402) (not e!325433))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35509 0))(
  ( (array!35510 (arr!17054 (Array (_ BitVec 32) (_ BitVec 64))) (size!17419 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35509)

(declare-datatypes ((SeekEntryResult!5500 0))(
  ( (MissingZero!5500 (index!24227 (_ BitVec 32))) (Found!5500 (index!24228 (_ BitVec 32))) (Intermediate!5500 (undefined!6312 Bool) (index!24229 (_ BitVec 32)) (x!53108 (_ BitVec 32))) (Undefined!5500) (MissingVacant!5500 (index!24230 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35509 (_ BitVec 32)) SeekEntryResult!5500)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565282 (= res!356402 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17054 a!3118) j!142) mask!3119) (select (arr!17054 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17054 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17054 a!3118) i!1132 k0!1914) j!142) (array!35510 (store (arr!17054 a!3118) i!1132 k0!1914) (size!17419 a!3118)) mask!3119)))))

(declare-fun b!565284 () Bool)

(declare-fun res!356399 () Bool)

(declare-fun e!325432 () Bool)

(assert (=> b!565284 (=> (not res!356399) (not e!325432))))

(declare-fun arrayContainsKey!0 (array!35509 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!565284 (= res!356399 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!565285 () Bool)

(declare-fun res!356395 () Bool)

(assert (=> b!565285 (=> (not res!356395) (not e!325432))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!565285 (= res!356395 (validKeyInArray!0 (select (arr!17054 a!3118) j!142)))))

(declare-fun b!565286 () Bool)

(declare-fun res!356397 () Bool)

(assert (=> b!565286 (=> (not res!356397) (not e!325432))))

(assert (=> b!565286 (= res!356397 (validKeyInArray!0 k0!1914))))

(declare-fun b!565287 () Bool)

(declare-fun res!356398 () Bool)

(assert (=> b!565287 (=> (not res!356398) (not e!325432))))

(assert (=> b!565287 (= res!356398 (and (= (size!17419 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17419 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17419 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!565288 () Bool)

(declare-fun res!356401 () Bool)

(assert (=> b!565288 (=> (not res!356401) (not e!325433))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35509 (_ BitVec 32)) Bool)

(assert (=> b!565288 (= res!356401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!565289 () Bool)

(declare-fun res!356393 () Bool)

(assert (=> b!565289 (=> (not res!356393) (not e!325433))))

(declare-datatypes ((List!11173 0))(
  ( (Nil!11170) (Cons!11169 (h!12175 (_ BitVec 64)) (t!17392 List!11173)) )
))
(declare-fun arrayNoDuplicates!0 (array!35509 (_ BitVec 32) List!11173) Bool)

(assert (=> b!565289 (= res!356393 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11170))))

(declare-fun res!356394 () Bool)

(assert (=> start!51692 (=> (not res!356394) (not e!325432))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51692 (= res!356394 (validMask!0 mask!3119))))

(assert (=> start!51692 e!325432))

(assert (=> start!51692 true))

(declare-fun array_inv!12937 (array!35509) Bool)

(assert (=> start!51692 (array_inv!12937 a!3118)))

(declare-fun b!565283 () Bool)

(assert (=> b!565283 (= e!325433 (not true))))

(declare-fun e!325434 () Bool)

(assert (=> b!565283 e!325434))

(declare-fun res!356396 () Bool)

(assert (=> b!565283 (=> (not res!356396) (not e!325434))))

(assert (=> b!565283 (= res!356396 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17688 0))(
  ( (Unit!17689) )
))
(declare-fun lt!257676 () Unit!17688)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35509 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17688)

(assert (=> b!565283 (= lt!257676 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!565290 () Bool)

(assert (=> b!565290 (= e!325432 e!325433)))

(declare-fun res!356400 () Bool)

(assert (=> b!565290 (=> (not res!356400) (not e!325433))))

(declare-fun lt!257677 () SeekEntryResult!5500)

(assert (=> b!565290 (= res!356400 (or (= lt!257677 (MissingZero!5500 i!1132)) (= lt!257677 (MissingVacant!5500 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35509 (_ BitVec 32)) SeekEntryResult!5500)

(assert (=> b!565290 (= lt!257677 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!565291 () Bool)

(assert (=> b!565291 (= e!325434 (= (seekEntryOrOpen!0 (select (arr!17054 a!3118) j!142) a!3118 mask!3119) (Found!5500 j!142)))))

(assert (= (and start!51692 res!356394) b!565287))

(assert (= (and b!565287 res!356398) b!565285))

(assert (= (and b!565285 res!356395) b!565286))

(assert (= (and b!565286 res!356397) b!565284))

(assert (= (and b!565284 res!356399) b!565290))

(assert (= (and b!565290 res!356400) b!565288))

(assert (= (and b!565288 res!356401) b!565289))

(assert (= (and b!565289 res!356393) b!565282))

(assert (= (and b!565282 res!356402) b!565283))

(assert (= (and b!565283 res!356396) b!565291))

(declare-fun m!543263 () Bool)

(assert (=> b!565282 m!543263))

(declare-fun m!543265 () Bool)

(assert (=> b!565282 m!543265))

(assert (=> b!565282 m!543263))

(declare-fun m!543267 () Bool)

(assert (=> b!565282 m!543267))

(declare-fun m!543269 () Bool)

(assert (=> b!565282 m!543269))

(assert (=> b!565282 m!543267))

(declare-fun m!543271 () Bool)

(assert (=> b!565282 m!543271))

(assert (=> b!565282 m!543265))

(assert (=> b!565282 m!543263))

(declare-fun m!543273 () Bool)

(assert (=> b!565282 m!543273))

(declare-fun m!543275 () Bool)

(assert (=> b!565282 m!543275))

(assert (=> b!565282 m!543267))

(assert (=> b!565282 m!543269))

(declare-fun m!543277 () Bool)

(assert (=> b!565284 m!543277))

(assert (=> b!565285 m!543263))

(assert (=> b!565285 m!543263))

(declare-fun m!543279 () Bool)

(assert (=> b!565285 m!543279))

(declare-fun m!543281 () Bool)

(assert (=> b!565283 m!543281))

(declare-fun m!543283 () Bool)

(assert (=> b!565283 m!543283))

(declare-fun m!543285 () Bool)

(assert (=> b!565286 m!543285))

(declare-fun m!543287 () Bool)

(assert (=> b!565290 m!543287))

(declare-fun m!543289 () Bool)

(assert (=> start!51692 m!543289))

(declare-fun m!543291 () Bool)

(assert (=> start!51692 m!543291))

(declare-fun m!543293 () Bool)

(assert (=> b!565288 m!543293))

(assert (=> b!565291 m!543263))

(assert (=> b!565291 m!543263))

(declare-fun m!543295 () Bool)

(assert (=> b!565291 m!543295))

(declare-fun m!543297 () Bool)

(assert (=> b!565289 m!543297))

(check-sat (not b!565288) (not b!565283) (not b!565286) (not b!565282) (not b!565291) (not b!565289) (not b!565290) (not b!565285) (not start!51692) (not b!565284))
(check-sat)
