; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48820 () Bool)

(assert start!48820)

(declare-fun b!537470 () Bool)

(declare-fun e!311813 () Bool)

(declare-fun e!311812 () Bool)

(assert (=> b!537470 (= e!311813 e!311812)))

(declare-fun res!332687 () Bool)

(assert (=> b!537470 (=> (not res!332687) (not e!311812))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4813 0))(
  ( (MissingZero!4813 (index!21476 (_ BitVec 32))) (Found!4813 (index!21477 (_ BitVec 32))) (Intermediate!4813 (undefined!5625 Bool) (index!21478 (_ BitVec 32)) (x!50404 (_ BitVec 32))) (Undefined!4813) (MissingVacant!4813 (index!21479 (_ BitVec 32))) )
))
(declare-fun lt!246415 () SeekEntryResult!4813)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!537470 (= res!332687 (= lt!246415 (Intermediate!4813 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34032 0))(
  ( (array!34033 (arr!16355 (Array (_ BitVec 32) (_ BitVec 64))) (size!16719 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34032)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34032 (_ BitVec 32)) SeekEntryResult!4813)

(assert (=> b!537470 (= lt!246415 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16355 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537471 () Bool)

(declare-fun res!332685 () Bool)

(assert (=> b!537471 (=> (not res!332685) (not e!311813))))

(declare-datatypes ((List!10474 0))(
  ( (Nil!10471) (Cons!10470 (h!11413 (_ BitVec 64)) (t!16702 List!10474)) )
))
(declare-fun arrayNoDuplicates!0 (array!34032 (_ BitVec 32) List!10474) Bool)

(assert (=> b!537471 (= res!332685 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10471))))

(declare-fun res!332675 () Bool)

(declare-fun e!311810 () Bool)

(assert (=> start!48820 (=> (not res!332675) (not e!311810))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48820 (= res!332675 (validMask!0 mask!3216))))

(assert (=> start!48820 e!311810))

(assert (=> start!48820 true))

(declare-fun array_inv!12151 (array!34032) Bool)

(assert (=> start!48820 (array_inv!12151 a!3154)))

(declare-fun b!537472 () Bool)

(declare-fun res!332678 () Bool)

(assert (=> b!537472 (=> (not res!332678) (not e!311810))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34032 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537472 (= res!332678 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!537473 () Bool)

(declare-fun res!332684 () Bool)

(assert (=> b!537473 (=> (not res!332684) (not e!311812))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537473 (= res!332684 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16355 a!3154) j!147) mask!3216) (select (arr!16355 a!3154) j!147) a!3154 mask!3216) lt!246415))))

(declare-fun b!537474 () Bool)

(declare-fun res!332682 () Bool)

(assert (=> b!537474 (=> (not res!332682) (not e!311810))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537474 (= res!332682 (validKeyInArray!0 k!1998))))

(declare-fun b!537475 () Bool)

(declare-fun res!332680 () Bool)

(assert (=> b!537475 (=> (not res!332680) (not e!311810))))

(assert (=> b!537475 (= res!332680 (validKeyInArray!0 (select (arr!16355 a!3154) j!147)))))

(declare-fun b!537476 () Bool)

(declare-fun e!311814 () Bool)

(assert (=> b!537476 (= e!311812 e!311814)))

(declare-fun res!332676 () Bool)

(assert (=> b!537476 (=> (not res!332676) (not e!311814))))

(declare-fun lt!246412 () (_ BitVec 32))

(assert (=> b!537476 (= res!332676 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246412 #b00000000000000000000000000000000) (bvslt lt!246412 (size!16719 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537476 (= lt!246412 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!537477 () Bool)

(declare-fun res!332686 () Bool)

(assert (=> b!537477 (=> (not res!332686) (not e!311812))))

(assert (=> b!537477 (= res!332686 (and (not (= (select (arr!16355 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16355 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16355 a!3154) index!1177) (select (arr!16355 a!3154) j!147)))))))

(declare-fun b!537478 () Bool)

(assert (=> b!537478 (= e!311814 false)))

(declare-fun lt!246413 () SeekEntryResult!4813)

(assert (=> b!537478 (= lt!246413 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246412 (select (arr!16355 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537479 () Bool)

(declare-fun res!332679 () Bool)

(assert (=> b!537479 (=> (not res!332679) (not e!311810))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537479 (= res!332679 (and (= (size!16719 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16719 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16719 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!537480 () Bool)

(declare-fun res!332677 () Bool)

(assert (=> b!537480 (=> (not res!332677) (not e!311813))))

(assert (=> b!537480 (= res!332677 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16719 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16719 a!3154)) (= (select (arr!16355 a!3154) resIndex!32) (select (arr!16355 a!3154) j!147))))))

(declare-fun b!537481 () Bool)

(assert (=> b!537481 (= e!311810 e!311813)))

(declare-fun res!332681 () Bool)

(assert (=> b!537481 (=> (not res!332681) (not e!311813))))

(declare-fun lt!246414 () SeekEntryResult!4813)

(assert (=> b!537481 (= res!332681 (or (= lt!246414 (MissingZero!4813 i!1153)) (= lt!246414 (MissingVacant!4813 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34032 (_ BitVec 32)) SeekEntryResult!4813)

(assert (=> b!537481 (= lt!246414 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!537482 () Bool)

(declare-fun res!332683 () Bool)

(assert (=> b!537482 (=> (not res!332683) (not e!311813))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34032 (_ BitVec 32)) Bool)

(assert (=> b!537482 (= res!332683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!48820 res!332675) b!537479))

(assert (= (and b!537479 res!332679) b!537475))

(assert (= (and b!537475 res!332680) b!537474))

(assert (= (and b!537474 res!332682) b!537472))

(assert (= (and b!537472 res!332678) b!537481))

(assert (= (and b!537481 res!332681) b!537482))

(assert (= (and b!537482 res!332683) b!537471))

(assert (= (and b!537471 res!332685) b!537480))

(assert (= (and b!537480 res!332677) b!537470))

(assert (= (and b!537470 res!332687) b!537473))

(assert (= (and b!537473 res!332684) b!537477))

(assert (= (and b!537477 res!332686) b!537476))

(assert (= (and b!537476 res!332676) b!537478))

(declare-fun m!516697 () Bool)

(assert (=> b!537477 m!516697))

(declare-fun m!516699 () Bool)

(assert (=> b!537477 m!516699))

(assert (=> b!537470 m!516699))

(assert (=> b!537470 m!516699))

(declare-fun m!516701 () Bool)

(assert (=> b!537470 m!516701))

(declare-fun m!516703 () Bool)

(assert (=> b!537481 m!516703))

(declare-fun m!516705 () Bool)

(assert (=> b!537476 m!516705))

(declare-fun m!516707 () Bool)

(assert (=> start!48820 m!516707))

(declare-fun m!516709 () Bool)

(assert (=> start!48820 m!516709))

(assert (=> b!537478 m!516699))

(assert (=> b!537478 m!516699))

(declare-fun m!516711 () Bool)

(assert (=> b!537478 m!516711))

(assert (=> b!537475 m!516699))

(assert (=> b!537475 m!516699))

(declare-fun m!516713 () Bool)

(assert (=> b!537475 m!516713))

(declare-fun m!516715 () Bool)

(assert (=> b!537471 m!516715))

(declare-fun m!516717 () Bool)

(assert (=> b!537480 m!516717))

(assert (=> b!537480 m!516699))

(assert (=> b!537473 m!516699))

(assert (=> b!537473 m!516699))

(declare-fun m!516719 () Bool)

(assert (=> b!537473 m!516719))

(assert (=> b!537473 m!516719))

(assert (=> b!537473 m!516699))

(declare-fun m!516721 () Bool)

(assert (=> b!537473 m!516721))

(declare-fun m!516723 () Bool)

(assert (=> b!537472 m!516723))

(declare-fun m!516725 () Bool)

(assert (=> b!537482 m!516725))

(declare-fun m!516727 () Bool)

(assert (=> b!537474 m!516727))

(push 1)

(assert (not b!537470))

(assert (not b!537474))

(assert (not b!537481))

(assert (not b!537476))

(assert (not start!48820))

(assert (not b!537478))

(assert (not b!537472))

(assert (not b!537482))

(assert (not b!537471))

