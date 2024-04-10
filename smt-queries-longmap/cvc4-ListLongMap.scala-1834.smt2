; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33218 () Bool)

(assert start!33218)

(declare-fun b!330362 () Bool)

(declare-fun e!202802 () Bool)

(declare-fun e!202804 () Bool)

(assert (=> b!330362 (= e!202802 e!202804)))

(declare-fun res!182056 () Bool)

(assert (=> b!330362 (=> (not res!182056) (not e!202804))))

(declare-datatypes ((SeekEntryResult!3112 0))(
  ( (MissingZero!3112 (index!14624 (_ BitVec 32))) (Found!3112 (index!14625 (_ BitVec 32))) (Intermediate!3112 (undefined!3924 Bool) (index!14626 (_ BitVec 32)) (x!32903 (_ BitVec 32))) (Undefined!3112) (MissingVacant!3112 (index!14627 (_ BitVec 32))) )
))
(declare-fun lt!158498 () SeekEntryResult!3112)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((array!16877 0))(
  ( (array!16878 (arr!7981 (Array (_ BitVec 32) (_ BitVec 64))) (size!8333 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16877)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16877 (_ BitVec 32)) SeekEntryResult!3112)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330362 (= res!182056 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!158498))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!330362 (= lt!158498 (Intermediate!3112 false resIndex!58 resX!58))))

(declare-fun b!330363 () Bool)

(declare-fun res!182055 () Bool)

(assert (=> b!330363 (=> (not res!182055) (not e!202802))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!330363 (= res!182055 (validKeyInArray!0 k!2497))))

(declare-fun b!330364 () Bool)

(declare-fun res!182064 () Bool)

(assert (=> b!330364 (=> (not res!182064) (not e!202802))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16877 (_ BitVec 32)) Bool)

(assert (=> b!330364 (= res!182064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!330365 () Bool)

(declare-fun res!182059 () Bool)

(assert (=> b!330365 (=> (not res!182059) (not e!202802))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16877 (_ BitVec 32)) SeekEntryResult!3112)

(assert (=> b!330365 (= res!182059 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3112 i!1250)))))

(declare-fun b!330366 () Bool)

(assert (=> b!330366 false))

(declare-datatypes ((Unit!10274 0))(
  ( (Unit!10275) )
))
(declare-fun e!202807 () Unit!10274)

(declare-fun Unit!10276 () Unit!10274)

(assert (=> b!330366 (= e!202807 Unit!10276)))

(declare-fun b!330367 () Bool)

(declare-fun e!202805 () Unit!10274)

(declare-fun Unit!10277 () Unit!10274)

(assert (=> b!330367 (= e!202805 Unit!10277)))

(declare-fun b!330368 () Bool)

(declare-fun res!182058 () Bool)

(assert (=> b!330368 (=> (not res!182058) (not e!202804))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!330368 (= res!182058 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!158498))))

(declare-fun b!330369 () Bool)

(declare-fun res!182057 () Bool)

(assert (=> b!330369 (=> (not res!182057) (not e!202804))))

(assert (=> b!330369 (= res!182057 (and (= (select (arr!7981 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8333 a!3305))))))

(declare-fun b!330370 () Bool)

(assert (=> b!330370 false))

(declare-fun lt!158497 () Unit!10274)

(assert (=> b!330370 (= lt!158497 e!202805)))

(declare-fun c!51797 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330370 (= c!51797 (is-Intermediate!3112 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777)))))

(declare-fun Unit!10278 () Unit!10274)

(assert (=> b!330370 (= e!202807 Unit!10278)))

(declare-fun b!330371 () Bool)

(declare-fun res!182060 () Bool)

(assert (=> b!330371 (=> (not res!182060) (not e!202802))))

(assert (=> b!330371 (= res!182060 (and (= (size!8333 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8333 a!3305))))))

(declare-fun b!330372 () Bool)

(declare-fun res!182062 () Bool)

(assert (=> b!330372 (=> (not res!182062) (not e!202802))))

(declare-fun arrayContainsKey!0 (array!16877 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!330372 (= res!182062 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!330373 () Bool)

(declare-fun e!202806 () Unit!10274)

(declare-fun Unit!10279 () Unit!10274)

(assert (=> b!330373 (= e!202806 Unit!10279)))

(declare-fun b!330374 () Bool)

(declare-fun Unit!10280 () Unit!10274)

(assert (=> b!330374 (= e!202805 Unit!10280)))

(assert (=> b!330374 false))

(declare-fun b!330375 () Bool)

(assert (=> b!330375 (= e!202804 (not (= (select (arr!7981 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!330375 (= index!1840 resIndex!58)))

(declare-fun lt!158499 () Unit!10274)

(assert (=> b!330375 (= lt!158499 e!202806)))

(declare-fun c!51796 () Bool)

(assert (=> b!330375 (= c!51796 (not (= resIndex!58 index!1840)))))

(declare-fun res!182061 () Bool)

(assert (=> start!33218 (=> (not res!182061) (not e!202802))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33218 (= res!182061 (validMask!0 mask!3777))))

(assert (=> start!33218 e!202802))

(declare-fun array_inv!5944 (array!16877) Bool)

(assert (=> start!33218 (array_inv!5944 a!3305)))

(assert (=> start!33218 true))

(declare-fun b!330376 () Bool)

(declare-fun res!182063 () Bool)

(assert (=> b!330376 (=> (not res!182063) (not e!202804))))

(assert (=> b!330376 (= res!182063 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7981 a!3305) index!1840) k!2497)) (= x!1490 resX!58)))))

(declare-fun b!330377 () Bool)

(assert (=> b!330377 (= e!202806 e!202807)))

(declare-fun c!51798 () Bool)

(assert (=> b!330377 (= c!51798 (or (= (select (arr!7981 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7981 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!33218 res!182061) b!330371))

(assert (= (and b!330371 res!182060) b!330363))

(assert (= (and b!330363 res!182055) b!330372))

(assert (= (and b!330372 res!182062) b!330365))

(assert (= (and b!330365 res!182059) b!330364))

(assert (= (and b!330364 res!182064) b!330362))

(assert (= (and b!330362 res!182056) b!330369))

(assert (= (and b!330369 res!182057) b!330368))

(assert (= (and b!330368 res!182058) b!330376))

(assert (= (and b!330376 res!182063) b!330375))

(assert (= (and b!330375 c!51796) b!330377))

(assert (= (and b!330375 (not c!51796)) b!330373))

(assert (= (and b!330377 c!51798) b!330366))

(assert (= (and b!330377 (not c!51798)) b!330370))

(assert (= (and b!330370 c!51797) b!330367))

(assert (= (and b!330370 (not c!51797)) b!330374))

(declare-fun m!335631 () Bool)

(assert (=> b!330362 m!335631))

(assert (=> b!330362 m!335631))

(declare-fun m!335633 () Bool)

(assert (=> b!330362 m!335633))

(declare-fun m!335635 () Bool)

(assert (=> b!330375 m!335635))

(declare-fun m!335637 () Bool)

(assert (=> start!33218 m!335637))

(declare-fun m!335639 () Bool)

(assert (=> start!33218 m!335639))

(declare-fun m!335641 () Bool)

(assert (=> b!330370 m!335641))

(assert (=> b!330370 m!335641))

(declare-fun m!335643 () Bool)

(assert (=> b!330370 m!335643))

(declare-fun m!335645 () Bool)

(assert (=> b!330368 m!335645))

(assert (=> b!330377 m!335635))

(declare-fun m!335647 () Bool)

(assert (=> b!330372 m!335647))

(declare-fun m!335649 () Bool)

(assert (=> b!330363 m!335649))

(declare-fun m!335651 () Bool)

(assert (=> b!330365 m!335651))

(declare-fun m!335653 () Bool)

(assert (=> b!330364 m!335653))

(assert (=> b!330376 m!335635))

(declare-fun m!335655 () Bool)

(assert (=> b!330369 m!335655))

(push 1)

