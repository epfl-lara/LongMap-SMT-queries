; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44622 () Bool)

(assert start!44622)

(declare-fun b!489489 () Bool)

(declare-fun res!292426 () Bool)

(declare-fun e!287884 () Bool)

(assert (=> b!489489 (=> (not res!292426) (not e!287884))))

(declare-datatypes ((array!31681 0))(
  ( (array!31682 (arr!15228 (Array (_ BitVec 32) (_ BitVec 64))) (size!15592 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31681)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31681 (_ BitVec 32)) Bool)

(assert (=> b!489489 (= res!292426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!292433 () Bool)

(declare-fun e!287886 () Bool)

(assert (=> start!44622 (=> (not res!292433) (not e!287886))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44622 (= res!292433 (validMask!0 mask!3524))))

(assert (=> start!44622 e!287886))

(assert (=> start!44622 true))

(declare-fun array_inv!11024 (array!31681) Bool)

(assert (=> start!44622 (array_inv!11024 a!3235)))

(declare-fun b!489490 () Bool)

(declare-fun res!292432 () Bool)

(assert (=> b!489490 (=> (not res!292432) (not e!287886))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31681 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489490 (= res!292432 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489491 () Bool)

(declare-fun res!292428 () Bool)

(assert (=> b!489491 (=> (not res!292428) (not e!287884))))

(declare-datatypes ((List!9386 0))(
  ( (Nil!9383) (Cons!9382 (h!10244 (_ BitVec 64)) (t!15614 List!9386)) )
))
(declare-fun arrayNoDuplicates!0 (array!31681 (_ BitVec 32) List!9386) Bool)

(assert (=> b!489491 (= res!292428 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9383))))

(declare-fun b!489492 () Bool)

(assert (=> b!489492 (= e!287886 e!287884)))

(declare-fun res!292427 () Bool)

(assert (=> b!489492 (=> (not res!292427) (not e!287884))))

(declare-datatypes ((SeekEntryResult!3695 0))(
  ( (MissingZero!3695 (index!16959 (_ BitVec 32))) (Found!3695 (index!16960 (_ BitVec 32))) (Intermediate!3695 (undefined!4507 Bool) (index!16961 (_ BitVec 32)) (x!46073 (_ BitVec 32))) (Undefined!3695) (MissingVacant!3695 (index!16962 (_ BitVec 32))) )
))
(declare-fun lt!220860 () SeekEntryResult!3695)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!489492 (= res!292427 (or (= lt!220860 (MissingZero!3695 i!1204)) (= lt!220860 (MissingVacant!3695 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31681 (_ BitVec 32)) SeekEntryResult!3695)

(assert (=> b!489492 (= lt!220860 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!489493 () Bool)

(assert (=> b!489493 (= e!287884 (not true))))

(declare-fun lt!220862 () SeekEntryResult!3695)

(declare-fun lt!220863 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31681 (_ BitVec 32)) SeekEntryResult!3695)

(assert (=> b!489493 (= lt!220862 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220863 (select (store (arr!15228 a!3235) i!1204 k!2280) j!176) (array!31682 (store (arr!15228 a!3235) i!1204 k!2280) (size!15592 a!3235)) mask!3524))))

(declare-fun lt!220861 () (_ BitVec 32))

(declare-fun lt!220864 () SeekEntryResult!3695)

(assert (=> b!489493 (= lt!220864 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220861 (select (arr!15228 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489493 (= lt!220863 (toIndex!0 (select (store (arr!15228 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!489493 (= lt!220861 (toIndex!0 (select (arr!15228 a!3235) j!176) mask!3524))))

(declare-fun e!287883 () Bool)

(assert (=> b!489493 e!287883))

(declare-fun res!292431 () Bool)

(assert (=> b!489493 (=> (not res!292431) (not e!287883))))

(assert (=> b!489493 (= res!292431 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14336 0))(
  ( (Unit!14337) )
))
(declare-fun lt!220859 () Unit!14336)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31681 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14336)

(assert (=> b!489493 (= lt!220859 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489494 () Bool)

(declare-fun res!292425 () Bool)

(assert (=> b!489494 (=> (not res!292425) (not e!287886))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489494 (= res!292425 (validKeyInArray!0 (select (arr!15228 a!3235) j!176)))))

(declare-fun b!489495 () Bool)

(assert (=> b!489495 (= e!287883 (= (seekEntryOrOpen!0 (select (arr!15228 a!3235) j!176) a!3235 mask!3524) (Found!3695 j!176)))))

(declare-fun b!489496 () Bool)

(declare-fun res!292429 () Bool)

(assert (=> b!489496 (=> (not res!292429) (not e!287886))))

(assert (=> b!489496 (= res!292429 (validKeyInArray!0 k!2280))))

(declare-fun b!489497 () Bool)

(declare-fun res!292430 () Bool)

(assert (=> b!489497 (=> (not res!292430) (not e!287886))))

(assert (=> b!489497 (= res!292430 (and (= (size!15592 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15592 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15592 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44622 res!292433) b!489497))

(assert (= (and b!489497 res!292430) b!489494))

(assert (= (and b!489494 res!292425) b!489496))

(assert (= (and b!489496 res!292429) b!489490))

(assert (= (and b!489490 res!292432) b!489492))

(assert (= (and b!489492 res!292427) b!489489))

(assert (= (and b!489489 res!292426) b!489491))

(assert (= (and b!489491 res!292428) b!489493))

(assert (= (and b!489493 res!292431) b!489495))

(declare-fun m!469281 () Bool)

(assert (=> b!489491 m!469281))

(declare-fun m!469283 () Bool)

(assert (=> start!44622 m!469283))

(declare-fun m!469285 () Bool)

(assert (=> start!44622 m!469285))

(declare-fun m!469287 () Bool)

(assert (=> b!489496 m!469287))

(declare-fun m!469289 () Bool)

(assert (=> b!489494 m!469289))

(assert (=> b!489494 m!469289))

(declare-fun m!469291 () Bool)

(assert (=> b!489494 m!469291))

(assert (=> b!489493 m!469289))

(declare-fun m!469293 () Bool)

(assert (=> b!489493 m!469293))

(declare-fun m!469295 () Bool)

(assert (=> b!489493 m!469295))

(declare-fun m!469297 () Bool)

(assert (=> b!489493 m!469297))

(declare-fun m!469299 () Bool)

(assert (=> b!489493 m!469299))

(assert (=> b!489493 m!469299))

(declare-fun m!469301 () Bool)

(assert (=> b!489493 m!469301))

(assert (=> b!489493 m!469289))

(declare-fun m!469303 () Bool)

(assert (=> b!489493 m!469303))

(assert (=> b!489493 m!469289))

(declare-fun m!469305 () Bool)

(assert (=> b!489493 m!469305))

(assert (=> b!489493 m!469299))

(declare-fun m!469307 () Bool)

(assert (=> b!489493 m!469307))

(declare-fun m!469309 () Bool)

(assert (=> b!489490 m!469309))

(assert (=> b!489495 m!469289))

(assert (=> b!489495 m!469289))

(declare-fun m!469311 () Bool)

(assert (=> b!489495 m!469311))

(declare-fun m!469313 () Bool)

(assert (=> b!489492 m!469313))

(declare-fun m!469315 () Bool)

(assert (=> b!489489 m!469315))

(push 1)

