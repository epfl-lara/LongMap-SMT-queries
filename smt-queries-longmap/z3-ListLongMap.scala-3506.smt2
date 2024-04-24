; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48598 () Bool)

(assert start!48598)

(declare-fun b!533725 () Bool)

(declare-fun res!328985 () Bool)

(declare-fun e!310479 () Bool)

(assert (=> b!533725 (=> (not res!328985) (not e!310479))))

(declare-datatypes ((array!33809 0))(
  ( (array!33810 (arr!16243 (Array (_ BitVec 32) (_ BitVec 64))) (size!16607 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33809)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533725 (= res!328985 (validKeyInArray!0 (select (arr!16243 a!3154) j!147)))))

(declare-fun b!533726 () Bool)

(declare-fun res!328984 () Bool)

(declare-fun e!310477 () Bool)

(assert (=> b!533726 (=> (not res!328984) (not e!310477))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33809 (_ BitVec 32)) Bool)

(assert (=> b!533726 (= res!328984 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533727 () Bool)

(declare-fun res!328987 () Bool)

(assert (=> b!533727 (=> (not res!328987) (not e!310477))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4657 0))(
  ( (MissingZero!4657 (index!20852 (_ BitVec 32))) (Found!4657 (index!20853 (_ BitVec 32))) (Intermediate!4657 (undefined!5469 Bool) (index!20854 (_ BitVec 32)) (x!49965 (_ BitVec 32))) (Undefined!4657) (MissingVacant!4657 (index!20855 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33809 (_ BitVec 32)) SeekEntryResult!4657)

(assert (=> b!533727 (= res!328987 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16243 a!3154) j!147) a!3154 mask!3216) (Intermediate!4657 false resIndex!32 resX!32)))))

(declare-fun b!533728 () Bool)

(assert (=> b!533728 (= e!310477 false)))

(declare-fun lt!245515 () SeekEntryResult!4657)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!533728 (= lt!245515 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16243 a!3154) j!147) mask!3216) (select (arr!16243 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!328993 () Bool)

(assert (=> start!48598 (=> (not res!328993) (not e!310479))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48598 (= res!328993 (validMask!0 mask!3216))))

(assert (=> start!48598 e!310479))

(assert (=> start!48598 true))

(declare-fun array_inv!12102 (array!33809) Bool)

(assert (=> start!48598 (array_inv!12102 a!3154)))

(declare-fun b!533729 () Bool)

(declare-fun res!328990 () Bool)

(assert (=> b!533729 (=> (not res!328990) (not e!310477))))

(assert (=> b!533729 (= res!328990 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16607 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16607 a!3154)) (= (select (arr!16243 a!3154) resIndex!32) (select (arr!16243 a!3154) j!147))))))

(declare-fun b!533730 () Bool)

(declare-fun res!328986 () Bool)

(assert (=> b!533730 (=> (not res!328986) (not e!310479))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33809 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533730 (= res!328986 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533731 () Bool)

(assert (=> b!533731 (= e!310479 e!310477)))

(declare-fun res!328989 () Bool)

(assert (=> b!533731 (=> (not res!328989) (not e!310477))))

(declare-fun lt!245514 () SeekEntryResult!4657)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533731 (= res!328989 (or (= lt!245514 (MissingZero!4657 i!1153)) (= lt!245514 (MissingVacant!4657 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33809 (_ BitVec 32)) SeekEntryResult!4657)

(assert (=> b!533731 (= lt!245514 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!533732 () Bool)

(declare-fun res!328988 () Bool)

(assert (=> b!533732 (=> (not res!328988) (not e!310479))))

(assert (=> b!533732 (= res!328988 (and (= (size!16607 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16607 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16607 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533733 () Bool)

(declare-fun res!328992 () Bool)

(assert (=> b!533733 (=> (not res!328992) (not e!310479))))

(assert (=> b!533733 (= res!328992 (validKeyInArray!0 k0!1998))))

(declare-fun b!533734 () Bool)

(declare-fun res!328991 () Bool)

(assert (=> b!533734 (=> (not res!328991) (not e!310477))))

(declare-datatypes ((List!10269 0))(
  ( (Nil!10266) (Cons!10265 (h!11208 (_ BitVec 64)) (t!16489 List!10269)) )
))
(declare-fun arrayNoDuplicates!0 (array!33809 (_ BitVec 32) List!10269) Bool)

(assert (=> b!533734 (= res!328991 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10266))))

(assert (= (and start!48598 res!328993) b!533732))

(assert (= (and b!533732 res!328988) b!533725))

(assert (= (and b!533725 res!328985) b!533733))

(assert (= (and b!533733 res!328992) b!533730))

(assert (= (and b!533730 res!328986) b!533731))

(assert (= (and b!533731 res!328989) b!533726))

(assert (= (and b!533726 res!328984) b!533734))

(assert (= (and b!533734 res!328991) b!533729))

(assert (= (and b!533729 res!328990) b!533727))

(assert (= (and b!533727 res!328987) b!533728))

(declare-fun m!513775 () Bool)

(assert (=> start!48598 m!513775))

(declare-fun m!513777 () Bool)

(assert (=> start!48598 m!513777))

(declare-fun m!513779 () Bool)

(assert (=> b!533726 m!513779))

(declare-fun m!513781 () Bool)

(assert (=> b!533729 m!513781))

(declare-fun m!513783 () Bool)

(assert (=> b!533729 m!513783))

(declare-fun m!513785 () Bool)

(assert (=> b!533730 m!513785))

(declare-fun m!513787 () Bool)

(assert (=> b!533731 m!513787))

(declare-fun m!513789 () Bool)

(assert (=> b!533733 m!513789))

(assert (=> b!533728 m!513783))

(assert (=> b!533728 m!513783))

(declare-fun m!513791 () Bool)

(assert (=> b!533728 m!513791))

(assert (=> b!533728 m!513791))

(assert (=> b!533728 m!513783))

(declare-fun m!513793 () Bool)

(assert (=> b!533728 m!513793))

(declare-fun m!513795 () Bool)

(assert (=> b!533734 m!513795))

(assert (=> b!533727 m!513783))

(assert (=> b!533727 m!513783))

(declare-fun m!513797 () Bool)

(assert (=> b!533727 m!513797))

(assert (=> b!533725 m!513783))

(assert (=> b!533725 m!513783))

(declare-fun m!513799 () Bool)

(assert (=> b!533725 m!513799))

(check-sat (not b!533733) (not b!533734) (not b!533727) (not b!533725) (not b!533731) (not b!533726) (not b!533728) (not start!48598) (not b!533730))
(check-sat)
