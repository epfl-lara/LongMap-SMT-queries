; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53006 () Bool)

(assert start!53006)

(declare-fun b!577222 () Bool)

(declare-fun res!365258 () Bool)

(declare-fun e!332037 () Bool)

(assert (=> b!577222 (=> (not res!365258) (not e!332037))))

(declare-datatypes ((array!36024 0))(
  ( (array!36025 (arr!17291 (Array (_ BitVec 32) (_ BitVec 64))) (size!17655 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36024)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577222 (= res!365258 (validKeyInArray!0 (select (arr!17291 a!2986) j!136)))))

(declare-fun res!365257 () Bool)

(assert (=> start!53006 (=> (not res!365257) (not e!332037))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53006 (= res!365257 (validMask!0 mask!3053))))

(assert (=> start!53006 e!332037))

(assert (=> start!53006 true))

(declare-fun array_inv!13087 (array!36024) Bool)

(assert (=> start!53006 (array_inv!13087 a!2986)))

(declare-fun b!577223 () Bool)

(declare-fun res!365256 () Bool)

(assert (=> b!577223 (=> (not res!365256) (not e!332037))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36024 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577223 (= res!365256 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577224 () Bool)

(declare-fun res!365255 () Bool)

(assert (=> b!577224 (=> (not res!365255) (not e!332037))))

(assert (=> b!577224 (= res!365255 (validKeyInArray!0 k!1786))))

(declare-fun b!577225 () Bool)

(declare-fun res!365254 () Bool)

(assert (=> b!577225 (=> (not res!365254) (not e!332037))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!577225 (= res!365254 (and (= (size!17655 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17655 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17655 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!577226 () Bool)

(assert (=> b!577226 (= e!332037 false)))

(declare-datatypes ((SeekEntryResult!5731 0))(
  ( (MissingZero!5731 (index!25151 (_ BitVec 32))) (Found!5731 (index!25152 (_ BitVec 32))) (Intermediate!5731 (undefined!6543 Bool) (index!25153 (_ BitVec 32)) (x!54064 (_ BitVec 32))) (Undefined!5731) (MissingVacant!5731 (index!25154 (_ BitVec 32))) )
))
(declare-fun lt!263923 () SeekEntryResult!5731)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36024 (_ BitVec 32)) SeekEntryResult!5731)

(assert (=> b!577226 (= lt!263923 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!53006 res!365257) b!577225))

(assert (= (and b!577225 res!365254) b!577222))

(assert (= (and b!577222 res!365258) b!577224))

(assert (= (and b!577224 res!365255) b!577223))

(assert (= (and b!577223 res!365256) b!577226))

(declare-fun m!556129 () Bool)

(assert (=> b!577224 m!556129))

(declare-fun m!556131 () Bool)

(assert (=> b!577222 m!556131))

(assert (=> b!577222 m!556131))

(declare-fun m!556133 () Bool)

(assert (=> b!577222 m!556133))

(declare-fun m!556135 () Bool)

(assert (=> start!53006 m!556135))

(declare-fun m!556137 () Bool)

(assert (=> start!53006 m!556137))

(declare-fun m!556139 () Bool)

(assert (=> b!577223 m!556139))

(declare-fun m!556141 () Bool)

(assert (=> b!577226 m!556141))

(push 1)

(assert (not b!577222))

(assert (not b!577226))

(assert (not b!577223))

(assert (not start!53006))

(assert (not b!577224))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

