; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53250 () Bool)

(assert start!53250)

(declare-fun res!366208 () Bool)

(declare-fun e!332721 () Bool)

(assert (=> start!53250 (=> (not res!366208) (not e!332721))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53250 (= res!366208 (validMask!0 mask!3053))))

(assert (=> start!53250 e!332721))

(assert (=> start!53250 true))

(declare-datatypes ((array!36096 0))(
  ( (array!36097 (arr!17320 (Array (_ BitVec 32) (_ BitVec 64))) (size!17684 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36096)

(declare-fun array_inv!13179 (array!36096) Bool)

(assert (=> start!53250 (array_inv!13179 a!2986)))

(declare-fun b!578491 () Bool)

(declare-fun res!366204 () Bool)

(assert (=> b!578491 (=> (not res!366204) (not e!332721))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578491 (= res!366204 (validKeyInArray!0 k0!1786))))

(declare-fun b!578492 () Bool)

(declare-fun res!366202 () Bool)

(assert (=> b!578492 (=> (not res!366202) (not e!332721))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578492 (= res!366202 (and (= (size!17684 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17684 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17684 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578493 () Bool)

(declare-fun res!366203 () Bool)

(assert (=> b!578493 (=> (not res!366203) (not e!332721))))

(assert (=> b!578493 (= res!366203 (validKeyInArray!0 (select (arr!17320 a!2986) j!136)))))

(declare-fun b!578494 () Bool)

(declare-fun res!366206 () Bool)

(assert (=> b!578494 (=> (not res!366206) (not e!332721))))

(declare-fun arrayContainsKey!0 (array!36096 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578494 (= res!366206 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578495 () Bool)

(declare-fun res!366207 () Bool)

(declare-fun e!332719 () Bool)

(assert (=> b!578495 (=> (not res!366207) (not e!332719))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36096 (_ BitVec 32)) Bool)

(assert (=> b!578495 (= res!366207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578496 () Bool)

(assert (=> b!578496 (= e!332721 e!332719)))

(declare-fun res!366205 () Bool)

(assert (=> b!578496 (=> (not res!366205) (not e!332719))))

(declare-datatypes ((SeekEntryResult!5716 0))(
  ( (MissingZero!5716 (index!25091 (_ BitVec 32))) (Found!5716 (index!25092 (_ BitVec 32))) (Intermediate!5716 (undefined!6528 Bool) (index!25093 (_ BitVec 32)) (x!54148 (_ BitVec 32))) (Undefined!5716) (MissingVacant!5716 (index!25094 (_ BitVec 32))) )
))
(declare-fun lt!264330 () SeekEntryResult!5716)

(assert (=> b!578496 (= res!366205 (or (= lt!264330 (MissingZero!5716 i!1108)) (= lt!264330 (MissingVacant!5716 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36096 (_ BitVec 32)) SeekEntryResult!5716)

(assert (=> b!578496 (= lt!264330 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!578497 () Bool)

(assert (=> b!578497 (= e!332719 false)))

(declare-fun lt!264331 () Bool)

(declare-datatypes ((List!11268 0))(
  ( (Nil!11265) (Cons!11264 (h!12312 (_ BitVec 64)) (t!17488 List!11268)) )
))
(declare-fun arrayNoDuplicates!0 (array!36096 (_ BitVec 32) List!11268) Bool)

(assert (=> b!578497 (= lt!264331 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11265))))

(assert (= (and start!53250 res!366208) b!578492))

(assert (= (and b!578492 res!366202) b!578493))

(assert (= (and b!578493 res!366203) b!578491))

(assert (= (and b!578491 res!366204) b!578494))

(assert (= (and b!578494 res!366206) b!578496))

(assert (= (and b!578496 res!366205) b!578495))

(assert (= (and b!578495 res!366207) b!578497))

(declare-fun m!557351 () Bool)

(assert (=> start!53250 m!557351))

(declare-fun m!557353 () Bool)

(assert (=> start!53250 m!557353))

(declare-fun m!557355 () Bool)

(assert (=> b!578491 m!557355))

(declare-fun m!557357 () Bool)

(assert (=> b!578495 m!557357))

(declare-fun m!557359 () Bool)

(assert (=> b!578493 m!557359))

(assert (=> b!578493 m!557359))

(declare-fun m!557361 () Bool)

(assert (=> b!578493 m!557361))

(declare-fun m!557363 () Bool)

(assert (=> b!578494 m!557363))

(declare-fun m!557365 () Bool)

(assert (=> b!578497 m!557365))

(declare-fun m!557367 () Bool)

(assert (=> b!578496 m!557367))

(check-sat (not b!578491) (not b!578494) (not b!578493) (not start!53250) (not b!578496) (not b!578497) (not b!578495))
(check-sat)
