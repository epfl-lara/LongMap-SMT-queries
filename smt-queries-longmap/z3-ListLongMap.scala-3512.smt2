; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48630 () Bool)

(assert start!48630)

(declare-fun res!329404 () Bool)

(declare-fun e!310504 () Bool)

(assert (=> start!48630 (=> (not res!329404) (not e!310504))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48630 (= res!329404 (validMask!0 mask!3216))))

(assert (=> start!48630 e!310504))

(assert (=> start!48630 true))

(declare-datatypes ((array!33852 0))(
  ( (array!33853 (arr!16265 (Array (_ BitVec 32) (_ BitVec 64))) (size!16630 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33852)

(declare-fun array_inv!12148 (array!33852) Bool)

(assert (=> start!48630 (array_inv!12148 a!3154)))

(declare-fun b!534055 () Bool)

(declare-fun e!310505 () Bool)

(assert (=> b!534055 (= e!310505 false)))

(declare-datatypes ((SeekEntryResult!4720 0))(
  ( (MissingZero!4720 (index!21104 (_ BitVec 32))) (Found!4720 (index!21105 (_ BitVec 32))) (Intermediate!4720 (undefined!5532 Bool) (index!21106 (_ BitVec 32)) (x!50074 (_ BitVec 32))) (Undefined!4720) (MissingVacant!4720 (index!21107 (_ BitVec 32))) )
))
(declare-fun lt!245376 () SeekEntryResult!4720)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33852 (_ BitVec 32)) SeekEntryResult!4720)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534055 (= lt!245376 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16265 a!3154) j!147) mask!3216) (select (arr!16265 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534056 () Bool)

(declare-fun res!329405 () Bool)

(assert (=> b!534056 (=> (not res!329405) (not e!310505))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!534056 (= res!329405 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16265 a!3154) j!147) a!3154 mask!3216) (Intermediate!4720 false resIndex!32 resX!32)))))

(declare-fun b!534057 () Bool)

(declare-fun res!329403 () Bool)

(assert (=> b!534057 (=> (not res!329403) (not e!310504))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33852 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534057 (= res!329403 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534058 () Bool)

(declare-fun res!329406 () Bool)

(assert (=> b!534058 (=> (not res!329406) (not e!310505))))

(declare-datatypes ((List!10423 0))(
  ( (Nil!10420) (Cons!10419 (h!11362 (_ BitVec 64)) (t!16642 List!10423)) )
))
(declare-fun arrayNoDuplicates!0 (array!33852 (_ BitVec 32) List!10423) Bool)

(assert (=> b!534058 (= res!329406 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10420))))

(declare-fun b!534059 () Bool)

(declare-fun res!329408 () Bool)

(assert (=> b!534059 (=> (not res!329408) (not e!310505))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33852 (_ BitVec 32)) Bool)

(assert (=> b!534059 (= res!329408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534060 () Bool)

(declare-fun res!329402 () Bool)

(assert (=> b!534060 (=> (not res!329402) (not e!310504))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534060 (= res!329402 (and (= (size!16630 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16630 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16630 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534061 () Bool)

(assert (=> b!534061 (= e!310504 e!310505)))

(declare-fun res!329410 () Bool)

(assert (=> b!534061 (=> (not res!329410) (not e!310505))))

(declare-fun lt!245377 () SeekEntryResult!4720)

(assert (=> b!534061 (= res!329410 (or (= lt!245377 (MissingZero!4720 i!1153)) (= lt!245377 (MissingVacant!4720 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33852 (_ BitVec 32)) SeekEntryResult!4720)

(assert (=> b!534061 (= lt!245377 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!534062 () Bool)

(declare-fun res!329409 () Bool)

(assert (=> b!534062 (=> (not res!329409) (not e!310504))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534062 (= res!329409 (validKeyInArray!0 k0!1998))))

(declare-fun b!534063 () Bool)

(declare-fun res!329407 () Bool)

(assert (=> b!534063 (=> (not res!329407) (not e!310504))))

(assert (=> b!534063 (= res!329407 (validKeyInArray!0 (select (arr!16265 a!3154) j!147)))))

(declare-fun b!534064 () Bool)

(declare-fun res!329411 () Bool)

(assert (=> b!534064 (=> (not res!329411) (not e!310505))))

(assert (=> b!534064 (= res!329411 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16630 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16630 a!3154)) (= (select (arr!16265 a!3154) resIndex!32) (select (arr!16265 a!3154) j!147))))))

(assert (= (and start!48630 res!329404) b!534060))

(assert (= (and b!534060 res!329402) b!534063))

(assert (= (and b!534063 res!329407) b!534062))

(assert (= (and b!534062 res!329409) b!534057))

(assert (= (and b!534057 res!329403) b!534061))

(assert (= (and b!534061 res!329410) b!534059))

(assert (= (and b!534059 res!329408) b!534058))

(assert (= (and b!534058 res!329406) b!534064))

(assert (= (and b!534064 res!329411) b!534056))

(assert (= (and b!534056 res!329405) b!534055))

(declare-fun m!513307 () Bool)

(assert (=> b!534063 m!513307))

(assert (=> b!534063 m!513307))

(declare-fun m!513309 () Bool)

(assert (=> b!534063 m!513309))

(declare-fun m!513311 () Bool)

(assert (=> start!48630 m!513311))

(declare-fun m!513313 () Bool)

(assert (=> start!48630 m!513313))

(declare-fun m!513315 () Bool)

(assert (=> b!534059 m!513315))

(assert (=> b!534056 m!513307))

(assert (=> b!534056 m!513307))

(declare-fun m!513317 () Bool)

(assert (=> b!534056 m!513317))

(declare-fun m!513319 () Bool)

(assert (=> b!534058 m!513319))

(declare-fun m!513321 () Bool)

(assert (=> b!534057 m!513321))

(declare-fun m!513323 () Bool)

(assert (=> b!534062 m!513323))

(assert (=> b!534055 m!513307))

(assert (=> b!534055 m!513307))

(declare-fun m!513325 () Bool)

(assert (=> b!534055 m!513325))

(assert (=> b!534055 m!513325))

(assert (=> b!534055 m!513307))

(declare-fun m!513327 () Bool)

(assert (=> b!534055 m!513327))

(declare-fun m!513329 () Bool)

(assert (=> b!534064 m!513329))

(assert (=> b!534064 m!513307))

(declare-fun m!513331 () Bool)

(assert (=> b!534061 m!513331))

(check-sat (not b!534062) (not start!48630) (not b!534059) (not b!534058) (not b!534061) (not b!534063) (not b!534056) (not b!534055) (not b!534057))
(check-sat)
