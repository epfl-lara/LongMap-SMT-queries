; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32136 () Bool)

(assert start!32136)

(declare-fun b!320279 () Bool)

(declare-fun res!174528 () Bool)

(declare-fun e!198765 () Bool)

(assert (=> b!320279 (=> (not res!174528) (not e!198765))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((array!16371 0))(
  ( (array!16372 (arr!7746 (Array (_ BitVec 32) (_ BitVec 64))) (size!8098 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16371)

(declare-datatypes ((SeekEntryResult!2877 0))(
  ( (MissingZero!2877 (index!13684 (_ BitVec 32))) (Found!2877 (index!13685 (_ BitVec 32))) (Intermediate!2877 (undefined!3689 Bool) (index!13686 (_ BitVec 32)) (x!31954 (_ BitVec 32))) (Undefined!2877) (MissingVacant!2877 (index!13687 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16371 (_ BitVec 32)) SeekEntryResult!2877)

(assert (=> b!320279 (= res!174528 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2877 i!1250)))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun b!320280 () Bool)

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!320280 (= e!198765 (and (= (select (arr!7746 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8098 a!3305)) (bvslt mask!3777 #b00000000000000000000000000000000)))))

(declare-fun b!320281 () Bool)

(declare-fun res!174523 () Bool)

(assert (=> b!320281 (=> (not res!174523) (not e!198765))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320281 (= res!174523 (validKeyInArray!0 k0!2497))))

(declare-fun b!320282 () Bool)

(declare-fun res!174524 () Bool)

(assert (=> b!320282 (=> (not res!174524) (not e!198765))))

(assert (=> b!320282 (= res!174524 (and (= (size!8098 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8098 a!3305))))))

(declare-fun res!174522 () Bool)

(assert (=> start!32136 (=> (not res!174522) (not e!198765))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32136 (= res!174522 (validMask!0 mask!3777))))

(assert (=> start!32136 e!198765))

(declare-fun array_inv!5709 (array!16371) Bool)

(assert (=> start!32136 (array_inv!5709 a!3305)))

(assert (=> start!32136 true))

(declare-fun b!320283 () Bool)

(declare-fun res!174525 () Bool)

(assert (=> b!320283 (=> (not res!174525) (not e!198765))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16371 (_ BitVec 32)) Bool)

(assert (=> b!320283 (= res!174525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!320284 () Bool)

(declare-fun res!174526 () Bool)

(assert (=> b!320284 (=> (not res!174526) (not e!198765))))

(declare-fun arrayContainsKey!0 (array!16371 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320284 (= res!174526 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320285 () Bool)

(declare-fun res!174527 () Bool)

(assert (=> b!320285 (=> (not res!174527) (not e!198765))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16371 (_ BitVec 32)) SeekEntryResult!2877)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320285 (= res!174527 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) (Intermediate!2877 false resIndex!58 resX!58)))))

(assert (= (and start!32136 res!174522) b!320282))

(assert (= (and b!320282 res!174524) b!320281))

(assert (= (and b!320281 res!174523) b!320284))

(assert (= (and b!320284 res!174526) b!320279))

(assert (= (and b!320279 res!174528) b!320283))

(assert (= (and b!320283 res!174525) b!320285))

(assert (= (and b!320285 res!174527) b!320280))

(declare-fun m!328679 () Bool)

(assert (=> b!320280 m!328679))

(declare-fun m!328681 () Bool)

(assert (=> b!320285 m!328681))

(assert (=> b!320285 m!328681))

(declare-fun m!328683 () Bool)

(assert (=> b!320285 m!328683))

(declare-fun m!328685 () Bool)

(assert (=> b!320279 m!328685))

(declare-fun m!328687 () Bool)

(assert (=> b!320281 m!328687))

(declare-fun m!328689 () Bool)

(assert (=> b!320283 m!328689))

(declare-fun m!328691 () Bool)

(assert (=> start!32136 m!328691))

(declare-fun m!328693 () Bool)

(assert (=> start!32136 m!328693))

(declare-fun m!328695 () Bool)

(assert (=> b!320284 m!328695))

(check-sat (not b!320285) (not b!320279) (not b!320284) (not start!32136) (not b!320283) (not b!320281))
(check-sat)
