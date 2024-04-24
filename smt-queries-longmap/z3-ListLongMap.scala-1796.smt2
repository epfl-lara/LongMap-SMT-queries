; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32462 () Bool)

(assert start!32462)

(declare-fun b!324541 () Bool)

(declare-fun e!200292 () Bool)

(assert (=> b!324541 (= e!200292 false)))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun lt!156851 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324541 (= lt!156851 (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777))))

(declare-fun b!324542 () Bool)

(declare-fun res!177925 () Bool)

(declare-fun e!200291 () Bool)

(assert (=> b!324542 (=> (not res!177925) (not e!200291))))

(declare-datatypes ((array!16614 0))(
  ( (array!16615 (arr!7864 (Array (_ BitVec 32) (_ BitVec 64))) (size!8216 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16614)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2960 0))(
  ( (MissingZero!2960 (index!14016 (_ BitVec 32))) (Found!2960 (index!14017 (_ BitVec 32))) (Intermediate!2960 (undefined!3772 Bool) (index!14018 (_ BitVec 32)) (x!32369 (_ BitVec 32))) (Undefined!2960) (MissingVacant!2960 (index!14019 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16614 (_ BitVec 32)) SeekEntryResult!2960)

(assert (=> b!324542 (= res!177925 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2960 i!1250)))))

(declare-fun b!324543 () Bool)

(declare-fun res!177926 () Bool)

(assert (=> b!324543 (=> (not res!177926) (not e!200291))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16614 (_ BitVec 32)) Bool)

(assert (=> b!324543 (= res!177926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324544 () Bool)

(declare-fun res!177928 () Bool)

(assert (=> b!324544 (=> (not res!177928) (not e!200291))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324544 (= res!177928 (validKeyInArray!0 k0!2497))))

(declare-fun b!324545 () Bool)

(declare-fun res!177929 () Bool)

(assert (=> b!324545 (=> (not res!177929) (not e!200292))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!324545 (= res!177929 (and (= (select (arr!7864 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8216 a!3305))))))

(declare-fun b!324546 () Bool)

(declare-fun res!177921 () Bool)

(assert (=> b!324546 (=> (not res!177921) (not e!200292))))

(assert (=> b!324546 (= res!177921 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7864 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!324547 () Bool)

(declare-fun res!177924 () Bool)

(assert (=> b!324547 (=> (not res!177924) (not e!200292))))

(declare-fun lt!156852 () SeekEntryResult!2960)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16614 (_ BitVec 32)) SeekEntryResult!2960)

(assert (=> b!324547 (= res!177924 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156852))))

(declare-fun b!324548 () Bool)

(declare-fun res!177930 () Bool)

(assert (=> b!324548 (=> (not res!177930) (not e!200291))))

(assert (=> b!324548 (= res!177930 (and (= (size!8216 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8216 a!3305))))))

(declare-fun b!324549 () Bool)

(assert (=> b!324549 (= e!200291 e!200292)))

(declare-fun res!177927 () Bool)

(assert (=> b!324549 (=> (not res!177927) (not e!200292))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324549 (= res!177927 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156852))))

(assert (=> b!324549 (= lt!156852 (Intermediate!2960 false resIndex!58 resX!58))))

(declare-fun res!177923 () Bool)

(assert (=> start!32462 (=> (not res!177923) (not e!200291))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32462 (= res!177923 (validMask!0 mask!3777))))

(assert (=> start!32462 e!200291))

(declare-fun array_inv!5814 (array!16614) Bool)

(assert (=> start!32462 (array_inv!5814 a!3305)))

(assert (=> start!32462 true))

(declare-fun b!324540 () Bool)

(declare-fun res!177922 () Bool)

(assert (=> b!324540 (=> (not res!177922) (not e!200291))))

(declare-fun arrayContainsKey!0 (array!16614 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324540 (= res!177922 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(assert (= (and start!32462 res!177923) b!324548))

(assert (= (and b!324548 res!177930) b!324544))

(assert (= (and b!324544 res!177928) b!324540))

(assert (= (and b!324540 res!177922) b!324542))

(assert (= (and b!324542 res!177925) b!324543))

(assert (= (and b!324543 res!177926) b!324549))

(assert (= (and b!324549 res!177927) b!324545))

(assert (= (and b!324545 res!177929) b!324547))

(assert (= (and b!324547 res!177924) b!324546))

(assert (= (and b!324546 res!177921) b!324541))

(declare-fun m!331789 () Bool)

(assert (=> b!324543 m!331789))

(declare-fun m!331791 () Bool)

(assert (=> b!324549 m!331791))

(assert (=> b!324549 m!331791))

(declare-fun m!331793 () Bool)

(assert (=> b!324549 m!331793))

(declare-fun m!331795 () Bool)

(assert (=> start!32462 m!331795))

(declare-fun m!331797 () Bool)

(assert (=> start!32462 m!331797))

(declare-fun m!331799 () Bool)

(assert (=> b!324545 m!331799))

(declare-fun m!331801 () Bool)

(assert (=> b!324540 m!331801))

(declare-fun m!331803 () Bool)

(assert (=> b!324541 m!331803))

(declare-fun m!331805 () Bool)

(assert (=> b!324547 m!331805))

(declare-fun m!331807 () Bool)

(assert (=> b!324544 m!331807))

(declare-fun m!331809 () Bool)

(assert (=> b!324546 m!331809))

(declare-fun m!331811 () Bool)

(assert (=> b!324542 m!331811))

(check-sat (not b!324544) (not b!324542) (not b!324549) (not b!324541) (not b!324547) (not b!324540) (not b!324543) (not start!32462))
(check-sat)
