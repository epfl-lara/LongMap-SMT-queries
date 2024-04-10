; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44626 () Bool)

(assert start!44626)

(declare-fun b!489543 () Bool)

(declare-fun res!292481 () Bool)

(declare-fun e!287908 () Bool)

(assert (=> b!489543 (=> (not res!292481) (not e!287908))))

(declare-datatypes ((array!31685 0))(
  ( (array!31686 (arr!15230 (Array (_ BitVec 32) (_ BitVec 64))) (size!15594 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31685)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489543 (= res!292481 (validKeyInArray!0 (select (arr!15230 a!3235) j!176)))))

(declare-fun b!489544 () Bool)

(declare-fun res!292480 () Bool)

(assert (=> b!489544 (=> (not res!292480) (not e!287908))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!489544 (= res!292480 (validKeyInArray!0 k!2280))))

(declare-fun b!489545 () Bool)

(declare-fun e!287907 () Bool)

(assert (=> b!489545 (= e!287908 e!287907)))

(declare-fun res!292487 () Bool)

(assert (=> b!489545 (=> (not res!292487) (not e!287907))))

(declare-datatypes ((SeekEntryResult!3697 0))(
  ( (MissingZero!3697 (index!16967 (_ BitVec 32))) (Found!3697 (index!16968 (_ BitVec 32))) (Intermediate!3697 (undefined!4509 Bool) (index!16969 (_ BitVec 32)) (x!46075 (_ BitVec 32))) (Undefined!3697) (MissingVacant!3697 (index!16970 (_ BitVec 32))) )
))
(declare-fun lt!220898 () SeekEntryResult!3697)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!489545 (= res!292487 (or (= lt!220898 (MissingZero!3697 i!1204)) (= lt!220898 (MissingVacant!3697 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31685 (_ BitVec 32)) SeekEntryResult!3697)

(assert (=> b!489545 (= lt!220898 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!489546 () Bool)

(declare-fun res!292479 () Bool)

(assert (=> b!489546 (=> (not res!292479) (not e!287907))))

(declare-datatypes ((List!9388 0))(
  ( (Nil!9385) (Cons!9384 (h!10246 (_ BitVec 64)) (t!15616 List!9388)) )
))
(declare-fun arrayNoDuplicates!0 (array!31685 (_ BitVec 32) List!9388) Bool)

(assert (=> b!489546 (= res!292479 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9385))))

(declare-fun b!489547 () Bool)

(declare-fun e!287910 () Bool)

(assert (=> b!489547 (= e!287910 (= (seekEntryOrOpen!0 (select (arr!15230 a!3235) j!176) a!3235 mask!3524) (Found!3697 j!176)))))

(declare-fun res!292482 () Bool)

(assert (=> start!44626 (=> (not res!292482) (not e!287908))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44626 (= res!292482 (validMask!0 mask!3524))))

(assert (=> start!44626 e!287908))

(assert (=> start!44626 true))

(declare-fun array_inv!11026 (array!31685) Bool)

(assert (=> start!44626 (array_inv!11026 a!3235)))

(declare-fun b!489548 () Bool)

(assert (=> b!489548 (= e!287907 (not true))))

(declare-fun lt!220896 () (_ BitVec 32))

(declare-fun lt!220897 () SeekEntryResult!3697)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31685 (_ BitVec 32)) SeekEntryResult!3697)

(assert (=> b!489548 (= lt!220897 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220896 (select (store (arr!15230 a!3235) i!1204 k!2280) j!176) (array!31686 (store (arr!15230 a!3235) i!1204 k!2280) (size!15594 a!3235)) mask!3524))))

(declare-fun lt!220900 () (_ BitVec 32))

(declare-fun lt!220899 () SeekEntryResult!3697)

(assert (=> b!489548 (= lt!220899 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220900 (select (arr!15230 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489548 (= lt!220896 (toIndex!0 (select (store (arr!15230 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!489548 (= lt!220900 (toIndex!0 (select (arr!15230 a!3235) j!176) mask!3524))))

(assert (=> b!489548 e!287910))

(declare-fun res!292484 () Bool)

(assert (=> b!489548 (=> (not res!292484) (not e!287910))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31685 (_ BitVec 32)) Bool)

(assert (=> b!489548 (= res!292484 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14340 0))(
  ( (Unit!14341) )
))
(declare-fun lt!220895 () Unit!14340)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31685 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14340)

(assert (=> b!489548 (= lt!220895 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489549 () Bool)

(declare-fun res!292483 () Bool)

(assert (=> b!489549 (=> (not res!292483) (not e!287907))))

(assert (=> b!489549 (= res!292483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489550 () Bool)

(declare-fun res!292485 () Bool)

(assert (=> b!489550 (=> (not res!292485) (not e!287908))))

(assert (=> b!489550 (= res!292485 (and (= (size!15594 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15594 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15594 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!489551 () Bool)

(declare-fun res!292486 () Bool)

(assert (=> b!489551 (=> (not res!292486) (not e!287908))))

(declare-fun arrayContainsKey!0 (array!31685 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489551 (= res!292486 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!44626 res!292482) b!489550))

(assert (= (and b!489550 res!292485) b!489543))

(assert (= (and b!489543 res!292481) b!489544))

(assert (= (and b!489544 res!292480) b!489551))

(assert (= (and b!489551 res!292486) b!489545))

(assert (= (and b!489545 res!292487) b!489549))

(assert (= (and b!489549 res!292483) b!489546))

(assert (= (and b!489546 res!292479) b!489548))

(assert (= (and b!489548 res!292484) b!489547))

(declare-fun m!469353 () Bool)

(assert (=> b!489547 m!469353))

(assert (=> b!489547 m!469353))

(declare-fun m!469355 () Bool)

(assert (=> b!489547 m!469355))

(declare-fun m!469357 () Bool)

(assert (=> b!489549 m!469357))

(declare-fun m!469359 () Bool)

(assert (=> b!489545 m!469359))

(declare-fun m!469361 () Bool)

(assert (=> b!489548 m!469361))

(declare-fun m!469363 () Bool)

(assert (=> b!489548 m!469363))

(declare-fun m!469365 () Bool)

(assert (=> b!489548 m!469365))

(assert (=> b!489548 m!469353))

(declare-fun m!469367 () Bool)

(assert (=> b!489548 m!469367))

(assert (=> b!489548 m!469365))

(declare-fun m!469369 () Bool)

(assert (=> b!489548 m!469369))

(assert (=> b!489548 m!469353))

(declare-fun m!469371 () Bool)

(assert (=> b!489548 m!469371))

(assert (=> b!489548 m!469365))

(declare-fun m!469373 () Bool)

(assert (=> b!489548 m!469373))

(assert (=> b!489548 m!469353))

(declare-fun m!469375 () Bool)

(assert (=> b!489548 m!469375))

(assert (=> b!489543 m!469353))

(assert (=> b!489543 m!469353))

(declare-fun m!469377 () Bool)

(assert (=> b!489543 m!469377))

(declare-fun m!469379 () Bool)

(assert (=> b!489544 m!469379))

(declare-fun m!469381 () Bool)

(assert (=> start!44626 m!469381))

(declare-fun m!469383 () Bool)

(assert (=> start!44626 m!469383))

(declare-fun m!469385 () Bool)

(assert (=> b!489551 m!469385))

(declare-fun m!469387 () Bool)

(assert (=> b!489546 m!469387))

(push 1)

(assert (not b!489544))

(assert (not b!489549))

