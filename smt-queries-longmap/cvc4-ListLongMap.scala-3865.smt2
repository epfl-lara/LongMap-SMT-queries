; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53204 () Bool)

(assert start!53204)

(declare-fun b!578334 () Bool)

(declare-fun res!366153 () Bool)

(declare-fun e!332608 () Bool)

(assert (=> b!578334 (=> (not res!366153) (not e!332608))))

(declare-datatypes ((array!36105 0))(
  ( (array!36106 (arr!17327 (Array (_ BitVec 32) (_ BitVec 64))) (size!17691 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36105)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36105 (_ BitVec 32)) Bool)

(assert (=> b!578334 (= res!366153 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578335 () Bool)

(declare-fun e!332610 () Bool)

(assert (=> b!578335 (= e!332610 e!332608)))

(declare-fun res!366152 () Bool)

(assert (=> b!578335 (=> (not res!366152) (not e!332608))))

(declare-datatypes ((SeekEntryResult!5767 0))(
  ( (MissingZero!5767 (index!25295 (_ BitVec 32))) (Found!5767 (index!25296 (_ BitVec 32))) (Intermediate!5767 (undefined!6579 Bool) (index!25297 (_ BitVec 32)) (x!54196 (_ BitVec 32))) (Undefined!5767) (MissingVacant!5767 (index!25298 (_ BitVec 32))) )
))
(declare-fun lt!264232 () SeekEntryResult!5767)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578335 (= res!366152 (or (= lt!264232 (MissingZero!5767 i!1108)) (= lt!264232 (MissingVacant!5767 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36105 (_ BitVec 32)) SeekEntryResult!5767)

(assert (=> b!578335 (= lt!264232 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!578336 () Bool)

(assert (=> b!578336 (= e!332608 false)))

(declare-fun lt!264231 () Bool)

(declare-datatypes ((List!11368 0))(
  ( (Nil!11365) (Cons!11364 (h!12409 (_ BitVec 64)) (t!17596 List!11368)) )
))
(declare-fun arrayNoDuplicates!0 (array!36105 (_ BitVec 32) List!11368) Bool)

(assert (=> b!578336 (= lt!264231 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11365))))

(declare-fun b!578337 () Bool)

(declare-fun res!366154 () Bool)

(assert (=> b!578337 (=> (not res!366154) (not e!332610))))

(declare-fun arrayContainsKey!0 (array!36105 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578337 (= res!366154 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578338 () Bool)

(declare-fun res!366155 () Bool)

(assert (=> b!578338 (=> (not res!366155) (not e!332610))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578338 (= res!366155 (validKeyInArray!0 k!1786))))

(declare-fun b!578339 () Bool)

(declare-fun res!366150 () Bool)

(assert (=> b!578339 (=> (not res!366150) (not e!332610))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!578339 (= res!366150 (validKeyInArray!0 (select (arr!17327 a!2986) j!136)))))

(declare-fun res!366149 () Bool)

(assert (=> start!53204 (=> (not res!366149) (not e!332610))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53204 (= res!366149 (validMask!0 mask!3053))))

(assert (=> start!53204 e!332610))

(assert (=> start!53204 true))

(declare-fun array_inv!13123 (array!36105) Bool)

(assert (=> start!53204 (array_inv!13123 a!2986)))

(declare-fun b!578333 () Bool)

(declare-fun res!366151 () Bool)

(assert (=> b!578333 (=> (not res!366151) (not e!332610))))

(assert (=> b!578333 (= res!366151 (and (= (size!17691 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17691 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17691 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53204 res!366149) b!578333))

(assert (= (and b!578333 res!366151) b!578339))

(assert (= (and b!578339 res!366150) b!578338))

(assert (= (and b!578338 res!366155) b!578337))

(assert (= (and b!578337 res!366154) b!578335))

(assert (= (and b!578335 res!366152) b!578334))

(assert (= (and b!578334 res!366153) b!578336))

(declare-fun m!557035 () Bool)

(assert (=> start!53204 m!557035))

(declare-fun m!557037 () Bool)

(assert (=> start!53204 m!557037))

(declare-fun m!557039 () Bool)

(assert (=> b!578334 m!557039))

(declare-fun m!557041 () Bool)

(assert (=> b!578336 m!557041))

(declare-fun m!557043 () Bool)

(assert (=> b!578337 m!557043))

(declare-fun m!557045 () Bool)

(assert (=> b!578339 m!557045))

(assert (=> b!578339 m!557045))

(declare-fun m!557047 () Bool)

(assert (=> b!578339 m!557047))

(declare-fun m!557049 () Bool)

(assert (=> b!578335 m!557049))

(declare-fun m!557051 () Bool)

(assert (=> b!578338 m!557051))

(push 1)

(assert (not start!53204))

(assert (not b!578336))

(assert (not b!578335))

(assert (not b!578337))

(assert (not b!578339))

(assert (not b!578338))

(assert (not b!578334))

(check-sat)

(pop 1)

