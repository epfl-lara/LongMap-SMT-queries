; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44598 () Bool)

(assert start!44598)

(declare-fun b!489056 () Bool)

(declare-fun res!292136 () Bool)

(declare-fun e!287637 () Bool)

(assert (=> b!489056 (=> (not res!292136) (not e!287637))))

(declare-datatypes ((array!31667 0))(
  ( (array!31668 (arr!15221 (Array (_ BitVec 32) (_ BitVec 64))) (size!15586 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31667)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489056 (= res!292136 (validKeyInArray!0 (select (arr!15221 a!3235) j!176)))))

(declare-fun b!489057 () Bool)

(declare-fun res!292142 () Bool)

(assert (=> b!489057 (=> (not res!292142) (not e!287637))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!489057 (= res!292142 (and (= (size!15586 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15586 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15586 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!489058 () Bool)

(declare-fun res!292135 () Bool)

(assert (=> b!489058 (=> (not res!292135) (not e!287637))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31667 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489058 (= res!292135 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489059 () Bool)

(declare-fun res!292139 () Bool)

(declare-fun e!287639 () Bool)

(assert (=> b!489059 (=> (not res!292139) (not e!287639))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31667 (_ BitVec 32)) Bool)

(assert (=> b!489059 (= res!292139 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489060 () Bool)

(assert (=> b!489060 (= e!287639 (not true))))

(declare-datatypes ((SeekEntryResult!3685 0))(
  ( (MissingZero!3685 (index!16919 (_ BitVec 32))) (Found!3685 (index!16920 (_ BitVec 32))) (Intermediate!3685 (undefined!4497 Bool) (index!16921 (_ BitVec 32)) (x!46042 (_ BitVec 32))) (Undefined!3685) (MissingVacant!3685 (index!16922 (_ BitVec 32))) )
))
(declare-fun lt!220519 () SeekEntryResult!3685)

(declare-fun lt!220522 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31667 (_ BitVec 32)) SeekEntryResult!3685)

(assert (=> b!489060 (= lt!220519 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220522 (select (store (arr!15221 a!3235) i!1204 k0!2280) j!176) (array!31668 (store (arr!15221 a!3235) i!1204 k0!2280) (size!15586 a!3235)) mask!3524))))

(declare-fun lt!220518 () SeekEntryResult!3685)

(declare-fun lt!220517 () (_ BitVec 32))

(assert (=> b!489060 (= lt!220518 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220517 (select (arr!15221 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489060 (= lt!220522 (toIndex!0 (select (store (arr!15221 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!489060 (= lt!220517 (toIndex!0 (select (arr!15221 a!3235) j!176) mask!3524))))

(declare-fun e!287640 () Bool)

(assert (=> b!489060 e!287640))

(declare-fun res!292140 () Bool)

(assert (=> b!489060 (=> (not res!292140) (not e!287640))))

(assert (=> b!489060 (= res!292140 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14302 0))(
  ( (Unit!14303) )
))
(declare-fun lt!220521 () Unit!14302)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31667 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14302)

(assert (=> b!489060 (= lt!220521 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489061 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31667 (_ BitVec 32)) SeekEntryResult!3685)

(assert (=> b!489061 (= e!287640 (= (seekEntryOrOpen!0 (select (arr!15221 a!3235) j!176) a!3235 mask!3524) (Found!3685 j!176)))))

(declare-fun res!292134 () Bool)

(assert (=> start!44598 (=> (not res!292134) (not e!287637))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44598 (= res!292134 (validMask!0 mask!3524))))

(assert (=> start!44598 e!287637))

(assert (=> start!44598 true))

(declare-fun array_inv!11104 (array!31667) Bool)

(assert (=> start!44598 (array_inv!11104 a!3235)))

(declare-fun b!489062 () Bool)

(assert (=> b!489062 (= e!287637 e!287639)))

(declare-fun res!292141 () Bool)

(assert (=> b!489062 (=> (not res!292141) (not e!287639))))

(declare-fun lt!220520 () SeekEntryResult!3685)

(assert (=> b!489062 (= res!292141 (or (= lt!220520 (MissingZero!3685 i!1204)) (= lt!220520 (MissingVacant!3685 i!1204))))))

(assert (=> b!489062 (= lt!220520 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!489063 () Bool)

(declare-fun res!292138 () Bool)

(assert (=> b!489063 (=> (not res!292138) (not e!287639))))

(declare-datatypes ((List!9418 0))(
  ( (Nil!9415) (Cons!9414 (h!10276 (_ BitVec 64)) (t!15637 List!9418)) )
))
(declare-fun arrayNoDuplicates!0 (array!31667 (_ BitVec 32) List!9418) Bool)

(assert (=> b!489063 (= res!292138 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9415))))

(declare-fun b!489064 () Bool)

(declare-fun res!292137 () Bool)

(assert (=> b!489064 (=> (not res!292137) (not e!287637))))

(assert (=> b!489064 (= res!292137 (validKeyInArray!0 k0!2280))))

(assert (= (and start!44598 res!292134) b!489057))

(assert (= (and b!489057 res!292142) b!489056))

(assert (= (and b!489056 res!292136) b!489064))

(assert (= (and b!489064 res!292137) b!489058))

(assert (= (and b!489058 res!292135) b!489062))

(assert (= (and b!489062 res!292141) b!489059))

(assert (= (and b!489059 res!292139) b!489063))

(assert (= (and b!489063 res!292138) b!489060))

(assert (= (and b!489060 res!292140) b!489061))

(declare-fun m!468313 () Bool)

(assert (=> b!489060 m!468313))

(declare-fun m!468315 () Bool)

(assert (=> b!489060 m!468315))

(declare-fun m!468317 () Bool)

(assert (=> b!489060 m!468317))

(declare-fun m!468319 () Bool)

(assert (=> b!489060 m!468319))

(declare-fun m!468321 () Bool)

(assert (=> b!489060 m!468321))

(assert (=> b!489060 m!468317))

(declare-fun m!468323 () Bool)

(assert (=> b!489060 m!468323))

(assert (=> b!489060 m!468319))

(declare-fun m!468325 () Bool)

(assert (=> b!489060 m!468325))

(assert (=> b!489060 m!468319))

(declare-fun m!468327 () Bool)

(assert (=> b!489060 m!468327))

(assert (=> b!489060 m!468317))

(declare-fun m!468329 () Bool)

(assert (=> b!489060 m!468329))

(assert (=> b!489056 m!468319))

(assert (=> b!489056 m!468319))

(declare-fun m!468331 () Bool)

(assert (=> b!489056 m!468331))

(assert (=> b!489061 m!468319))

(assert (=> b!489061 m!468319))

(declare-fun m!468333 () Bool)

(assert (=> b!489061 m!468333))

(declare-fun m!468335 () Bool)

(assert (=> b!489064 m!468335))

(declare-fun m!468337 () Bool)

(assert (=> b!489062 m!468337))

(declare-fun m!468339 () Bool)

(assert (=> b!489058 m!468339))

(declare-fun m!468341 () Bool)

(assert (=> b!489063 m!468341))

(declare-fun m!468343 () Bool)

(assert (=> b!489059 m!468343))

(declare-fun m!468345 () Bool)

(assert (=> start!44598 m!468345))

(declare-fun m!468347 () Bool)

(assert (=> start!44598 m!468347))

(check-sat (not b!489061) (not start!44598) (not b!489059) (not b!489064) (not b!489056) (not b!489062) (not b!489058) (not b!489060) (not b!489063))
(check-sat)
