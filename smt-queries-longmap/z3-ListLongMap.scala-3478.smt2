; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48212 () Bool)

(assert start!48212)

(declare-fun b!530788 () Bool)

(declare-fun res!326497 () Bool)

(declare-fun e!309201 () Bool)

(assert (=> b!530788 (=> (not res!326497) (not e!309201))))

(declare-datatypes ((array!33637 0))(
  ( (array!33638 (arr!16165 (Array (_ BitVec 32) (_ BitVec 64))) (size!16529 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33637)

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33637 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530788 (= res!326497 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!530789 () Bool)

(declare-fun res!326494 () Bool)

(assert (=> b!530789 (=> (not res!326494) (not e!309201))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530789 (= res!326494 (validKeyInArray!0 (select (arr!16165 a!3154) j!147)))))

(declare-fun res!326495 () Bool)

(assert (=> start!48212 (=> (not res!326495) (not e!309201))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48212 (= res!326495 (validMask!0 mask!3216))))

(assert (=> start!48212 e!309201))

(assert (=> start!48212 true))

(declare-fun array_inv!11961 (array!33637) Bool)

(assert (=> start!48212 (array_inv!11961 a!3154)))

(declare-fun b!530790 () Bool)

(declare-fun res!326498 () Bool)

(assert (=> b!530790 (=> (not res!326498) (not e!309201))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530790 (= res!326498 (and (= (size!16529 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16529 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16529 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!530791 () Bool)

(assert (=> b!530791 (= e!309201 false)))

(declare-datatypes ((SeekEntryResult!4623 0))(
  ( (MissingZero!4623 (index!20716 (_ BitVec 32))) (Found!4623 (index!20717 (_ BitVec 32))) (Intermediate!4623 (undefined!5435 Bool) (index!20718 (_ BitVec 32)) (x!49701 (_ BitVec 32))) (Undefined!4623) (MissingVacant!4623 (index!20719 (_ BitVec 32))) )
))
(declare-fun lt!244798 () SeekEntryResult!4623)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33637 (_ BitVec 32)) SeekEntryResult!4623)

(assert (=> b!530791 (= lt!244798 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!530792 () Bool)

(declare-fun res!326496 () Bool)

(assert (=> b!530792 (=> (not res!326496) (not e!309201))))

(assert (=> b!530792 (= res!326496 (validKeyInArray!0 k0!1998))))

(assert (= (and start!48212 res!326495) b!530790))

(assert (= (and b!530790 res!326498) b!530789))

(assert (= (and b!530789 res!326494) b!530792))

(assert (= (and b!530792 res!326496) b!530788))

(assert (= (and b!530788 res!326497) b!530791))

(declare-fun m!511337 () Bool)

(assert (=> b!530788 m!511337))

(declare-fun m!511339 () Bool)

(assert (=> b!530792 m!511339))

(declare-fun m!511341 () Bool)

(assert (=> start!48212 m!511341))

(declare-fun m!511343 () Bool)

(assert (=> start!48212 m!511343))

(declare-fun m!511345 () Bool)

(assert (=> b!530791 m!511345))

(declare-fun m!511347 () Bool)

(assert (=> b!530789 m!511347))

(assert (=> b!530789 m!511347))

(declare-fun m!511349 () Bool)

(assert (=> b!530789 m!511349))

(check-sat (not b!530788) (not b!530789) (not b!530792) (not start!48212) (not b!530791))
