; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48656 () Bool)

(assert start!48656)

(declare-fun res!329747 () Bool)

(declare-fun e!310742 () Bool)

(assert (=> start!48656 (=> (not res!329747) (not e!310742))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48656 (= res!329747 (validMask!0 mask!3216))))

(assert (=> start!48656 e!310742))

(assert (=> start!48656 true))

(declare-datatypes ((array!33868 0))(
  ( (array!33869 (arr!16273 (Array (_ BitVec 32) (_ BitVec 64))) (size!16637 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33868)

(declare-fun array_inv!12069 (array!33868) Bool)

(assert (=> start!48656 (array_inv!12069 a!3154)))

(declare-fun b!534536 () Bool)

(declare-fun res!329748 () Bool)

(declare-fun e!310741 () Bool)

(assert (=> b!534536 (=> (not res!329748) (not e!310741))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33868 (_ BitVec 32)) Bool)

(assert (=> b!534536 (= res!329748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534537 () Bool)

(assert (=> b!534537 (= e!310742 e!310741)))

(declare-fun res!329742 () Bool)

(assert (=> b!534537 (=> (not res!329742) (not e!310741))))

(declare-datatypes ((SeekEntryResult!4731 0))(
  ( (MissingZero!4731 (index!21148 (_ BitVec 32))) (Found!4731 (index!21149 (_ BitVec 32))) (Intermediate!4731 (undefined!5543 Bool) (index!21150 (_ BitVec 32)) (x!50106 (_ BitVec 32))) (Undefined!4731) (MissingVacant!4731 (index!21151 (_ BitVec 32))) )
))
(declare-fun lt!245653 () SeekEntryResult!4731)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534537 (= res!329742 (or (= lt!245653 (MissingZero!4731 i!1153)) (= lt!245653 (MissingVacant!4731 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33868 (_ BitVec 32)) SeekEntryResult!4731)

(assert (=> b!534537 (= lt!245653 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!534538 () Bool)

(declare-fun res!329745 () Bool)

(assert (=> b!534538 (=> (not res!329745) (not e!310742))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!534538 (= res!329745 (and (= (size!16637 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16637 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16637 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534539 () Bool)

(declare-fun res!329746 () Bool)

(assert (=> b!534539 (=> (not res!329746) (not e!310742))))

(declare-fun arrayContainsKey!0 (array!33868 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534539 (= res!329746 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534540 () Bool)

(declare-fun res!329749 () Bool)

(assert (=> b!534540 (=> (not res!329749) (not e!310742))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534540 (= res!329749 (validKeyInArray!0 k0!1998))))

(declare-fun b!534541 () Bool)

(declare-fun res!329744 () Bool)

(assert (=> b!534541 (=> (not res!329744) (not e!310741))))

(declare-datatypes ((List!10392 0))(
  ( (Nil!10389) (Cons!10388 (h!11331 (_ BitVec 64)) (t!16620 List!10392)) )
))
(declare-fun arrayNoDuplicates!0 (array!33868 (_ BitVec 32) List!10392) Bool)

(assert (=> b!534541 (= res!329744 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10389))))

(declare-fun b!534542 () Bool)

(declare-fun res!329750 () Bool)

(assert (=> b!534542 (=> (not res!329750) (not e!310741))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33868 (_ BitVec 32)) SeekEntryResult!4731)

(assert (=> b!534542 (= res!329750 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16273 a!3154) j!147) a!3154 mask!3216) (Intermediate!4731 false resIndex!32 resX!32)))))

(declare-fun b!534543 () Bool)

(declare-fun res!329741 () Bool)

(assert (=> b!534543 (=> (not res!329741) (not e!310741))))

(assert (=> b!534543 (= res!329741 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16637 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16637 a!3154)) (= (select (arr!16273 a!3154) resIndex!32) (select (arr!16273 a!3154) j!147))))))

(declare-fun b!534544 () Bool)

(assert (=> b!534544 (= e!310741 false)))

(declare-fun lt!245652 () SeekEntryResult!4731)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534544 (= lt!245652 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16273 a!3154) j!147) mask!3216) (select (arr!16273 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534545 () Bool)

(declare-fun res!329743 () Bool)

(assert (=> b!534545 (=> (not res!329743) (not e!310742))))

(assert (=> b!534545 (= res!329743 (validKeyInArray!0 (select (arr!16273 a!3154) j!147)))))

(assert (= (and start!48656 res!329747) b!534538))

(assert (= (and b!534538 res!329745) b!534545))

(assert (= (and b!534545 res!329743) b!534540))

(assert (= (and b!534540 res!329749) b!534539))

(assert (= (and b!534539 res!329746) b!534537))

(assert (= (and b!534537 res!329742) b!534536))

(assert (= (and b!534536 res!329748) b!534541))

(assert (= (and b!534541 res!329744) b!534543))

(assert (= (and b!534543 res!329741) b!534542))

(assert (= (and b!534542 res!329750) b!534544))

(declare-fun m!514241 () Bool)

(assert (=> start!48656 m!514241))

(declare-fun m!514243 () Bool)

(assert (=> start!48656 m!514243))

(declare-fun m!514245 () Bool)

(assert (=> b!534543 m!514245))

(declare-fun m!514247 () Bool)

(assert (=> b!534543 m!514247))

(declare-fun m!514249 () Bool)

(assert (=> b!534537 m!514249))

(declare-fun m!514251 () Bool)

(assert (=> b!534540 m!514251))

(declare-fun m!514253 () Bool)

(assert (=> b!534539 m!514253))

(assert (=> b!534545 m!514247))

(assert (=> b!534545 m!514247))

(declare-fun m!514255 () Bool)

(assert (=> b!534545 m!514255))

(assert (=> b!534542 m!514247))

(assert (=> b!534542 m!514247))

(declare-fun m!514257 () Bool)

(assert (=> b!534542 m!514257))

(assert (=> b!534544 m!514247))

(assert (=> b!534544 m!514247))

(declare-fun m!514259 () Bool)

(assert (=> b!534544 m!514259))

(assert (=> b!534544 m!514259))

(assert (=> b!534544 m!514247))

(declare-fun m!514261 () Bool)

(assert (=> b!534544 m!514261))

(declare-fun m!514263 () Bool)

(assert (=> b!534541 m!514263))

(declare-fun m!514265 () Bool)

(assert (=> b!534536 m!514265))

(check-sat (not b!534540) (not b!534542) (not b!534536) (not b!534537) (not b!534544) (not b!534541) (not b!534545) (not start!48656) (not b!534539))
(check-sat)
