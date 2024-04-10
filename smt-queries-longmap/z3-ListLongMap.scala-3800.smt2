; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52156 () Bool)

(assert start!52156)

(declare-fun b!569265 () Bool)

(declare-fun res!359287 () Bool)

(declare-fun e!327502 () Bool)

(assert (=> b!569265 (=> (not res!359287) (not e!327502))))

(declare-datatypes ((array!35679 0))(
  ( (array!35680 (arr!17131 (Array (_ BitVec 32) (_ BitVec 64))) (size!17495 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35679)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35679 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569265 (= res!359287 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569266 () Bool)

(declare-fun res!359285 () Bool)

(assert (=> b!569266 (=> (not res!359285) (not e!327502))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!569266 (= res!359285 (and (= (size!17495 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17495 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17495 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!359284 () Bool)

(assert (=> start!52156 (=> (not res!359284) (not e!327502))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52156 (= res!359284 (validMask!0 mask!3119))))

(assert (=> start!52156 e!327502))

(assert (=> start!52156 true))

(declare-fun array_inv!12927 (array!35679) Bool)

(assert (=> start!52156 (array_inv!12927 a!3118)))

(declare-fun b!569267 () Bool)

(declare-fun res!359288 () Bool)

(assert (=> b!569267 (=> (not res!359288) (not e!327502))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569267 (= res!359288 (validKeyInArray!0 (select (arr!17131 a!3118) j!142)))))

(declare-fun b!569268 () Bool)

(declare-fun res!359289 () Bool)

(declare-fun e!327501 () Bool)

(assert (=> b!569268 (=> (not res!359289) (not e!327501))))

(declare-datatypes ((List!11211 0))(
  ( (Nil!11208) (Cons!11207 (h!12228 (_ BitVec 64)) (t!17439 List!11211)) )
))
(declare-fun arrayNoDuplicates!0 (array!35679 (_ BitVec 32) List!11211) Bool)

(assert (=> b!569268 (= res!359289 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11208))))

(declare-fun b!569269 () Bool)

(declare-fun res!359283 () Bool)

(assert (=> b!569269 (=> (not res!359283) (not e!327501))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35679 (_ BitVec 32)) Bool)

(assert (=> b!569269 (= res!359283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569270 () Bool)

(assert (=> b!569270 (= e!327502 e!327501)))

(declare-fun res!359291 () Bool)

(assert (=> b!569270 (=> (not res!359291) (not e!327501))))

(declare-datatypes ((SeekEntryResult!5580 0))(
  ( (MissingZero!5580 (index!24547 (_ BitVec 32))) (Found!5580 (index!24548 (_ BitVec 32))) (Intermediate!5580 (undefined!6392 Bool) (index!24549 (_ BitVec 32)) (x!53423 (_ BitVec 32))) (Undefined!5580) (MissingVacant!5580 (index!24550 (_ BitVec 32))) )
))
(declare-fun lt!259428 () SeekEntryResult!5580)

(assert (=> b!569270 (= res!359291 (or (= lt!259428 (MissingZero!5580 i!1132)) (= lt!259428 (MissingVacant!5580 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35679 (_ BitVec 32)) SeekEntryResult!5580)

(assert (=> b!569270 (= lt!259428 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!569271 () Bool)

(declare-fun e!327503 () Bool)

(assert (=> b!569271 (= e!327501 e!327503)))

(declare-fun res!359286 () Bool)

(assert (=> b!569271 (=> (not res!359286) (not e!327503))))

(declare-fun lt!259429 () (_ BitVec 32))

(declare-fun lt!259431 () SeekEntryResult!5580)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35679 (_ BitVec 32)) SeekEntryResult!5580)

(assert (=> b!569271 (= res!359286 (= lt!259431 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259429 (select (store (arr!17131 a!3118) i!1132 k0!1914) j!142) (array!35680 (store (arr!17131 a!3118) i!1132 k0!1914) (size!17495 a!3118)) mask!3119)))))

(declare-fun lt!259427 () (_ BitVec 32))

(assert (=> b!569271 (= lt!259431 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259427 (select (arr!17131 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569271 (= lt!259429 (toIndex!0 (select (store (arr!17131 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!569271 (= lt!259427 (toIndex!0 (select (arr!17131 a!3118) j!142) mask!3119))))

(declare-fun b!569272 () Bool)

(declare-fun res!359290 () Bool)

(assert (=> b!569272 (=> (not res!359290) (not e!327502))))

(assert (=> b!569272 (= res!359290 (validKeyInArray!0 k0!1914))))

(declare-fun b!569273 () Bool)

(assert (=> b!569273 (= e!327503 (not true))))

(declare-fun lt!259432 () SeekEntryResult!5580)

(get-info :version)

(assert (=> b!569273 (and (= lt!259432 (Found!5580 j!142)) (or (undefined!6392 lt!259431) (not ((_ is Intermediate!5580) lt!259431)) (= (select (arr!17131 a!3118) (index!24549 lt!259431)) (select (arr!17131 a!3118) j!142)) (not (= (select (arr!17131 a!3118) (index!24549 lt!259431)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259432 (MissingZero!5580 (index!24549 lt!259431)))))))

(assert (=> b!569273 (= lt!259432 (seekEntryOrOpen!0 (select (arr!17131 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!569273 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17862 0))(
  ( (Unit!17863) )
))
(declare-fun lt!259430 () Unit!17862)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35679 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17862)

(assert (=> b!569273 (= lt!259430 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!52156 res!359284) b!569266))

(assert (= (and b!569266 res!359285) b!569267))

(assert (= (and b!569267 res!359288) b!569272))

(assert (= (and b!569272 res!359290) b!569265))

(assert (= (and b!569265 res!359287) b!569270))

(assert (= (and b!569270 res!359291) b!569269))

(assert (= (and b!569269 res!359283) b!569268))

(assert (= (and b!569268 res!359289) b!569271))

(assert (= (and b!569271 res!359286) b!569273))

(declare-fun m!547925 () Bool)

(assert (=> b!569273 m!547925))

(declare-fun m!547927 () Bool)

(assert (=> b!569273 m!547927))

(assert (=> b!569273 m!547925))

(declare-fun m!547929 () Bool)

(assert (=> b!569273 m!547929))

(declare-fun m!547931 () Bool)

(assert (=> b!569273 m!547931))

(declare-fun m!547933 () Bool)

(assert (=> b!569273 m!547933))

(declare-fun m!547935 () Bool)

(assert (=> b!569265 m!547935))

(declare-fun m!547937 () Bool)

(assert (=> b!569270 m!547937))

(declare-fun m!547939 () Bool)

(assert (=> b!569269 m!547939))

(assert (=> b!569271 m!547925))

(declare-fun m!547941 () Bool)

(assert (=> b!569271 m!547941))

(assert (=> b!569271 m!547925))

(declare-fun m!547943 () Bool)

(assert (=> b!569271 m!547943))

(assert (=> b!569271 m!547925))

(declare-fun m!547945 () Bool)

(assert (=> b!569271 m!547945))

(declare-fun m!547947 () Bool)

(assert (=> b!569271 m!547947))

(assert (=> b!569271 m!547943))

(declare-fun m!547949 () Bool)

(assert (=> b!569271 m!547949))

(assert (=> b!569271 m!547943))

(declare-fun m!547951 () Bool)

(assert (=> b!569271 m!547951))

(assert (=> b!569267 m!547925))

(assert (=> b!569267 m!547925))

(declare-fun m!547953 () Bool)

(assert (=> b!569267 m!547953))

(declare-fun m!547955 () Bool)

(assert (=> b!569268 m!547955))

(declare-fun m!547957 () Bool)

(assert (=> b!569272 m!547957))

(declare-fun m!547959 () Bool)

(assert (=> start!52156 m!547959))

(declare-fun m!547961 () Bool)

(assert (=> start!52156 m!547961))

(check-sat (not b!569273) (not start!52156) (not b!569269) (not b!569267) (not b!569265) (not b!569268) (not b!569272) (not b!569271) (not b!569270))
(check-sat)
