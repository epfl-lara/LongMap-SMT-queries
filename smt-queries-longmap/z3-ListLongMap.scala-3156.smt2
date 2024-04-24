; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44450 () Bool)

(assert start!44450)

(declare-fun b!488243 () Bool)

(declare-fun res!291463 () Bool)

(declare-fun e!287224 () Bool)

(assert (=> b!488243 (=> (not res!291463) (not e!287224))))

(declare-datatypes ((array!31606 0))(
  ( (array!31607 (arr!15193 (Array (_ BitVec 32) (_ BitVec 64))) (size!15557 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31606)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31606 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!488243 (= res!291463 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!488244 () Bool)

(declare-fun res!291465 () Bool)

(assert (=> b!488244 (=> (not res!291465) (not e!287224))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!488244 (= res!291465 (validKeyInArray!0 k0!2280))))

(declare-fun b!488246 () Bool)

(declare-fun e!287225 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(assert (=> b!488246 (= e!287225 (not (bvsge mask!3524 #b00000000000000000000000000000000)))))

(declare-fun e!287226 () Bool)

(assert (=> b!488246 e!287226))

(declare-fun res!291460 () Bool)

(assert (=> b!488246 (=> (not res!291460) (not e!287226))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31606 (_ BitVec 32)) Bool)

(assert (=> b!488246 (= res!291460 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14239 0))(
  ( (Unit!14240) )
))
(declare-fun lt!220378 () Unit!14239)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31606 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14239)

(assert (=> b!488246 (= lt!220378 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!488247 () Bool)

(declare-fun res!291461 () Bool)

(assert (=> b!488247 (=> (not res!291461) (not e!287225))))

(declare-datatypes ((List!9258 0))(
  ( (Nil!9255) (Cons!9254 (h!10113 (_ BitVec 64)) (t!15478 List!9258)) )
))
(declare-fun arrayNoDuplicates!0 (array!31606 (_ BitVec 32) List!9258) Bool)

(assert (=> b!488247 (= res!291461 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9255))))

(declare-fun b!488248 () Bool)

(declare-fun res!291462 () Bool)

(assert (=> b!488248 (=> (not res!291462) (not e!287225))))

(assert (=> b!488248 (= res!291462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!488249 () Bool)

(declare-datatypes ((SeekEntryResult!3616 0))(
  ( (MissingZero!3616 (index!16643 (_ BitVec 32))) (Found!3616 (index!16644 (_ BitVec 32))) (Intermediate!3616 (undefined!4428 Bool) (index!16645 (_ BitVec 32)) (x!45908 (_ BitVec 32))) (Undefined!3616) (MissingVacant!3616 (index!16646 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31606 (_ BitVec 32)) SeekEntryResult!3616)

(assert (=> b!488249 (= e!287226 (= (seekEntryOrOpen!0 (select (arr!15193 a!3235) j!176) a!3235 mask!3524) (Found!3616 j!176)))))

(declare-fun res!291464 () Bool)

(assert (=> start!44450 (=> (not res!291464) (not e!287224))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44450 (= res!291464 (validMask!0 mask!3524))))

(assert (=> start!44450 e!287224))

(assert (=> start!44450 true))

(declare-fun array_inv!11052 (array!31606) Bool)

(assert (=> start!44450 (array_inv!11052 a!3235)))

(declare-fun b!488245 () Bool)

(assert (=> b!488245 (= e!287224 e!287225)))

(declare-fun res!291466 () Bool)

(assert (=> b!488245 (=> (not res!291466) (not e!287225))))

(declare-fun lt!220377 () SeekEntryResult!3616)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!488245 (= res!291466 (or (= lt!220377 (MissingZero!3616 i!1204)) (= lt!220377 (MissingVacant!3616 i!1204))))))

(assert (=> b!488245 (= lt!220377 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!488250 () Bool)

(declare-fun res!291459 () Bool)

(assert (=> b!488250 (=> (not res!291459) (not e!287224))))

(assert (=> b!488250 (= res!291459 (validKeyInArray!0 (select (arr!15193 a!3235) j!176)))))

(declare-fun b!488251 () Bool)

(declare-fun res!291458 () Bool)

(assert (=> b!488251 (=> (not res!291458) (not e!287224))))

(assert (=> b!488251 (= res!291458 (and (= (size!15557 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15557 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15557 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44450 res!291464) b!488251))

(assert (= (and b!488251 res!291458) b!488250))

(assert (= (and b!488250 res!291459) b!488244))

(assert (= (and b!488244 res!291465) b!488243))

(assert (= (and b!488243 res!291463) b!488245))

(assert (= (and b!488245 res!291466) b!488248))

(assert (= (and b!488248 res!291462) b!488247))

(assert (= (and b!488247 res!291461) b!488246))

(assert (= (and b!488246 res!291460) b!488249))

(declare-fun m!468235 () Bool)

(assert (=> b!488248 m!468235))

(declare-fun m!468237 () Bool)

(assert (=> b!488246 m!468237))

(declare-fun m!468239 () Bool)

(assert (=> b!488246 m!468239))

(declare-fun m!468241 () Bool)

(assert (=> b!488243 m!468241))

(declare-fun m!468243 () Bool)

(assert (=> start!44450 m!468243))

(declare-fun m!468245 () Bool)

(assert (=> start!44450 m!468245))

(declare-fun m!468247 () Bool)

(assert (=> b!488247 m!468247))

(declare-fun m!468249 () Bool)

(assert (=> b!488249 m!468249))

(assert (=> b!488249 m!468249))

(declare-fun m!468251 () Bool)

(assert (=> b!488249 m!468251))

(assert (=> b!488250 m!468249))

(assert (=> b!488250 m!468249))

(declare-fun m!468253 () Bool)

(assert (=> b!488250 m!468253))

(declare-fun m!468255 () Bool)

(assert (=> b!488244 m!468255))

(declare-fun m!468257 () Bool)

(assert (=> b!488245 m!468257))

(check-sat (not b!488250) (not b!488245) (not b!488248) (not b!488246) (not b!488249) (not b!488244) (not b!488243) (not start!44450) (not b!488247))
(check-sat)
