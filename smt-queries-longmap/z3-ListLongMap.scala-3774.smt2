; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51744 () Bool)

(assert start!51744)

(declare-fun b!565663 () Bool)

(declare-fun res!356536 () Bool)

(declare-fun e!325698 () Bool)

(assert (=> b!565663 (=> (not res!356536) (not e!325698))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35499 0))(
  ( (array!35500 (arr!17047 (Array (_ BitVec 32) (_ BitVec 64))) (size!17411 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35499)

(assert (=> b!565663 (= res!356536 (and (= (size!17411 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17411 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17411 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!565664 () Bool)

(declare-fun e!325699 () Bool)

(assert (=> b!565664 (= e!325699 (not true))))

(declare-fun e!325700 () Bool)

(assert (=> b!565664 e!325700))

(declare-fun res!356535 () Bool)

(assert (=> b!565664 (=> (not res!356535) (not e!325700))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35499 (_ BitVec 32)) Bool)

(assert (=> b!565664 (= res!356535 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17677 0))(
  ( (Unit!17678) )
))
(declare-fun lt!258004 () Unit!17677)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35499 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17677)

(assert (=> b!565664 (= lt!258004 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!565665 () Bool)

(declare-fun res!356527 () Bool)

(assert (=> b!565665 (=> (not res!356527) (not e!325698))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!565665 (= res!356527 (validKeyInArray!0 (select (arr!17047 a!3118) j!142)))))

(declare-fun b!565666 () Bool)

(declare-fun res!356531 () Bool)

(assert (=> b!565666 (=> (not res!356531) (not e!325698))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35499 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!565666 (= res!356531 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!565667 () Bool)

(declare-fun res!356528 () Bool)

(assert (=> b!565667 (=> (not res!356528) (not e!325699))))

(declare-datatypes ((List!11034 0))(
  ( (Nil!11031) (Cons!11030 (h!12039 (_ BitVec 64)) (t!17254 List!11034)) )
))
(declare-fun arrayNoDuplicates!0 (array!35499 (_ BitVec 32) List!11034) Bool)

(assert (=> b!565667 (= res!356528 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11031))))

(declare-fun b!565668 () Bool)

(declare-fun res!356533 () Bool)

(assert (=> b!565668 (=> (not res!356533) (not e!325699))))

(assert (=> b!565668 (= res!356533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!356529 () Bool)

(assert (=> start!51744 (=> (not res!356529) (not e!325698))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51744 (= res!356529 (validMask!0 mask!3119))))

(assert (=> start!51744 e!325698))

(assert (=> start!51744 true))

(declare-fun array_inv!12906 (array!35499) Bool)

(assert (=> start!51744 (array_inv!12906 a!3118)))

(declare-fun b!565669 () Bool)

(declare-datatypes ((SeekEntryResult!5452 0))(
  ( (MissingZero!5452 (index!24035 (_ BitVec 32))) (Found!5452 (index!24036 (_ BitVec 32))) (Intermediate!5452 (undefined!6264 Bool) (index!24037 (_ BitVec 32)) (x!53060 (_ BitVec 32))) (Undefined!5452) (MissingVacant!5452 (index!24038 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35499 (_ BitVec 32)) SeekEntryResult!5452)

(assert (=> b!565669 (= e!325700 (= (seekEntryOrOpen!0 (select (arr!17047 a!3118) j!142) a!3118 mask!3119) (Found!5452 j!142)))))

(declare-fun b!565670 () Bool)

(declare-fun res!356530 () Bool)

(assert (=> b!565670 (=> (not res!356530) (not e!325699))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35499 (_ BitVec 32)) SeekEntryResult!5452)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565670 (= res!356530 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17047 a!3118) j!142) mask!3119) (select (arr!17047 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17047 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17047 a!3118) i!1132 k0!1914) j!142) (array!35500 (store (arr!17047 a!3118) i!1132 k0!1914) (size!17411 a!3118)) mask!3119)))))

(declare-fun b!565671 () Bool)

(declare-fun res!356534 () Bool)

(assert (=> b!565671 (=> (not res!356534) (not e!325698))))

(assert (=> b!565671 (= res!356534 (validKeyInArray!0 k0!1914))))

(declare-fun b!565672 () Bool)

(assert (=> b!565672 (= e!325698 e!325699)))

(declare-fun res!356532 () Bool)

(assert (=> b!565672 (=> (not res!356532) (not e!325699))))

(declare-fun lt!258003 () SeekEntryResult!5452)

(assert (=> b!565672 (= res!356532 (or (= lt!258003 (MissingZero!5452 i!1132)) (= lt!258003 (MissingVacant!5452 i!1132))))))

(assert (=> b!565672 (= lt!258003 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!51744 res!356529) b!565663))

(assert (= (and b!565663 res!356536) b!565665))

(assert (= (and b!565665 res!356527) b!565671))

(assert (= (and b!565671 res!356534) b!565666))

(assert (= (and b!565666 res!356531) b!565672))

(assert (= (and b!565672 res!356532) b!565668))

(assert (= (and b!565668 res!356533) b!565667))

(assert (= (and b!565667 res!356528) b!565670))

(assert (= (and b!565670 res!356530) b!565664))

(assert (= (and b!565664 res!356535) b!565669))

(declare-fun m!544265 () Bool)

(assert (=> start!51744 m!544265))

(declare-fun m!544267 () Bool)

(assert (=> start!51744 m!544267))

(declare-fun m!544269 () Bool)

(assert (=> b!565672 m!544269))

(declare-fun m!544271 () Bool)

(assert (=> b!565667 m!544271))

(declare-fun m!544273 () Bool)

(assert (=> b!565668 m!544273))

(declare-fun m!544275 () Bool)

(assert (=> b!565671 m!544275))

(declare-fun m!544277 () Bool)

(assert (=> b!565669 m!544277))

(assert (=> b!565669 m!544277))

(declare-fun m!544279 () Bool)

(assert (=> b!565669 m!544279))

(declare-fun m!544281 () Bool)

(assert (=> b!565666 m!544281))

(declare-fun m!544283 () Bool)

(assert (=> b!565664 m!544283))

(declare-fun m!544285 () Bool)

(assert (=> b!565664 m!544285))

(assert (=> b!565670 m!544277))

(declare-fun m!544287 () Bool)

(assert (=> b!565670 m!544287))

(assert (=> b!565670 m!544277))

(declare-fun m!544289 () Bool)

(assert (=> b!565670 m!544289))

(declare-fun m!544291 () Bool)

(assert (=> b!565670 m!544291))

(assert (=> b!565670 m!544289))

(declare-fun m!544293 () Bool)

(assert (=> b!565670 m!544293))

(assert (=> b!565670 m!544287))

(assert (=> b!565670 m!544277))

(declare-fun m!544295 () Bool)

(assert (=> b!565670 m!544295))

(declare-fun m!544297 () Bool)

(assert (=> b!565670 m!544297))

(assert (=> b!565670 m!544289))

(assert (=> b!565670 m!544291))

(assert (=> b!565665 m!544277))

(assert (=> b!565665 m!544277))

(declare-fun m!544299 () Bool)

(assert (=> b!565665 m!544299))

(check-sat (not b!565664) (not b!565667) (not b!565666) (not start!51744) (not b!565670) (not b!565668) (not b!565665) (not b!565671) (not b!565672) (not b!565669))
(check-sat)
