; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32366 () Bool)

(assert start!32366)

(declare-fun b!322388 () Bool)

(declare-fun res!176322 () Bool)

(declare-fun e!199539 () Bool)

(assert (=> b!322388 (=> (not res!176322) (not e!199539))))

(declare-datatypes ((array!16505 0))(
  ( (array!16506 (arr!7810 (Array (_ BitVec 32) (_ BitVec 64))) (size!8162 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16505)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!322388 (= res!176322 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7810 a!3305) index!1840) k!2497)) (= x!1490 resX!58)))))

(declare-fun b!322389 () Bool)

(declare-fun res!176323 () Bool)

(declare-fun e!199540 () Bool)

(assert (=> b!322389 (=> (not res!176323) (not e!199540))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2941 0))(
  ( (MissingZero!2941 (index!13940 (_ BitVec 32))) (Found!2941 (index!13941 (_ BitVec 32))) (Intermediate!2941 (undefined!3753 Bool) (index!13942 (_ BitVec 32)) (x!32201 (_ BitVec 32))) (Undefined!2941) (MissingVacant!2941 (index!13943 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16505 (_ BitVec 32)) SeekEntryResult!2941)

(assert (=> b!322389 (= res!176323 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2941 i!1250)))))

(declare-fun b!322390 () Bool)

(declare-fun res!176324 () Bool)

(assert (=> b!322390 (=> (not res!176324) (not e!199539))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!322390 (= res!176324 (and (= (select (arr!7810 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8162 a!3305))))))

(declare-fun b!322391 () Bool)

(assert (=> b!322391 (= e!199540 e!199539)))

(declare-fun res!176326 () Bool)

(assert (=> b!322391 (=> (not res!176326) (not e!199539))))

(declare-fun lt!156441 () SeekEntryResult!2941)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16505 (_ BitVec 32)) SeekEntryResult!2941)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322391 (= res!176326 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156441))))

(assert (=> b!322391 (= lt!156441 (Intermediate!2941 false resIndex!58 resX!58))))

(declare-fun b!322392 () Bool)

(assert (=> b!322392 (= e!199539 (not true))))

(assert (=> b!322392 (= index!1840 resIndex!58)))

(declare-datatypes ((Unit!9850 0))(
  ( (Unit!9851) )
))
(declare-fun lt!156439 () Unit!9850)

(declare-fun e!199543 () Unit!9850)

(assert (=> b!322392 (= lt!156439 e!199543)))

(declare-fun c!50662 () Bool)

(assert (=> b!322392 (= c!50662 (not (= resIndex!58 index!1840)))))

(declare-fun b!322393 () Bool)

(declare-fun Unit!9852 () Unit!9850)

(assert (=> b!322393 (= e!199543 Unit!9852)))

(declare-fun res!176321 () Bool)

(assert (=> start!32366 (=> (not res!176321) (not e!199540))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32366 (= res!176321 (validMask!0 mask!3777))))

(assert (=> start!32366 e!199540))

(declare-fun array_inv!5773 (array!16505) Bool)

(assert (=> start!32366 (array_inv!5773 a!3305)))

(assert (=> start!32366 true))

(declare-fun b!322394 () Bool)

(declare-fun res!176328 () Bool)

(assert (=> b!322394 (=> (not res!176328) (not e!199540))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16505 (_ BitVec 32)) Bool)

(assert (=> b!322394 (= res!176328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!322395 () Bool)

(declare-fun res!176320 () Bool)

(assert (=> b!322395 (=> (not res!176320) (not e!199539))))

(assert (=> b!322395 (= res!176320 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156441))))

(declare-fun b!322396 () Bool)

(declare-fun res!176327 () Bool)

(assert (=> b!322396 (=> (not res!176327) (not e!199540))))

(assert (=> b!322396 (= res!176327 (and (= (size!8162 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8162 a!3305))))))

(declare-fun b!322397 () Bool)

(assert (=> b!322397 false))

(declare-fun lt!156440 () Unit!9850)

(declare-fun e!199542 () Unit!9850)

(assert (=> b!322397 (= lt!156440 e!199542)))

(declare-fun c!50664 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322397 (= c!50664 (is-Intermediate!2941 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777)))))

(declare-fun e!199541 () Unit!9850)

(declare-fun Unit!9853 () Unit!9850)

(assert (=> b!322397 (= e!199541 Unit!9853)))

(declare-fun b!322398 () Bool)

(declare-fun res!176325 () Bool)

(assert (=> b!322398 (=> (not res!176325) (not e!199540))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!322398 (= res!176325 (validKeyInArray!0 k!2497))))

(declare-fun b!322399 () Bool)

(assert (=> b!322399 false))

(declare-fun Unit!9854 () Unit!9850)

(assert (=> b!322399 (= e!199541 Unit!9854)))

(declare-fun b!322400 () Bool)

(declare-fun Unit!9855 () Unit!9850)

(assert (=> b!322400 (= e!199542 Unit!9855)))

(assert (=> b!322400 false))

(declare-fun b!322401 () Bool)

(declare-fun Unit!9856 () Unit!9850)

(assert (=> b!322401 (= e!199542 Unit!9856)))

(declare-fun b!322402 () Bool)

(assert (=> b!322402 (= e!199543 e!199541)))

(declare-fun c!50663 () Bool)

(assert (=> b!322402 (= c!50663 (or (= (select (arr!7810 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7810 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!322403 () Bool)

(declare-fun res!176319 () Bool)

(assert (=> b!322403 (=> (not res!176319) (not e!199540))))

(declare-fun arrayContainsKey!0 (array!16505 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!322403 (= res!176319 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(assert (= (and start!32366 res!176321) b!322396))

(assert (= (and b!322396 res!176327) b!322398))

(assert (= (and b!322398 res!176325) b!322403))

(assert (= (and b!322403 res!176319) b!322389))

(assert (= (and b!322389 res!176323) b!322394))

(assert (= (and b!322394 res!176328) b!322391))

(assert (= (and b!322391 res!176326) b!322390))

(assert (= (and b!322390 res!176324) b!322395))

(assert (= (and b!322395 res!176320) b!322388))

(assert (= (and b!322388 res!176322) b!322392))

(assert (= (and b!322392 c!50662) b!322402))

(assert (= (and b!322392 (not c!50662)) b!322393))

(assert (= (and b!322402 c!50663) b!322399))

(assert (= (and b!322402 (not c!50663)) b!322397))

(assert (= (and b!322397 c!50664) b!322401))

(assert (= (and b!322397 (not c!50664)) b!322400))

(declare-fun m!330249 () Bool)

(assert (=> b!322388 m!330249))

(declare-fun m!330251 () Bool)

(assert (=> b!322391 m!330251))

(assert (=> b!322391 m!330251))

(declare-fun m!330253 () Bool)

(assert (=> b!322391 m!330253))

(declare-fun m!330255 () Bool)

(assert (=> b!322390 m!330255))

(assert (=> b!322402 m!330249))

(declare-fun m!330257 () Bool)

(assert (=> b!322397 m!330257))

(assert (=> b!322397 m!330257))

(declare-fun m!330259 () Bool)

(assert (=> b!322397 m!330259))

(declare-fun m!330261 () Bool)

(assert (=> b!322389 m!330261))

(declare-fun m!330263 () Bool)

(assert (=> b!322395 m!330263))

(declare-fun m!330265 () Bool)

(assert (=> b!322403 m!330265))

(declare-fun m!330267 () Bool)

(assert (=> start!32366 m!330267))

(declare-fun m!330269 () Bool)

(assert (=> start!32366 m!330269))

(declare-fun m!330271 () Bool)

(assert (=> b!322398 m!330271))

(declare-fun m!330273 () Bool)

(assert (=> b!322394 m!330273))

(push 1)

