; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30978 () Bool)

(assert start!30978)

(declare-fun b!311364 () Bool)

(declare-fun res!167877 () Bool)

(declare-fun e!194275 () Bool)

(assert (=> b!311364 (=> (not res!167877) (not e!194275))))

(declare-datatypes ((array!15893 0))(
  ( (array!15894 (arr!7528 (Array (_ BitVec 32) (_ BitVec 64))) (size!7880 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15893)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!311364 (= res!167877 (and (= (select (arr!7528 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7880 a!3293))))))

(declare-fun b!311365 () Bool)

(declare-fun res!167871 () Bool)

(declare-fun e!194277 () Bool)

(assert (=> b!311365 (=> (not res!167871) (not e!194277))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2633 0))(
  ( (MissingZero!2633 (index!12708 (_ BitVec 32))) (Found!2633 (index!12709 (_ BitVec 32))) (Intermediate!2633 (undefined!3445 Bool) (index!12710 (_ BitVec 32)) (x!31035 (_ BitVec 32))) (Undefined!2633) (MissingVacant!2633 (index!12711 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15893 (_ BitVec 32)) SeekEntryResult!2633)

(assert (=> b!311365 (= res!167871 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2633 i!1240)))))

(declare-fun b!311366 () Bool)

(declare-fun res!167872 () Bool)

(assert (=> b!311366 (=> (not res!167872) (not e!194277))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15893 (_ BitVec 32)) Bool)

(assert (=> b!311366 (= res!167872 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311367 () Bool)

(declare-fun res!167873 () Bool)

(assert (=> b!311367 (=> (not res!167873) (not e!194277))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311367 (= res!167873 (validKeyInArray!0 k0!2441))))

(declare-fun lt!152364 () (_ BitVec 32))

(declare-fun lt!152365 () array!15893)

(declare-fun e!194276 () Bool)

(declare-fun b!311368 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15893 (_ BitVec 32)) SeekEntryResult!2633)

(assert (=> b!311368 (= e!194276 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152365 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152364 k0!2441 lt!152365 mask!3709)))))

(assert (=> b!311368 (= lt!152365 (array!15894 (store (arr!7528 a!3293) i!1240 k0!2441) (size!7880 a!3293)))))

(declare-fun b!311369 () Bool)

(declare-fun e!194274 () Bool)

(assert (=> b!311369 (= e!194275 e!194274)))

(declare-fun res!167876 () Bool)

(assert (=> b!311369 (=> (not res!167876) (not e!194274))))

(declare-fun lt!152367 () SeekEntryResult!2633)

(declare-fun lt!152366 () SeekEntryResult!2633)

(assert (=> b!311369 (= res!167876 (and (= lt!152366 lt!152367) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7528 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311369 (= lt!152366 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!311370 () Bool)

(assert (=> b!311370 (= e!194274 (not true))))

(assert (=> b!311370 e!194276))

(declare-fun res!167874 () Bool)

(assert (=> b!311370 (=> (not res!167874) (not e!194276))))

(assert (=> b!311370 (= res!167874 (= lt!152366 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152364 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311370 (= lt!152364 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!311371 () Bool)

(assert (=> b!311371 (= e!194277 e!194275)))

(declare-fun res!167868 () Bool)

(assert (=> b!311371 (=> (not res!167868) (not e!194275))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311371 (= res!167868 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152367))))

(assert (=> b!311371 (= lt!152367 (Intermediate!2633 false resIndex!52 resX!52))))

(declare-fun res!167869 () Bool)

(assert (=> start!30978 (=> (not res!167869) (not e!194277))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30978 (= res!167869 (validMask!0 mask!3709))))

(assert (=> start!30978 e!194277))

(declare-fun array_inv!5478 (array!15893) Bool)

(assert (=> start!30978 (array_inv!5478 a!3293)))

(assert (=> start!30978 true))

(declare-fun b!311372 () Bool)

(declare-fun res!167875 () Bool)

(assert (=> b!311372 (=> (not res!167875) (not e!194277))))

(assert (=> b!311372 (= res!167875 (and (= (size!7880 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7880 a!3293))))))

(declare-fun b!311373 () Bool)

(declare-fun res!167870 () Bool)

(assert (=> b!311373 (=> (not res!167870) (not e!194277))))

(declare-fun arrayContainsKey!0 (array!15893 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311373 (= res!167870 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30978 res!167869) b!311372))

(assert (= (and b!311372 res!167875) b!311367))

(assert (= (and b!311367 res!167873) b!311373))

(assert (= (and b!311373 res!167870) b!311365))

(assert (= (and b!311365 res!167871) b!311366))

(assert (= (and b!311366 res!167872) b!311371))

(assert (= (and b!311371 res!167868) b!311364))

(assert (= (and b!311364 res!167877) b!311369))

(assert (= (and b!311369 res!167876) b!311370))

(assert (= (and b!311370 res!167874) b!311368))

(declare-fun m!321523 () Bool)

(assert (=> b!311364 m!321523))

(declare-fun m!321525 () Bool)

(assert (=> b!311367 m!321525))

(declare-fun m!321527 () Bool)

(assert (=> b!311371 m!321527))

(assert (=> b!311371 m!321527))

(declare-fun m!321529 () Bool)

(assert (=> b!311371 m!321529))

(declare-fun m!321531 () Bool)

(assert (=> start!30978 m!321531))

(declare-fun m!321533 () Bool)

(assert (=> start!30978 m!321533))

(declare-fun m!321535 () Bool)

(assert (=> b!311368 m!321535))

(declare-fun m!321537 () Bool)

(assert (=> b!311368 m!321537))

(declare-fun m!321539 () Bool)

(assert (=> b!311368 m!321539))

(declare-fun m!321541 () Bool)

(assert (=> b!311366 m!321541))

(declare-fun m!321543 () Bool)

(assert (=> b!311365 m!321543))

(declare-fun m!321545 () Bool)

(assert (=> b!311370 m!321545))

(declare-fun m!321547 () Bool)

(assert (=> b!311370 m!321547))

(declare-fun m!321549 () Bool)

(assert (=> b!311369 m!321549))

(declare-fun m!321551 () Bool)

(assert (=> b!311369 m!321551))

(declare-fun m!321553 () Bool)

(assert (=> b!311373 m!321553))

(check-sat (not start!30978) (not b!311373) (not b!311371) (not b!311365) (not b!311368) (not b!311367) (not b!311366) (not b!311370) (not b!311369))
(check-sat)
