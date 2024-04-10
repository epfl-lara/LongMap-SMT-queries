; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53042 () Bool)

(assert start!53042)

(declare-fun b!577526 () Bool)

(declare-fun res!365560 () Bool)

(declare-fun e!332161 () Bool)

(assert (=> b!577526 (=> (not res!365560) (not e!332161))))

(declare-datatypes ((array!36060 0))(
  ( (array!36061 (arr!17309 (Array (_ BitVec 32) (_ BitVec 64))) (size!17673 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36060)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36060 (_ BitVec 32)) Bool)

(assert (=> b!577526 (= res!365560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!577527 () Bool)

(declare-fun res!365558 () Bool)

(declare-fun e!332162 () Bool)

(assert (=> b!577527 (=> (not res!365558) (not e!332162))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!577527 (= res!365558 (and (= (size!17673 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17673 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17673 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!365559 () Bool)

(assert (=> start!53042 (=> (not res!365559) (not e!332162))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53042 (= res!365559 (validMask!0 mask!3053))))

(assert (=> start!53042 e!332162))

(assert (=> start!53042 true))

(declare-fun array_inv!13105 (array!36060) Bool)

(assert (=> start!53042 (array_inv!13105 a!2986)))

(declare-fun b!577528 () Bool)

(declare-fun res!365564 () Bool)

(assert (=> b!577528 (=> (not res!365564) (not e!332162))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36060 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577528 (= res!365564 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577529 () Bool)

(declare-fun res!365561 () Bool)

(assert (=> b!577529 (=> (not res!365561) (not e!332162))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577529 (= res!365561 (validKeyInArray!0 (select (arr!17309 a!2986) j!136)))))

(declare-fun b!577530 () Bool)

(assert (=> b!577530 (= e!332161 (and (bvsle #b00000000000000000000000000000000 (size!17673 a!2986)) (bvsge (size!17673 a!2986) #b01111111111111111111111111111111)))))

(declare-fun b!577531 () Bool)

(declare-fun res!365563 () Bool)

(assert (=> b!577531 (=> (not res!365563) (not e!332162))))

(assert (=> b!577531 (= res!365563 (validKeyInArray!0 k!1786))))

(declare-fun b!577532 () Bool)

(assert (=> b!577532 (= e!332162 e!332161)))

(declare-fun res!365562 () Bool)

(assert (=> b!577532 (=> (not res!365562) (not e!332161))))

(declare-datatypes ((SeekEntryResult!5749 0))(
  ( (MissingZero!5749 (index!25223 (_ BitVec 32))) (Found!5749 (index!25224 (_ BitVec 32))) (Intermediate!5749 (undefined!6561 Bool) (index!25225 (_ BitVec 32)) (x!54130 (_ BitVec 32))) (Undefined!5749) (MissingVacant!5749 (index!25226 (_ BitVec 32))) )
))
(declare-fun lt!263977 () SeekEntryResult!5749)

(assert (=> b!577532 (= res!365562 (or (= lt!263977 (MissingZero!5749 i!1108)) (= lt!263977 (MissingVacant!5749 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36060 (_ BitVec 32)) SeekEntryResult!5749)

(assert (=> b!577532 (= lt!263977 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!53042 res!365559) b!577527))

(assert (= (and b!577527 res!365558) b!577529))

(assert (= (and b!577529 res!365561) b!577531))

(assert (= (and b!577531 res!365563) b!577528))

(assert (= (and b!577528 res!365564) b!577532))

(assert (= (and b!577532 res!365562) b!577526))

(assert (= (and b!577526 res!365560) b!577530))

(declare-fun m!556391 () Bool)

(assert (=> b!577532 m!556391))

(declare-fun m!556393 () Bool)

(assert (=> b!577526 m!556393))

(declare-fun m!556395 () Bool)

(assert (=> b!577531 m!556395))

(declare-fun m!556397 () Bool)

(assert (=> b!577529 m!556397))

(assert (=> b!577529 m!556397))

(declare-fun m!556399 () Bool)

(assert (=> b!577529 m!556399))

(declare-fun m!556401 () Bool)

(assert (=> start!53042 m!556401))

(declare-fun m!556403 () Bool)

(assert (=> start!53042 m!556403))

(declare-fun m!556405 () Bool)

(assert (=> b!577528 m!556405))

(push 1)

(assert (not b!577528))

(assert (not b!577526))

(assert (not b!577531))

(assert (not start!53042))

(assert (not b!577532))

(assert (not b!577529))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

