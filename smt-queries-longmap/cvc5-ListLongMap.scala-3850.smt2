; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53038 () Bool)

(assert start!53038)

(declare-fun b!577278 () Bool)

(declare-fun res!365209 () Bool)

(declare-fun e!332112 () Bool)

(assert (=> b!577278 (=> (not res!365209) (not e!332112))))

(declare-datatypes ((array!36001 0))(
  ( (array!36002 (arr!17277 (Array (_ BitVec 32) (_ BitVec 64))) (size!17641 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36001)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577278 (= res!365209 (validKeyInArray!0 (select (arr!17277 a!2986) j!136)))))

(declare-fun b!577279 () Bool)

(declare-fun res!365206 () Bool)

(assert (=> b!577279 (=> (not res!365206) (not e!332112))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36001 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577279 (= res!365206 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577280 () Bool)

(declare-fun res!365207 () Bool)

(assert (=> b!577280 (=> (not res!365207) (not e!332112))))

(assert (=> b!577280 (= res!365207 (validKeyInArray!0 k!1786))))

(declare-fun b!577281 () Bool)

(declare-fun res!365205 () Bool)

(assert (=> b!577281 (=> (not res!365205) (not e!332112))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!577281 (= res!365205 (and (= (size!17641 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17641 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17641 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!577282 () Bool)

(assert (=> b!577282 (= e!332112 false)))

(declare-datatypes ((SeekEntryResult!5673 0))(
  ( (MissingZero!5673 (index!24919 (_ BitVec 32))) (Found!5673 (index!24920 (_ BitVec 32))) (Intermediate!5673 (undefined!6485 Bool) (index!24921 (_ BitVec 32)) (x!53985 (_ BitVec 32))) (Undefined!5673) (MissingVacant!5673 (index!24922 (_ BitVec 32))) )
))
(declare-fun lt!264016 () SeekEntryResult!5673)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36001 (_ BitVec 32)) SeekEntryResult!5673)

(assert (=> b!577282 (= lt!264016 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!365208 () Bool)

(assert (=> start!53038 (=> (not res!365208) (not e!332112))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53038 (= res!365208 (validMask!0 mask!3053))))

(assert (=> start!53038 e!332112))

(assert (=> start!53038 true))

(declare-fun array_inv!13136 (array!36001) Bool)

(assert (=> start!53038 (array_inv!13136 a!2986)))

(assert (= (and start!53038 res!365208) b!577281))

(assert (= (and b!577281 res!365205) b!577278))

(assert (= (and b!577278 res!365209) b!577280))

(assert (= (and b!577280 res!365207) b!577279))

(assert (= (and b!577279 res!365206) b!577282))

(declare-fun m!556341 () Bool)

(assert (=> b!577278 m!556341))

(assert (=> b!577278 m!556341))

(declare-fun m!556343 () Bool)

(assert (=> b!577278 m!556343))

(declare-fun m!556345 () Bool)

(assert (=> start!53038 m!556345))

(declare-fun m!556347 () Bool)

(assert (=> start!53038 m!556347))

(declare-fun m!556349 () Bool)

(assert (=> b!577280 m!556349))

(declare-fun m!556351 () Bool)

(assert (=> b!577279 m!556351))

(declare-fun m!556353 () Bool)

(assert (=> b!577282 m!556353))

(push 1)

(assert (not start!53038))

(assert (not b!577280))

(assert (not b!577279))

(assert (not b!577278))

(assert (not b!577282))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

