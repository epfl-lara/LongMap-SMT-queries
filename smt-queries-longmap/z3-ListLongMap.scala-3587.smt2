; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49354 () Bool)

(assert start!49354)

(declare-fun b!543242 () Bool)

(declare-fun res!337691 () Bool)

(declare-fun e!314298 () Bool)

(assert (=> b!543242 (=> (not res!337691) (not e!314298))))

(declare-datatypes ((array!34310 0))(
  ( (array!34311 (arr!16486 (Array (_ BitVec 32) (_ BitVec 64))) (size!16850 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34310)

(declare-datatypes ((List!10512 0))(
  ( (Nil!10509) (Cons!10508 (h!11466 (_ BitVec 64)) (t!16732 List!10512)) )
))
(declare-fun arrayNoDuplicates!0 (array!34310 (_ BitVec 32) List!10512) Bool)

(assert (=> b!543242 (= res!337691 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10509))))

(declare-fun b!543243 () Bool)

(declare-fun res!337694 () Bool)

(assert (=> b!543243 (=> (not res!337694) (not e!314298))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34310 (_ BitVec 32)) Bool)

(assert (=> b!543243 (= res!337694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!543244 () Bool)

(declare-fun res!337693 () Bool)

(declare-fun e!314295 () Bool)

(assert (=> b!543244 (=> (not res!337693) (not e!314295))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!543244 (= res!337693 (and (= (size!16850 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16850 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16850 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!543245 () Bool)

(declare-fun e!314296 () Bool)

(assert (=> b!543245 (= e!314298 e!314296)))

(declare-fun res!337688 () Bool)

(assert (=> b!543245 (=> (not res!337688) (not e!314296))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4900 0))(
  ( (MissingZero!4900 (index!21824 (_ BitVec 32))) (Found!4900 (index!21825 (_ BitVec 32))) (Intermediate!4900 (undefined!5712 Bool) (index!21826 (_ BitVec 32)) (x!50886 (_ BitVec 32))) (Undefined!4900) (MissingVacant!4900 (index!21827 (_ BitVec 32))) )
))
(declare-fun lt!248180 () SeekEntryResult!4900)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!543245 (= res!337688 (= lt!248180 (Intermediate!4900 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34310 (_ BitVec 32)) SeekEntryResult!4900)

(assert (=> b!543245 (= lt!248180 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16486 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!337696 () Bool)

(assert (=> start!49354 (=> (not res!337696) (not e!314295))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49354 (= res!337696 (validMask!0 mask!3216))))

(assert (=> start!49354 e!314295))

(assert (=> start!49354 true))

(declare-fun array_inv!12345 (array!34310) Bool)

(assert (=> start!49354 (array_inv!12345 a!3154)))

(declare-fun b!543246 () Bool)

(declare-fun res!337697 () Bool)

(assert (=> b!543246 (=> (not res!337697) (not e!314296))))

(assert (=> b!543246 (= res!337697 (and (not (= (select (arr!16486 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16486 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16486 a!3154) index!1177) (select (arr!16486 a!3154) j!147)))))))

(declare-fun b!543247 () Bool)

(declare-fun res!337699 () Bool)

(assert (=> b!543247 (=> (not res!337699) (not e!314295))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!543247 (= res!337699 (validKeyInArray!0 (select (arr!16486 a!3154) j!147)))))

(declare-fun b!543248 () Bool)

(declare-fun res!337692 () Bool)

(assert (=> b!543248 (=> (not res!337692) (not e!314296))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543248 (= res!337692 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16486 a!3154) j!147) mask!3216) (select (arr!16486 a!3154) j!147) a!3154 mask!3216) lt!248180))))

(declare-fun b!543249 () Bool)

(declare-fun res!337695 () Bool)

(assert (=> b!543249 (=> (not res!337695) (not e!314295))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34310 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!543249 (= res!337695 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!543250 () Bool)

(assert (=> b!543250 (= e!314295 e!314298)))

(declare-fun res!337689 () Bool)

(assert (=> b!543250 (=> (not res!337689) (not e!314298))))

(declare-fun lt!248182 () SeekEntryResult!4900)

(assert (=> b!543250 (= res!337689 (or (= lt!248182 (MissingZero!4900 i!1153)) (= lt!248182 (MissingVacant!4900 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34310 (_ BitVec 32)) SeekEntryResult!4900)

(assert (=> b!543250 (= lt!248182 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!543251 () Bool)

(declare-fun res!337690 () Bool)

(assert (=> b!543251 (=> (not res!337690) (not e!314295))))

(assert (=> b!543251 (= res!337690 (validKeyInArray!0 k0!1998))))

(declare-fun b!543252 () Bool)

(assert (=> b!543252 (= e!314296 false)))

(declare-fun lt!248181 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543252 (= lt!248181 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun b!543253 () Bool)

(declare-fun res!337698 () Bool)

(assert (=> b!543253 (=> (not res!337698) (not e!314298))))

(assert (=> b!543253 (= res!337698 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16850 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16850 a!3154)) (= (select (arr!16486 a!3154) resIndex!32) (select (arr!16486 a!3154) j!147))))))

(assert (= (and start!49354 res!337696) b!543244))

(assert (= (and b!543244 res!337693) b!543247))

(assert (= (and b!543247 res!337699) b!543251))

(assert (= (and b!543251 res!337690) b!543249))

(assert (= (and b!543249 res!337695) b!543250))

(assert (= (and b!543250 res!337689) b!543243))

(assert (= (and b!543243 res!337694) b!543242))

(assert (= (and b!543242 res!337691) b!543253))

(assert (= (and b!543253 res!337698) b!543245))

(assert (= (and b!543245 res!337688) b!543248))

(assert (= (and b!543248 res!337692) b!543246))

(assert (= (and b!543246 res!337697) b!543252))

(declare-fun m!521521 () Bool)

(assert (=> b!543247 m!521521))

(assert (=> b!543247 m!521521))

(declare-fun m!521523 () Bool)

(assert (=> b!543247 m!521523))

(declare-fun m!521525 () Bool)

(assert (=> b!543249 m!521525))

(declare-fun m!521527 () Bool)

(assert (=> b!543252 m!521527))

(declare-fun m!521529 () Bool)

(assert (=> b!543251 m!521529))

(declare-fun m!521531 () Bool)

(assert (=> b!543250 m!521531))

(declare-fun m!521533 () Bool)

(assert (=> b!543243 m!521533))

(assert (=> b!543248 m!521521))

(assert (=> b!543248 m!521521))

(declare-fun m!521535 () Bool)

(assert (=> b!543248 m!521535))

(assert (=> b!543248 m!521535))

(assert (=> b!543248 m!521521))

(declare-fun m!521537 () Bool)

(assert (=> b!543248 m!521537))

(declare-fun m!521539 () Bool)

(assert (=> start!49354 m!521539))

(declare-fun m!521541 () Bool)

(assert (=> start!49354 m!521541))

(declare-fun m!521543 () Bool)

(assert (=> b!543242 m!521543))

(assert (=> b!543245 m!521521))

(assert (=> b!543245 m!521521))

(declare-fun m!521545 () Bool)

(assert (=> b!543245 m!521545))

(declare-fun m!521547 () Bool)

(assert (=> b!543246 m!521547))

(assert (=> b!543246 m!521521))

(declare-fun m!521549 () Bool)

(assert (=> b!543253 m!521549))

(assert (=> b!543253 m!521521))

(check-sat (not b!543247) (not b!543250) (not b!543243) (not b!543242) (not start!49354) (not b!543251) (not b!543248) (not b!543252) (not b!543249) (not b!543245))
(check-sat)
