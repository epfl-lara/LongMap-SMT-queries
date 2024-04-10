; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46014 () Bool)

(assert start!46014)

(declare-fun b!509487 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!297943 () Bool)

(declare-datatypes ((array!32725 0))(
  ( (array!32726 (arr!15741 (Array (_ BitVec 32) (_ BitVec 64))) (size!16105 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32725)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4208 0))(
  ( (MissingZero!4208 (index!19020 (_ BitVec 32))) (Found!4208 (index!19021 (_ BitVec 32))) (Intermediate!4208 (undefined!5020 Bool) (index!19022 (_ BitVec 32)) (x!47993 (_ BitVec 32))) (Undefined!4208) (MissingVacant!4208 (index!19023 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32725 (_ BitVec 32)) SeekEntryResult!4208)

(assert (=> b!509487 (= e!297943 (= (seekEntryOrOpen!0 (select (arr!15741 a!3235) j!176) a!3235 mask!3524) (Found!4208 j!176)))))

(declare-fun b!509488 () Bool)

(declare-fun res!310338 () Bool)

(declare-fun e!297942 () Bool)

(assert (=> b!509488 (=> (not res!310338) (not e!297942))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32725 (_ BitVec 32)) Bool)

(assert (=> b!509488 (= res!310338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509489 () Bool)

(declare-fun e!297945 () Bool)

(assert (=> b!509489 (= e!297945 e!297942)))

(declare-fun res!310340 () Bool)

(assert (=> b!509489 (=> (not res!310340) (not e!297942))))

(declare-fun lt!232749 () SeekEntryResult!4208)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!509489 (= res!310340 (or (= lt!232749 (MissingZero!4208 i!1204)) (= lt!232749 (MissingVacant!4208 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!509489 (= lt!232749 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!509490 () Bool)

(declare-fun res!310337 () Bool)

(assert (=> b!509490 (=> (not res!310337) (not e!297945))))

(assert (=> b!509490 (= res!310337 (and (= (size!16105 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16105 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16105 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509491 () Bool)

(declare-fun res!310334 () Bool)

(assert (=> b!509491 (=> (not res!310334) (not e!297945))))

(declare-fun arrayContainsKey!0 (array!32725 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509491 (= res!310334 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509492 () Bool)

(declare-fun res!310339 () Bool)

(assert (=> b!509492 (=> (not res!310339) (not e!297945))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509492 (= res!310339 (validKeyInArray!0 k!2280))))

(declare-fun b!509493 () Bool)

(assert (=> b!509493 (= e!297942 (not true))))

(declare-fun lt!232750 () SeekEntryResult!4208)

(declare-fun lt!232753 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32725 (_ BitVec 32)) SeekEntryResult!4208)

(assert (=> b!509493 (= lt!232750 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232753 (select (store (arr!15741 a!3235) i!1204 k!2280) j!176) (array!32726 (store (arr!15741 a!3235) i!1204 k!2280) (size!16105 a!3235)) mask!3524))))

(declare-fun lt!232751 () SeekEntryResult!4208)

(declare-fun lt!232752 () (_ BitVec 32))

(assert (=> b!509493 (= lt!232751 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232752 (select (arr!15741 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509493 (= lt!232753 (toIndex!0 (select (store (arr!15741 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!509493 (= lt!232752 (toIndex!0 (select (arr!15741 a!3235) j!176) mask!3524))))

(assert (=> b!509493 e!297943))

(declare-fun res!310332 () Bool)

(assert (=> b!509493 (=> (not res!310332) (not e!297943))))

(assert (=> b!509493 (= res!310332 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15674 0))(
  ( (Unit!15675) )
))
(declare-fun lt!232748 () Unit!15674)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32725 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15674)

(assert (=> b!509493 (= lt!232748 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!310333 () Bool)

(assert (=> start!46014 (=> (not res!310333) (not e!297945))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46014 (= res!310333 (validMask!0 mask!3524))))

(assert (=> start!46014 e!297945))

(assert (=> start!46014 true))

(declare-fun array_inv!11537 (array!32725) Bool)

(assert (=> start!46014 (array_inv!11537 a!3235)))

(declare-fun b!509494 () Bool)

(declare-fun res!310336 () Bool)

(assert (=> b!509494 (=> (not res!310336) (not e!297945))))

(assert (=> b!509494 (= res!310336 (validKeyInArray!0 (select (arr!15741 a!3235) j!176)))))

(declare-fun b!509495 () Bool)

(declare-fun res!310335 () Bool)

(assert (=> b!509495 (=> (not res!310335) (not e!297942))))

(declare-datatypes ((List!9899 0))(
  ( (Nil!9896) (Cons!9895 (h!10772 (_ BitVec 64)) (t!16127 List!9899)) )
))
(declare-fun arrayNoDuplicates!0 (array!32725 (_ BitVec 32) List!9899) Bool)

(assert (=> b!509495 (= res!310335 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9896))))

(assert (= (and start!46014 res!310333) b!509490))

(assert (= (and b!509490 res!310337) b!509494))

(assert (= (and b!509494 res!310336) b!509492))

(assert (= (and b!509492 res!310339) b!509491))

(assert (= (and b!509491 res!310334) b!509489))

(assert (= (and b!509489 res!310340) b!509488))

(assert (= (and b!509488 res!310338) b!509495))

(assert (= (and b!509495 res!310335) b!509493))

(assert (= (and b!509493 res!310332) b!509487))

(declare-fun m!490389 () Bool)

(assert (=> start!46014 m!490389))

(declare-fun m!490391 () Bool)

(assert (=> start!46014 m!490391))

(declare-fun m!490393 () Bool)

(assert (=> b!509491 m!490393))

(declare-fun m!490395 () Bool)

(assert (=> b!509489 m!490395))

(declare-fun m!490397 () Bool)

(assert (=> b!509494 m!490397))

(assert (=> b!509494 m!490397))

(declare-fun m!490399 () Bool)

(assert (=> b!509494 m!490399))

(declare-fun m!490401 () Bool)

(assert (=> b!509492 m!490401))

(assert (=> b!509487 m!490397))

(assert (=> b!509487 m!490397))

(declare-fun m!490403 () Bool)

(assert (=> b!509487 m!490403))

(declare-fun m!490405 () Bool)

(assert (=> b!509495 m!490405))

(declare-fun m!490407 () Bool)

(assert (=> b!509488 m!490407))

(declare-fun m!490409 () Bool)

(assert (=> b!509493 m!490409))

(declare-fun m!490411 () Bool)

(assert (=> b!509493 m!490411))

(declare-fun m!490413 () Bool)

(assert (=> b!509493 m!490413))

(assert (=> b!509493 m!490413))

(declare-fun m!490415 () Bool)

(assert (=> b!509493 m!490415))

(assert (=> b!509493 m!490397))

(declare-fun m!490417 () Bool)

(assert (=> b!509493 m!490417))

(assert (=> b!509493 m!490397))

(declare-fun m!490419 () Bool)

(assert (=> b!509493 m!490419))

(assert (=> b!509493 m!490397))

(declare-fun m!490421 () Bool)

(assert (=> b!509493 m!490421))

(assert (=> b!509493 m!490413))

(declare-fun m!490423 () Bool)

(assert (=> b!509493 m!490423))

(push 1)

