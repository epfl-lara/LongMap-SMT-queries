; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48596 () Bool)

(assert start!48596)

(declare-fun b!533640 () Bool)

(declare-fun res!328853 () Bool)

(declare-fun e!310471 () Bool)

(assert (=> b!533640 (=> (not res!328853) (not e!310471))))

(declare-datatypes ((array!33808 0))(
  ( (array!33809 (arr!16243 (Array (_ BitVec 32) (_ BitVec 64))) (size!16607 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33808)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533640 (= res!328853 (validKeyInArray!0 (select (arr!16243 a!3154) j!147)))))

(declare-fun b!533641 () Bool)

(declare-fun res!328850 () Bool)

(declare-fun e!310472 () Bool)

(assert (=> b!533641 (=> (not res!328850) (not e!310472))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33808 (_ BitVec 32)) Bool)

(assert (=> b!533641 (= res!328850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533642 () Bool)

(declare-fun res!328846 () Bool)

(assert (=> b!533642 (=> (not res!328846) (not e!310471))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33808 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533642 (= res!328846 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533643 () Bool)

(assert (=> b!533643 (= e!310471 e!310472)))

(declare-fun res!328849 () Bool)

(assert (=> b!533643 (=> (not res!328849) (not e!310472))))

(declare-datatypes ((SeekEntryResult!4701 0))(
  ( (MissingZero!4701 (index!21028 (_ BitVec 32))) (Found!4701 (index!21029 (_ BitVec 32))) (Intermediate!4701 (undefined!5513 Bool) (index!21030 (_ BitVec 32)) (x!49996 (_ BitVec 32))) (Undefined!4701) (MissingVacant!4701 (index!21031 (_ BitVec 32))) )
))
(declare-fun lt!245472 () SeekEntryResult!4701)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533643 (= res!328849 (or (= lt!245472 (MissingZero!4701 i!1153)) (= lt!245472 (MissingVacant!4701 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33808 (_ BitVec 32)) SeekEntryResult!4701)

(assert (=> b!533643 (= lt!245472 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun res!328851 () Bool)

(assert (=> start!48596 (=> (not res!328851) (not e!310471))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48596 (= res!328851 (validMask!0 mask!3216))))

(assert (=> start!48596 e!310471))

(assert (=> start!48596 true))

(declare-fun array_inv!12039 (array!33808) Bool)

(assert (=> start!48596 (array_inv!12039 a!3154)))

(declare-fun b!533644 () Bool)

(assert (=> b!533644 (= e!310472 false)))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!245473 () SeekEntryResult!4701)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33808 (_ BitVec 32)) SeekEntryResult!4701)

(assert (=> b!533644 (= lt!245473 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16243 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!533645 () Bool)

(declare-fun res!328852 () Bool)

(assert (=> b!533645 (=> (not res!328852) (not e!310472))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!533645 (= res!328852 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16607 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16607 a!3154)) (= (select (arr!16243 a!3154) resIndex!32) (select (arr!16243 a!3154) j!147))))))

(declare-fun b!533646 () Bool)

(declare-fun res!328847 () Bool)

(assert (=> b!533646 (=> (not res!328847) (not e!310471))))

(assert (=> b!533646 (= res!328847 (validKeyInArray!0 k0!1998))))

(declare-fun b!533647 () Bool)

(declare-fun res!328845 () Bool)

(assert (=> b!533647 (=> (not res!328845) (not e!310472))))

(declare-datatypes ((List!10362 0))(
  ( (Nil!10359) (Cons!10358 (h!11301 (_ BitVec 64)) (t!16590 List!10362)) )
))
(declare-fun arrayNoDuplicates!0 (array!33808 (_ BitVec 32) List!10362) Bool)

(assert (=> b!533647 (= res!328845 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10359))))

(declare-fun b!533648 () Bool)

(declare-fun res!328848 () Bool)

(assert (=> b!533648 (=> (not res!328848) (not e!310471))))

(assert (=> b!533648 (= res!328848 (and (= (size!16607 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16607 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16607 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48596 res!328851) b!533648))

(assert (= (and b!533648 res!328848) b!533640))

(assert (= (and b!533640 res!328853) b!533646))

(assert (= (and b!533646 res!328847) b!533642))

(assert (= (and b!533642 res!328846) b!533643))

(assert (= (and b!533643 res!328849) b!533641))

(assert (= (and b!533641 res!328850) b!533647))

(assert (= (and b!533647 res!328845) b!533645))

(assert (= (and b!533645 res!328852) b!533644))

(declare-fun m!513469 () Bool)

(assert (=> b!533643 m!513469))

(declare-fun m!513471 () Bool)

(assert (=> b!533640 m!513471))

(assert (=> b!533640 m!513471))

(declare-fun m!513473 () Bool)

(assert (=> b!533640 m!513473))

(declare-fun m!513475 () Bool)

(assert (=> b!533642 m!513475))

(declare-fun m!513477 () Bool)

(assert (=> start!48596 m!513477))

(declare-fun m!513479 () Bool)

(assert (=> start!48596 m!513479))

(assert (=> b!533644 m!513471))

(assert (=> b!533644 m!513471))

(declare-fun m!513481 () Bool)

(assert (=> b!533644 m!513481))

(declare-fun m!513483 () Bool)

(assert (=> b!533646 m!513483))

(declare-fun m!513485 () Bool)

(assert (=> b!533645 m!513485))

(assert (=> b!533645 m!513471))

(declare-fun m!513487 () Bool)

(assert (=> b!533647 m!513487))

(declare-fun m!513489 () Bool)

(assert (=> b!533641 m!513489))

(check-sat (not b!533644) (not start!48596) (not b!533647) (not b!533641) (not b!533643) (not b!533642) (not b!533646) (not b!533640))
(check-sat)
