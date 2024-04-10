; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32682 () Bool)

(assert start!32682)

(declare-fun b!326531 () Bool)

(declare-fun res!179567 () Bool)

(declare-fun e!201053 () Bool)

(assert (=> b!326531 (=> (not res!179567) (not e!201053))))

(declare-datatypes ((array!16719 0))(
  ( (array!16720 (arr!7914 (Array (_ BitVec 32) (_ BitVec 64))) (size!8266 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16719)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!326531 (= res!179567 (and (= (select (arr!7914 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8266 a!3305))))))

(declare-fun b!326532 () Bool)

(declare-fun e!201054 () Bool)

(assert (=> b!326532 (= e!201054 e!201053)))

(declare-fun res!179563 () Bool)

(assert (=> b!326532 (=> (not res!179563) (not e!201053))))

(declare-datatypes ((SeekEntryResult!3045 0))(
  ( (MissingZero!3045 (index!14356 (_ BitVec 32))) (Found!3045 (index!14357 (_ BitVec 32))) (Intermediate!3045 (undefined!3857 Bool) (index!14358 (_ BitVec 32)) (x!32603 (_ BitVec 32))) (Undefined!3045) (MissingVacant!3045 (index!14359 (_ BitVec 32))) )
))
(declare-fun lt!157344 () SeekEntryResult!3045)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16719 (_ BitVec 32)) SeekEntryResult!3045)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326532 (= res!179563 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157344))))

(assert (=> b!326532 (= lt!157344 (Intermediate!3045 false resIndex!58 resX!58))))

(declare-fun b!326533 () Bool)

(declare-fun res!179568 () Bool)

(assert (=> b!326533 (=> (not res!179568) (not e!201053))))

(assert (=> b!326533 (= res!179568 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157344))))

(declare-fun b!326534 () Bool)

(declare-fun res!179566 () Bool)

(assert (=> b!326534 (=> (not res!179566) (not e!201053))))

(assert (=> b!326534 (= res!179566 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7914 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!326535 () Bool)

(assert (=> b!326535 (= e!201053 (and (bvsge mask!3777 #b00000000000000000000000000000000) (bvslt index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsgt x!1490 #b01111111111111111111111111111110)))))

(declare-datatypes ((Unit!10124 0))(
  ( (Unit!10125) )
))
(declare-fun lt!157343 () Unit!10124)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16719 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10124)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326535 (= lt!157343 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun res!179562 () Bool)

(assert (=> start!32682 (=> (not res!179562) (not e!201054))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32682 (= res!179562 (validMask!0 mask!3777))))

(assert (=> start!32682 e!201054))

(declare-fun array_inv!5877 (array!16719) Bool)

(assert (=> start!32682 (array_inv!5877 a!3305)))

(assert (=> start!32682 true))

(declare-fun b!326536 () Bool)

(declare-fun res!179565 () Bool)

(assert (=> b!326536 (=> (not res!179565) (not e!201054))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326536 (= res!179565 (validKeyInArray!0 k0!2497))))

(declare-fun b!326537 () Bool)

(declare-fun res!179564 () Bool)

(assert (=> b!326537 (=> (not res!179564) (not e!201054))))

(declare-fun arrayContainsKey!0 (array!16719 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326537 (= res!179564 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!326538 () Bool)

(declare-fun res!179569 () Bool)

(assert (=> b!326538 (=> (not res!179569) (not e!201054))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16719 (_ BitVec 32)) SeekEntryResult!3045)

(assert (=> b!326538 (= res!179569 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3045 i!1250)))))

(declare-fun b!326539 () Bool)

(declare-fun res!179571 () Bool)

(assert (=> b!326539 (=> (not res!179571) (not e!201054))))

(assert (=> b!326539 (= res!179571 (and (= (size!8266 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8266 a!3305))))))

(declare-fun b!326540 () Bool)

(declare-fun res!179570 () Bool)

(assert (=> b!326540 (=> (not res!179570) (not e!201054))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16719 (_ BitVec 32)) Bool)

(assert (=> b!326540 (= res!179570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32682 res!179562) b!326539))

(assert (= (and b!326539 res!179571) b!326536))

(assert (= (and b!326536 res!179565) b!326537))

(assert (= (and b!326537 res!179564) b!326538))

(assert (= (and b!326538 res!179569) b!326540))

(assert (= (and b!326540 res!179570) b!326532))

(assert (= (and b!326532 res!179563) b!326531))

(assert (= (and b!326531 res!179567) b!326533))

(assert (= (and b!326533 res!179568) b!326534))

(assert (= (and b!326534 res!179566) b!326535))

(declare-fun m!333067 () Bool)

(assert (=> b!326534 m!333067))

(declare-fun m!333069 () Bool)

(assert (=> b!326536 m!333069))

(declare-fun m!333071 () Bool)

(assert (=> b!326535 m!333071))

(assert (=> b!326535 m!333071))

(declare-fun m!333073 () Bool)

(assert (=> b!326535 m!333073))

(declare-fun m!333075 () Bool)

(assert (=> b!326538 m!333075))

(declare-fun m!333077 () Bool)

(assert (=> b!326537 m!333077))

(declare-fun m!333079 () Bool)

(assert (=> b!326532 m!333079))

(assert (=> b!326532 m!333079))

(declare-fun m!333081 () Bool)

(assert (=> b!326532 m!333081))

(declare-fun m!333083 () Bool)

(assert (=> b!326540 m!333083))

(declare-fun m!333085 () Bool)

(assert (=> start!32682 m!333085))

(declare-fun m!333087 () Bool)

(assert (=> start!32682 m!333087))

(declare-fun m!333089 () Bool)

(assert (=> b!326531 m!333089))

(declare-fun m!333091 () Bool)

(assert (=> b!326533 m!333091))

(check-sat (not b!326538) (not b!326535) (not b!326533) (not b!326537) (not b!326540) (not start!32682) (not b!326536) (not b!326532))
(check-sat)
