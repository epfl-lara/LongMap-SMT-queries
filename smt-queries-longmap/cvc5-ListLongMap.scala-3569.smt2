; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49092 () Bool)

(assert start!49092)

(declare-fun res!335608 () Bool)

(declare-fun e!313247 () Bool)

(assert (=> start!49092 (=> (not res!335608) (not e!313247))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49092 (= res!335608 (validMask!0 mask!3216))))

(assert (=> start!49092 e!313247))

(assert (=> start!49092 true))

(declare-datatypes ((array!34202 0))(
  ( (array!34203 (arr!16437 (Array (_ BitVec 32) (_ BitVec 64))) (size!16801 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34202)

(declare-fun array_inv!12233 (array!34202) Bool)

(assert (=> start!49092 (array_inv!12233 a!3154)))

(declare-fun b!540716 () Bool)

(declare-fun e!313246 () Bool)

(assert (=> b!540716 (= e!313246 false)))

(declare-datatypes ((SeekEntryResult!4895 0))(
  ( (MissingZero!4895 (index!21804 (_ BitVec 32))) (Found!4895 (index!21805 (_ BitVec 32))) (Intermediate!4895 (undefined!5707 Bool) (index!21806 (_ BitVec 32)) (x!50722 (_ BitVec 32))) (Undefined!4895) (MissingVacant!4895 (index!21807 (_ BitVec 32))) )
))
(declare-fun lt!247477 () SeekEntryResult!4895)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34202 (_ BitVec 32)) SeekEntryResult!4895)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540716 (= lt!247477 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16437 a!3154) j!147) mask!3216) (select (arr!16437 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!540717 () Bool)

(declare-fun res!335607 () Bool)

(assert (=> b!540717 (=> (not res!335607) (not e!313247))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34202 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!540717 (= res!335607 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!540718 () Bool)

(declare-fun res!335610 () Bool)

(assert (=> b!540718 (=> (not res!335610) (not e!313246))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!540718 (= res!335610 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16437 a!3154) j!147) a!3154 mask!3216) (Intermediate!4895 false resIndex!32 resX!32)))))

(declare-fun b!540719 () Bool)

(declare-fun res!335605 () Bool)

(assert (=> b!540719 (=> (not res!335605) (not e!313247))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!540719 (= res!335605 (validKeyInArray!0 (select (arr!16437 a!3154) j!147)))))

(declare-fun b!540720 () Bool)

(declare-fun res!335604 () Bool)

(assert (=> b!540720 (=> (not res!335604) (not e!313247))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!540720 (= res!335604 (and (= (size!16801 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16801 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16801 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!540721 () Bool)

(declare-fun res!335603 () Bool)

(assert (=> b!540721 (=> (not res!335603) (not e!313246))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34202 (_ BitVec 32)) Bool)

(assert (=> b!540721 (= res!335603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!540722 () Bool)

(assert (=> b!540722 (= e!313247 e!313246)))

(declare-fun res!335609 () Bool)

(assert (=> b!540722 (=> (not res!335609) (not e!313246))))

(declare-fun lt!247476 () SeekEntryResult!4895)

(assert (=> b!540722 (= res!335609 (or (= lt!247476 (MissingZero!4895 i!1153)) (= lt!247476 (MissingVacant!4895 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34202 (_ BitVec 32)) SeekEntryResult!4895)

(assert (=> b!540722 (= lt!247476 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!540723 () Bool)

(declare-fun res!335612 () Bool)

(assert (=> b!540723 (=> (not res!335612) (not e!313246))))

(assert (=> b!540723 (= res!335612 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16801 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16801 a!3154)) (= (select (arr!16437 a!3154) resIndex!32) (select (arr!16437 a!3154) j!147))))))

(declare-fun b!540724 () Bool)

(declare-fun res!335611 () Bool)

(assert (=> b!540724 (=> (not res!335611) (not e!313246))))

(declare-datatypes ((List!10556 0))(
  ( (Nil!10553) (Cons!10552 (h!11501 (_ BitVec 64)) (t!16784 List!10556)) )
))
(declare-fun arrayNoDuplicates!0 (array!34202 (_ BitVec 32) List!10556) Bool)

(assert (=> b!540724 (= res!335611 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10553))))

(declare-fun b!540725 () Bool)

(declare-fun res!335606 () Bool)

(assert (=> b!540725 (=> (not res!335606) (not e!313247))))

(assert (=> b!540725 (= res!335606 (validKeyInArray!0 k!1998))))

(assert (= (and start!49092 res!335608) b!540720))

(assert (= (and b!540720 res!335604) b!540719))

(assert (= (and b!540719 res!335605) b!540725))

(assert (= (and b!540725 res!335606) b!540717))

(assert (= (and b!540717 res!335607) b!540722))

(assert (= (and b!540722 res!335609) b!540721))

(assert (= (and b!540721 res!335603) b!540724))

(assert (= (and b!540724 res!335611) b!540723))

(assert (= (and b!540723 res!335612) b!540718))

(assert (= (and b!540718 res!335610) b!540716))

(declare-fun m!519387 () Bool)

(assert (=> b!540717 m!519387))

(declare-fun m!519389 () Bool)

(assert (=> b!540724 m!519389))

(declare-fun m!519391 () Bool)

(assert (=> b!540719 m!519391))

(assert (=> b!540719 m!519391))

(declare-fun m!519393 () Bool)

(assert (=> b!540719 m!519393))

(declare-fun m!519395 () Bool)

(assert (=> b!540722 m!519395))

(declare-fun m!519397 () Bool)

(assert (=> b!540723 m!519397))

(assert (=> b!540723 m!519391))

(assert (=> b!540718 m!519391))

(assert (=> b!540718 m!519391))

(declare-fun m!519399 () Bool)

(assert (=> b!540718 m!519399))

(declare-fun m!519401 () Bool)

(assert (=> b!540725 m!519401))

(declare-fun m!519403 () Bool)

(assert (=> start!49092 m!519403))

(declare-fun m!519405 () Bool)

(assert (=> start!49092 m!519405))

(declare-fun m!519407 () Bool)

(assert (=> b!540721 m!519407))

(assert (=> b!540716 m!519391))

(assert (=> b!540716 m!519391))

(declare-fun m!519409 () Bool)

(assert (=> b!540716 m!519409))

(assert (=> b!540716 m!519409))

(assert (=> b!540716 m!519391))

(declare-fun m!519411 () Bool)

(assert (=> b!540716 m!519411))

(push 1)

