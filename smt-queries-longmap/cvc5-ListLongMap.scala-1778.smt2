; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32368 () Bool)

(assert start!32368)

(declare-fun b!322436 () Bool)

(declare-datatypes ((Unit!9857 0))(
  ( (Unit!9858) )
))
(declare-fun e!199556 () Unit!9857)

(declare-fun Unit!9859 () Unit!9857)

(assert (=> b!322436 (= e!199556 Unit!9859)))

(declare-fun b!322437 () Bool)

(assert (=> b!322437 false))

(declare-fun lt!156450 () Unit!9857)

(assert (=> b!322437 (= lt!156450 e!199556)))

(declare-datatypes ((array!16507 0))(
  ( (array!16508 (arr!7811 (Array (_ BitVec 32) (_ BitVec 64))) (size!8163 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16507)

(declare-fun c!50672 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2942 0))(
  ( (MissingZero!2942 (index!13944 (_ BitVec 32))) (Found!2942 (index!13945 (_ BitVec 32))) (Intermediate!2942 (undefined!3754 Bool) (index!13946 (_ BitVec 32)) (x!32210 (_ BitVec 32))) (Undefined!2942) (MissingVacant!2942 (index!13947 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16507 (_ BitVec 32)) SeekEntryResult!2942)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322437 (= c!50672 (is-Intermediate!2942 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777)))))

(declare-fun e!199561 () Unit!9857)

(declare-fun Unit!9860 () Unit!9857)

(assert (=> b!322437 (= e!199561 Unit!9860)))

(declare-fun b!322438 () Bool)

(declare-fun res!176357 () Bool)

(declare-fun e!199560 () Bool)

(assert (=> b!322438 (=> (not res!176357) (not e!199560))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!322438 (= res!176357 (and (= (size!8163 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8163 a!3305))))))

(declare-fun b!322439 () Bool)

(declare-fun res!176349 () Bool)

(declare-fun e!199557 () Bool)

(assert (=> b!322439 (=> (not res!176349) (not e!199557))))

(declare-fun lt!156449 () SeekEntryResult!2942)

(assert (=> b!322439 (= res!176349 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156449))))

(declare-fun b!322440 () Bool)

(declare-fun e!199559 () Unit!9857)

(declare-fun Unit!9861 () Unit!9857)

(assert (=> b!322440 (= e!199559 Unit!9861)))

(declare-fun b!322441 () Bool)

(assert (=> b!322441 (= e!199560 e!199557)))

(declare-fun res!176358 () Bool)

(assert (=> b!322441 (=> (not res!176358) (not e!199557))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322441 (= res!176358 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156449))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!322441 (= lt!156449 (Intermediate!2942 false resIndex!58 resX!58))))

(declare-fun b!322442 () Bool)

(declare-fun Unit!9862 () Unit!9857)

(assert (=> b!322442 (= e!199556 Unit!9862)))

(assert (=> b!322442 false))

(declare-fun b!322443 () Bool)

(declare-fun res!176356 () Bool)

(assert (=> b!322443 (=> (not res!176356) (not e!199560))))

(declare-fun arrayContainsKey!0 (array!16507 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!322443 (= res!176356 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!322444 () Bool)

(declare-fun res!176352 () Bool)

(assert (=> b!322444 (=> (not res!176352) (not e!199560))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!322444 (= res!176352 (validKeyInArray!0 k!2497))))

(declare-fun b!322445 () Bool)

(assert (=> b!322445 (= e!199557 (not (or (not (= (select (arr!7811 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3777 #b00000000000000000000000000000000))))))

(assert (=> b!322445 (= index!1840 resIndex!58)))

(declare-fun lt!156448 () Unit!9857)

(assert (=> b!322445 (= lt!156448 e!199559)))

(declare-fun c!50671 () Bool)

(assert (=> b!322445 (= c!50671 (not (= resIndex!58 index!1840)))))

(declare-fun b!322446 () Bool)

(declare-fun res!176353 () Bool)

(assert (=> b!322446 (=> (not res!176353) (not e!199560))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16507 (_ BitVec 32)) Bool)

(assert (=> b!322446 (= res!176353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!322448 () Bool)

(assert (=> b!322448 false))

(declare-fun Unit!9863 () Unit!9857)

(assert (=> b!322448 (= e!199561 Unit!9863)))

(declare-fun b!322449 () Bool)

(declare-fun res!176355 () Bool)

(assert (=> b!322449 (=> (not res!176355) (not e!199557))))

(assert (=> b!322449 (= res!176355 (and (= (select (arr!7811 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8163 a!3305))))))

(declare-fun b!322450 () Bool)

(declare-fun res!176351 () Bool)

(assert (=> b!322450 (=> (not res!176351) (not e!199557))))

(assert (=> b!322450 (= res!176351 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7811 a!3305) index!1840) k!2497)) (= x!1490 resX!58)))))

(declare-fun b!322451 () Bool)

(assert (=> b!322451 (= e!199559 e!199561)))

(declare-fun c!50673 () Bool)

(assert (=> b!322451 (= c!50673 (or (= (select (arr!7811 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7811 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!322447 () Bool)

(declare-fun res!176350 () Bool)

(assert (=> b!322447 (=> (not res!176350) (not e!199560))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16507 (_ BitVec 32)) SeekEntryResult!2942)

(assert (=> b!322447 (= res!176350 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2942 i!1250)))))

(declare-fun res!176354 () Bool)

(assert (=> start!32368 (=> (not res!176354) (not e!199560))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32368 (= res!176354 (validMask!0 mask!3777))))

(assert (=> start!32368 e!199560))

(declare-fun array_inv!5774 (array!16507) Bool)

(assert (=> start!32368 (array_inv!5774 a!3305)))

(assert (=> start!32368 true))

(assert (= (and start!32368 res!176354) b!322438))

(assert (= (and b!322438 res!176357) b!322444))

(assert (= (and b!322444 res!176352) b!322443))

(assert (= (and b!322443 res!176356) b!322447))

(assert (= (and b!322447 res!176350) b!322446))

(assert (= (and b!322446 res!176353) b!322441))

(assert (= (and b!322441 res!176358) b!322449))

(assert (= (and b!322449 res!176355) b!322439))

(assert (= (and b!322439 res!176349) b!322450))

(assert (= (and b!322450 res!176351) b!322445))

(assert (= (and b!322445 c!50671) b!322451))

(assert (= (and b!322445 (not c!50671)) b!322440))

(assert (= (and b!322451 c!50673) b!322448))

(assert (= (and b!322451 (not c!50673)) b!322437))

(assert (= (and b!322437 c!50672) b!322436))

(assert (= (and b!322437 (not c!50672)) b!322442))

(declare-fun m!330275 () Bool)

(assert (=> b!322449 m!330275))

(declare-fun m!330277 () Bool)

(assert (=> b!322451 m!330277))

(declare-fun m!330279 () Bool)

(assert (=> b!322446 m!330279))

(declare-fun m!330281 () Bool)

(assert (=> b!322437 m!330281))

(assert (=> b!322437 m!330281))

(declare-fun m!330283 () Bool)

(assert (=> b!322437 m!330283))

(declare-fun m!330285 () Bool)

(assert (=> b!322443 m!330285))

(declare-fun m!330287 () Bool)

(assert (=> b!322441 m!330287))

(assert (=> b!322441 m!330287))

(declare-fun m!330289 () Bool)

(assert (=> b!322441 m!330289))

(assert (=> b!322445 m!330277))

(declare-fun m!330291 () Bool)

(assert (=> start!32368 m!330291))

(declare-fun m!330293 () Bool)

(assert (=> start!32368 m!330293))

(declare-fun m!330295 () Bool)

(assert (=> b!322444 m!330295))

(assert (=> b!322450 m!330277))

(declare-fun m!330297 () Bool)

(assert (=> b!322447 m!330297))

(declare-fun m!330299 () Bool)

(assert (=> b!322439 m!330299))

(push 1)

