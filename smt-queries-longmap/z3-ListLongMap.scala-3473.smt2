; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48182 () Bool)

(assert start!48182)

(declare-fun b!530554 () Bool)

(declare-fun res!326260 () Bool)

(declare-fun e!309110 () Bool)

(assert (=> b!530554 (=> (not res!326260) (not e!309110))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33607 0))(
  ( (array!33608 (arr!16150 (Array (_ BitVec 32) (_ BitVec 64))) (size!16514 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33607)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530554 (= res!326260 (and (= (size!16514 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16514 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16514 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!530555 () Bool)

(assert (=> b!530555 (= e!309110 false)))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4608 0))(
  ( (MissingZero!4608 (index!20656 (_ BitVec 32))) (Found!4608 (index!20657 (_ BitVec 32))) (Intermediate!4608 (undefined!5420 Bool) (index!20658 (_ BitVec 32)) (x!49646 (_ BitVec 32))) (Undefined!4608) (MissingVacant!4608 (index!20659 (_ BitVec 32))) )
))
(declare-fun lt!244762 () SeekEntryResult!4608)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33607 (_ BitVec 32)) SeekEntryResult!4608)

(assert (=> b!530555 (= lt!244762 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!530556 () Bool)

(declare-fun res!326263 () Bool)

(assert (=> b!530556 (=> (not res!326263) (not e!309110))))

(declare-fun arrayContainsKey!0 (array!33607 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530556 (= res!326263 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!530557 () Bool)

(declare-fun res!326261 () Bool)

(assert (=> b!530557 (=> (not res!326261) (not e!309110))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530557 (= res!326261 (validKeyInArray!0 (select (arr!16150 a!3154) j!147)))))

(declare-fun res!326264 () Bool)

(assert (=> start!48182 (=> (not res!326264) (not e!309110))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48182 (= res!326264 (validMask!0 mask!3216))))

(assert (=> start!48182 e!309110))

(assert (=> start!48182 true))

(declare-fun array_inv!11946 (array!33607) Bool)

(assert (=> start!48182 (array_inv!11946 a!3154)))

(declare-fun b!530558 () Bool)

(declare-fun res!326262 () Bool)

(assert (=> b!530558 (=> (not res!326262) (not e!309110))))

(assert (=> b!530558 (= res!326262 (validKeyInArray!0 k0!1998))))

(assert (= (and start!48182 res!326264) b!530554))

(assert (= (and b!530554 res!326260) b!530557))

(assert (= (and b!530557 res!326261) b!530558))

(assert (= (and b!530558 res!326262) b!530556))

(assert (= (and b!530556 res!326263) b!530555))

(declare-fun m!511127 () Bool)

(assert (=> b!530557 m!511127))

(assert (=> b!530557 m!511127))

(declare-fun m!511129 () Bool)

(assert (=> b!530557 m!511129))

(declare-fun m!511131 () Bool)

(assert (=> b!530556 m!511131))

(declare-fun m!511133 () Bool)

(assert (=> b!530555 m!511133))

(declare-fun m!511135 () Bool)

(assert (=> b!530558 m!511135))

(declare-fun m!511137 () Bool)

(assert (=> start!48182 m!511137))

(declare-fun m!511139 () Bool)

(assert (=> start!48182 m!511139))

(check-sat (not start!48182) (not b!530558) (not b!530555) (not b!530556) (not b!530557))
