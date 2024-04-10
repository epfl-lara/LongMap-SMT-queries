; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30994 () Bool)

(assert start!30994)

(declare-fun b!311447 () Bool)

(declare-fun res!167903 () Bool)

(declare-fun e!194324 () Bool)

(assert (=> b!311447 (=> (not res!167903) (not e!194324))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311447 (= res!167903 (validKeyInArray!0 k0!2441))))

(declare-fun b!311448 () Bool)

(declare-fun e!194326 () Bool)

(declare-fun e!194325 () Bool)

(assert (=> b!311448 (= e!194326 e!194325)))

(declare-fun res!167905 () Bool)

(assert (=> b!311448 (=> (not res!167905) (not e!194325))))

(declare-datatypes ((SeekEntryResult!2670 0))(
  ( (MissingZero!2670 (index!12856 (_ BitVec 32))) (Found!2670 (index!12857 (_ BitVec 32))) (Intermediate!2670 (undefined!3482 Bool) (index!12858 (_ BitVec 32)) (x!31075 (_ BitVec 32))) (Undefined!2670) (MissingVacant!2670 (index!12859 (_ BitVec 32))) )
))
(declare-fun lt!152361 () SeekEntryResult!2670)

(declare-datatypes ((array!15896 0))(
  ( (array!15897 (arr!7530 (Array (_ BitVec 32) (_ BitVec 64))) (size!7882 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15896)

(declare-fun lt!152358 () SeekEntryResult!2670)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!311448 (= res!167905 (and (= lt!152358 lt!152361) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7530 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15896 (_ BitVec 32)) SeekEntryResult!2670)

(assert (=> b!311448 (= lt!152358 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!311449 () Bool)

(assert (=> b!311449 (= e!194324 e!194326)))

(declare-fun res!167907 () Bool)

(assert (=> b!311449 (=> (not res!167907) (not e!194326))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311449 (= res!167907 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152361))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!311449 (= lt!152361 (Intermediate!2670 false resIndex!52 resX!52))))

(declare-fun b!311450 () Bool)

(declare-fun res!167910 () Bool)

(assert (=> b!311450 (=> (not res!167910) (not e!194326))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!311450 (= res!167910 (and (= (select (arr!7530 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7882 a!3293))))))

(declare-fun b!311451 () Bool)

(assert (=> b!311451 (= e!194325 (not true))))

(declare-fun e!194322 () Bool)

(assert (=> b!311451 e!194322))

(declare-fun res!167901 () Bool)

(assert (=> b!311451 (=> (not res!167901) (not e!194322))))

(declare-fun lt!152360 () (_ BitVec 32))

(assert (=> b!311451 (= res!167901 (= lt!152358 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152360 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311451 (= lt!152360 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!311452 () Bool)

(declare-fun res!167908 () Bool)

(assert (=> b!311452 (=> (not res!167908) (not e!194324))))

(assert (=> b!311452 (= res!167908 (and (= (size!7882 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7882 a!3293))))))

(declare-fun res!167902 () Bool)

(assert (=> start!30994 (=> (not res!167902) (not e!194324))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30994 (= res!167902 (validMask!0 mask!3709))))

(assert (=> start!30994 e!194324))

(declare-fun array_inv!5493 (array!15896) Bool)

(assert (=> start!30994 (array_inv!5493 a!3293)))

(assert (=> start!30994 true))

(declare-fun b!311453 () Bool)

(declare-fun lt!152359 () array!15896)

(assert (=> b!311453 (= e!194322 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152359 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152360 k0!2441 lt!152359 mask!3709)))))

(assert (=> b!311453 (= lt!152359 (array!15897 (store (arr!7530 a!3293) i!1240 k0!2441) (size!7882 a!3293)))))

(declare-fun b!311454 () Bool)

(declare-fun res!167909 () Bool)

(assert (=> b!311454 (=> (not res!167909) (not e!194324))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15896 (_ BitVec 32)) Bool)

(assert (=> b!311454 (= res!167909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311455 () Bool)

(declare-fun res!167906 () Bool)

(assert (=> b!311455 (=> (not res!167906) (not e!194324))))

(declare-fun arrayContainsKey!0 (array!15896 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311455 (= res!167906 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311456 () Bool)

(declare-fun res!167904 () Bool)

(assert (=> b!311456 (=> (not res!167904) (not e!194324))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15896 (_ BitVec 32)) SeekEntryResult!2670)

(assert (=> b!311456 (= res!167904 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2670 i!1240)))))

(assert (= (and start!30994 res!167902) b!311452))

(assert (= (and b!311452 res!167908) b!311447))

(assert (= (and b!311447 res!167903) b!311455))

(assert (= (and b!311455 res!167906) b!311456))

(assert (= (and b!311456 res!167904) b!311454))

(assert (= (and b!311454 res!167909) b!311449))

(assert (= (and b!311449 res!167907) b!311450))

(assert (= (and b!311450 res!167910) b!311448))

(assert (= (and b!311448 res!167905) b!311451))

(assert (= (and b!311451 res!167901) b!311453))

(declare-fun m!321421 () Bool)

(assert (=> b!311447 m!321421))

(declare-fun m!321423 () Bool)

(assert (=> b!311453 m!321423))

(declare-fun m!321425 () Bool)

(assert (=> b!311453 m!321425))

(declare-fun m!321427 () Bool)

(assert (=> b!311453 m!321427))

(declare-fun m!321429 () Bool)

(assert (=> b!311448 m!321429))

(declare-fun m!321431 () Bool)

(assert (=> b!311448 m!321431))

(declare-fun m!321433 () Bool)

(assert (=> b!311449 m!321433))

(assert (=> b!311449 m!321433))

(declare-fun m!321435 () Bool)

(assert (=> b!311449 m!321435))

(declare-fun m!321437 () Bool)

(assert (=> b!311454 m!321437))

(declare-fun m!321439 () Bool)

(assert (=> b!311450 m!321439))

(declare-fun m!321441 () Bool)

(assert (=> b!311456 m!321441))

(declare-fun m!321443 () Bool)

(assert (=> b!311451 m!321443))

(declare-fun m!321445 () Bool)

(assert (=> b!311451 m!321445))

(declare-fun m!321447 () Bool)

(assert (=> start!30994 m!321447))

(declare-fun m!321449 () Bool)

(assert (=> start!30994 m!321449))

(declare-fun m!321451 () Bool)

(assert (=> b!311455 m!321451))

(check-sat (not b!311449) (not b!311448) (not b!311447) (not start!30994) (not b!311456) (not b!311454) (not b!311451) (not b!311455) (not b!311453))
(check-sat)
