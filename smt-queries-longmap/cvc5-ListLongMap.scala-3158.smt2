; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44520 () Bool)

(assert start!44520)

(declare-fun b!488649 () Bool)

(declare-fun e!287461 () Bool)

(declare-fun e!287462 () Bool)

(assert (=> b!488649 (= e!287461 e!287462)))

(declare-fun res!291702 () Bool)

(assert (=> b!488649 (=> (not res!291702) (not e!287462))))

(declare-datatypes ((SeekEntryResult!3671 0))(
  ( (MissingZero!3671 (index!16863 (_ BitVec 32))) (Found!3671 (index!16864 (_ BitVec 32))) (Intermediate!3671 (undefined!4483 Bool) (index!16865 (_ BitVec 32)) (x!45982 (_ BitVec 32))) (Undefined!3671) (MissingVacant!3671 (index!16866 (_ BitVec 32))) )
))
(declare-fun lt!220486 () SeekEntryResult!3671)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!488649 (= res!291702 (or (= lt!220486 (MissingZero!3671 i!1204)) (= lt!220486 (MissingVacant!3671 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-datatypes ((array!31630 0))(
  ( (array!31631 (arr!15204 (Array (_ BitVec 32) (_ BitVec 64))) (size!15568 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31630)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31630 (_ BitVec 32)) SeekEntryResult!3671)

(assert (=> b!488649 (= lt!220486 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!488650 () Bool)

(declare-fun res!291703 () Bool)

(assert (=> b!488650 (=> (not res!291703) (not e!287461))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!488650 (= res!291703 (and (= (size!15568 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15568 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15568 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!488651 () Bool)

(declare-fun res!291696 () Bool)

(assert (=> b!488651 (=> (not res!291696) (not e!287461))))

(declare-fun arrayContainsKey!0 (array!31630 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!488651 (= res!291696 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun e!287460 () Bool)

(declare-fun b!488652 () Bool)

(assert (=> b!488652 (= e!287460 (= (seekEntryOrOpen!0 (select (arr!15204 a!3235) j!176) a!3235 mask!3524) (Found!3671 j!176)))))

(declare-fun b!488653 () Bool)

(declare-fun res!291698 () Bool)

(assert (=> b!488653 (=> (not res!291698) (not e!287462))))

(declare-datatypes ((List!9362 0))(
  ( (Nil!9359) (Cons!9358 (h!10217 (_ BitVec 64)) (t!15590 List!9362)) )
))
(declare-fun arrayNoDuplicates!0 (array!31630 (_ BitVec 32) List!9362) Bool)

(assert (=> b!488653 (= res!291698 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9359))))

(declare-fun res!291701 () Bool)

(assert (=> start!44520 (=> (not res!291701) (not e!287461))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44520 (= res!291701 (validMask!0 mask!3524))))

(assert (=> start!44520 e!287461))

(assert (=> start!44520 true))

(declare-fun array_inv!11000 (array!31630) Bool)

(assert (=> start!44520 (array_inv!11000 a!3235)))

(declare-fun b!488654 () Bool)

(declare-fun res!291697 () Bool)

(assert (=> b!488654 (=> (not res!291697) (not e!287462))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31630 (_ BitVec 32)) Bool)

(assert (=> b!488654 (= res!291697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!488655 () Bool)

(declare-fun res!291704 () Bool)

(assert (=> b!488655 (=> (not res!291704) (not e!287461))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!488655 (= res!291704 (validKeyInArray!0 k!2280))))

(declare-fun b!488656 () Bool)

(declare-fun res!291700 () Bool)

(assert (=> b!488656 (=> (not res!291700) (not e!287461))))

(assert (=> b!488656 (= res!291700 (validKeyInArray!0 (select (arr!15204 a!3235) j!176)))))

(declare-fun b!488657 () Bool)

(assert (=> b!488657 (= e!287462 (not true))))

(declare-fun lt!220485 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!488657 (= lt!220485 (toIndex!0 (select (store (arr!15204 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!488657 e!287460))

(declare-fun res!291699 () Bool)

(assert (=> b!488657 (=> (not res!291699) (not e!287460))))

(assert (=> b!488657 (= res!291699 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14288 0))(
  ( (Unit!14289) )
))
(declare-fun lt!220484 () Unit!14288)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31630 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14288)

(assert (=> b!488657 (= lt!220484 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!44520 res!291701) b!488650))

(assert (= (and b!488650 res!291703) b!488656))

(assert (= (and b!488656 res!291700) b!488655))

(assert (= (and b!488655 res!291704) b!488651))

(assert (= (and b!488651 res!291696) b!488649))

(assert (= (and b!488649 res!291702) b!488654))

(assert (= (and b!488654 res!291697) b!488653))

(assert (= (and b!488653 res!291698) b!488657))

(assert (= (and b!488657 res!291699) b!488652))

(declare-fun m!468357 () Bool)

(assert (=> b!488657 m!468357))

(declare-fun m!468359 () Bool)

(assert (=> b!488657 m!468359))

(declare-fun m!468361 () Bool)

(assert (=> b!488657 m!468361))

(declare-fun m!468363 () Bool)

(assert (=> b!488657 m!468363))

(assert (=> b!488657 m!468361))

(declare-fun m!468365 () Bool)

(assert (=> b!488657 m!468365))

(declare-fun m!468367 () Bool)

(assert (=> b!488656 m!468367))

(assert (=> b!488656 m!468367))

(declare-fun m!468369 () Bool)

(assert (=> b!488656 m!468369))

(declare-fun m!468371 () Bool)

(assert (=> b!488651 m!468371))

(declare-fun m!468373 () Bool)

(assert (=> b!488655 m!468373))

(declare-fun m!468375 () Bool)

(assert (=> b!488654 m!468375))

(declare-fun m!468377 () Bool)

(assert (=> b!488653 m!468377))

(declare-fun m!468379 () Bool)

(assert (=> start!44520 m!468379))

(declare-fun m!468381 () Bool)

(assert (=> start!44520 m!468381))

(declare-fun m!468383 () Bool)

(assert (=> b!488649 m!468383))

(assert (=> b!488652 m!468367))

(assert (=> b!488652 m!468367))

(declare-fun m!468385 () Bool)

(assert (=> b!488652 m!468385))

(push 1)

