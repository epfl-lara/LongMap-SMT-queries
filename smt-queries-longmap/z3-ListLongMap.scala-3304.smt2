; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45758 () Bool)

(assert start!45758)

(declare-fun res!307410 () Bool)

(declare-fun e!296387 () Bool)

(assert (=> start!45758 (=> (not res!307410) (not e!296387))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45758 (= res!307410 (validMask!0 mask!3524))))

(assert (=> start!45758 e!296387))

(assert (=> start!45758 true))

(declare-datatypes ((array!32515 0))(
  ( (array!32516 (arr!15637 (Array (_ BitVec 32) (_ BitVec 64))) (size!16001 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32515)

(declare-fun array_inv!11496 (array!32515) Bool)

(assert (=> start!45758 (array_inv!11496 a!3235)))

(declare-fun b!506394 () Bool)

(declare-fun e!296386 () Bool)

(declare-fun e!296388 () Bool)

(assert (=> b!506394 (= e!296386 (not e!296388))))

(declare-fun res!307407 () Bool)

(assert (=> b!506394 (=> res!307407 e!296388)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!231114 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4060 0))(
  ( (MissingZero!4060 (index!18428 (_ BitVec 32))) (Found!4060 (index!18429 (_ BitVec 32))) (Intermediate!4060 (undefined!4872 Bool) (index!18430 (_ BitVec 32)) (x!47578 (_ BitVec 32))) (Undefined!4060) (MissingVacant!4060 (index!18431 (_ BitVec 32))) )
))
(declare-fun lt!231118 () SeekEntryResult!4060)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32515 (_ BitVec 32)) SeekEntryResult!4060)

(assert (=> b!506394 (= res!307407 (= lt!231118 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231114 (select (store (arr!15637 a!3235) i!1204 k0!2280) j!176) (array!32516 (store (arr!15637 a!3235) i!1204 k0!2280) (size!16001 a!3235)) mask!3524)))))

(declare-fun lt!231117 () (_ BitVec 32))

(assert (=> b!506394 (= lt!231118 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231117 (select (arr!15637 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506394 (= lt!231114 (toIndex!0 (select (store (arr!15637 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!506394 (= lt!231117 (toIndex!0 (select (arr!15637 a!3235) j!176) mask!3524))))

(declare-fun e!296391 () Bool)

(assert (=> b!506394 e!296391))

(declare-fun res!307409 () Bool)

(assert (=> b!506394 (=> (not res!307409) (not e!296391))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32515 (_ BitVec 32)) Bool)

(assert (=> b!506394 (= res!307409 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15469 0))(
  ( (Unit!15470) )
))
(declare-fun lt!231115 () Unit!15469)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32515 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15469)

(assert (=> b!506394 (= lt!231115 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!506395 () Bool)

(declare-fun res!307411 () Bool)

(assert (=> b!506395 (=> (not res!307411) (not e!296386))))

(assert (=> b!506395 (= res!307411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!506396 () Bool)

(declare-fun res!307417 () Bool)

(assert (=> b!506396 (=> (not res!307417) (not e!296387))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506396 (= res!307417 (validKeyInArray!0 (select (arr!15637 a!3235) j!176)))))

(declare-fun b!506397 () Bool)

(declare-fun e!296390 () Bool)

(assert (=> b!506397 (= e!296390 true)))

(assert (=> b!506397 false))

(declare-fun b!506398 () Bool)

(declare-fun res!307414 () Bool)

(assert (=> b!506398 (=> (not res!307414) (not e!296387))))

(declare-fun arrayContainsKey!0 (array!32515 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506398 (= res!307414 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!506399 () Bool)

(declare-fun res!307415 () Bool)

(assert (=> b!506399 (=> (not res!307415) (not e!296386))))

(declare-datatypes ((List!9702 0))(
  ( (Nil!9699) (Cons!9698 (h!10575 (_ BitVec 64)) (t!15922 List!9702)) )
))
(declare-fun arrayNoDuplicates!0 (array!32515 (_ BitVec 32) List!9702) Bool)

(assert (=> b!506399 (= res!307415 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9699))))

(declare-fun b!506400 () Bool)

(declare-fun res!307412 () Bool)

(assert (=> b!506400 (=> (not res!307412) (not e!296387))))

(assert (=> b!506400 (= res!307412 (and (= (size!16001 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16001 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16001 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506401 () Bool)

(declare-fun res!307408 () Bool)

(assert (=> b!506401 (=> (not res!307408) (not e!296387))))

(assert (=> b!506401 (= res!307408 (validKeyInArray!0 k0!2280))))

(declare-fun b!506402 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32515 (_ BitVec 32)) SeekEntryResult!4060)

(assert (=> b!506402 (= e!296391 (= (seekEntryOrOpen!0 (select (arr!15637 a!3235) j!176) a!3235 mask!3524) (Found!4060 j!176)))))

(declare-fun b!506403 () Bool)

(assert (=> b!506403 (= e!296387 e!296386)))

(declare-fun res!307416 () Bool)

(assert (=> b!506403 (=> (not res!307416) (not e!296386))))

(declare-fun lt!231113 () SeekEntryResult!4060)

(assert (=> b!506403 (= res!307416 (or (= lt!231113 (MissingZero!4060 i!1204)) (= lt!231113 (MissingVacant!4060 i!1204))))))

(assert (=> b!506403 (= lt!231113 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!506404 () Bool)

(assert (=> b!506404 (= e!296388 e!296390)))

(declare-fun res!307413 () Bool)

(assert (=> b!506404 (=> res!307413 e!296390)))

(declare-fun lt!231116 () Bool)

(assert (=> b!506404 (= res!307413 (or (and (not lt!231116) (undefined!4872 lt!231118)) (and (not lt!231116) (not (undefined!4872 lt!231118)))))))

(get-info :version)

(assert (=> b!506404 (= lt!231116 (not ((_ is Intermediate!4060) lt!231118)))))

(assert (= (and start!45758 res!307410) b!506400))

(assert (= (and b!506400 res!307412) b!506396))

(assert (= (and b!506396 res!307417) b!506401))

(assert (= (and b!506401 res!307408) b!506398))

(assert (= (and b!506398 res!307414) b!506403))

(assert (= (and b!506403 res!307416) b!506395))

(assert (= (and b!506395 res!307411) b!506399))

(assert (= (and b!506399 res!307415) b!506394))

(assert (= (and b!506394 res!307409) b!506402))

(assert (= (and b!506394 (not res!307407)) b!506404))

(assert (= (and b!506404 (not res!307413)) b!506397))

(declare-fun m!487303 () Bool)

(assert (=> b!506396 m!487303))

(assert (=> b!506396 m!487303))

(declare-fun m!487305 () Bool)

(assert (=> b!506396 m!487305))

(declare-fun m!487307 () Bool)

(assert (=> b!506401 m!487307))

(declare-fun m!487309 () Bool)

(assert (=> start!45758 m!487309))

(declare-fun m!487311 () Bool)

(assert (=> start!45758 m!487311))

(declare-fun m!487313 () Bool)

(assert (=> b!506395 m!487313))

(declare-fun m!487315 () Bool)

(assert (=> b!506403 m!487315))

(declare-fun m!487317 () Bool)

(assert (=> b!506394 m!487317))

(declare-fun m!487319 () Bool)

(assert (=> b!506394 m!487319))

(assert (=> b!506394 m!487303))

(declare-fun m!487321 () Bool)

(assert (=> b!506394 m!487321))

(declare-fun m!487323 () Bool)

(assert (=> b!506394 m!487323))

(declare-fun m!487325 () Bool)

(assert (=> b!506394 m!487325))

(assert (=> b!506394 m!487323))

(declare-fun m!487327 () Bool)

(assert (=> b!506394 m!487327))

(assert (=> b!506394 m!487323))

(assert (=> b!506394 m!487303))

(declare-fun m!487329 () Bool)

(assert (=> b!506394 m!487329))

(assert (=> b!506394 m!487303))

(declare-fun m!487331 () Bool)

(assert (=> b!506394 m!487331))

(declare-fun m!487333 () Bool)

(assert (=> b!506399 m!487333))

(declare-fun m!487335 () Bool)

(assert (=> b!506398 m!487335))

(assert (=> b!506402 m!487303))

(assert (=> b!506402 m!487303))

(declare-fun m!487337 () Bool)

(assert (=> b!506402 m!487337))

(check-sat (not b!506396) (not b!506402) (not start!45758) (not b!506403) (not b!506398) (not b!506394) (not b!506401) (not b!506395) (not b!506399))
(check-sat)
