; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44672 () Bool)

(assert start!44672)

(declare-fun res!293233 () Bool)

(declare-fun e!288207 () Bool)

(assert (=> start!44672 (=> (not res!293233) (not e!288207))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44672 (= res!293233 (validMask!0 mask!3524))))

(assert (=> start!44672 e!288207))

(assert (=> start!44672 true))

(declare-datatypes ((array!31732 0))(
  ( (array!31733 (arr!15253 (Array (_ BitVec 32) (_ BitVec 64))) (size!15617 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31732)

(declare-fun array_inv!11112 (array!31732) Bool)

(assert (=> start!44672 (array_inv!11112 a!3235)))

(declare-fun b!490238 () Bool)

(declare-fun res!293229 () Bool)

(assert (=> b!490238 (=> (not res!293229) (not e!288207))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490238 (= res!293229 (validKeyInArray!0 (select (arr!15253 a!3235) j!176)))))

(declare-fun e!288205 () Bool)

(declare-fun b!490239 () Bool)

(declare-datatypes ((SeekEntryResult!3676 0))(
  ( (MissingZero!3676 (index!16883 (_ BitVec 32))) (Found!3676 (index!16884 (_ BitVec 32))) (Intermediate!3676 (undefined!4488 Bool) (index!16885 (_ BitVec 32)) (x!46131 (_ BitVec 32))) (Undefined!3676) (MissingVacant!3676 (index!16886 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31732 (_ BitVec 32)) SeekEntryResult!3676)

(assert (=> b!490239 (= e!288205 (= (seekEntryOrOpen!0 (select (arr!15253 a!3235) j!176) a!3235 mask!3524) (Found!3676 j!176)))))

(declare-fun b!490240 () Bool)

(declare-fun res!293230 () Bool)

(declare-fun e!288204 () Bool)

(assert (=> b!490240 (=> (not res!293230) (not e!288204))))

(declare-datatypes ((List!9318 0))(
  ( (Nil!9315) (Cons!9314 (h!10176 (_ BitVec 64)) (t!15538 List!9318)) )
))
(declare-fun arrayNoDuplicates!0 (array!31732 (_ BitVec 32) List!9318) Bool)

(assert (=> b!490240 (= res!293230 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9315))))

(declare-fun b!490241 () Bool)

(declare-fun res!293235 () Bool)

(assert (=> b!490241 (=> (not res!293235) (not e!288207))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!490241 (= res!293235 (and (= (size!15617 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15617 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15617 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490242 () Bool)

(assert (=> b!490242 (= e!288207 e!288204)))

(declare-fun res!293228 () Bool)

(assert (=> b!490242 (=> (not res!293228) (not e!288204))))

(declare-fun lt!221413 () SeekEntryResult!3676)

(assert (=> b!490242 (= res!293228 (or (= lt!221413 (MissingZero!3676 i!1204)) (= lt!221413 (MissingVacant!3676 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!490242 (= lt!221413 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!490243 () Bool)

(declare-fun res!293234 () Bool)

(assert (=> b!490243 (=> (not res!293234) (not e!288207))))

(declare-fun arrayContainsKey!0 (array!31732 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490243 (= res!293234 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490244 () Bool)

(declare-fun res!293232 () Bool)

(assert (=> b!490244 (=> (not res!293232) (not e!288207))))

(assert (=> b!490244 (= res!293232 (validKeyInArray!0 k0!2280))))

(declare-fun b!490245 () Bool)

(assert (=> b!490245 (= e!288204 (not true))))

(declare-fun lt!221415 () (_ BitVec 32))

(declare-fun lt!221412 () SeekEntryResult!3676)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31732 (_ BitVec 32)) SeekEntryResult!3676)

(assert (=> b!490245 (= lt!221412 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221415 (select (store (arr!15253 a!3235) i!1204 k0!2280) j!176) (array!31733 (store (arr!15253 a!3235) i!1204 k0!2280) (size!15617 a!3235)) mask!3524))))

(declare-fun lt!221416 () (_ BitVec 32))

(declare-fun lt!221414 () SeekEntryResult!3676)

(assert (=> b!490245 (= lt!221414 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221416 (select (arr!15253 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490245 (= lt!221415 (toIndex!0 (select (store (arr!15253 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!490245 (= lt!221416 (toIndex!0 (select (arr!15253 a!3235) j!176) mask!3524))))

(assert (=> b!490245 e!288205))

(declare-fun res!293236 () Bool)

(assert (=> b!490245 (=> (not res!293236) (not e!288205))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31732 (_ BitVec 32)) Bool)

(assert (=> b!490245 (= res!293236 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14359 0))(
  ( (Unit!14360) )
))
(declare-fun lt!221411 () Unit!14359)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31732 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14359)

(assert (=> b!490245 (= lt!221411 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490246 () Bool)

(declare-fun res!293231 () Bool)

(assert (=> b!490246 (=> (not res!293231) (not e!288204))))

(assert (=> b!490246 (= res!293231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44672 res!293233) b!490241))

(assert (= (and b!490241 res!293235) b!490238))

(assert (= (and b!490238 res!293229) b!490244))

(assert (= (and b!490244 res!293232) b!490243))

(assert (= (and b!490243 res!293234) b!490242))

(assert (= (and b!490242 res!293228) b!490246))

(assert (= (and b!490246 res!293231) b!490240))

(assert (= (and b!490240 res!293230) b!490245))

(assert (= (and b!490245 res!293236) b!490239))

(declare-fun m!470545 () Bool)

(assert (=> b!490246 m!470545))

(declare-fun m!470547 () Bool)

(assert (=> b!490242 m!470547))

(declare-fun m!470549 () Bool)

(assert (=> b!490245 m!470549))

(declare-fun m!470551 () Bool)

(assert (=> b!490245 m!470551))

(declare-fun m!470553 () Bool)

(assert (=> b!490245 m!470553))

(declare-fun m!470555 () Bool)

(assert (=> b!490245 m!470555))

(assert (=> b!490245 m!470553))

(declare-fun m!470557 () Bool)

(assert (=> b!490245 m!470557))

(assert (=> b!490245 m!470551))

(declare-fun m!470559 () Bool)

(assert (=> b!490245 m!470559))

(assert (=> b!490245 m!470551))

(declare-fun m!470561 () Bool)

(assert (=> b!490245 m!470561))

(declare-fun m!470563 () Bool)

(assert (=> b!490245 m!470563))

(assert (=> b!490245 m!470553))

(declare-fun m!470565 () Bool)

(assert (=> b!490245 m!470565))

(declare-fun m!470567 () Bool)

(assert (=> start!44672 m!470567))

(declare-fun m!470569 () Bool)

(assert (=> start!44672 m!470569))

(assert (=> b!490239 m!470553))

(assert (=> b!490239 m!470553))

(declare-fun m!470571 () Bool)

(assert (=> b!490239 m!470571))

(declare-fun m!470573 () Bool)

(assert (=> b!490243 m!470573))

(declare-fun m!470575 () Bool)

(assert (=> b!490240 m!470575))

(assert (=> b!490238 m!470553))

(assert (=> b!490238 m!470553))

(declare-fun m!470577 () Bool)

(assert (=> b!490238 m!470577))

(declare-fun m!470579 () Bool)

(assert (=> b!490244 m!470579))

(check-sat (not b!490244) (not b!490243) (not b!490238) (not b!490240) (not b!490246) (not b!490239) (not b!490242) (not b!490245) (not start!44672))
(check-sat)
