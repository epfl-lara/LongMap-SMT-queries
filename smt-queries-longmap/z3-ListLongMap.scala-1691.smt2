; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31020 () Bool)

(assert start!31020)

(declare-fun b!311772 () Bool)

(declare-fun res!168379 () Bool)

(declare-fun e!194450 () Bool)

(assert (=> b!311772 (=> (not res!168379) (not e!194450))))

(declare-datatypes ((array!15926 0))(
  ( (array!15927 (arr!7545 (Array (_ BitVec 32) (_ BitVec 64))) (size!7898 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15926)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!311772 (= res!168379 (and (= (select (arr!7545 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7898 a!3293))))))

(declare-fun b!311773 () Bool)

(declare-fun e!194449 () Bool)

(assert (=> b!311773 (= e!194449 e!194450)))

(declare-fun res!168373 () Bool)

(assert (=> b!311773 (=> (not res!168373) (not e!194450))))

(declare-datatypes ((SeekEntryResult!2684 0))(
  ( (MissingZero!2684 (index!12912 (_ BitVec 32))) (Found!2684 (index!12913 (_ BitVec 32))) (Intermediate!2684 (undefined!3496 Bool) (index!12914 (_ BitVec 32)) (x!31140 (_ BitVec 32))) (Undefined!2684) (MissingVacant!2684 (index!12915 (_ BitVec 32))) )
))
(declare-fun lt!152480 () SeekEntryResult!2684)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15926 (_ BitVec 32)) SeekEntryResult!2684)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311773 (= res!168373 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152480))))

(assert (=> b!311773 (= lt!152480 (Intermediate!2684 false resIndex!52 resX!52))))

(declare-fun b!311774 () Bool)

(declare-fun res!168372 () Bool)

(assert (=> b!311774 (=> (not res!168372) (not e!194449))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15926 (_ BitVec 32)) SeekEntryResult!2684)

(assert (=> b!311774 (= res!168372 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2684 i!1240)))))

(declare-fun b!311775 () Bool)

(declare-fun res!168378 () Bool)

(assert (=> b!311775 (=> (not res!168378) (not e!194449))))

(assert (=> b!311775 (= res!168378 (and (= (size!7898 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7898 a!3293))))))

(declare-fun b!311776 () Bool)

(declare-fun e!194446 () Bool)

(declare-fun e!194447 () Bool)

(assert (=> b!311776 (= e!194446 (not e!194447))))

(declare-fun res!168376 () Bool)

(assert (=> b!311776 (=> res!168376 e!194447)))

(declare-fun lt!152483 () (_ BitVec 32))

(declare-fun lt!152482 () SeekEntryResult!2684)

(assert (=> b!311776 (= res!168376 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!152483 #b00000000000000000000000000000000) (bvsge lt!152483 (size!7898 a!3293)) (not (= lt!152482 lt!152480))))))

(declare-fun lt!152479 () SeekEntryResult!2684)

(declare-fun lt!152484 () SeekEntryResult!2684)

(assert (=> b!311776 (= lt!152479 lt!152484)))

(declare-fun lt!152486 () array!15926)

(assert (=> b!311776 (= lt!152484 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152483 k0!2441 lt!152486 mask!3709))))

(assert (=> b!311776 (= lt!152479 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152486 mask!3709))))

(assert (=> b!311776 (= lt!152486 (array!15927 (store (arr!7545 a!3293) i!1240 k0!2441) (size!7898 a!3293)))))

(declare-fun lt!152481 () SeekEntryResult!2684)

(assert (=> b!311776 (= lt!152481 lt!152482)))

(assert (=> b!311776 (= lt!152482 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152483 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311776 (= lt!152483 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!311777 () Bool)

(declare-fun res!168377 () Bool)

(assert (=> b!311777 (=> (not res!168377) (not e!194449))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15926 (_ BitVec 32)) Bool)

(assert (=> b!311777 (= res!168377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311778 () Bool)

(assert (=> b!311778 (= e!194447 (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709))))))

(assert (=> b!311778 (= lt!152484 lt!152482)))

(declare-datatypes ((Unit!9571 0))(
  ( (Unit!9572) )
))
(declare-fun lt!152485 () Unit!9571)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15926 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9571)

(assert (=> b!311778 (= lt!152485 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k0!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!152483 resIndex!52 resX!52 mask!3709))))

(declare-fun b!311780 () Bool)

(assert (=> b!311780 (= e!194450 e!194446)))

(declare-fun res!168381 () Bool)

(assert (=> b!311780 (=> (not res!168381) (not e!194446))))

(assert (=> b!311780 (= res!168381 (and (= lt!152481 lt!152480) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7545 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311780 (= lt!152481 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!311781 () Bool)

(declare-fun res!168374 () Bool)

(assert (=> b!311781 (=> (not res!168374) (not e!194449))))

(declare-fun arrayContainsKey!0 (array!15926 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311781 (= res!168374 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311779 () Bool)

(declare-fun res!168380 () Bool)

(assert (=> b!311779 (=> (not res!168380) (not e!194449))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311779 (= res!168380 (validKeyInArray!0 k0!2441))))

(declare-fun res!168375 () Bool)

(assert (=> start!31020 (=> (not res!168375) (not e!194449))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31020 (= res!168375 (validMask!0 mask!3709))))

(assert (=> start!31020 e!194449))

(declare-fun array_inv!5517 (array!15926) Bool)

(assert (=> start!31020 (array_inv!5517 a!3293)))

(assert (=> start!31020 true))

(assert (= (and start!31020 res!168375) b!311775))

(assert (= (and b!311775 res!168378) b!311779))

(assert (= (and b!311779 res!168380) b!311781))

(assert (= (and b!311781 res!168374) b!311774))

(assert (= (and b!311774 res!168372) b!311777))

(assert (= (and b!311777 res!168377) b!311773))

(assert (= (and b!311773 res!168373) b!311772))

(assert (= (and b!311772 res!168379) b!311780))

(assert (= (and b!311780 res!168381) b!311776))

(assert (= (and b!311776 (not res!168376)) b!311778))

(declare-fun m!321349 () Bool)

(assert (=> b!311780 m!321349))

(declare-fun m!321351 () Bool)

(assert (=> b!311780 m!321351))

(declare-fun m!321353 () Bool)

(assert (=> b!311772 m!321353))

(declare-fun m!321355 () Bool)

(assert (=> b!311774 m!321355))

(declare-fun m!321357 () Bool)

(assert (=> start!31020 m!321357))

(declare-fun m!321359 () Bool)

(assert (=> start!31020 m!321359))

(declare-fun m!321361 () Bool)

(assert (=> b!311777 m!321361))

(declare-fun m!321363 () Bool)

(assert (=> b!311773 m!321363))

(assert (=> b!311773 m!321363))

(declare-fun m!321365 () Bool)

(assert (=> b!311773 m!321365))

(declare-fun m!321367 () Bool)

(assert (=> b!311779 m!321367))

(declare-fun m!321369 () Bool)

(assert (=> b!311778 m!321369))

(declare-fun m!321371 () Bool)

(assert (=> b!311781 m!321371))

(declare-fun m!321373 () Bool)

(assert (=> b!311776 m!321373))

(declare-fun m!321375 () Bool)

(assert (=> b!311776 m!321375))

(declare-fun m!321377 () Bool)

(assert (=> b!311776 m!321377))

(declare-fun m!321379 () Bool)

(assert (=> b!311776 m!321379))

(declare-fun m!321381 () Bool)

(assert (=> b!311776 m!321381))

(check-sat (not b!311774) (not b!311776) (not b!311779) (not b!311781) (not b!311773) (not b!311780) (not b!311778) (not start!31020) (not b!311777))
(check-sat)
