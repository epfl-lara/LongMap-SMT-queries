; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32260 () Bool)

(assert start!32260)

(declare-fun b!321360 () Bool)

(declare-fun res!175484 () Bool)

(declare-fun e!199150 () Bool)

(assert (=> b!321360 (=> (not res!175484) (not e!199150))))

(declare-datatypes ((array!16450 0))(
  ( (array!16451 (arr!7784 (Array (_ BitVec 32) (_ BitVec 64))) (size!8136 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16450)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!321360 (= res!175484 (and (= (size!8136 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8136 a!3305))))))

(declare-fun b!321361 () Bool)

(declare-fun res!175488 () Bool)

(assert (=> b!321361 (=> (not res!175488) (not e!199150))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16450 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321361 (= res!175488 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!321362 () Bool)

(declare-fun res!175485 () Bool)

(assert (=> b!321362 (=> (not res!175485) (not e!199150))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16450 (_ BitVec 32)) Bool)

(assert (=> b!321362 (= res!175485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!321363 () Bool)

(declare-fun res!175481 () Bool)

(assert (=> b!321363 (=> (not res!175481) (not e!199150))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321363 (= res!175481 (validKeyInArray!0 k!2497))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun b!321364 () Bool)

(declare-fun e!199149 () Bool)

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!321364 (= e!199149 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7784 a!3305) index!1840) k!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7784 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7784 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3777 #b00000000000000000000000000000000) (bvsge index!1840 (bvadd #b00000000000000000000000000000001 mask!3777))))))

(declare-fun b!321365 () Bool)

(declare-fun res!175486 () Bool)

(assert (=> b!321365 (=> (not res!175486) (not e!199150))))

(declare-datatypes ((SeekEntryResult!2915 0))(
  ( (MissingZero!2915 (index!13836 (_ BitVec 32))) (Found!2915 (index!13837 (_ BitVec 32))) (Intermediate!2915 (undefined!3727 Bool) (index!13838 (_ BitVec 32)) (x!32102 (_ BitVec 32))) (Undefined!2915) (MissingVacant!2915 (index!13839 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16450 (_ BitVec 32)) SeekEntryResult!2915)

(assert (=> b!321365 (= res!175486 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2915 i!1250)))))

(declare-fun b!321366 () Bool)

(declare-fun res!175482 () Bool)

(assert (=> b!321366 (=> (not res!175482) (not e!199149))))

(assert (=> b!321366 (= res!175482 (and (= (select (arr!7784 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8136 a!3305))))))

(declare-fun res!175483 () Bool)

(assert (=> start!32260 (=> (not res!175483) (not e!199150))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32260 (= res!175483 (validMask!0 mask!3777))))

(assert (=> start!32260 e!199150))

(declare-fun array_inv!5747 (array!16450) Bool)

(assert (=> start!32260 (array_inv!5747 a!3305)))

(assert (=> start!32260 true))

(declare-fun b!321367 () Bool)

(assert (=> b!321367 (= e!199150 e!199149)))

(declare-fun res!175480 () Bool)

(assert (=> b!321367 (=> (not res!175480) (not e!199149))))

(declare-fun lt!156186 () SeekEntryResult!2915)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16450 (_ BitVec 32)) SeekEntryResult!2915)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321367 (= res!175480 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156186))))

(assert (=> b!321367 (= lt!156186 (Intermediate!2915 false resIndex!58 resX!58))))

(declare-fun b!321368 () Bool)

(declare-fun res!175487 () Bool)

(assert (=> b!321368 (=> (not res!175487) (not e!199149))))

(assert (=> b!321368 (= res!175487 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156186))))

(assert (= (and start!32260 res!175483) b!321360))

(assert (= (and b!321360 res!175484) b!321363))

(assert (= (and b!321363 res!175481) b!321361))

(assert (= (and b!321361 res!175488) b!321365))

(assert (= (and b!321365 res!175486) b!321362))

(assert (= (and b!321362 res!175485) b!321367))

(assert (= (and b!321367 res!175480) b!321366))

(assert (= (and b!321366 res!175482) b!321368))

(assert (= (and b!321368 res!175487) b!321364))

(declare-fun m!329519 () Bool)

(assert (=> start!32260 m!329519))

(declare-fun m!329521 () Bool)

(assert (=> start!32260 m!329521))

(declare-fun m!329523 () Bool)

(assert (=> b!321367 m!329523))

(assert (=> b!321367 m!329523))

(declare-fun m!329525 () Bool)

(assert (=> b!321367 m!329525))

(declare-fun m!329527 () Bool)

(assert (=> b!321368 m!329527))

(declare-fun m!329529 () Bool)

(assert (=> b!321363 m!329529))

(declare-fun m!329531 () Bool)

(assert (=> b!321365 m!329531))

(declare-fun m!329533 () Bool)

(assert (=> b!321366 m!329533))

(declare-fun m!329535 () Bool)

(assert (=> b!321361 m!329535))

(declare-fun m!329537 () Bool)

(assert (=> b!321364 m!329537))

(declare-fun m!329539 () Bool)

(assert (=> b!321362 m!329539))

(push 1)

(assert (not b!321367))

(assert (not b!321363))

(assert (not b!321361))

(assert (not b!321362))

(assert (not b!321368))

(assert (not start!32260))

(assert (not b!321365))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

