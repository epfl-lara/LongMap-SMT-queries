; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51948 () Bool)

(assert start!51948)

(declare-fun b!567523 () Bool)

(declare-fun res!358012 () Bool)

(declare-fun e!326601 () Bool)

(assert (=> b!567523 (=> (not res!358012) (not e!326601))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!567523 (= res!358012 (validKeyInArray!0 k0!1914))))

(declare-fun res!358007 () Bool)

(assert (=> start!51948 (=> (not res!358007) (not e!326601))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51948 (= res!358007 (validMask!0 mask!3119))))

(assert (=> start!51948 e!326601))

(assert (=> start!51948 true))

(declare-datatypes ((array!35589 0))(
  ( (array!35590 (arr!17089 (Array (_ BitVec 32) (_ BitVec 64))) (size!17453 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35589)

(declare-fun array_inv!12948 (array!35589) Bool)

(assert (=> start!51948 (array_inv!12948 a!3118)))

(declare-fun b!567524 () Bool)

(declare-fun res!358004 () Bool)

(declare-fun e!326602 () Bool)

(assert (=> b!567524 (=> (not res!358004) (not e!326602))))

(declare-datatypes ((List!11076 0))(
  ( (Nil!11073) (Cons!11072 (h!12087 (_ BitVec 64)) (t!17296 List!11076)) )
))
(declare-fun arrayNoDuplicates!0 (array!35589 (_ BitVec 32) List!11076) Bool)

(assert (=> b!567524 (= res!358004 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11073))))

(declare-fun b!567525 () Bool)

(declare-fun res!358003 () Bool)

(assert (=> b!567525 (=> (not res!358003) (not e!326602))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35589 (_ BitVec 32)) Bool)

(assert (=> b!567525 (= res!358003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!567526 () Bool)

(declare-fun res!358011 () Bool)

(assert (=> b!567526 (=> (not res!358011) (not e!326602))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5494 0))(
  ( (MissingZero!5494 (index!24203 (_ BitVec 32))) (Found!5494 (index!24204 (_ BitVec 32))) (Intermediate!5494 (undefined!6306 Bool) (index!24205 (_ BitVec 32)) (x!53226 (_ BitVec 32))) (Undefined!5494) (MissingVacant!5494 (index!24206 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35589 (_ BitVec 32)) SeekEntryResult!5494)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!567526 (= res!358011 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17089 a!3118) j!142) mask!3119) (select (arr!17089 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17089 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17089 a!3118) i!1132 k0!1914) j!142) (array!35590 (store (arr!17089 a!3118) i!1132 k0!1914) (size!17453 a!3118)) mask!3119)))))

(declare-fun b!567527 () Bool)

(assert (=> b!567527 (= e!326602 (not true))))

(declare-fun e!326603 () Bool)

(assert (=> b!567527 e!326603))

(declare-fun res!358010 () Bool)

(assert (=> b!567527 (=> (not res!358010) (not e!326603))))

(assert (=> b!567527 (= res!358010 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17761 0))(
  ( (Unit!17762) )
))
(declare-fun lt!258604 () Unit!17761)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35589 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17761)

(assert (=> b!567527 (= lt!258604 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!567528 () Bool)

(declare-fun res!358008 () Bool)

(assert (=> b!567528 (=> (not res!358008) (not e!326601))))

(assert (=> b!567528 (= res!358008 (validKeyInArray!0 (select (arr!17089 a!3118) j!142)))))

(declare-fun b!567529 () Bool)

(declare-fun res!358006 () Bool)

(assert (=> b!567529 (=> (not res!358006) (not e!326601))))

(assert (=> b!567529 (= res!358006 (and (= (size!17453 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17453 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17453 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!567530 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35589 (_ BitVec 32)) SeekEntryResult!5494)

(assert (=> b!567530 (= e!326603 (= (seekEntryOrOpen!0 (select (arr!17089 a!3118) j!142) a!3118 mask!3119) (Found!5494 j!142)))))

(declare-fun b!567531 () Bool)

(assert (=> b!567531 (= e!326601 e!326602)))

(declare-fun res!358005 () Bool)

(assert (=> b!567531 (=> (not res!358005) (not e!326602))))

(declare-fun lt!258603 () SeekEntryResult!5494)

(assert (=> b!567531 (= res!358005 (or (= lt!258603 (MissingZero!5494 i!1132)) (= lt!258603 (MissingVacant!5494 i!1132))))))

(assert (=> b!567531 (= lt!258603 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!567532 () Bool)

(declare-fun res!358009 () Bool)

(assert (=> b!567532 (=> (not res!358009) (not e!326601))))

(declare-fun arrayContainsKey!0 (array!35589 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!567532 (= res!358009 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!51948 res!358007) b!567529))

(assert (= (and b!567529 res!358006) b!567528))

(assert (= (and b!567528 res!358008) b!567523))

(assert (= (and b!567523 res!358012) b!567532))

(assert (= (and b!567532 res!358009) b!567531))

(assert (= (and b!567531 res!358005) b!567525))

(assert (= (and b!567525 res!358003) b!567524))

(assert (= (and b!567524 res!358004) b!567526))

(assert (= (and b!567526 res!358011) b!567527))

(assert (= (and b!567527 res!358010) b!567530))

(declare-fun m!546227 () Bool)

(assert (=> b!567525 m!546227))

(declare-fun m!546229 () Bool)

(assert (=> b!567532 m!546229))

(declare-fun m!546231 () Bool)

(assert (=> b!567530 m!546231))

(assert (=> b!567530 m!546231))

(declare-fun m!546233 () Bool)

(assert (=> b!567530 m!546233))

(declare-fun m!546235 () Bool)

(assert (=> start!51948 m!546235))

(declare-fun m!546237 () Bool)

(assert (=> start!51948 m!546237))

(declare-fun m!546239 () Bool)

(assert (=> b!567531 m!546239))

(declare-fun m!546241 () Bool)

(assert (=> b!567524 m!546241))

(declare-fun m!546243 () Bool)

(assert (=> b!567527 m!546243))

(declare-fun m!546245 () Bool)

(assert (=> b!567527 m!546245))

(assert (=> b!567528 m!546231))

(assert (=> b!567528 m!546231))

(declare-fun m!546247 () Bool)

(assert (=> b!567528 m!546247))

(assert (=> b!567526 m!546231))

(declare-fun m!546249 () Bool)

(assert (=> b!567526 m!546249))

(assert (=> b!567526 m!546231))

(declare-fun m!546251 () Bool)

(assert (=> b!567526 m!546251))

(declare-fun m!546253 () Bool)

(assert (=> b!567526 m!546253))

(assert (=> b!567526 m!546251))

(declare-fun m!546255 () Bool)

(assert (=> b!567526 m!546255))

(assert (=> b!567526 m!546249))

(assert (=> b!567526 m!546231))

(declare-fun m!546257 () Bool)

(assert (=> b!567526 m!546257))

(declare-fun m!546259 () Bool)

(assert (=> b!567526 m!546259))

(assert (=> b!567526 m!546251))

(assert (=> b!567526 m!546253))

(declare-fun m!546261 () Bool)

(assert (=> b!567523 m!546261))

(check-sat (not b!567525) (not b!567531) (not b!567524) (not b!567523) (not start!51948) (not b!567532) (not b!567528) (not b!567527) (not b!567526) (not b!567530))
(check-sat)
