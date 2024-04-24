; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32678 () Bool)

(assert start!32678)

(declare-fun b!326628 () Bool)

(declare-fun res!179711 () Bool)

(declare-fun e!201065 () Bool)

(assert (=> b!326628 (=> (not res!179711) (not e!201065))))

(declare-datatypes ((array!16728 0))(
  ( (array!16729 (arr!7918 (Array (_ BitVec 32) (_ BitVec 64))) (size!8270 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16728)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!326628 (= res!179711 (and (= (size!8270 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8270 a!3305))))))

(declare-fun b!326629 () Bool)

(declare-fun res!179710 () Bool)

(assert (=> b!326629 (=> (not res!179710) (not e!201065))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326629 (= res!179710 (validKeyInArray!0 k0!2497))))

(declare-fun b!326630 () Bool)

(declare-fun res!179718 () Bool)

(declare-fun e!201064 () Bool)

(assert (=> b!326630 (=> (not res!179718) (not e!201064))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!326630 (= res!179718 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7918 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun res!179716 () Bool)

(assert (=> start!32678 (=> (not res!179716) (not e!201065))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32678 (= res!179716 (validMask!0 mask!3777))))

(assert (=> start!32678 e!201065))

(declare-fun array_inv!5868 (array!16728) Bool)

(assert (=> start!32678 (array_inv!5868 a!3305)))

(assert (=> start!32678 true))

(declare-fun b!326631 () Bool)

(assert (=> b!326631 (= e!201065 e!201064)))

(declare-fun res!179714 () Bool)

(assert (=> b!326631 (=> (not res!179714) (not e!201064))))

(declare-datatypes ((SeekEntryResult!3014 0))(
  ( (MissingZero!3014 (index!14232 (_ BitVec 32))) (Found!3014 (index!14233 (_ BitVec 32))) (Intermediate!3014 (undefined!3826 Bool) (index!14234 (_ BitVec 32)) (x!32585 (_ BitVec 32))) (Undefined!3014) (MissingVacant!3014 (index!14235 (_ BitVec 32))) )
))
(declare-fun lt!157392 () SeekEntryResult!3014)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16728 (_ BitVec 32)) SeekEntryResult!3014)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326631 (= res!179714 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157392))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!326631 (= lt!157392 (Intermediate!3014 false resIndex!58 resX!58))))

(declare-fun b!326632 () Bool)

(declare-fun res!179709 () Bool)

(assert (=> b!326632 (=> (not res!179709) (not e!201064))))

(assert (=> b!326632 (= res!179709 (and (= (select (arr!7918 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8270 a!3305))))))

(declare-fun b!326633 () Bool)

(declare-fun res!179717 () Bool)

(assert (=> b!326633 (=> (not res!179717) (not e!201065))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16728 (_ BitVec 32)) SeekEntryResult!3014)

(assert (=> b!326633 (= res!179717 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3014 i!1250)))))

(declare-fun b!326634 () Bool)

(assert (=> b!326634 (= e!201064 false)))

(declare-datatypes ((Unit!10096 0))(
  ( (Unit!10097) )
))
(declare-fun lt!157391 () Unit!10096)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16728 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10096)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326634 (= lt!157391 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!326635 () Bool)

(declare-fun res!179713 () Bool)

(assert (=> b!326635 (=> (not res!179713) (not e!201064))))

(assert (=> b!326635 (= res!179713 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157392))))

(declare-fun b!326636 () Bool)

(declare-fun res!179715 () Bool)

(assert (=> b!326636 (=> (not res!179715) (not e!201065))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16728 (_ BitVec 32)) Bool)

(assert (=> b!326636 (= res!179715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!326637 () Bool)

(declare-fun res!179712 () Bool)

(assert (=> b!326637 (=> (not res!179712) (not e!201065))))

(declare-fun arrayContainsKey!0 (array!16728 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326637 (= res!179712 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(assert (= (and start!32678 res!179716) b!326628))

(assert (= (and b!326628 res!179711) b!326629))

(assert (= (and b!326629 res!179710) b!326637))

(assert (= (and b!326637 res!179712) b!326633))

(assert (= (and b!326633 res!179717) b!326636))

(assert (= (and b!326636 res!179715) b!326631))

(assert (= (and b!326631 res!179714) b!326632))

(assert (= (and b!326632 res!179709) b!326635))

(assert (= (and b!326635 res!179713) b!326630))

(assert (= (and b!326630 res!179718) b!326634))

(declare-fun m!333391 () Bool)

(assert (=> b!326630 m!333391))

(declare-fun m!333393 () Bool)

(assert (=> b!326636 m!333393))

(declare-fun m!333395 () Bool)

(assert (=> b!326631 m!333395))

(assert (=> b!326631 m!333395))

(declare-fun m!333397 () Bool)

(assert (=> b!326631 m!333397))

(declare-fun m!333399 () Bool)

(assert (=> b!326632 m!333399))

(declare-fun m!333401 () Bool)

(assert (=> b!326637 m!333401))

(declare-fun m!333403 () Bool)

(assert (=> b!326634 m!333403))

(assert (=> b!326634 m!333403))

(declare-fun m!333405 () Bool)

(assert (=> b!326634 m!333405))

(declare-fun m!333407 () Bool)

(assert (=> start!32678 m!333407))

(declare-fun m!333409 () Bool)

(assert (=> start!32678 m!333409))

(declare-fun m!333411 () Bool)

(assert (=> b!326635 m!333411))

(declare-fun m!333413 () Bool)

(assert (=> b!326633 m!333413))

(declare-fun m!333415 () Bool)

(assert (=> b!326629 m!333415))

(check-sat (not b!326631) (not b!326634) (not b!326637) (not b!326633) (not b!326635) (not b!326636) (not start!32678) (not b!326629))
(check-sat)
