; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53018 () Bool)

(assert start!53018)

(declare-fun b!577312 () Bool)

(declare-fun res!365348 () Bool)

(declare-fun e!332073 () Bool)

(assert (=> b!577312 (=> (not res!365348) (not e!332073))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36036 0))(
  ( (array!36037 (arr!17297 (Array (_ BitVec 32) (_ BitVec 64))) (size!17661 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36036)

(assert (=> b!577312 (= res!365348 (and (= (size!17661 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17661 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17661 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!365346 () Bool)

(assert (=> start!53018 (=> (not res!365346) (not e!332073))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53018 (= res!365346 (validMask!0 mask!3053))))

(assert (=> start!53018 e!332073))

(assert (=> start!53018 true))

(declare-fun array_inv!13093 (array!36036) Bool)

(assert (=> start!53018 (array_inv!13093 a!2986)))

(declare-fun b!577313 () Bool)

(declare-fun res!365347 () Bool)

(assert (=> b!577313 (=> (not res!365347) (not e!332073))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36036 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577313 (= res!365347 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577314 () Bool)

(assert (=> b!577314 (= e!332073 false)))

(declare-datatypes ((SeekEntryResult!5737 0))(
  ( (MissingZero!5737 (index!25175 (_ BitVec 32))) (Found!5737 (index!25176 (_ BitVec 32))) (Intermediate!5737 (undefined!6549 Bool) (index!25177 (_ BitVec 32)) (x!54086 (_ BitVec 32))) (Undefined!5737) (MissingVacant!5737 (index!25178 (_ BitVec 32))) )
))
(declare-fun lt!263941 () SeekEntryResult!5737)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36036 (_ BitVec 32)) SeekEntryResult!5737)

(assert (=> b!577314 (= lt!263941 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!577315 () Bool)

(declare-fun res!365344 () Bool)

(assert (=> b!577315 (=> (not res!365344) (not e!332073))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577315 (= res!365344 (validKeyInArray!0 k!1786))))

(declare-fun b!577316 () Bool)

(declare-fun res!365345 () Bool)

(assert (=> b!577316 (=> (not res!365345) (not e!332073))))

(assert (=> b!577316 (= res!365345 (validKeyInArray!0 (select (arr!17297 a!2986) j!136)))))

(assert (= (and start!53018 res!365346) b!577312))

(assert (= (and b!577312 res!365348) b!577316))

(assert (= (and b!577316 res!365345) b!577315))

(assert (= (and b!577315 res!365344) b!577313))

(assert (= (and b!577313 res!365347) b!577314))

(declare-fun m!556213 () Bool)

(assert (=> b!577316 m!556213))

(assert (=> b!577316 m!556213))

(declare-fun m!556215 () Bool)

(assert (=> b!577316 m!556215))

(declare-fun m!556217 () Bool)

(assert (=> b!577313 m!556217))

(declare-fun m!556219 () Bool)

(assert (=> start!53018 m!556219))

(declare-fun m!556221 () Bool)

(assert (=> start!53018 m!556221))

(declare-fun m!556223 () Bool)

(assert (=> b!577314 m!556223))

(declare-fun m!556225 () Bool)

(assert (=> b!577315 m!556225))

(push 1)

(assert (not b!577314))

(assert (not b!577315))

(assert (not b!577313))

(assert (not b!577316))

(assert (not start!53018))

(check-sat)

(pop 1)

