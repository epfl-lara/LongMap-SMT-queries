; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46002 () Bool)

(assert start!46002)

(declare-fun b!509216 () Bool)

(declare-fun e!297768 () Bool)

(assert (=> b!509216 (= e!297768 (not true))))

(declare-datatypes ((SeekEntryResult!4204 0))(
  ( (MissingZero!4204 (index!19004 (_ BitVec 32))) (Found!4204 (index!19005 (_ BitVec 32))) (Intermediate!4204 (undefined!5016 Bool) (index!19006 (_ BitVec 32)) (x!47984 (_ BitVec 32))) (Undefined!4204) (MissingVacant!4204 (index!19007 (_ BitVec 32))) )
))
(declare-fun lt!232519 () SeekEntryResult!4204)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32723 0))(
  ( (array!32724 (arr!15740 (Array (_ BitVec 32) (_ BitVec 64))) (size!16105 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32723)

(declare-fun lt!232517 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32723 (_ BitVec 32)) SeekEntryResult!4204)

(assert (=> b!509216 (= lt!232519 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232517 (select (store (arr!15740 a!3235) i!1204 k0!2280) j!176) (array!32724 (store (arr!15740 a!3235) i!1204 k0!2280) (size!16105 a!3235)) mask!3524))))

(declare-fun lt!232516 () (_ BitVec 32))

(declare-fun lt!232515 () SeekEntryResult!4204)

(assert (=> b!509216 (= lt!232515 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232516 (select (arr!15740 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509216 (= lt!232517 (toIndex!0 (select (store (arr!15740 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!509216 (= lt!232516 (toIndex!0 (select (arr!15740 a!3235) j!176) mask!3524))))

(declare-fun e!297770 () Bool)

(assert (=> b!509216 e!297770))

(declare-fun res!310208 () Bool)

(assert (=> b!509216 (=> (not res!310208) (not e!297770))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32723 (_ BitVec 32)) Bool)

(assert (=> b!509216 (= res!310208 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15652 0))(
  ( (Unit!15653) )
))
(declare-fun lt!232518 () Unit!15652)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32723 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15652)

(assert (=> b!509216 (= lt!232518 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!509217 () Bool)

(declare-fun res!310207 () Bool)

(declare-fun e!297771 () Bool)

(assert (=> b!509217 (=> (not res!310207) (not e!297771))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509217 (= res!310207 (validKeyInArray!0 k0!2280))))

(declare-fun b!509218 () Bool)

(declare-fun res!310211 () Bool)

(assert (=> b!509218 (=> (not res!310211) (not e!297771))))

(assert (=> b!509218 (= res!310211 (and (= (size!16105 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16105 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16105 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509219 () Bool)

(declare-fun res!310209 () Bool)

(assert (=> b!509219 (=> (not res!310209) (not e!297768))))

(assert (=> b!509219 (= res!310209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509220 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32723 (_ BitVec 32)) SeekEntryResult!4204)

(assert (=> b!509220 (= e!297770 (= (seekEntryOrOpen!0 (select (arr!15740 a!3235) j!176) a!3235 mask!3524) (Found!4204 j!176)))))

(declare-fun res!310205 () Bool)

(assert (=> start!46002 (=> (not res!310205) (not e!297771))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46002 (= res!310205 (validMask!0 mask!3524))))

(assert (=> start!46002 e!297771))

(assert (=> start!46002 true))

(declare-fun array_inv!11623 (array!32723) Bool)

(assert (=> start!46002 (array_inv!11623 a!3235)))

(declare-fun b!509221 () Bool)

(declare-fun res!310210 () Bool)

(assert (=> b!509221 (=> (not res!310210) (not e!297771))))

(declare-fun arrayContainsKey!0 (array!32723 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509221 (= res!310210 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509222 () Bool)

(declare-fun res!310204 () Bool)

(assert (=> b!509222 (=> (not res!310204) (not e!297768))))

(declare-datatypes ((List!9937 0))(
  ( (Nil!9934) (Cons!9933 (h!10810 (_ BitVec 64)) (t!16156 List!9937)) )
))
(declare-fun arrayNoDuplicates!0 (array!32723 (_ BitVec 32) List!9937) Bool)

(assert (=> b!509222 (= res!310204 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9934))))

(declare-fun b!509223 () Bool)

(assert (=> b!509223 (= e!297771 e!297768)))

(declare-fun res!310203 () Bool)

(assert (=> b!509223 (=> (not res!310203) (not e!297768))))

(declare-fun lt!232514 () SeekEntryResult!4204)

(assert (=> b!509223 (= res!310203 (or (= lt!232514 (MissingZero!4204 i!1204)) (= lt!232514 (MissingVacant!4204 i!1204))))))

(assert (=> b!509223 (= lt!232514 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!509224 () Bool)

(declare-fun res!310206 () Bool)

(assert (=> b!509224 (=> (not res!310206) (not e!297771))))

(assert (=> b!509224 (= res!310206 (validKeyInArray!0 (select (arr!15740 a!3235) j!176)))))

(assert (= (and start!46002 res!310205) b!509218))

(assert (= (and b!509218 res!310211) b!509224))

(assert (= (and b!509224 res!310206) b!509217))

(assert (= (and b!509217 res!310207) b!509221))

(assert (= (and b!509221 res!310210) b!509223))

(assert (= (and b!509223 res!310203) b!509219))

(assert (= (and b!509219 res!310209) b!509222))

(assert (= (and b!509222 res!310204) b!509216))

(assert (= (and b!509216 res!310208) b!509220))

(declare-fun m!489637 () Bool)

(assert (=> b!509223 m!489637))

(declare-fun m!489639 () Bool)

(assert (=> b!509219 m!489639))

(declare-fun m!489641 () Bool)

(assert (=> b!509222 m!489641))

(declare-fun m!489643 () Bool)

(assert (=> b!509217 m!489643))

(declare-fun m!489645 () Bool)

(assert (=> start!46002 m!489645))

(declare-fun m!489647 () Bool)

(assert (=> start!46002 m!489647))

(declare-fun m!489649 () Bool)

(assert (=> b!509216 m!489649))

(declare-fun m!489651 () Bool)

(assert (=> b!509216 m!489651))

(declare-fun m!489653 () Bool)

(assert (=> b!509216 m!489653))

(declare-fun m!489655 () Bool)

(assert (=> b!509216 m!489655))

(declare-fun m!489657 () Bool)

(assert (=> b!509216 m!489657))

(assert (=> b!509216 m!489655))

(declare-fun m!489659 () Bool)

(assert (=> b!509216 m!489659))

(declare-fun m!489661 () Bool)

(assert (=> b!509216 m!489661))

(assert (=> b!509216 m!489653))

(declare-fun m!489663 () Bool)

(assert (=> b!509216 m!489663))

(assert (=> b!509216 m!489655))

(assert (=> b!509216 m!489653))

(declare-fun m!489665 () Bool)

(assert (=> b!509216 m!489665))

(assert (=> b!509224 m!489655))

(assert (=> b!509224 m!489655))

(declare-fun m!489667 () Bool)

(assert (=> b!509224 m!489667))

(declare-fun m!489669 () Bool)

(assert (=> b!509221 m!489669))

(assert (=> b!509220 m!489655))

(assert (=> b!509220 m!489655))

(declare-fun m!489671 () Bool)

(assert (=> b!509220 m!489671))

(check-sat (not b!509219) (not b!509217) (not start!46002) (not b!509221) (not b!509216) (not b!509220) (not b!509224) (not b!509223) (not b!509222))
(check-sat)
