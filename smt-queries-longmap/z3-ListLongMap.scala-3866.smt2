; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53190 () Bool)

(assert start!53190)

(declare-fun b!578083 () Bool)

(declare-fun res!366043 () Bool)

(declare-fun e!332445 () Bool)

(assert (=> b!578083 (=> (not res!366043) (not e!332445))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578083 (= res!366043 (validKeyInArray!0 k0!1786))))

(declare-fun b!578084 () Bool)

(declare-fun res!366047 () Bool)

(assert (=> b!578084 (=> (not res!366047) (not e!332445))))

(declare-datatypes ((array!36105 0))(
  ( (array!36106 (arr!17327 (Array (_ BitVec 32) (_ BitVec 64))) (size!17692 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36105)

(declare-fun arrayContainsKey!0 (array!36105 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578084 (= res!366047 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578085 () Bool)

(declare-fun res!366046 () Bool)

(assert (=> b!578085 (=> (not res!366046) (not e!332445))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!578085 (= res!366046 (validKeyInArray!0 (select (arr!17327 a!2986) j!136)))))

(declare-fun b!578086 () Bool)

(declare-fun e!332443 () Bool)

(assert (=> b!578086 (= e!332443 false)))

(declare-fun lt!264004 () Bool)

(declare-datatypes ((List!11407 0))(
  ( (Nil!11404) (Cons!11403 (h!12448 (_ BitVec 64)) (t!17626 List!11407)) )
))
(declare-fun arrayNoDuplicates!0 (array!36105 (_ BitVec 32) List!11407) Bool)

(assert (=> b!578086 (= lt!264004 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11404))))

(declare-fun b!578087 () Bool)

(declare-fun res!366045 () Bool)

(assert (=> b!578087 (=> (not res!366045) (not e!332445))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578087 (= res!366045 (and (= (size!17692 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17692 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17692 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!366041 () Bool)

(assert (=> start!53190 (=> (not res!366041) (not e!332445))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53190 (= res!366041 (validMask!0 mask!3053))))

(assert (=> start!53190 e!332445))

(assert (=> start!53190 true))

(declare-fun array_inv!13210 (array!36105) Bool)

(assert (=> start!53190 (array_inv!13210 a!2986)))

(declare-fun b!578088 () Bool)

(assert (=> b!578088 (= e!332445 e!332443)))

(declare-fun res!366044 () Bool)

(assert (=> b!578088 (=> (not res!366044) (not e!332443))))

(declare-datatypes ((SeekEntryResult!5764 0))(
  ( (MissingZero!5764 (index!25283 (_ BitVec 32))) (Found!5764 (index!25284 (_ BitVec 32))) (Intermediate!5764 (undefined!6576 Bool) (index!25285 (_ BitVec 32)) (x!54196 (_ BitVec 32))) (Undefined!5764) (MissingVacant!5764 (index!25286 (_ BitVec 32))) )
))
(declare-fun lt!264003 () SeekEntryResult!5764)

(assert (=> b!578088 (= res!366044 (or (= lt!264003 (MissingZero!5764 i!1108)) (= lt!264003 (MissingVacant!5764 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36105 (_ BitVec 32)) SeekEntryResult!5764)

(assert (=> b!578088 (= lt!264003 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!578089 () Bool)

(declare-fun res!366042 () Bool)

(assert (=> b!578089 (=> (not res!366042) (not e!332443))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36105 (_ BitVec 32)) Bool)

(assert (=> b!578089 (= res!366042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53190 res!366041) b!578087))

(assert (= (and b!578087 res!366045) b!578085))

(assert (= (and b!578085 res!366046) b!578083))

(assert (= (and b!578083 res!366043) b!578084))

(assert (= (and b!578084 res!366047) b!578088))

(assert (= (and b!578088 res!366044) b!578089))

(assert (= (and b!578089 res!366042) b!578086))

(declare-fun m!556267 () Bool)

(assert (=> b!578088 m!556267))

(declare-fun m!556269 () Bool)

(assert (=> b!578085 m!556269))

(assert (=> b!578085 m!556269))

(declare-fun m!556271 () Bool)

(assert (=> b!578085 m!556271))

(declare-fun m!556273 () Bool)

(assert (=> b!578083 m!556273))

(declare-fun m!556275 () Bool)

(assert (=> b!578089 m!556275))

(declare-fun m!556277 () Bool)

(assert (=> b!578084 m!556277))

(declare-fun m!556279 () Bool)

(assert (=> start!53190 m!556279))

(declare-fun m!556281 () Bool)

(assert (=> start!53190 m!556281))

(declare-fun m!556283 () Bool)

(assert (=> b!578086 m!556283))

(check-sat (not b!578089) (not start!53190) (not b!578088) (not b!578084) (not b!578083) (not b!578086) (not b!578085))
(check-sat)
