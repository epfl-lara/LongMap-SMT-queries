; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48674 () Bool)

(assert start!48674)

(declare-fun b!534806 () Bool)

(declare-fun res!330013 () Bool)

(declare-fun e!310824 () Bool)

(assert (=> b!534806 (=> (not res!330013) (not e!310824))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33886 0))(
  ( (array!33887 (arr!16282 (Array (_ BitVec 32) (_ BitVec 64))) (size!16646 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33886)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534806 (= res!330013 (and (= (size!16646 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16646 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16646 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534807 () Bool)

(declare-fun res!330014 () Bool)

(declare-fun e!310822 () Bool)

(assert (=> b!534807 (=> (not res!330014) (not e!310822))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33886 (_ BitVec 32)) Bool)

(assert (=> b!534807 (= res!330014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534808 () Bool)

(declare-fun res!330012 () Bool)

(assert (=> b!534808 (=> (not res!330012) (not e!310822))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4740 0))(
  ( (MissingZero!4740 (index!21184 (_ BitVec 32))) (Found!4740 (index!21185 (_ BitVec 32))) (Intermediate!4740 (undefined!5552 Bool) (index!21186 (_ BitVec 32)) (x!50139 (_ BitVec 32))) (Undefined!4740) (MissingVacant!4740 (index!21187 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33886 (_ BitVec 32)) SeekEntryResult!4740)

(assert (=> b!534808 (= res!330012 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16282 a!3154) j!147) a!3154 mask!3216) (Intermediate!4740 false resIndex!32 resX!32)))))

(declare-fun b!534809 () Bool)

(declare-fun res!330015 () Bool)

(assert (=> b!534809 (=> (not res!330015) (not e!310824))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534809 (= res!330015 (validKeyInArray!0 k0!1998))))

(declare-fun res!330011 () Bool)

(assert (=> start!48674 (=> (not res!330011) (not e!310824))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48674 (= res!330011 (validMask!0 mask!3216))))

(assert (=> start!48674 e!310824))

(assert (=> start!48674 true))

(declare-fun array_inv!12078 (array!33886) Bool)

(assert (=> start!48674 (array_inv!12078 a!3154)))

(declare-fun b!534810 () Bool)

(declare-fun res!330016 () Bool)

(assert (=> b!534810 (=> (not res!330016) (not e!310824))))

(declare-fun arrayContainsKey!0 (array!33886 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534810 (= res!330016 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534811 () Bool)

(assert (=> b!534811 (= e!310824 e!310822)))

(declare-fun res!330017 () Bool)

(assert (=> b!534811 (=> (not res!330017) (not e!310822))))

(declare-fun lt!245707 () SeekEntryResult!4740)

(assert (=> b!534811 (= res!330017 (or (= lt!245707 (MissingZero!4740 i!1153)) (= lt!245707 (MissingVacant!4740 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33886 (_ BitVec 32)) SeekEntryResult!4740)

(assert (=> b!534811 (= lt!245707 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!534812 () Bool)

(declare-fun res!330018 () Bool)

(assert (=> b!534812 (=> (not res!330018) (not e!310822))))

(assert (=> b!534812 (= res!330018 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16646 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16646 a!3154)) (= (select (arr!16282 a!3154) resIndex!32) (select (arr!16282 a!3154) j!147))))))

(declare-fun b!534813 () Bool)

(declare-fun res!330019 () Bool)

(assert (=> b!534813 (=> (not res!330019) (not e!310822))))

(declare-datatypes ((List!10401 0))(
  ( (Nil!10398) (Cons!10397 (h!11340 (_ BitVec 64)) (t!16629 List!10401)) )
))
(declare-fun arrayNoDuplicates!0 (array!33886 (_ BitVec 32) List!10401) Bool)

(assert (=> b!534813 (= res!330019 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10398))))

(declare-fun b!534814 () Bool)

(declare-fun res!330020 () Bool)

(assert (=> b!534814 (=> (not res!330020) (not e!310824))))

(assert (=> b!534814 (= res!330020 (validKeyInArray!0 (select (arr!16282 a!3154) j!147)))))

(declare-fun b!534815 () Bool)

(assert (=> b!534815 (= e!310822 false)))

(declare-fun lt!245706 () SeekEntryResult!4740)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534815 (= lt!245706 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16282 a!3154) j!147) mask!3216) (select (arr!16282 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48674 res!330011) b!534806))

(assert (= (and b!534806 res!330013) b!534814))

(assert (= (and b!534814 res!330020) b!534809))

(assert (= (and b!534809 res!330015) b!534810))

(assert (= (and b!534810 res!330016) b!534811))

(assert (= (and b!534811 res!330017) b!534807))

(assert (= (and b!534807 res!330014) b!534813))

(assert (= (and b!534813 res!330019) b!534812))

(assert (= (and b!534812 res!330018) b!534808))

(assert (= (and b!534808 res!330012) b!534815))

(declare-fun m!514475 () Bool)

(assert (=> b!534807 m!514475))

(declare-fun m!514477 () Bool)

(assert (=> b!534813 m!514477))

(declare-fun m!514479 () Bool)

(assert (=> b!534815 m!514479))

(assert (=> b!534815 m!514479))

(declare-fun m!514481 () Bool)

(assert (=> b!534815 m!514481))

(assert (=> b!534815 m!514481))

(assert (=> b!534815 m!514479))

(declare-fun m!514483 () Bool)

(assert (=> b!534815 m!514483))

(declare-fun m!514485 () Bool)

(assert (=> start!48674 m!514485))

(declare-fun m!514487 () Bool)

(assert (=> start!48674 m!514487))

(declare-fun m!514489 () Bool)

(assert (=> b!534810 m!514489))

(assert (=> b!534808 m!514479))

(assert (=> b!534808 m!514479))

(declare-fun m!514491 () Bool)

(assert (=> b!534808 m!514491))

(declare-fun m!514493 () Bool)

(assert (=> b!534812 m!514493))

(assert (=> b!534812 m!514479))

(assert (=> b!534814 m!514479))

(assert (=> b!534814 m!514479))

(declare-fun m!514495 () Bool)

(assert (=> b!534814 m!514495))

(declare-fun m!514497 () Bool)

(assert (=> b!534809 m!514497))

(declare-fun m!514499 () Bool)

(assert (=> b!534811 m!514499))

(check-sat (not b!534808) (not b!534814) (not b!534811) (not b!534810) (not b!534813) (not b!534809) (not b!534807) (not start!48674) (not b!534815))
(check-sat)
