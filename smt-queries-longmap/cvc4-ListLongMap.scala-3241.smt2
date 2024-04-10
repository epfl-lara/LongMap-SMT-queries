; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45256 () Bool)

(assert start!45256)

(declare-fun b!497047 () Bool)

(declare-fun e!291399 () Bool)

(declare-fun e!291398 () Bool)

(assert (=> b!497047 (= e!291399 e!291398)))

(declare-fun res!299434 () Bool)

(assert (=> b!497047 (=> (not res!299434) (not e!291398))))

(declare-datatypes ((SeekEntryResult!3922 0))(
  ( (MissingZero!3922 (index!17867 (_ BitVec 32))) (Found!3922 (index!17868 (_ BitVec 32))) (Intermediate!3922 (undefined!4734 Bool) (index!17869 (_ BitVec 32)) (x!46918 (_ BitVec 32))) (Undefined!3922) (MissingVacant!3922 (index!17870 (_ BitVec 32))) )
))
(declare-fun lt!225022 () SeekEntryResult!3922)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!497047 (= res!299434 (or (= lt!225022 (MissingZero!3922 i!1204)) (= lt!225022 (MissingVacant!3922 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32144 0))(
  ( (array!32145 (arr!15455 (Array (_ BitVec 32) (_ BitVec 64))) (size!15819 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32144)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32144 (_ BitVec 32)) SeekEntryResult!3922)

(assert (=> b!497047 (= lt!225022 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!497048 () Bool)

(declare-fun res!299444 () Bool)

(assert (=> b!497048 (=> (not res!299444) (not e!291398))))

(declare-datatypes ((List!9613 0))(
  ( (Nil!9610) (Cons!9609 (h!10480 (_ BitVec 64)) (t!15841 List!9613)) )
))
(declare-fun arrayNoDuplicates!0 (array!32144 (_ BitVec 32) List!9613) Bool)

(assert (=> b!497048 (= res!299444 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9610))))

(declare-fun b!497049 () Bool)

(declare-fun e!291402 () Bool)

(assert (=> b!497049 (= e!291398 (not e!291402))))

(declare-fun res!299436 () Bool)

(assert (=> b!497049 (=> res!299436 e!291402)))

(declare-fun lt!225018 () SeekEntryResult!3922)

(declare-fun lt!225021 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32144 (_ BitVec 32)) SeekEntryResult!3922)

(assert (=> b!497049 (= res!299436 (= lt!225018 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225021 (select (store (arr!15455 a!3235) i!1204 k!2280) j!176) (array!32145 (store (arr!15455 a!3235) i!1204 k!2280) (size!15819 a!3235)) mask!3524)))))

(declare-fun lt!225019 () (_ BitVec 32))

(assert (=> b!497049 (= lt!225018 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225019 (select (arr!15455 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!497049 (= lt!225021 (toIndex!0 (select (store (arr!15455 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!497049 (= lt!225019 (toIndex!0 (select (arr!15455 a!3235) j!176) mask!3524))))

(declare-fun e!291400 () Bool)

(assert (=> b!497049 e!291400))

(declare-fun res!299440 () Bool)

(assert (=> b!497049 (=> (not res!299440) (not e!291400))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32144 (_ BitVec 32)) Bool)

(assert (=> b!497049 (= res!299440 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14790 0))(
  ( (Unit!14791) )
))
(declare-fun lt!225020 () Unit!14790)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32144 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14790)

(assert (=> b!497049 (= lt!225020 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!497050 () Bool)

(declare-fun res!299441 () Bool)

(assert (=> b!497050 (=> res!299441 e!291402)))

(assert (=> b!497050 (= res!299441 (or (undefined!4734 lt!225018) (not (is-Intermediate!3922 lt!225018))))))

(declare-fun b!497051 () Bool)

(declare-fun res!299437 () Bool)

(assert (=> b!497051 (=> (not res!299437) (not e!291399))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!497051 (= res!299437 (validKeyInArray!0 k!2280))))

(declare-fun b!497052 () Bool)

(declare-fun res!299442 () Bool)

(assert (=> b!497052 (=> (not res!299442) (not e!291399))))

(assert (=> b!497052 (= res!299442 (validKeyInArray!0 (select (arr!15455 a!3235) j!176)))))

(declare-fun b!497054 () Bool)

(declare-fun res!299435 () Bool)

(assert (=> b!497054 (=> (not res!299435) (not e!291399))))

(declare-fun arrayContainsKey!0 (array!32144 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!497054 (= res!299435 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!497055 () Bool)

(assert (=> b!497055 (= e!291402 true)))

(assert (=> b!497055 (and (bvslt (x!46918 lt!225018) #b01111111111111111111111111111110) (or (= (select (arr!15455 a!3235) (index!17869 lt!225018)) (select (arr!15455 a!3235) j!176)) (= (select (arr!15455 a!3235) (index!17869 lt!225018)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15455 a!3235) (index!17869 lt!225018)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!497056 () Bool)

(declare-fun res!299443 () Bool)

(assert (=> b!497056 (=> (not res!299443) (not e!291399))))

(assert (=> b!497056 (= res!299443 (and (= (size!15819 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15819 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15819 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!497057 () Bool)

(assert (=> b!497057 (= e!291400 (= (seekEntryOrOpen!0 (select (arr!15455 a!3235) j!176) a!3235 mask!3524) (Found!3922 j!176)))))

(declare-fun res!299439 () Bool)

(assert (=> start!45256 (=> (not res!299439) (not e!291399))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45256 (= res!299439 (validMask!0 mask!3524))))

(assert (=> start!45256 e!291399))

(assert (=> start!45256 true))

(declare-fun array_inv!11251 (array!32144) Bool)

(assert (=> start!45256 (array_inv!11251 a!3235)))

(declare-fun b!497053 () Bool)

(declare-fun res!299438 () Bool)

(assert (=> b!497053 (=> (not res!299438) (not e!291398))))

(assert (=> b!497053 (= res!299438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45256 res!299439) b!497056))

(assert (= (and b!497056 res!299443) b!497052))

(assert (= (and b!497052 res!299442) b!497051))

(assert (= (and b!497051 res!299437) b!497054))

(assert (= (and b!497054 res!299435) b!497047))

(assert (= (and b!497047 res!299434) b!497053))

(assert (= (and b!497053 res!299438) b!497048))

(assert (= (and b!497048 res!299444) b!497049))

(assert (= (and b!497049 res!299440) b!497057))

(assert (= (and b!497049 (not res!299436)) b!497050))

(assert (= (and b!497050 (not res!299441)) b!497055))

(declare-fun m!478375 () Bool)

(assert (=> b!497051 m!478375))

(declare-fun m!478377 () Bool)

(assert (=> b!497048 m!478377))

(declare-fun m!478379 () Bool)

(assert (=> start!45256 m!478379))

(declare-fun m!478381 () Bool)

(assert (=> start!45256 m!478381))

(declare-fun m!478383 () Bool)

(assert (=> b!497055 m!478383))

(declare-fun m!478385 () Bool)

(assert (=> b!497055 m!478385))

(declare-fun m!478387 () Bool)

(assert (=> b!497053 m!478387))

(assert (=> b!497052 m!478385))

(assert (=> b!497052 m!478385))

(declare-fun m!478389 () Bool)

(assert (=> b!497052 m!478389))

(assert (=> b!497057 m!478385))

(assert (=> b!497057 m!478385))

(declare-fun m!478391 () Bool)

(assert (=> b!497057 m!478391))

(declare-fun m!478393 () Bool)

(assert (=> b!497054 m!478393))

(declare-fun m!478395 () Bool)

(assert (=> b!497049 m!478395))

(declare-fun m!478397 () Bool)

(assert (=> b!497049 m!478397))

(declare-fun m!478399 () Bool)

(assert (=> b!497049 m!478399))

(declare-fun m!478401 () Bool)

(assert (=> b!497049 m!478401))

(assert (=> b!497049 m!478395))

(assert (=> b!497049 m!478385))

(declare-fun m!478403 () Bool)

(assert (=> b!497049 m!478403))

(assert (=> b!497049 m!478385))

(declare-fun m!478405 () Bool)

(assert (=> b!497049 m!478405))

(assert (=> b!497049 m!478385))

(declare-fun m!478407 () Bool)

(assert (=> b!497049 m!478407))

(assert (=> b!497049 m!478395))

(declare-fun m!478409 () Bool)

(assert (=> b!497049 m!478409))

(declare-fun m!478411 () Bool)

(assert (=> b!497047 m!478411))

(push 1)

