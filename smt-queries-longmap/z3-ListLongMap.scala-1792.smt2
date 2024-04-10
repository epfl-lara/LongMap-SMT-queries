; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32454 () Bool)

(assert start!32454)

(declare-fun b!324267 () Bool)

(declare-fun res!177606 () Bool)

(declare-fun e!200225 () Bool)

(assert (=> b!324267 (=> (not res!177606) (not e!200225))))

(declare-datatypes ((array!16593 0))(
  ( (array!16594 (arr!7854 (Array (_ BitVec 32) (_ BitVec 64))) (size!8206 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16593)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!324267 (= res!177606 (and (= (size!8206 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8206 a!3305))))))

(declare-fun b!324268 () Bool)

(declare-fun res!177599 () Bool)

(assert (=> b!324268 (=> (not res!177599) (not e!200225))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16593 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324268 (= res!177599 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324269 () Bool)

(declare-fun res!177601 () Bool)

(assert (=> b!324269 (=> (not res!177601) (not e!200225))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324269 (= res!177601 (validKeyInArray!0 k0!2497))))

(declare-fun e!200226 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun b!324270 () Bool)

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!324270 (= e!200226 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7854 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58)) (bvsge mask!3777 #b00000000000000000000000000000000) (bvslt index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsgt x!1490 #b01111111111111111111111111111110)))))

(declare-fun b!324271 () Bool)

(declare-fun res!177602 () Bool)

(assert (=> b!324271 (=> (not res!177602) (not e!200226))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!324271 (= res!177602 (and (= (select (arr!7854 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8206 a!3305))))))

(declare-fun res!177603 () Bool)

(assert (=> start!32454 (=> (not res!177603) (not e!200225))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32454 (= res!177603 (validMask!0 mask!3777))))

(assert (=> start!32454 e!200225))

(declare-fun array_inv!5817 (array!16593) Bool)

(assert (=> start!32454 (array_inv!5817 a!3305)))

(assert (=> start!32454 true))

(declare-fun b!324272 () Bool)

(declare-fun res!177600 () Bool)

(assert (=> b!324272 (=> (not res!177600) (not e!200226))))

(declare-datatypes ((SeekEntryResult!2985 0))(
  ( (MissingZero!2985 (index!14116 (_ BitVec 32))) (Found!2985 (index!14117 (_ BitVec 32))) (Intermediate!2985 (undefined!3797 Bool) (index!14118 (_ BitVec 32)) (x!32365 (_ BitVec 32))) (Undefined!2985) (MissingVacant!2985 (index!14119 (_ BitVec 32))) )
))
(declare-fun lt!156771 () SeekEntryResult!2985)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16593 (_ BitVec 32)) SeekEntryResult!2985)

(assert (=> b!324272 (= res!177600 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156771))))

(declare-fun b!324273 () Bool)

(declare-fun res!177604 () Bool)

(assert (=> b!324273 (=> (not res!177604) (not e!200225))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16593 (_ BitVec 32)) Bool)

(assert (=> b!324273 (= res!177604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324274 () Bool)

(declare-fun res!177598 () Bool)

(assert (=> b!324274 (=> (not res!177598) (not e!200225))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16593 (_ BitVec 32)) SeekEntryResult!2985)

(assert (=> b!324274 (= res!177598 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2985 i!1250)))))

(declare-fun b!324275 () Bool)

(assert (=> b!324275 (= e!200225 e!200226)))

(declare-fun res!177605 () Bool)

(assert (=> b!324275 (=> (not res!177605) (not e!200226))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324275 (= res!177605 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156771))))

(assert (=> b!324275 (= lt!156771 (Intermediate!2985 false resIndex!58 resX!58))))

(assert (= (and start!32454 res!177603) b!324267))

(assert (= (and b!324267 res!177606) b!324269))

(assert (= (and b!324269 res!177601) b!324268))

(assert (= (and b!324268 res!177599) b!324274))

(assert (= (and b!324274 res!177598) b!324273))

(assert (= (and b!324273 res!177604) b!324275))

(assert (= (and b!324275 res!177605) b!324271))

(assert (= (and b!324271 res!177602) b!324272))

(assert (= (and b!324272 res!177600) b!324270))

(declare-fun m!331347 () Bool)

(assert (=> b!324270 m!331347))

(declare-fun m!331349 () Bool)

(assert (=> b!324268 m!331349))

(declare-fun m!331351 () Bool)

(assert (=> b!324275 m!331351))

(assert (=> b!324275 m!331351))

(declare-fun m!331353 () Bool)

(assert (=> b!324275 m!331353))

(declare-fun m!331355 () Bool)

(assert (=> b!324272 m!331355))

(declare-fun m!331357 () Bool)

(assert (=> b!324274 m!331357))

(declare-fun m!331359 () Bool)

(assert (=> b!324271 m!331359))

(declare-fun m!331361 () Bool)

(assert (=> b!324269 m!331361))

(declare-fun m!331363 () Bool)

(assert (=> start!32454 m!331363))

(declare-fun m!331365 () Bool)

(assert (=> start!32454 m!331365))

(declare-fun m!331367 () Bool)

(assert (=> b!324273 m!331367))

(check-sat (not b!324273) (not b!324272) (not b!324269) (not b!324274) (not start!32454) (not b!324275) (not b!324268))
(check-sat)
