; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44524 () Bool)

(assert start!44524)

(declare-fun b!488703 () Bool)

(declare-fun res!291754 () Bool)

(declare-fun e!287486 () Bool)

(assert (=> b!488703 (=> (not res!291754) (not e!287486))))

(declare-datatypes ((array!31634 0))(
  ( (array!31635 (arr!15206 (Array (_ BitVec 32) (_ BitVec 64))) (size!15570 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31634)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31634 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!488703 (= res!291754 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!488704 () Bool)

(declare-fun res!291750 () Bool)

(assert (=> b!488704 (=> (not res!291750) (not e!287486))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!488704 (= res!291750 (validKeyInArray!0 (select (arr!15206 a!3235) j!176)))))

(declare-fun b!488705 () Bool)

(declare-fun e!287484 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3673 0))(
  ( (MissingZero!3673 (index!16871 (_ BitVec 32))) (Found!3673 (index!16872 (_ BitVec 32))) (Intermediate!3673 (undefined!4485 Bool) (index!16873 (_ BitVec 32)) (x!45984 (_ BitVec 32))) (Undefined!3673) (MissingVacant!3673 (index!16874 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31634 (_ BitVec 32)) SeekEntryResult!3673)

(assert (=> b!488705 (= e!287484 (= (seekEntryOrOpen!0 (select (arr!15206 a!3235) j!176) a!3235 mask!3524) (Found!3673 j!176)))))

(declare-fun b!488706 () Bool)

(declare-fun res!291758 () Bool)

(assert (=> b!488706 (=> (not res!291758) (not e!287486))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!488706 (= res!291758 (and (= (size!15570 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15570 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15570 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!488707 () Bool)

(declare-fun e!287487 () Bool)

(assert (=> b!488707 (= e!287487 (not true))))

(declare-fun lt!220502 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!488707 (= lt!220502 (toIndex!0 (select (store (arr!15206 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!488707 e!287484))

(declare-fun res!291755 () Bool)

(assert (=> b!488707 (=> (not res!291755) (not e!287484))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31634 (_ BitVec 32)) Bool)

(assert (=> b!488707 (= res!291755 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14292 0))(
  ( (Unit!14293) )
))
(declare-fun lt!220503 () Unit!14292)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31634 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14292)

(assert (=> b!488707 (= lt!220503 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!488708 () Bool)

(declare-fun res!291752 () Bool)

(assert (=> b!488708 (=> (not res!291752) (not e!287486))))

(assert (=> b!488708 (= res!291752 (validKeyInArray!0 k!2280))))

(declare-fun res!291757 () Bool)

(assert (=> start!44524 (=> (not res!291757) (not e!287486))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44524 (= res!291757 (validMask!0 mask!3524))))

(assert (=> start!44524 e!287486))

(assert (=> start!44524 true))

(declare-fun array_inv!11002 (array!31634) Bool)

(assert (=> start!44524 (array_inv!11002 a!3235)))

(declare-fun b!488709 () Bool)

(declare-fun res!291753 () Bool)

(assert (=> b!488709 (=> (not res!291753) (not e!287487))))

(declare-datatypes ((List!9364 0))(
  ( (Nil!9361) (Cons!9360 (h!10219 (_ BitVec 64)) (t!15592 List!9364)) )
))
(declare-fun arrayNoDuplicates!0 (array!31634 (_ BitVec 32) List!9364) Bool)

(assert (=> b!488709 (= res!291753 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9361))))

(declare-fun b!488710 () Bool)

(assert (=> b!488710 (= e!287486 e!287487)))

(declare-fun res!291756 () Bool)

(assert (=> b!488710 (=> (not res!291756) (not e!287487))))

(declare-fun lt!220504 () SeekEntryResult!3673)

(assert (=> b!488710 (= res!291756 (or (= lt!220504 (MissingZero!3673 i!1204)) (= lt!220504 (MissingVacant!3673 i!1204))))))

(assert (=> b!488710 (= lt!220504 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!488711 () Bool)

(declare-fun res!291751 () Bool)

(assert (=> b!488711 (=> (not res!291751) (not e!287487))))

(assert (=> b!488711 (= res!291751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44524 res!291757) b!488706))

(assert (= (and b!488706 res!291758) b!488704))

(assert (= (and b!488704 res!291750) b!488708))

(assert (= (and b!488708 res!291752) b!488703))

(assert (= (and b!488703 res!291754) b!488710))

(assert (= (and b!488710 res!291756) b!488711))

(assert (= (and b!488711 res!291751) b!488709))

(assert (= (and b!488709 res!291753) b!488707))

(assert (= (and b!488707 res!291755) b!488705))

(declare-fun m!468417 () Bool)

(assert (=> start!44524 m!468417))

(declare-fun m!468419 () Bool)

(assert (=> start!44524 m!468419))

(declare-fun m!468421 () Bool)

(assert (=> b!488708 m!468421))

(declare-fun m!468423 () Bool)

(assert (=> b!488704 m!468423))

(assert (=> b!488704 m!468423))

(declare-fun m!468425 () Bool)

(assert (=> b!488704 m!468425))

(declare-fun m!468427 () Bool)

(assert (=> b!488707 m!468427))

(declare-fun m!468429 () Bool)

(assert (=> b!488707 m!468429))

(declare-fun m!468431 () Bool)

(assert (=> b!488707 m!468431))

(declare-fun m!468433 () Bool)

(assert (=> b!488707 m!468433))

(assert (=> b!488707 m!468431))

(declare-fun m!468435 () Bool)

(assert (=> b!488707 m!468435))

(declare-fun m!468437 () Bool)

(assert (=> b!488703 m!468437))

(declare-fun m!468439 () Bool)

(assert (=> b!488710 m!468439))

(declare-fun m!468441 () Bool)

(assert (=> b!488711 m!468441))

(assert (=> b!488705 m!468423))

(assert (=> b!488705 m!468423))

(declare-fun m!468443 () Bool)

(assert (=> b!488705 m!468443))

(declare-fun m!468445 () Bool)

(assert (=> b!488709 m!468445))

(push 1)

