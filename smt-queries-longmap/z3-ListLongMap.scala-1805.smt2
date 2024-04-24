; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32516 () Bool)

(assert start!32516)

(declare-fun b!325350 () Bool)

(declare-fun res!178736 () Bool)

(declare-fun e!200533 () Bool)

(assert (=> b!325350 (=> (not res!178736) (not e!200533))))

(declare-datatypes ((array!16668 0))(
  ( (array!16669 (arr!7891 (Array (_ BitVec 32) (_ BitVec 64))) (size!8243 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16668)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!325350 (= res!178736 (and (= (select (arr!7891 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8243 a!3305))))))

(declare-fun b!325351 () Bool)

(declare-fun res!178733 () Bool)

(declare-fun e!200535 () Bool)

(assert (=> b!325351 (=> (not res!178733) (not e!200535))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16668 (_ BitVec 32)) Bool)

(assert (=> b!325351 (= res!178733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!325353 () Bool)

(declare-fun res!178734 () Bool)

(assert (=> b!325353 (=> (not res!178734) (not e!200535))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!325353 (= res!178734 (validKeyInArray!0 k0!2497))))

(declare-fun b!325354 () Bool)

(declare-fun res!178732 () Bool)

(assert (=> b!325354 (=> (not res!178732) (not e!200535))))

(declare-fun arrayContainsKey!0 (array!16668 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!325354 (= res!178732 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!325355 () Bool)

(assert (=> b!325355 (= e!200533 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1490) resX!58) (bvslt (bvadd #b00000000000000000000000000000001 x!1490) #b00000000000000000000000000000000)))))

(declare-fun lt!157014 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325355 (= lt!157014 (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777))))

(declare-fun b!325356 () Bool)

(declare-fun res!178738 () Bool)

(assert (=> b!325356 (=> (not res!178738) (not e!200535))))

(declare-datatypes ((SeekEntryResult!2987 0))(
  ( (MissingZero!2987 (index!14124 (_ BitVec 32))) (Found!2987 (index!14125 (_ BitVec 32))) (Intermediate!2987 (undefined!3799 Bool) (index!14126 (_ BitVec 32)) (x!32468 (_ BitVec 32))) (Undefined!2987) (MissingVacant!2987 (index!14127 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16668 (_ BitVec 32)) SeekEntryResult!2987)

(assert (=> b!325356 (= res!178738 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2987 i!1250)))))

(declare-fun b!325357 () Bool)

(declare-fun res!178731 () Bool)

(assert (=> b!325357 (=> (not res!178731) (not e!200535))))

(assert (=> b!325357 (= res!178731 (and (= (size!8243 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8243 a!3305))))))

(declare-fun res!178735 () Bool)

(assert (=> start!32516 (=> (not res!178735) (not e!200535))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32516 (= res!178735 (validMask!0 mask!3777))))

(assert (=> start!32516 e!200535))

(declare-fun array_inv!5841 (array!16668) Bool)

(assert (=> start!32516 (array_inv!5841 a!3305)))

(assert (=> start!32516 true))

(declare-fun b!325352 () Bool)

(assert (=> b!325352 (= e!200535 e!200533)))

(declare-fun res!178739 () Bool)

(assert (=> b!325352 (=> (not res!178739) (not e!200533))))

(declare-fun lt!157013 () SeekEntryResult!2987)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16668 (_ BitVec 32)) SeekEntryResult!2987)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325352 (= res!178739 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157013))))

(assert (=> b!325352 (= lt!157013 (Intermediate!2987 false resIndex!58 resX!58))))

(declare-fun b!325358 () Bool)

(declare-fun res!178737 () Bool)

(assert (=> b!325358 (=> (not res!178737) (not e!200533))))

(assert (=> b!325358 (= res!178737 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7891 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!325359 () Bool)

(declare-fun res!178740 () Bool)

(assert (=> b!325359 (=> (not res!178740) (not e!200533))))

(assert (=> b!325359 (= res!178740 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157013))))

(assert (= (and start!32516 res!178735) b!325357))

(assert (= (and b!325357 res!178731) b!325353))

(assert (= (and b!325353 res!178734) b!325354))

(assert (= (and b!325354 res!178732) b!325356))

(assert (= (and b!325356 res!178738) b!325351))

(assert (= (and b!325351 res!178733) b!325352))

(assert (= (and b!325352 res!178739) b!325350))

(assert (= (and b!325350 res!178736) b!325359))

(assert (= (and b!325359 res!178740) b!325358))

(assert (= (and b!325358 res!178737) b!325355))

(declare-fun m!332437 () Bool)

(assert (=> b!325353 m!332437))

(declare-fun m!332439 () Bool)

(assert (=> b!325350 m!332439))

(declare-fun m!332441 () Bool)

(assert (=> b!325356 m!332441))

(declare-fun m!332443 () Bool)

(assert (=> start!32516 m!332443))

(declare-fun m!332445 () Bool)

(assert (=> start!32516 m!332445))

(declare-fun m!332447 () Bool)

(assert (=> b!325358 m!332447))

(declare-fun m!332449 () Bool)

(assert (=> b!325354 m!332449))

(declare-fun m!332451 () Bool)

(assert (=> b!325352 m!332451))

(assert (=> b!325352 m!332451))

(declare-fun m!332453 () Bool)

(assert (=> b!325352 m!332453))

(declare-fun m!332455 () Bool)

(assert (=> b!325351 m!332455))

(declare-fun m!332457 () Bool)

(assert (=> b!325355 m!332457))

(declare-fun m!332459 () Bool)

(assert (=> b!325359 m!332459))

(check-sat (not b!325354) (not b!325359) (not b!325356) (not b!325353) (not b!325352) (not b!325355) (not start!32516) (not b!325351))
(check-sat)
