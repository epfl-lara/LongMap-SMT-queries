; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32684 () Bool)

(assert start!32684)

(declare-fun b!326496 () Bool)

(declare-fun res!179676 () Bool)

(declare-fun e!200949 () Bool)

(assert (=> b!326496 (=> (not res!179676) (not e!200949))))

(declare-datatypes ((array!16725 0))(
  ( (array!16726 (arr!7917 (Array (_ BitVec 32) (_ BitVec 64))) (size!8270 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16725)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16725 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326496 (= res!179676 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!326497 () Bool)

(declare-fun res!179674 () Bool)

(declare-fun e!200951 () Bool)

(assert (=> b!326497 (=> (not res!179674) (not e!200951))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!326497 (= res!179674 (and (= (select (arr!7917 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8270 a!3305))))))

(declare-fun b!326498 () Bool)

(declare-fun res!179682 () Bool)

(assert (=> b!326498 (=> (not res!179682) (not e!200949))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16725 (_ BitVec 32)) Bool)

(assert (=> b!326498 (= res!179682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!326499 () Bool)

(assert (=> b!326499 (= e!200949 e!200951)))

(declare-fun res!179678 () Bool)

(assert (=> b!326499 (=> (not res!179678) (not e!200951))))

(declare-datatypes ((SeekEntryResult!3047 0))(
  ( (MissingZero!3047 (index!14364 (_ BitVec 32))) (Found!3047 (index!14365 (_ BitVec 32))) (Intermediate!3047 (undefined!3859 Bool) (index!14366 (_ BitVec 32)) (x!32624 (_ BitVec 32))) (Undefined!3047) (MissingVacant!3047 (index!14367 (_ BitVec 32))) )
))
(declare-fun lt!157157 () SeekEntryResult!3047)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16725 (_ BitVec 32)) SeekEntryResult!3047)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326499 (= res!179678 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157157))))

(assert (=> b!326499 (= lt!157157 (Intermediate!3047 false resIndex!58 resX!58))))

(declare-fun b!326500 () Bool)

(assert (=> b!326500 (= e!200951 (bvslt mask!3777 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10106 0))(
  ( (Unit!10107) )
))
(declare-fun lt!157156 () Unit!10106)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16725 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10106)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326500 (= lt!157156 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!326501 () Bool)

(declare-fun res!179680 () Bool)

(assert (=> b!326501 (=> (not res!179680) (not e!200951))))

(assert (=> b!326501 (= res!179680 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7917 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!326502 () Bool)

(declare-fun res!179677 () Bool)

(assert (=> b!326502 (=> (not res!179677) (not e!200951))))

(assert (=> b!326502 (= res!179677 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157157))))

(declare-fun b!326503 () Bool)

(declare-fun res!179673 () Bool)

(assert (=> b!326503 (=> (not res!179673) (not e!200949))))

(assert (=> b!326503 (= res!179673 (and (= (size!8270 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8270 a!3305))))))

(declare-fun res!179681 () Bool)

(assert (=> start!32684 (=> (not res!179681) (not e!200949))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32684 (= res!179681 (validMask!0 mask!3777))))

(assert (=> start!32684 e!200949))

(declare-fun array_inv!5889 (array!16725) Bool)

(assert (=> start!32684 (array_inv!5889 a!3305)))

(assert (=> start!32684 true))

(declare-fun b!326504 () Bool)

(declare-fun res!179675 () Bool)

(assert (=> b!326504 (=> (not res!179675) (not e!200949))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326504 (= res!179675 (validKeyInArray!0 k0!2497))))

(declare-fun b!326505 () Bool)

(declare-fun res!179679 () Bool)

(assert (=> b!326505 (=> (not res!179679) (not e!200949))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16725 (_ BitVec 32)) SeekEntryResult!3047)

(assert (=> b!326505 (= res!179679 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3047 i!1250)))))

(assert (= (and start!32684 res!179681) b!326503))

(assert (= (and b!326503 res!179673) b!326504))

(assert (= (and b!326504 res!179675) b!326496))

(assert (= (and b!326496 res!179676) b!326505))

(assert (= (and b!326505 res!179679) b!326498))

(assert (= (and b!326498 res!179682) b!326499))

(assert (= (and b!326499 res!179678) b!326497))

(assert (= (and b!326497 res!179674) b!326502))

(assert (= (and b!326502 res!179677) b!326501))

(assert (= (and b!326501 res!179680) b!326500))

(declare-fun m!332545 () Bool)

(assert (=> b!326496 m!332545))

(declare-fun m!332547 () Bool)

(assert (=> b!326499 m!332547))

(assert (=> b!326499 m!332547))

(declare-fun m!332549 () Bool)

(assert (=> b!326499 m!332549))

(declare-fun m!332551 () Bool)

(assert (=> b!326505 m!332551))

(declare-fun m!332553 () Bool)

(assert (=> start!32684 m!332553))

(declare-fun m!332555 () Bool)

(assert (=> start!32684 m!332555))

(declare-fun m!332557 () Bool)

(assert (=> b!326500 m!332557))

(assert (=> b!326500 m!332557))

(declare-fun m!332559 () Bool)

(assert (=> b!326500 m!332559))

(declare-fun m!332561 () Bool)

(assert (=> b!326504 m!332561))

(declare-fun m!332563 () Bool)

(assert (=> b!326498 m!332563))

(declare-fun m!332565 () Bool)

(assert (=> b!326497 m!332565))

(declare-fun m!332567 () Bool)

(assert (=> b!326501 m!332567))

(declare-fun m!332569 () Bool)

(assert (=> b!326502 m!332569))

(check-sat (not start!32684) (not b!326496) (not b!326504) (not b!326502) (not b!326498) (not b!326500) (not b!326499) (not b!326505))
(check-sat)
