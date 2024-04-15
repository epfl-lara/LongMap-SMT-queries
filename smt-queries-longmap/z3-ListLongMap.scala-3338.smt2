; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46008 () Bool)

(assert start!46008)

(declare-fun b!509297 () Bool)

(declare-fun e!297805 () Bool)

(declare-fun e!297804 () Bool)

(assert (=> b!509297 (= e!297805 e!297804)))

(declare-fun res!310292 () Bool)

(assert (=> b!509297 (=> (not res!310292) (not e!297804))))

(declare-datatypes ((SeekEntryResult!4207 0))(
  ( (MissingZero!4207 (index!19016 (_ BitVec 32))) (Found!4207 (index!19017 (_ BitVec 32))) (Intermediate!4207 (undefined!5019 Bool) (index!19018 (_ BitVec 32)) (x!47995 (_ BitVec 32))) (Undefined!4207) (MissingVacant!4207 (index!19019 (_ BitVec 32))) )
))
(declare-fun lt!232569 () SeekEntryResult!4207)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!509297 (= res!310292 (or (= lt!232569 (MissingZero!4207 i!1204)) (= lt!232569 (MissingVacant!4207 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32729 0))(
  ( (array!32730 (arr!15743 (Array (_ BitVec 32) (_ BitVec 64))) (size!16108 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32729)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32729 (_ BitVec 32)) SeekEntryResult!4207)

(assert (=> b!509297 (= lt!232569 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!509298 () Bool)

(declare-fun res!310287 () Bool)

(assert (=> b!509298 (=> (not res!310287) (not e!297804))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32729 (_ BitVec 32)) Bool)

(assert (=> b!509298 (= res!310287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509299 () Bool)

(declare-fun res!310291 () Bool)

(assert (=> b!509299 (=> (not res!310291) (not e!297804))))

(declare-datatypes ((List!9940 0))(
  ( (Nil!9937) (Cons!9936 (h!10813 (_ BitVec 64)) (t!16159 List!9940)) )
))
(declare-fun arrayNoDuplicates!0 (array!32729 (_ BitVec 32) List!9940) Bool)

(assert (=> b!509299 (= res!310291 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9937))))

(declare-fun b!509300 () Bool)

(declare-fun res!310284 () Bool)

(assert (=> b!509300 (=> (not res!310284) (not e!297805))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509300 (= res!310284 (validKeyInArray!0 k0!2280))))

(declare-fun res!310290 () Bool)

(assert (=> start!46008 (=> (not res!310290) (not e!297805))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46008 (= res!310290 (validMask!0 mask!3524))))

(assert (=> start!46008 e!297805))

(assert (=> start!46008 true))

(declare-fun array_inv!11626 (array!32729) Bool)

(assert (=> start!46008 (array_inv!11626 a!3235)))

(declare-fun b!509301 () Bool)

(declare-fun res!310285 () Bool)

(assert (=> b!509301 (=> (not res!310285) (not e!297805))))

(declare-fun arrayContainsKey!0 (array!32729 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509301 (= res!310285 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509302 () Bool)

(declare-fun res!310286 () Bool)

(assert (=> b!509302 (=> (not res!310286) (not e!297805))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!509302 (= res!310286 (validKeyInArray!0 (select (arr!15743 a!3235) j!176)))))

(declare-fun b!509303 () Bool)

(declare-fun e!297806 () Bool)

(assert (=> b!509303 (= e!297806 (= (seekEntryOrOpen!0 (select (arr!15743 a!3235) j!176) a!3235 mask!3524) (Found!4207 j!176)))))

(declare-fun b!509304 () Bool)

(declare-fun res!310289 () Bool)

(assert (=> b!509304 (=> (not res!310289) (not e!297805))))

(assert (=> b!509304 (= res!310289 (and (= (size!16108 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16108 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16108 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509305 () Bool)

(assert (=> b!509305 (= e!297804 (not true))))

(declare-fun lt!232572 () SeekEntryResult!4207)

(declare-fun lt!232568 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32729 (_ BitVec 32)) SeekEntryResult!4207)

(assert (=> b!509305 (= lt!232572 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232568 (select (store (arr!15743 a!3235) i!1204 k0!2280) j!176) (array!32730 (store (arr!15743 a!3235) i!1204 k0!2280) (size!16108 a!3235)) mask!3524))))

(declare-fun lt!232571 () SeekEntryResult!4207)

(declare-fun lt!232570 () (_ BitVec 32))

(assert (=> b!509305 (= lt!232571 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232570 (select (arr!15743 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509305 (= lt!232568 (toIndex!0 (select (store (arr!15743 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!509305 (= lt!232570 (toIndex!0 (select (arr!15743 a!3235) j!176) mask!3524))))

(assert (=> b!509305 e!297806))

(declare-fun res!310288 () Bool)

(assert (=> b!509305 (=> (not res!310288) (not e!297806))))

(assert (=> b!509305 (= res!310288 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15658 0))(
  ( (Unit!15659) )
))
(declare-fun lt!232573 () Unit!15658)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32729 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15658)

(assert (=> b!509305 (= lt!232573 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!46008 res!310290) b!509304))

(assert (= (and b!509304 res!310289) b!509302))

(assert (= (and b!509302 res!310286) b!509300))

(assert (= (and b!509300 res!310284) b!509301))

(assert (= (and b!509301 res!310285) b!509297))

(assert (= (and b!509297 res!310292) b!509298))

(assert (= (and b!509298 res!310287) b!509299))

(assert (= (and b!509299 res!310291) b!509305))

(assert (= (and b!509305 res!310288) b!509303))

(declare-fun m!489745 () Bool)

(assert (=> b!509297 m!489745))

(declare-fun m!489747 () Bool)

(assert (=> b!509303 m!489747))

(assert (=> b!509303 m!489747))

(declare-fun m!489749 () Bool)

(assert (=> b!509303 m!489749))

(declare-fun m!489751 () Bool)

(assert (=> b!509300 m!489751))

(assert (=> b!509305 m!489747))

(declare-fun m!489753 () Bool)

(assert (=> b!509305 m!489753))

(declare-fun m!489755 () Bool)

(assert (=> b!509305 m!489755))

(declare-fun m!489757 () Bool)

(assert (=> b!509305 m!489757))

(declare-fun m!489759 () Bool)

(assert (=> b!509305 m!489759))

(assert (=> b!509305 m!489747))

(declare-fun m!489761 () Bool)

(assert (=> b!509305 m!489761))

(assert (=> b!509305 m!489747))

(declare-fun m!489763 () Bool)

(assert (=> b!509305 m!489763))

(assert (=> b!509305 m!489759))

(declare-fun m!489765 () Bool)

(assert (=> b!509305 m!489765))

(assert (=> b!509305 m!489759))

(declare-fun m!489767 () Bool)

(assert (=> b!509305 m!489767))

(declare-fun m!489769 () Bool)

(assert (=> start!46008 m!489769))

(declare-fun m!489771 () Bool)

(assert (=> start!46008 m!489771))

(assert (=> b!509302 m!489747))

(assert (=> b!509302 m!489747))

(declare-fun m!489773 () Bool)

(assert (=> b!509302 m!489773))

(declare-fun m!489775 () Bool)

(assert (=> b!509298 m!489775))

(declare-fun m!489777 () Bool)

(assert (=> b!509299 m!489777))

(declare-fun m!489779 () Bool)

(assert (=> b!509301 m!489779))

(check-sat (not b!509301) (not b!509305) (not b!509297) (not start!46008) (not b!509298) (not b!509302) (not b!509303) (not b!509299) (not b!509300))
(check-sat)
