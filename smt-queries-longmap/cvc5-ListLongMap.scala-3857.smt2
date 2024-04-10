; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53026 () Bool)

(assert start!53026)

(declare-fun b!577372 () Bool)

(declare-fun res!365408 () Bool)

(declare-fun e!332097 () Bool)

(assert (=> b!577372 (=> (not res!365408) (not e!332097))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577372 (= res!365408 (validKeyInArray!0 k!1786))))

(declare-fun b!577373 () Bool)

(declare-fun res!365404 () Bool)

(assert (=> b!577373 (=> (not res!365404) (not e!332097))))

(declare-datatypes ((array!36044 0))(
  ( (array!36045 (arr!17301 (Array (_ BitVec 32) (_ BitVec 64))) (size!17665 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36044)

(declare-fun arrayContainsKey!0 (array!36044 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577373 (= res!365404 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577374 () Bool)

(declare-fun res!365406 () Bool)

(assert (=> b!577374 (=> (not res!365406) (not e!332097))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!577374 (= res!365406 (and (= (size!17665 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17665 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17665 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!577375 () Bool)

(declare-datatypes ((SeekEntryResult!5741 0))(
  ( (MissingZero!5741 (index!25191 (_ BitVec 32))) (Found!5741 (index!25192 (_ BitVec 32))) (Intermediate!5741 (undefined!6553 Bool) (index!25193 (_ BitVec 32)) (x!54106 (_ BitVec 32))) (Undefined!5741) (MissingVacant!5741 (index!25194 (_ BitVec 32))) )
))
(declare-fun lt!263953 () SeekEntryResult!5741)

(assert (=> b!577375 (= e!332097 (and (or (= lt!263953 (MissingZero!5741 i!1108)) (= lt!263953 (MissingVacant!5741 i!1108))) (bvsgt #b00000000000000000000000000000000 (size!17665 a!2986))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36044 (_ BitVec 32)) SeekEntryResult!5741)

(assert (=> b!577375 (= lt!263953 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!577376 () Bool)

(declare-fun res!365407 () Bool)

(assert (=> b!577376 (=> (not res!365407) (not e!332097))))

(assert (=> b!577376 (= res!365407 (validKeyInArray!0 (select (arr!17301 a!2986) j!136)))))

(declare-fun res!365405 () Bool)

(assert (=> start!53026 (=> (not res!365405) (not e!332097))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53026 (= res!365405 (validMask!0 mask!3053))))

(assert (=> start!53026 e!332097))

(assert (=> start!53026 true))

(declare-fun array_inv!13097 (array!36044) Bool)

(assert (=> start!53026 (array_inv!13097 a!2986)))

(assert (= (and start!53026 res!365405) b!577374))

(assert (= (and b!577374 res!365406) b!577376))

(assert (= (and b!577376 res!365407) b!577372))

(assert (= (and b!577372 res!365408) b!577373))

(assert (= (and b!577373 res!365404) b!577375))

(declare-fun m!556269 () Bool)

(assert (=> b!577375 m!556269))

(declare-fun m!556271 () Bool)

(assert (=> start!53026 m!556271))

(declare-fun m!556273 () Bool)

(assert (=> start!53026 m!556273))

(declare-fun m!556275 () Bool)

(assert (=> b!577372 m!556275))

(declare-fun m!556277 () Bool)

(assert (=> b!577373 m!556277))

(declare-fun m!556279 () Bool)

(assert (=> b!577376 m!556279))

(assert (=> b!577376 m!556279))

(declare-fun m!556281 () Bool)

(assert (=> b!577376 m!556281))

(push 1)

(assert (not b!577372))

(assert (not b!577375))

