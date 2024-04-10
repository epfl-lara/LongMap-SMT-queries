; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44460 () Bool)

(assert start!44460)

(declare-fun b!488304 () Bool)

(declare-fun res!291472 () Bool)

(declare-fun e!287264 () Bool)

(assert (=> b!488304 (=> (not res!291472) (not e!287264))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!488304 (= res!291472 (validKeyInArray!0 k!2280))))

(declare-fun b!488305 () Bool)

(declare-fun e!287262 () Bool)

(assert (=> b!488305 (= e!287264 e!287262)))

(declare-fun res!291469 () Bool)

(assert (=> b!488305 (=> (not res!291469) (not e!287262))))

(declare-datatypes ((SeekEntryResult!3665 0))(
  ( (MissingZero!3665 (index!16839 (_ BitVec 32))) (Found!3665 (index!16840 (_ BitVec 32))) (Intermediate!3665 (undefined!4477 Bool) (index!16841 (_ BitVec 32)) (x!45960 (_ BitVec 32))) (Undefined!3665) (MissingVacant!3665 (index!16842 (_ BitVec 32))) )
))
(declare-fun lt!220365 () SeekEntryResult!3665)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!488305 (= res!291469 (or (= lt!220365 (MissingZero!3665 i!1204)) (= lt!220365 (MissingVacant!3665 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31615 0))(
  ( (array!31616 (arr!15198 (Array (_ BitVec 32) (_ BitVec 64))) (size!15562 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31615)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31615 (_ BitVec 32)) SeekEntryResult!3665)

(assert (=> b!488305 (= lt!220365 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!488307 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!287265 () Bool)

(assert (=> b!488307 (= e!287265 (= (seekEntryOrOpen!0 (select (arr!15198 a!3235) j!176) a!3235 mask!3524) (Found!3665 j!176)))))

(declare-fun b!488308 () Bool)

(declare-fun res!291466 () Bool)

(assert (=> b!488308 (=> (not res!291466) (not e!287262))))

(declare-datatypes ((List!9356 0))(
  ( (Nil!9353) (Cons!9352 (h!10211 (_ BitVec 64)) (t!15584 List!9356)) )
))
(declare-fun arrayNoDuplicates!0 (array!31615 (_ BitVec 32) List!9356) Bool)

(assert (=> b!488308 (= res!291466 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9353))))

(declare-fun b!488309 () Bool)

(declare-fun res!291471 () Bool)

(assert (=> b!488309 (=> (not res!291471) (not e!287264))))

(assert (=> b!488309 (= res!291471 (and (= (size!15562 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15562 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15562 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!488310 () Bool)

(assert (=> b!488310 (= e!287262 (not (bvsge mask!3524 #b00000000000000000000000000000000)))))

(assert (=> b!488310 e!287265))

(declare-fun res!291473 () Bool)

(assert (=> b!488310 (=> (not res!291473) (not e!287265))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31615 (_ BitVec 32)) Bool)

(assert (=> b!488310 (= res!291473 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14276 0))(
  ( (Unit!14277) )
))
(declare-fun lt!220366 () Unit!14276)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31615 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14276)

(assert (=> b!488310 (= lt!220366 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!488311 () Bool)

(declare-fun res!291470 () Bool)

(assert (=> b!488311 (=> (not res!291470) (not e!287262))))

(assert (=> b!488311 (= res!291470 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!488312 () Bool)

(declare-fun res!291468 () Bool)

(assert (=> b!488312 (=> (not res!291468) (not e!287264))))

(assert (=> b!488312 (= res!291468 (validKeyInArray!0 (select (arr!15198 a!3235) j!176)))))

(declare-fun b!488306 () Bool)

(declare-fun res!291465 () Bool)

(assert (=> b!488306 (=> (not res!291465) (not e!287264))))

(declare-fun arrayContainsKey!0 (array!31615 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!488306 (= res!291465 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!291467 () Bool)

(assert (=> start!44460 (=> (not res!291467) (not e!287264))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44460 (= res!291467 (validMask!0 mask!3524))))

(assert (=> start!44460 e!287264))

(assert (=> start!44460 true))

(declare-fun array_inv!10994 (array!31615) Bool)

(assert (=> start!44460 (array_inv!10994 a!3235)))

(assert (= (and start!44460 res!291467) b!488309))

(assert (= (and b!488309 res!291471) b!488312))

(assert (= (and b!488312 res!291468) b!488304))

(assert (= (and b!488304 res!291472) b!488306))

(assert (= (and b!488306 res!291465) b!488305))

(assert (= (and b!488305 res!291469) b!488311))

(assert (= (and b!488311 res!291470) b!488308))

(assert (= (and b!488308 res!291466) b!488310))

(assert (= (and b!488310 res!291473) b!488307))

(declare-fun m!468051 () Bool)

(assert (=> b!488312 m!468051))

(assert (=> b!488312 m!468051))

(declare-fun m!468053 () Bool)

(assert (=> b!488312 m!468053))

(declare-fun m!468055 () Bool)

(assert (=> start!44460 m!468055))

(declare-fun m!468057 () Bool)

(assert (=> start!44460 m!468057))

(declare-fun m!468059 () Bool)

(assert (=> b!488311 m!468059))

(assert (=> b!488307 m!468051))

(assert (=> b!488307 m!468051))

(declare-fun m!468061 () Bool)

(assert (=> b!488307 m!468061))

(declare-fun m!468063 () Bool)

(assert (=> b!488310 m!468063))

(declare-fun m!468065 () Bool)

(assert (=> b!488310 m!468065))

(declare-fun m!468067 () Bool)

(assert (=> b!488306 m!468067))

(declare-fun m!468069 () Bool)

(assert (=> b!488305 m!468069))

(declare-fun m!468071 () Bool)

(assert (=> b!488308 m!468071))

(declare-fun m!468073 () Bool)

(assert (=> b!488304 m!468073))

(push 1)

(assert (not b!488306))

(assert (not b!488312))

(assert (not b!488310))

(assert (not b!488307))

(assert (not start!44460))

(assert (not b!488304))

(assert (not b!488311))

(assert (not b!488308))

(assert (not b!488305))

(check-sat)

(pop 1)

(push 1)

(check-sat)

