; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32532 () Bool)

(assert start!32532)

(declare-fun res!178771 () Bool)

(declare-fun e!200577 () Bool)

(assert (=> start!32532 (=> (not res!178771) (not e!200577))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32532 (= res!178771 (validMask!0 mask!3777))))

(assert (=> start!32532 e!200577))

(declare-datatypes ((array!16671 0))(
  ( (array!16672 (arr!7893 (Array (_ BitVec 32) (_ BitVec 64))) (size!8245 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16671)

(declare-fun array_inv!5856 (array!16671) Bool)

(assert (=> start!32532 (array_inv!5856 a!3305)))

(assert (=> start!32532 true))

(declare-fun b!325433 () Bool)

(declare-fun res!178767 () Bool)

(assert (=> b!325433 (=> (not res!178767) (not e!200577))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16671 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!325433 (= res!178767 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!325434 () Bool)

(declare-fun e!200578 () Bool)

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!325434 (= e!200578 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1490) resX!58) (bvslt (bvadd #b00000000000000000000000000000001 x!1490) #b00000000000000000000000000000000)))))

(declare-fun lt!157001 () (_ BitVec 32))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325434 (= lt!157001 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!325435 () Bool)

(declare-fun res!178765 () Bool)

(assert (=> b!325435 (=> (not res!178765) (not e!200578))))

(declare-datatypes ((SeekEntryResult!3024 0))(
  ( (MissingZero!3024 (index!14272 (_ BitVec 32))) (Found!3024 (index!14273 (_ BitVec 32))) (Intermediate!3024 (undefined!3836 Bool) (index!14274 (_ BitVec 32)) (x!32508 (_ BitVec 32))) (Undefined!3024) (MissingVacant!3024 (index!14275 (_ BitVec 32))) )
))
(declare-fun lt!157002 () SeekEntryResult!3024)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16671 (_ BitVec 32)) SeekEntryResult!3024)

(assert (=> b!325435 (= res!178765 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157002))))

(declare-fun b!325436 () Bool)

(declare-fun res!178770 () Bool)

(assert (=> b!325436 (=> (not res!178770) (not e!200577))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!325436 (= res!178770 (and (= (size!8245 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8245 a!3305))))))

(declare-fun b!325437 () Bool)

(assert (=> b!325437 (= e!200577 e!200578)))

(declare-fun res!178764 () Bool)

(assert (=> b!325437 (=> (not res!178764) (not e!200578))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325437 (= res!178764 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157002))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!325437 (= lt!157002 (Intermediate!3024 false resIndex!58 resX!58))))

(declare-fun b!325438 () Bool)

(declare-fun res!178766 () Bool)

(assert (=> b!325438 (=> (not res!178766) (not e!200577))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16671 (_ BitVec 32)) Bool)

(assert (=> b!325438 (= res!178766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!325439 () Bool)

(declare-fun res!178768 () Bool)

(assert (=> b!325439 (=> (not res!178768) (not e!200578))))

(assert (=> b!325439 (= res!178768 (and (= (select (arr!7893 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8245 a!3305))))))

(declare-fun b!325440 () Bool)

(declare-fun res!178773 () Bool)

(assert (=> b!325440 (=> (not res!178773) (not e!200577))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16671 (_ BitVec 32)) SeekEntryResult!3024)

(assert (=> b!325440 (= res!178773 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3024 i!1250)))))

(declare-fun b!325441 () Bool)

(declare-fun res!178769 () Bool)

(assert (=> b!325441 (=> (not res!178769) (not e!200577))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!325441 (= res!178769 (validKeyInArray!0 k0!2497))))

(declare-fun b!325442 () Bool)

(declare-fun res!178772 () Bool)

(assert (=> b!325442 (=> (not res!178772) (not e!200578))))

(assert (=> b!325442 (= res!178772 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7893 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(assert (= (and start!32532 res!178771) b!325436))

(assert (= (and b!325436 res!178770) b!325441))

(assert (= (and b!325441 res!178769) b!325433))

(assert (= (and b!325433 res!178767) b!325440))

(assert (= (and b!325440 res!178773) b!325438))

(assert (= (and b!325438 res!178766) b!325437))

(assert (= (and b!325437 res!178764) b!325439))

(assert (= (and b!325439 res!178768) b!325435))

(assert (= (and b!325435 res!178765) b!325442))

(assert (= (and b!325442 res!178772) b!325434))

(declare-fun m!332279 () Bool)

(assert (=> b!325434 m!332279))

(declare-fun m!332281 () Bool)

(assert (=> b!325438 m!332281))

(declare-fun m!332283 () Bool)

(assert (=> b!325433 m!332283))

(declare-fun m!332285 () Bool)

(assert (=> b!325441 m!332285))

(declare-fun m!332287 () Bool)

(assert (=> b!325439 m!332287))

(declare-fun m!332289 () Bool)

(assert (=> b!325442 m!332289))

(declare-fun m!332291 () Bool)

(assert (=> b!325440 m!332291))

(declare-fun m!332293 () Bool)

(assert (=> b!325437 m!332293))

(assert (=> b!325437 m!332293))

(declare-fun m!332295 () Bool)

(assert (=> b!325437 m!332295))

(declare-fun m!332297 () Bool)

(assert (=> start!32532 m!332297))

(declare-fun m!332299 () Bool)

(assert (=> start!32532 m!332299))

(declare-fun m!332301 () Bool)

(assert (=> b!325435 m!332301))

(check-sat (not b!325433) (not b!325438) (not b!325434) (not b!325437) (not b!325440) (not start!32532) (not b!325435) (not b!325441))
(check-sat)
