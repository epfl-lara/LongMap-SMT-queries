; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44994 () Bool)

(assert start!44994)

(declare-fun b!493556 () Bool)

(declare-fun res!296126 () Bool)

(declare-fun e!289833 () Bool)

(assert (=> b!493556 (=> (not res!296126) (not e!289833))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493556 (= res!296126 (validKeyInArray!0 k!2280))))

(declare-fun b!493557 () Bool)

(declare-fun e!289832 () Bool)

(assert (=> b!493557 (= e!289832 true)))

(declare-datatypes ((SeekEntryResult!3821 0))(
  ( (MissingZero!3821 (index!17463 (_ BitVec 32))) (Found!3821 (index!17464 (_ BitVec 32))) (Intermediate!3821 (undefined!4633 Bool) (index!17465 (_ BitVec 32)) (x!46547 (_ BitVec 32))) (Undefined!3821) (MissingVacant!3821 (index!17466 (_ BitVec 32))) )
))
(declare-fun lt!223246 () SeekEntryResult!3821)

(assert (=> b!493557 (= lt!223246 Undefined!3821)))

(declare-fun b!493558 () Bool)

(declare-fun res!296129 () Bool)

(assert (=> b!493558 (=> res!296129 e!289832)))

(declare-fun lt!223244 () SeekEntryResult!3821)

(assert (=> b!493558 (= res!296129 (or (not (is-Intermediate!3821 lt!223244)) (not (undefined!4633 lt!223244))))))

(declare-fun b!493559 () Bool)

(declare-fun res!296130 () Bool)

(assert (=> b!493559 (=> (not res!296130) (not e!289833))))

(declare-datatypes ((array!31939 0))(
  ( (array!31940 (arr!15354 (Array (_ BitVec 32) (_ BitVec 64))) (size!15718 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31939)

(declare-fun arrayContainsKey!0 (array!31939 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493559 (= res!296130 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493560 () Bool)

(declare-fun res!296127 () Bool)

(assert (=> b!493560 (=> (not res!296127) (not e!289833))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!493560 (= res!296127 (and (= (size!15718 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15718 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15718 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!296134 () Bool)

(assert (=> start!44994 (=> (not res!296134) (not e!289833))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44994 (= res!296134 (validMask!0 mask!3524))))

(assert (=> start!44994 e!289833))

(assert (=> start!44994 true))

(declare-fun array_inv!11150 (array!31939) Bool)

(assert (=> start!44994 (array_inv!11150 a!3235)))

(declare-fun b!493561 () Bool)

(declare-fun res!296133 () Bool)

(declare-fun e!289830 () Bool)

(assert (=> b!493561 (=> (not res!296133) (not e!289830))))

(declare-datatypes ((List!9512 0))(
  ( (Nil!9509) (Cons!9508 (h!10376 (_ BitVec 64)) (t!15740 List!9512)) )
))
(declare-fun arrayNoDuplicates!0 (array!31939 (_ BitVec 32) List!9512) Bool)

(assert (=> b!493561 (= res!296133 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9509))))

(declare-fun b!493562 () Bool)

(declare-fun res!296128 () Bool)

(assert (=> b!493562 (=> (not res!296128) (not e!289833))))

(assert (=> b!493562 (= res!296128 (validKeyInArray!0 (select (arr!15354 a!3235) j!176)))))

(declare-fun b!493563 () Bool)

(assert (=> b!493563 (= e!289833 e!289830)))

(declare-fun res!296132 () Bool)

(assert (=> b!493563 (=> (not res!296132) (not e!289830))))

(declare-fun lt!223242 () SeekEntryResult!3821)

(assert (=> b!493563 (= res!296132 (or (= lt!223242 (MissingZero!3821 i!1204)) (= lt!223242 (MissingVacant!3821 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31939 (_ BitVec 32)) SeekEntryResult!3821)

(assert (=> b!493563 (= lt!223242 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!493564 () Bool)

(assert (=> b!493564 (= e!289830 (not e!289832))))

(declare-fun res!296135 () Bool)

(assert (=> b!493564 (=> res!296135 e!289832)))

(declare-fun lt!223245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31939 (_ BitVec 32)) SeekEntryResult!3821)

(assert (=> b!493564 (= res!296135 (= lt!223244 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223245 (select (store (arr!15354 a!3235) i!1204 k!2280) j!176) (array!31940 (store (arr!15354 a!3235) i!1204 k!2280) (size!15718 a!3235)) mask!3524)))))

(declare-fun lt!223241 () (_ BitVec 32))

(assert (=> b!493564 (= lt!223244 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223241 (select (arr!15354 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493564 (= lt!223245 (toIndex!0 (select (store (arr!15354 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!493564 (= lt!223241 (toIndex!0 (select (arr!15354 a!3235) j!176) mask!3524))))

(assert (=> b!493564 (= lt!223246 (Found!3821 j!176))))

(assert (=> b!493564 (= lt!223246 (seekEntryOrOpen!0 (select (arr!15354 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31939 (_ BitVec 32)) Bool)

(assert (=> b!493564 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14588 0))(
  ( (Unit!14589) )
))
(declare-fun lt!223243 () Unit!14588)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31939 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14588)

(assert (=> b!493564 (= lt!223243 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493565 () Bool)

(declare-fun res!296131 () Bool)

(assert (=> b!493565 (=> (not res!296131) (not e!289830))))

(assert (=> b!493565 (= res!296131 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44994 res!296134) b!493560))

(assert (= (and b!493560 res!296127) b!493562))

(assert (= (and b!493562 res!296128) b!493556))

(assert (= (and b!493556 res!296126) b!493559))

(assert (= (and b!493559 res!296130) b!493563))

(assert (= (and b!493563 res!296132) b!493565))

(assert (= (and b!493565 res!296131) b!493561))

(assert (= (and b!493561 res!296133) b!493564))

(assert (= (and b!493564 (not res!296135)) b!493558))

(assert (= (and b!493558 (not res!296129)) b!493557))

(declare-fun m!474423 () Bool)

(assert (=> start!44994 m!474423))

(declare-fun m!474425 () Bool)

(assert (=> start!44994 m!474425))

(declare-fun m!474427 () Bool)

(assert (=> b!493561 m!474427))

(declare-fun m!474429 () Bool)

(assert (=> b!493562 m!474429))

(assert (=> b!493562 m!474429))

(declare-fun m!474431 () Bool)

(assert (=> b!493562 m!474431))

(declare-fun m!474433 () Bool)

(assert (=> b!493564 m!474433))

(declare-fun m!474435 () Bool)

(assert (=> b!493564 m!474435))

(declare-fun m!474437 () Bool)

(assert (=> b!493564 m!474437))

(assert (=> b!493564 m!474429))

(declare-fun m!474439 () Bool)

(assert (=> b!493564 m!474439))

(assert (=> b!493564 m!474429))

(declare-fun m!474441 () Bool)

(assert (=> b!493564 m!474441))

(assert (=> b!493564 m!474437))

(declare-fun m!474443 () Bool)

(assert (=> b!493564 m!474443))

(assert (=> b!493564 m!474429))

(declare-fun m!474445 () Bool)

(assert (=> b!493564 m!474445))

(assert (=> b!493564 m!474429))

(declare-fun m!474447 () Bool)

(assert (=> b!493564 m!474447))

(assert (=> b!493564 m!474437))

(declare-fun m!474449 () Bool)

(assert (=> b!493564 m!474449))

(declare-fun m!474451 () Bool)

(assert (=> b!493556 m!474451))

(declare-fun m!474453 () Bool)

(assert (=> b!493559 m!474453))

(declare-fun m!474455 () Bool)

(assert (=> b!493565 m!474455))

(declare-fun m!474457 () Bool)

(assert (=> b!493563 m!474457))

(push 1)

