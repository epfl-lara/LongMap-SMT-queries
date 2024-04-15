; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46026 () Bool)

(assert start!46026)

(declare-fun res!310534 () Bool)

(declare-fun e!297915 () Bool)

(assert (=> start!46026 (=> (not res!310534) (not e!297915))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46026 (= res!310534 (validMask!0 mask!3524))))

(assert (=> start!46026 e!297915))

(assert (=> start!46026 true))

(declare-datatypes ((array!32747 0))(
  ( (array!32748 (arr!15752 (Array (_ BitVec 32) (_ BitVec 64))) (size!16117 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32747)

(declare-fun array_inv!11635 (array!32747) Bool)

(assert (=> start!46026 (array_inv!11635 a!3235)))

(declare-fun b!509540 () Bool)

(declare-fun res!310532 () Bool)

(declare-fun e!297914 () Bool)

(assert (=> b!509540 (=> (not res!310532) (not e!297914))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32747 (_ BitVec 32)) Bool)

(assert (=> b!509540 (= res!310532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509541 () Bool)

(declare-fun res!310527 () Bool)

(assert (=> b!509541 (=> (not res!310527) (not e!297915))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!509541 (= res!310527 (and (= (size!16117 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16117 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16117 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509542 () Bool)

(declare-fun res!310535 () Bool)

(assert (=> b!509542 (=> (not res!310535) (not e!297915))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32747 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509542 (= res!310535 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509543 () Bool)

(declare-fun res!310530 () Bool)

(assert (=> b!509543 (=> (not res!310530) (not e!297914))))

(declare-datatypes ((List!9949 0))(
  ( (Nil!9946) (Cons!9945 (h!10822 (_ BitVec 64)) (t!16168 List!9949)) )
))
(declare-fun arrayNoDuplicates!0 (array!32747 (_ BitVec 32) List!9949) Bool)

(assert (=> b!509543 (= res!310530 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9946))))

(declare-fun b!509544 () Bool)

(declare-fun res!310533 () Bool)

(assert (=> b!509544 (=> (not res!310533) (not e!297915))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509544 (= res!310533 (validKeyInArray!0 k0!2280))))

(declare-fun b!509545 () Bool)

(declare-fun res!310531 () Bool)

(assert (=> b!509545 (=> (not res!310531) (not e!297915))))

(assert (=> b!509545 (= res!310531 (validKeyInArray!0 (select (arr!15752 a!3235) j!176)))))

(declare-fun b!509546 () Bool)

(assert (=> b!509546 (= e!297914 (not true))))

(declare-fun lt!232733 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4216 0))(
  ( (MissingZero!4216 (index!19052 (_ BitVec 32))) (Found!4216 (index!19053 (_ BitVec 32))) (Intermediate!4216 (undefined!5028 Bool) (index!19054 (_ BitVec 32)) (x!48028 (_ BitVec 32))) (Undefined!4216) (MissingVacant!4216 (index!19055 (_ BitVec 32))) )
))
(declare-fun lt!232735 () SeekEntryResult!4216)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32747 (_ BitVec 32)) SeekEntryResult!4216)

(assert (=> b!509546 (= lt!232735 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232733 (select (store (arr!15752 a!3235) i!1204 k0!2280) j!176) (array!32748 (store (arr!15752 a!3235) i!1204 k0!2280) (size!16117 a!3235)) mask!3524))))

(declare-fun lt!232734 () (_ BitVec 32))

(declare-fun lt!232730 () SeekEntryResult!4216)

(assert (=> b!509546 (= lt!232730 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232734 (select (arr!15752 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509546 (= lt!232733 (toIndex!0 (select (store (arr!15752 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!509546 (= lt!232734 (toIndex!0 (select (arr!15752 a!3235) j!176) mask!3524))))

(declare-fun e!297912 () Bool)

(assert (=> b!509546 e!297912))

(declare-fun res!310529 () Bool)

(assert (=> b!509546 (=> (not res!310529) (not e!297912))))

(assert (=> b!509546 (= res!310529 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15676 0))(
  ( (Unit!15677) )
))
(declare-fun lt!232731 () Unit!15676)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32747 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15676)

(assert (=> b!509546 (= lt!232731 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!509547 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32747 (_ BitVec 32)) SeekEntryResult!4216)

(assert (=> b!509547 (= e!297912 (= (seekEntryOrOpen!0 (select (arr!15752 a!3235) j!176) a!3235 mask!3524) (Found!4216 j!176)))))

(declare-fun b!509548 () Bool)

(assert (=> b!509548 (= e!297915 e!297914)))

(declare-fun res!310528 () Bool)

(assert (=> b!509548 (=> (not res!310528) (not e!297914))))

(declare-fun lt!232732 () SeekEntryResult!4216)

(assert (=> b!509548 (= res!310528 (or (= lt!232732 (MissingZero!4216 i!1204)) (= lt!232732 (MissingVacant!4216 i!1204))))))

(assert (=> b!509548 (= lt!232732 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!46026 res!310534) b!509541))

(assert (= (and b!509541 res!310527) b!509545))

(assert (= (and b!509545 res!310531) b!509544))

(assert (= (and b!509544 res!310533) b!509542))

(assert (= (and b!509542 res!310535) b!509548))

(assert (= (and b!509548 res!310528) b!509540))

(assert (= (and b!509540 res!310532) b!509543))

(assert (= (and b!509543 res!310530) b!509546))

(assert (= (and b!509546 res!310529) b!509547))

(declare-fun m!490069 () Bool)

(assert (=> b!509545 m!490069))

(assert (=> b!509545 m!490069))

(declare-fun m!490071 () Bool)

(assert (=> b!509545 m!490071))

(declare-fun m!490073 () Bool)

(assert (=> b!509544 m!490073))

(declare-fun m!490075 () Bool)

(assert (=> b!509548 m!490075))

(declare-fun m!490077 () Bool)

(assert (=> b!509542 m!490077))

(declare-fun m!490079 () Bool)

(assert (=> b!509540 m!490079))

(declare-fun m!490081 () Bool)

(assert (=> b!509543 m!490081))

(declare-fun m!490083 () Bool)

(assert (=> b!509546 m!490083))

(assert (=> b!509546 m!490069))

(declare-fun m!490085 () Bool)

(assert (=> b!509546 m!490085))

(declare-fun m!490087 () Bool)

(assert (=> b!509546 m!490087))

(declare-fun m!490089 () Bool)

(assert (=> b!509546 m!490089))

(assert (=> b!509546 m!490069))

(declare-fun m!490091 () Bool)

(assert (=> b!509546 m!490091))

(assert (=> b!509546 m!490069))

(declare-fun m!490093 () Bool)

(assert (=> b!509546 m!490093))

(assert (=> b!509546 m!490089))

(declare-fun m!490095 () Bool)

(assert (=> b!509546 m!490095))

(assert (=> b!509546 m!490089))

(declare-fun m!490097 () Bool)

(assert (=> b!509546 m!490097))

(declare-fun m!490099 () Bool)

(assert (=> start!46026 m!490099))

(declare-fun m!490101 () Bool)

(assert (=> start!46026 m!490101))

(assert (=> b!509547 m!490069))

(assert (=> b!509547 m!490069))

(declare-fun m!490103 () Bool)

(assert (=> b!509547 m!490103))

(check-sat (not b!509546) (not b!509543) (not b!509542) (not b!509548) (not b!509545) (not b!509544) (not start!46026) (not b!509540) (not b!509547))
(check-sat)
