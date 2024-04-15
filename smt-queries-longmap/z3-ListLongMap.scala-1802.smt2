; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32498 () Bool)

(assert start!32498)

(declare-fun b!324858 () Bool)

(declare-fun e!200312 () Bool)

(declare-fun e!200311 () Bool)

(assert (=> b!324858 (= e!200312 e!200311)))

(declare-fun res!178337 () Bool)

(assert (=> b!324858 (=> (not res!178337) (not e!200311))))

(declare-datatypes ((array!16641 0))(
  ( (array!16642 (arr!7878 (Array (_ BitVec 32) (_ BitVec 64))) (size!8231 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16641)

(declare-datatypes ((SeekEntryResult!3008 0))(
  ( (MissingZero!3008 (index!14208 (_ BitVec 32))) (Found!3008 (index!14209 (_ BitVec 32))) (Intermediate!3008 (undefined!3820 Bool) (index!14210 (_ BitVec 32)) (x!32463 (_ BitVec 32))) (Undefined!3008) (MissingVacant!3008 (index!14211 (_ BitVec 32))) )
))
(declare-fun lt!156707 () SeekEntryResult!3008)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16641 (_ BitVec 32)) SeekEntryResult!3008)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324858 (= res!178337 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156707))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!324858 (= lt!156707 (Intermediate!3008 false resIndex!58 resX!58))))

(declare-fun b!324859 () Bool)

(declare-fun res!178338 () Bool)

(assert (=> b!324859 (=> (not res!178338) (not e!200311))))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun index!1840 () (_ BitVec 32))

(assert (=> b!324859 (= res!178338 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156707))))

(declare-fun b!324860 () Bool)

(declare-fun res!178335 () Bool)

(assert (=> b!324860 (=> (not res!178335) (not e!200312))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16641 (_ BitVec 32)) Bool)

(assert (=> b!324860 (= res!178335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!178343 () Bool)

(assert (=> start!32498 (=> (not res!178343) (not e!200312))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32498 (= res!178343 (validMask!0 mask!3777))))

(assert (=> start!32498 e!200312))

(declare-fun array_inv!5850 (array!16641) Bool)

(assert (=> start!32498 (array_inv!5850 a!3305)))

(assert (=> start!32498 true))

(declare-fun b!324861 () Bool)

(declare-fun res!178340 () Bool)

(assert (=> b!324861 (=> (not res!178340) (not e!200312))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16641 (_ BitVec 32)) SeekEntryResult!3008)

(assert (=> b!324861 (= res!178340 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3008 i!1250)))))

(declare-fun b!324862 () Bool)

(declare-fun res!178341 () Bool)

(assert (=> b!324862 (=> (not res!178341) (not e!200311))))

(assert (=> b!324862 (= res!178341 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7878 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!324863 () Bool)

(declare-fun res!178344 () Bool)

(assert (=> b!324863 (=> (not res!178344) (not e!200312))))

(declare-fun arrayContainsKey!0 (array!16641 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324863 (= res!178344 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324864 () Bool)

(declare-fun res!178342 () Bool)

(assert (=> b!324864 (=> (not res!178342) (not e!200312))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324864 (= res!178342 (validKeyInArray!0 k0!2497))))

(declare-fun b!324865 () Bool)

(declare-fun res!178339 () Bool)

(assert (=> b!324865 (=> (not res!178339) (not e!200311))))

(assert (=> b!324865 (= res!178339 (and (= (select (arr!7878 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8231 a!3305))))))

(declare-fun b!324866 () Bool)

(declare-fun res!178336 () Bool)

(assert (=> b!324866 (=> (not res!178336) (not e!200312))))

(assert (=> b!324866 (= res!178336 (and (= (size!8231 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8231 a!3305))))))

(declare-fun b!324867 () Bool)

(assert (=> b!324867 (= e!200311 false)))

(declare-fun lt!156706 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324867 (= lt!156706 (nextIndex!0 index!1840 x!1490 mask!3777))))

(assert (= (and start!32498 res!178343) b!324866))

(assert (= (and b!324866 res!178336) b!324864))

(assert (= (and b!324864 res!178342) b!324863))

(assert (= (and b!324863 res!178344) b!324861))

(assert (= (and b!324861 res!178340) b!324860))

(assert (= (and b!324860 res!178335) b!324858))

(assert (= (and b!324858 res!178337) b!324865))

(assert (= (and b!324865 res!178339) b!324859))

(assert (= (and b!324859 res!178338) b!324862))

(assert (= (and b!324862 res!178341) b!324867))

(declare-fun m!331309 () Bool)

(assert (=> b!324860 m!331309))

(declare-fun m!331311 () Bool)

(assert (=> b!324867 m!331311))

(declare-fun m!331313 () Bool)

(assert (=> b!324858 m!331313))

(assert (=> b!324858 m!331313))

(declare-fun m!331315 () Bool)

(assert (=> b!324858 m!331315))

(declare-fun m!331317 () Bool)

(assert (=> b!324859 m!331317))

(declare-fun m!331319 () Bool)

(assert (=> b!324861 m!331319))

(declare-fun m!331321 () Bool)

(assert (=> b!324862 m!331321))

(declare-fun m!331323 () Bool)

(assert (=> b!324863 m!331323))

(declare-fun m!331325 () Bool)

(assert (=> start!32498 m!331325))

(declare-fun m!331327 () Bool)

(assert (=> start!32498 m!331327))

(declare-fun m!331329 () Bool)

(assert (=> b!324864 m!331329))

(declare-fun m!331331 () Bool)

(assert (=> b!324865 m!331331))

(check-sat (not b!324859) (not b!324860) (not start!32498) (not b!324863) (not b!324867) (not b!324858) (not b!324861) (not b!324864))
(check-sat)
