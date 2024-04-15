; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44448 () Bool)

(assert start!44448)

(declare-fun b!488033 () Bool)

(declare-fun res!291340 () Bool)

(declare-fun e!287088 () Bool)

(assert (=> b!488033 (=> (not res!291340) (not e!287088))))

(declare-datatypes ((array!31613 0))(
  ( (array!31614 (arr!15197 (Array (_ BitVec 32) (_ BitVec 64))) (size!15562 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31613)

(declare-datatypes ((List!9394 0))(
  ( (Nil!9391) (Cons!9390 (h!10249 (_ BitVec 64)) (t!15613 List!9394)) )
))
(declare-fun arrayNoDuplicates!0 (array!31613 (_ BitVec 32) List!9394) Bool)

(assert (=> b!488033 (= res!291340 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9391))))

(declare-fun b!488034 () Bool)

(declare-fun e!287090 () Bool)

(assert (=> b!488034 (= e!287090 e!287088)))

(declare-fun res!291343 () Bool)

(assert (=> b!488034 (=> (not res!291343) (not e!287088))))

(declare-datatypes ((SeekEntryResult!3661 0))(
  ( (MissingZero!3661 (index!16823 (_ BitVec 32))) (Found!3661 (index!16824 (_ BitVec 32))) (Intermediate!3661 (undefined!4473 Bool) (index!16825 (_ BitVec 32)) (x!45951 (_ BitVec 32))) (Undefined!3661) (MissingVacant!3661 (index!16826 (_ BitVec 32))) )
))
(declare-fun lt!220131 () SeekEntryResult!3661)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!488034 (= res!291343 (or (= lt!220131 (MissingZero!3661 i!1204)) (= lt!220131 (MissingVacant!3661 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31613 (_ BitVec 32)) SeekEntryResult!3661)

(assert (=> b!488034 (= lt!220131 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!488035 () Bool)

(declare-fun res!291338 () Bool)

(assert (=> b!488035 (=> (not res!291338) (not e!287090))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!488035 (= res!291338 (and (= (size!15562 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15562 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15562 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!291344 () Bool)

(assert (=> start!44448 (=> (not res!291344) (not e!287090))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44448 (= res!291344 (validMask!0 mask!3524))))

(assert (=> start!44448 e!287090))

(assert (=> start!44448 true))

(declare-fun array_inv!11080 (array!31613) Bool)

(assert (=> start!44448 (array_inv!11080 a!3235)))

(declare-fun b!488036 () Bool)

(assert (=> b!488036 (= e!287088 (not (bvsge mask!3524 #b00000000000000000000000000000000)))))

(declare-fun e!287089 () Bool)

(assert (=> b!488036 e!287089))

(declare-fun res!291337 () Bool)

(assert (=> b!488036 (=> (not res!291337) (not e!287089))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31613 (_ BitVec 32)) Bool)

(assert (=> b!488036 (= res!291337 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14254 0))(
  ( (Unit!14255) )
))
(declare-fun lt!220132 () Unit!14254)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31613 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14254)

(assert (=> b!488036 (= lt!220132 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!488037 () Bool)

(declare-fun res!291339 () Bool)

(assert (=> b!488037 (=> (not res!291339) (not e!287090))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!488037 (= res!291339 (validKeyInArray!0 (select (arr!15197 a!3235) j!176)))))

(declare-fun b!488038 () Bool)

(declare-fun res!291336 () Bool)

(assert (=> b!488038 (=> (not res!291336) (not e!287090))))

(assert (=> b!488038 (= res!291336 (validKeyInArray!0 k0!2280))))

(declare-fun b!488039 () Bool)

(declare-fun res!291341 () Bool)

(assert (=> b!488039 (=> (not res!291341) (not e!287090))))

(declare-fun arrayContainsKey!0 (array!31613 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!488039 (= res!291341 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!488040 () Bool)

(assert (=> b!488040 (= e!287089 (= (seekEntryOrOpen!0 (select (arr!15197 a!3235) j!176) a!3235 mask!3524) (Found!3661 j!176)))))

(declare-fun b!488041 () Bool)

(declare-fun res!291342 () Bool)

(assert (=> b!488041 (=> (not res!291342) (not e!287088))))

(assert (=> b!488041 (= res!291342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44448 res!291344) b!488035))

(assert (= (and b!488035 res!291338) b!488037))

(assert (= (and b!488037 res!291339) b!488038))

(assert (= (and b!488038 res!291336) b!488039))

(assert (= (and b!488039 res!291341) b!488034))

(assert (= (and b!488034 res!291343) b!488041))

(assert (= (and b!488041 res!291342) b!488033))

(assert (= (and b!488033 res!291340) b!488036))

(assert (= (and b!488036 res!291337) b!488040))

(declare-fun m!467299 () Bool)

(assert (=> b!488034 m!467299))

(declare-fun m!467301 () Bool)

(assert (=> b!488037 m!467301))

(assert (=> b!488037 m!467301))

(declare-fun m!467303 () Bool)

(assert (=> b!488037 m!467303))

(declare-fun m!467305 () Bool)

(assert (=> b!488041 m!467305))

(declare-fun m!467307 () Bool)

(assert (=> b!488038 m!467307))

(declare-fun m!467309 () Bool)

(assert (=> b!488033 m!467309))

(declare-fun m!467311 () Bool)

(assert (=> b!488039 m!467311))

(assert (=> b!488040 m!467301))

(assert (=> b!488040 m!467301))

(declare-fun m!467313 () Bool)

(assert (=> b!488040 m!467313))

(declare-fun m!467315 () Bool)

(assert (=> start!44448 m!467315))

(declare-fun m!467317 () Bool)

(assert (=> start!44448 m!467317))

(declare-fun m!467319 () Bool)

(assert (=> b!488036 m!467319))

(declare-fun m!467321 () Bool)

(assert (=> b!488036 m!467321))

(check-sat (not b!488036) (not start!44448) (not b!488037) (not b!488038) (not b!488039) (not b!488041) (not b!488034) (not b!488033) (not b!488040))
(check-sat)
