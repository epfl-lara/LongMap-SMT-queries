; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46256 () Bool)

(assert start!46256)

(declare-fun b!512419 () Bool)

(declare-fun e!299244 () Bool)

(declare-fun e!299243 () Bool)

(assert (=> b!512419 (= e!299244 (not e!299243))))

(declare-fun res!313135 () Bool)

(assert (=> b!512419 (=> res!313135 e!299243)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4255 0))(
  ( (MissingZero!4255 (index!19208 (_ BitVec 32))) (Found!4255 (index!19209 (_ BitVec 32))) (Intermediate!4255 (undefined!5067 Bool) (index!19210 (_ BitVec 32)) (x!48299 (_ BitVec 32))) (Undefined!4255) (MissingVacant!4255 (index!19211 (_ BitVec 32))) )
))
(declare-fun lt!234617 () SeekEntryResult!4255)

(declare-datatypes ((array!32911 0))(
  ( (array!32912 (arr!15832 (Array (_ BitVec 32) (_ BitVec 64))) (size!16196 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32911)

(declare-fun lt!234618 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32911 (_ BitVec 32)) SeekEntryResult!4255)

(assert (=> b!512419 (= res!313135 (= lt!234617 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234618 (select (store (arr!15832 a!3235) i!1204 k0!2280) j!176) (array!32912 (store (arr!15832 a!3235) i!1204 k0!2280) (size!16196 a!3235)) mask!3524)))))

(declare-fun lt!234622 () (_ BitVec 32))

(assert (=> b!512419 (= lt!234617 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234622 (select (arr!15832 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512419 (= lt!234618 (toIndex!0 (select (store (arr!15832 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!512419 (= lt!234622 (toIndex!0 (select (arr!15832 a!3235) j!176) mask!3524))))

(declare-fun lt!234619 () SeekEntryResult!4255)

(assert (=> b!512419 (= lt!234619 (Found!4255 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32911 (_ BitVec 32)) SeekEntryResult!4255)

(assert (=> b!512419 (= lt!234619 (seekEntryOrOpen!0 (select (arr!15832 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32911 (_ BitVec 32)) Bool)

(assert (=> b!512419 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15829 0))(
  ( (Unit!15830) )
))
(declare-fun lt!234621 () Unit!15829)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32911 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15829)

(assert (=> b!512419 (= lt!234621 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!512420 () Bool)

(declare-fun res!313144 () Bool)

(declare-fun e!299241 () Bool)

(assert (=> b!512420 (=> (not res!313144) (not e!299241))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!512420 (= res!313144 (validKeyInArray!0 k0!2280))))

(declare-fun b!512421 () Bool)

(declare-fun res!313143 () Bool)

(assert (=> b!512421 (=> (not res!313143) (not e!299244))))

(assert (=> b!512421 (= res!313143 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!313142 () Bool)

(assert (=> start!46256 (=> (not res!313142) (not e!299241))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46256 (= res!313142 (validMask!0 mask!3524))))

(assert (=> start!46256 e!299241))

(assert (=> start!46256 true))

(declare-fun array_inv!11691 (array!32911) Bool)

(assert (=> start!46256 (array_inv!11691 a!3235)))

(declare-fun b!512422 () Bool)

(assert (=> b!512422 (= e!299241 e!299244)))

(declare-fun res!313141 () Bool)

(assert (=> b!512422 (=> (not res!313141) (not e!299244))))

(declare-fun lt!234620 () SeekEntryResult!4255)

(assert (=> b!512422 (= res!313141 (or (= lt!234620 (MissingZero!4255 i!1204)) (= lt!234620 (MissingVacant!4255 i!1204))))))

(assert (=> b!512422 (= lt!234620 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!512423 () Bool)

(declare-fun res!313137 () Bool)

(assert (=> b!512423 (=> (not res!313137) (not e!299241))))

(assert (=> b!512423 (= res!313137 (validKeyInArray!0 (select (arr!15832 a!3235) j!176)))))

(declare-fun b!512424 () Bool)

(declare-fun res!313139 () Bool)

(assert (=> b!512424 (=> (not res!313139) (not e!299241))))

(declare-fun arrayContainsKey!0 (array!32911 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!512424 (= res!313139 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!512425 () Bool)

(declare-fun res!313138 () Bool)

(assert (=> b!512425 (=> (not res!313138) (not e!299241))))

(assert (=> b!512425 (= res!313138 (and (= (size!16196 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16196 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16196 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!512426 () Bool)

(declare-fun res!313140 () Bool)

(assert (=> b!512426 (=> (not res!313140) (not e!299244))))

(declare-datatypes ((List!9897 0))(
  ( (Nil!9894) (Cons!9893 (h!10773 (_ BitVec 64)) (t!16117 List!9897)) )
))
(declare-fun arrayNoDuplicates!0 (array!32911 (_ BitVec 32) List!9897) Bool)

(assert (=> b!512426 (= res!313140 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9894))))

(declare-fun b!512427 () Bool)

(declare-fun res!313136 () Bool)

(assert (=> b!512427 (=> res!313136 e!299243)))

(get-info :version)

(assert (=> b!512427 (= res!313136 (or (not ((_ is Intermediate!4255) lt!234617)) (not (undefined!5067 lt!234617))))))

(declare-fun b!512428 () Bool)

(assert (=> b!512428 (= e!299243 true)))

(assert (=> b!512428 (= lt!234619 Undefined!4255)))

(assert (= (and start!46256 res!313142) b!512425))

(assert (= (and b!512425 res!313138) b!512423))

(assert (= (and b!512423 res!313137) b!512420))

(assert (= (and b!512420 res!313144) b!512424))

(assert (= (and b!512424 res!313139) b!512422))

(assert (= (and b!512422 res!313141) b!512421))

(assert (= (and b!512421 res!313143) b!512426))

(assert (= (and b!512426 res!313140) b!512419))

(assert (= (and b!512419 (not res!313135)) b!512427))

(assert (= (and b!512427 (not res!313136)) b!512428))

(declare-fun m!494329 () Bool)

(assert (=> b!512426 m!494329))

(declare-fun m!494331 () Bool)

(assert (=> b!512419 m!494331))

(declare-fun m!494333 () Bool)

(assert (=> b!512419 m!494333))

(declare-fun m!494335 () Bool)

(assert (=> b!512419 m!494335))

(declare-fun m!494337 () Bool)

(assert (=> b!512419 m!494337))

(assert (=> b!512419 m!494331))

(declare-fun m!494339 () Bool)

(assert (=> b!512419 m!494339))

(declare-fun m!494341 () Bool)

(assert (=> b!512419 m!494341))

(assert (=> b!512419 m!494339))

(declare-fun m!494343 () Bool)

(assert (=> b!512419 m!494343))

(assert (=> b!512419 m!494339))

(declare-fun m!494345 () Bool)

(assert (=> b!512419 m!494345))

(assert (=> b!512419 m!494339))

(declare-fun m!494347 () Bool)

(assert (=> b!512419 m!494347))

(assert (=> b!512419 m!494331))

(declare-fun m!494349 () Bool)

(assert (=> b!512419 m!494349))

(declare-fun m!494351 () Bool)

(assert (=> start!46256 m!494351))

(declare-fun m!494353 () Bool)

(assert (=> start!46256 m!494353))

(declare-fun m!494355 () Bool)

(assert (=> b!512421 m!494355))

(assert (=> b!512423 m!494339))

(assert (=> b!512423 m!494339))

(declare-fun m!494357 () Bool)

(assert (=> b!512423 m!494357))

(declare-fun m!494359 () Bool)

(assert (=> b!512420 m!494359))

(declare-fun m!494361 () Bool)

(assert (=> b!512422 m!494361))

(declare-fun m!494363 () Bool)

(assert (=> b!512424 m!494363))

(check-sat (not b!512422) (not b!512421) (not b!512423) (not b!512420) (not b!512424) (not b!512419) (not b!512426) (not start!46256))
(check-sat)
