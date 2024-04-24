; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44282 () Bool)

(assert start!44282)

(declare-fun b!487011 () Bool)

(declare-fun res!290455 () Bool)

(declare-fun e!286600 () Bool)

(assert (=> b!487011 (=> (not res!290455) (not e!286600))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487011 (= res!290455 (validKeyInArray!0 k0!2280))))

(declare-fun b!487012 () Bool)

(declare-fun e!286601 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(assert (=> b!487012 (= e!286601 (not (bvsge mask!3524 #b00000000000000000000000000000000)))))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((array!31534 0))(
  ( (array!31535 (arr!15160 (Array (_ BitVec 32) (_ BitVec 64))) (size!15524 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31534)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31534 (_ BitVec 32)) Bool)

(assert (=> b!487012 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14173 0))(
  ( (Unit!14174) )
))
(declare-fun lt!219946 () Unit!14173)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31534 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14173)

(assert (=> b!487012 (= lt!219946 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!487013 () Bool)

(declare-fun res!290452 () Bool)

(assert (=> b!487013 (=> (not res!290452) (not e!286600))))

(declare-fun arrayContainsKey!0 (array!31534 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487013 (= res!290452 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!290453 () Bool)

(assert (=> start!44282 (=> (not res!290453) (not e!286600))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44282 (= res!290453 (validMask!0 mask!3524))))

(assert (=> start!44282 e!286600))

(assert (=> start!44282 true))

(declare-fun array_inv!11019 (array!31534) Bool)

(assert (=> start!44282 (array_inv!11019 a!3235)))

(declare-fun b!487014 () Bool)

(declare-fun res!290458 () Bool)

(assert (=> b!487014 (=> (not res!290458) (not e!286600))))

(assert (=> b!487014 (= res!290458 (validKeyInArray!0 (select (arr!15160 a!3235) j!176)))))

(declare-fun b!487015 () Bool)

(declare-fun res!290454 () Bool)

(assert (=> b!487015 (=> (not res!290454) (not e!286600))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!487015 (= res!290454 (and (= (size!15524 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15524 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15524 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!487016 () Bool)

(declare-fun res!290456 () Bool)

(assert (=> b!487016 (=> (not res!290456) (not e!286601))))

(assert (=> b!487016 (= res!290456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!487017 () Bool)

(declare-fun res!290451 () Bool)

(assert (=> b!487017 (=> (not res!290451) (not e!286601))))

(declare-datatypes ((List!9225 0))(
  ( (Nil!9222) (Cons!9221 (h!10077 (_ BitVec 64)) (t!15445 List!9225)) )
))
(declare-fun arrayNoDuplicates!0 (array!31534 (_ BitVec 32) List!9225) Bool)

(assert (=> b!487017 (= res!290451 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9222))))

(declare-fun b!487018 () Bool)

(assert (=> b!487018 (= e!286600 e!286601)))

(declare-fun res!290457 () Bool)

(assert (=> b!487018 (=> (not res!290457) (not e!286601))))

(declare-datatypes ((SeekEntryResult!3583 0))(
  ( (MissingZero!3583 (index!16511 (_ BitVec 32))) (Found!3583 (index!16512 (_ BitVec 32))) (Intermediate!3583 (undefined!4395 Bool) (index!16513 (_ BitVec 32)) (x!45784 (_ BitVec 32))) (Undefined!3583) (MissingVacant!3583 (index!16514 (_ BitVec 32))) )
))
(declare-fun lt!219945 () SeekEntryResult!3583)

(assert (=> b!487018 (= res!290457 (or (= lt!219945 (MissingZero!3583 i!1204)) (= lt!219945 (MissingVacant!3583 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31534 (_ BitVec 32)) SeekEntryResult!3583)

(assert (=> b!487018 (= lt!219945 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!44282 res!290453) b!487015))

(assert (= (and b!487015 res!290454) b!487014))

(assert (= (and b!487014 res!290458) b!487011))

(assert (= (and b!487011 res!290455) b!487013))

(assert (= (and b!487013 res!290452) b!487018))

(assert (= (and b!487018 res!290457) b!487016))

(assert (= (and b!487016 res!290456) b!487017))

(assert (= (and b!487017 res!290451) b!487012))

(declare-fun m!467107 () Bool)

(assert (=> b!487011 m!467107))

(declare-fun m!467109 () Bool)

(assert (=> start!44282 m!467109))

(declare-fun m!467111 () Bool)

(assert (=> start!44282 m!467111))

(declare-fun m!467113 () Bool)

(assert (=> b!487012 m!467113))

(declare-fun m!467115 () Bool)

(assert (=> b!487012 m!467115))

(declare-fun m!467117 () Bool)

(assert (=> b!487017 m!467117))

(declare-fun m!467119 () Bool)

(assert (=> b!487016 m!467119))

(declare-fun m!467121 () Bool)

(assert (=> b!487018 m!467121))

(declare-fun m!467123 () Bool)

(assert (=> b!487014 m!467123))

(assert (=> b!487014 m!467123))

(declare-fun m!467125 () Bool)

(assert (=> b!487014 m!467125))

(declare-fun m!467127 () Bool)

(assert (=> b!487013 m!467127))

(check-sat (not start!44282) (not b!487012) (not b!487017) (not b!487013) (not b!487016) (not b!487014) (not b!487011) (not b!487018))
(check-sat)
