; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48580 () Bool)

(assert start!48580)

(declare-fun b!533464 () Bool)

(declare-fun res!328724 () Bool)

(declare-fun e!310398 () Bool)

(assert (=> b!533464 (=> (not res!328724) (not e!310398))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33791 0))(
  ( (array!33792 (arr!16234 (Array (_ BitVec 32) (_ BitVec 64))) (size!16598 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33791)

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun index!1177 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4648 0))(
  ( (MissingZero!4648 (index!20816 (_ BitVec 32))) (Found!4648 (index!20817 (_ BitVec 32))) (Intermediate!4648 (undefined!5460 Bool) (index!20818 (_ BitVec 32)) (x!49932 (_ BitVec 32))) (Undefined!4648) (MissingVacant!4648 (index!20819 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33791 (_ BitVec 32)) SeekEntryResult!4648)

(assert (=> b!533464 (= res!328724 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16234 a!3154) j!147) a!3154 mask!3216) (Intermediate!4648 false resIndex!32 resX!32)))))

(declare-fun b!533465 () Bool)

(declare-fun res!328732 () Bool)

(declare-fun e!310397 () Bool)

(assert (=> b!533465 (=> (not res!328732) (not e!310397))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533465 (= res!328732 (validKeyInArray!0 (select (arr!16234 a!3154) j!147)))))

(declare-fun b!533466 () Bool)

(declare-fun res!328727 () Bool)

(assert (=> b!533466 (=> (not res!328727) (not e!310397))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33791 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533466 (= res!328727 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533467 () Bool)

(declare-fun res!328731 () Bool)

(assert (=> b!533467 (=> (not res!328731) (not e!310398))))

(assert (=> b!533467 (= res!328731 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16598 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16598 a!3154)) (= (select (arr!16234 a!3154) resIndex!32) (select (arr!16234 a!3154) j!147))))))

(declare-fun b!533468 () Bool)

(declare-fun res!328723 () Bool)

(assert (=> b!533468 (=> (not res!328723) (not e!310398))))

(declare-datatypes ((List!10260 0))(
  ( (Nil!10257) (Cons!10256 (h!11199 (_ BitVec 64)) (t!16480 List!10260)) )
))
(declare-fun arrayNoDuplicates!0 (array!33791 (_ BitVec 32) List!10260) Bool)

(assert (=> b!533468 (= res!328723 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10257))))

(declare-fun b!533469 () Bool)

(assert (=> b!533469 (= e!310397 e!310398)))

(declare-fun res!328728 () Bool)

(assert (=> b!533469 (=> (not res!328728) (not e!310398))))

(declare-fun lt!245467 () SeekEntryResult!4648)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533469 (= res!328728 (or (= lt!245467 (MissingZero!4648 i!1153)) (= lt!245467 (MissingVacant!4648 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33791 (_ BitVec 32)) SeekEntryResult!4648)

(assert (=> b!533469 (= lt!245467 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!533470 () Bool)

(declare-fun res!328726 () Bool)

(assert (=> b!533470 (=> (not res!328726) (not e!310397))))

(assert (=> b!533470 (= res!328726 (validKeyInArray!0 k0!1998))))

(declare-fun res!328730 () Bool)

(assert (=> start!48580 (=> (not res!328730) (not e!310397))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48580 (= res!328730 (validMask!0 mask!3216))))

(assert (=> start!48580 e!310397))

(assert (=> start!48580 true))

(declare-fun array_inv!12093 (array!33791) Bool)

(assert (=> start!48580 (array_inv!12093 a!3154)))

(declare-fun b!533471 () Bool)

(assert (=> b!533471 (= e!310398 (and (bvsge mask!3216 #b00000000000000000000000000000000) (bvslt index!1177 (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsgt x!1030 #b01111111111111111111111111111110)))))

(declare-fun b!533472 () Bool)

(declare-fun res!328729 () Bool)

(assert (=> b!533472 (=> (not res!328729) (not e!310398))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33791 (_ BitVec 32)) Bool)

(assert (=> b!533472 (= res!328729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533473 () Bool)

(declare-fun res!328725 () Bool)

(assert (=> b!533473 (=> (not res!328725) (not e!310397))))

(assert (=> b!533473 (= res!328725 (and (= (size!16598 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16598 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16598 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48580 res!328730) b!533473))

(assert (= (and b!533473 res!328725) b!533465))

(assert (= (and b!533465 res!328732) b!533470))

(assert (= (and b!533470 res!328726) b!533466))

(assert (= (and b!533466 res!328727) b!533469))

(assert (= (and b!533469 res!328728) b!533472))

(assert (= (and b!533472 res!328729) b!533468))

(assert (= (and b!533468 res!328723) b!533467))

(assert (= (and b!533467 res!328731) b!533464))

(assert (= (and b!533464 res!328724) b!533471))

(declare-fun m!513565 () Bool)

(assert (=> b!533467 m!513565))

(declare-fun m!513567 () Bool)

(assert (=> b!533467 m!513567))

(declare-fun m!513569 () Bool)

(assert (=> b!533468 m!513569))

(declare-fun m!513571 () Bool)

(assert (=> b!533466 m!513571))

(declare-fun m!513573 () Bool)

(assert (=> b!533472 m!513573))

(declare-fun m!513575 () Bool)

(assert (=> start!48580 m!513575))

(declare-fun m!513577 () Bool)

(assert (=> start!48580 m!513577))

(declare-fun m!513579 () Bool)

(assert (=> b!533470 m!513579))

(declare-fun m!513581 () Bool)

(assert (=> b!533469 m!513581))

(assert (=> b!533464 m!513567))

(assert (=> b!533464 m!513567))

(declare-fun m!513583 () Bool)

(assert (=> b!533464 m!513583))

(assert (=> b!533465 m!513567))

(assert (=> b!533465 m!513567))

(declare-fun m!513585 () Bool)

(assert (=> b!533465 m!513585))

(check-sat (not b!533465) (not b!533472) (not start!48580) (not b!533469) (not b!533464) (not b!533470) (not b!533468) (not b!533466))
(check-sat)
