; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30574 () Bool)

(assert start!30574)

(declare-fun res!163332 () Bool)

(declare-fun e!192173 () Bool)

(assert (=> start!30574 (=> (not res!163332) (not e!192173))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30574 (= res!163332 (validMask!0 mask!3709))))

(assert (=> start!30574 e!192173))

(declare-datatypes ((array!15578 0))(
  ( (array!15579 (arr!7374 (Array (_ BitVec 32) (_ BitVec 64))) (size!7726 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15578)

(declare-fun array_inv!5337 (array!15578) Bool)

(assert (=> start!30574 (array_inv!5337 a!3293)))

(assert (=> start!30574 true))

(declare-fun b!306418 () Bool)

(declare-fun res!163340 () Bool)

(declare-fun e!192171 () Bool)

(assert (=> b!306418 (=> (not res!163340) (not e!192171))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!306418 (= res!163340 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7374 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun b!306419 () Bool)

(declare-fun res!163338 () Bool)

(assert (=> b!306419 (=> (not res!163338) (not e!192173))))

(declare-fun arrayContainsKey!0 (array!15578 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!306419 (= res!163338 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!306420 () Bool)

(declare-fun res!163341 () Bool)

(assert (=> b!306420 (=> (not res!163341) (not e!192173))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2514 0))(
  ( (MissingZero!2514 (index!12232 (_ BitVec 32))) (Found!2514 (index!12233 (_ BitVec 32))) (Intermediate!2514 (undefined!3326 Bool) (index!12234 (_ BitVec 32)) (x!30485 (_ BitVec 32))) (Undefined!2514) (MissingVacant!2514 (index!12235 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15578 (_ BitVec 32)) SeekEntryResult!2514)

(assert (=> b!306420 (= res!163341 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2514 i!1240)))))

(declare-fun b!306421 () Bool)

(declare-fun res!163336 () Bool)

(assert (=> b!306421 (=> (not res!163336) (not e!192173))))

(assert (=> b!306421 (= res!163336 (and (= (size!7726 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7726 a!3293))))))

(declare-fun b!306422 () Bool)

(declare-fun res!163335 () Bool)

(assert (=> b!306422 (=> (not res!163335) (not e!192173))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15578 (_ BitVec 32)) Bool)

(assert (=> b!306422 (= res!163335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!306423 () Bool)

(assert (=> b!306423 (= e!192173 e!192171)))

(declare-fun res!163333 () Bool)

(assert (=> b!306423 (=> (not res!163333) (not e!192171))))

(declare-fun lt!150958 () SeekEntryResult!2514)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15578 (_ BitVec 32)) SeekEntryResult!2514)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306423 (= res!163333 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150958))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!306423 (= lt!150958 (Intermediate!2514 false resIndex!52 resX!52))))

(declare-fun b!306424 () Bool)

(declare-fun res!163334 () Bool)

(assert (=> b!306424 (=> (not res!163334) (not e!192171))))

(assert (=> b!306424 (= res!163334 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150958))))

(declare-fun b!306425 () Bool)

(declare-fun res!163339 () Bool)

(assert (=> b!306425 (=> (not res!163339) (not e!192173))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!306425 (= res!163339 (validKeyInArray!0 k0!2441))))

(declare-fun b!306426 () Bool)

(declare-fun res!163337 () Bool)

(assert (=> b!306426 (=> (not res!163337) (not e!192171))))

(assert (=> b!306426 (= res!163337 (and (= (select (arr!7374 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7726 a!3293))))))

(declare-fun b!306427 () Bool)

(assert (=> b!306427 (= e!192171 (not (or (not (= (select (arr!7374 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3709 #b00000000000000000000000000000000))))))

(assert (=> b!306427 (= index!1781 resIndex!52)))

(declare-datatypes ((Unit!9511 0))(
  ( (Unit!9512) )
))
(declare-fun lt!150960 () Unit!9511)

(declare-fun e!192172 () Unit!9511)

(assert (=> b!306427 (= lt!150960 e!192172)))

(declare-fun c!49146 () Bool)

(assert (=> b!306427 (= c!49146 (not (= resIndex!52 index!1781)))))

(declare-fun b!306428 () Bool)

(assert (=> b!306428 false))

(declare-fun e!192174 () Unit!9511)

(declare-fun Unit!9513 () Unit!9511)

(assert (=> b!306428 (= e!192174 Unit!9513)))

(declare-fun b!306429 () Bool)

(declare-fun Unit!9514 () Unit!9511)

(assert (=> b!306429 (= e!192172 Unit!9514)))

(declare-fun b!306430 () Bool)

(assert (=> b!306430 (= e!192172 e!192174)))

(declare-fun c!49145 () Bool)

(assert (=> b!306430 (= c!49145 (or (= (select (arr!7374 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7374 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!306431 () Bool)

(assert (=> b!306431 false))

(declare-fun lt!150959 () SeekEntryResult!2514)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306431 (= lt!150959 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun Unit!9515 () Unit!9511)

(assert (=> b!306431 (= e!192174 Unit!9515)))

(assert (= (and start!30574 res!163332) b!306421))

(assert (= (and b!306421 res!163336) b!306425))

(assert (= (and b!306425 res!163339) b!306419))

(assert (= (and b!306419 res!163338) b!306420))

(assert (= (and b!306420 res!163341) b!306422))

(assert (= (and b!306422 res!163335) b!306423))

(assert (= (and b!306423 res!163333) b!306426))

(assert (= (and b!306426 res!163337) b!306424))

(assert (= (and b!306424 res!163334) b!306418))

(assert (= (and b!306418 res!163340) b!306427))

(assert (= (and b!306427 c!49146) b!306430))

(assert (= (and b!306427 (not c!49146)) b!306429))

(assert (= (and b!306430 c!49145) b!306428))

(assert (= (and b!306430 (not c!49145)) b!306431))

(declare-fun m!317017 () Bool)

(assert (=> b!306418 m!317017))

(declare-fun m!317019 () Bool)

(assert (=> b!306425 m!317019))

(declare-fun m!317021 () Bool)

(assert (=> b!306419 m!317021))

(declare-fun m!317023 () Bool)

(assert (=> b!306431 m!317023))

(assert (=> b!306431 m!317023))

(declare-fun m!317025 () Bool)

(assert (=> b!306431 m!317025))

(assert (=> b!306427 m!317017))

(declare-fun m!317027 () Bool)

(assert (=> b!306426 m!317027))

(declare-fun m!317029 () Bool)

(assert (=> b!306424 m!317029))

(assert (=> b!306430 m!317017))

(declare-fun m!317031 () Bool)

(assert (=> b!306422 m!317031))

(declare-fun m!317033 () Bool)

(assert (=> start!30574 m!317033))

(declare-fun m!317035 () Bool)

(assert (=> start!30574 m!317035))

(declare-fun m!317037 () Bool)

(assert (=> b!306423 m!317037))

(assert (=> b!306423 m!317037))

(declare-fun m!317039 () Bool)

(assert (=> b!306423 m!317039))

(declare-fun m!317041 () Bool)

(assert (=> b!306420 m!317041))

(check-sat (not b!306419) (not b!306423) (not b!306420) (not start!30574) (not b!306431) (not b!306422) (not b!306424) (not b!306425))
(check-sat)
