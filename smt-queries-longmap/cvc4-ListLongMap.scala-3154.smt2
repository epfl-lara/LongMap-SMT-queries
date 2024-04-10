; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44452 () Bool)

(assert start!44452)

(declare-fun b!488197 () Bool)

(declare-fun e!287216 () Bool)

(assert (=> b!488197 (= e!287216 (not true))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31607 0))(
  ( (array!31608 (arr!15194 (Array (_ BitVec 32) (_ BitVec 64))) (size!15558 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31607)

(declare-fun lt!220331 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!488197 (= lt!220331 (toIndex!0 (select (arr!15194 a!3235) j!176) mask!3524))))

(declare-fun e!287215 () Bool)

(assert (=> b!488197 e!287215))

(declare-fun res!291357 () Bool)

(assert (=> b!488197 (=> (not res!291357) (not e!287215))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31607 (_ BitVec 32)) Bool)

(assert (=> b!488197 (= res!291357 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14268 0))(
  ( (Unit!14269) )
))
(declare-fun lt!220332 () Unit!14268)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31607 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14268)

(assert (=> b!488197 (= lt!220332 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!488198 () Bool)

(declare-fun e!287214 () Bool)

(assert (=> b!488198 (= e!287214 e!287216)))

(declare-fun res!291365 () Bool)

(assert (=> b!488198 (=> (not res!291365) (not e!287216))))

(declare-datatypes ((SeekEntryResult!3661 0))(
  ( (MissingZero!3661 (index!16823 (_ BitVec 32))) (Found!3661 (index!16824 (_ BitVec 32))) (Intermediate!3661 (undefined!4473 Bool) (index!16825 (_ BitVec 32)) (x!45940 (_ BitVec 32))) (Undefined!3661) (MissingVacant!3661 (index!16826 (_ BitVec 32))) )
))
(declare-fun lt!220333 () SeekEntryResult!3661)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!488198 (= res!291365 (or (= lt!220333 (MissingZero!3661 i!1204)) (= lt!220333 (MissingVacant!3661 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31607 (_ BitVec 32)) SeekEntryResult!3661)

(assert (=> b!488198 (= lt!220333 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!488199 () Bool)

(assert (=> b!488199 (= e!287215 (= (seekEntryOrOpen!0 (select (arr!15194 a!3235) j!176) a!3235 mask!3524) (Found!3661 j!176)))))

(declare-fun b!488200 () Bool)

(declare-fun res!291363 () Bool)

(assert (=> b!488200 (=> (not res!291363) (not e!287214))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!488200 (= res!291363 (validKeyInArray!0 k!2280))))

(declare-fun b!488201 () Bool)

(declare-fun res!291364 () Bool)

(assert (=> b!488201 (=> (not res!291364) (not e!287216))))

(declare-datatypes ((List!9352 0))(
  ( (Nil!9349) (Cons!9348 (h!10207 (_ BitVec 64)) (t!15580 List!9352)) )
))
(declare-fun arrayNoDuplicates!0 (array!31607 (_ BitVec 32) List!9352) Bool)

(assert (=> b!488201 (= res!291364 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9349))))

(declare-fun b!488202 () Bool)

(declare-fun res!291359 () Bool)

(assert (=> b!488202 (=> (not res!291359) (not e!287216))))

(assert (=> b!488202 (= res!291359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!291362 () Bool)

(assert (=> start!44452 (=> (not res!291362) (not e!287214))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44452 (= res!291362 (validMask!0 mask!3524))))

(assert (=> start!44452 e!287214))

(assert (=> start!44452 true))

(declare-fun array_inv!10990 (array!31607) Bool)

(assert (=> start!44452 (array_inv!10990 a!3235)))

(declare-fun b!488196 () Bool)

(declare-fun res!291361 () Bool)

(assert (=> b!488196 (=> (not res!291361) (not e!287214))))

(assert (=> b!488196 (= res!291361 (and (= (size!15558 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15558 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15558 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!488203 () Bool)

(declare-fun res!291360 () Bool)

(assert (=> b!488203 (=> (not res!291360) (not e!287214))))

(declare-fun arrayContainsKey!0 (array!31607 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!488203 (= res!291360 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!488204 () Bool)

(declare-fun res!291358 () Bool)

(assert (=> b!488204 (=> (not res!291358) (not e!287214))))

(assert (=> b!488204 (= res!291358 (validKeyInArray!0 (select (arr!15194 a!3235) j!176)))))

(assert (= (and start!44452 res!291362) b!488196))

(assert (= (and b!488196 res!291361) b!488204))

(assert (= (and b!488204 res!291358) b!488200))

(assert (= (and b!488200 res!291363) b!488203))

(assert (= (and b!488203 res!291360) b!488198))

(assert (= (and b!488198 res!291365) b!488202))

(assert (= (and b!488202 res!291359) b!488201))

(assert (= (and b!488201 res!291364) b!488197))

(assert (= (and b!488197 res!291357) b!488199))

(declare-fun m!467947 () Bool)

(assert (=> b!488197 m!467947))

(assert (=> b!488197 m!467947))

(declare-fun m!467949 () Bool)

(assert (=> b!488197 m!467949))

(declare-fun m!467951 () Bool)

(assert (=> b!488197 m!467951))

(declare-fun m!467953 () Bool)

(assert (=> b!488197 m!467953))

(declare-fun m!467955 () Bool)

(assert (=> b!488198 m!467955))

(declare-fun m!467957 () Bool)

(assert (=> b!488202 m!467957))

(declare-fun m!467959 () Bool)

(assert (=> start!44452 m!467959))

(declare-fun m!467961 () Bool)

(assert (=> start!44452 m!467961))

(assert (=> b!488204 m!467947))

(assert (=> b!488204 m!467947))

(declare-fun m!467963 () Bool)

(assert (=> b!488204 m!467963))

(declare-fun m!467965 () Bool)

(assert (=> b!488200 m!467965))

(declare-fun m!467967 () Bool)

(assert (=> b!488201 m!467967))

(declare-fun m!467969 () Bool)

(assert (=> b!488203 m!467969))

(assert (=> b!488199 m!467947))

(assert (=> b!488199 m!467947))

(declare-fun m!467971 () Bool)

(assert (=> b!488199 m!467971))

(push 1)

(assert (not b!488200))

(assert (not b!488198))

(assert (not b!488201))

