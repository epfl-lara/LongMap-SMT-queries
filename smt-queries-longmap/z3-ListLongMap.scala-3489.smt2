; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48394 () Bool)

(assert start!48394)

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun e!309712 () Bool)

(declare-datatypes ((array!33701 0))(
  ( (array!33702 (arr!16192 (Array (_ BitVec 32) (_ BitVec 64))) (size!16556 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33701)

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun b!531795 () Bool)

(assert (=> b!531795 (= e!309712 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16556 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16556 a!3154)) (= (select (arr!16192 a!3154) resIndex!32) (select (arr!16192 a!3154) j!147)) (bvsge mask!3216 #b00000000000000000000000000000000) (bvslt index!1177 (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsgt x!1030 #b01111111111111111111111111111110)))))

(declare-fun b!531796 () Bool)

(declare-fun res!327344 () Bool)

(declare-fun e!309713 () Bool)

(assert (=> b!531796 (=> (not res!327344) (not e!309713))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33701 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!531796 (= res!327344 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!531797 () Bool)

(assert (=> b!531797 (= e!309713 e!309712)))

(declare-fun res!327343 () Bool)

(assert (=> b!531797 (=> (not res!327343) (not e!309712))))

(declare-datatypes ((SeekEntryResult!4606 0))(
  ( (MissingZero!4606 (index!20648 (_ BitVec 32))) (Found!4606 (index!20649 (_ BitVec 32))) (Intermediate!4606 (undefined!5418 Bool) (index!20650 (_ BitVec 32)) (x!49769 (_ BitVec 32))) (Undefined!4606) (MissingVacant!4606 (index!20651 (_ BitVec 32))) )
))
(declare-fun lt!245098 () SeekEntryResult!4606)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!531797 (= res!327343 (or (= lt!245098 (MissingZero!4606 i!1153)) (= lt!245098 (MissingVacant!4606 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33701 (_ BitVec 32)) SeekEntryResult!4606)

(assert (=> b!531797 (= lt!245098 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!531798 () Bool)

(declare-fun res!327342 () Bool)

(assert (=> b!531798 (=> (not res!327342) (not e!309712))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33701 (_ BitVec 32)) Bool)

(assert (=> b!531798 (= res!327342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!531799 () Bool)

(declare-fun res!327346 () Bool)

(assert (=> b!531799 (=> (not res!327346) (not e!309713))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!531799 (= res!327346 (validKeyInArray!0 k0!1998))))

(declare-fun b!531800 () Bool)

(declare-fun res!327345 () Bool)

(assert (=> b!531800 (=> (not res!327345) (not e!309713))))

(assert (=> b!531800 (= res!327345 (validKeyInArray!0 (select (arr!16192 a!3154) j!147)))))

(declare-fun res!327341 () Bool)

(assert (=> start!48394 (=> (not res!327341) (not e!309713))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48394 (= res!327341 (validMask!0 mask!3216))))

(assert (=> start!48394 e!309713))

(assert (=> start!48394 true))

(declare-fun array_inv!12051 (array!33701) Bool)

(assert (=> start!48394 (array_inv!12051 a!3154)))

(declare-fun b!531801 () Bool)

(declare-fun res!327340 () Bool)

(assert (=> b!531801 (=> (not res!327340) (not e!309712))))

(declare-datatypes ((List!10218 0))(
  ( (Nil!10215) (Cons!10214 (h!11154 (_ BitVec 64)) (t!16438 List!10218)) )
))
(declare-fun arrayNoDuplicates!0 (array!33701 (_ BitVec 32) List!10218) Bool)

(assert (=> b!531801 (= res!327340 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10215))))

(declare-fun b!531802 () Bool)

(declare-fun res!327339 () Bool)

(assert (=> b!531802 (=> (not res!327339) (not e!309713))))

(assert (=> b!531802 (= res!327339 (and (= (size!16556 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16556 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16556 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48394 res!327341) b!531802))

(assert (= (and b!531802 res!327339) b!531800))

(assert (= (and b!531800 res!327345) b!531799))

(assert (= (and b!531799 res!327346) b!531796))

(assert (= (and b!531796 res!327344) b!531797))

(assert (= (and b!531797 res!327343) b!531798))

(assert (= (and b!531798 res!327342) b!531801))

(assert (= (and b!531801 res!327340) b!531795))

(declare-fun m!512383 () Bool)

(assert (=> b!531795 m!512383))

(declare-fun m!512385 () Bool)

(assert (=> b!531795 m!512385))

(declare-fun m!512387 () Bool)

(assert (=> start!48394 m!512387))

(declare-fun m!512389 () Bool)

(assert (=> start!48394 m!512389))

(assert (=> b!531800 m!512385))

(assert (=> b!531800 m!512385))

(declare-fun m!512391 () Bool)

(assert (=> b!531800 m!512391))

(declare-fun m!512393 () Bool)

(assert (=> b!531796 m!512393))

(declare-fun m!512395 () Bool)

(assert (=> b!531798 m!512395))

(declare-fun m!512397 () Bool)

(assert (=> b!531799 m!512397))

(declare-fun m!512399 () Bool)

(assert (=> b!531797 m!512399))

(declare-fun m!512401 () Bool)

(assert (=> b!531801 m!512401))

(check-sat (not b!531801) (not b!531796) (not b!531800) (not b!531799) (not b!531797) (not start!48394) (not b!531798))
(check-sat)
