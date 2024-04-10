; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32258 () Bool)

(assert start!32258)

(declare-fun b!321333 () Bool)

(declare-fun res!175454 () Bool)

(declare-fun e!199140 () Bool)

(assert (=> b!321333 (=> (not res!175454) (not e!199140))))

(declare-datatypes ((array!16448 0))(
  ( (array!16449 (arr!7783 (Array (_ BitVec 32) (_ BitVec 64))) (size!8135 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16448)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!321333 (= res!175454 (and (= (select (arr!7783 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8135 a!3305))))))

(declare-fun b!321334 () Bool)

(declare-fun res!175455 () Bool)

(declare-fun e!199141 () Bool)

(assert (=> b!321334 (=> (not res!175455) (not e!199141))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16448 (_ BitVec 32)) Bool)

(assert (=> b!321334 (= res!175455 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!321335 () Bool)

(declare-fun res!175458 () Bool)

(assert (=> b!321335 (=> (not res!175458) (not e!199141))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321335 (= res!175458 (validKeyInArray!0 k!2497))))

(declare-fun b!321336 () Bool)

(assert (=> b!321336 (= e!199140 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7783 a!3305) index!1840) k!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7783 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7783 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3777 #b00000000000000000000000000000000)))))

(declare-fun b!321337 () Bool)

(declare-fun res!175457 () Bool)

(assert (=> b!321337 (=> (not res!175457) (not e!199141))))

(declare-fun arrayContainsKey!0 (array!16448 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321337 (= res!175457 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!321338 () Bool)

(assert (=> b!321338 (= e!199141 e!199140)))

(declare-fun res!175459 () Bool)

(assert (=> b!321338 (=> (not res!175459) (not e!199140))))

(declare-datatypes ((SeekEntryResult!2914 0))(
  ( (MissingZero!2914 (index!13832 (_ BitVec 32))) (Found!2914 (index!13833 (_ BitVec 32))) (Intermediate!2914 (undefined!3726 Bool) (index!13834 (_ BitVec 32)) (x!32093 (_ BitVec 32))) (Undefined!2914) (MissingVacant!2914 (index!13835 (_ BitVec 32))) )
))
(declare-fun lt!156183 () SeekEntryResult!2914)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16448 (_ BitVec 32)) SeekEntryResult!2914)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321338 (= res!175459 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156183))))

(assert (=> b!321338 (= lt!156183 (Intermediate!2914 false resIndex!58 resX!58))))

(declare-fun b!321339 () Bool)

(declare-fun res!175460 () Bool)

(assert (=> b!321339 (=> (not res!175460) (not e!199141))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16448 (_ BitVec 32)) SeekEntryResult!2914)

(assert (=> b!321339 (= res!175460 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2914 i!1250)))))

(declare-fun res!175456 () Bool)

(assert (=> start!32258 (=> (not res!175456) (not e!199141))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32258 (= res!175456 (validMask!0 mask!3777))))

(assert (=> start!32258 e!199141))

(declare-fun array_inv!5746 (array!16448) Bool)

(assert (=> start!32258 (array_inv!5746 a!3305)))

(assert (=> start!32258 true))

(declare-fun b!321340 () Bool)

(declare-fun res!175453 () Bool)

(assert (=> b!321340 (=> (not res!175453) (not e!199140))))

(assert (=> b!321340 (= res!175453 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156183))))

(declare-fun b!321341 () Bool)

(declare-fun res!175461 () Bool)

(assert (=> b!321341 (=> (not res!175461) (not e!199141))))

(assert (=> b!321341 (= res!175461 (and (= (size!8135 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8135 a!3305))))))

(assert (= (and start!32258 res!175456) b!321341))

(assert (= (and b!321341 res!175461) b!321335))

(assert (= (and b!321335 res!175458) b!321337))

(assert (= (and b!321337 res!175457) b!321339))

(assert (= (and b!321339 res!175460) b!321334))

(assert (= (and b!321334 res!175455) b!321338))

(assert (= (and b!321338 res!175459) b!321333))

(assert (= (and b!321333 res!175454) b!321340))

(assert (= (and b!321340 res!175453) b!321336))

(declare-fun m!329497 () Bool)

(assert (=> b!321338 m!329497))

(assert (=> b!321338 m!329497))

(declare-fun m!329499 () Bool)

(assert (=> b!321338 m!329499))

(declare-fun m!329501 () Bool)

(assert (=> b!321337 m!329501))

(declare-fun m!329503 () Bool)

(assert (=> b!321334 m!329503))

(declare-fun m!329505 () Bool)

(assert (=> b!321335 m!329505))

(declare-fun m!329507 () Bool)

(assert (=> b!321333 m!329507))

(declare-fun m!329509 () Bool)

(assert (=> start!32258 m!329509))

(declare-fun m!329511 () Bool)

(assert (=> start!32258 m!329511))

(declare-fun m!329513 () Bool)

(assert (=> b!321336 m!329513))

(declare-fun m!329515 () Bool)

(assert (=> b!321340 m!329515))

(declare-fun m!329517 () Bool)

(assert (=> b!321339 m!329517))

(push 1)

(assert (not b!321337))

(assert (not b!321339))

(assert (not b!321338))

(assert (not b!321334))

(assert (not b!321340))

(assert (not start!32258))

(assert (not b!321335))

(check-sat)

(pop 1)

(push 1)

(check-sat)

