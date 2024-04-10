; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48638 () Bool)

(assert start!48638)

(declare-fun b!534266 () Bool)

(declare-fun res!329479 () Bool)

(declare-fun e!310661 () Bool)

(assert (=> b!534266 (=> (not res!329479) (not e!310661))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33850 0))(
  ( (array!33851 (arr!16264 (Array (_ BitVec 32) (_ BitVec 64))) (size!16628 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33850)

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4722 0))(
  ( (MissingZero!4722 (index!21112 (_ BitVec 32))) (Found!4722 (index!21113 (_ BitVec 32))) (Intermediate!4722 (undefined!5534 Bool) (index!21114 (_ BitVec 32)) (x!50073 (_ BitVec 32))) (Undefined!4722) (MissingVacant!4722 (index!21115 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33850 (_ BitVec 32)) SeekEntryResult!4722)

(assert (=> b!534266 (= res!329479 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16264 a!3154) j!147) a!3154 mask!3216) (Intermediate!4722 false resIndex!32 resX!32)))))

(declare-fun b!534267 () Bool)

(declare-fun res!329478 () Bool)

(declare-fun e!310662 () Bool)

(assert (=> b!534267 (=> (not res!329478) (not e!310662))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534267 (= res!329478 (validKeyInArray!0 (select (arr!16264 a!3154) j!147)))))

(declare-fun b!534268 () Bool)

(assert (=> b!534268 (= e!310662 e!310661)))

(declare-fun res!329474 () Bool)

(assert (=> b!534268 (=> (not res!329474) (not e!310661))))

(declare-fun lt!245598 () SeekEntryResult!4722)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534268 (= res!329474 (or (= lt!245598 (MissingZero!4722 i!1153)) (= lt!245598 (MissingVacant!4722 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33850 (_ BitVec 32)) SeekEntryResult!4722)

(assert (=> b!534268 (= lt!245598 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!534269 () Bool)

(declare-fun res!329475 () Bool)

(assert (=> b!534269 (=> (not res!329475) (not e!310662))))

(declare-fun arrayContainsKey!0 (array!33850 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534269 (= res!329475 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534270 () Bool)

(declare-fun res!329477 () Bool)

(assert (=> b!534270 (=> (not res!329477) (not e!310662))))

(assert (=> b!534270 (= res!329477 (validKeyInArray!0 k0!1998))))

(declare-fun b!534271 () Bool)

(declare-fun res!329472 () Bool)

(assert (=> b!534271 (=> (not res!329472) (not e!310661))))

(declare-datatypes ((List!10383 0))(
  ( (Nil!10380) (Cons!10379 (h!11322 (_ BitVec 64)) (t!16611 List!10383)) )
))
(declare-fun arrayNoDuplicates!0 (array!33850 (_ BitVec 32) List!10383) Bool)

(assert (=> b!534271 (= res!329472 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10380))))

(declare-fun b!534272 () Bool)

(declare-fun res!329471 () Bool)

(assert (=> b!534272 (=> (not res!329471) (not e!310661))))

(assert (=> b!534272 (= res!329471 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16628 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16628 a!3154)) (= (select (arr!16264 a!3154) resIndex!32) (select (arr!16264 a!3154) j!147))))))

(declare-fun b!534273 () Bool)

(declare-fun res!329480 () Bool)

(assert (=> b!534273 (=> (not res!329480) (not e!310661))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33850 (_ BitVec 32)) Bool)

(assert (=> b!534273 (= res!329480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!329473 () Bool)

(assert (=> start!48638 (=> (not res!329473) (not e!310662))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48638 (= res!329473 (validMask!0 mask!3216))))

(assert (=> start!48638 e!310662))

(assert (=> start!48638 true))

(declare-fun array_inv!12060 (array!33850) Bool)

(assert (=> start!48638 (array_inv!12060 a!3154)))

(declare-fun b!534274 () Bool)

(declare-fun res!329476 () Bool)

(assert (=> b!534274 (=> (not res!329476) (not e!310662))))

(assert (=> b!534274 (= res!329476 (and (= (size!16628 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16628 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16628 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534275 () Bool)

(assert (=> b!534275 (= e!310661 false)))

(declare-fun lt!245599 () SeekEntryResult!4722)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534275 (= lt!245599 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16264 a!3154) j!147) mask!3216) (select (arr!16264 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48638 res!329473) b!534274))

(assert (= (and b!534274 res!329476) b!534267))

(assert (= (and b!534267 res!329478) b!534270))

(assert (= (and b!534270 res!329477) b!534269))

(assert (= (and b!534269 res!329475) b!534268))

(assert (= (and b!534268 res!329474) b!534273))

(assert (= (and b!534273 res!329480) b!534271))

(assert (= (and b!534271 res!329472) b!534272))

(assert (= (and b!534272 res!329471) b!534266))

(assert (= (and b!534266 res!329479) b!534275))

(declare-fun m!514007 () Bool)

(assert (=> b!534275 m!514007))

(assert (=> b!534275 m!514007))

(declare-fun m!514009 () Bool)

(assert (=> b!534275 m!514009))

(assert (=> b!534275 m!514009))

(assert (=> b!534275 m!514007))

(declare-fun m!514011 () Bool)

(assert (=> b!534275 m!514011))

(assert (=> b!534267 m!514007))

(assert (=> b!534267 m!514007))

(declare-fun m!514013 () Bool)

(assert (=> b!534267 m!514013))

(declare-fun m!514015 () Bool)

(assert (=> b!534273 m!514015))

(declare-fun m!514017 () Bool)

(assert (=> b!534271 m!514017))

(declare-fun m!514019 () Bool)

(assert (=> b!534270 m!514019))

(declare-fun m!514021 () Bool)

(assert (=> b!534272 m!514021))

(assert (=> b!534272 m!514007))

(declare-fun m!514023 () Bool)

(assert (=> start!48638 m!514023))

(declare-fun m!514025 () Bool)

(assert (=> start!48638 m!514025))

(declare-fun m!514027 () Bool)

(assert (=> b!534268 m!514027))

(declare-fun m!514029 () Bool)

(assert (=> b!534269 m!514029))

(assert (=> b!534266 m!514007))

(assert (=> b!534266 m!514007))

(declare-fun m!514031 () Bool)

(assert (=> b!534266 m!514031))

(check-sat (not b!534269) (not b!534271) (not b!534273) (not b!534268) (not b!534270) (not start!48638) (not b!534275) (not b!534266) (not b!534267))
(check-sat)
