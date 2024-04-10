; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46012 () Bool)

(assert start!46012)

(declare-fun b!509460 () Bool)

(declare-fun res!310311 () Bool)

(declare-fun e!297930 () Bool)

(assert (=> b!509460 (=> (not res!310311) (not e!297930))))

(declare-datatypes ((array!32723 0))(
  ( (array!32724 (arr!15740 (Array (_ BitVec 32) (_ BitVec 64))) (size!16104 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32723)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32723 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509460 (= res!310311 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509461 () Bool)

(declare-fun e!297932 () Bool)

(assert (=> b!509461 (= e!297932 (not true))))

(declare-fun lt!232735 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4207 0))(
  ( (MissingZero!4207 (index!19016 (_ BitVec 32))) (Found!4207 (index!19017 (_ BitVec 32))) (Intermediate!4207 (undefined!5019 Bool) (index!19018 (_ BitVec 32)) (x!47984 (_ BitVec 32))) (Undefined!4207) (MissingVacant!4207 (index!19019 (_ BitVec 32))) )
))
(declare-fun lt!232732 () SeekEntryResult!4207)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32723 (_ BitVec 32)) SeekEntryResult!4207)

(assert (=> b!509461 (= lt!232732 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232735 (select (store (arr!15740 a!3235) i!1204 k!2280) j!176) (array!32724 (store (arr!15740 a!3235) i!1204 k!2280) (size!16104 a!3235)) mask!3524))))

(declare-fun lt!232734 () (_ BitVec 32))

(declare-fun lt!232731 () SeekEntryResult!4207)

(assert (=> b!509461 (= lt!232731 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232734 (select (arr!15740 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509461 (= lt!232735 (toIndex!0 (select (store (arr!15740 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!509461 (= lt!232734 (toIndex!0 (select (arr!15740 a!3235) j!176) mask!3524))))

(declare-fun e!297933 () Bool)

(assert (=> b!509461 e!297933))

(declare-fun res!310305 () Bool)

(assert (=> b!509461 (=> (not res!310305) (not e!297933))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32723 (_ BitVec 32)) Bool)

(assert (=> b!509461 (= res!310305 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15672 0))(
  ( (Unit!15673) )
))
(declare-fun lt!232730 () Unit!15672)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32723 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15672)

(assert (=> b!509461 (= lt!232730 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!509462 () Bool)

(declare-fun res!310310 () Bool)

(assert (=> b!509462 (=> (not res!310310) (not e!297930))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509462 (= res!310310 (validKeyInArray!0 k!2280))))

(declare-fun b!509463 () Bool)

(declare-fun res!310306 () Bool)

(assert (=> b!509463 (=> (not res!310306) (not e!297930))))

(assert (=> b!509463 (= res!310306 (and (= (size!16104 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16104 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16104 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509464 () Bool)

(declare-fun res!310307 () Bool)

(assert (=> b!509464 (=> (not res!310307) (not e!297932))))

(assert (=> b!509464 (= res!310307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509466 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32723 (_ BitVec 32)) SeekEntryResult!4207)

(assert (=> b!509466 (= e!297933 (= (seekEntryOrOpen!0 (select (arr!15740 a!3235) j!176) a!3235 mask!3524) (Found!4207 j!176)))))

(declare-fun b!509467 () Bool)

(declare-fun res!310312 () Bool)

(assert (=> b!509467 (=> (not res!310312) (not e!297932))))

(declare-datatypes ((List!9898 0))(
  ( (Nil!9895) (Cons!9894 (h!10771 (_ BitVec 64)) (t!16126 List!9898)) )
))
(declare-fun arrayNoDuplicates!0 (array!32723 (_ BitVec 32) List!9898) Bool)

(assert (=> b!509467 (= res!310312 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9895))))

(declare-fun b!509468 () Bool)

(declare-fun res!310313 () Bool)

(assert (=> b!509468 (=> (not res!310313) (not e!297930))))

(assert (=> b!509468 (= res!310313 (validKeyInArray!0 (select (arr!15740 a!3235) j!176)))))

(declare-fun b!509465 () Bool)

(assert (=> b!509465 (= e!297930 e!297932)))

(declare-fun res!310308 () Bool)

(assert (=> b!509465 (=> (not res!310308) (not e!297932))))

(declare-fun lt!232733 () SeekEntryResult!4207)

(assert (=> b!509465 (= res!310308 (or (= lt!232733 (MissingZero!4207 i!1204)) (= lt!232733 (MissingVacant!4207 i!1204))))))

(assert (=> b!509465 (= lt!232733 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!310309 () Bool)

(assert (=> start!46012 (=> (not res!310309) (not e!297930))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46012 (= res!310309 (validMask!0 mask!3524))))

(assert (=> start!46012 e!297930))

(assert (=> start!46012 true))

(declare-fun array_inv!11536 (array!32723) Bool)

(assert (=> start!46012 (array_inv!11536 a!3235)))

(assert (= (and start!46012 res!310309) b!509463))

(assert (= (and b!509463 res!310306) b!509468))

(assert (= (and b!509468 res!310313) b!509462))

(assert (= (and b!509462 res!310310) b!509460))

(assert (= (and b!509460 res!310311) b!509465))

(assert (= (and b!509465 res!310308) b!509464))

(assert (= (and b!509464 res!310307) b!509467))

(assert (= (and b!509467 res!310312) b!509461))

(assert (= (and b!509461 res!310305) b!509466))

(declare-fun m!490353 () Bool)

(assert (=> b!509467 m!490353))

(declare-fun m!490355 () Bool)

(assert (=> b!509461 m!490355))

(declare-fun m!490357 () Bool)

(assert (=> b!509461 m!490357))

(declare-fun m!490359 () Bool)

(assert (=> b!509461 m!490359))

(declare-fun m!490361 () Bool)

(assert (=> b!509461 m!490361))

(declare-fun m!490363 () Bool)

(assert (=> b!509461 m!490363))

(assert (=> b!509461 m!490361))

(assert (=> b!509461 m!490359))

(declare-fun m!490365 () Bool)

(assert (=> b!509461 m!490365))

(assert (=> b!509461 m!490359))

(declare-fun m!490367 () Bool)

(assert (=> b!509461 m!490367))

(declare-fun m!490369 () Bool)

(assert (=> b!509461 m!490369))

(assert (=> b!509461 m!490361))

(declare-fun m!490371 () Bool)

(assert (=> b!509461 m!490371))

(declare-fun m!490373 () Bool)

(assert (=> b!509460 m!490373))

(declare-fun m!490375 () Bool)

(assert (=> start!46012 m!490375))

(declare-fun m!490377 () Bool)

(assert (=> start!46012 m!490377))

(assert (=> b!509468 m!490361))

(assert (=> b!509468 m!490361))

(declare-fun m!490379 () Bool)

(assert (=> b!509468 m!490379))

(declare-fun m!490381 () Bool)

(assert (=> b!509462 m!490381))

(assert (=> b!509466 m!490361))

(assert (=> b!509466 m!490361))

(declare-fun m!490383 () Bool)

(assert (=> b!509466 m!490383))

(declare-fun m!490385 () Bool)

(assert (=> b!509465 m!490385))

(declare-fun m!490387 () Bool)

(assert (=> b!509464 m!490387))

(push 1)

