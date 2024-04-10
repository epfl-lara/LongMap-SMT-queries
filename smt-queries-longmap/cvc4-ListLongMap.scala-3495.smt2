; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48490 () Bool)

(assert start!48490)

(declare-fun res!327999 () Bool)

(declare-fun e!310085 () Bool)

(assert (=> start!48490 (=> (not res!327999) (not e!310085))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48490 (= res!327999 (validMask!0 mask!3216))))

(assert (=> start!48490 e!310085))

(assert (=> start!48490 true))

(declare-datatypes ((array!33753 0))(
  ( (array!33754 (arr!16217 (Array (_ BitVec 32) (_ BitVec 64))) (size!16581 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33753)

(declare-fun array_inv!12013 (array!33753) Bool)

(assert (=> start!48490 (array_inv!12013 a!3154)))

(declare-fun b!532649 () Bool)

(declare-fun e!310084 () Bool)

(assert (=> b!532649 (= e!310084 false)))

(declare-fun lt!245253 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!532649 (= lt!245253 (toIndex!0 (select (arr!16217 a!3154) j!147) mask!3216))))

(declare-fun b!532650 () Bool)

(declare-fun res!328004 () Bool)

(assert (=> b!532650 (=> (not res!328004) (not e!310085))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!532650 (= res!328004 (and (= (size!16581 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16581 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16581 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!532651 () Bool)

(declare-fun res!327997 () Bool)

(assert (=> b!532651 (=> (not res!327997) (not e!310084))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4675 0))(
  ( (MissingZero!4675 (index!20924 (_ BitVec 32))) (Found!4675 (index!20925 (_ BitVec 32))) (Intermediate!4675 (undefined!5487 Bool) (index!20926 (_ BitVec 32)) (x!49892 (_ BitVec 32))) (Undefined!4675) (MissingVacant!4675 (index!20927 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33753 (_ BitVec 32)) SeekEntryResult!4675)

(assert (=> b!532651 (= res!327997 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16217 a!3154) j!147) a!3154 mask!3216) (Intermediate!4675 false resIndex!32 resX!32)))))

(declare-fun b!532652 () Bool)

(assert (=> b!532652 (= e!310085 e!310084)))

(declare-fun res!328002 () Bool)

(assert (=> b!532652 (=> (not res!328002) (not e!310084))))

(declare-fun lt!245254 () SeekEntryResult!4675)

(assert (=> b!532652 (= res!328002 (or (= lt!245254 (MissingZero!4675 i!1153)) (= lt!245254 (MissingVacant!4675 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33753 (_ BitVec 32)) SeekEntryResult!4675)

(assert (=> b!532652 (= lt!245254 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!532653 () Bool)

(declare-fun res!327998 () Bool)

(assert (=> b!532653 (=> (not res!327998) (not e!310085))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!532653 (= res!327998 (validKeyInArray!0 (select (arr!16217 a!3154) j!147)))))

(declare-fun b!532654 () Bool)

(declare-fun res!328003 () Bool)

(assert (=> b!532654 (=> (not res!328003) (not e!310084))))

(declare-datatypes ((List!10336 0))(
  ( (Nil!10333) (Cons!10332 (h!11272 (_ BitVec 64)) (t!16564 List!10336)) )
))
(declare-fun arrayNoDuplicates!0 (array!33753 (_ BitVec 32) List!10336) Bool)

(assert (=> b!532654 (= res!328003 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10333))))

(declare-fun b!532655 () Bool)

(declare-fun res!327995 () Bool)

(assert (=> b!532655 (=> (not res!327995) (not e!310085))))

(assert (=> b!532655 (= res!327995 (validKeyInArray!0 k!1998))))

(declare-fun b!532656 () Bool)

(declare-fun res!327996 () Bool)

(assert (=> b!532656 (=> (not res!327996) (not e!310084))))

(assert (=> b!532656 (= res!327996 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16581 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16581 a!3154)) (= (select (arr!16217 a!3154) resIndex!32) (select (arr!16217 a!3154) j!147))))))

(declare-fun b!532657 () Bool)

(declare-fun res!328000 () Bool)

(assert (=> b!532657 (=> (not res!328000) (not e!310085))))

(declare-fun arrayContainsKey!0 (array!33753 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!532657 (= res!328000 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!532658 () Bool)

(declare-fun res!328001 () Bool)

(assert (=> b!532658 (=> (not res!328001) (not e!310084))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33753 (_ BitVec 32)) Bool)

(assert (=> b!532658 (= res!328001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!48490 res!327999) b!532650))

(assert (= (and b!532650 res!328004) b!532653))

(assert (= (and b!532653 res!327998) b!532655))

(assert (= (and b!532655 res!327995) b!532657))

(assert (= (and b!532657 res!328000) b!532652))

(assert (= (and b!532652 res!328002) b!532658))

(assert (= (and b!532658 res!328001) b!532654))

(assert (= (and b!532654 res!328003) b!532656))

(assert (= (and b!532656 res!327996) b!532651))

(assert (= (and b!532651 res!327997) b!532649))

(declare-fun m!512757 () Bool)

(assert (=> b!532653 m!512757))

(assert (=> b!532653 m!512757))

(declare-fun m!512759 () Bool)

(assert (=> b!532653 m!512759))

(declare-fun m!512761 () Bool)

(assert (=> b!532654 m!512761))

(declare-fun m!512763 () Bool)

(assert (=> b!532655 m!512763))

(declare-fun m!512765 () Bool)

(assert (=> b!532656 m!512765))

(assert (=> b!532656 m!512757))

(declare-fun m!512767 () Bool)

(assert (=> b!532658 m!512767))

(declare-fun m!512769 () Bool)

(assert (=> b!532657 m!512769))

(assert (=> b!532651 m!512757))

(assert (=> b!532651 m!512757))

(declare-fun m!512771 () Bool)

(assert (=> b!532651 m!512771))

(declare-fun m!512773 () Bool)

(assert (=> start!48490 m!512773))

(declare-fun m!512775 () Bool)

(assert (=> start!48490 m!512775))

(assert (=> b!532649 m!512757))

(assert (=> b!532649 m!512757))

(declare-fun m!512777 () Bool)

(assert (=> b!532649 m!512777))

(declare-fun m!512779 () Bool)

(assert (=> b!532652 m!512779))

(push 1)

(assert (not start!48490))

(assert (not b!532651))

(assert (not b!532654))

(assert (not b!532658))

(assert (not b!532653))

(assert (not b!532652))

(assert (not b!532649))

(assert (not b!532655))

(assert (not b!532657))

(check-sat)

