; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30966 () Bool)

(assert start!30966)

(declare-fun e!194185 () Bool)

(declare-datatypes ((array!15881 0))(
  ( (array!15882 (arr!7522 (Array (_ BitVec 32) (_ BitVec 64))) (size!7874 (_ BitVec 32))) )
))
(declare-fun lt!152294 () array!15881)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun b!311184 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun lt!152293 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2627 0))(
  ( (MissingZero!2627 (index!12684 (_ BitVec 32))) (Found!2627 (index!12685 (_ BitVec 32))) (Intermediate!2627 (undefined!3439 Bool) (index!12686 (_ BitVec 32)) (x!31013 (_ BitVec 32))) (Undefined!2627) (MissingVacant!2627 (index!12687 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15881 (_ BitVec 32)) SeekEntryResult!2627)

(assert (=> b!311184 (= e!194185 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152294 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152293 k0!2441 lt!152294 mask!3709)))))

(declare-fun a!3293 () array!15881)

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!311184 (= lt!152294 (array!15882 (store (arr!7522 a!3293) i!1240 k0!2441) (size!7874 a!3293)))))

(declare-fun b!311185 () Bool)

(declare-fun res!167691 () Bool)

(declare-fun e!194186 () Bool)

(assert (=> b!311185 (=> (not res!167691) (not e!194186))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311185 (= res!167691 (validKeyInArray!0 k0!2441))))

(declare-fun b!311186 () Bool)

(declare-fun e!194184 () Bool)

(assert (=> b!311186 (= e!194184 (not true))))

(assert (=> b!311186 e!194185))

(declare-fun res!167696 () Bool)

(assert (=> b!311186 (=> (not res!167696) (not e!194185))))

(declare-fun lt!152295 () SeekEntryResult!2627)

(assert (=> b!311186 (= res!167696 (= lt!152295 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152293 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311186 (= lt!152293 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun res!167689 () Bool)

(assert (=> start!30966 (=> (not res!167689) (not e!194186))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30966 (= res!167689 (validMask!0 mask!3709))))

(assert (=> start!30966 e!194186))

(declare-fun array_inv!5472 (array!15881) Bool)

(assert (=> start!30966 (array_inv!5472 a!3293)))

(assert (=> start!30966 true))

(declare-fun b!311187 () Bool)

(declare-fun res!167690 () Bool)

(assert (=> b!311187 (=> (not res!167690) (not e!194186))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15881 (_ BitVec 32)) Bool)

(assert (=> b!311187 (= res!167690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311188 () Bool)

(declare-fun res!167695 () Bool)

(assert (=> b!311188 (=> (not res!167695) (not e!194186))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15881 (_ BitVec 32)) SeekEntryResult!2627)

(assert (=> b!311188 (= res!167695 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2627 i!1240)))))

(declare-fun b!311189 () Bool)

(declare-fun res!167688 () Bool)

(assert (=> b!311189 (=> (not res!167688) (not e!194186))))

(declare-fun arrayContainsKey!0 (array!15881 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311189 (= res!167688 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311190 () Bool)

(declare-fun e!194183 () Bool)

(assert (=> b!311190 (= e!194186 e!194183)))

(declare-fun res!167697 () Bool)

(assert (=> b!311190 (=> (not res!167697) (not e!194183))))

(declare-fun lt!152292 () SeekEntryResult!2627)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311190 (= res!167697 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152292))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!311190 (= lt!152292 (Intermediate!2627 false resIndex!52 resX!52))))

(declare-fun b!311191 () Bool)

(assert (=> b!311191 (= e!194183 e!194184)))

(declare-fun res!167692 () Bool)

(assert (=> b!311191 (=> (not res!167692) (not e!194184))))

(assert (=> b!311191 (= res!167692 (and (= lt!152295 lt!152292) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7522 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311191 (= lt!152295 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!311192 () Bool)

(declare-fun res!167693 () Bool)

(assert (=> b!311192 (=> (not res!167693) (not e!194186))))

(assert (=> b!311192 (= res!167693 (and (= (size!7874 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7874 a!3293))))))

(declare-fun b!311193 () Bool)

(declare-fun res!167694 () Bool)

(assert (=> b!311193 (=> (not res!167694) (not e!194183))))

(assert (=> b!311193 (= res!167694 (and (= (select (arr!7522 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7874 a!3293))))))

(assert (= (and start!30966 res!167689) b!311192))

(assert (= (and b!311192 res!167693) b!311185))

(assert (= (and b!311185 res!167691) b!311189))

(assert (= (and b!311189 res!167688) b!311188))

(assert (= (and b!311188 res!167695) b!311187))

(assert (= (and b!311187 res!167690) b!311190))

(assert (= (and b!311190 res!167697) b!311193))

(assert (= (and b!311193 res!167694) b!311191))

(assert (= (and b!311191 res!167692) b!311186))

(assert (= (and b!311186 res!167696) b!311184))

(declare-fun m!321331 () Bool)

(assert (=> b!311189 m!321331))

(declare-fun m!321333 () Bool)

(assert (=> b!311187 m!321333))

(declare-fun m!321335 () Bool)

(assert (=> b!311185 m!321335))

(declare-fun m!321337 () Bool)

(assert (=> b!311186 m!321337))

(declare-fun m!321339 () Bool)

(assert (=> b!311186 m!321339))

(declare-fun m!321341 () Bool)

(assert (=> start!30966 m!321341))

(declare-fun m!321343 () Bool)

(assert (=> start!30966 m!321343))

(declare-fun m!321345 () Bool)

(assert (=> b!311190 m!321345))

(assert (=> b!311190 m!321345))

(declare-fun m!321347 () Bool)

(assert (=> b!311190 m!321347))

(declare-fun m!321349 () Bool)

(assert (=> b!311188 m!321349))

(declare-fun m!321351 () Bool)

(assert (=> b!311184 m!321351))

(declare-fun m!321353 () Bool)

(assert (=> b!311184 m!321353))

(declare-fun m!321355 () Bool)

(assert (=> b!311184 m!321355))

(declare-fun m!321357 () Bool)

(assert (=> b!311191 m!321357))

(declare-fun m!321359 () Bool)

(assert (=> b!311191 m!321359))

(declare-fun m!321361 () Bool)

(assert (=> b!311193 m!321361))

(check-sat (not b!311188) (not start!30966) (not b!311187) (not b!311189) (not b!311190) (not b!311185) (not b!311186) (not b!311184) (not b!311191))
(check-sat)
