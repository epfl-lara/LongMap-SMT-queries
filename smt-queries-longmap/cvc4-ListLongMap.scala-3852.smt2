; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53000 () Bool)

(assert start!53000)

(declare-fun b!577177 () Bool)

(declare-fun res!365211 () Bool)

(declare-fun e!332019 () Bool)

(assert (=> b!577177 (=> (not res!365211) (not e!332019))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577177 (= res!365211 (validKeyInArray!0 k!1786))))

(declare-fun b!577178 () Bool)

(declare-fun res!365213 () Bool)

(assert (=> b!577178 (=> (not res!365213) (not e!332019))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36018 0))(
  ( (array!36019 (arr!17288 (Array (_ BitVec 32) (_ BitVec 64))) (size!17652 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36018)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!577178 (= res!365213 (and (= (size!17652 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17652 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17652 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!577179 () Bool)

(declare-fun res!365209 () Bool)

(assert (=> b!577179 (=> (not res!365209) (not e!332019))))

(declare-fun arrayContainsKey!0 (array!36018 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577179 (= res!365209 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!365210 () Bool)

(assert (=> start!53000 (=> (not res!365210) (not e!332019))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53000 (= res!365210 (validMask!0 mask!3053))))

(assert (=> start!53000 e!332019))

(assert (=> start!53000 true))

(declare-fun array_inv!13084 (array!36018) Bool)

(assert (=> start!53000 (array_inv!13084 a!2986)))

(declare-fun b!577180 () Bool)

(declare-fun res!365212 () Bool)

(assert (=> b!577180 (=> (not res!365212) (not e!332019))))

(assert (=> b!577180 (= res!365212 (validKeyInArray!0 (select (arr!17288 a!2986) j!136)))))

(declare-fun b!577181 () Bool)

(assert (=> b!577181 (= e!332019 false)))

(declare-datatypes ((SeekEntryResult!5728 0))(
  ( (MissingZero!5728 (index!25139 (_ BitVec 32))) (Found!5728 (index!25140 (_ BitVec 32))) (Intermediate!5728 (undefined!6540 Bool) (index!25141 (_ BitVec 32)) (x!54053 (_ BitVec 32))) (Undefined!5728) (MissingVacant!5728 (index!25142 (_ BitVec 32))) )
))
(declare-fun lt!263914 () SeekEntryResult!5728)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36018 (_ BitVec 32)) SeekEntryResult!5728)

(assert (=> b!577181 (= lt!263914 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!53000 res!365210) b!577178))

(assert (= (and b!577178 res!365213) b!577180))

(assert (= (and b!577180 res!365212) b!577177))

(assert (= (and b!577177 res!365211) b!577179))

(assert (= (and b!577179 res!365209) b!577181))

(declare-fun m!556087 () Bool)

(assert (=> b!577180 m!556087))

(assert (=> b!577180 m!556087))

(declare-fun m!556089 () Bool)

(assert (=> b!577180 m!556089))

(declare-fun m!556091 () Bool)

(assert (=> b!577179 m!556091))

(declare-fun m!556093 () Bool)

(assert (=> b!577181 m!556093))

(declare-fun m!556095 () Bool)

(assert (=> start!53000 m!556095))

(declare-fun m!556097 () Bool)

(assert (=> start!53000 m!556097))

(declare-fun m!556099 () Bool)

(assert (=> b!577177 m!556099))

(push 1)

(assert (not b!577177))

(assert (not b!577180))

(assert (not b!577181))

(assert (not b!577179))

(assert (not start!53000))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

