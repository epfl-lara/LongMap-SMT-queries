; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48652 () Bool)

(assert start!48652)

(declare-fun b!534535 () Bool)

(declare-fun res!329797 () Bool)

(declare-fun e!310720 () Bool)

(assert (=> b!534535 (=> (not res!329797) (not e!310720))))

(declare-datatypes ((array!33863 0))(
  ( (array!33864 (arr!16270 (Array (_ BitVec 32) (_ BitVec 64))) (size!16634 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33863)

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33863 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534535 (= res!329797 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534536 () Bool)

(declare-fun res!329798 () Bool)

(declare-fun e!310722 () Bool)

(assert (=> b!534536 (=> (not res!329798) (not e!310722))))

(declare-datatypes ((List!10296 0))(
  ( (Nil!10293) (Cons!10292 (h!11235 (_ BitVec 64)) (t!16516 List!10296)) )
))
(declare-fun arrayNoDuplicates!0 (array!33863 (_ BitVec 32) List!10296) Bool)

(assert (=> b!534536 (= res!329798 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10293))))

(declare-fun b!534537 () Bool)

(declare-fun res!329799 () Bool)

(assert (=> b!534537 (=> (not res!329799) (not e!310720))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534537 (= res!329799 (validKeyInArray!0 k0!1998))))

(declare-fun b!534538 () Bool)

(assert (=> b!534538 (= e!310720 e!310722)))

(declare-fun res!329801 () Bool)

(assert (=> b!534538 (=> (not res!329801) (not e!310722))))

(declare-datatypes ((SeekEntryResult!4684 0))(
  ( (MissingZero!4684 (index!20960 (_ BitVec 32))) (Found!4684 (index!20961 (_ BitVec 32))) (Intermediate!4684 (undefined!5496 Bool) (index!20962 (_ BitVec 32)) (x!50064 (_ BitVec 32))) (Undefined!4684) (MissingVacant!4684 (index!20963 (_ BitVec 32))) )
))
(declare-fun lt!245677 () SeekEntryResult!4684)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534538 (= res!329801 (or (= lt!245677 (MissingZero!4684 i!1153)) (= lt!245677 (MissingVacant!4684 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33863 (_ BitVec 32)) SeekEntryResult!4684)

(assert (=> b!534538 (= lt!245677 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!534539 () Bool)

(assert (=> b!534539 (= e!310722 false)))

(declare-fun lt!245676 () SeekEntryResult!4684)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33863 (_ BitVec 32)) SeekEntryResult!4684)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534539 (= lt!245676 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16270 a!3154) j!147) mask!3216) (select (arr!16270 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534541 () Bool)

(declare-fun res!329803 () Bool)

(assert (=> b!534541 (=> (not res!329803) (not e!310722))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!534541 (= res!329803 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16270 a!3154) j!147) a!3154 mask!3216) (Intermediate!4684 false resIndex!32 resX!32)))))

(declare-fun b!534542 () Bool)

(declare-fun res!329795 () Bool)

(assert (=> b!534542 (=> (not res!329795) (not e!310722))))

(assert (=> b!534542 (= res!329795 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16634 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16634 a!3154)) (= (select (arr!16270 a!3154) resIndex!32) (select (arr!16270 a!3154) j!147))))))

(declare-fun b!534540 () Bool)

(declare-fun res!329796 () Bool)

(assert (=> b!534540 (=> (not res!329796) (not e!310720))))

(assert (=> b!534540 (= res!329796 (and (= (size!16634 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16634 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16634 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!329800 () Bool)

(assert (=> start!48652 (=> (not res!329800) (not e!310720))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48652 (= res!329800 (validMask!0 mask!3216))))

(assert (=> start!48652 e!310720))

(assert (=> start!48652 true))

(declare-fun array_inv!12129 (array!33863) Bool)

(assert (=> start!48652 (array_inv!12129 a!3154)))

(declare-fun b!534543 () Bool)

(declare-fun res!329802 () Bool)

(assert (=> b!534543 (=> (not res!329802) (not e!310722))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33863 (_ BitVec 32)) Bool)

(assert (=> b!534543 (= res!329802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534544 () Bool)

(declare-fun res!329794 () Bool)

(assert (=> b!534544 (=> (not res!329794) (not e!310720))))

(assert (=> b!534544 (= res!329794 (validKeyInArray!0 (select (arr!16270 a!3154) j!147)))))

(assert (= (and start!48652 res!329800) b!534540))

(assert (= (and b!534540 res!329796) b!534544))

(assert (= (and b!534544 res!329794) b!534537))

(assert (= (and b!534537 res!329799) b!534535))

(assert (= (and b!534535 res!329797) b!534538))

(assert (= (and b!534538 res!329801) b!534543))

(assert (= (and b!534543 res!329802) b!534536))

(assert (= (and b!534536 res!329798) b!534542))

(assert (= (and b!534542 res!329795) b!534541))

(assert (= (and b!534541 res!329803) b!534539))

(declare-fun m!514477 () Bool)

(assert (=> b!534543 m!514477))

(declare-fun m!514479 () Bool)

(assert (=> b!534541 m!514479))

(assert (=> b!534541 m!514479))

(declare-fun m!514481 () Bool)

(assert (=> b!534541 m!514481))

(declare-fun m!514483 () Bool)

(assert (=> b!534542 m!514483))

(assert (=> b!534542 m!514479))

(assert (=> b!534544 m!514479))

(assert (=> b!534544 m!514479))

(declare-fun m!514485 () Bool)

(assert (=> b!534544 m!514485))

(declare-fun m!514487 () Bool)

(assert (=> start!48652 m!514487))

(declare-fun m!514489 () Bool)

(assert (=> start!48652 m!514489))

(declare-fun m!514491 () Bool)

(assert (=> b!534535 m!514491))

(declare-fun m!514493 () Bool)

(assert (=> b!534538 m!514493))

(declare-fun m!514495 () Bool)

(assert (=> b!534536 m!514495))

(assert (=> b!534539 m!514479))

(assert (=> b!534539 m!514479))

(declare-fun m!514497 () Bool)

(assert (=> b!534539 m!514497))

(assert (=> b!534539 m!514497))

(assert (=> b!534539 m!514479))

(declare-fun m!514499 () Bool)

(assert (=> b!534539 m!514499))

(declare-fun m!514501 () Bool)

(assert (=> b!534537 m!514501))

(check-sat (not b!534544) (not b!534536) (not b!534541) (not b!534539) (not b!534538) (not b!534543) (not b!534537) (not start!48652) (not b!534535))
(check-sat)
