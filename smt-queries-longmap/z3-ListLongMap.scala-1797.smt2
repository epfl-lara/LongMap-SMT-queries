; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32468 () Bool)

(assert start!32468)

(declare-fun b!324630 () Bool)

(declare-fun res!178016 () Bool)

(declare-fun e!200319 () Bool)

(assert (=> b!324630 (=> (not res!178016) (not e!200319))))

(declare-datatypes ((array!16620 0))(
  ( (array!16621 (arr!7867 (Array (_ BitVec 32) (_ BitVec 64))) (size!8219 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16620)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!324630 (= res!178016 (and (= (select (arr!7867 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8219 a!3305))))))

(declare-fun b!324631 () Bool)

(declare-fun res!178013 () Bool)

(assert (=> b!324631 (=> (not res!178013) (not e!200319))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2963 0))(
  ( (MissingZero!2963 (index!14028 (_ BitVec 32))) (Found!2963 (index!14029 (_ BitVec 32))) (Intermediate!2963 (undefined!3775 Bool) (index!14030 (_ BitVec 32)) (x!32380 (_ BitVec 32))) (Undefined!2963) (MissingVacant!2963 (index!14031 (_ BitVec 32))) )
))
(declare-fun lt!156869 () SeekEntryResult!2963)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16620 (_ BitVec 32)) SeekEntryResult!2963)

(assert (=> b!324631 (= res!178013 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156869))))

(declare-fun b!324632 () Bool)

(declare-fun res!178014 () Bool)

(declare-fun e!200318 () Bool)

(assert (=> b!324632 (=> (not res!178014) (not e!200318))))

(assert (=> b!324632 (= res!178014 (and (= (size!8219 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8219 a!3305))))))

(declare-fun b!324633 () Bool)

(assert (=> b!324633 (= e!200319 false)))

(declare-fun lt!156870 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324633 (= lt!156870 (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777))))

(declare-fun b!324634 () Bool)

(declare-fun res!178011 () Bool)

(assert (=> b!324634 (=> (not res!178011) (not e!200318))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16620 (_ BitVec 32)) SeekEntryResult!2963)

(assert (=> b!324634 (= res!178011 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2963 i!1250)))))

(declare-fun b!324636 () Bool)

(declare-fun res!178012 () Bool)

(assert (=> b!324636 (=> (not res!178012) (not e!200318))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324636 (= res!178012 (validKeyInArray!0 k0!2497))))

(declare-fun b!324637 () Bool)

(declare-fun res!178020 () Bool)

(assert (=> b!324637 (=> (not res!178020) (not e!200318))))

(declare-fun arrayContainsKey!0 (array!16620 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324637 (= res!178020 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324638 () Bool)

(declare-fun res!178015 () Bool)

(assert (=> b!324638 (=> (not res!178015) (not e!200319))))

(assert (=> b!324638 (= res!178015 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7867 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!324639 () Bool)

(declare-fun res!178018 () Bool)

(assert (=> b!324639 (=> (not res!178018) (not e!200318))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16620 (_ BitVec 32)) Bool)

(assert (=> b!324639 (= res!178018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324635 () Bool)

(assert (=> b!324635 (= e!200318 e!200319)))

(declare-fun res!178017 () Bool)

(assert (=> b!324635 (=> (not res!178017) (not e!200319))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324635 (= res!178017 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156869))))

(assert (=> b!324635 (= lt!156869 (Intermediate!2963 false resIndex!58 resX!58))))

(declare-fun res!178019 () Bool)

(assert (=> start!32468 (=> (not res!178019) (not e!200318))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32468 (= res!178019 (validMask!0 mask!3777))))

(assert (=> start!32468 e!200318))

(declare-fun array_inv!5817 (array!16620) Bool)

(assert (=> start!32468 (array_inv!5817 a!3305)))

(assert (=> start!32468 true))

(assert (= (and start!32468 res!178019) b!324632))

(assert (= (and b!324632 res!178014) b!324636))

(assert (= (and b!324636 res!178012) b!324637))

(assert (= (and b!324637 res!178020) b!324634))

(assert (= (and b!324634 res!178011) b!324639))

(assert (= (and b!324639 res!178018) b!324635))

(assert (= (and b!324635 res!178017) b!324630))

(assert (= (and b!324630 res!178016) b!324631))

(assert (= (and b!324631 res!178013) b!324638))

(assert (= (and b!324638 res!178015) b!324633))

(declare-fun m!331861 () Bool)

(assert (=> b!324637 m!331861))

(declare-fun m!331863 () Bool)

(assert (=> b!324638 m!331863))

(declare-fun m!331865 () Bool)

(assert (=> b!324633 m!331865))

(declare-fun m!331867 () Bool)

(assert (=> b!324639 m!331867))

(declare-fun m!331869 () Bool)

(assert (=> b!324636 m!331869))

(declare-fun m!331871 () Bool)

(assert (=> b!324635 m!331871))

(assert (=> b!324635 m!331871))

(declare-fun m!331873 () Bool)

(assert (=> b!324635 m!331873))

(declare-fun m!331875 () Bool)

(assert (=> b!324630 m!331875))

(declare-fun m!331877 () Bool)

(assert (=> b!324631 m!331877))

(declare-fun m!331879 () Bool)

(assert (=> start!32468 m!331879))

(declare-fun m!331881 () Bool)

(assert (=> start!32468 m!331881))

(declare-fun m!331883 () Bool)

(assert (=> b!324634 m!331883))

(check-sat (not b!324633) (not b!324639) (not b!324637) (not b!324631) (not b!324635) (not b!324634) (not start!32468) (not b!324636))
(check-sat)
