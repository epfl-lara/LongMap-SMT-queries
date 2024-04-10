; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53024 () Bool)

(assert start!53024)

(declare-fun b!577357 () Bool)

(declare-fun e!332091 () Bool)

(assert (=> b!577357 (= e!332091 false)))

(declare-datatypes ((SeekEntryResult!5740 0))(
  ( (MissingZero!5740 (index!25187 (_ BitVec 32))) (Found!5740 (index!25188 (_ BitVec 32))) (Intermediate!5740 (undefined!6552 Bool) (index!25189 (_ BitVec 32)) (x!54097 (_ BitVec 32))) (Undefined!5740) (MissingVacant!5740 (index!25190 (_ BitVec 32))) )
))
(declare-fun lt!263950 () SeekEntryResult!5740)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36042 0))(
  ( (array!36043 (arr!17300 (Array (_ BitVec 32) (_ BitVec 64))) (size!17664 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36042)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36042 (_ BitVec 32)) SeekEntryResult!5740)

(assert (=> b!577357 (= lt!263950 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!577359 () Bool)

(declare-fun res!365391 () Bool)

(assert (=> b!577359 (=> (not res!365391) (not e!332091))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577359 (= res!365391 (validKeyInArray!0 (select (arr!17300 a!2986) j!136)))))

(declare-fun b!577360 () Bool)

(declare-fun res!365389 () Bool)

(assert (=> b!577360 (=> (not res!365389) (not e!332091))))

(assert (=> b!577360 (= res!365389 (validKeyInArray!0 k!1786))))

(declare-fun b!577361 () Bool)

(declare-fun res!365392 () Bool)

(assert (=> b!577361 (=> (not res!365392) (not e!332091))))

(declare-fun arrayContainsKey!0 (array!36042 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577361 (= res!365392 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577358 () Bool)

(declare-fun res!365393 () Bool)

(assert (=> b!577358 (=> (not res!365393) (not e!332091))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!577358 (= res!365393 (and (= (size!17664 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17664 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17664 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!365390 () Bool)

(assert (=> start!53024 (=> (not res!365390) (not e!332091))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53024 (= res!365390 (validMask!0 mask!3053))))

(assert (=> start!53024 e!332091))

(assert (=> start!53024 true))

(declare-fun array_inv!13096 (array!36042) Bool)

(assert (=> start!53024 (array_inv!13096 a!2986)))

(assert (= (and start!53024 res!365390) b!577358))

(assert (= (and b!577358 res!365393) b!577359))

(assert (= (and b!577359 res!365391) b!577360))

(assert (= (and b!577360 res!365389) b!577361))

(assert (= (and b!577361 res!365392) b!577357))

(declare-fun m!556255 () Bool)

(assert (=> start!53024 m!556255))

(declare-fun m!556257 () Bool)

(assert (=> start!53024 m!556257))

(declare-fun m!556259 () Bool)

(assert (=> b!577361 m!556259))

(declare-fun m!556261 () Bool)

(assert (=> b!577359 m!556261))

(assert (=> b!577359 m!556261))

(declare-fun m!556263 () Bool)

(assert (=> b!577359 m!556263))

(declare-fun m!556265 () Bool)

(assert (=> b!577360 m!556265))

(declare-fun m!556267 () Bool)

(assert (=> b!577357 m!556267))

(push 1)

(assert (not start!53024))

(assert (not b!577361))

(assert (not b!577360))

(assert (not b!577357))

(assert (not b!577359))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

