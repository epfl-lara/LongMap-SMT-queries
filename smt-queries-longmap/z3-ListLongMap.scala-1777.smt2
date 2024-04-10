; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32364 () Bool)

(assert start!32364)

(declare-fun b!322340 () Bool)

(declare-fun e!199524 () Bool)

(declare-fun e!199525 () Bool)

(assert (=> b!322340 (= e!199524 e!199525)))

(declare-fun res!176290 () Bool)

(assert (=> b!322340 (=> (not res!176290) (not e!199525))))

(declare-datatypes ((array!16503 0))(
  ( (array!16504 (arr!7809 (Array (_ BitVec 32) (_ BitVec 64))) (size!8161 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16503)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2940 0))(
  ( (MissingZero!2940 (index!13936 (_ BitVec 32))) (Found!2940 (index!13937 (_ BitVec 32))) (Intermediate!2940 (undefined!3752 Bool) (index!13938 (_ BitVec 32)) (x!32200 (_ BitVec 32))) (Undefined!2940) (MissingVacant!2940 (index!13939 (_ BitVec 32))) )
))
(declare-fun lt!156430 () SeekEntryResult!2940)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16503 (_ BitVec 32)) SeekEntryResult!2940)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322340 (= res!176290 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156430))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!322340 (= lt!156430 (Intermediate!2940 false resIndex!58 resX!58))))

(declare-fun b!322341 () Bool)

(declare-datatypes ((Unit!9843 0))(
  ( (Unit!9844) )
))
(declare-fun e!199520 () Unit!9843)

(declare-fun Unit!9845 () Unit!9843)

(assert (=> b!322341 (= e!199520 Unit!9845)))

(declare-fun b!322342 () Bool)

(assert (=> b!322342 false))

(declare-fun e!199521 () Unit!9843)

(declare-fun Unit!9846 () Unit!9843)

(assert (=> b!322342 (= e!199521 Unit!9846)))

(declare-fun b!322343 () Bool)

(declare-fun res!176298 () Bool)

(assert (=> b!322343 (=> (not res!176298) (not e!199525))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!322343 (= res!176298 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7809 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(declare-fun b!322344 () Bool)

(assert (=> b!322344 (= e!199525 (not true))))

(assert (=> b!322344 (= index!1840 resIndex!58)))

(declare-fun lt!156432 () Unit!9843)

(assert (=> b!322344 (= lt!156432 e!199520)))

(declare-fun c!50653 () Bool)

(assert (=> b!322344 (= c!50653 (not (= resIndex!58 index!1840)))))

(declare-fun b!322345 () Bool)

(declare-fun e!199522 () Unit!9843)

(declare-fun Unit!9847 () Unit!9843)

(assert (=> b!322345 (= e!199522 Unit!9847)))

(declare-fun b!322346 () Bool)

(declare-fun res!176295 () Bool)

(assert (=> b!322346 (=> (not res!176295) (not e!199524))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!322346 (= res!176295 (validKeyInArray!0 k0!2497))))

(declare-fun res!176291 () Bool)

(assert (=> start!32364 (=> (not res!176291) (not e!199524))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32364 (= res!176291 (validMask!0 mask!3777))))

(assert (=> start!32364 e!199524))

(declare-fun array_inv!5772 (array!16503) Bool)

(assert (=> start!32364 (array_inv!5772 a!3305)))

(assert (=> start!32364 true))

(declare-fun b!322347 () Bool)

(declare-fun res!176297 () Bool)

(assert (=> b!322347 (=> (not res!176297) (not e!199525))))

(assert (=> b!322347 (= res!176297 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156430))))

(declare-fun b!322348 () Bool)

(declare-fun res!176289 () Bool)

(assert (=> b!322348 (=> (not res!176289) (not e!199524))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16503 (_ BitVec 32)) SeekEntryResult!2940)

(assert (=> b!322348 (= res!176289 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2940 i!1250)))))

(declare-fun b!322349 () Bool)

(declare-fun res!176294 () Bool)

(assert (=> b!322349 (=> (not res!176294) (not e!199525))))

(assert (=> b!322349 (= res!176294 (and (= (select (arr!7809 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8161 a!3305))))))

(declare-fun b!322350 () Bool)

(declare-fun res!176296 () Bool)

(assert (=> b!322350 (=> (not res!176296) (not e!199524))))

(declare-fun arrayContainsKey!0 (array!16503 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!322350 (= res!176296 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!322351 () Bool)

(declare-fun Unit!9848 () Unit!9843)

(assert (=> b!322351 (= e!199522 Unit!9848)))

(assert (=> b!322351 false))

(declare-fun b!322352 () Bool)

(declare-fun res!176292 () Bool)

(assert (=> b!322352 (=> (not res!176292) (not e!199524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16503 (_ BitVec 32)) Bool)

(assert (=> b!322352 (= res!176292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!322353 () Bool)

(declare-fun res!176293 () Bool)

(assert (=> b!322353 (=> (not res!176293) (not e!199524))))

(assert (=> b!322353 (= res!176293 (and (= (size!8161 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8161 a!3305))))))

(declare-fun b!322354 () Bool)

(assert (=> b!322354 false))

(declare-fun lt!156431 () Unit!9843)

(assert (=> b!322354 (= lt!156431 e!199522)))

(declare-fun c!50655 () Bool)

(get-info :version)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322354 (= c!50655 ((_ is Intermediate!2940) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun Unit!9849 () Unit!9843)

(assert (=> b!322354 (= e!199521 Unit!9849)))

(declare-fun b!322355 () Bool)

(assert (=> b!322355 (= e!199520 e!199521)))

(declare-fun c!50654 () Bool)

(assert (=> b!322355 (= c!50654 (or (= (select (arr!7809 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7809 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!32364 res!176291) b!322353))

(assert (= (and b!322353 res!176293) b!322346))

(assert (= (and b!322346 res!176295) b!322350))

(assert (= (and b!322350 res!176296) b!322348))

(assert (= (and b!322348 res!176289) b!322352))

(assert (= (and b!322352 res!176292) b!322340))

(assert (= (and b!322340 res!176290) b!322349))

(assert (= (and b!322349 res!176294) b!322347))

(assert (= (and b!322347 res!176297) b!322343))

(assert (= (and b!322343 res!176298) b!322344))

(assert (= (and b!322344 c!50653) b!322355))

(assert (= (and b!322344 (not c!50653)) b!322341))

(assert (= (and b!322355 c!50654) b!322342))

(assert (= (and b!322355 (not c!50654)) b!322354))

(assert (= (and b!322354 c!50655) b!322345))

(assert (= (and b!322354 (not c!50655)) b!322351))

(declare-fun m!330223 () Bool)

(assert (=> b!322355 m!330223))

(declare-fun m!330225 () Bool)

(assert (=> b!322352 m!330225))

(declare-fun m!330227 () Bool)

(assert (=> b!322348 m!330227))

(declare-fun m!330229 () Bool)

(assert (=> b!322350 m!330229))

(declare-fun m!330231 () Bool)

(assert (=> b!322340 m!330231))

(assert (=> b!322340 m!330231))

(declare-fun m!330233 () Bool)

(assert (=> b!322340 m!330233))

(declare-fun m!330235 () Bool)

(assert (=> b!322346 m!330235))

(assert (=> b!322343 m!330223))

(declare-fun m!330237 () Bool)

(assert (=> b!322347 m!330237))

(declare-fun m!330239 () Bool)

(assert (=> b!322349 m!330239))

(declare-fun m!330241 () Bool)

(assert (=> start!32364 m!330241))

(declare-fun m!330243 () Bool)

(assert (=> start!32364 m!330243))

(declare-fun m!330245 () Bool)

(assert (=> b!322354 m!330245))

(assert (=> b!322354 m!330245))

(declare-fun m!330247 () Bool)

(assert (=> b!322354 m!330247))

(check-sat (not b!322350) (not b!322352) (not b!322340) (not b!322354) (not b!322346) (not b!322347) (not b!322348) (not start!32364))
(check-sat)
