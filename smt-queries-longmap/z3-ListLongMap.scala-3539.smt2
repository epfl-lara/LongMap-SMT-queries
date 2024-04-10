; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48806 () Bool)

(assert start!48806)

(declare-fun b!537198 () Bool)

(declare-fun res!332407 () Bool)

(declare-fun e!311708 () Bool)

(assert (=> b!537198 (=> (not res!332407) (not e!311708))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34018 0))(
  ( (array!34019 (arr!16348 (Array (_ BitVec 32) (_ BitVec 64))) (size!16712 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34018)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!537198 (= res!332407 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16712 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16712 a!3154)) (= (select (arr!16348 a!3154) resIndex!32) (select (arr!16348 a!3154) j!147))))))

(declare-fun b!537199 () Bool)

(declare-fun e!311709 () Bool)

(assert (=> b!537199 (= e!311708 e!311709)))

(declare-fun res!332406 () Bool)

(assert (=> b!537199 (=> (not res!332406) (not e!311709))))

(declare-datatypes ((SeekEntryResult!4806 0))(
  ( (MissingZero!4806 (index!21448 (_ BitVec 32))) (Found!4806 (index!21449 (_ BitVec 32))) (Intermediate!4806 (undefined!5618 Bool) (index!21450 (_ BitVec 32)) (x!50381 (_ BitVec 32))) (Undefined!4806) (MissingVacant!4806 (index!21451 (_ BitVec 32))) )
))
(declare-fun lt!246329 () SeekEntryResult!4806)

(assert (=> b!537199 (= res!332406 (= lt!246329 (Intermediate!4806 false resIndex!32 resX!32)))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34018 (_ BitVec 32)) SeekEntryResult!4806)

(assert (=> b!537199 (= lt!246329 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16348 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537200 () Bool)

(declare-fun res!332413 () Bool)

(declare-fun e!311705 () Bool)

(assert (=> b!537200 (=> (not res!332413) (not e!311705))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537200 (= res!332413 (and (= (size!16712 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16712 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16712 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!537201 () Bool)

(declare-fun res!332404 () Bool)

(assert (=> b!537201 (=> (not res!332404) (not e!311708))))

(declare-datatypes ((List!10467 0))(
  ( (Nil!10464) (Cons!10463 (h!11406 (_ BitVec 64)) (t!16695 List!10467)) )
))
(declare-fun arrayNoDuplicates!0 (array!34018 (_ BitVec 32) List!10467) Bool)

(assert (=> b!537201 (= res!332404 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10464))))

(declare-fun b!537202 () Bool)

(declare-fun res!332414 () Bool)

(assert (=> b!537202 (=> (not res!332414) (not e!311705))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34018 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537202 (= res!332414 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!537203 () Bool)

(declare-fun res!332402 () Bool)

(assert (=> b!537203 (=> (not res!332402) (not e!311708))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34018 (_ BitVec 32)) Bool)

(assert (=> b!537203 (= res!332402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!537204 () Bool)

(declare-fun res!332410 () Bool)

(assert (=> b!537204 (=> (not res!332410) (not e!311709))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537204 (= res!332410 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16348 a!3154) j!147) mask!3216) (select (arr!16348 a!3154) j!147) a!3154 mask!3216) lt!246329))))

(declare-fun b!537205 () Bool)

(assert (=> b!537205 (= e!311705 e!311708)))

(declare-fun res!332411 () Bool)

(assert (=> b!537205 (=> (not res!332411) (not e!311708))))

(declare-fun lt!246328 () SeekEntryResult!4806)

(assert (=> b!537205 (= res!332411 (or (= lt!246328 (MissingZero!4806 i!1153)) (= lt!246328 (MissingVacant!4806 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34018 (_ BitVec 32)) SeekEntryResult!4806)

(assert (=> b!537205 (= lt!246328 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!537206 () Bool)

(declare-fun res!332409 () Bool)

(assert (=> b!537206 (=> (not res!332409) (not e!311705))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537206 (= res!332409 (validKeyInArray!0 k0!1998))))

(declare-fun b!537207 () Bool)

(declare-fun e!311706 () Bool)

(assert (=> b!537207 (= e!311706 false)))

(declare-fun lt!246331 () SeekEntryResult!4806)

(declare-fun lt!246330 () (_ BitVec 32))

(assert (=> b!537207 (= lt!246331 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246330 (select (arr!16348 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537208 () Bool)

(declare-fun res!332412 () Bool)

(assert (=> b!537208 (=> (not res!332412) (not e!311709))))

(assert (=> b!537208 (= res!332412 (and (not (= (select (arr!16348 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16348 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16348 a!3154) index!1177) (select (arr!16348 a!3154) j!147)))))))

(declare-fun b!537209 () Bool)

(assert (=> b!537209 (= e!311709 e!311706)))

(declare-fun res!332403 () Bool)

(assert (=> b!537209 (=> (not res!332403) (not e!311706))))

(assert (=> b!537209 (= res!332403 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246330 #b00000000000000000000000000000000) (bvslt lt!246330 (size!16712 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537209 (= lt!246330 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun res!332408 () Bool)

(assert (=> start!48806 (=> (not res!332408) (not e!311705))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48806 (= res!332408 (validMask!0 mask!3216))))

(assert (=> start!48806 e!311705))

(assert (=> start!48806 true))

(declare-fun array_inv!12144 (array!34018) Bool)

(assert (=> start!48806 (array_inv!12144 a!3154)))

(declare-fun b!537197 () Bool)

(declare-fun res!332405 () Bool)

(assert (=> b!537197 (=> (not res!332405) (not e!311705))))

(assert (=> b!537197 (= res!332405 (validKeyInArray!0 (select (arr!16348 a!3154) j!147)))))

(assert (= (and start!48806 res!332408) b!537200))

(assert (= (and b!537200 res!332413) b!537197))

(assert (= (and b!537197 res!332405) b!537206))

(assert (= (and b!537206 res!332409) b!537202))

(assert (= (and b!537202 res!332414) b!537205))

(assert (= (and b!537205 res!332411) b!537203))

(assert (= (and b!537203 res!332402) b!537201))

(assert (= (and b!537201 res!332404) b!537198))

(assert (= (and b!537198 res!332407) b!537199))

(assert (= (and b!537199 res!332406) b!537204))

(assert (= (and b!537204 res!332410) b!537208))

(assert (= (and b!537208 res!332412) b!537209))

(assert (= (and b!537209 res!332403) b!537207))

(declare-fun m!516473 () Bool)

(assert (=> b!537207 m!516473))

(assert (=> b!537207 m!516473))

(declare-fun m!516475 () Bool)

(assert (=> b!537207 m!516475))

(declare-fun m!516477 () Bool)

(assert (=> b!537201 m!516477))

(declare-fun m!516479 () Bool)

(assert (=> b!537205 m!516479))

(declare-fun m!516481 () Bool)

(assert (=> b!537206 m!516481))

(assert (=> b!537204 m!516473))

(assert (=> b!537204 m!516473))

(declare-fun m!516483 () Bool)

(assert (=> b!537204 m!516483))

(assert (=> b!537204 m!516483))

(assert (=> b!537204 m!516473))

(declare-fun m!516485 () Bool)

(assert (=> b!537204 m!516485))

(declare-fun m!516487 () Bool)

(assert (=> b!537203 m!516487))

(declare-fun m!516489 () Bool)

(assert (=> b!537208 m!516489))

(assert (=> b!537208 m!516473))

(assert (=> b!537199 m!516473))

(assert (=> b!537199 m!516473))

(declare-fun m!516491 () Bool)

(assert (=> b!537199 m!516491))

(declare-fun m!516493 () Bool)

(assert (=> b!537209 m!516493))

(declare-fun m!516495 () Bool)

(assert (=> b!537198 m!516495))

(assert (=> b!537198 m!516473))

(assert (=> b!537197 m!516473))

(assert (=> b!537197 m!516473))

(declare-fun m!516497 () Bool)

(assert (=> b!537197 m!516497))

(declare-fun m!516499 () Bool)

(assert (=> b!537202 m!516499))

(declare-fun m!516501 () Bool)

(assert (=> start!48806 m!516501))

(declare-fun m!516503 () Bool)

(assert (=> start!48806 m!516503))

(check-sat (not b!537202) (not start!48806) (not b!537207) (not b!537206) (not b!537205) (not b!537204) (not b!537199) (not b!537209) (not b!537201) (not b!537197) (not b!537203))
(check-sat)
