; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52994 () Bool)

(assert start!52994)

(declare-fun b!577132 () Bool)

(declare-fun res!365165 () Bool)

(declare-fun e!332001 () Bool)

(assert (=> b!577132 (=> (not res!365165) (not e!332001))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577132 (= res!365165 (validKeyInArray!0 k!1786))))

(declare-fun b!577133 () Bool)

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!577133 (= e!332001 (bvslt mask!3053 #b00000000000000000000000000000000))))

(declare-fun b!577134 () Bool)

(declare-fun res!365166 () Bool)

(assert (=> b!577134 (=> (not res!365166) (not e!332001))))

(declare-datatypes ((array!36012 0))(
  ( (array!36013 (arr!17285 (Array (_ BitVec 32) (_ BitVec 64))) (size!17649 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36012)

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5725 0))(
  ( (MissingZero!5725 (index!25127 (_ BitVec 32))) (Found!5725 (index!25128 (_ BitVec 32))) (Intermediate!5725 (undefined!6537 Bool) (index!25129 (_ BitVec 32)) (x!54042 (_ BitVec 32))) (Undefined!5725) (MissingVacant!5725 (index!25130 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36012 (_ BitVec 32)) SeekEntryResult!5725)

(assert (=> b!577134 (= res!365166 (not (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) (MissingZero!5725 i!1108))))))

(declare-fun b!577135 () Bool)

(declare-fun res!365167 () Bool)

(assert (=> b!577135 (=> (not res!365167) (not e!332001))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!577135 (= res!365167 (validKeyInArray!0 (select (arr!17285 a!2986) j!136)))))

(declare-fun b!577136 () Bool)

(declare-fun res!365163 () Bool)

(assert (=> b!577136 (=> (not res!365163) (not e!332001))))

(assert (=> b!577136 (= res!365163 (and (= (size!17649 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17649 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17649 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!577131 () Bool)

(declare-fun res!365164 () Bool)

(assert (=> b!577131 (=> (not res!365164) (not e!332001))))

(declare-fun arrayContainsKey!0 (array!36012 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577131 (= res!365164 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!365168 () Bool)

(assert (=> start!52994 (=> (not res!365168) (not e!332001))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52994 (= res!365168 (validMask!0 mask!3053))))

(assert (=> start!52994 e!332001))

(assert (=> start!52994 true))

(declare-fun array_inv!13081 (array!36012) Bool)

(assert (=> start!52994 (array_inv!13081 a!2986)))

(assert (= (and start!52994 res!365168) b!577136))

(assert (= (and b!577136 res!365163) b!577135))

(assert (= (and b!577135 res!365167) b!577132))

(assert (= (and b!577132 res!365165) b!577131))

(assert (= (and b!577131 res!365164) b!577134))

(assert (= (and b!577134 res!365166) b!577133))

(declare-fun m!556045 () Bool)

(assert (=> b!577135 m!556045))

(assert (=> b!577135 m!556045))

(declare-fun m!556047 () Bool)

(assert (=> b!577135 m!556047))

(declare-fun m!556049 () Bool)

(assert (=> b!577131 m!556049))

(declare-fun m!556051 () Bool)

(assert (=> start!52994 m!556051))

(declare-fun m!556053 () Bool)

(assert (=> start!52994 m!556053))

(declare-fun m!556055 () Bool)

(assert (=> b!577134 m!556055))

(declare-fun m!556057 () Bool)

(assert (=> b!577132 m!556057))

(push 1)

(assert (not start!52994))

(assert (not b!577132))

(assert (not b!577134))

(assert (not b!577135))

(assert (not b!577131))

(check-sat)

(pop 1)

(push 1)

(check-sat)

