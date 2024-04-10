; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53226 () Bool)

(assert start!53226)

(declare-fun b!578564 () Bool)

(declare-fun e!332707 () Bool)

(assert (=> b!578564 (= e!332707 false)))

(declare-fun lt!264298 () Bool)

(declare-datatypes ((array!36127 0))(
  ( (array!36128 (arr!17338 (Array (_ BitVec 32) (_ BitVec 64))) (size!17702 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36127)

(declare-datatypes ((List!11379 0))(
  ( (Nil!11376) (Cons!11375 (h!12420 (_ BitVec 64)) (t!17607 List!11379)) )
))
(declare-fun arrayNoDuplicates!0 (array!36127 (_ BitVec 32) List!11379) Bool)

(assert (=> b!578564 (= lt!264298 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11376))))

(declare-fun b!578565 () Bool)

(declare-fun res!366381 () Bool)

(declare-fun e!332709 () Bool)

(assert (=> b!578565 (=> (not res!366381) (not e!332709))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36127 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578565 (= res!366381 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578566 () Bool)

(declare-fun res!366380 () Bool)

(assert (=> b!578566 (=> (not res!366380) (not e!332709))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578566 (= res!366380 (validKeyInArray!0 (select (arr!17338 a!2986) j!136)))))

(declare-fun b!578567 () Bool)

(declare-fun res!366383 () Bool)

(assert (=> b!578567 (=> (not res!366383) (not e!332707))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36127 (_ BitVec 32)) Bool)

(assert (=> b!578567 (= res!366383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578569 () Bool)

(declare-fun res!366384 () Bool)

(assert (=> b!578569 (=> (not res!366384) (not e!332709))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578569 (= res!366384 (and (= (size!17702 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17702 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17702 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578570 () Bool)

(declare-fun res!366386 () Bool)

(assert (=> b!578570 (=> (not res!366386) (not e!332709))))

(assert (=> b!578570 (= res!366386 (validKeyInArray!0 k0!1786))))

(declare-fun b!578568 () Bool)

(assert (=> b!578568 (= e!332709 e!332707)))

(declare-fun res!366382 () Bool)

(assert (=> b!578568 (=> (not res!366382) (not e!332707))))

(declare-datatypes ((SeekEntryResult!5778 0))(
  ( (MissingZero!5778 (index!25339 (_ BitVec 32))) (Found!5778 (index!25340 (_ BitVec 32))) (Intermediate!5778 (undefined!6590 Bool) (index!25341 (_ BitVec 32)) (x!54239 (_ BitVec 32))) (Undefined!5778) (MissingVacant!5778 (index!25342 (_ BitVec 32))) )
))
(declare-fun lt!264297 () SeekEntryResult!5778)

(assert (=> b!578568 (= res!366382 (or (= lt!264297 (MissingZero!5778 i!1108)) (= lt!264297 (MissingVacant!5778 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36127 (_ BitVec 32)) SeekEntryResult!5778)

(assert (=> b!578568 (= lt!264297 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!366385 () Bool)

(assert (=> start!53226 (=> (not res!366385) (not e!332709))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53226 (= res!366385 (validMask!0 mask!3053))))

(assert (=> start!53226 e!332709))

(assert (=> start!53226 true))

(declare-fun array_inv!13134 (array!36127) Bool)

(assert (=> start!53226 (array_inv!13134 a!2986)))

(assert (= (and start!53226 res!366385) b!578569))

(assert (= (and b!578569 res!366384) b!578566))

(assert (= (and b!578566 res!366380) b!578570))

(assert (= (and b!578570 res!366386) b!578565))

(assert (= (and b!578565 res!366381) b!578568))

(assert (= (and b!578568 res!366382) b!578567))

(assert (= (and b!578567 res!366383) b!578564))

(declare-fun m!557233 () Bool)

(assert (=> start!53226 m!557233))

(declare-fun m!557235 () Bool)

(assert (=> start!53226 m!557235))

(declare-fun m!557237 () Bool)

(assert (=> b!578567 m!557237))

(declare-fun m!557239 () Bool)

(assert (=> b!578564 m!557239))

(declare-fun m!557241 () Bool)

(assert (=> b!578565 m!557241))

(declare-fun m!557243 () Bool)

(assert (=> b!578566 m!557243))

(assert (=> b!578566 m!557243))

(declare-fun m!557245 () Bool)

(assert (=> b!578566 m!557245))

(declare-fun m!557247 () Bool)

(assert (=> b!578568 m!557247))

(declare-fun m!557249 () Bool)

(assert (=> b!578570 m!557249))

(check-sat (not start!53226) (not b!578564) (not b!578570) (not b!578565) (not b!578567) (not b!578566) (not b!578568))
(check-sat)
