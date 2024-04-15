; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44610 () Bool)

(assert start!44610)

(declare-fun b!489218 () Bool)

(declare-fun e!287711 () Bool)

(declare-fun e!287710 () Bool)

(assert (=> b!489218 (= e!287711 e!287710)))

(declare-fun res!292304 () Bool)

(assert (=> b!489218 (=> (not res!292304) (not e!287710))))

(declare-datatypes ((SeekEntryResult!3691 0))(
  ( (MissingZero!3691 (index!16943 (_ BitVec 32))) (Found!3691 (index!16944 (_ BitVec 32))) (Intermediate!3691 (undefined!4503 Bool) (index!16945 (_ BitVec 32)) (x!46064 (_ BitVec 32))) (Undefined!3691) (MissingVacant!3691 (index!16946 (_ BitVec 32))) )
))
(declare-fun lt!220630 () SeekEntryResult!3691)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!489218 (= res!292304 (or (= lt!220630 (MissingZero!3691 i!1204)) (= lt!220630 (MissingVacant!3691 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31679 0))(
  ( (array!31680 (arr!15227 (Array (_ BitVec 32) (_ BitVec 64))) (size!15592 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31679)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31679 (_ BitVec 32)) SeekEntryResult!3691)

(assert (=> b!489218 (= lt!220630 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!489219 () Bool)

(assert (=> b!489219 (= e!287710 (not true))))

(declare-fun lt!220625 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!220629 () SeekEntryResult!3691)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31679 (_ BitVec 32)) SeekEntryResult!3691)

(assert (=> b!489219 (= lt!220629 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220625 (select (store (arr!15227 a!3235) i!1204 k0!2280) j!176) (array!31680 (store (arr!15227 a!3235) i!1204 k0!2280) (size!15592 a!3235)) mask!3524))))

(declare-fun lt!220627 () SeekEntryResult!3691)

(declare-fun lt!220626 () (_ BitVec 32))

(assert (=> b!489219 (= lt!220627 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220626 (select (arr!15227 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489219 (= lt!220625 (toIndex!0 (select (store (arr!15227 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!489219 (= lt!220626 (toIndex!0 (select (arr!15227 a!3235) j!176) mask!3524))))

(declare-fun e!287709 () Bool)

(assert (=> b!489219 e!287709))

(declare-fun res!292300 () Bool)

(assert (=> b!489219 (=> (not res!292300) (not e!287709))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31679 (_ BitVec 32)) Bool)

(assert (=> b!489219 (= res!292300 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14314 0))(
  ( (Unit!14315) )
))
(declare-fun lt!220628 () Unit!14314)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31679 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14314)

(assert (=> b!489219 (= lt!220628 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489220 () Bool)

(declare-fun res!292301 () Bool)

(assert (=> b!489220 (=> (not res!292301) (not e!287711))))

(assert (=> b!489220 (= res!292301 (and (= (size!15592 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15592 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15592 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!292297 () Bool)

(assert (=> start!44610 (=> (not res!292297) (not e!287711))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44610 (= res!292297 (validMask!0 mask!3524))))

(assert (=> start!44610 e!287711))

(assert (=> start!44610 true))

(declare-fun array_inv!11110 (array!31679) Bool)

(assert (=> start!44610 (array_inv!11110 a!3235)))

(declare-fun b!489221 () Bool)

(declare-fun res!292296 () Bool)

(assert (=> b!489221 (=> (not res!292296) (not e!287711))))

(declare-fun arrayContainsKey!0 (array!31679 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489221 (= res!292296 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489222 () Bool)

(assert (=> b!489222 (= e!287709 (= (seekEntryOrOpen!0 (select (arr!15227 a!3235) j!176) a!3235 mask!3524) (Found!3691 j!176)))))

(declare-fun b!489223 () Bool)

(declare-fun res!292299 () Bool)

(assert (=> b!489223 (=> (not res!292299) (not e!287711))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489223 (= res!292299 (validKeyInArray!0 (select (arr!15227 a!3235) j!176)))))

(declare-fun b!489224 () Bool)

(declare-fun res!292298 () Bool)

(assert (=> b!489224 (=> (not res!292298) (not e!287711))))

(assert (=> b!489224 (= res!292298 (validKeyInArray!0 k0!2280))))

(declare-fun b!489225 () Bool)

(declare-fun res!292302 () Bool)

(assert (=> b!489225 (=> (not res!292302) (not e!287710))))

(declare-datatypes ((List!9424 0))(
  ( (Nil!9421) (Cons!9420 (h!10282 (_ BitVec 64)) (t!15643 List!9424)) )
))
(declare-fun arrayNoDuplicates!0 (array!31679 (_ BitVec 32) List!9424) Bool)

(assert (=> b!489225 (= res!292302 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9421))))

(declare-fun b!489226 () Bool)

(declare-fun res!292303 () Bool)

(assert (=> b!489226 (=> (not res!292303) (not e!287710))))

(assert (=> b!489226 (= res!292303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44610 res!292297) b!489220))

(assert (= (and b!489220 res!292301) b!489223))

(assert (= (and b!489223 res!292299) b!489224))

(assert (= (and b!489224 res!292298) b!489221))

(assert (= (and b!489221 res!292296) b!489218))

(assert (= (and b!489218 res!292304) b!489226))

(assert (= (and b!489226 res!292303) b!489225))

(assert (= (and b!489225 res!292302) b!489219))

(assert (= (and b!489219 res!292300) b!489222))

(declare-fun m!468529 () Bool)

(assert (=> b!489223 m!468529))

(assert (=> b!489223 m!468529))

(declare-fun m!468531 () Bool)

(assert (=> b!489223 m!468531))

(declare-fun m!468533 () Bool)

(assert (=> b!489219 m!468533))

(declare-fun m!468535 () Bool)

(assert (=> b!489219 m!468535))

(declare-fun m!468537 () Bool)

(assert (=> b!489219 m!468537))

(assert (=> b!489219 m!468529))

(assert (=> b!489219 m!468537))

(declare-fun m!468539 () Bool)

(assert (=> b!489219 m!468539))

(assert (=> b!489219 m!468529))

(declare-fun m!468541 () Bool)

(assert (=> b!489219 m!468541))

(assert (=> b!489219 m!468537))

(declare-fun m!468543 () Bool)

(assert (=> b!489219 m!468543))

(declare-fun m!468545 () Bool)

(assert (=> b!489219 m!468545))

(assert (=> b!489219 m!468529))

(declare-fun m!468547 () Bool)

(assert (=> b!489219 m!468547))

(assert (=> b!489222 m!468529))

(assert (=> b!489222 m!468529))

(declare-fun m!468549 () Bool)

(assert (=> b!489222 m!468549))

(declare-fun m!468551 () Bool)

(assert (=> b!489225 m!468551))

(declare-fun m!468553 () Bool)

(assert (=> b!489224 m!468553))

(declare-fun m!468555 () Bool)

(assert (=> b!489226 m!468555))

(declare-fun m!468557 () Bool)

(assert (=> b!489221 m!468557))

(declare-fun m!468559 () Bool)

(assert (=> start!44610 m!468559))

(declare-fun m!468561 () Bool)

(assert (=> start!44610 m!468561))

(declare-fun m!468563 () Bool)

(assert (=> b!489218 m!468563))

(check-sat (not b!489218) (not b!489223) (not b!489221) (not start!44610) (not b!489219) (not b!489224) (not b!489225) (not b!489226) (not b!489222))
(check-sat)
