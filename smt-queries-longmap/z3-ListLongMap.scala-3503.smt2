; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48590 () Bool)

(assert start!48590)

(declare-fun b!533555 () Bool)

(declare-fun res!328766 () Bool)

(declare-fun e!310445 () Bool)

(assert (=> b!533555 (=> (not res!328766) (not e!310445))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533555 (= res!328766 (validKeyInArray!0 k0!1998))))

(declare-fun b!533556 () Bool)

(declare-fun res!328769 () Bool)

(assert (=> b!533556 (=> (not res!328769) (not e!310445))))

(declare-datatypes ((array!33802 0))(
  ( (array!33803 (arr!16240 (Array (_ BitVec 32) (_ BitVec 64))) (size!16604 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33802)

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!533556 (= res!328769 (validKeyInArray!0 (select (arr!16240 a!3154) j!147)))))

(declare-fun res!328765 () Bool)

(assert (=> start!48590 (=> (not res!328765) (not e!310445))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48590 (= res!328765 (validMask!0 mask!3216))))

(assert (=> start!48590 e!310445))

(assert (=> start!48590 true))

(declare-fun array_inv!12036 (array!33802) Bool)

(assert (=> start!48590 (array_inv!12036 a!3154)))

(declare-fun b!533557 () Bool)

(declare-fun res!328764 () Bool)

(declare-fun e!310446 () Bool)

(assert (=> b!533557 (=> (not res!328764) (not e!310446))))

(declare-datatypes ((List!10359 0))(
  ( (Nil!10356) (Cons!10355 (h!11298 (_ BitVec 64)) (t!16587 List!10359)) )
))
(declare-fun arrayNoDuplicates!0 (array!33802 (_ BitVec 32) List!10359) Bool)

(assert (=> b!533557 (= res!328764 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10356))))

(declare-fun b!533558 () Bool)

(declare-fun res!328768 () Bool)

(assert (=> b!533558 (=> (not res!328768) (not e!310445))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533558 (= res!328768 (and (= (size!16604 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16604 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16604 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533559 () Bool)

(declare-fun res!328763 () Bool)

(assert (=> b!533559 (=> (not res!328763) (not e!310446))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33802 (_ BitVec 32)) Bool)

(assert (=> b!533559 (= res!328763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533560 () Bool)

(declare-fun res!328762 () Bool)

(assert (=> b!533560 (=> (not res!328762) (not e!310446))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4698 0))(
  ( (MissingZero!4698 (index!21016 (_ BitVec 32))) (Found!4698 (index!21017 (_ BitVec 32))) (Intermediate!4698 (undefined!5510 Bool) (index!21018 (_ BitVec 32)) (x!49985 (_ BitVec 32))) (Undefined!4698) (MissingVacant!4698 (index!21019 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33802 (_ BitVec 32)) SeekEntryResult!4698)

(assert (=> b!533560 (= res!328762 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16240 a!3154) j!147) a!3154 mask!3216) (Intermediate!4698 false resIndex!32 resX!32)))))

(declare-fun b!533561 () Bool)

(declare-fun res!328761 () Bool)

(assert (=> b!533561 (=> (not res!328761) (not e!310445))))

(declare-fun arrayContainsKey!0 (array!33802 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533561 (= res!328761 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533562 () Bool)

(declare-fun res!328760 () Bool)

(assert (=> b!533562 (=> (not res!328760) (not e!310446))))

(assert (=> b!533562 (= res!328760 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16604 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16604 a!3154)) (= (select (arr!16240 a!3154) resIndex!32) (select (arr!16240 a!3154) j!147))))))

(declare-fun b!533563 () Bool)

(assert (=> b!533563 (= e!310446 (and (bvsge mask!3216 #b00000000000000000000000000000000) (bvslt index!1177 (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsgt x!1030 #b01111111111111111111111111111110)))))

(declare-fun b!533564 () Bool)

(assert (=> b!533564 (= e!310445 e!310446)))

(declare-fun res!328767 () Bool)

(assert (=> b!533564 (=> (not res!328767) (not e!310446))))

(declare-fun lt!245458 () SeekEntryResult!4698)

(assert (=> b!533564 (= res!328767 (or (= lt!245458 (MissingZero!4698 i!1153)) (= lt!245458 (MissingVacant!4698 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33802 (_ BitVec 32)) SeekEntryResult!4698)

(assert (=> b!533564 (= lt!245458 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(assert (= (and start!48590 res!328765) b!533558))

(assert (= (and b!533558 res!328768) b!533556))

(assert (= (and b!533556 res!328769) b!533555))

(assert (= (and b!533555 res!328766) b!533561))

(assert (= (and b!533561 res!328761) b!533564))

(assert (= (and b!533564 res!328767) b!533559))

(assert (= (and b!533559 res!328763) b!533557))

(assert (= (and b!533557 res!328764) b!533562))

(assert (= (and b!533562 res!328760) b!533560))

(assert (= (and b!533560 res!328762) b!533563))

(declare-fun m!513403 () Bool)

(assert (=> b!533561 m!513403))

(declare-fun m!513405 () Bool)

(assert (=> b!533555 m!513405))

(declare-fun m!513407 () Bool)

(assert (=> b!533560 m!513407))

(assert (=> b!533560 m!513407))

(declare-fun m!513409 () Bool)

(assert (=> b!533560 m!513409))

(declare-fun m!513411 () Bool)

(assert (=> b!533559 m!513411))

(declare-fun m!513413 () Bool)

(assert (=> start!48590 m!513413))

(declare-fun m!513415 () Bool)

(assert (=> start!48590 m!513415))

(assert (=> b!533556 m!513407))

(assert (=> b!533556 m!513407))

(declare-fun m!513417 () Bool)

(assert (=> b!533556 m!513417))

(declare-fun m!513419 () Bool)

(assert (=> b!533564 m!513419))

(declare-fun m!513421 () Bool)

(assert (=> b!533557 m!513421))

(declare-fun m!513423 () Bool)

(assert (=> b!533562 m!513423))

(assert (=> b!533562 m!513407))

(check-sat (not b!533559) (not b!533557) (not b!533555) (not start!48590) (not b!533561) (not b!533564) (not b!533560) (not b!533556))
(check-sat)
