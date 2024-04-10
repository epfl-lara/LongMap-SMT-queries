; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31798 () Bool)

(assert start!31798)

(declare-fun b!317612 () Bool)

(declare-fun res!172192 () Bool)

(declare-fun e!197455 () Bool)

(assert (=> b!317612 (=> (not res!172192) (not e!197455))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!317612 (= res!172192 (validKeyInArray!0 k0!2441))))

(declare-fun b!317613 () Bool)

(declare-fun res!172194 () Bool)

(assert (=> b!317613 (=> (not res!172194) (not e!197455))))

(declare-datatypes ((array!16169 0))(
  ( (array!16170 (arr!7650 (Array (_ BitVec 32) (_ BitVec 64))) (size!8002 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16169)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2790 0))(
  ( (MissingZero!2790 (index!13336 (_ BitVec 32))) (Found!2790 (index!13337 (_ BitVec 32))) (Intermediate!2790 (undefined!3602 Bool) (index!13338 (_ BitVec 32)) (x!31599 (_ BitVec 32))) (Undefined!2790) (MissingVacant!2790 (index!13339 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16169 (_ BitVec 32)) SeekEntryResult!2790)

(assert (=> b!317613 (= res!172194 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2790 i!1240)))))

(declare-fun b!317614 () Bool)

(declare-fun res!172200 () Bool)

(assert (=> b!317614 (=> (not res!172200) (not e!197455))))

(declare-fun arrayContainsKey!0 (array!16169 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!317614 (= res!172200 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!317615 () Bool)

(declare-fun e!197453 () Bool)

(assert (=> b!317615 (= e!197455 e!197453)))

(declare-fun res!172191 () Bool)

(assert (=> b!317615 (=> (not res!172191) (not e!197453))))

(declare-fun lt!155020 () SeekEntryResult!2790)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16169 (_ BitVec 32)) SeekEntryResult!2790)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317615 (= res!172191 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!155020))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!317615 (= lt!155020 (Intermediate!2790 false resIndex!52 resX!52))))

(declare-fun b!317616 () Bool)

(declare-fun e!197451 () Bool)

(assert (=> b!317616 (= e!197451 (not true))))

(declare-fun e!197452 () Bool)

(assert (=> b!317616 e!197452))

(declare-fun res!172198 () Bool)

(assert (=> b!317616 (=> (not res!172198) (not e!197452))))

(declare-fun lt!155021 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!155022 () SeekEntryResult!2790)

(assert (=> b!317616 (= res!172198 (= lt!155022 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155021 k0!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317616 (= lt!155021 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!317617 () Bool)

(assert (=> b!317617 (= e!197453 e!197451)))

(declare-fun res!172199 () Bool)

(assert (=> b!317617 (=> (not res!172199) (not e!197451))))

(assert (=> b!317617 (= res!172199 (and (= lt!155022 lt!155020) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7650 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!317617 (= lt!155022 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!317618 () Bool)

(declare-fun res!172193 () Bool)

(assert (=> b!317618 (=> (not res!172193) (not e!197455))))

(assert (=> b!317618 (= res!172193 (and (= (size!8002 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8002 a!3293))))))

(declare-fun lt!155019 () array!16169)

(declare-fun b!317619 () Bool)

(assert (=> b!317619 (= e!197452 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!155019 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155021 k0!2441 lt!155019 mask!3709)))))

(assert (=> b!317619 (= lt!155019 (array!16170 (store (arr!7650 a!3293) i!1240 k0!2441) (size!8002 a!3293)))))

(declare-fun b!317621 () Bool)

(declare-fun res!172195 () Bool)

(assert (=> b!317621 (=> (not res!172195) (not e!197453))))

(assert (=> b!317621 (= res!172195 (and (= (select (arr!7650 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8002 a!3293))))))

(declare-fun res!172197 () Bool)

(assert (=> start!31798 (=> (not res!172197) (not e!197455))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31798 (= res!172197 (validMask!0 mask!3709))))

(assert (=> start!31798 e!197455))

(declare-fun array_inv!5613 (array!16169) Bool)

(assert (=> start!31798 (array_inv!5613 a!3293)))

(assert (=> start!31798 true))

(declare-fun b!317620 () Bool)

(declare-fun res!172196 () Bool)

(assert (=> b!317620 (=> (not res!172196) (not e!197455))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16169 (_ BitVec 32)) Bool)

(assert (=> b!317620 (= res!172196 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!31798 res!172197) b!317618))

(assert (= (and b!317618 res!172193) b!317612))

(assert (= (and b!317612 res!172192) b!317614))

(assert (= (and b!317614 res!172200) b!317613))

(assert (= (and b!317613 res!172194) b!317620))

(assert (= (and b!317620 res!172196) b!317615))

(assert (= (and b!317615 res!172191) b!317621))

(assert (= (and b!317621 res!172195) b!317617))

(assert (= (and b!317617 res!172199) b!317616))

(assert (= (and b!317616 res!172198) b!317619))

(declare-fun m!326257 () Bool)

(assert (=> b!317614 m!326257))

(declare-fun m!326259 () Bool)

(assert (=> b!317613 m!326259))

(declare-fun m!326261 () Bool)

(assert (=> start!31798 m!326261))

(declare-fun m!326263 () Bool)

(assert (=> start!31798 m!326263))

(declare-fun m!326265 () Bool)

(assert (=> b!317619 m!326265))

(declare-fun m!326267 () Bool)

(assert (=> b!317619 m!326267))

(declare-fun m!326269 () Bool)

(assert (=> b!317619 m!326269))

(declare-fun m!326271 () Bool)

(assert (=> b!317616 m!326271))

(declare-fun m!326273 () Bool)

(assert (=> b!317616 m!326273))

(declare-fun m!326275 () Bool)

(assert (=> b!317617 m!326275))

(declare-fun m!326277 () Bool)

(assert (=> b!317617 m!326277))

(declare-fun m!326279 () Bool)

(assert (=> b!317615 m!326279))

(assert (=> b!317615 m!326279))

(declare-fun m!326281 () Bool)

(assert (=> b!317615 m!326281))

(declare-fun m!326283 () Bool)

(assert (=> b!317620 m!326283))

(declare-fun m!326285 () Bool)

(assert (=> b!317612 m!326285))

(declare-fun m!326287 () Bool)

(assert (=> b!317621 m!326287))

(check-sat (not b!317613) (not b!317619) (not b!317616) (not b!317617) (not b!317615) (not b!317612) (not start!31798) (not b!317614) (not b!317620))
(check-sat)
