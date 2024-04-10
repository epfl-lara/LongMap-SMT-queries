; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32372 () Bool)

(assert start!32372)

(declare-fun b!322532 () Bool)

(declare-datatypes ((Unit!9871 0))(
  ( (Unit!9872) )
))
(declare-fun e!199595 () Unit!9871)

(declare-fun Unit!9873 () Unit!9871)

(assert (=> b!322532 (= e!199595 Unit!9873)))

(assert (=> b!322532 false))

(declare-datatypes ((array!16511 0))(
  ( (array!16512 (arr!7813 (Array (_ BitVec 32) (_ BitVec 64))) (size!8165 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16511)

(declare-fun b!322533 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun e!199594 () Bool)

(assert (=> b!322533 (= e!199594 (not (or (not (= (select (arr!7813 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3777 #b00000000000000000000000000000000))))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!322533 (= index!1840 resIndex!58)))

(declare-fun lt!156468 () Unit!9871)

(declare-fun e!199596 () Unit!9871)

(assert (=> b!322533 (= lt!156468 e!199596)))

(declare-fun c!50689 () Bool)

(assert (=> b!322533 (= c!50689 (not (= resIndex!58 index!1840)))))

(declare-fun b!322534 () Bool)

(declare-fun res!176415 () Bool)

(assert (=> b!322534 (=> (not res!176415) (not e!199594))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!322534 (= res!176415 (and (= (select (arr!7813 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8165 a!3305))))))

(declare-fun b!322535 () Bool)

(declare-fun res!176413 () Bool)

(declare-fun e!199593 () Bool)

(assert (=> b!322535 (=> (not res!176413) (not e!199593))))

(assert (=> b!322535 (= res!176413 (and (= (size!8165 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8165 a!3305))))))

(declare-fun b!322536 () Bool)

(declare-fun res!176418 () Bool)

(assert (=> b!322536 (=> (not res!176418) (not e!199593))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16511 (_ BitVec 32)) Bool)

(assert (=> b!322536 (= res!176418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!322537 () Bool)

(declare-fun res!176411 () Bool)

(assert (=> b!322537 (=> (not res!176411) (not e!199593))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2944 0))(
  ( (MissingZero!2944 (index!13952 (_ BitVec 32))) (Found!2944 (index!13953 (_ BitVec 32))) (Intermediate!2944 (undefined!3756 Bool) (index!13954 (_ BitVec 32)) (x!32212 (_ BitVec 32))) (Undefined!2944) (MissingVacant!2944 (index!13955 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16511 (_ BitVec 32)) SeekEntryResult!2944)

(assert (=> b!322537 (= res!176411 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2944 i!1250)))))

(declare-fun b!322538 () Bool)

(declare-fun res!176412 () Bool)

(assert (=> b!322538 (=> (not res!176412) (not e!199594))))

(assert (=> b!322538 (= res!176412 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7813 a!3305) index!1840) k!2497)) (= x!1490 resX!58)))))

(declare-fun b!322539 () Bool)

(declare-fun res!176410 () Bool)

(assert (=> b!322539 (=> (not res!176410) (not e!199593))))

(declare-fun arrayContainsKey!0 (array!16511 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!322539 (= res!176410 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!322540 () Bool)

(assert (=> b!322540 false))

(declare-fun lt!156466 () Unit!9871)

(assert (=> b!322540 (= lt!156466 e!199595)))

(declare-fun c!50690 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16511 (_ BitVec 32)) SeekEntryResult!2944)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322540 (= c!50690 (is-Intermediate!2944 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777)))))

(declare-fun e!199592 () Unit!9871)

(declare-fun Unit!9874 () Unit!9871)

(assert (=> b!322540 (= e!199592 Unit!9874)))

(declare-fun b!322542 () Bool)

(assert (=> b!322542 (= e!199593 e!199594)))

(declare-fun res!176416 () Bool)

(assert (=> b!322542 (=> (not res!176416) (not e!199594))))

(declare-fun lt!156467 () SeekEntryResult!2944)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322542 (= res!176416 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156467))))

(assert (=> b!322542 (= lt!156467 (Intermediate!2944 false resIndex!58 resX!58))))

(declare-fun b!322543 () Bool)

(assert (=> b!322543 (= e!199596 e!199592)))

(declare-fun c!50691 () Bool)

(assert (=> b!322543 (= c!50691 (or (= (select (arr!7813 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7813 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!322544 () Bool)

(declare-fun res!176414 () Bool)

(assert (=> b!322544 (=> (not res!176414) (not e!199594))))

(assert (=> b!322544 (= res!176414 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156467))))

(declare-fun b!322545 () Bool)

(declare-fun Unit!9875 () Unit!9871)

(assert (=> b!322545 (= e!199596 Unit!9875)))

(declare-fun b!322546 () Bool)

(declare-fun Unit!9876 () Unit!9871)

(assert (=> b!322546 (= e!199595 Unit!9876)))

(declare-fun b!322547 () Bool)

(assert (=> b!322547 false))

(declare-fun Unit!9877 () Unit!9871)

(assert (=> b!322547 (= e!199592 Unit!9877)))

(declare-fun b!322541 () Bool)

(declare-fun res!176409 () Bool)

(assert (=> b!322541 (=> (not res!176409) (not e!199593))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!322541 (= res!176409 (validKeyInArray!0 k!2497))))

(declare-fun res!176417 () Bool)

(assert (=> start!32372 (=> (not res!176417) (not e!199593))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32372 (= res!176417 (validMask!0 mask!3777))))

(assert (=> start!32372 e!199593))

(declare-fun array_inv!5776 (array!16511) Bool)

(assert (=> start!32372 (array_inv!5776 a!3305)))

(assert (=> start!32372 true))

(assert (= (and start!32372 res!176417) b!322535))

(assert (= (and b!322535 res!176413) b!322541))

(assert (= (and b!322541 res!176409) b!322539))

(assert (= (and b!322539 res!176410) b!322537))

(assert (= (and b!322537 res!176411) b!322536))

(assert (= (and b!322536 res!176418) b!322542))

(assert (= (and b!322542 res!176416) b!322534))

(assert (= (and b!322534 res!176415) b!322544))

(assert (= (and b!322544 res!176414) b!322538))

(assert (= (and b!322538 res!176412) b!322533))

(assert (= (and b!322533 c!50689) b!322543))

(assert (= (and b!322533 (not c!50689)) b!322545))

(assert (= (and b!322543 c!50691) b!322547))

(assert (= (and b!322543 (not c!50691)) b!322540))

(assert (= (and b!322540 c!50690) b!322546))

(assert (= (and b!322540 (not c!50690)) b!322532))

(declare-fun m!330327 () Bool)

(assert (=> b!322538 m!330327))

(declare-fun m!330329 () Bool)

(assert (=> b!322534 m!330329))

(declare-fun m!330331 () Bool)

(assert (=> b!322540 m!330331))

(assert (=> b!322540 m!330331))

(declare-fun m!330333 () Bool)

(assert (=> b!322540 m!330333))

(assert (=> b!322543 m!330327))

(declare-fun m!330335 () Bool)

(assert (=> b!322544 m!330335))

(declare-fun m!330337 () Bool)

(assert (=> b!322539 m!330337))

(declare-fun m!330339 () Bool)

(assert (=> b!322536 m!330339))

(assert (=> b!322533 m!330327))

(declare-fun m!330341 () Bool)

(assert (=> b!322542 m!330341))

(assert (=> b!322542 m!330341))

(declare-fun m!330343 () Bool)

(assert (=> b!322542 m!330343))

(declare-fun m!330345 () Bool)

(assert (=> b!322537 m!330345))

(declare-fun m!330347 () Bool)

(assert (=> start!32372 m!330347))

(declare-fun m!330349 () Bool)

(assert (=> start!32372 m!330349))

(declare-fun m!330351 () Bool)

(assert (=> b!322541 m!330351))

(push 1)

(assert (not b!322536))

(assert (not b!322537))

(assert (not b!322541))

(assert (not b!322539))

(assert (not start!32372))

(assert (not b!322540))

(assert (not b!322544))

(assert (not b!322542))

(check-sat)

