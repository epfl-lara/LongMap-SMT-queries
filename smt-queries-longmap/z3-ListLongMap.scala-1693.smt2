; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31048 () Bool)

(assert start!31048)

(declare-fun b!312257 () Bool)

(declare-fun e!194731 () Bool)

(assert (=> b!312257 (= e!194731 true)))

(declare-datatypes ((SeekEntryResult!2697 0))(
  ( (MissingZero!2697 (index!12964 (_ BitVec 32))) (Found!2697 (index!12965 (_ BitVec 32))) (Intermediate!2697 (undefined!3509 Bool) (index!12966 (_ BitVec 32)) (x!31174 (_ BitVec 32))) (Undefined!2697) (MissingVacant!2697 (index!12967 (_ BitVec 32))) )
))
(declare-fun lt!152888 () SeekEntryResult!2697)

(declare-fun lt!152889 () SeekEntryResult!2697)

(assert (=> b!312257 (= lt!152888 lt!152889)))

(declare-datatypes ((array!15950 0))(
  ( (array!15951 (arr!7557 (Array (_ BitVec 32) (_ BitVec 64))) (size!7909 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15950)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((Unit!9625 0))(
  ( (Unit!9626) )
))
(declare-fun lt!152887 () Unit!9625)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!152885 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15950 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9625)

(assert (=> b!312257 (= lt!152887 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k0!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!152885 resIndex!52 resX!52 mask!3709))))

(declare-fun b!312258 () Bool)

(declare-fun res!168714 () Bool)

(declare-fun e!194730 () Bool)

(assert (=> b!312258 (=> (not res!168714) (not e!194730))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15950 (_ BitVec 32)) SeekEntryResult!2697)

(assert (=> b!312258 (= res!168714 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2697 i!1240)))))

(declare-fun b!312259 () Bool)

(declare-fun res!168712 () Bool)

(declare-fun e!194729 () Bool)

(assert (=> b!312259 (=> (not res!168712) (not e!194729))))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!312259 (= res!168712 (and (= (select (arr!7557 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7909 a!3293))))))

(declare-fun b!312260 () Bool)

(declare-fun res!168717 () Bool)

(assert (=> b!312260 (=> (not res!168717) (not e!194730))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312260 (= res!168717 (validKeyInArray!0 k0!2441))))

(declare-fun b!312261 () Bool)

(declare-fun res!168713 () Bool)

(assert (=> b!312261 (=> (not res!168713) (not e!194730))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15950 (_ BitVec 32)) Bool)

(assert (=> b!312261 (= res!168713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!312263 () Bool)

(assert (=> b!312263 (= e!194730 e!194729)))

(declare-fun res!168716 () Bool)

(assert (=> b!312263 (=> (not res!168716) (not e!194729))))

(declare-fun lt!152886 () SeekEntryResult!2697)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15950 (_ BitVec 32)) SeekEntryResult!2697)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312263 (= res!168716 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152886))))

(assert (=> b!312263 (= lt!152886 (Intermediate!2697 false resIndex!52 resX!52))))

(declare-fun b!312264 () Bool)

(declare-fun res!168715 () Bool)

(assert (=> b!312264 (=> (not res!168715) (not e!194730))))

(assert (=> b!312264 (= res!168715 (and (= (size!7909 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7909 a!3293))))))

(declare-fun b!312265 () Bool)

(declare-fun e!194727 () Bool)

(assert (=> b!312265 (= e!194727 (not e!194731))))

(declare-fun res!168711 () Bool)

(assert (=> b!312265 (=> res!168711 e!194731)))

(assert (=> b!312265 (= res!168711 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!152885 #b00000000000000000000000000000000) (bvsge lt!152885 (size!7909 a!3293)) (not (= lt!152889 lt!152886))))))

(declare-fun lt!152884 () SeekEntryResult!2697)

(assert (=> b!312265 (= lt!152884 lt!152888)))

(declare-fun lt!152883 () array!15950)

(assert (=> b!312265 (= lt!152888 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152885 k0!2441 lt!152883 mask!3709))))

(assert (=> b!312265 (= lt!152884 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152883 mask!3709))))

(assert (=> b!312265 (= lt!152883 (array!15951 (store (arr!7557 a!3293) i!1240 k0!2441) (size!7909 a!3293)))))

(declare-fun lt!152882 () SeekEntryResult!2697)

(assert (=> b!312265 (= lt!152882 lt!152889)))

(assert (=> b!312265 (= lt!152889 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152885 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312265 (= lt!152885 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!312266 () Bool)

(assert (=> b!312266 (= e!194729 e!194727)))

(declare-fun res!168719 () Bool)

(assert (=> b!312266 (=> (not res!168719) (not e!194727))))

(assert (=> b!312266 (= res!168719 (and (= lt!152882 lt!152886) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7557 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!312266 (= lt!152882 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!312262 () Bool)

(declare-fun res!168718 () Bool)

(assert (=> b!312262 (=> (not res!168718) (not e!194730))))

(declare-fun arrayContainsKey!0 (array!15950 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312262 (= res!168718 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!168720 () Bool)

(assert (=> start!31048 (=> (not res!168720) (not e!194730))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31048 (= res!168720 (validMask!0 mask!3709))))

(assert (=> start!31048 e!194730))

(declare-fun array_inv!5520 (array!15950) Bool)

(assert (=> start!31048 (array_inv!5520 a!3293)))

(assert (=> start!31048 true))

(assert (= (and start!31048 res!168720) b!312264))

(assert (= (and b!312264 res!168715) b!312260))

(assert (= (and b!312260 res!168717) b!312262))

(assert (= (and b!312262 res!168718) b!312258))

(assert (= (and b!312258 res!168714) b!312261))

(assert (= (and b!312261 res!168713) b!312263))

(assert (= (and b!312263 res!168716) b!312259))

(assert (= (and b!312259 res!168712) b!312266))

(assert (= (and b!312266 res!168719) b!312265))

(assert (= (and b!312265 (not res!168711)) b!312257))

(declare-fun m!322317 () Bool)

(assert (=> b!312266 m!322317))

(declare-fun m!322319 () Bool)

(assert (=> b!312266 m!322319))

(declare-fun m!322321 () Bool)

(assert (=> b!312263 m!322321))

(assert (=> b!312263 m!322321))

(declare-fun m!322323 () Bool)

(assert (=> b!312263 m!322323))

(declare-fun m!322325 () Bool)

(assert (=> start!31048 m!322325))

(declare-fun m!322327 () Bool)

(assert (=> start!31048 m!322327))

(declare-fun m!322329 () Bool)

(assert (=> b!312261 m!322329))

(declare-fun m!322331 () Bool)

(assert (=> b!312257 m!322331))

(declare-fun m!322333 () Bool)

(assert (=> b!312258 m!322333))

(declare-fun m!322335 () Bool)

(assert (=> b!312265 m!322335))

(declare-fun m!322337 () Bool)

(assert (=> b!312265 m!322337))

(declare-fun m!322339 () Bool)

(assert (=> b!312265 m!322339))

(declare-fun m!322341 () Bool)

(assert (=> b!312265 m!322341))

(declare-fun m!322343 () Bool)

(assert (=> b!312265 m!322343))

(declare-fun m!322345 () Bool)

(assert (=> b!312259 m!322345))

(declare-fun m!322347 () Bool)

(assert (=> b!312262 m!322347))

(declare-fun m!322349 () Bool)

(assert (=> b!312260 m!322349))

(check-sat (not b!312266) (not b!312262) (not b!312260) (not b!312258) (not start!31048) (not b!312261) (not b!312257) (not b!312265) (not b!312263))
(check-sat)
