; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44458 () Bool)

(assert start!44458)

(declare-fun b!488277 () Bool)

(declare-fun res!291445 () Bool)

(declare-fun e!287252 () Bool)

(assert (=> b!488277 (=> (not res!291445) (not e!287252))))

(declare-datatypes ((array!31613 0))(
  ( (array!31614 (arr!15197 (Array (_ BitVec 32) (_ BitVec 64))) (size!15561 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31613)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31613 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!488277 (= res!291445 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!488278 () Bool)

(declare-fun res!291438 () Bool)

(assert (=> b!488278 (=> (not res!291438) (not e!287252))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!488278 (= res!291438 (and (= (size!15561 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15561 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15561 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!488279 () Bool)

(declare-fun res!291444 () Bool)

(assert (=> b!488279 (=> (not res!291444) (not e!287252))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!488279 (= res!291444 (validKeyInArray!0 k!2280))))

(declare-fun res!291440 () Bool)

(assert (=> start!44458 (=> (not res!291440) (not e!287252))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44458 (= res!291440 (validMask!0 mask!3524))))

(assert (=> start!44458 e!287252))

(assert (=> start!44458 true))

(declare-fun array_inv!10993 (array!31613) Bool)

(assert (=> start!44458 (array_inv!10993 a!3235)))

(declare-fun b!488280 () Bool)

(declare-fun e!287253 () Bool)

(assert (=> b!488280 (= e!287252 e!287253)))

(declare-fun res!291443 () Bool)

(assert (=> b!488280 (=> (not res!291443) (not e!287253))))

(declare-datatypes ((SeekEntryResult!3664 0))(
  ( (MissingZero!3664 (index!16835 (_ BitVec 32))) (Found!3664 (index!16836 (_ BitVec 32))) (Intermediate!3664 (undefined!4476 Bool) (index!16837 (_ BitVec 32)) (x!45951 (_ BitVec 32))) (Undefined!3664) (MissingVacant!3664 (index!16838 (_ BitVec 32))) )
))
(declare-fun lt!220360 () SeekEntryResult!3664)

(assert (=> b!488280 (= res!291443 (or (= lt!220360 (MissingZero!3664 i!1204)) (= lt!220360 (MissingVacant!3664 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31613 (_ BitVec 32)) SeekEntryResult!3664)

(assert (=> b!488280 (= lt!220360 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!488281 () Bool)

(declare-fun res!291439 () Bool)

(assert (=> b!488281 (=> (not res!291439) (not e!287253))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31613 (_ BitVec 32)) Bool)

(assert (=> b!488281 (= res!291439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!488282 () Bool)

(declare-fun res!291446 () Bool)

(assert (=> b!488282 (=> (not res!291446) (not e!287252))))

(assert (=> b!488282 (= res!291446 (validKeyInArray!0 (select (arr!15197 a!3235) j!176)))))

(declare-fun b!488283 () Bool)

(assert (=> b!488283 (= e!287253 (not true))))

(declare-fun lt!220359 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!488283 (= lt!220359 (toIndex!0 (select (arr!15197 a!3235) j!176) mask!3524))))

(declare-fun e!287250 () Bool)

(assert (=> b!488283 e!287250))

(declare-fun res!291441 () Bool)

(assert (=> b!488283 (=> (not res!291441) (not e!287250))))

(assert (=> b!488283 (= res!291441 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14274 0))(
  ( (Unit!14275) )
))
(declare-fun lt!220358 () Unit!14274)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31613 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14274)

(assert (=> b!488283 (= lt!220358 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!488284 () Bool)

(declare-fun res!291442 () Bool)

(assert (=> b!488284 (=> (not res!291442) (not e!287253))))

(declare-datatypes ((List!9355 0))(
  ( (Nil!9352) (Cons!9351 (h!10210 (_ BitVec 64)) (t!15583 List!9355)) )
))
(declare-fun arrayNoDuplicates!0 (array!31613 (_ BitVec 32) List!9355) Bool)

(assert (=> b!488284 (= res!291442 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9352))))

(declare-fun b!488285 () Bool)

(assert (=> b!488285 (= e!287250 (= (seekEntryOrOpen!0 (select (arr!15197 a!3235) j!176) a!3235 mask!3524) (Found!3664 j!176)))))

(assert (= (and start!44458 res!291440) b!488278))

(assert (= (and b!488278 res!291438) b!488282))

(assert (= (and b!488282 res!291446) b!488279))

(assert (= (and b!488279 res!291444) b!488277))

(assert (= (and b!488277 res!291445) b!488280))

(assert (= (and b!488280 res!291443) b!488281))

(assert (= (and b!488281 res!291439) b!488284))

(assert (= (and b!488284 res!291442) b!488283))

(assert (= (and b!488283 res!291441) b!488285))

(declare-fun m!468025 () Bool)

(assert (=> b!488279 m!468025))

(declare-fun m!468027 () Bool)

(assert (=> b!488281 m!468027))

(declare-fun m!468029 () Bool)

(assert (=> b!488285 m!468029))

(assert (=> b!488285 m!468029))

(declare-fun m!468031 () Bool)

(assert (=> b!488285 m!468031))

(declare-fun m!468033 () Bool)

(assert (=> b!488280 m!468033))

(declare-fun m!468035 () Bool)

(assert (=> b!488277 m!468035))

(assert (=> b!488282 m!468029))

(assert (=> b!488282 m!468029))

(declare-fun m!468037 () Bool)

(assert (=> b!488282 m!468037))

(declare-fun m!468039 () Bool)

(assert (=> b!488284 m!468039))

(assert (=> b!488283 m!468029))

(assert (=> b!488283 m!468029))

(declare-fun m!468041 () Bool)

(assert (=> b!488283 m!468041))

(declare-fun m!468043 () Bool)

(assert (=> b!488283 m!468043))

(declare-fun m!468045 () Bool)

(assert (=> b!488283 m!468045))

(declare-fun m!468047 () Bool)

(assert (=> start!44458 m!468047))

(declare-fun m!468049 () Bool)

(assert (=> start!44458 m!468049))

(push 1)

(assert (not b!488284))

