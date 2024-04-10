; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46018 () Bool)

(assert start!46018)

(declare-fun b!509541 () Bool)

(declare-fun e!297966 () Bool)

(declare-fun e!297967 () Bool)

(assert (=> b!509541 (= e!297966 e!297967)))

(declare-fun res!310386 () Bool)

(assert (=> b!509541 (=> (not res!310386) (not e!297967))))

(declare-datatypes ((SeekEntryResult!4210 0))(
  ( (MissingZero!4210 (index!19028 (_ BitVec 32))) (Found!4210 (index!19029 (_ BitVec 32))) (Intermediate!4210 (undefined!5022 Bool) (index!19030 (_ BitVec 32)) (x!47995 (_ BitVec 32))) (Undefined!4210) (MissingVacant!4210 (index!19031 (_ BitVec 32))) )
))
(declare-fun lt!232786 () SeekEntryResult!4210)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!509541 (= res!310386 (or (= lt!232786 (MissingZero!4210 i!1204)) (= lt!232786 (MissingVacant!4210 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32729 0))(
  ( (array!32730 (arr!15743 (Array (_ BitVec 32) (_ BitVec 64))) (size!16107 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32729)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32729 (_ BitVec 32)) SeekEntryResult!4210)

(assert (=> b!509541 (= lt!232786 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!509542 () Bool)

(declare-fun res!310390 () Bool)

(assert (=> b!509542 (=> (not res!310390) (not e!297967))))

(declare-datatypes ((List!9901 0))(
  ( (Nil!9898) (Cons!9897 (h!10774 (_ BitVec 64)) (t!16129 List!9901)) )
))
(declare-fun arrayNoDuplicates!0 (array!32729 (_ BitVec 32) List!9901) Bool)

(assert (=> b!509542 (= res!310390 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9898))))

(declare-fun b!509543 () Bool)

(assert (=> b!509543 (= e!297967 (not true))))

(declare-fun lt!232788 () (_ BitVec 32))

(declare-fun lt!232787 () SeekEntryResult!4210)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32729 (_ BitVec 32)) SeekEntryResult!4210)

(assert (=> b!509543 (= lt!232787 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232788 (select (store (arr!15743 a!3235) i!1204 k!2280) j!176) (array!32730 (store (arr!15743 a!3235) i!1204 k!2280) (size!16107 a!3235)) mask!3524))))

(declare-fun lt!232784 () (_ BitVec 32))

(declare-fun lt!232785 () SeekEntryResult!4210)

(assert (=> b!509543 (= lt!232785 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232784 (select (arr!15743 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509543 (= lt!232788 (toIndex!0 (select (store (arr!15743 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!509543 (= lt!232784 (toIndex!0 (select (arr!15743 a!3235) j!176) mask!3524))))

(declare-fun e!297969 () Bool)

(assert (=> b!509543 e!297969))

(declare-fun res!310389 () Bool)

(assert (=> b!509543 (=> (not res!310389) (not e!297969))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32729 (_ BitVec 32)) Bool)

(assert (=> b!509543 (= res!310389 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15678 0))(
  ( (Unit!15679) )
))
(declare-fun lt!232789 () Unit!15678)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32729 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15678)

(assert (=> b!509543 (= lt!232789 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!310388 () Bool)

(assert (=> start!46018 (=> (not res!310388) (not e!297966))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46018 (= res!310388 (validMask!0 mask!3524))))

(assert (=> start!46018 e!297966))

(assert (=> start!46018 true))

(declare-fun array_inv!11539 (array!32729) Bool)

(assert (=> start!46018 (array_inv!11539 a!3235)))

(declare-fun b!509544 () Bool)

(declare-fun res!310394 () Bool)

(assert (=> b!509544 (=> (not res!310394) (not e!297966))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509544 (= res!310394 (validKeyInArray!0 k!2280))))

(declare-fun b!509545 () Bool)

(declare-fun res!310387 () Bool)

(assert (=> b!509545 (=> (not res!310387) (not e!297966))))

(assert (=> b!509545 (= res!310387 (validKeyInArray!0 (select (arr!15743 a!3235) j!176)))))

(declare-fun b!509546 () Bool)

(declare-fun res!310393 () Bool)

(assert (=> b!509546 (=> (not res!310393) (not e!297966))))

(assert (=> b!509546 (= res!310393 (and (= (size!16107 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16107 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16107 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509547 () Bool)

(declare-fun res!310391 () Bool)

(assert (=> b!509547 (=> (not res!310391) (not e!297967))))

(assert (=> b!509547 (= res!310391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509548 () Bool)

(declare-fun res!310392 () Bool)

(assert (=> b!509548 (=> (not res!310392) (not e!297966))))

(declare-fun arrayContainsKey!0 (array!32729 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509548 (= res!310392 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509549 () Bool)

(assert (=> b!509549 (= e!297969 (= (seekEntryOrOpen!0 (select (arr!15743 a!3235) j!176) a!3235 mask!3524) (Found!4210 j!176)))))

(assert (= (and start!46018 res!310388) b!509546))

(assert (= (and b!509546 res!310393) b!509545))

(assert (= (and b!509545 res!310387) b!509544))

(assert (= (and b!509544 res!310394) b!509548))

(assert (= (and b!509548 res!310392) b!509541))

(assert (= (and b!509541 res!310386) b!509547))

(assert (= (and b!509547 res!310391) b!509542))

(assert (= (and b!509542 res!310390) b!509543))

(assert (= (and b!509543 res!310389) b!509549))

(declare-fun m!490461 () Bool)

(assert (=> b!509549 m!490461))

(assert (=> b!509549 m!490461))

(declare-fun m!490463 () Bool)

(assert (=> b!509549 m!490463))

(assert (=> b!509545 m!490461))

(assert (=> b!509545 m!490461))

(declare-fun m!490465 () Bool)

(assert (=> b!509545 m!490465))

(declare-fun m!490467 () Bool)

(assert (=> b!509548 m!490467))

(declare-fun m!490469 () Bool)

(assert (=> b!509547 m!490469))

(declare-fun m!490471 () Bool)

(assert (=> b!509541 m!490471))

(declare-fun m!490473 () Bool)

(assert (=> start!46018 m!490473))

(declare-fun m!490475 () Bool)

(assert (=> start!46018 m!490475))

(declare-fun m!490477 () Bool)

(assert (=> b!509543 m!490477))

(declare-fun m!490479 () Bool)

(assert (=> b!509543 m!490479))

(declare-fun m!490481 () Bool)

(assert (=> b!509543 m!490481))

(assert (=> b!509543 m!490461))

(declare-fun m!490483 () Bool)

(assert (=> b!509543 m!490483))

(assert (=> b!509543 m!490481))

(declare-fun m!490485 () Bool)

(assert (=> b!509543 m!490485))

(assert (=> b!509543 m!490481))

(declare-fun m!490487 () Bool)

(assert (=> b!509543 m!490487))

(assert (=> b!509543 m!490461))

(declare-fun m!490489 () Bool)

(assert (=> b!509543 m!490489))

(assert (=> b!509543 m!490461))

(declare-fun m!490491 () Bool)

(assert (=> b!509543 m!490491))

(declare-fun m!490493 () Bool)

(assert (=> b!509544 m!490493))

(declare-fun m!490495 () Bool)

(assert (=> b!509542 m!490495))

(push 1)

