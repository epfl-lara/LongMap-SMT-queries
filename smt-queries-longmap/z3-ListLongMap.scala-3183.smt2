; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44714 () Bool)

(assert start!44714)

(declare-fun b!490805 () Bool)

(declare-fun e!288456 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(assert (=> b!490805 (= e!288456 (bvsge mask!3524 #b00000000000000000000000000000000))))

(declare-datatypes ((array!31774 0))(
  ( (array!31775 (arr!15274 (Array (_ BitVec 32) (_ BitVec 64))) (size!15638 (_ BitVec 32))) )
))
(declare-fun lt!221793 () array!31774)

(declare-fun lt!221791 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3697 0))(
  ( (MissingZero!3697 (index!16967 (_ BitVec 32))) (Found!3697 (index!16968 (_ BitVec 32))) (Intermediate!3697 (undefined!4509 Bool) (index!16969 (_ BitVec 32)) (x!46208 (_ BitVec 32))) (Undefined!3697) (MissingVacant!3697 (index!16970 (_ BitVec 32))) )
))
(declare-fun lt!221794 () SeekEntryResult!3697)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31774 (_ BitVec 32)) SeekEntryResult!3697)

(assert (=> b!490805 (= lt!221794 (seekEntryOrOpen!0 lt!221791 lt!221793 mask!3524))))

(declare-datatypes ((Unit!14401 0))(
  ( (Unit!14402) )
))
(declare-fun lt!221790 () Unit!14401)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun a!3235 () array!31774)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31774 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14401)

(assert (=> b!490805 (= lt!221790 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!490806 () Bool)

(declare-fun res!293795 () Bool)

(declare-fun e!288459 () Bool)

(assert (=> b!490806 (=> (not res!293795) (not e!288459))))

(declare-fun arrayContainsKey!0 (array!31774 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490806 (= res!293795 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490807 () Bool)

(declare-fun res!293799 () Bool)

(assert (=> b!490807 (=> (not res!293799) (not e!288459))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490807 (= res!293799 (validKeyInArray!0 k0!2280))))

(declare-fun b!490808 () Bool)

(declare-fun e!288458 () Bool)

(assert (=> b!490808 (= e!288458 (not e!288456))))

(declare-fun res!293797 () Bool)

(assert (=> b!490808 (=> res!293797 e!288456)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31774 (_ BitVec 32)) SeekEntryResult!3697)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490808 (= res!293797 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15274 a!3235) j!176) mask!3524) (select (arr!15274 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221791 mask!3524) lt!221791 lt!221793 mask!3524))))))

(assert (=> b!490808 (= lt!221791 (select (store (arr!15274 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!490808 (= lt!221793 (array!31775 (store (arr!15274 a!3235) i!1204 k0!2280) (size!15638 a!3235)))))

(assert (=> b!490808 (= lt!221794 (Found!3697 j!176))))

(assert (=> b!490808 (= lt!221794 (seekEntryOrOpen!0 (select (arr!15274 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31774 (_ BitVec 32)) Bool)

(assert (=> b!490808 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!221792 () Unit!14401)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31774 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14401)

(assert (=> b!490808 (= lt!221792 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490809 () Bool)

(assert (=> b!490809 (= e!288459 e!288458)))

(declare-fun res!293796 () Bool)

(assert (=> b!490809 (=> (not res!293796) (not e!288458))))

(declare-fun lt!221789 () SeekEntryResult!3697)

(assert (=> b!490809 (= res!293796 (or (= lt!221789 (MissingZero!3697 i!1204)) (= lt!221789 (MissingVacant!3697 i!1204))))))

(assert (=> b!490809 (= lt!221789 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!490810 () Bool)

(declare-fun res!293800 () Bool)

(assert (=> b!490810 (=> (not res!293800) (not e!288459))))

(assert (=> b!490810 (= res!293800 (and (= (size!15638 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15638 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15638 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490811 () Bool)

(declare-fun res!293802 () Bool)

(assert (=> b!490811 (=> (not res!293802) (not e!288458))))

(assert (=> b!490811 (= res!293802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!293801 () Bool)

(assert (=> start!44714 (=> (not res!293801) (not e!288459))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44714 (= res!293801 (validMask!0 mask!3524))))

(assert (=> start!44714 e!288459))

(assert (=> start!44714 true))

(declare-fun array_inv!11133 (array!31774) Bool)

(assert (=> start!44714 (array_inv!11133 a!3235)))

(declare-fun b!490812 () Bool)

(declare-fun res!293803 () Bool)

(assert (=> b!490812 (=> (not res!293803) (not e!288459))))

(assert (=> b!490812 (= res!293803 (validKeyInArray!0 (select (arr!15274 a!3235) j!176)))))

(declare-fun b!490813 () Bool)

(declare-fun res!293798 () Bool)

(assert (=> b!490813 (=> (not res!293798) (not e!288458))))

(declare-datatypes ((List!9339 0))(
  ( (Nil!9336) (Cons!9335 (h!10197 (_ BitVec 64)) (t!15559 List!9339)) )
))
(declare-fun arrayNoDuplicates!0 (array!31774 (_ BitVec 32) List!9339) Bool)

(assert (=> b!490813 (= res!293798 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9336))))

(assert (= (and start!44714 res!293801) b!490810))

(assert (= (and b!490810 res!293800) b!490812))

(assert (= (and b!490812 res!293803) b!490807))

(assert (= (and b!490807 res!293799) b!490806))

(assert (= (and b!490806 res!293795) b!490809))

(assert (= (and b!490809 res!293796) b!490811))

(assert (= (and b!490811 res!293802) b!490813))

(assert (= (and b!490813 res!293798) b!490808))

(assert (= (and b!490808 (not res!293797)) b!490805))

(declare-fun m!471361 () Bool)

(assert (=> b!490808 m!471361))

(declare-fun m!471363 () Bool)

(assert (=> b!490808 m!471363))

(declare-fun m!471365 () Bool)

(assert (=> b!490808 m!471365))

(declare-fun m!471367 () Bool)

(assert (=> b!490808 m!471367))

(declare-fun m!471369 () Bool)

(assert (=> b!490808 m!471369))

(declare-fun m!471371 () Bool)

(assert (=> b!490808 m!471371))

(assert (=> b!490808 m!471369))

(assert (=> b!490808 m!471367))

(assert (=> b!490808 m!471369))

(declare-fun m!471373 () Bool)

(assert (=> b!490808 m!471373))

(assert (=> b!490808 m!471369))

(declare-fun m!471375 () Bool)

(assert (=> b!490808 m!471375))

(declare-fun m!471377 () Bool)

(assert (=> b!490808 m!471377))

(assert (=> b!490808 m!471363))

(declare-fun m!471379 () Bool)

(assert (=> b!490808 m!471379))

(declare-fun m!471381 () Bool)

(assert (=> b!490811 m!471381))

(declare-fun m!471383 () Bool)

(assert (=> start!44714 m!471383))

(declare-fun m!471385 () Bool)

(assert (=> start!44714 m!471385))

(declare-fun m!471387 () Bool)

(assert (=> b!490813 m!471387))

(declare-fun m!471389 () Bool)

(assert (=> b!490807 m!471389))

(declare-fun m!471391 () Bool)

(assert (=> b!490805 m!471391))

(declare-fun m!471393 () Bool)

(assert (=> b!490805 m!471393))

(assert (=> b!490812 m!471369))

(assert (=> b!490812 m!471369))

(declare-fun m!471395 () Bool)

(assert (=> b!490812 m!471395))

(declare-fun m!471397 () Bool)

(assert (=> b!490809 m!471397))

(declare-fun m!471399 () Bool)

(assert (=> b!490806 m!471399))

(check-sat (not b!490809) (not b!490807) (not start!44714) (not b!490813) (not b!490808) (not b!490812) (not b!490805) (not b!490806) (not b!490811))
(check-sat)
