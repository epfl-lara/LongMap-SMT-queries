; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44462 () Bool)

(assert start!44462)

(declare-fun b!488331 () Bool)

(declare-fun e!287274 () Bool)

(declare-fun e!287275 () Bool)

(assert (=> b!488331 (= e!287274 e!287275)))

(declare-fun res!291493 () Bool)

(assert (=> b!488331 (=> (not res!291493) (not e!287275))))

(declare-datatypes ((SeekEntryResult!3666 0))(
  ( (MissingZero!3666 (index!16843 (_ BitVec 32))) (Found!3666 (index!16844 (_ BitVec 32))) (Intermediate!3666 (undefined!4478 Bool) (index!16845 (_ BitVec 32)) (x!45961 (_ BitVec 32))) (Undefined!3666) (MissingVacant!3666 (index!16846 (_ BitVec 32))) )
))
(declare-fun lt!220372 () SeekEntryResult!3666)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!488331 (= res!291493 (or (= lt!220372 (MissingZero!3666 i!1204)) (= lt!220372 (MissingVacant!3666 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31617 0))(
  ( (array!31618 (arr!15199 (Array (_ BitVec 32) (_ BitVec 64))) (size!15563 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31617)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31617 (_ BitVec 32)) SeekEntryResult!3666)

(assert (=> b!488331 (= lt!220372 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!488332 () Bool)

(declare-fun res!291496 () Bool)

(assert (=> b!488332 (=> (not res!291496) (not e!287274))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!488332 (= res!291496 (validKeyInArray!0 k0!2280))))

(declare-fun res!291494 () Bool)

(assert (=> start!44462 (=> (not res!291494) (not e!287274))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44462 (= res!291494 (validMask!0 mask!3524))))

(assert (=> start!44462 e!287274))

(assert (=> start!44462 true))

(declare-fun array_inv!10995 (array!31617) Bool)

(assert (=> start!44462 (array_inv!10995 a!3235)))

(declare-fun e!287277 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!488333 () Bool)

(assert (=> b!488333 (= e!287277 (= (seekEntryOrOpen!0 (select (arr!15199 a!3235) j!176) a!3235 mask!3524) (Found!3666 j!176)))))

(declare-fun b!488334 () Bool)

(assert (=> b!488334 (= e!287275 (not (bvsge mask!3524 #b00000000000000000000000000000000)))))

(assert (=> b!488334 e!287277))

(declare-fun res!291498 () Bool)

(assert (=> b!488334 (=> (not res!291498) (not e!287277))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31617 (_ BitVec 32)) Bool)

(assert (=> b!488334 (= res!291498 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14278 0))(
  ( (Unit!14279) )
))
(declare-fun lt!220371 () Unit!14278)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31617 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14278)

(assert (=> b!488334 (= lt!220371 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!488335 () Bool)

(declare-fun res!291497 () Bool)

(assert (=> b!488335 (=> (not res!291497) (not e!287274))))

(assert (=> b!488335 (= res!291497 (validKeyInArray!0 (select (arr!15199 a!3235) j!176)))))

(declare-fun b!488336 () Bool)

(declare-fun res!291500 () Bool)

(assert (=> b!488336 (=> (not res!291500) (not e!287275))))

(assert (=> b!488336 (= res!291500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!488337 () Bool)

(declare-fun res!291492 () Bool)

(assert (=> b!488337 (=> (not res!291492) (not e!287275))))

(declare-datatypes ((List!9357 0))(
  ( (Nil!9354) (Cons!9353 (h!10212 (_ BitVec 64)) (t!15585 List!9357)) )
))
(declare-fun arrayNoDuplicates!0 (array!31617 (_ BitVec 32) List!9357) Bool)

(assert (=> b!488337 (= res!291492 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9354))))

(declare-fun b!488338 () Bool)

(declare-fun res!291495 () Bool)

(assert (=> b!488338 (=> (not res!291495) (not e!287274))))

(declare-fun arrayContainsKey!0 (array!31617 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!488338 (= res!291495 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!488339 () Bool)

(declare-fun res!291499 () Bool)

(assert (=> b!488339 (=> (not res!291499) (not e!287274))))

(assert (=> b!488339 (= res!291499 (and (= (size!15563 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15563 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15563 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44462 res!291494) b!488339))

(assert (= (and b!488339 res!291499) b!488335))

(assert (= (and b!488335 res!291497) b!488332))

(assert (= (and b!488332 res!291496) b!488338))

(assert (= (and b!488338 res!291495) b!488331))

(assert (= (and b!488331 res!291493) b!488336))

(assert (= (and b!488336 res!291500) b!488337))

(assert (= (and b!488337 res!291492) b!488334))

(assert (= (and b!488334 res!291498) b!488333))

(declare-fun m!468075 () Bool)

(assert (=> b!488331 m!468075))

(declare-fun m!468077 () Bool)

(assert (=> start!44462 m!468077))

(declare-fun m!468079 () Bool)

(assert (=> start!44462 m!468079))

(declare-fun m!468081 () Bool)

(assert (=> b!488334 m!468081))

(declare-fun m!468083 () Bool)

(assert (=> b!488334 m!468083))

(declare-fun m!468085 () Bool)

(assert (=> b!488336 m!468085))

(declare-fun m!468087 () Bool)

(assert (=> b!488335 m!468087))

(assert (=> b!488335 m!468087))

(declare-fun m!468089 () Bool)

(assert (=> b!488335 m!468089))

(assert (=> b!488333 m!468087))

(assert (=> b!488333 m!468087))

(declare-fun m!468091 () Bool)

(assert (=> b!488333 m!468091))

(declare-fun m!468093 () Bool)

(assert (=> b!488337 m!468093))

(declare-fun m!468095 () Bool)

(assert (=> b!488338 m!468095))

(declare-fun m!468097 () Bool)

(assert (=> b!488332 m!468097))

(check-sat (not b!488336) (not b!488333) (not b!488332) (not b!488337) (not b!488334) (not b!488335) (not start!44462) (not b!488331) (not b!488338))
(check-sat)
