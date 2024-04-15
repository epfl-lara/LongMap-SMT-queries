; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32480 () Bool)

(assert start!32480)

(declare-fun b!324588 () Bool)

(declare-fun res!178073 () Bool)

(declare-fun e!200230 () Bool)

(assert (=> b!324588 (=> (not res!178073) (not e!200230))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324588 (= res!178073 (validKeyInArray!0 k0!2497))))

(declare-fun b!324589 () Bool)

(declare-fun e!200231 () Bool)

(assert (=> b!324589 (= e!200230 e!200231)))

(declare-fun res!178070 () Bool)

(assert (=> b!324589 (=> (not res!178070) (not e!200231))))

(declare-datatypes ((array!16623 0))(
  ( (array!16624 (arr!7869 (Array (_ BitVec 32) (_ BitVec 64))) (size!8222 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16623)

(declare-datatypes ((SeekEntryResult!2999 0))(
  ( (MissingZero!2999 (index!14172 (_ BitVec 32))) (Found!2999 (index!14173 (_ BitVec 32))) (Intermediate!2999 (undefined!3811 Bool) (index!14174 (_ BitVec 32)) (x!32430 (_ BitVec 32))) (Undefined!2999) (MissingVacant!2999 (index!14175 (_ BitVec 32))) )
))
(declare-fun lt!156652 () SeekEntryResult!2999)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16623 (_ BitVec 32)) SeekEntryResult!2999)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324589 (= res!178070 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156652))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!324589 (= lt!156652 (Intermediate!2999 false resIndex!58 resX!58))))

(declare-fun b!324590 () Bool)

(declare-fun res!178071 () Bool)

(assert (=> b!324590 (=> (not res!178071) (not e!200231))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!324590 (= res!178071 (and (= (select (arr!7869 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8222 a!3305))))))

(declare-fun b!324591 () Bool)

(declare-fun res!178072 () Bool)

(assert (=> b!324591 (=> (not res!178072) (not e!200230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16623 (_ BitVec 32)) Bool)

(assert (=> b!324591 (= res!178072 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!178065 () Bool)

(assert (=> start!32480 (=> (not res!178065) (not e!200230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32480 (= res!178065 (validMask!0 mask!3777))))

(assert (=> start!32480 e!200230))

(declare-fun array_inv!5841 (array!16623) Bool)

(assert (=> start!32480 (array_inv!5841 a!3305)))

(assert (=> start!32480 true))

(declare-fun b!324592 () Bool)

(declare-fun res!178068 () Bool)

(assert (=> b!324592 (=> (not res!178068) (not e!200230))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16623 (_ BitVec 32)) SeekEntryResult!2999)

(assert (=> b!324592 (= res!178068 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2999 i!1250)))))

(declare-fun b!324593 () Bool)

(declare-fun res!178067 () Bool)

(assert (=> b!324593 (=> (not res!178067) (not e!200231))))

(assert (=> b!324593 (= res!178067 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7869 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!324594 () Bool)

(declare-fun res!178069 () Bool)

(assert (=> b!324594 (=> (not res!178069) (not e!200230))))

(assert (=> b!324594 (= res!178069 (and (= (size!8222 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8222 a!3305))))))

(declare-fun b!324595 () Bool)

(assert (=> b!324595 (= e!200231 false)))

(declare-fun lt!156653 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324595 (= lt!156653 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!324596 () Bool)

(declare-fun res!178066 () Bool)

(assert (=> b!324596 (=> (not res!178066) (not e!200230))))

(declare-fun arrayContainsKey!0 (array!16623 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324596 (= res!178066 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324597 () Bool)

(declare-fun res!178074 () Bool)

(assert (=> b!324597 (=> (not res!178074) (not e!200231))))

(assert (=> b!324597 (= res!178074 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156652))))

(assert (= (and start!32480 res!178065) b!324594))

(assert (= (and b!324594 res!178069) b!324588))

(assert (= (and b!324588 res!178073) b!324596))

(assert (= (and b!324596 res!178066) b!324592))

(assert (= (and b!324592 res!178068) b!324591))

(assert (= (and b!324591 res!178072) b!324589))

(assert (= (and b!324589 res!178070) b!324590))

(assert (= (and b!324590 res!178071) b!324597))

(assert (= (and b!324597 res!178074) b!324593))

(assert (= (and b!324593 res!178067) b!324595))

(declare-fun m!331093 () Bool)

(assert (=> b!324592 m!331093))

(declare-fun m!331095 () Bool)

(assert (=> b!324591 m!331095))

(declare-fun m!331097 () Bool)

(assert (=> b!324596 m!331097))

(declare-fun m!331099 () Bool)

(assert (=> b!324597 m!331099))

(declare-fun m!331101 () Bool)

(assert (=> b!324588 m!331101))

(declare-fun m!331103 () Bool)

(assert (=> start!32480 m!331103))

(declare-fun m!331105 () Bool)

(assert (=> start!32480 m!331105))

(declare-fun m!331107 () Bool)

(assert (=> b!324589 m!331107))

(assert (=> b!324589 m!331107))

(declare-fun m!331109 () Bool)

(assert (=> b!324589 m!331109))

(declare-fun m!331111 () Bool)

(assert (=> b!324595 m!331111))

(declare-fun m!331113 () Bool)

(assert (=> b!324593 m!331113))

(declare-fun m!331115 () Bool)

(assert (=> b!324590 m!331115))

(check-sat (not b!324591) (not b!324595) (not start!32480) (not b!324596) (not b!324592) (not b!324597) (not b!324588) (not b!324589))
(check-sat)
