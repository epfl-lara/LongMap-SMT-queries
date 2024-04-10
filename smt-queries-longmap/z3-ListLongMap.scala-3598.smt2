; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49520 () Bool)

(assert start!49520)

(declare-fun b!544998 () Bool)

(declare-fun res!339108 () Bool)

(declare-fun e!315045 () Bool)

(assert (=> b!544998 (=> (not res!339108) (not e!315045))))

(declare-datatypes ((array!34390 0))(
  ( (array!34391 (arr!16525 (Array (_ BitVec 32) (_ BitVec 64))) (size!16889 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34390)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!544998 (= res!339108 (validKeyInArray!0 (select (arr!16525 a!3154) j!147)))))

(declare-fun b!544999 () Bool)

(declare-fun e!315044 () Bool)

(assert (=> b!544999 (= e!315044 false)))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun lt!248670 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!544999 (= lt!248670 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!545000 () Bool)

(declare-fun res!339112 () Bool)

(declare-fun e!315043 () Bool)

(assert (=> b!545000 (=> (not res!339112) (not e!315043))))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!545000 (= res!339112 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16889 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16889 a!3154)) (= (select (arr!16525 a!3154) resIndex!32) (select (arr!16525 a!3154) j!147))))))

(declare-fun b!545001 () Bool)

(assert (=> b!545001 (= e!315045 e!315043)))

(declare-fun res!339105 () Bool)

(assert (=> b!545001 (=> (not res!339105) (not e!315043))))

(declare-datatypes ((SeekEntryResult!4983 0))(
  ( (MissingZero!4983 (index!22156 (_ BitVec 32))) (Found!4983 (index!22157 (_ BitVec 32))) (Intermediate!4983 (undefined!5795 Bool) (index!22158 (_ BitVec 32)) (x!51078 (_ BitVec 32))) (Undefined!4983) (MissingVacant!4983 (index!22159 (_ BitVec 32))) )
))
(declare-fun lt!248671 () SeekEntryResult!4983)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!545001 (= res!339105 (or (= lt!248671 (MissingZero!4983 i!1153)) (= lt!248671 (MissingVacant!4983 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34390 (_ BitVec 32)) SeekEntryResult!4983)

(assert (=> b!545001 (= lt!248671 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun res!339109 () Bool)

(assert (=> start!49520 (=> (not res!339109) (not e!315045))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49520 (= res!339109 (validMask!0 mask!3216))))

(assert (=> start!49520 e!315045))

(assert (=> start!49520 true))

(declare-fun array_inv!12321 (array!34390) Bool)

(assert (=> start!49520 (array_inv!12321 a!3154)))

(declare-fun b!545002 () Bool)

(declare-fun res!339102 () Bool)

(assert (=> b!545002 (=> (not res!339102) (not e!315044))))

(assert (=> b!545002 (= res!339102 (and (not (= (select (arr!16525 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16525 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16525 a!3154) index!1177) (select (arr!16525 a!3154) j!147)))))))

(declare-fun b!545003 () Bool)

(declare-fun res!339106 () Bool)

(assert (=> b!545003 (=> (not res!339106) (not e!315045))))

(assert (=> b!545003 (= res!339106 (validKeyInArray!0 k0!1998))))

(declare-fun b!545004 () Bool)

(declare-fun res!339113 () Bool)

(assert (=> b!545004 (=> (not res!339113) (not e!315045))))

(declare-fun arrayContainsKey!0 (array!34390 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!545004 (= res!339113 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!545005 () Bool)

(assert (=> b!545005 (= e!315043 e!315044)))

(declare-fun res!339111 () Bool)

(assert (=> b!545005 (=> (not res!339111) (not e!315044))))

(declare-fun lt!248669 () SeekEntryResult!4983)

(assert (=> b!545005 (= res!339111 (= lt!248669 (Intermediate!4983 false resIndex!32 resX!32)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34390 (_ BitVec 32)) SeekEntryResult!4983)

(assert (=> b!545005 (= lt!248669 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16525 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545006 () Bool)

(declare-fun res!339107 () Bool)

(assert (=> b!545006 (=> (not res!339107) (not e!315045))))

(assert (=> b!545006 (= res!339107 (and (= (size!16889 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16889 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16889 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!545007 () Bool)

(declare-fun res!339110 () Bool)

(assert (=> b!545007 (=> (not res!339110) (not e!315044))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545007 (= res!339110 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16525 a!3154) j!147) mask!3216) (select (arr!16525 a!3154) j!147) a!3154 mask!3216) lt!248669))))

(declare-fun b!545008 () Bool)

(declare-fun res!339103 () Bool)

(assert (=> b!545008 (=> (not res!339103) (not e!315043))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34390 (_ BitVec 32)) Bool)

(assert (=> b!545008 (= res!339103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!545009 () Bool)

(declare-fun res!339104 () Bool)

(assert (=> b!545009 (=> (not res!339104) (not e!315043))))

(declare-datatypes ((List!10644 0))(
  ( (Nil!10641) (Cons!10640 (h!11601 (_ BitVec 64)) (t!16872 List!10644)) )
))
(declare-fun arrayNoDuplicates!0 (array!34390 (_ BitVec 32) List!10644) Bool)

(assert (=> b!545009 (= res!339104 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10641))))

(assert (= (and start!49520 res!339109) b!545006))

(assert (= (and b!545006 res!339107) b!544998))

(assert (= (and b!544998 res!339108) b!545003))

(assert (= (and b!545003 res!339106) b!545004))

(assert (= (and b!545004 res!339113) b!545001))

(assert (= (and b!545001 res!339105) b!545008))

(assert (= (and b!545008 res!339103) b!545009))

(assert (= (and b!545009 res!339104) b!545000))

(assert (= (and b!545000 res!339112) b!545005))

(assert (= (and b!545005 res!339111) b!545007))

(assert (= (and b!545007 res!339110) b!545002))

(assert (= (and b!545002 res!339102) b!544999))

(declare-fun m!522723 () Bool)

(assert (=> b!545009 m!522723))

(declare-fun m!522725 () Bool)

(assert (=> b!545002 m!522725))

(declare-fun m!522727 () Bool)

(assert (=> b!545002 m!522727))

(declare-fun m!522729 () Bool)

(assert (=> b!545004 m!522729))

(declare-fun m!522731 () Bool)

(assert (=> start!49520 m!522731))

(declare-fun m!522733 () Bool)

(assert (=> start!49520 m!522733))

(declare-fun m!522735 () Bool)

(assert (=> b!545001 m!522735))

(declare-fun m!522737 () Bool)

(assert (=> b!545008 m!522737))

(declare-fun m!522739 () Bool)

(assert (=> b!545003 m!522739))

(assert (=> b!544998 m!522727))

(assert (=> b!544998 m!522727))

(declare-fun m!522741 () Bool)

(assert (=> b!544998 m!522741))

(declare-fun m!522743 () Bool)

(assert (=> b!544999 m!522743))

(assert (=> b!545007 m!522727))

(assert (=> b!545007 m!522727))

(declare-fun m!522745 () Bool)

(assert (=> b!545007 m!522745))

(assert (=> b!545007 m!522745))

(assert (=> b!545007 m!522727))

(declare-fun m!522747 () Bool)

(assert (=> b!545007 m!522747))

(assert (=> b!545005 m!522727))

(assert (=> b!545005 m!522727))

(declare-fun m!522749 () Bool)

(assert (=> b!545005 m!522749))

(declare-fun m!522751 () Bool)

(assert (=> b!545000 m!522751))

(assert (=> b!545000 m!522727))

(check-sat (not b!545001) (not b!545007) (not b!545003) (not b!545008) (not b!545009) (not b!544999) (not b!545004) (not b!544998) (not start!49520) (not b!545005))
(check-sat)
