; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53062 () Bool)

(assert start!53062)

(declare-fun b!577467 () Bool)

(declare-fun res!365397 () Bool)

(declare-fun e!332183 () Bool)

(assert (=> b!577467 (=> (not res!365397) (not e!332183))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577467 (= res!365397 (validKeyInArray!0 k!1786))))

(declare-fun b!577468 () Bool)

(declare-fun res!365398 () Bool)

(assert (=> b!577468 (=> (not res!365398) (not e!332183))))

(declare-datatypes ((array!36025 0))(
  ( (array!36026 (arr!17289 (Array (_ BitVec 32) (_ BitVec 64))) (size!17653 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36025)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!577468 (= res!365398 (validKeyInArray!0 (select (arr!17289 a!2986) j!136)))))

(declare-fun res!365395 () Bool)

(assert (=> start!53062 (=> (not res!365395) (not e!332183))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53062 (= res!365395 (validMask!0 mask!3053))))

(assert (=> start!53062 e!332183))

(assert (=> start!53062 true))

(declare-fun array_inv!13148 (array!36025) Bool)

(assert (=> start!53062 (array_inv!13148 a!2986)))

(declare-fun b!577469 () Bool)

(declare-fun res!365396 () Bool)

(assert (=> b!577469 (=> (not res!365396) (not e!332183))))

(declare-fun arrayContainsKey!0 (array!36025 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577469 (= res!365396 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577470 () Bool)

(assert (=> b!577470 (= e!332183 false)))

(declare-datatypes ((SeekEntryResult!5685 0))(
  ( (MissingZero!5685 (index!24967 (_ BitVec 32))) (Found!5685 (index!24968 (_ BitVec 32))) (Intermediate!5685 (undefined!6497 Bool) (index!24969 (_ BitVec 32)) (x!54029 (_ BitVec 32))) (Undefined!5685) (MissingVacant!5685 (index!24970 (_ BitVec 32))) )
))
(declare-fun lt!264043 () SeekEntryResult!5685)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36025 (_ BitVec 32)) SeekEntryResult!5685)

(assert (=> b!577470 (= lt!264043 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!577471 () Bool)

(declare-fun res!365394 () Bool)

(assert (=> b!577471 (=> (not res!365394) (not e!332183))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!577471 (= res!365394 (and (= (size!17653 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17653 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17653 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53062 res!365395) b!577471))

(assert (= (and b!577471 res!365394) b!577468))

(assert (= (and b!577468 res!365398) b!577467))

(assert (= (and b!577467 res!365397) b!577469))

(assert (= (and b!577469 res!365396) b!577470))

(declare-fun m!556509 () Bool)

(assert (=> b!577469 m!556509))

(declare-fun m!556511 () Bool)

(assert (=> b!577467 m!556511))

(declare-fun m!556513 () Bool)

(assert (=> start!53062 m!556513))

(declare-fun m!556515 () Bool)

(assert (=> start!53062 m!556515))

(declare-fun m!556517 () Bool)

(assert (=> b!577470 m!556517))

(declare-fun m!556519 () Bool)

(assert (=> b!577468 m!556519))

(assert (=> b!577468 m!556519))

(declare-fun m!556521 () Bool)

(assert (=> b!577468 m!556521))

(push 1)

(assert (not start!53062))

(assert (not b!577467))

(assert (not b!577470))

(assert (not b!577468))

(assert (not b!577469))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

