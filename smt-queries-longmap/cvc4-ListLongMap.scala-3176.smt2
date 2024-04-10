; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44686 () Bool)

(assert start!44686)

(declare-fun b!490353 () Bool)

(declare-fun res!293292 () Bool)

(declare-fun e!288269 () Bool)

(assert (=> b!490353 (=> (not res!293292) (not e!288269))))

(declare-datatypes ((array!31745 0))(
  ( (array!31746 (arr!15260 (Array (_ BitVec 32) (_ BitVec 64))) (size!15624 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31745)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490353 (= res!293292 (validKeyInArray!0 (select (arr!15260 a!3235) j!176)))))

(declare-fun b!490354 () Bool)

(declare-fun e!288270 () Bool)

(assert (=> b!490354 (= e!288270 (not true))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3727 0))(
  ( (MissingZero!3727 (index!17087 (_ BitVec 32))) (Found!3727 (index!17088 (_ BitVec 32))) (Intermediate!3727 (undefined!4539 Bool) (index!17089 (_ BitVec 32)) (x!46185 (_ BitVec 32))) (Undefined!3727) (MissingVacant!3727 (index!17090 (_ BitVec 32))) )
))
(declare-fun lt!221439 () SeekEntryResult!3727)

(declare-fun lt!221440 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31745 (_ BitVec 32)) SeekEntryResult!3727)

(assert (=> b!490354 (= lt!221439 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221440 (select (store (arr!15260 a!3235) i!1204 k!2280) j!176) (array!31746 (store (arr!15260 a!3235) i!1204 k!2280) (size!15624 a!3235)) mask!3524))))

(declare-fun lt!221437 () SeekEntryResult!3727)

(declare-fun lt!221435 () (_ BitVec 32))

(assert (=> b!490354 (= lt!221437 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221435 (select (arr!15260 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490354 (= lt!221440 (toIndex!0 (select (store (arr!15260 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!490354 (= lt!221435 (toIndex!0 (select (arr!15260 a!3235) j!176) mask!3524))))

(declare-fun e!288268 () Bool)

(assert (=> b!490354 e!288268))

(declare-fun res!293289 () Bool)

(assert (=> b!490354 (=> (not res!293289) (not e!288268))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31745 (_ BitVec 32)) Bool)

(assert (=> b!490354 (= res!293289 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14400 0))(
  ( (Unit!14401) )
))
(declare-fun lt!221438 () Unit!14400)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31745 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14400)

(assert (=> b!490354 (= lt!221438 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490355 () Bool)

(declare-fun res!293290 () Bool)

(assert (=> b!490355 (=> (not res!293290) (not e!288270))))

(declare-datatypes ((List!9418 0))(
  ( (Nil!9415) (Cons!9414 (h!10276 (_ BitVec 64)) (t!15646 List!9418)) )
))
(declare-fun arrayNoDuplicates!0 (array!31745 (_ BitVec 32) List!9418) Bool)

(assert (=> b!490355 (= res!293290 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9415))))

(declare-fun b!490356 () Bool)

(declare-fun res!293293 () Bool)

(assert (=> b!490356 (=> (not res!293293) (not e!288270))))

(assert (=> b!490356 (= res!293293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490357 () Bool)

(declare-fun res!293296 () Bool)

(assert (=> b!490357 (=> (not res!293296) (not e!288269))))

(assert (=> b!490357 (= res!293296 (validKeyInArray!0 k!2280))))

(declare-fun b!490358 () Bool)

(declare-fun res!293295 () Bool)

(assert (=> b!490358 (=> (not res!293295) (not e!288269))))

(declare-fun arrayContainsKey!0 (array!31745 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490358 (= res!293295 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490360 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31745 (_ BitVec 32)) SeekEntryResult!3727)

(assert (=> b!490360 (= e!288268 (= (seekEntryOrOpen!0 (select (arr!15260 a!3235) j!176) a!3235 mask!3524) (Found!3727 j!176)))))

(declare-fun b!490361 () Bool)

(declare-fun res!293291 () Bool)

(assert (=> b!490361 (=> (not res!293291) (not e!288269))))

(assert (=> b!490361 (= res!293291 (and (= (size!15624 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15624 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15624 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490359 () Bool)

(assert (=> b!490359 (= e!288269 e!288270)))

(declare-fun res!293297 () Bool)

(assert (=> b!490359 (=> (not res!293297) (not e!288270))))

(declare-fun lt!221436 () SeekEntryResult!3727)

(assert (=> b!490359 (= res!293297 (or (= lt!221436 (MissingZero!3727 i!1204)) (= lt!221436 (MissingVacant!3727 i!1204))))))

(assert (=> b!490359 (= lt!221436 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!293294 () Bool)

(assert (=> start!44686 (=> (not res!293294) (not e!288269))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44686 (= res!293294 (validMask!0 mask!3524))))

(assert (=> start!44686 e!288269))

(assert (=> start!44686 true))

(declare-fun array_inv!11056 (array!31745) Bool)

(assert (=> start!44686 (array_inv!11056 a!3235)))

(assert (= (and start!44686 res!293294) b!490361))

(assert (= (and b!490361 res!293291) b!490353))

(assert (= (and b!490353 res!293292) b!490357))

(assert (= (and b!490357 res!293296) b!490358))

(assert (= (and b!490358 res!293295) b!490359))

(assert (= (and b!490359 res!293297) b!490356))

(assert (= (and b!490356 res!293293) b!490355))

(assert (= (and b!490355 res!293290) b!490354))

(assert (= (and b!490354 res!293289) b!490360))

(declare-fun m!470433 () Bool)

(assert (=> b!490360 m!470433))

(assert (=> b!490360 m!470433))

(declare-fun m!470435 () Bool)

(assert (=> b!490360 m!470435))

(declare-fun m!470437 () Bool)

(assert (=> b!490354 m!470437))

(declare-fun m!470439 () Bool)

(assert (=> b!490354 m!470439))

(assert (=> b!490354 m!470433))

(declare-fun m!470441 () Bool)

(assert (=> b!490354 m!470441))

(assert (=> b!490354 m!470433))

(declare-fun m!470443 () Bool)

(assert (=> b!490354 m!470443))

(assert (=> b!490354 m!470433))

(declare-fun m!470445 () Bool)

(assert (=> b!490354 m!470445))

(declare-fun m!470447 () Bool)

(assert (=> b!490354 m!470447))

(assert (=> b!490354 m!470439))

(declare-fun m!470449 () Bool)

(assert (=> b!490354 m!470449))

(assert (=> b!490354 m!470439))

(declare-fun m!470451 () Bool)

(assert (=> b!490354 m!470451))

(declare-fun m!470453 () Bool)

(assert (=> b!490356 m!470453))

(declare-fun m!470455 () Bool)

(assert (=> b!490358 m!470455))

(declare-fun m!470457 () Bool)

(assert (=> b!490355 m!470457))

(declare-fun m!470459 () Bool)

(assert (=> b!490357 m!470459))

(assert (=> b!490353 m!470433))

(assert (=> b!490353 m!470433))

(declare-fun m!470461 () Bool)

(assert (=> b!490353 m!470461))

(declare-fun m!470463 () Bool)

(assert (=> b!490359 m!470463))

(declare-fun m!470465 () Bool)

(assert (=> start!44686 m!470465))

(declare-fun m!470467 () Bool)

(assert (=> start!44686 m!470467))

(push 1)

