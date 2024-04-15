; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48822 () Bool)

(assert start!48822)

(declare-fun res!332828 () Bool)

(declare-fun e!311743 () Bool)

(assert (=> start!48822 (=> (not res!332828) (not e!311743))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48822 (= res!332828 (validMask!0 mask!3216))))

(assert (=> start!48822 e!311743))

(assert (=> start!48822 true))

(declare-datatypes ((array!34044 0))(
  ( (array!34045 (arr!16361 (Array (_ BitVec 32) (_ BitVec 64))) (size!16726 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34044)

(declare-fun array_inv!12244 (array!34044) Bool)

(assert (=> start!48822 (array_inv!12244 a!3154)))

(declare-fun b!537472 () Bool)

(declare-fun res!332830 () Bool)

(declare-fun e!311742 () Bool)

(assert (=> b!537472 (=> (not res!332830) (not e!311742))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34044 (_ BitVec 32)) Bool)

(assert (=> b!537472 (= res!332830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!537473 () Bool)

(declare-fun res!332820 () Bool)

(assert (=> b!537473 (=> (not res!332820) (not e!311742))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!537473 (= res!332820 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16726 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16726 a!3154)) (= (select (arr!16361 a!3154) resIndex!32) (select (arr!16361 a!3154) j!147))))))

(declare-fun b!537474 () Bool)

(declare-fun e!311744 () Bool)

(declare-fun e!311745 () Bool)

(assert (=> b!537474 (= e!311744 e!311745)))

(declare-fun res!332831 () Bool)

(assert (=> b!537474 (=> (not res!332831) (not e!311745))))

(declare-fun lt!246265 () (_ BitVec 32))

(assert (=> b!537474 (= res!332831 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246265 #b00000000000000000000000000000000) (bvslt lt!246265 (size!16726 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537474 (= lt!246265 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!537475 () Bool)

(assert (=> b!537475 (= e!311745 false)))

(declare-datatypes ((SeekEntryResult!4816 0))(
  ( (MissingZero!4816 (index!21488 (_ BitVec 32))) (Found!4816 (index!21489 (_ BitVec 32))) (Intermediate!4816 (undefined!5628 Bool) (index!21490 (_ BitVec 32)) (x!50426 (_ BitVec 32))) (Undefined!4816) (MissingVacant!4816 (index!21491 (_ BitVec 32))) )
))
(declare-fun lt!246262 () SeekEntryResult!4816)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34044 (_ BitVec 32)) SeekEntryResult!4816)

(assert (=> b!537475 (= lt!246262 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246265 (select (arr!16361 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537476 () Bool)

(declare-fun res!332823 () Bool)

(assert (=> b!537476 (=> (not res!332823) (not e!311742))))

(declare-datatypes ((List!10519 0))(
  ( (Nil!10516) (Cons!10515 (h!11458 (_ BitVec 64)) (t!16738 List!10519)) )
))
(declare-fun arrayNoDuplicates!0 (array!34044 (_ BitVec 32) List!10519) Bool)

(assert (=> b!537476 (= res!332823 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10516))))

(declare-fun b!537477 () Bool)

(declare-fun res!332826 () Bool)

(assert (=> b!537477 (=> (not res!332826) (not e!311743))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537477 (= res!332826 (validKeyInArray!0 k0!1998))))

(declare-fun b!537478 () Bool)

(assert (=> b!537478 (= e!311743 e!311742)))

(declare-fun res!332819 () Bool)

(assert (=> b!537478 (=> (not res!332819) (not e!311742))))

(declare-fun lt!246264 () SeekEntryResult!4816)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537478 (= res!332819 (or (= lt!246264 (MissingZero!4816 i!1153)) (= lt!246264 (MissingVacant!4816 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34044 (_ BitVec 32)) SeekEntryResult!4816)

(assert (=> b!537478 (= lt!246264 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!537479 () Bool)

(declare-fun res!332821 () Bool)

(assert (=> b!537479 (=> (not res!332821) (not e!311743))))

(assert (=> b!537479 (= res!332821 (and (= (size!16726 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16726 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16726 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!537480 () Bool)

(declare-fun res!332827 () Bool)

(assert (=> b!537480 (=> (not res!332827) (not e!311744))))

(assert (=> b!537480 (= res!332827 (and (not (= (select (arr!16361 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16361 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16361 a!3154) index!1177) (select (arr!16361 a!3154) j!147)))))))

(declare-fun b!537481 () Bool)

(declare-fun res!332825 () Bool)

(assert (=> b!537481 (=> (not res!332825) (not e!311743))))

(assert (=> b!537481 (= res!332825 (validKeyInArray!0 (select (arr!16361 a!3154) j!147)))))

(declare-fun b!537482 () Bool)

(declare-fun res!332824 () Bool)

(assert (=> b!537482 (=> (not res!332824) (not e!311743))))

(declare-fun arrayContainsKey!0 (array!34044 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537482 (= res!332824 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!537483 () Bool)

(declare-fun res!332829 () Bool)

(assert (=> b!537483 (=> (not res!332829) (not e!311744))))

(declare-fun lt!246263 () SeekEntryResult!4816)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537483 (= res!332829 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16361 a!3154) j!147) mask!3216) (select (arr!16361 a!3154) j!147) a!3154 mask!3216) lt!246263))))

(declare-fun b!537484 () Bool)

(assert (=> b!537484 (= e!311742 e!311744)))

(declare-fun res!332822 () Bool)

(assert (=> b!537484 (=> (not res!332822) (not e!311744))))

(assert (=> b!537484 (= res!332822 (= lt!246263 (Intermediate!4816 false resIndex!32 resX!32)))))

(assert (=> b!537484 (= lt!246263 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16361 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48822 res!332828) b!537479))

(assert (= (and b!537479 res!332821) b!537481))

(assert (= (and b!537481 res!332825) b!537477))

(assert (= (and b!537477 res!332826) b!537482))

(assert (= (and b!537482 res!332824) b!537478))

(assert (= (and b!537478 res!332819) b!537472))

(assert (= (and b!537472 res!332830) b!537476))

(assert (= (and b!537476 res!332823) b!537473))

(assert (= (and b!537473 res!332820) b!537484))

(assert (= (and b!537484 res!332822) b!537483))

(assert (= (and b!537483 res!332829) b!537480))

(assert (= (and b!537480 res!332827) b!537474))

(assert (= (and b!537474 res!332831) b!537475))

(declare-fun m!516169 () Bool)

(assert (=> b!537473 m!516169))

(declare-fun m!516171 () Bool)

(assert (=> b!537473 m!516171))

(declare-fun m!516173 () Bool)

(assert (=> b!537480 m!516173))

(assert (=> b!537480 m!516171))

(declare-fun m!516175 () Bool)

(assert (=> b!537482 m!516175))

(declare-fun m!516177 () Bool)

(assert (=> b!537476 m!516177))

(assert (=> b!537475 m!516171))

(assert (=> b!537475 m!516171))

(declare-fun m!516179 () Bool)

(assert (=> b!537475 m!516179))

(assert (=> b!537481 m!516171))

(assert (=> b!537481 m!516171))

(declare-fun m!516181 () Bool)

(assert (=> b!537481 m!516181))

(declare-fun m!516183 () Bool)

(assert (=> b!537477 m!516183))

(assert (=> b!537483 m!516171))

(assert (=> b!537483 m!516171))

(declare-fun m!516185 () Bool)

(assert (=> b!537483 m!516185))

(assert (=> b!537483 m!516185))

(assert (=> b!537483 m!516171))

(declare-fun m!516187 () Bool)

(assert (=> b!537483 m!516187))

(declare-fun m!516189 () Bool)

(assert (=> start!48822 m!516189))

(declare-fun m!516191 () Bool)

(assert (=> start!48822 m!516191))

(declare-fun m!516193 () Bool)

(assert (=> b!537474 m!516193))

(assert (=> b!537484 m!516171))

(assert (=> b!537484 m!516171))

(declare-fun m!516195 () Bool)

(assert (=> b!537484 m!516195))

(declare-fun m!516197 () Bool)

(assert (=> b!537478 m!516197))

(declare-fun m!516199 () Bool)

(assert (=> b!537472 m!516199))

(check-sat (not b!537472) (not b!537482) (not b!537475) (not b!537477) (not b!537474) (not start!48822) (not b!537483) (not b!537478) (not b!537481) (not b!537484) (not b!537476))
(check-sat)
