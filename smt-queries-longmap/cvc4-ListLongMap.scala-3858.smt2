; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53036 () Bool)

(assert start!53036)

(declare-fun res!365501 () Bool)

(declare-fun e!332134 () Bool)

(assert (=> start!53036 (=> (not res!365501) (not e!332134))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53036 (= res!365501 (validMask!0 mask!3053))))

(assert (=> start!53036 e!332134))

(assert (=> start!53036 true))

(declare-datatypes ((array!36054 0))(
  ( (array!36055 (arr!17306 (Array (_ BitVec 32) (_ BitVec 64))) (size!17670 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36054)

(declare-fun array_inv!13102 (array!36054) Bool)

(assert (=> start!53036 (array_inv!13102 a!2986)))

(declare-fun b!577463 () Bool)

(declare-fun e!332135 () Bool)

(assert (=> b!577463 (= e!332134 e!332135)))

(declare-fun res!365500 () Bool)

(assert (=> b!577463 (=> (not res!365500) (not e!332135))))

(declare-datatypes ((SeekEntryResult!5746 0))(
  ( (MissingZero!5746 (index!25211 (_ BitVec 32))) (Found!5746 (index!25212 (_ BitVec 32))) (Intermediate!5746 (undefined!6558 Bool) (index!25213 (_ BitVec 32)) (x!54119 (_ BitVec 32))) (Undefined!5746) (MissingVacant!5746 (index!25214 (_ BitVec 32))) )
))
(declare-fun lt!263968 () SeekEntryResult!5746)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!577463 (= res!365500 (or (= lt!263968 (MissingZero!5746 i!1108)) (= lt!263968 (MissingVacant!5746 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36054 (_ BitVec 32)) SeekEntryResult!5746)

(assert (=> b!577463 (= lt!263968 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!577464 () Bool)

(declare-fun res!365497 () Bool)

(assert (=> b!577464 (=> (not res!365497) (not e!332134))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577464 (= res!365497 (validKeyInArray!0 (select (arr!17306 a!2986) j!136)))))

(declare-fun b!577465 () Bool)

(declare-fun res!365499 () Bool)

(assert (=> b!577465 (=> (not res!365499) (not e!332135))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36054 (_ BitVec 32)) Bool)

(assert (=> b!577465 (= res!365499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!577466 () Bool)

(declare-fun res!365498 () Bool)

(assert (=> b!577466 (=> (not res!365498) (not e!332134))))

(assert (=> b!577466 (= res!365498 (validKeyInArray!0 k!1786))))

(declare-fun b!577467 () Bool)

(declare-fun res!365496 () Bool)

(assert (=> b!577467 (=> (not res!365496) (not e!332134))))

(assert (=> b!577467 (= res!365496 (and (= (size!17670 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17670 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17670 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!577468 () Bool)

(declare-fun res!365495 () Bool)

(assert (=> b!577468 (=> (not res!365495) (not e!332134))))

(declare-fun arrayContainsKey!0 (array!36054 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577468 (= res!365495 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577469 () Bool)

(assert (=> b!577469 (= e!332135 (bvsgt #b00000000000000000000000000000000 (size!17670 a!2986)))))

(assert (= (and start!53036 res!365501) b!577467))

(assert (= (and b!577467 res!365496) b!577464))

(assert (= (and b!577464 res!365497) b!577466))

(assert (= (and b!577466 res!365498) b!577468))

(assert (= (and b!577468 res!365495) b!577463))

(assert (= (and b!577463 res!365500) b!577465))

(assert (= (and b!577465 res!365499) b!577469))

(declare-fun m!556343 () Bool)

(assert (=> b!577466 m!556343))

(declare-fun m!556345 () Bool)

(assert (=> b!577463 m!556345))

(declare-fun m!556347 () Bool)

(assert (=> start!53036 m!556347))

(declare-fun m!556349 () Bool)

(assert (=> start!53036 m!556349))

(declare-fun m!556351 () Bool)

(assert (=> b!577464 m!556351))

(assert (=> b!577464 m!556351))

(declare-fun m!556353 () Bool)

(assert (=> b!577464 m!556353))

(declare-fun m!556355 () Bool)

(assert (=> b!577468 m!556355))

(declare-fun m!556357 () Bool)

(assert (=> b!577465 m!556357))

(push 1)

(assert (not b!577464))

(assert (not b!577465))

(assert (not start!53036))

(assert (not b!577466))

(assert (not b!577468))

(assert (not b!577463))

(check-sat)

